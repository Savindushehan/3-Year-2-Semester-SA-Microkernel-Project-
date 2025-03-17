-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2025 at 02:49 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`) VALUES
(1, 'Aplha1');

-- --------------------------------------------------------

--
-- Stand-in structure for view `s`
-- (See below for the actual view)
--
CREATE TABLE `s` (
`item_id` int(11)
,`item_name` varchar(255)
,`category` varchar(100)
,`quantity` int(11)
,`unit_price` decimal(10,2)
,`supplier` varchar(255)
,`expiry_date` date
,`last_updated` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ss`
-- (See below for the actual view)
--
CREATE TABLE `ss` (
`item_id` int(11)
,`item_name` varchar(255)
,`category` varchar(100)
,`quantity` int(11)
,`unit_price` decimal(10,2)
,`supplier` varchar(255)
,`expiry_date` date
,`last_updated` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `supplier` varchar(255) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`item_id`, `item_name`, `category`, `quantity`, `unit_price`, `supplier`, `expiry_date`, `last_updated`) VALUES
(10, 'Paracetamol', 'Painkillers', 90, 20.00, '', '2025-04-03', '2025-03-15 23:49:06'),
(11, 'Gauze Bandage', 'Wound Care', 100, 25.00, '', '2025-06-01', '2025-03-10 18:30:00'),
(12, 'TEST', 'TEST', 50, 122.00, 'Medikit', '2025-03-13', '2025-03-23 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `stock_shares`
--

CREATE TABLE `stock_shares` (
  `stockshare_id` int(11) NOT NULL,
  `division` varchar(255) NOT NULL,
  `ward_id` varchar(50) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `provide_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_shares`
--

INSERT INTO `stock_shares` (`stockshare_id`, `division`, `ward_id`, `item_name`, `category`, `quantity`, `provide_date`) VALUES
(16, 'D1', 'W1', 'Paracetamol', 'Painkillers', 100, '2025-03-02'),
(17, 'D2', 'W2', 'Gauze Bandage', 'Wound Care', 51, '2025-02-09'),
(18, 'asdf', 'asf', 'Gauze Bandage', 'Wound Care', 10, '2025-03-20'),
(20, 'Aplha1', 'W1', 'Paracetamol', 'Painkillers', 10, '2025-03-16'),
(21, 'Aplha1', 'W3', 'Paracetamol', 'Painkillers', 10, '2025-03-16'),
(22, 'Aplha1', 'W1', 'Gauze Bandage', 'Wound Care', 20, '2025-03-16'),
(23, 'Aplha1', 'W4', 'Paracetamol', 'Painkillers', 10, '2025-03-16');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_code` varchar(255) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `companyID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_code`, `supplier_name`, `phone`, `address`, `companyID`) VALUES
(1, 'Medikit', 'Medi', '076076214', 'Colombo', 'Mdei'),
(2, 'TEST', 'TEST', '1234569870', 'TEST', 'TEST'),
(3, 'FH', 'FlashHealth', '0123456987', 'Colombo', 'FH');

-- --------------------------------------------------------

--
-- Structure for view `s`
--
DROP TABLE IF EXISTS `s`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `s`  AS SELECT `stocks`.`item_id` AS `item_id`, `stocks`.`item_name` AS `item_name`, `stocks`.`category` AS `category`, `stocks`.`quantity` AS `quantity`, `stocks`.`unit_price` AS `unit_price`, `stocks`.`supplier` AS `supplier`, `stocks`.`expiry_date` AS `expiry_date`, `stocks`.`last_updated` AS `last_updated` FROM `stocks` ;

-- --------------------------------------------------------

--
-- Structure for view `ss`
--
DROP TABLE IF EXISTS `ss`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ss`  AS SELECT `stocks`.`item_id` AS `item_id`, `stocks`.`item_name` AS `item_name`, `stocks`.`category` AS `category`, `stocks`.`quantity` AS `quantity`, `stocks`.`unit_price` AS `unit_price`, `stocks`.`supplier` AS `supplier`, `stocks`.`expiry_date` AS `expiry_date`, `stocks`.`last_updated` AS `last_updated` FROM `stocks` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `stock_shares`
--
ALTER TABLE `stock_shares`
  ADD PRIMARY KEY (`stockshare_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `stock_shares`
--
ALTER TABLE `stock_shares`
  MODIFY `stockshare_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
