<html>


<head>
    <link rel="stylesheet" href="profilecss.css">
</head>

<body>

    <?php
    require  "connect.php";
    session_start();
    if (!isset($_SESSION['username'])) {
        header('Location: index.php');
        exit();
    }
    $username = $_SESSION['username'];

    $query = "SELECT name, last_name, email, password, username, phone, id, usertype FROM users where username ='$username' ";
    $result = mysqli_query($conn, $query);
    if ($result) {
        echo "<table>";
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>
            <th>Name</th>";
            echo "<td>" . $row["name"] . "</td>";
            echo "<tr>";

            echo "<tr>
            <th>Last Name</th>";
            echo "<td>" . $row["last_name"] . "</td>";
            echo "<tr>";

            echo "<tr>
            <th>Email</th>";
            echo "<td>" . $row["email"] . "</td>";
            echo "<tr>";

            echo "<tr>
            <th>Username</th>";
            echo "<td>" . $row["username"] . "</td>";
            echo "<tr>";

            echo "<tr>
            <th>Phone</th>";
            echo "<td>" . $row["phone"] . "</td>";
            echo "<tr>";

            echo "<tr>
            <th>ID</th>";
            echo "<td>" . $row["id"] . "</td>";
            echo "<tr>";

            echo "<tr>
            <th>User Type</th>";
            echo "<td>" . $row["usertype"] . "</td>";
            echo "<tr>";

            echo "</tr>";
        }

        echo "</table>";
    ?>

        <form action="changepassword.php" method="post">
            <label for="old_password">Old Password:</label>
            <input type="password" id="old_password" name="old_password"><br>

            <label for="new_password">New Password:</label>
            <input type="password" id="new_password" name="new_password"><br>

            <label for="confirm_password">Confirm New Password:</label>
            <input type="password" id="confirm_password" name="confirm_password"><br>

            <button type="submit">Change Password</button>
        </form>

    <?php
    } else {
        echo "Error: " . $query . "<br>" . mysqli_error($conn);
    }
    mysqli_close($conn);
    ?>

</body>

</html>