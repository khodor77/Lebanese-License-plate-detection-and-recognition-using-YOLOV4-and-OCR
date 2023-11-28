<?php


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    require 'connect.php';

    // Get the registration form data
    $name = $_POST["name"];
    $lastname = $_POST["lastname"];
    $username = $_POST["username"];
    $phone = $_POST["phone"];
    $email = $_POST["email"];
    $password = hash('sha256', $_POST["password"]);
    $status = "admin";
    $sql = "INSERT INTO users (name, last_name, username, phone, email, password,usertype) 
  VALUES ('$name', '$lastname', '$username', '$phone', '$email', '$password','$status')";

    if ($conn->query($sql) === TRUE) {

        header("Location: index.php");
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
