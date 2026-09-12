<?php
session_start();
include 'config/db.php';

$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Prepare statement to safely fetch user
    $stmt = $conn->prepare("SELECT * FROM users WHERE username = ? LIMIT 1");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();
    $stmt->close();

    if ($row) {
        if (password_verify($password, $row['password'])) {
            // Set session variables
            $_SESSION['user_id'] = $row['id'];
            $_SESSION['role'] = $row['role'];
            $_SESSION['username'] = $row['username'];

            // Redirect based on role
            if ($row['role'] == 'admin') {
                header("Location: dashboard/admin_dashboard.php");
                exit();
            } elseif ($row['role'] == 'staff') {
                header("Location: dashboard/staff_dashboard.php");
                exit();
            } else {
                header("Location: dashboard/member_dashboard.php");
                exit();
            }
        } else {
            $error = "Invalid password.";
        }
    } else {
        $error = "User not found.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Library Management System</title>
    <link rel="icon" type="image/png" href="img/favicon.png" sizes="96x96" />
    <link rel="icon" type="image/svg+xml" href="img/favicon.svg" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/main.css">
</head>
<body>
    <div id="wrapper">
        <main class="login-form-container">
            <header class="login-header">
                <img src="../img/logo1.svg" alt="Library Logo" class="login-logo">
                <h1>Welcome Back</h1>

                <?php if ($error) echo "<p style='color:red;'>$error</p>"; ?>
                <?php if (isset($_GET['success'])) echo "<p style='color:green;'>" . $_GET['success'] . "</p>"; ?>

                <form method="post" action="" class="login-form">
                    <div class="form-group">
                        <label for="username" style="text-align:left;">Username</label>
                        <div class="input-with-icon">
                            <i class="fas fa-user" aria-hidden="true"></i>
                            <input type="text" id="username" name="username" required autocomplete="username">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" style="text-align:left;">Password</label>
                        <div class="input-with-icon">
                            <i class="fas fa-lock" aria-hidden="true"></i>
                            <input type="password" id="password" name="password" required autocomplete="current-password">
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="submit-btn" style="width:100%;">Login</button>
                    </div>
                </form>

                <nav class="auth-links" aria-label="Additional authentication options">
                    <a href="../forget/forget_password.php" class="auth-link">Forgot Password?</a>
                    <span class="auth-separator" aria-hidden="true">|</span>
                    <a href="register.php" class="auth-link">Sign Up</a>
                </nav>

                <div class="login-back" style="margin-top:20px">
                    <a href="index.php" class="back-link">← Back</a>
                </div>
            </header>
        </main>
    </div>
</body>
</html>
