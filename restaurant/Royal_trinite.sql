-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2022 at 03:47 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `royal trintite`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `BILL_NO` int(11) NOT NULL,
  `PRICE` int(11) DEFAULT NULL,
  `ORDER_DTL` varchar(30) DEFAULT NULL,
  `CUS_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`BILL_NO`, `PRICE`, `ORDER_DTL`, `CUS_ID`) VALUES
(11, 150, 'TEHARI', 221020),
(12, 400, 'BEEF BURGER', 221021),
(13, 1050, 'SIZZLING PRAWN', 221023),
(14, 1050, 'SIZZLING PRAWN', 221019),
(15, 100, 'MASALA DOSA', 221024),
(16, 400, 'CHICKEN PARM', 221025);

-- --------------------------------------------------------

--
-- Table structure for table `bill_dtls`
--

CREATE TABLE `bill_dtls` (
  `PRICE` varchar(15) NOT NULL,
  `VAT` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_dtls`
--

INSERT INTO `bill_dtls` (`PRICE`, `VAT`) VALUES
('20TK', '3TK'),
('400TK', '60TK'),
('150TK', '22.5TK'),
('100TK', '15TK');

-- --------------------------------------------------------

--
-- Table structure for table `chef`
--

CREATE TABLE `chef` (
  `CHEF_ID` int(11) NOT NULL,
  `CHEF_NAME` varchar(30) DEFAULT NULL,
  `ORDER_NO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chef`
--

INSERT INTO `chef` (`CHEF_ID`, `CHEF_NAME`, `ORDER_NO`) VALUES
(201, 'TONNY ', 1),
(201, 'TONNY', 2),
(205, 'KHALID', 3),
(205, 'KHALID', 4),
(205, 'KHALID', 5),
(207, 'BONY', 6);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CUSID` int(11) NOT NULL,
  `CUSNAME` varchar(20) DEFAULT NULL,
  `CNTNO` int(11) DEFAULT NULL,
  `RID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CUSID`, `CUSNAME`, `CNTNO`, `RID`) VALUES
(221019, 'SAIF', 70512, 1157),
(221020, 'SHARIF', 75510, 1157),
(221021, 'HASAN', 16518, 1157),
(221022, 'SAYED', 17519, 1157),
(221023, 'ANIK', 11519, 1157),
(221024, 'ROKON', 16441, 1157),
(221025, 'SADIA', 15851, 1157);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `FOOD_NO` int(11) NOT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(30) DEFAULT NULL,
  `ORDER_NO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`FOOD_NO`, `QUANTITY`, `DESCRIPTION`, `ORDER_NO`) VALUES
(111, 1, 'CHICKEN PARM', 5),
(152, 1, 'MASALA DOSA', 4),
(501, 2, 'SIZZLING PRAWN', 6),
(510, 1, 'TEHARI', 1),
(600, 1, 'BEEF BURGER', 2),
(601, 3, 'COLD DRINKS', 3);

-- --------------------------------------------------------

--
-- Table structure for table `food_details`
--

CREATE TABLE `food_details` (
  `FOOD_NO` int(11) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `PRICE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food_details`
--

INSERT INTO `food_details` (`FOOD_NO`, `QUANTITY`, `PRICE`) VALUES
(601, 1, 20),
(501, 1, 1050),
(600, 1, 400),
(510, 1, 150),
(152, 1, 100),
(111, 1, 400);

-- --------------------------------------------------------

--
-- Table structure for table `orderr`
--

CREATE TABLE `orderr` (
  `ORDER_NO` int(11) NOT NULL,
  `NO_OF_ITEM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderr`
--

INSERT INTO `orderr` (`ORDER_NO`, `NO_OF_ITEM`) VALUES
(1, 3),
(2, 1),
(3, 5),
(4, 1),
(5, 1),
(6, 10);

-- --------------------------------------------------------

--
-- Table structure for table `order_info`
--

CREATE TABLE `order_info` (
  `NO_OF_ITEM` int(11) NOT NULL,
  `OREDER_TIME` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_info`
--

INSERT INTO `order_info` (`NO_OF_ITEM`, `OREDER_TIME`) VALUES
(1, '10 MINS'),
(2, '10 MINS'),
(3, '20 MINS'),
(4, '15 MINS'),
(5, '25 MINS'),
(10, '35 MINS');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `RID` int(11) NOT NULL,
  `RNAME` varchar(20) DEFAULT NULL,
  `CONATACTNO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`RID`, `RNAME`, `CONATACTNO`) VALUES
(1076, 'RADHUNI', 81522),
(1102, 'MAMA-VAGNI', 55079),
(1157, 'LA BAMBA', 73582),
(3026, 'FOOD CLUB', 71552),
(8413, 'TAKEOUT', 85832);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_info`
--

CREATE TABLE `restaurant_info` (
  `RNAME` varchar(30) NOT NULL,
  `ADDRESS` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurant_info`
--

INSERT INTO `restaurant_info` (`RNAME`, `ADDRESS`) VALUES
('FOOD CLUB ', 'NAWABGANJ'),
('LA BAMBA ', 'UTTARA'),
('MAMA-VAGNE', 'RAJSHAHI'),
('RADHUNI', 'NAWABGANJ'),
('TAKEOUT', 'BANANI');

-- --------------------------------------------------------

--
-- Table structure for table `waiter`
--

CREATE TABLE `waiter` (
  `WID` int(11) NOT NULL,
  `WNAME` varchar(30) DEFAULT NULL,
  `CUSID` int(11) NOT NULL,
  `ORDER_NO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `waiter`
--

INSERT INTO `waiter` (`WID`, `WNAME`, `CUSID`, `ORDER_NO`) VALUES
(101, 'PAUL', 221023, 6),
(103, 'SAKIL', 221020, 1),
(104, 'SAKILA', 221021, 2),
(110, 'JAMIL', 221022, 3),
(111, 'PAUL', 221024, 4),
(119, 'ASAD', 221025, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`BILL_NO`),
  ADD KEY `CS_PK` (`CUS_ID`);

--
-- Indexes for table `chef`
--
ALTER TABLE `chef`
  ADD KEY `FOR_PK` (`ORDER_NO`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CUSID`),
  ADD KEY `FK_PK` (`RID`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`FOOD_NO`),
  ADD KEY `FRD_PK` (`ORDER_NO`);

--
-- Indexes for table `food_details`
--
ALTER TABLE `food_details`
  ADD KEY `FD_PK` (`FOOD_NO`);

--
-- Indexes for table `orderr`
--
ALTER TABLE `orderr`
  ADD PRIMARY KEY (`ORDER_NO`);

--
-- Indexes for table `order_info`
--
ALTER TABLE `order_info`
  ADD PRIMARY KEY (`NO_OF_ITEM`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`RID`);

--
-- Indexes for table `restaurant_info`
--
ALTER TABLE `restaurant_info`
  ADD PRIMARY KEY (`RNAME`);

--
-- Indexes for table `waiter`
--
ALTER TABLE `waiter`
  ADD PRIMARY KEY (`WID`),
  ADD KEY `CK_PK` (`CUSID`),
  ADD KEY `OK_PK` (`ORDER_NO`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `CS_PK` FOREIGN KEY (`CUS_ID`) REFERENCES `customer` (`CUSID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chef`
--
ALTER TABLE `chef`
  ADD CONSTRAINT `FOR_PK` FOREIGN KEY (`ORDER_NO`) REFERENCES `orderr` (`ORDER_NO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_PK` FOREIGN KEY (`RID`) REFERENCES `restaurant` (`RID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `FRD_PK` FOREIGN KEY (`ORDER_NO`) REFERENCES `orderr` (`ORDER_NO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `food_details`
--
ALTER TABLE `food_details`
  ADD CONSTRAINT `FD_PK` FOREIGN KEY (`FOOD_NO`) REFERENCES `food` (`FOOD_NO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `waiter`
--
ALTER TABLE `waiter`
  ADD CONSTRAINT `CK_PK` FOREIGN KEY (`CUSID`) REFERENCES `customer` (`CUSID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `OK_PK` FOREIGN KEY (`ORDER_NO`) REFERENCES `orderr` (`ORDER_NO`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
