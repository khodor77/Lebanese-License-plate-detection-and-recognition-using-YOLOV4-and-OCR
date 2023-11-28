<?php
// Include the PHP file with the database connection
require 'connect.php';
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Get the username and password from the form
    $username = $_POST["username"];
    $password = hash('sha256', $_POST["password"]);

    $sql = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        $_SESSION["username"] = $username;

        header("Location: dashboard.php");
    } else {
        echo "Invalid username or password.";
    }
} else {
    header("Location: index.php");
}
