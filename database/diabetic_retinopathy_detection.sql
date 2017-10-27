-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 27, 2017 at 11:32 AM
-- Server version: 5.7.20-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diabetic_retinopathy_detection`
--

-- --------------------------------------------------------

--
-- Table structure for table `patient_details`
--

CREATE TABLE `patient_details` (
  `patient_id` int(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(4) NOT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `result` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_details`
--

INSERT INTO `patient_details` (`patient_id`, `name`, `age`, `mobile_no`, `address`, `result`) VALUES
(1, 'Abhishek Salwan', 20, '9855512345', 'lovley sweets', 'no'),
(2, 'Aaditya', 20, '9855512345', 'beghar', 'yes'),
(6, 'mj3ller', 30, '1324567891', 'amritsar', NULL),
(7, 'kamlesh', 13, '9872912345', 'dhudhun', NULL),
(8, 'ramu', 14, '9872912345', 'amritsar', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `scan_details`
--

CREATE TABLE `scan_details` (
  `patient_id` int(4) NOT NULL,
  `scan_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patient_details`
--
ALTER TABLE `patient_details`
  ADD PRIMARY KEY (`patient_id`),
  ADD UNIQUE KEY `sno_2` (`patient_id`),
  ADD KEY `sno` (`patient_id`);

--
-- Indexes for table `scan_details`
--
ALTER TABLE `scan_details`
  ADD PRIMARY KEY (`patient_id`,`scan_id`),
  ADD KEY `patient_id` (`patient_id`,`scan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patient_details`
--
ALTER TABLE `patient_details`
  MODIFY `patient_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `scan_details`
--
ALTER TABLE `scan_details`
  ADD CONSTRAINT `scan_details_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient_details` (`patient_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
