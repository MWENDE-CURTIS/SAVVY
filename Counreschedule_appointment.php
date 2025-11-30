<?php
include_once __DIR__ . '/connect.php';
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: consultant/counsultlogin.html");
    exit();
}








if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $consultation_id = intval($_POST['consultation_id']);
    $date = $_POST['date'];
    $time = $_POST['time'];

    $sql = "UPDATE consultation SET date = ?, time = ? WHERE consultation_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssi", $date, $time, $consultation_id);

    if ($stmt->execute()) {
        echo "<script>
            alert('Appointment rescheduled successfully.');
            window.location.href = 'adminCounviewbooking.php';
        </script>";
    } else {
        echo "Error rescheduling appointment: " . $conn->error;
    }
    
    $stmt->close();
}

$conn->close();
?>


