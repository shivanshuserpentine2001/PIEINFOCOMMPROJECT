-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2021 at 03:40 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `s_jewerlyshoppe`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `CUSTOMERID` int(11) NOT NULL,
  `FEEDBACK` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderdata`
--

CREATE TABLE `orderdata` (
  `CUSTOMERNO` int(11) NOT NULL,
  `ORDERNO` mediumint(5) NOT NULL,
  `NETVAL` int(11) NOT NULL,
  `NETQNT` smallint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdata`
--

INSERT INTO `orderdata` (`CUSTOMERNO`, `ORDERNO`, `NETVAL`, `NETQNT`) VALUES
(8, 7669, 33023, 1);

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `FULLNAME` varchar(21) NOT NULL,
  `USERID` varchar(21) NOT NULL,
  `MOBILENO` bigint(10) NOT NULL,
  `EMAIL` varchar(25) NOT NULL,
  `PASSWORD` varchar(21) NOT NULL,
  `CUSTOMERNO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`FULLNAME`, `USERID`, `MOBILENO`, `EMAIL`, `PASSWORD`, `CUSTOMERNO`) VALUES
('MONIKA', 'MONA', 9624405565, 'moniak@gmail.com', 'm1', 8);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `STATUS` enum('DISPACHED','NOT-DISPACHED','REFUND','DELIVERED') NOT NULL DEFAULT 'NOT-DISPACHED',
  `ORDERID` mediumint(5) NOT NULL,
  `CUSTOMERID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`STATUS`, `ORDERID`, `CUSTOMERID`) VALUES
('DELIVERED', 7669, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`CUSTOMERID`);

--
-- Indexes for table `orderdata`
--
ALTER TABLE `orderdata`
  ADD PRIMARY KEY (`ORDERNO`),
  ADD KEY `FK` (`CUSTOMERNO`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`CUSTOMERNO`),
  ADD UNIQUE KEY `USERID` (`USERID`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`),
  ADD UNIQUE KEY `MOBILENO` (`MOBILENO`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD KEY `FK2` (`CUSTOMERID`),
  ADD KEY `FK3` (`ORDERID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `CUSTOMERNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `FK4` FOREIGN KEY (`CUSTOMERID`) REFERENCES `registration` (`CUSTOMERNO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderdata`
--
ALTER TABLE `orderdata`
  ADD CONSTRAINT `FK` FOREIGN KEY (`CUSTOMERNO`) REFERENCES `registration` (`CUSTOMERNO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `FK2` FOREIGN KEY (`CUSTOMERID`) REFERENCES `orderdata` (`CUSTOMERNO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK3` FOREIGN KEY (`ORDERID`) REFERENCES `orderdata` (`ORDERNO`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
