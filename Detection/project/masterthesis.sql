-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2023 at 01:26 AM
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
  `time` varchar(24) NOT NULL,
  `reportid` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `captured_plates`
--

INSERT INTO `captured_plates` (`plate_number`, `Plate_type`, `plate_color`, `location`, `time`, `reportid`) VALUES
('A1357', 'Standard', 'Blue', 'Beirut', '00:05:22.540215 2023-03-', 15);

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
  `path` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flagged_plates`
--

INSERT INTO `flagged_plates` (`plate_number`, `plate_type`, `plate_color`, `Reason`, `id`, `spotted`, `path`) VALUES
('A1357', 'Standard', 'Blue', 'Stolen', 1, NULL, NULL),
('JKL789', 'Standard', 'green', 'test2', 2, 0, '');

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
('A1357', 'Standard', 'Blue', 1),
('XYZ456', 'Personalized', 'Red', 2),
('JKL789', 'Standard', 'Green', 3),
('DEF246', 'Personalized', 'Yellow', 4),
('GHI135', 'Standard', 'White', 5),
('MNO802', 'Personalized', 'Black', 6),
('PQR946', 'Standard', 'Silver', 7),
('STU365', 'Personalized', 'Gold', 8),
('VWX579', 'Standard', 'Orange', 9),
('YZA702', 'Personalized', 'Purple', 10);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `name` char(20) NOT NULL,
  `last_name` char(20) NOT NULL,
  `plate_number` char(20) NOT NULL,
  `civil_id` int(20) NOT NULL,
  `location` char(20) NOT NULL,
  `time` varchar(26) NOT NULL,
  `reason` text NOT NULL,
  `user_id` int(20) NOT NULL,
  `reportid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`name`, `last_name`, `plate_number`, `civil_id`, `location`, `time`, `reason`, `user_id`, `reportid`) VALUES
('zeina', 'muslimani', 'A1357', 343, 'Tyre', '00:05:22.540215 2023-03-20', 'stolen', 2, 15),
('zeina', 'muslimani', 'A1357', 343, 'Tyre', '00:05:22.540215 2023-03-20', 'stolen', 1, 16),
('zeina', 'muslimani', 'A1357', 343, 'Tyre', '00:05:22.540215 2023-03-20', 'stolen', 2, 18);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `phone` int(20) NOT NULL,
  `id` int(11) NOT NULL,
  `usertype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `last_name`, `email`, `password`, `username`, `phone`, `id`, `usertype`) VALUES
('John', 'Doe', 'johndoe@example.com', 'password123', 'johndoe', 123, 1, 'user'),
('Jane', 'Smith', 'janesmith@example.co', 'password456', 'janesmith', 555, 2, 'admin'),
('Bob', 'Johnson', 'bobjohnson@example.c', 'password789', 'bobjohnson', 987, 3, 'user'),
('Alice', 'Brown', 'alicebrown@example.c', 'passwordabc', 'alicebrown', 555, 4, 'user'),
('Tom', 'Wilson', 'tomwilson@example.co', 'passwordxyz', 'tomwilson', 555, 5, 'admin');

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
('qwe', 'qwe', 'qwe', 'qwe', 'qew', 1);

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
('zeina', 'muslimani', 'sahhgad', 'gjhaghgdghjgd', '20/3/2000', 78778, '35346', 35, 343, 1),
('John', 'Doe', 'Smith', '123 Main St', '1980-01-01', 555, 'New York', 12345, 67890, 2),
('Mary', 'Smith', 'Johnson', '456 Oak St', '1990-02-02', 555, 'Los Angeles', 23456, 78901, 3),
('David', 'Lee', 'Kim', '789 Maple Ave', '1985-03-03', 555, 'Chicago', 34567, 89012, 4),
('Emily', 'Garcia', 'Rodriguez', '1010 Pine St', '1995-04-04', 555, 'Houston', 45678, 90123, 5),
('Michael', 'Brown', 'Davis', '1313 Elm St', '1975-05-05', 555, 'Miami', 56789, 1234, 6),
('Jessica', 'Wilson', 'Taylor', '1414 Oak St', '1983-06-06', 555, 'Seattle', 67890, 12345, 7),
('Kevin', 'Harris', 'Turner', '1616 Walnut St', '1991-07-07', 555, 'San Francisco', 78901, 23456, 8),
('Jennifer', 'Clark', 'Parker', '1818 Maple Ave', '1988-08-08', 555, 'Denver', 89012, 34567, 9),
('Brian', 'Allen', 'Adams', '2020 Pine St', '1977-09-09', 555, 'Boston', 90123, 45678, 10),
('Stephanie', 'King', 'Carter', '2222 Elm St', '1993-10-10', 555, 'Washington DC', 1234, 56789, 11),
('hussein', 'd', 's', 'tyre', '14-12-97', 7077, 'tyr', 30, 4, 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `captured_plates`
--
ALTER TABLE `captured_plates`
  ADD PRIMARY KEY (`reportid`),
  ADD KEY `reportid` (`reportid`);

--
-- Indexes for table `flagged_plates`
--
ALTER TABLE `flagged_plates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plate_details`
--
ALTER TABLE `plate_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`reportid`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_details`
--
ALTER TABLE `vehicle_details`
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
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `reportid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vehicle_owner`
--
ALTER TABLE `vehicle_owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `captured_plates`
--
ALTER TABLE `captured_plates`
  ADD CONSTRAINT `captured_plates_ibfk_1` FOREIGN KEY (`reportid`) REFERENCES `report` (`reportid`);

--
-- Constraints for table `flagged_plates`
--
ALTER TABLE `flagged_plates`
  ADD CONSTRAINT `flagged_plates_ibfk_1` FOREIGN KEY (`id`) REFERENCES `plate_details` (`id`);

--
-- Constraints for table `plate_details`
--
ALTER TABLE `plate_details`
  ADD CONSTRAINT `plate_details_ibfk_1` FOREIGN KEY (`id`) REFERENCES `vehicle_owner` (`id`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `vehicle_details`
--
ALTER TABLE `vehicle_details`
  ADD CONSTRAINT `vehicle_details_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `vehicle_owner` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
