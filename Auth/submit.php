<?php

session_start();
require_once __DIR__ . '/connect.php';

if (!$conn) {
    $_SESSION['error_message'] = "Database connection failed";
    header("Location: Registration.php");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve and sanitize form data
    $fname = trim($_POST['fname'] ?? '');
    $lname = trim($_POST['lname'] ?? '');
    $age = (int)($_POST['age'] ?? 0);
    $gender = trim($_POST['gender'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $phone = trim($_POST['phone'] ?? '');
    $diabetic = isset($_POST['diabetic']) ? 1 : 0;
    $high_blood_pressure = isset($_POST['high_blood_pressure']) ? 1 : 0;
    $low_blood_pressure = isset($_POST['low_blood_pressure']) ? 1 : 0;
    $meal_plan_type = trim($_POST['meal_plan_type'] ?? '');
    $password = $_POST['password'] ?? '';

    // Validate inputs
    if (empty($fname) || empty($lname) || empty($email) || empty($password)) {
        $_SESSION['error_message'] = "All required fields must be filled.";
        header("Location: Registration.php");
        exit();
    }

    // Check if email already exists using prepared statement
    $check_stmt = $conn->prepare("SELECT id FROM user WHERE email = ? LIMIT 1");
    $check_stmt->bind_param("s", $email);
    $check_stmt->execute();
    $check_result = $check_stmt->get_result();

    if ($check_result->num_rows > 0) {
        $_SESSION['error_message'] = "Email already exists. Please use a different email.";
        $check_stmt->close();
        header("Location: Registration.php");
        exit();
    }
    $check_stmt->close();

    // Hash password
    $password_hashed = password_hash($password, PASSWORD_DEFAULT);

    // Insert user with prepared statement (prevents SQL injection)
    $insert_stmt = $conn->prepare(
        "INSERT INTO user (fname, lname, age, email, gender, phonenumber, diabetic, high_blood_pressure, low_blood_pressure, meal_plan_type, password) 
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
    );

    $insert_stmt->bind_param(
        "ssisssiiiis",
        $fname, $lname, $age, $email, $gender, $phone,
        $diabetic, $high_blood_pressure, $low_blood_pressure, $meal_plan_type, $password_hashed
    );

    if ($insert_stmt->execute()) {
        $_SESSION['success_message'] = "Registration successful! Please log in.";
        $insert_stmt->close();
        header("Location: login.html");
        exit();
    } else {
        $_SESSION['error_message'] = "Registration failed. Please try again.";
        $insert_stmt->close();
        header("Location: Registration.php");
        exit();
    }
}

$conn->close();
?>