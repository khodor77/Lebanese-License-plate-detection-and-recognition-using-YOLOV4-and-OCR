<!DOCTYPE html>
<html>

<head>
    <title>Report Details</title>
    <link rel="stylesheet" type="text/css" href="report_details.css">
</head>

<body>
    <?php
    $pdo = new PDO("mysql:host=localhost;dbname=masterthesis", "root", "");

    // Get plate details from flagged_plates table
    $plate_id = $_GET['id'];
    $src = $_GET['src'];
    $stmt = $pdo->prepare("SELECT plate_number, plate_type, plate_color, Reason FROM flagged_plates WHERE id = :plate_id");
    $stmt->bindParam(':plate_id', $plate_id);
    $stmt->execute();
    $plate_row = $stmt->fetch();

    // Get vehicle details
    $stmt = $pdo->prepare("SELECT brand, color, type, manufacture FROM vehicle_details WHERE Plate_number = :plate_num");
    $stmt->bindParam(':plate_num', $plate_row['plate_number']);
    $stmt->execute();
    $vehicle_row = $stmt->fetch();

    // Get user details from vehicle_owner table
    $stmt = $pdo->prepare("SELECT name, last_name, mother_name, address, birthday, phone, birthplace, personal_recnum, civil_id FROM vehicle_owner WHERE ID = :plate_id");
    $stmt->bindParam(':plate_id', $plate_id);
    $stmt->execute();
    $user_row = $stmt->fetch();

    // Get location and time
    $stmt = $pdo->prepare("SELECT location, time FROM captured_plates WHERE plate_number = :plate_num");
    $stmt->bindParam(':plate_num', $plate_row['plate_number']);
    $stmt->execute();
    $details = $stmt->fetch();


    // Display plate details
    echo "<div class='container'>";
    echo "<h2>Plate Details</h2>";
    echo "<table>";
    echo "<tr><td>Plate Number</td><td>" . $plate_row['plate_number'] . "</td></tr>";
    echo "<tr><td>Plate Type</td><td>" . $plate_row['plate_type'] . "</td></tr>";
    echo "<tr><td>Plate Color</td><td>" . $plate_row['plate_color'] . "</td></tr>";
    echo "</table>";

    // Display user details
    echo "<h2>User Details</h2>";
    echo "<table>";
    echo "<tr><td>Name</td><td>" . $user_row['name'] . "</td></tr>";
    echo "<tr><td>Last Name</td><td>" . $user_row['last_name'] . "</td></tr>";
    echo "<tr><td>Mother Name</td><td>" . $user_row['mother_name'] . "</td></tr>";
    echo "<tr><td>Address</td><td>" . $user_row['address'] . "</td></tr>";
    echo "<tr><td>Birthday</td><td>" . $user_row['birthday'] . "</td></tr>";
    echo "<tr><td>Phone</td><td>" . $user_row['phone'] . "</td></tr>";
    echo "<tr><td>Birthplace</td><td>" . $user_row['birthplace'] . "</td></tr>";
    echo "<tr><td>Personal Recnum</td><td>" . $user_row['personal_recnum'] . "</td></tr>";
    echo "<tr><td>Civil ID</td><td>" . $user_row['civil_id'] . "</td></tr>";
    echo "</table>";




    // Display vehicle detials
    echo "<h2>Vehicle Details</h2>";
    echo "<table>";
    echo "<tr><td>brand</td><td>" . $vehicle_row['brand'] . "</td></tr>";
    echo "<tr><td>color</td><td>" . $vehicle_row['color'] . "</td></tr>";
    echo "<tr><td>type</td><td>" . $vehicle_row['type'] . "</td></tr>";
    echo "<tr><td>manufacture</td><td>" . $vehicle_row['manufacture'] . "</td></tr>";
    echo "</table>";

    // Display Time and Date
    echo "<h2>Detection Details</h2>";
    echo "<table>";
    echo "<tr><td>Location</td><td>" . $details['location'] . "</td></tr>";
    echo "<tr><td>Date & Time</td><td>" . $details['time'] . "</td></tr>";
    echo "<tr><td>Reason</td><td>" . $plate_row['Reason'] . "</td></tr>";
    echo "</table>";

    echo "</div>";




    $image_url = "https://example.com/image.jpg";


    echo "<img src='" . $src . " ' alt= Captured Image>";

    ?>
    <?php
    require "notis.php";
    ?>
</body>

</html>