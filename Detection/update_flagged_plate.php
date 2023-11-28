<?php
session_start();
if (!isset($_SESSION["username"]) || !$_SESSION['status']) {
    header("location: login.php");
    exit();
}

if (!isset($_POST['plate_number']) || !isset($_POST['action'])) {
    header("location: dashboard.php");
    exit();
}

$plate_number = $_POST['plate_number'];
$status = $_POST['action'];

$pdo = new PDO("mysql:host=localhost;dbname=masterthesis", "root", "");
$stmt = $pdo->prepare("UPDATE flagged_plates SET Status = :status WHERE plate_number = :plate_number ");
$stmt->bindParam(':status', $status);
$stmt->bindParam(':plate_number', $plate_number);
$stmt->execute();

header("location: dashboard.php");
exit();
