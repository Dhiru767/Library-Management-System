<?php 
//for admin
$admin_password="admin1";
$hashed=password_hash($admin_password,PASSWORD_DEFAULT);
echo $hashed;
echo "<br><br>";

//for staff
$staff_password="staff1";
$hashed=password_hash($staff_password,PASSWORD_DEFAULT);
echo $hashed;
echo "<br><br>";

//for passenger
$member_password="member1";
$hashed=password_hash($member_password,PASSWORD_DEFAULT);
echo $hashed;
echo "<br><br>";


?>