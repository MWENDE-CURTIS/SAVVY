<?php
// --- Database Configuration and Connection ---

// Fetch credentials from Render Environment Variables
$servername = getenv('DB_HOST'); 
$username = getenv('DB_USER'); 
$password = getenv('DB_PASS');
$dbname = getenv('DB_NAME');
$port = getenv('DB_PORT'); // Fetch the custom port

// Set default port to 3306 if not provided in environment
if (!$port) {
    $port = 3306;
}

// Ensure all variables are set (critical check for deployment)
if (!$servername || !$username || !$dbname) {
    error_log("FATAL ERROR: Database environment variables are missing.");
    die("Connection error. Please contact support.");
}

// Create connection to the remote MySQL Database with PORT
// Note: The port is passed as the 5th argument (int)
$conn = new mysqli($servername, $username, $password, $dbname, (int)$port); 

// Check connection
if ($conn->connect_error) {
    error_log("Database Connection Failed: " . $conn->connect_error);
    die("Connection failed: Server error.");
}

// Optionally set character set
$conn->set_charset("utf8");