<?php

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

$conn = new mysqli($db_host, $db_user, $db_pass, $db_name, $db_port);

if ($conn->connect_errno) {
    die('Connection failed: ' . $conn->connect_error);
}

$conn->set_charset('utf8mb4');
?>