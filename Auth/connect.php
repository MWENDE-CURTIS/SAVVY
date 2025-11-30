<?php

// Diagnostic version to find the real issue

echo "=== DB Connection Debug ===<br>";

// Check if mysqli is loaded
if (!extension_loaded('mysqli')) {
    die('FATAL: mysqli extension is not loaded in PHP!');
}
echo "✓ mysqli extension loaded<br>";

$databaseUrl = getenv('MYSQL_URL') ?: getenv('CLEARDB_DATABASE_URL') ?: getenv('DATABASE_URL');
echo "databaseUrl: " . ($databaseUrl ? "SET" : "NOT SET") . "<br>";

if ($databaseUrl) {
    $parts = parse_url($databaseUrl);
    $db_host = $parts['host'] ?? '127.0.0.1';
    $db_user = $parts['user'] ?? 'root';
    $db_pass = $parts['pass'] ?? '';
    $db_name = isset($parts['path']) ? ltrim($parts['path'], '/') : 'SAVVY';
    $db_port = isset($parts['port']) ? (int)$parts['port'] : 3306;
} else {
    $db_host = getenv('DB_HOST') ?: '127.0.0.1';
    $db_user = getenv('DB_USER') ?: 'root';
    $db_pass = getenv('DB_PASS') ?: '';
    $db_name = getenv('DB_NAME') ?: 'SAVVY';
    $db_port = (int)(getenv('DB_PORT') ?: 3306);
}

echo "Connecting to: $db_host:$db_port / $db_name / user: $db_user<br>";
echo "--- Attempting connection ---<br>";

try {
    $conn = new mysqli($db_host, $db_user, $db_pass, $db_name, $db_port);
    echo "✓ Connection object created<br>";
} catch (Exception $e) {
    die('Exception: ' . $e->getMessage());
}

if (!$conn) {
    die('ERROR: $conn is null!');
}

if ($conn->connect_errno) {
    die('Connection Error: ' . $conn->connect_error);
}

echo "✓ Connected successfully<br>";
$conn->set_charset('utf8mb4');
echo "=== End Debug ===<br>";
?>