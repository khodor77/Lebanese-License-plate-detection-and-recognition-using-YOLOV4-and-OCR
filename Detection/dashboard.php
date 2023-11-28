<?php
require 'connect.php';
session_start();

if (!isset($_SESSION["username"])) {
    header("Location: login.php");
    exit();
}
$username = $_SESSION["username"];
$sql = "SELECT * FROM users WHERE username = '$username'";
$result = $conn->query($sql);
if ($result->num_rows == 1) {
    $row = $result->fetch_assoc();
    $name = $row["name"];
    $status = $row["usertype"];
    echo $status;
    if ($status == "Sergeant") {
        require "dashboardSergeant.php";
    } else if ($status == "Officer") {
        $_SESSION['status'] = "Officer";
        require "dashboardOfficer.php";
    } else {
        header("index.php");
    }
}
