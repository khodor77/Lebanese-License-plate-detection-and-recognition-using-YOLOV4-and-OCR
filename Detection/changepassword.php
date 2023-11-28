<?php

require  "connect.php";
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $old_password = hash('sha256', $_POST["old_password"]);
    $new_password = $_POST['new_password'];
    $confirm_password = $_POST['confirm_password'];
    $username = $_SESSION['username'];

    $sql = "SELECT password FROM users WHERE username='$username'";
    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $current_password = $row['password'];
        echo password_verify($old_password, $current_password);

        if ($old_password == $current_password) {

            if ($new_password === $confirm_password) {
                $new_password_hash =  hash('sha256', $new_password);
                $sql = "UPDATE users SET password = '$new_password_hash' WHERE username='$username'";
                $result = mysqli_query($conn, $sql);
                if ($result) {
                    header('Location: dashboard.php');
                    exit();
                } else {

                    $error_message = "Error updating password: " . mysqli_error($conn);
                }
            } else {

                $error_message = "New password and confirm password don't match!";
            }
        } else {
            $error_message = "Incorrect old password!";
        }
    } else {
        $error_message = "Username not found!";
    }

    mysqli_close($conn);
} else {
    echo "Not submit";
}
