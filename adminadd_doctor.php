<?php
include_once __DIR__ . '/connect.php';
session_start(); // Start the session to access session variables

// Check if user is logged in, if not redirect to login page
if (!isset($_SESSION['username'])) {
    header("Location: admin/adminlogin.html");
    exit();
}

// Database connection parameters
 // Change this if your database is hosted on a different server
 // Change this to your database username
 // Change this to your database password


// Create connection


// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Process form data
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["name"];
    
    $specification = $_POST["specification"];
    $email = $_POST["email"];
     // Hash the password for security
    
    // Insert new doctor into the database
    $sql = "INSERT INTO consultant (name, username, specification, email, password) VALUES ('$name', '$username', '$specification', '$email', '$password')";
    
    if ($conn->query($sql) === TRUE) {
        echo "New doctor added successfully!";
        header("Location: adminadd_doctor2.php"); // Redirect to dashboard or another page
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>


