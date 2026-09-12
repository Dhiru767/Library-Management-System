<?php
session_start();
include 'config/db.php';
include 'config/auth.php';

// Allow all roles
checkRole(['admin', 'member']); 

$error = "";
$success = "";

// Determine dashboard link based on role
$role = $_SESSION['role'] ?? '';
$dashboard_link = ($role === 'admin') ? 'dashboard/admin_dashboard.php' : 'dashboard/member_dashboard.php';

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $current = $_POST['current_password'] ?? '';
    $new = $_POST['new_password'] ?? '';
    $confirm = $_POST['confirm_password'] ?? '';
    $user_id = $_SESSION['user_id'];

    if ($new !== $confirm) {
        $error = "New password and confirm password do not match.";
    } else {
        // Fetch current password hash
        $stmt = $conn->prepare("SELECT password FROM users WHERE id = ? LIMIT 1");
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
        $result = $stmt->get_result()->fetch_assoc();
        $stmt->close();

        if (!$result || !password_verify($current, $result['password'])) {
            $error = "Current password is incorrect.";
        } else {
            // Update password securely
            $newHash = password_hash($new, PASSWORD_DEFAULT);
            $stmt = $conn->prepare("UPDATE users SET password = ? WHERE id = ?");
            $stmt->bind_param("si", $newHash, $user_id);
            if ($stmt->execute()) {
                $success = "Password successfully changed!";
            } else {
                $error = "Failed to update password.";
            }
            $stmt->close();
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Password</title>
<link rel="stylesheet" href="css/main.css">
<style>
    body { background:#f5f7fb; font-family: Arial, sans-serif; }
    .container {
        max-width:400px;
        margin:50px auto;
        padding:25px;
        background:#fff;
        border-radius:10px;
        box-shadow:0 4px 15px rgba(0,0,0,0.1);
    }
    h2 { text-align:center; margin-bottom:20px; color:#1f2a40; }
    label { display:block; margin-bottom:5px; font-weight:600; color:#333; }
    input { width:100%; padding:10px; margin-bottom:15px; border:1px solid #cfd6e4; border-radius:5px; }
    .submit-btn {
        width:100%;
        padding:10px;
        background:#4caf50;
        color:white;
        border:none;
        border-radius:5px;
        cursor:pointer;
        font-size:16px;
    }
    .submit-btn:hover { background:#43a047; }
    .back-btn {
        display:inline-block;
        margin-top:15px;
        padding:10px 15px;
        background:#555;
        color:white;
        text-decoration:none;
        border-radius:5px;
    }
    p.error { color:red; margin-bottom:10px; }
    p.success { color:green; margin-bottom:10px; }
</style>
</head>
<body>

<div class="container">
    <h2>Change Password</h2>

    <?php if ($error) echo "<p class='error'>$error</p>"; ?>
    <?php if ($success) echo "<p class='success'>$success</p>"; ?>

    <form method="post" action="">
        <label>Current Password</label>
        <input type="password" name="current_password" required>

        <label>New Password</label>
        <input type="password" name="new_password" required>

        <label>Confirm New Password</label>
        <input type="password" name="confirm_password" required>

        <button type="submit" class="submit-btn">Change Password</button>
    </form>

    <a href="<?= $dashboard_link ?>" class="back-btn">← Back to Dashboard</a>
</div>

</body>
</html>
