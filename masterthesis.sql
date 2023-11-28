-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2023 at 12:11 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `masterthesis`
--

-- --------------------------------------------------------

--
-- Table structure for table `captured_plates`
--

CREATE TABLE `captured_plates` (
  `plate_number` varchar(24) NOT NULL,
  `Plate_type` char(20) NOT NULL,
  `plate_color` char(20) NOT NULL,
  `location` varchar(20) NOT NULL,
  `time` varchar(100) NOT NULL,
  `reportid` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `captured_plates`
--

INSERT INTO `captured_plates` (`plate_number`, `Plate_type`, `plate_color`, `location`, `time`, `reportid`) VALUES
('O8233', 'private', 'Blue', 'beirut', '22:02:21 2023-06-01', 124),
('S253523', 'priivate', 'blue', 'beirut', '22:11:07 2023-06-01', 125);

-- --------------------------------------------------------

--
-- Table structure for table `flagged_plates`
--

CREATE TABLE `flagged_plates` (
  `plate_number` char(20) NOT NULL,
  `plate_type` char(20) NOT NULL,
  `plate_color` char(20) NOT NULL,
  `Reason` text NOT NULL,
  `id` int(11) NOT NULL,
  `spotted` tinyint(1) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `Status` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flagged_plates`
--

INSERT INTO `flagged_plates` (`plate_number`, `plate_type`, `plate_color`, `Reason`, `id`, `spotted`, `path`, `Status`) VALUES
('N133204', 'Private', 'Blue', 'WANTED', 1, 1, 'img/N133204.jpg', 'denied'),
('S253523', 'Private', 'Blue', 'WANTED', 2, 1, 'img/S253523.jpg', 'approved'),
('O8233', 'Private', 'Blue', 'Stolen', 7, 1, 'img/O8233.jpg', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `plate_details`
--

CREATE TABLE `plate_details` (
  `plate_number` varchar(20) NOT NULL,
  `plate_type` varchar(20) NOT NULL,
  `plate_color` varchar(20) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plate_details`
--

INSERT INTO `plate_details` (`plate_number`, `plate_type`, `plate_color`, `id`) VALUES
('N133204', 'Private', 'Blue', 1),
('O8233', 'private', 'Blue', 7),
('S253523', 'priivate', 'blue', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(20) NOT NULL,
  `phone` int(20) NOT NULL,
  `id` int(11) NOT NULL,
  `usertype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `last_name`, `email`, `password`, `username`, `phone`, `id`, `usertype`) VALUES
('Zeina', 'Muslimani', '71830079@students.liu.edu.lb', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'zeina99', 70958450, 27, 'Officer'),
('khodor', 'Hamadi', '71530320@students.liu.edu.lb', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'khh7', 70638354, 28, 'Sergeant'),
('User1', 'user1', 'emailuser@outlook.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'user1', 1111111, 29, 'Sergeant');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_details`
--

CREATE TABLE `vehicle_details` (
  `brand` varchar(20) NOT NULL,
  `color` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `manufacture` varchar(20) NOT NULL,
  `Plate_number` varchar(20) NOT NULL,
  `ownerid` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle_details`
--

INSERT INTO `vehicle_details` (`brand`, `color`, `type`, `manufacture`, `Plate_number`, `ownerid`) VALUES
('mercedes', 'Black', 'C230', 'american', 'N133204', 1),
('BMW', 'grey', 'f10', 'germany', 'O8233', 7),
('jeep', 'black', 'cherokee', 'germany', 'S253523', 2);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_owner`
--

CREATE TABLE `vehicle_owner` (
  `name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `mother_name` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `birthday` varchar(100) NOT NULL,
  `phone` int(12) NOT NULL,
  `birthplace` varchar(20) NOT NULL,
  `personal_recnum` int(20) NOT NULL,
  `civil_id` int(20) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle_owner`
--

INSERT INTO `vehicle_owner` (`name`, `last_name`, `mother_name`, `address`, `birthday`, `phone`, `birthplace`, `personal_recnum`, `civil_id`, `id`) VALUES
('sharif', 'bazzoun', 'fatima', 'tyre', '1998', 3548795, 'tyre', 70, 144154, 1),
('Hussein', 'Ali', 'soha', 'tyre', '1997', 7145748, 'tyre', 78, 777888, 2),
('khodor', 'Hamadi', 'name', 'tyre', '1997', 7077777, 'leb', 0, 7777, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `captured_plates`
--
ALTER TABLE `captured_plates`
  ADD PRIMARY KEY (`reportid`);

--
-- Indexes for table `flagged_plates`
--
ALTER TABLE `flagged_plates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plate_details`
--
ALTER TABLE `plate_details`
  ADD PRIMARY KEY (`plate_number`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_details`
--
ALTER TABLE `vehicle_details`
  ADD PRIMARY KEY (`Plate_number`),
  ADD KEY `ownerid` (`ownerid`);

--
-- Indexes for table `vehicle_owner`
--
ALTER TABLE `vehicle_owner`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `captured_plates`
--
ALTER TABLE `captured_plates`
  MODIFY `reportid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `vehicle_owner`
--
ALTER TABLE `vehicle_owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `plate_details`
--
ALTER TABLE `plate_details`
  ADD CONSTRAINT `plate_details_ibfk_1` FOREIGN KEY (`id`) REFERENCES `vehicle_owner` (`id`);

--
-- Constraints for table `vehicle_details`
--
ALTER TABLE `vehicle_details`
  ADD CONSTRAINT `vehicle_details_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `vehicle_owner` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
