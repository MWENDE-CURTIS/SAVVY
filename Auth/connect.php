<?php
<?php
// Environment-aware DB connector for SAVVY

$databaseUrl = getenv('MYSQL_URL') ?: getenv('CLEARDB_DATABASE_URL') ?: getenv('DATABASE_URL');

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

// Create connection with error reporting
$conn = @new mysqli($db_host, $db_user, $db_pass, $db_name, $db_port);

if ($conn->connect_errno) {
    error_log('DB Connection Error: ' . $conn->connect_error);
    error_log('Host: ' . $db_host . ', Port: ' . $db_port . ', User: ' . $db_user . ', DB: ' . $db_name);
    $conn = null;  // Explicitly set to null on failure
}

if ($conn) {
    $conn->set_charset('utf8mb4');
}
?>