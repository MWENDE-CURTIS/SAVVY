<?php
<?php
session_start();
require_once __DIR__ . '/connect.php';

if (!$conn) {
    die('Database connection failed');
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    // Use prepared statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT id, email, password FROM user WHERE email = ? LIMIT 1");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        
        // If password is hashed with password_hash()
        if (password_verify($password, $row['password'])) {
            $_SESSION['user_id'] = $row['id'];
            $_SESSION['email'] = $row['email'];
            header("Location: adashboard.php");
            exit();
        } else {
            // Password incorrect
            echo "<script>alert('Invalid email or password!'); window.location.href = 'login.html';</script>";
            exit();
        }
    } else {
        // User not found
        echo "<script>alert('Invalid email or password!'); window.location.href = 'login.html';</script>";
        exit();
    }
    $stmt->close();
}
?>