-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2024 at 06:10 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nutricare`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`) VALUES
(1, 'hansi', '1999'),
(2, 'nimesh', '0606'),
(4, 'dhanushi', '$2y$10$QDrQ4I3AFwpaaXv3bM/rd.lVNWUNshOVL2bZkTDU8Nc3Na2r9oKxa'),
(7, 'anjale', '$2y$10$HlyeDQGRc2b5.eG0ZlfEKuZVLHOZHuzhJufFTYR.YPOA3jGHFHj4G');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `chat_id` int(11) NOT NULL,
  `consultation_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `sender_type` enum('user','consultant') DEFAULT NULL,
  `message` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `consultant`
--

CREATE TABLE `consultant` (
  `consultant_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `specification` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Dumping data for table `consultant`
--

INSERT INTO `consultant` (`consultant_id`, `name`, `username`, `specification`, `email`, `password`) VALUES
(1, 'Hansi Liyanapathirana', 'hansi', 'genaral', 'hansini99navodya@gmail.com', '1998'),
(2, 'Tehani Dilhara', 'tehani966', 'Counsultant', 'tehani966@gmail.com', '0966');

-- --------------------------------------------------------

--
-- Table structure for table `consultation`
--

CREATE TABLE `consultation` (
  `consultation_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `consultant_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Dumping data for table `consultation`
--

INSERT INTO `consultation` (`consultation_id`, `date`, `time`, `feedback`, `user_id`, `consultant_id`) VALUES
(7, '2024-07-31', '11:20:00', NULL, 2, 1),
(8, '2024-07-29', '21:38:00', NULL, 2, 2),
(9, '2024-07-30', '15:45:00', NULL, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `daily_meal_plan`
--

CREATE TABLE `daily_meal_plan` (
  `d_plan_id` int(11) NOT NULL,
  `plan_name` varchar(100) DEFAULT NULL,
  `plan_details` text DEFAULT NULL,
  `meal_image` varchar(100) DEFAULT NULL,
  `plan_type` enum('diabetic_free','High blood pressure Free','Combo Plan') DEFAULT NULL,
  `date` date DEFAULT NULL,
  `meal_time` enum('breakfast','lunch','dinner') DEFAULT NULL,
  `meal_preference` enum('vegan','nonvegan') DEFAULT NULL,
  `nutrition_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`nutrition_values`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Dumping data for table `daily_meal_plan`
--

INSERT INTO `daily_meal_plan` (`d_plan_id`, `plan_name`, `plan_details`, `meal_image`, `plan_type`, `date`, `meal_time`, `meal_preference`, `nutrition_values`) VALUES
(5, 'chiken with salad', 'This dish balanced mix of protein and vitamins, making it  for a nutritious meal.', 'uploads/3 - Copy.jpg', 'High blood pressure Free', NULL, 'breakfast', 'vegan', '100'),
(6, 'potatoes and chiken salad', 'Potato and chicken salad is a hearty and delicious dish', 'uploads/th (3).jpeg', 'High blood pressure Free', NULL, 'breakfast', 'nonvegan', '200'),
(7, 'pasta with vegetable', 'Pasta with vegetables is a versatile and nutritious dish', 'uploads/th (4).jpeg', 'High blood pressure Free', NULL, 'lunch', 'vegan', '200'),
(8, 'sandwitch and banana', 'It is rich in vitamins, minerals, and fiber,', 'uploads/download.jpeg', 'High blood pressure Free', NULL, 'lunch', 'vegan', '100'),
(9, 'Rice and curry', 'It is good for your health balance.', 'uploads/OIP (1).jpeg', 'High blood pressure Free', NULL, 'dinner', 'nonvegan', '200'),
(10, 'yogurt with strawberries', 'Creating a balanced and refreshing snack or dessert', 'uploads/Picture1.png', 'High blood pressure Free', NULL, 'dinner', 'vegan', '100'),
(11, 'Kurakkan (Finger Millet) Porridge', ' Healthy, low-GI, fiber-rich breakfast option.\r\n', 'uploads/WhatsApp Image 2024-07-26 at 15.56.56_2f6add0e.jpg', 'diabetic_free', NULL, 'breakfast', 'vegan', '200'),
(12, 'Red Rice and Dhal Curry', 'Balanced, nutrient-dense, low-GI meal.\r\n', 'uploads/WhatsApp Image 2024-07-26 at 15.56.56_0ba1b790.jpg', 'diabetic_free', NULL, 'lunch', 'vegan', '100'),
(13, 'Fish Ambul Thiyal with Vegetables', 'Protein-rich, low-carb, heart-healthy dinner.\r\n', 'uploads/WhatsApp Image 2024-07-26 at 15.56.57_305e99fb.jpg', 'diabetic_free', NULL, 'dinner', 'nonvegan', '100');

-- --------------------------------------------------------

--
-- Table structure for table `diet_plan`
--

CREATE TABLE `diet_plan` (
  `diet_plan_id` int(11) NOT NULL,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') DEFAULT NULL,
  `examples` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Dumping data for table `diet_plan`
--

INSERT INTO `diet_plan` (`diet_plan_id`, `day_of_week`, `examples`, `user_id`) VALUES
(1, 'Monday', '	Pasta,banana,milk', NULL),
(2, 'Tuesday', 'sandwitches, orange', NULL),
(3, 'Wednesday', 'Oatmeal, avacado', NULL),
(4, 'Thursday', 'String hoppers, milk', NULL),
(5, 'Friday', 'Red rice with curry, fresh juce', NULL),
(6, 'Saturday', 'Milk rice with sambol, green tea', NULL),
(7, 'Sunday', 'Roasted chiken ,avacado juce', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `education_material`
--

CREATE TABLE `education_material` (
  `e_id` int(11) NOT NULL,
  `e_name` varchar(100) DEFAULT NULL,
  `e_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `feedback_date` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `feedback_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `feedback_date`, `email`, `feedback_text`) VALUES
(1, '2024-07-28', 'nimeshdilhara2001@gmail.com', 'hii');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `message`, `created_at`) VALUES
(1, 1, 'System update coming soon', '2024-07-25 07:29:37'),
(2, 1, 'Chat Option testing 0.1v', '2024-07-27 19:06:35'),
(3, 2, 'Chat Option testing 0.1v', '2024-07-27 19:06:35'),
(4, 1, 'Sorry For Not working User feedback option now its work !', '2024-07-28 14:28:53'),
(5, 2, 'Sorry For Not working User feedback option now its work !', '2024-07-28 14:28:53'),
(6, 3, 'Sorry For Not working User feedback option now its work !', '2024-07-28 14:28:53'),
(7, 4, 'Sorry For Not working User feedback option now its work !', '2024-07-28 14:28:53'),
(8, 1, 'hii wellcome user', '2024-07-29 15:33:20'),
(9, 2, 'hii wellcome user', '2024-07-29 15:33:20'),
(10, 3, 'hii wellcome user', '2024-07-29 15:33:20'),
(11, 4, 'hii wellcome user', '2024-07-29 15:33:20');

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `product_id` int(11) NOT NULL,
  `product_image` varchar(100) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `product_details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `diabetic` tinyint(1) DEFAULT NULL,
  `high_blood_pressure` tinyint(1) DEFAULT NULL,
  `low_blood_pressure` tinyint(1) DEFAULT NULL,
  `meal_plan_type` int(11) DEFAULT NULL,
  `diet_preferences` varchar(100) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `medical_report` blob DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `fname`, `lname`, `gender`, `age`, `email`, `phonenumber`, `height`, `weight`, `diabetic`, `high_blood_pressure`, `low_blood_pressure`, `meal_plan_type`, `diet_preferences`, `profile_picture`, `medical_report`, `password`) VALUES
(1, NULL, 'Hansi', 'Liyanapathirana', 'Female', 23, 'hansini99navodya@gmail.com', '0764909731', NULL, NULL, 1, 0, 0, 3, NULL, 'uploads/IMG-20240102-WA0015.jpg', NULL, '1999'),
(2, NULL, 'Nimesh', 'Dilhara', 'Male', 23, 'nimeshdilhara2001@gmail.com', '0752438680', NULL, NULL, 1, 0, 0, 1, NULL, 'uploads/owner.jpg', NULL, '0606'),
(3, NULL, 'Dhanushi', 'Maduhansi', 'Female', 25, 'dhanushimadushansi776@gmail.com', '0719662627', NULL, NULL, 1, 0, 0, 1, NULL, 'uploads/IMG-20240610-WA0004.jpg', NULL, '0606'),
(4, NULL, 'Anjalee', 'Himalki', 'Female', 25, 'anjaleehimalki@gmail.com', '0705123746', NULL, NULL, 0, 1, 0, 1, NULL, 'uploads/WhatsApp Image 2024-07-28 at 10.44.42_144f117d.jpg', NULL, '0256');

-- --------------------------------------------------------

--
-- Table structure for table `weekly_meal_plan`
--

CREATE TABLE `weekly_meal_plan` (
  `w_plan_id` int(11) NOT NULL,
  `plan_name` varchar(100) DEFAULT NULL,
  `plan_details` text DEFAULT NULL,
  `meal_image` varchar(100) DEFAULT NULL,
  `plan_type` varchar(100) DEFAULT NULL,
  `day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') DEFAULT NULL,
  `meal_time` enum('breakfast','lunch','dinner') DEFAULT NULL,
  `meal_preference` enum('vegan','nonvegan') DEFAULT NULL,
  `nutrition_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`nutrition_values`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Dumping data for table `weekly_meal_plan`
--

INSERT INTO `weekly_meal_plan` (`w_plan_id`, `plan_name`, `plan_details`, `meal_image`, `plan_type`, `day`, `meal_time`, `meal_preference`, `nutrition_values`) VALUES
(2, 'Oats with milk ', 'A heart-healthy start with fiber-rich oats and antioxidants from berries.', 'uploads/Picture1.png', 'Combo Plan', 'Monday', 'breakfast', 'vegan', '100'),
(3, 'steamed vegetables.', 'High in fiber and low in sugar to maintain blood sugar levels.', 'uploads/Picture7.png', 'Combo Plan', 'Tuesday', 'breakfast', 'nonvegan', '200'),
(4, 'Vegetable omelette ', 'Protein-packed breakfast with essential nutrients from vegetables.', 'uploads/Picture3.png', 'Combo Plan', 'Wednesday', 'breakfast', 'nonvegan', '100'),
(5, ' Fresh fruit salad', 'Traditional and nutritious, providing a good balance of protein and fats.', 'uploads/Picture4.png', 'Combo Plan', 'Thursday', 'breakfast', 'vegan', '100'),
(6, 'small portion of coconut milk.', 'Traditional and nutritious, providing a good balance of protein and fats. ', 'uploads/Picture14.png', 'Combo Plan', 'Friday', 'breakfast', 'nonvegan', '200'),
(8, 'yogurt with sliced bananas ', 'Probiotic-rich yogurt with potassium from bananas and healthy fats from almonds.', 'uploads/Picture6.png', 'Combo Plan', 'Sunday', 'breakfast', 'vegan', '300'),
(9, 'Brown rice with dhal curry ', 'Whole grains and legumes provide complex carbs and protein.', 'uploads/Picture17.jpg', 'Combo Plan', 'Monday', 'lunch', 'vegan', '200'),
(10, 'Grilled chicken breast ', 'Lean protein source with a variety of vitamins from vegetables.', 'uploads/Picture2.png', 'Combo Plan', 'Tuesday', 'lunch', 'nonvegan', '100'),
(11, 'Quinoa salad with chickpeas', 'A nutrient-dense meal with fiber and healthy fats.', 'uploads/Picture8.png', 'Combo Plan', 'Wednesday', 'lunch', 'vegan', '100'),
(12, 'Fish curry ', 'Omega-3 rich fish with low-glycemic index vegetables.', 'uploads/Picture10.jpg', 'Combo Plan', 'Thursday', 'lunch', 'vegan', '100'),
(13, 'Lentil soup with whole grain bread.', 'Comforting and filling, with plenty of protein and fiber.', 'uploads/Picture11.png', 'Combo Plan', 'Friday', 'lunch', 'nonvegan', '100'),
(14, ': Tofu and vegetable curry ', 'Plant-based protein and nutrient-rich vegetables.', 'uploads/Picture12.png', 'Combo Plan', 'Saturday', 'lunch', 'vegan', '300'),
(15, 'Chicken and spinach salad ', 'A balanced meal with lean protein and iron-rich spinach.', 'uploads/Picture13.png', 'Combo Plan', 'Sunday', 'lunch', 'vegan', '300'),
(16, 'chiken with salad', 'Low in calories and high in essential nutrients.', 'uploads/3 - Copy.jpg', 'Combo Plan', 'Monday', 'dinner', 'nonvegan', '100'),
(17, 'Baked fish ', 'Light and easy to digest, with plenty of nutrients.', 'uploads/Picture18.png', 'Combo Plan', 'Tuesday', 'dinner', 'vegan', '100'),
(18, 'Stir-fried tofu with broccoli', 'A plant-based protein option with antioxidant-rich vegetables.', 'uploads/Picture7.png', 'Combo Plan', 'Wednesday', 'dinner', 'vegan', '100'),
(19, 'Stir-fried tofu with broccoli', 'Hearty and nourishing, with a good balance of protein and carbs.', 'uploads/Picture4.png', 'Combo Plan', 'Thursday', 'dinner', 'nonvegan', '100'),
(20, 'Mixed vegetable curry ', 'Traditional and satisfying, with a variety of nutrients from vegetables.', 'uploads/Picture9.png', 'Combo Plan', 'Friday', 'dinner', 'nonvegan', '300'),
(21, 'Oats with low-fat milk ', 'A heart-healthy start with fiber-rich oats and antioxidants from berries. ', 'uploads/th (2).jpg', 'Combo Plan', 'Saturday', 'dinner', 'vegan', '100'),
(22, 'Whole grain roti ', 'High in fiber and low in sugar to maintain blood sugar levels.', 'uploads/Picture11.png', 'Combo Plan', 'Sunday', 'dinner', 'nonvegan', '200'),
(23, 'Coconut Roti with Lunumiris', 'Traditional flatbread with a spicy sambol.', 'uploads/Picture1.png', 'Diabetes Free', 'Monday', 'breakfast', 'vegan', '200'),
(24, 'String Hoppers with Kiri Hodi and Pol Sambol', 'Steamed rice flour noodles with coconut milk gravy.', 'uploads/Picture12.png', 'Diabetes Free', 'Tuesday', 'breakfast', 'vegan', '100'),
(25, 'Chicken Curry with Green Beans', 'Savory curry paired with fresh vegetables.', 'uploads/Picture16.png', 'Diabetes Free', 'Monday', 'dinner', 'nonvegan', '200'),
(26, 'Hoppers with Egg and Sambol', 'Fermented rice flour bowl-shaped pancakes.', 'uploads/Picture13.png', 'Diabetes Free', 'Thursday', 'breakfast', 'vegan', '100'),
(27, 'Vegetable Fried Rice with Cashews', 'Nutty, vegetable-packed rice dish.', 'uploads/Picture19.png', 'Diabetes Free', 'Friday', 'lunch', 'vegan', '200'),
(28, 'Lentil Soup with Spinach', 'Nutritious, light, and filling soup.', 'uploads/Picture14.png', 'Diabetes Free', 'Saturday', 'lunch', 'vegan', '100'),
(29, 'Oats with Fresh Fruits and Nuts', 'Heart-healthy, high-fiber meal.', 'uploads/th (2).jpg', 'Diabetes Free', 'Sunday', 'breakfast', 'vegan', '300'),
(30, 'eggs and rice', 'Heart-healthy, high-fiber meal.', 'uploads/OIP (1).jpeg', 'Diabetes Free', 'Wednesday', 'breakfast', 'nonvegan', '100'),
(32, 'Grilled Fish with Mixed Vegetables', 'Low-fat, protein-rich dinner.', 'uploads/Picture4.png', 'Diabetes Free', 'Tuesday', 'lunch', 'vegan', '300'),
(34, 'Chickpea Curry with Red Rice', 'High-fiber, plant-based protein meal.', 'uploads/Picture6.png', 'Diabetes Free', 'Tuesday', 'dinner', 'nonvegan', '100'),
(35, 'Eggplant Moju with Chicken', 'Tangy vegetable dish paired with protein.', 'uploads/OIP (1).jpeg', 'diabetic_free', 'Wednesday', 'lunch', 'nonvegan', '100'),
(37, 'chiken with salad', 'Tangy vegetable dish paired with protein.', 'uploads/Picture5.png', 'Diabetes Free', 'Monday', 'lunch', 'nonvegan', '100'),
(38, 'Fish Curry with String Beans', 'Lean protein with nutrient-rich beans.', 'uploads/Picture7.png', 'Diabetes Free', 'Wednesday', 'dinner', 'nonvegan', '100'),
(39, 'Cauliflower Rice with Curry', ' Low-carb alternative with a  curry.', 'uploads/Picture8.png', 'Diabetes Free', 'Wednesday', 'lunch', 'nonvegan', '100'),
(41, 'Paneer ', 'High-protein', 'uploads/Picture8.png', 'Diabetes Free', 'Thursday', 'dinner', 'vegan', '100'),
(42, ' yogurt with strawberries and chia seeds', 'High-fiber', 'uploads/th (2).jpg', 'Diabetes Free', 'Friday', 'breakfast', 'vegan', '100'),
(43, 'Mung Bean Porridge', 'Protein-rich', 'uploads/Picture14.png', 'Diabetes Free', 'Thursday', 'lunch', 'vegan', '200'),
(44, 'eggs and rice', 'high-fiber meal', 'uploads/OIP (1).jpeg', 'Diabetes Free', 'Friday', 'dinner', 'vegan', '200'),
(47, 'tofu with broccoli', 'Nutritious', 'uploads/Picture3.png', 'Diabetes Free', 'Saturday', 'breakfast', 'vegan', '100'),
(48, 'sandwitch and banana', 'heart-healthy ', 'uploads/download.jpeg', 'Diabetes Free', 'Sunday', 'dinner', 'vegan', '200'),
(49, 'Fish Ambul Thiyal with Vegetables', 'Protein-rich', 'uploads/th (3).jpeg', 'Diabetes Free', 'Sunday', 'lunch', 'vegan', '100'),
(50, 'yogurt with strawberries', 'Healthy, low-GI', 'uploads/th (1).jpeg', 'High blood pressure Free', 'Monday', 'breakfast', 'vegan', '100'),
(51, 'eggs and rice', 'healthy for good', 'uploads/OIP (1).jpeg', 'High blood pressure Free', 'Monday', 'lunch', 'nonvegan', '100'),
(52, 'Rice and curry', 'Healthy, low-GI', 'uploads/WhatsApp Image 2024-07-26 at 15.56.56_0ba1b790.jpg', 'High blood pressure Free', 'Monday', 'dinner', 'vegan', '200'),
(53, 'sandwitch and banana', 'It is rich in vitamins, minerals, and fiber', 'uploads/download.jpeg', 'High blood pressure Free', 'Tuesday', 'breakfast', 'vegan', '200'),
(55, 'eggs and rice', 'Balanced, nutrient-dense,', 'uploads/OIP (1).jpeg', 'High blood pressure Free', 'Tuesday', 'lunch', 'nonvegan', '200'),
(56, ' Kurakkan ', 'Healthy, low-GI, fiber-rich breakfast option', 'uploads/WhatsApp Image 2024-07-26 at 15.56.56_2f6add0e.jpg', 'High blood pressure Free', 'Tuesday', 'dinner', 'vegan', '100'),
(57, 'Coconut Roti with Lunumiris', 'Traditional flatbread with a spicy sambol.', 'uploads/Picture1.png', 'High blood pressure Free', 'Wednesday', 'breakfast', 'vegan', '300'),
(58, 'String Hoppers with Kiri Hodi ', 'Steamed rice flour noodles good for helath', 'uploads/Picture2.png', 'High blood pressure Free', 'Wednesday', 'lunch', 'vegan', '100'),
(59, 'Chicken Curry with Green Beans', 'Savory curry paired with fresh vegetables.', 'uploads/Picture20.png', 'High blood pressure Free', 'Wednesday', 'dinner', 'nonvegan', '400'),
(60, 'Hoppers with Egg', ' rice flour bowl-shaped pancakes.', 'uploads/Picture13.png', 'High blood pressure Free', 'Thursday', 'breakfast', 'nonvegan', '100'),
(61, 'Vegetable Fried Rice ', ' vegetable-packed rice dish.', 'uploads/Picture17.jpg', 'High blood pressure Free', 'Thursday', 'lunch', 'nonvegan', '100'),
(62, 'Lentil Soup ', 'Nutritious, light, and filling soup.', 'uploads/Picture14.png', 'High blood pressure Free', 'Thursday', 'dinner', 'vegan', '300'),
(63, 'Jackfruit (Kos) Curry with Brown Rice', ' curry with nutrient-dense rice.', 'uploads/Picture9.png', 'High blood pressure Free', 'Friday', 'breakfast', 'vegan', '100'),
(64, 'Chickpea Curry with Red Rice', 'Protein-rich, fiber-packed lunch.', 'uploads/th (4).jpeg', 'High blood pressure Free', 'Friday', 'lunch', 'vegan', '200'),
(65, 'Eggplant Moju with Chicken', 'Tangy vegetable dish paired with protein.', 'uploads/Picture6.png', 'High blood pressure Free', 'Friday', 'dinner', 'vegan', '100'),
(66, 'Avocado with Boiled Egg', 'Healthy fats and protein-packed start.', 'uploads/Picture8.png', 'High blood pressure Free', 'Saturday', 'breakfast', 'vegan', '100'),
(68, 'yogurt with strawberries', 'Low-carb alternative with a protein', 'uploads/th (2).jpg', 'High blood pressure Free', 'Saturday', 'dinner', 'vegan', '300'),
(70, 'Cauliflower Rice with Lentil Curry', 'Low-carb alternative with a protein-rich curry.', 'uploads/Picture1.png', 'High blood pressure Free', 'Sunday', 'lunch', 'vegan', '500'),
(71, 'chiken with salad', 'Savory curry paired with fresh vegetables.', 'uploads/Picture9.png', 'High blood pressure Free', 'Sunday', 'dinner', 'vegan', '300'),
(73, 'Rice and curry', 'Protein-rich', 'uploads/WhatsApp Image 2024-07-26 at 15.56.56_0ba1b790.jpg', 'High blood pressure Free', 'Saturday', 'lunch', 'vegan', '300'),
(74, 'Kurakkan', ' Healthy, low-GI, ', 'uploads/WhatsApp Image 2024-07-26 at 15.56.56_2f6add0e.jpg', 'High blood pressure Free', 'Sunday', 'breakfast', 'vegan', '100');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`chat_id`),
  ADD KEY `consultation_id` (`consultation_id`);

--
-- Indexes for table `consultant`
--
ALTER TABLE `consultant`
  ADD PRIMARY KEY (`consultant_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`consultation_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `consultant_id` (`consultant_id`);

--
-- Indexes for table `daily_meal_plan`
--
ALTER TABLE `daily_meal_plan`
  ADD PRIMARY KEY (`d_plan_id`);

--
-- Indexes for table `diet_plan`
--
ALTER TABLE `diet_plan`
  ADD PRIMARY KEY (`diet_plan_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `education_material`
--
ALTER TABLE `education_material`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `weekly_meal_plan`
--
ALTER TABLE `weekly_meal_plan`
  ADD PRIMARY KEY (`w_plan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `consultant`
--
ALTER TABLE `consultant`
  MODIFY `consultant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `consultation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `daily_meal_plan`
--
ALTER TABLE `daily_meal_plan`
  MODIFY `d_plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `diet_plan`
--
ALTER TABLE `diet_plan`
  MODIFY `diet_plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `education_material`
--
ALTER TABLE `education_material`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `weekly_meal_plan`
--
ALTER TABLE `weekly_meal_plan`
  MODIFY `w_plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`consultation_id`) REFERENCES `consultation` (`consultation_id`);

--
-- Constraints for table `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `consultation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `consultation_ibfk_2` FOREIGN KEY (`consultant_id`) REFERENCES `consultant` (`consultant_id`);

--
-- Constraints for table `diet_plan`
--
ALTER TABLE `diet_plan`
  ADD CONSTRAINT `diet_plan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
