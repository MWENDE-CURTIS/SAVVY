<?php
include_once __DIR__ . '/connect.php';
session_start(); // Start the session to store session variables

// Database connection parameters







// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Process login
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve username and password from form
    
    

    // Query to check if consultant exists with provided credentials
    $sql = "SELECT * FROM consultant WHERE username='$username' AND password='$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Consultant found, set session variables and redirect
        $consultant = $result->fetch_assoc();
        $_SESSION['consultant_id'] = $consultant['consultant_id'];
        $_SESSION['username'] = $username;
        header("Location: http://localhost/SAVVY/adminCoundaily_insert2.php"); // Redirect to admin_daily_insert.php
        exit();
    } else {
        echo "<script>
                alert('Invalid username or password!');
                window.location.href = 'counsultlogin.html';
              </script>";
        exit();
    }
}

// Close connection
$conn->close();
?>


