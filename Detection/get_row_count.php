<?php
require 'connect.php';


$sql = "SELECT COUNT(*) as count FROM captured_plates";
$sql2 = "SELECT plate_number FROM captured_plates ORDER BY reportid DESC LIMIT 1";

$result = $conn->query($sql);
$result2 = $conn->query($sql2);

if ($result === FALSE) {
  die("Error getting row count: " . $conn->error);
}

$row = $result->fetch_assoc();
$row2 = $result2->fetch_assoc();

$row_count = $row['count'];
$pl = $row2['plate_number'];

$conn->close();
echo $pl;
