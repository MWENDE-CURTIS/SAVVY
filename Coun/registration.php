<?php
session_start(); // Start the session to store session variables

// Database connection parameters
$servername = "localhost"; // Change this if your database is hosted on a different server
$username = "root"; // Change this to your database username
$password = ""; // Change this to your database password
$dbname = "Nutricare";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Process registration
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve username and password from form
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Hash the password for security
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Insert new admin into the database
    $sql = "INSERT INTO admin (username, password) VALUES ('$username', '$hashed_password')";

    if ($conn->query($sql) === TRUE) {
        // Registration successful, redirect to login page
        header("Location: login.html?success=Registration successful!");
        exit();
    } else {
        // Registration failed, display error message
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Close connection
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Registration</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="registration-container">
        <h2>Manage Admin</h2>
        <form action="registration.php" method="POST">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <br><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <br><br>
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
