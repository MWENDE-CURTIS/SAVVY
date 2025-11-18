<?php
session_start(); // Start session

include "connect.php";

// Process form data
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $age = $_POST['age'];
    $gender=$_POST['gender'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $diabetic = isset($_POST['diabetic']) ? 1 : 0;
    $high_blood_pressure = isset($_POST['high_blood_pressure']) ? 1 : 0;
    $low_blood_pressure = isset($_POST['low_blood_pressure']) ? 1 : 0;
    $meal_plan_type = $_POST['meal_plan_type'];
    $password = $_POST['password'];

    // Check if the email already exists
    $check_sql = "SELECT * FROM user WHERE email='$email'";
    $check_result = $conn->query($check_sql);
    
    if ($check_result->num_rows > 0) {
        // Email already exists, set error message in session and redirect
        $_SESSION['error_message'] = "Email already exists. Please use a different email.";
        header("Location: Registration.php");
        exit();
    } else {
        // Prepare SQL statement
        $sql = "INSERT INTO user (fname, lname, age, email, gender,phonenumber, diabetic, high_blood_pressure, low_blood_pressure, meal_plan_type, password)
                VALUES ('$fname', '$lname', $age, '$email','$gender', '$phone', $diabetic, $high_blood_pressure, $low_blood_pressure, '$meal_plan_type', '$password')";

        // Execute SQL statement
        if ($conn->query($sql) === TRUE) {
            // Registration successful, set success message in session and redirect
            $_SESSION['success_message'] = "Registration successful!";
            header("Location:login.html");
            exit();
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
}

// Close connection
$conn->close();
?>
