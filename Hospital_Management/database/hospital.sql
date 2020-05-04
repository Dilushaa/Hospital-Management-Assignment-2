-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2020 at 06:57 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hospitalID` int(11) NOT NULL,
  `mohCode` varchar(30) NOT NULL,
  `hospitalName` varchar(50) NOT NULL,
  `emailAddress` varchar(40) NOT NULL,
  `managerName` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `telephoneNo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hospitalID`, `mohCode`, `hospitalName`, `emailAddress`, `managerName`, `address`, `telephoneNo`) VALUES
(2, 'moh1011', 'heladiwaHoapital', 'heladiwahhhhh@gmail.com', 'mr.suriyaarachchi', 'akuressaqwee', '0412249993'),
(51, 'moh2020', 'Lanka', 'lanka@gmail.com', 'mr.jayasuriya', 'colombo 7', '0112334455'),
(52, 'moh2021', 'Durdans', 'durdans@gmail.com', 'mr.jayawardhana', 'borella,rajagiriya', '0115667788'),
(53, 'moh2022', 'Navaloka', 'navaloka@gmail.com', 'Mrs.ashanthi', 'kaduewla,malabe', '0119887766'),
(54, 'moh2023', 'Asiri', 'asiri@gmail.com', 'Mr.kandambi', 'colombo 9', '0112314151'),
(55, 'moh2024', 'NevilFernandoo', 'nevil@gmail.com', 'Mr.nevil', 'kumara mavathaaa', '0118929394'),
(56, 'moh2025', 'Ninewales', 'ninewales@gmail.com', 'MR.fernando', 'colombo', '0118765432'),
(57, 'moh2026', 'Central', 'central@gmail.com', 'Mr.ashen', 'colombo 5', '0119877665'),
(58, 'moh2027', 'Southern', 'southern@gmail.com', 'Mr.Yashan', 'kandy', '0392387457'),
(59, 'moh2028', 'Mohotti', 'mohotti@gmail.com', 'Mr.Mohotti', 'Matara', '0413427557'),
(60, 'moh2029', 'Medihouse new', 'medihouse@gmail.com', 'MR.John', 'matara', '0415678457');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospitalID`),
  ADD UNIQUE KEY `mohCode` (`mohCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hospitalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
