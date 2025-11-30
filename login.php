<?php
include_once __DIR__ . '/connect.php';
session_start(); // Start the session to store session variables

// Database connection parameters
 // Change this if your database is hosted on a different server
 // Change this to your database username
 // Change this to your database password




// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Process login
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve email and password from form
    $email = $_POST['email'];
    

    // Query to check if user exists with provided credentials
    $sql = "SELECT * FROM user WHERE email='$email' AND password='$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // User found, set session variables and redirect to dashboard
        $row = $result->fetch_assoc();
        $_SESSION['user_id'] = $row['user_id'];
        $_SESSION['email'] = $row['email'];
        header("Location: index.php"); // Redirect to dashboard page
        exit();
    } else {
        // User not found or credentials incorrect, redirect back to login page with error message
        echo "<script>
                alert('Invalid email or password!');
                window.location.href = 'login.html';
              </script>";
        exit();
    }
}

// Close connection
$conn->close();
?>


