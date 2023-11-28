<?php
require "connect.php";
session_start();

if (!isset($_SESSION["username"])) {
  header("Location: login.php");
  exit();
}

if (isset($_POST['submit'])) {

  $plate_number = mysqli_real_escape_string($conn, $_POST['plate_number']);
  $plate_type = mysqli_real_escape_string($conn, $_POST['plate_type']);
  $plate_color = mysqli_real_escape_string($conn, $_POST['plate_color']);
  $reason = mysqli_real_escape_string($conn, $_POST['reason']);



  $spotted = false;
  $status = 'pending';

  $stmt = $pdo->prepare("SELECT id FROM plate_details WHERE plate_number = ?");
  $stmt->execute([$plate_number]);
  $id = $stmt->fetchColumn();
  $query = "INSERT INTO flagged_plates (plate_number, plate_type, plate_color, reason, spotted, status,id)
            VALUES ('$plate_number', '$plate_type', '$plate_color', '$reason', '$spotted', '$status','$id')";
  mysqli_query($conn, $query);

  header('Location: dashboard.php');
  exit();
}
?>
<!DOCTYPE html>
<html>

<head>
  <title>Add Flagged Plate</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
  <h1>Add Flagged Plate</h1>
  <form method="post" action="addflagged.php">
    <label>Plate Number:</label>
    <input type="text" name="plate_number" required><br>

    <label>Plate Type:</label>
    <input type="text" name="plate_type" required><br>

    <label>Plate Color:</label>
    <input type="text" name="plate_color" required><br>

    <label>Reason:</label>
    <textarea name="reason" required></textarea><br>

    <input type="submit" name="submit" value="Submit">
  </form>
  <?php
  require "notis.php";
  ?>
</body>

</html>