<?php
session_start(); // Start session

// Check if there's an error message in the session
if(isset($_SESSION['error_message'])) {
    $error_message = $_SESSION['error_message'];
    // Unset the error message after retrieving it to ensure it's only displayed once
    unset($_SESSION['error_message']);
} else {
    // If no error message, set it to an empty string
    $error_message = "";
}
?>





<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#06aa5e">
    <meta name="msapplication-navbutton-color" content="#06aa5e">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <title>Sign up | Nutricare ™</title>
    <link rel="shortcut icon" href="./assets/images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="./assets/css/styles.css">
    <script src="./assets/js/script.js" defer></script>
</head>
<body>
    <main class="card-container slideUp-animation">
        <div class="image-container">
            <h1 class="company">Nutricare <sup>&trade;</sup></h1>
            <img src="./assets/images/signUp.svg" class="illustration" alt="">
            <p class="quote">Sign up today to get exciting offers..!</p>
            <a href="#btm" class="mobile-btm-nav">
                <img src="./assets/images/dbl-arrow.png" alt="">
            </a>
        </div>
        <form action="submit.php" method="POST">
            <div class="form-container slideRight-animation">
                <h1 class="form-header">Get started</h1>

                <div class="input-container">
                    <label for="fname"></label>
                    <input type="text" name="fname" id="fname" required>
                    <span>First name</span>
                    <div class="error"></div>
                </div>

                <div class="input-container">
                    <label for="lname"></label>
                    <input type="text" name="lname" id="lname" required>
                    <span>Last name</span>
                    <div class="error"></div>
                </div>

                <div class="input-container">
                    <label for="age"></label>
                    <input type="number" name="age" id="age" required>
                    <span>Age</span>
                    <div class="error"></div>
                </div>
                <div class="input-container">
                    <label for="gender"></label>
                    <select name="gender" id="gender" required>
                        <option value="">Select Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                    <div class="error"></div>
                </div>
                <div class="input-container">
                    
                    <div class="dropdown-checkbox">
                        <button class="dropdown-toggle">Select Health Condition</button>
                        <div class="dropdown-content">
                            <label><input type="checkbox" name="diabetic" value="Diabetic"> Diabetic</label>
                            <label><input type="checkbox" name="high_blood_pressure" value="High Blood Pressure"> High Blood Pressure</label>
                            
                        </div>
                    </div>
                    <div class="error"></div>
                </div>

                <div class="input-container">
                  
                    <select name="meal_plan_type" id="meal-plan" required>
                        <option value="">Select What You're Looking For</option>
                        <option value="1">Meal Plan</option>
                        <option value="2">Diet Plan</option>
                    </select>
                    <div class="error"></div>
                </div>

                <div class="input-container">
                    <label for="email"></label>
                    <input type="email" name="email" id="email" required>
                    <span>Email</span>
                    <div class="error"><?php echo $error_message; ?></div>
                </div>

                <div class="input-container">
                    <label for="phone"></label>
                    <input type="tel" name="phone" id="phone" required>
                    <span>Phone Number</span>
                    <div class="error"></div>
                </div>

                <div class="input-container">
                    <label for="password"></label>
                    <input type="password" name="password" id="password" required>
                    <span>Password</span>
                    <div class="error"></div>
                </div>

                <div class="input-container">
                    <label for="confirm-password"></label>
                    <input type="password" name="confirm_password" id="confirm-password" required>
                    <span>Confirm Password</span>
                    <div class="error"></div>
                </div>

                <div id="btm">
                    <button type="submit" class="submit-btn">Create Account</button>
                    <p class="btm-text">
                        Already have an account..? <span class="btm-text-highlighted"><a href="http://localhost/Nutricare/login.html">Login</a></span>
                    </p>
                </div>
            </div>
        </form>
    </main>

    <script>
      document.addEventListener('DOMContentLoaded', function () {
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    const dropdownToggle = document.querySelector('.dropdown-toggle');

    checkboxes.forEach(function (checkbox) {
        checkbox.addEventListener('change', function () {
            updateDropdownText();
        });
    });

    function updateDropdownText() {
        const checkedCheckboxes = document.querySelectorAll('input[type="checkbox"]:checked');
        let selectedOptions = Array.from(checkedCheckboxes).map(function (checkbox) {
            return checkbox.value;
        });
        dropdownToggle.textContent = selectedOptions.length > 0 ? selectedOptions.join(', ') : 'Select Health Condition';
    }
});
    </script>
</body>
</html>
