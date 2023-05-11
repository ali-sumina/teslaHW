-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 11, 2023 at 12:28 AM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teslahw`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addProduct` (IN `name` VARCHAR(64), IN `rangenum` INT(12), IN `topspeed` INT(12), IN `peakpower` INT(12))   INSERT INTO cars (`Name`, `Range`, `TopSpeed`, `PeakPower`)
VALUES (name, rangenum, topspeed, peakpower)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteProduct` (IN `id` INT(8))   DELETE FROM cars
WHERE cars.id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getProducts` ()   SELECT * FROM cars$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductsByID` (IN `id` INT(8))   SELECT * FROM cars
WHERE cars.id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateProduct` (IN `id` INT(8), IN `name` VARCHAR(64))   UPDATE cars
SET cars.Name = name
WHERE cars.id = id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(8) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Range` int(12) NOT NULL,
  `TopSpeed` int(12) NOT NULL,
  `PeakPower` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `Name`, `Range`, `TopSpeed`, `PeakPower`) VALUES
(1, 'Tesla Model S', 637, 322, 1020),
(2, 'Model 3', 576, 420, 1070),
(3, 'Super Exceptional Model', 642, 330, 1040);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
