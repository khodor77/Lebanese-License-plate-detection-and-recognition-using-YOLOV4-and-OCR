<!DOCTYPE html>
<html>

<head>
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="dashboard.css">


</head>

<body>
    <div class="container">
        <header>
            <div class="top-right">
                <?php echo $name; ?> (<?php echo $status; ?>)
                <a href="profile.php" class="user-links">Profile</a>
                <a href="logout.php" class="user-links">Log out</a>
            </div>
        </header>

        <a href="addflagged.php" id="add-flagged-plate-btn">Add Flagged Plate</a>
        <div class="flagged-licenses-box">
            <h2>Flagged Licenses</h2>
            <input type="text" id="search-input" placeholder="Search Plate Number">
            <table>
                <thead>

                    <tr>
                        <th>Plate Number</th>
                        <th>Plate Type</th>
                        <th>Plate Color</th>
                        <th>Reason</th>
                        <th>Spotted</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $pdo = new PDO("mysql:host=localhost;dbname=masterthesis", "root", "");

                    $stmt = $pdo->query("SELECT plate_number, plate_type, plate_color, Reason, spotted, id, path, Status FROM flagged_plates order by status DESC");
                    while ($row = $stmt->fetch()) {
                        echo "<tr>";
                        echo "<td>" . $row['plate_number'] . "</td>";
                        echo "<td>" . $row['plate_type'] . "</td>";
                        echo "<td>" . $row['plate_color'] . "</td>";
                        echo "<td>" . $row['Reason'] . "</td>";
                        if ($row['spotted']) {
                            echo "<td>Yes: <a href='report_details.php?id=" . $row['id'] . "&src=" . $row['path'] . "'>Report </a></td>";
                        } else {
                            echo "<td>No</td>";
                        }

                        echo "<td>" . $row['Status'] . "</td>";

                        if (true) {
                            echo "<td>
                                        <form method='POST' action='update_flagged_plate.php'>
                                            <input type='hidden' name='plate_number' value='" . $row['plate_number'] . "'>
                                            <input type='hidden' name='action' value='approved'>
                                            <button class = 'approve-btn' type='submit'>Approve</button>
                                        </form>
                                        <form method='POST' action='update_flagged_plate.php'>
                                            <input type='hidden' name='plate_number' value='" . $row['plate_number'] . "'>
                                            <input type='hidden' name='action' value='denied'>
                                            <button class = 'deny-btn' type='submit'>Deny</button>
                                        </form>
                                      </td>";
                        }

                        echo "</tr>";
                    }
                    ?>

                </tbody>
            </table>
        </div>
    </div>

    <script>
        const searchInput = document.querySelector('#search-input');
        const rows = document.querySelectorAll('table tbody tr');

        searchInput.addEventListener('keyup', function(event) {
            const query = event.target.value.toLowerCase();

            rows.forEach(function(row) {
                const plateNumber = row.querySelector('td:nth-child(1)').textContent.toLowerCase();

                if (plateNumber.indexOf(query) === -1) {
                    row.style.display = 'none';
                } else {
                    row.style.display = '';
                }
            });
        });
    </script>
    <?php
    require "notis.php"; ?>
</body>

</html>