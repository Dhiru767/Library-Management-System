<?php
include 'config/db.php';

$error = "";
$success = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $confirm = $_POST['confirm_password'];
    $role = $_POST['role'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];

    $photo = isset($_FILES['photo']['name']) ? $_FILES['photo']['name'] : '';
    $photo_tmp = isset($_FILES['photo']['tmp_name']) ? $_FILES['photo']['tmp_name'] : '';

    if ($password !== $confirm) {
        $error = "Passwords do not match.";
    } else {
        $check_user = mysqli_query($conn, "SELECT * FROM users WHERE username = '$username'");
        $check_email = mysqli_query($conn, "SELECT * FROM members WHERE email = '$email'");

        if (mysqli_num_rows($check_user) > 0) {
            $error = "Username already exists.";
        } elseif (mysqli_num_rows($check_email) > 0) {
            $error = "Email already registered.";
        } else {
            $photo_name = "";
            if (!empty($photo)) {
                $folder = "uploads/";
                if (!is_dir($folder)) mkdir($folder, 0755, true);
                $check = getimagesize($photo_tmp);
                if ($check !== false) {
                    $extension = pathinfo($photo, PATHINFO_EXTENSION);
                    $photo_name = time() . "_" . uniqid() . "." . $extension;
                    $photo_path = $folder . $photo_name;
                    if (!move_uploaded_file($photo_tmp, $photo_path)) {
                        $error = "Error uploading photo.";
                        exit();
                    }
                } else {
                    $error = "File is not an image.";
                    exit();
                }
            }

            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            $sql_user = "INSERT INTO users (username, password, role) VALUES ('$username', '$hashed_password', '$role')";

            if (mysqli_query($conn, $sql_user)) {
                $user_id = mysqli_insert_id($conn);

                // Insert into members table for all roles
                $sql_member = "INSERT INTO members (user_id, name, email, phone, photo) 
                               VALUES ('$user_id', '$name', '$email', '$phone', '$photo_name')";
                mysqli_query($conn, $sql_member);

                // Insert into admin table only if role is admin
                if ($role === 'admin') {
                    $sql_admin = "INSERT INTO admin (user_id, name, email, phone, created_at, photo) 
                                  VALUES ('$user_id', '$name', '$email', '$phone', NOW(), '$photo_name')";
                    mysqli_query($conn, $sql_admin);
                }

                // Redirect to login
                header("Location: login.php?success=Registration successful, please login.");
                exit();
            } else {
                $error = "Failed to insert user: " . mysqli_error($conn);
            }
        }
    }
}
?>

<!-- Show messages -->
<?php if ($error) echo "<p style='color:red;'>$error</p>"; ?>
<?php if (isset($_GET['success'])) echo "<p style='color:green;'>" . $_GET['success'] . "</p>"; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration - Library Management System</title>
    <link rel="icon" type="image/png" href="img/favicon.png" sizes="96x96" />
    <link rel="icon" type="image/svg+xml" href="img/favicon.svg" />
    <link rel="stylesheet" href="../css/main.css">
</head>
<body>
    <div id="wrapper">
        <div class="login-form-container">
            <h2>User Registration</h2>
            <form name="signup" method="post" action="" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" name="username" id="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" name="password" id="password" required>
                </div>
                <div class="form-group">
                    <label for="confirm_password">Confirm Password:</label>
                    <input type="password" name="confirm_password" id="confirm_password" required>
                </div>
                <div class="form-group">
                    <label for="role">Role:</label>
                    <select name="role" id="role" required>
                        <option value="member">Member</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="name">Full Name:</label>
                    <input type="text" name="name" id="name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email Address:</label>
                    <input type="email" name="email" id="email" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="tel" name="phone" id="phone">
                </div>
                <div class="form-group">
                    <label for="photo">Profile Picture:</label>
                    <label for="photo" class="custom-file-upload">Choose File</label>
                    <input type="file" name="photo" id="photo" accept="image/*" />
                </div>
                <button type="submit" class="submit-btn" style="width:100%">Register</button>
            </form>
            <div class="login-back" style="text-align:center; margin-top:20px;">
                <a href="login.php" class="back-link">← Back to Login</a>
            </div>
        </div>
    </div>
</body>
</html>
