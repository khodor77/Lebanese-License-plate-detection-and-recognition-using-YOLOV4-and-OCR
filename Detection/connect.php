<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "masterthesis";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
$pdo = new PDO("mysql:host=localhost;dbname=masterthesis", "root", "");
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
