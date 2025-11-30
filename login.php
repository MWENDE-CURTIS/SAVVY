<?php
<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Debug: Check if connect.php is loaded
require_once dirname(__FILE__) . '/connect.php';

echo "DEBUG: conn is " . (isset($conn) ? "SET" : "NOT SET") . "<br>";
echo "DEBUG: conn type: " . gettype($conn) . "<br>";

if (!$conn) {
    echo "ERROR: conn is null or false<br>";
    die('Database connection failed');
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


