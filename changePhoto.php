<?php
include '../config/db.php';
include '../config/auth.php';
checkRole(['member']);

$member_id = $_SESSION['user_id'];

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_FILES['photo'])) {
    $upload_dir = '../uploads/';
    $file_name = basename($_FILES['photo']['name']);
    $target_file = $upload_dir . $file_name;

    // Check file is image
    $check = getimagesize($_FILES["photo"]["tmp_name"]);
    if ($check !== false) {
        // Get old photo
        $old = mysqli_fetch_assoc(mysqli_query($conn, "SELECT photo FROM members WHERE user_id = '$member_id'"))['photo'];

        // Move new file
        if (move_uploaded_file($_FILES["photo"]["tmp_name"], $target_file)) {
            // Delete old file if exists
            if ($old && file_exists($upload_dir . $old)) {
                unlink($upload_dir . $old);
            }

            // Update DB
            $sql = "UPDATE members SET photo = '$file_name' WHERE user_id = '$member_id'";
            if (mysqli_query($conn, $sql)) {
                echo "Profile picture updated.";
            } else {
                echo "DB error: " . mysqli_error($conn);
            }
        } else {
            echo "Error uploading file.";
        }
    } else {
        echo "Only image files are allowed.";
    }
}
?>
<form method="post" enctype="multipart/form-data">
    <label for="photo">Change Profile Picture:</label>
    <input type="file" name="photo" accept="image/*" required><br><br>
    <button type="submit">Upload</button>
</form>
