<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="style.css">
	<title>Registration Form</title>
</head>

<body>
	<h1>Registration Form</h1>
	<form method="POST" action="registernew.php">
		<label for="first-name">First Name:</label>
		<input type="text" id="first-name" name="name"><br><br>
		<label for="last-name">Last Name:</label>
		<input type="text" id="last-name" name="lastname"><br><br>
		<label for="username">Username:</label>
		<input type="text" id="username" name="username"><br><br>
		<label for="phone">Phone Number:</label>
		<input type="tel" id="phone" name="phone"><br><br>
		<label for="email">Email:</label>
		<input type="email" id="email" name="email"><br><br>
		<label for="password">Password:</label>
		<input type="password" id="password" name="password"><br><br>
		<input type="submit" value="Register">
	</form>
	<?php
	require "notis.php";
	?>
</body>

</html>