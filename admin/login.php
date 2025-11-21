<?php
session_start(); // Start the session to store session variables

// Database connection parameters
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "SAVVY";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Process login
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve username and password from form
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Query to check if admin exists with provided credentials
    $sql = "SELECT * FROM admin WHERE username='$username' AND password='$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Admin found, set session variable and redirect to admin_daily_insert.php
        $_SESSION['username'] = $username;
        header("Location: http://localhost/SAVVY/admindashboard.php"); // Redirect to admin_daily_insert.php
        exit();
    } else {
        // User not found or credentials incorrect, redirect back to login page with error message
        header("Location: adminlogin.html?error=Invalid email or password!");
        exit();
    
    }
}

// Close connection
$conn->close();
?>
