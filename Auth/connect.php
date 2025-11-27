<?php
// --- Database Configuration and Connection ---

// 1. Fetch the single, comprehensive database URL provided by the hosting service (e.g., Railway).
$database_url = getenv('MYSQL_URL'); 

// 2. Ensure the URL variable is set (critical check for deployment).
if (!$database_url) {
    error_log("FATAL ERROR: The MYSQL_URL environment variable is missing.");
    die("Connection error. Please contact support.");
}

// 3. Parse the URL into its individual components.
// Example URL format: mysql://user:password@host:port/database
$url_parts = parse_url($database_url);

// Check if parsing was successful and required parts exist
if ($url_parts === false || !isset($url_parts['host'], $url_parts['user'], $url_parts['pass'], $url_parts['path'])) {
    error_log("FATAL ERROR: Failed to parse the MYSQL_URL into valid components.");
    die("Configuration error. Please contact support.");
}

// 4. Extract individual connection parameters
// The 'path' starts with a slash, so we remove it to get the pure database name.
$servername = $url_parts['host']; 
$username = $url_parts['user']; 
$password = $url_parts['pass'];
$dbname = ltrim($url_parts['path'], '/'); 
// Use the URL port if available, otherwise default to 3306 for MySQL
$port = isset($url_parts['port']) ? (int)$url_parts['port'] : 3306; 

// Create connection to the remote MySQL Database with PORT
// Note: The port is passed as the 5th argument (int)
$conn = new mysqli($servername, $username, $password, $dbname, $port); 

// Check connection
if ($conn->connect_error) {
    // Log the detailed error, but show a generic message to the user
    error_log("Database Connection Failed: " . $conn->connect_error);
    die("Connection failed: Server error.");
}

// Optionally set character set
$conn->set_charset("utf8");