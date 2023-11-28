<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>Login Form</title>
</head>

<body>
    <h1> </h1>
    <form method="POST" action="login.php">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username"><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password"><br><br>
        <input type="submit" value="Login">
    </form>
    <br>
    <form class='reg-btn' action="register.php">
        <input type="submit" value="Register">
    </form>
    <div class="intro">'Innovation In Motion'</div>
</body>

</html>