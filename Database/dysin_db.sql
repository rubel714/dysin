-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 19, 2024 at 03:59 PM
-- Server version: 10.6.19-MariaDB
-- PHP Version: 8.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dysin_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_branch`
--

CREATE TABLE `t_branch` (
  `BranchId` smallint(6) NOT NULL,
  `ClientId` smallint(6) NOT NULL,
  `BranchName` varchar(50) NOT NULL,
  `PhoneNo` varchar(30) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `BranchAddress` varchar(250) DEFAULT NULL,
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdateTs` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_branch`
--

INSERT INTO `t_branch` (`BranchId`, `ClientId`, `BranchName`, `PhoneNo`, `Email`, `BranchAddress`, `CreateTs`, `UpdateTs`) VALUES
(1, 1, 'Dysin', '', NULL, NULL, '2023-08-10 00:14:16', '2023-08-10 00:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `t_businessline`
--

CREATE TABLE `t_businessline` (
  `BusinessLineId` smallint(3) NOT NULL,
  `BusinessLineName` varchar(50) NOT NULL,
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdateTs` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_businessline`
--

INSERT INTO `t_businessline` (`BusinessLineId`, `BusinessLineName`, `CreateTs`, `UpdateTs`) VALUES
(1, 'Line 1', '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(2, 'Line 2', '2023-08-09 12:14:16', '2023-08-09 12:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `t_client`
--

CREATE TABLE `t_client` (
  `ClientId` smallint(6) NOT NULL,
  `ClientName` varchar(50) NOT NULL,
  `ClientCode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `AppName` varchar(50) NOT NULL,
  `PoweredBy` varchar(50) NOT NULL,
  `DevelopmentBy` varchar(50) NOT NULL,
  `DevelopmentByWebsite` varchar(50) DEFAULT NULL,
  `PhoneNo` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `ClientAddress` varchar(250) DEFAULT NULL,
  `ClientLogo` varchar(100) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT 1,
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdateTs` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_client`
--

INSERT INTO `t_client` (`ClientId`, `ClientName`, `ClientCode`, `AppName`, `PoweredBy`, `DevelopmentBy`, `DevelopmentByWebsite`, `PhoneNo`, `Email`, `ClientAddress`, `ClientLogo`, `IsActive`, `CreateTs`, `UpdateTs`) VALUES
(1, 'Dysin', 'NG-SSL', 'Nucleus', 'Dysin', 'Dysin', 'https://www.dysin.ng-ssl.com', '', NULL, '', NULL, 1, '2023-08-10 00:14:16', '2023-08-10 00:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `t_customer`
--

CREATE TABLE `t_customer` (
  `CustomerId` int(11) NOT NULL,
  `ClientId` smallint(6) NOT NULL,
  `CustomerCode` varchar(30) NOT NULL,
  `CustomerName` varchar(100) NOT NULL,
  `Designation` varchar(50) DEFAULT NULL COMMENT 'Customer Designation',
  `Address` varchar(250) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `ContactPhone` varchar(50) DEFAULT NULL,
  `CompanyName` varchar(50) DEFAULT NULL,
  `NatureOfBusiness` varchar(50) DEFAULT NULL,
  `CompanyEmail` varchar(50) DEFAULT NULL,
  `CompanyAddress` varchar(150) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT 1,
  `UserId` int(11) NOT NULL COMMENT 'Entry bu User Id',
  `UpdateTs` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `t_customer`
--

INSERT INTO `t_customer` (`CustomerId`, `ClientId`, `CustomerCode`, `CustomerName`, `Designation`, `Address`, `Email`, `ContactPhone`, `CompanyName`, `NatureOfBusiness`, `CompanyEmail`, `CompanyAddress`, `IsActive`, `UserId`, `UpdateTs`, `CreateTs`) VALUES
(1, 1, '2', '[Other]', NULL, 'NA', 'NA', 'NA', NULL, NULL, NULL, NULL, 1, 1, '2024-09-25 16:56:51', '2023-08-13 05:00:46'),
(2, 1, '4', 'Unilever Bangladesh Ltd.', NULL, 'Address-uni-Bangladesh', 'info@unilever.com.bd', '01712000000', NULL, NULL, NULL, NULL, 1, 1, '2024-09-25 16:56:51', '2023-08-13 05:00:46');

-- --------------------------------------------------------

--
-- Table structure for table `t_department`
--

CREATE TABLE `t_department` (
  `DepartmentId` smallint(3) NOT NULL,
  `DepartmentName` varchar(50) NOT NULL,
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdateTs` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_department`
--

INSERT INTO `t_department` (`DepartmentId`, `DepartmentName`, `CreateTs`, `UpdateTs`) VALUES
(2, 'IT', '2023-08-09 18:14:16', '2023-08-09 18:14:16'),
(3, 'Sales', '2023-08-09 18:14:16', '2023-08-09 18:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `t_designation`
--

CREATE TABLE `t_designation` (
  `DesignationId` smallint(3) NOT NULL,
  `ClientId` smallint(6) NOT NULL,
  `DesignationName` varchar(50) NOT NULL,
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdateTs` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_designation`
--

INSERT INTO `t_designation` (`DesignationId`, `ClientId`, `DesignationName`, `CreateTs`, `UpdateTs`) VALUES
(1, 1, 'Manager', '2023-08-10 00:14:16', '2023-08-10 00:14:16'),
(2, 1, 'Sales Man', '2023-08-10 00:14:16', '2023-08-10 00:14:16'),
(4, 1, 'Chairman', '2024-10-15 05:16:52', NULL),
(5, 1, 'Managing Director', '2024-10-15 05:17:09', NULL),
(6, 1, 'Director', '2024-10-15 05:17:18', NULL),
(7, 1, 'Head of Server & Network Infrastructure', '2024-10-15 05:18:02', NULL),
(8, 1, 'Head of Application Support', '2024-10-15 05:18:36', NULL),
(9, 1, 'Cook', '2024-10-15 05:19:19', NULL),
(10, 1, 'Assistant General', '2024-10-15 05:19:51', NULL),
(11, 1, 'Assistant Manager', '2024-10-15 05:20:17', NULL),
(13, 1, 'Assistant Operator', '2024-10-15 05:20:54', NULL),
(14, 1, 'Assistant Officer', '2024-10-15 05:21:55', NULL),
(15, 1, 'CoordinatorServ Ice', '2024-10-15 05:22:48', NULL),
(16, 1, 'Cowboy', '2024-10-15 05:23:01', NULL),
(17, 1, 'Data Entry Officer', '2024-10-15 05:23:17', NULL),
(18, 1, 'Delivery Man', '2024-10-15 05:25:34', NULL),
(19, 1, 'Deputy General Manager', '2024-10-15 05:26:42', NULL),
(20, 1, 'Driver', '2024-10-15 05:27:09', NULL),
(21, 1, 'Electrician', '2024-10-15 05:27:48', NULL),
(22, 1, 'Engineer', '2024-10-15 05:28:05', NULL),
(23, 1, 'Executive', '2024-10-15 05:28:13', NULL),
(24, 1, 'Executive Director (Printing)', '2024-10-15 05:28:44', NULL),
(25, 1, 'General Manager', '2024-10-15 05:28:58', NULL),
(26, 1, 'Junior Engineer', '2024-10-15 05:29:22', NULL),
(27, 1, 'Junior Technician', '2024-10-15 05:30:09', NULL),
(28, 1, 'Lab Assistant', '2024-10-15 05:30:46', NULL),
(29, 1, 'Lab Technician', '2024-10-15 05:31:02', NULL),
(31, 1, 'Officer', '2024-10-15 05:31:43', NULL),
(32, 1, 'Operator', '2024-10-15 05:31:55', NULL),
(33, 1, 'Sales Assistant', '2024-10-15 05:32:12', NULL),
(34, 1, 'Security Guard', '2024-10-15 05:32:42', NULL),
(35, 1, 'Senior Electrician', '2024-10-15 05:32:57', NULL),
(36, 1, 'Senior General Manager', '2024-10-15 05:33:13', NULL),
(37, 1, 'Senior Lab Assistant', '2024-10-15 05:33:34', NULL),
(38, 1, 'Senior Manager', '2024-10-15 05:33:54', NULL),
(39, 1, 'Senior Officer', '2024-10-15 05:34:07', NULL),
(40, 1, 'Senior operator', '2024-10-15 05:34:29', NULL),
(41, 1, 'Senior Plumber', '2024-10-15 05:34:43', NULL),
(42, 1, 'Senior Service Engineer', '2024-10-15 05:34:59', NULL),
(43, 1, 'Senior Site Engineer', '2024-10-15 05:35:22', NULL),
(44, 1, 'Service Engineer', '2024-10-15 05:35:44', NULL),
(45, 1, 'Site Operator', '2024-10-15 05:35:58', NULL),
(46, 1, 'Supervisor', '2024-10-15 05:36:16', NULL),
(47, 1, 'Support Stuff', '2024-10-15 05:36:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_dropdowncategory`
--

CREATE TABLE `t_dropdowncategory` (
  `CategoryID` smallint(3) NOT NULL,
  `CategoryName` varchar(50) NOT NULL,
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdateTs` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_dropdowncategory`
--

INSERT INTO `t_dropdowncategory` (`CategoryID`, `CategoryName`, `CreateTs`, `UpdateTs`) VALUES
(1, 'Visit Purpose', '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(2, 'Sample Activity', '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(3, 'Order/Sales', '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(4, 'Transpotation', '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(5, 'Activity Action', '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(6, 'Activity Result', '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(7, 'Order/Sales Action', '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(8, 'Visit Action', '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(9, 'Funnel Status', '2023-08-09 12:14:16', '2023-08-09 12:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `t_dropdownlist`
--

CREATE TABLE `t_dropdownlist` (
  `DropDownListID` smallint(3) NOT NULL,
  `DisplayName` varchar(100) NOT NULL,
  `CategoryID` smallint(3) NOT NULL,
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdateTs` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `t_dropdownlist`
--

INSERT INTO `t_dropdownlist` (`DropDownListID`, `DisplayName`, `CategoryID`, `CreateTs`, `UpdateTs`) VALUES
(1, 'Business', 1, '2024-09-11 17:40:55', NULL),
(2, 'Order', 1, '2024-09-11 17:41:06', NULL),
(3, 'Sample', 1, '2024-09-11 17:41:22', NULL),
(4, 'Service', 1, '2024-09-11 17:41:32', NULL),
(5, 'Installation', 1, '2024-09-11 17:41:41', NULL),
(6, 'Others', 1, '2024-09-11 17:41:50', NULL),
(7, 'Delivery', 1, '2024-09-11 17:41:58', NULL),
(8, 'Collection', 1, '2024-09-11 17:42:06', NULL),
(9, 'Credit Follow-up', 1, '2024-09-11 17:42:16', NULL),
(10, 'LC in Bank', 1, '2024-09-11 17:42:26', NULL),
(11, 'Procurement', 1, '2024-09-11 17:42:38', NULL),
(12, 'Lab', 2, '2024-09-11 17:43:06', NULL),
(13, 'R&D', 2, '2024-09-11 17:43:17', NULL),
(14, 'Trial', 2, '2024-09-11 17:43:27', NULL),
(15, 'Production Trial', 2, '2024-09-11 17:43:38', NULL),
(16, 'Order', 3, '2024-09-11 17:44:20', NULL),
(17, 'Sales', 3, '2024-09-11 17:44:28', NULL),
(18, 'None', 4, '2024-09-11 17:44:55', NULL),
(19, 'Public', 4, '2024-09-11 17:45:02', NULL),
(20, 'Official', 4, '2024-09-11 17:45:11', NULL),
(21, 'Done', 5, '2024-09-11 17:45:37', NULL),
(22, 'Pending', 5, '2024-09-11 17:45:44', NULL),
(23, 'Successful (Over Prize)', 6, '2024-09-11 17:46:09', NULL),
(24, 'Successful (Sold)', 6, '2024-09-11 17:46:23', NULL),
(25, 'Failed', 6, '2024-09-11 17:46:33', NULL),
(26, 'Done', 7, '2024-09-11 17:46:56', NULL),
(27, 'Pending', 7, '2024-09-11 17:47:04', NULL),
(28, 'Price', 8, '2024-09-11 17:47:29', NULL),
(29, 'Offer', 8, '2024-09-11 17:47:37', NULL),
(30, 'Sample Given/Taken', 8, '2024-09-11 17:47:46', NULL),
(31, 'Sales Lead', 8, '2024-09-11 17:47:58', NULL),
(32, 'Service', 8, '2024-09-11 17:48:09', NULL),
(33, 'General', 8, '2024-09-11 17:48:17', NULL),
(34, 'Lead', 9, '2024-09-11 17:46:33', NULL),
(35, 'Query', 9, '2024-09-11 17:46:33', NULL),
(36, 'Offer', 9, '2024-09-11 17:46:33', NULL),
(37, 'Negotiation', 9, '2024-09-11 17:46:33', NULL),
(38, 'Acceptance', 9, '2024-09-11 17:46:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_errorlog`
--

CREATE TABLE `t_errorlog` (
  `LogId` int(11) NOT NULL,
  `LogDate` datetime NOT NULL,
  `RemoteIP` varchar(100) NOT NULL,
  `UserId` int(11) NOT NULL COMMENT 'In user table has Client and Branch',
  `Query` text NOT NULL,
  `QueryType` varchar(30) NOT NULL,
  `ErrorNo` varchar(30) NOT NULL,
  `ErrorMsg` text NOT NULL,
  `SqlParams` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `t_errorlog`
--

INSERT INTO `t_errorlog` (`LogId`, `LogDate`, `RemoteIP`, `UserId`, `Query`, `QueryType`, `ErrorNo`, `ErrorMsg`, `SqlParams`) VALUES
(1, '2024-10-15 11:20:36', '103.112.53.118', 6, 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', 'INSERT', '1062', 'Duplicate entry \'1-Assistant Manager\' for key \'UK_t_designation_Client_Designation\'', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Assistant Manager\"}}'),
(2, '2024-10-15 11:31:18', '103.112.53.118', 6, 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', 'INSERT', '1062', 'Duplicate entry \'1-Manager\' for key \'UK_t_designation_Client_Designation\'', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Manager\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `t_machine`
--

CREATE TABLE `t_machine` (
  `MachineId` smallint(3) NOT NULL,
  `MachineName` varchar(100) NOT NULL,
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdateTs` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_machinemodel`
--

CREATE TABLE `t_machinemodel` (
  `MachineModelId` smallint(3) NOT NULL,
  `MachineId` smallint(3) NOT NULL,
  `MachineModelName` varchar(100) NOT NULL,
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdateTs` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_machineparts`
--

CREATE TABLE `t_machineparts` (
  `MachinePartsId` smallint(3) NOT NULL,
  `MachineId` smallint(3) NOT NULL,
  `MachinePartsName` varchar(100) NOT NULL,
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdateTs` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_machineserial`
--

CREATE TABLE `t_machineserial` (
  `MachineSerialId` smallint(3) NOT NULL,
  `MachineId` smallint(3) NOT NULL,
  `MachineModelId` smallint(3) NOT NULL,
  `MachineSerial` varchar(100) NOT NULL,
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdateTs` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_menu`
--

CREATE TABLE `t_menu` (
  `MenuId` smallint(6) NOT NULL,
  `MenuKey` varchar(50) NOT NULL,
  `MenuTitle` varchar(150) NOT NULL,
  `Url` varchar(150) NOT NULL,
  `ParentId` int(11) DEFAULT NULL,
  `MenuLevel` varchar(30) DEFAULT NULL,
  `SortOrder` int(11) DEFAULT NULL,
  `MenuType` varchar(10) NOT NULL DEFAULT 'WEB' COMMENT 'WEB/APP',
  `CategoryName` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ICONURL` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdateTs` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_menu`
--

INSERT INTO `t_menu` (`MenuId`, `MenuKey`, `MenuTitle`, `Url`, `ParentId`, `MenuLevel`, `SortOrder`, `MenuType`, `CategoryName`, `ICONURL`, `CreateTs`, `UpdateTs`) VALUES
(1, 'home', 'Home', '/home', 0, 'menu_level_1', 1, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(2, 'dashboard', 'Dashboard', '/dashboard', 0, 'menu_level_1', 2, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(3, 'reports', 'Reports', '#', 0, 'menu_level_1', 5, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(4, 'settings', 'Settings', '#', 0, 'menu_level_1', 30, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(5, 'products', 'Products', '#', 0, 'menu_level_1', 60, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(20, 'productgroup', 'Product Group', '/productgroup', 4, 'menu_level_2', 31, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(21, 'productcategory', 'Product Category', '/productcategory', 4, 'menu_level_2', 32, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(22, 'productgeneric', 'Product Generic', '/productgeneric', 4, 'menu_level_2', 33, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(23, 'xxxx', 'xxxxxx', '/xxxxx', 4, 'menu_level_2', 34, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(24, 'manufacturer', 'Manufacturer', '/manufacturer', 4, 'menu_level_2', 35, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(25, 'supplier', 'Supplier', '/supplier', 4, 'menu_level_2', 36, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(26, 'customerweb', 'Customer Web', '/customerweb', 4, 'menu_level_2', 37, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(30, 'stockstatus', 'Stock Status', '/stockstatus', 3, 'menu_level_2', 6, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(50, 'product', 'Product', '/product', 5, 'menu_level_2', 61, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(51, 'receive', 'Receive', '/receive', 5, 'menu_level_2', 62, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(52, 'sales', 'Sales', '/sales', 5, 'menu_level_2', 63, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(53, 'userrole', 'User Role', '/userrole', 4, 'menu_level_2', 38, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(55, 'stockstatusbyexpiry', 'Stock Status by Expiry', '/stockstatusbyexpiry', 3, 'menu_level_2', 7, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(56, 'roletomenupermission', 'Role to Menu Permission', '/roletomenupermission', 4, 'menu_level_2', 40, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(57, 'reference', 'Reference', '/reference', 4, 'menu_level_2', 41, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(58, 'salesreturn', 'Sales Return', '/salesreturn', 5, 'menu_level_2', 64, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(59, 'userentry', 'User Entry', '/userentry', 4, 'menu_level_2', 38, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(60, 'myprofileweb', 'My Profile Web', '/myprofileweb', 0, 'menu_level_1', 300, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(61, 'client', 'Client Entry', '/client', 0, 'menu_level_1', 400, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(62, 'branch', 'Branch Entry', '/branch', 0, 'menu_level_1', 400, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(63, 'auditlog', 'Audit Log', '/auditlog', 0, 'menu_level_1', 400, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(64, 'errorlog', 'Error Log', '/errorlog', 0, 'menu_level_1', 400, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(65, 'reportsales', 'Sales Report', '/reportsales', 0, 'menu_level_1', 400, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(66, 'reportproductwisesales', 'Product Wise Sales Report', '/reportproductwisesales', 0, 'menu_level_1', 400, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(67, 'reportproductwisereceive', 'Product Wise Receive Report', '/reportproductwisereceive', 0, 'menu_level_1', 400, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(68, 'reportreceivesummary', 'Receive Summary Report', '/reportreceivesummary', 0, 'menu_level_1', 400, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(69, 'receivereturn', 'Receive Return', '/receivereturn', 0, 'menu_level_1', 405, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(70, 'expense', 'Expense', '/expense', 5, 'menu_level_2', 415, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(71, 'team', 'Team', '/team', 4, 'menu_level_2', 515, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(72, 'adjustment', 'Adjustment', '/adjustment', 5, 'menu_level_2', 435, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(73, 'audit', 'Audit', '/audit', 5, 'menu_level_2', 438, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(74, 'reportattendancesheet', 'Attendance Sheet', '/reportattendancesheet', 0, 'menu_level_1', 525, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(75, 'reportpaymentstatus', 'Payment Status', '/reportpaymentstatus', 0, 'menu_level_1', 523, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(76, 'reportexpensedetails', 'Expense Details', '/reportexpensedetails', 0, 'menu_level_1', 522, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(77, 'reportsalestransaction', 'Sales Transaction', '/reportsalestransaction', 0, 'menu_level_1', 529, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(78, 'reporttrendanalysis', 'Trend Analysis', '/reporttrendanalysis', 0, 'menu_level_1', 531, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(79, 'dashboardstaff', 'Staff Dashboard', '/dashboardstaff', 0, 'menu_level_1', 4, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(80, 'reportreceivereturn', 'Stock Return Report', '/reportreceivereturn', 0, 'menu_level_1', 400, 'WEB', NULL, NULL, '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(90, 'MyProfileActivity', 'My Profile', '/myprofile', 0, 'menu_level_1', 500, 'APP', 'Dashboard', 'my_profile.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(91, 'MyTaskActivity', 'My Task', '/mytask', 0, 'menu_level_1', 500, 'APP', 'Dashboard', 'my_task.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(92, 'MyVisitActivity', 'Visit', '/visit', 0, 'menu_level_1', 500, 'APP', 'Dashboard', 'visit.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(93, 'SampleActivity', 'Sample', '/sample', 0, 'menu_level_1', 500, 'APP', 'Dashboard', 'sample.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(94, 'OrderSalesActivity', 'Phone Visit', '/phonevisit', 0, 'menu_level_1', 500, 'APP', 'Dashboard', 'order_sell.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(95, 'VisitPlanActivity', 'Visit Plan', '/visitplan', 0, 'menu_level_1', 500, 'APP', 'Dashboard', 'visit_plan.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(96, 'CustomerActivity', 'Customer', '/customer', 0, 'menu_level_1', 500, 'APP', 'Dashboard', 'customer.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(97, 'EmployeeDirectoryActivity', 'Employee Directory', '/employeedirectory', 0, 'menu_level_1', 500, 'APP', 'Dashboard', 'EmployeeDirectory.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(98, 'ReportsActivity', 'Report', '/report', 0, 'menu_level_1', 500, 'APP', 'Dashboard', 'Report-Main.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(99, 'SalesFunnelActivity', 'Sales Funnel', '/salesfunnel', 0, 'menu_level_1', 500, 'APP', 'Dashboard', 'SalesFunnel-01.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(100, 'LMFeedbackActivity', 'Feedback', '/feedback', 0, 'menu_level_1', 500, 'APP', 'My Task', 'my_task.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(101, 'SalesForceTrailActivity', 'Sales Force Movement', '/salesforcemovement', 0, 'menu_level_1', 500, 'APP', 'My Task', 'visit_plan.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(102, 'VisitPunchActivity', 'Physical Visit', '/physicalvisit', 0, 'menu_level_1', 500, 'APP', 'Visit', 'visit_now.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(104, 'MyVisitActivity', 'View My Visit', '/viewmyvisit', 0, 'menu_level_1', 500, 'APP', 'Visit', 'visit.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(105, 'MyApprovedVisitActivity', 'Approved Visit', '/approvedvisit', 0, 'menu_level_1', 500, 'APP', 'Visit', 'visit.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(106, 'machine', 'Machine', '/machine', 4, 'menu_level_2', 515, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(107, 'designation', 'Designation', '/designation', 4, 'menu_level_2', 515, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(108, 'department', 'Department', '/department', 4, 'menu_level_2', 515, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(109, 'ConveyanceActivity', 'Conveyance', '/conveyance', 0, 'menu_level_1', 500, 'APP', 'ReportsActivity', 'Conveyance-Report.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(110, 'MachineryServiceActivity', 'Machinery Service', '/machineryserviceactivity', 0, 'menu_level_1', 500, 'APP', 'ReportsActivity', 'Machinery-Service-Report.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(111, 'CustomerVisitPunchActivity', 'Customer Visit Punch', '/customervisitpunchactivity', 0, 'menu_level_1', 500, 'APP', 'ReportsActivity', 'Customer-Visit-Punch-Report.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(112, 'machineparts', 'Machine Parts', '/machineparts', 4, 'menu_level_2', 515, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(113, 'machinemodel', 'Machine Model', '/machinemodel', 4, 'menu_level_2', 515, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(114, 'machineserial', 'Machine Serial', '/machineserial', 4, 'menu_level_2', 515, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(115, 'LMFeedbackActivity', 'Feedback', '/feedback', 0, 'menu_level_1', 500, 'APP', 'MyTaskActivity', 'my_task.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(116, 'SalesForceTrailActivity', 'Sales Force Movement', '/salesforcetrailactivity', 0, 'menu_level_1', 500, 'APP', 'MyTaskActivity', 'visit_plan.png', '2024-07-05 03:14:16', '2024-07-05 03:14:16'),
(118, 'transactionreport', 'Transaction Report', '/transactionreport', 4, 'menu_level_2', 516, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(119, 'businessline', 'Business Line', '/businessline', 4, 'menu_level_2', 559, 'WEB', NULL, NULL, '2023-08-09 12:14:16', '2023-08-09 12:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `t_month`
--

CREATE TABLE `t_month` (
  `MonthId` int(11) NOT NULL,
  `MonthName` varchar(25) NOT NULL,
  `UpdateTs` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `t_month`
--

INSERT INTO `t_month` (`MonthId`, `MonthName`, `UpdateTs`, `CreateTs`) VALUES
(1, 'January', '2024-04-16 18:20:35', '2024-04-16 18:20:35'),
(2, 'February', '2024-04-16 18:20:35', '2024-04-16 18:20:35'),
(3, 'March', '2024-04-16 18:20:35', '2024-04-16 18:20:35'),
(4, 'April', '2024-04-16 18:20:35', '2024-04-16 18:20:35'),
(5, 'May', '2024-04-16 18:20:35', '2024-04-16 18:20:35'),
(6, 'June', '2024-04-16 18:20:35', '2024-04-16 18:20:35'),
(7, 'July', '2024-04-16 18:20:35', '2024-04-16 18:20:35'),
(8, 'August', '2024-04-16 18:20:35', '2024-04-16 18:20:35'),
(9, 'September', '2024-04-16 18:20:35', '2024-04-16 18:20:35'),
(10, 'October', '2024-04-16 18:20:35', '2024-04-16 18:20:35'),
(11, 'November', '2024-04-16 18:20:35', '2024-04-16 18:20:35'),
(12, 'December', '2024-04-16 18:20:35', '2024-04-16 18:20:35');

-- --------------------------------------------------------

--
-- Table structure for table `t_roles`
--

CREATE TABLE `t_roles` (
  `RoleId` smallint(3) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `DefaultRedirect` varchar(150) NOT NULL,
  `CreateTs` timestamp NULL DEFAULT NULL,
  `UpdateTs` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_roles`
--

INSERT INTO `t_roles` (`RoleId`, `RoleName`, `DefaultRedirect`, `CreateTs`, `UpdateTs`) VALUES
(1, 'Super Admin', '/home', '2023-08-10 00:14:16', '2023-08-10 00:14:16'),
(2, 'HOD', '/home', '2023-08-10 00:14:16', '2023-08-10 00:14:16'),
(3, 'Report Viewer', '/home', '2023-08-10 00:14:16', '2023-08-10 00:14:16'),
(6, 'Sales Force', '/home', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_role_menu_map`
--

CREATE TABLE `t_role_menu_map` (
  `RoleMenuId` int(11) NOT NULL,
  `ClientId` smallint(6) NOT NULL,
  `BranchId` smallint(6) NOT NULL,
  `RoleId` smallint(3) NOT NULL,
  `MenuId` smallint(6) NOT NULL,
  `PermissionType` tinyint(1) NOT NULL COMMENT '1=View,2=Edit',
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdateTs` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_role_menu_map`
--

INSERT INTO `t_role_menu_map` (`RoleMenuId`, `ClientId`, `BranchId`, `RoleId`, `MenuId`, `PermissionType`, `CreateTs`, `UpdateTs`) VALUES
(3, 1, 1, 1, 3, 2, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(4, 1, 1, 1, 4, 2, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(5, 1, 1, 1, 5, 2, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(7, 1, 1, 1, 21, 2, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(8, 1, 1, 1, 22, 2, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(9, 1, 1, 1, 23, 2, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(10, 1, 1, 1, 24, 2, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(11, 1, 1, 1, 25, 2, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(12, 1, 1, 1, 26, 2, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(13, 1, 1, 1, 50, 2, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(14, 1, 1, 1, 51, 2, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(15, 1, 1, 1, 52, 2, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(18, 1, 1, 1, 30, 2, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(19, 1, 1, 1, 53, 2, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(29, 1, 1, 1, 56, 2, '2023-09-09 05:04:48', NULL),
(30, 1, 1, 1, 55, 2, '2023-09-10 10:28:41', NULL),
(31, 1, 1, 1, 57, 2, '2023-09-09 05:04:48', NULL),
(32, 1, 1, 1, 58, 2, '2023-08-09 12:14:16', '2023-08-09 12:14:16'),
(36, 1, 1, 1, 60, 2, '2023-10-07 11:47:34', '2023-10-14 03:20:59'),
(37, 1, 1, 1, 61, 2, '2023-10-31 10:47:03', NULL),
(38, 1, 1, 1, 62, 2, '2023-10-31 10:47:03', NULL),
(39, 1, 1, 1, 63, 2, '2023-10-31 10:47:03', NULL),
(40, 1, 1, 1, 64, 2, '2023-10-31 10:47:03', NULL),
(44, 1, 1, 1, 59, 2, '2023-12-22 22:52:12', NULL),
(45, 1, 1, 1, 66, 1, '2023-12-22 22:52:45', NULL),
(46, 1, 1, 1, 65, 1, '2023-12-22 22:52:49', NULL),
(47, 1, 1, 1, 68, 1, '2023-10-31 10:47:03', NULL),
(49, 1, 1, 1, 20, 2, '2024-02-19 04:30:15', NULL),
(50, 1, 1, 1, 67, 1, '2024-02-19 04:30:28', NULL),
(51, 1, 1, 1, 69, 2, '2023-10-31 10:47:03', NULL),
(52, 1, 1, 1, 70, 2, '2024-04-16 12:28:43', NULL),
(53, 1, 1, 1, 72, 2, '2024-04-16 12:28:53', NULL),
(54, 1, 1, 1, 71, 2, '2024-04-16 12:28:58', NULL),
(55, 1, 1, 1, 73, 2, '2024-04-16 12:29:02', NULL),
(56, 1, 1, 1, 75, 1, '2024-04-26 12:31:05', NULL),
(57, 1, 1, 1, 74, 1, '2024-04-26 12:31:11', NULL),
(59, 1, 1, 1, 76, 1, '2024-05-01 13:30:50', NULL),
(64, 1, 1, 1, 1, 1, '2024-05-02 00:06:57', NULL),
(65, 1, 1, 1, 2, 1, '2024-05-02 00:07:07', NULL),
(82, 1, 1, 1, 80, 1, '2024-07-05 11:44:54', NULL),
(84, 1, 1, 1, 93, 1, '2024-09-06 12:13:31', NULL),
(85, 1, 1, 1, 94, 1, '2024-09-06 12:13:33', NULL),
(86, 1, 1, 1, 95, 1, '2024-09-06 12:13:33', NULL),
(87, 1, 1, 1, 96, 1, '2024-09-06 12:13:34', NULL),
(88, 1, 1, 1, 97, 1, '2024-09-06 12:13:35', NULL),
(89, 1, 1, 1, 98, 1, '2024-09-06 12:13:35', NULL),
(90, 1, 1, 1, 92, 1, '2024-09-06 12:13:36', NULL),
(91, 1, 1, 1, 91, 1, '2024-09-06 12:13:37', NULL),
(92, 1, 1, 1, 90, 1, '2024-09-06 12:13:37', NULL),
(93, 1, 1, 1, 99, 1, '2024-09-06 12:13:38', NULL),
(94, 1, 1, 1, 78, 1, '2024-09-06 12:13:52', NULL),
(95, 1, 1, 1, 79, 1, '2024-09-06 12:13:54', NULL),
(96, 1, 1, 1, 77, 1, '2024-09-06 12:13:59', NULL),
(97, 1, 1, 1, 105, 1, '2024-09-06 12:29:25', NULL),
(98, 1, 1, 1, 104, 1, '2024-09-06 12:29:27', NULL),
(99, 1, 1, 1, 102, 1, '2024-09-06 12:29:28', NULL),
(100, 1, 1, 1, 101, 1, '2024-09-06 12:29:29', NULL),
(101, 1, 1, 1, 100, 1, '2024-09-06 12:29:29', NULL),
(102, 1, 1, 1, 109, 1, '2024-09-06 12:29:25', NULL),
(103, 1, 1, 1, 110, 1, '2024-09-06 12:29:25', NULL),
(104, 1, 1, 1, 111, 1, '2024-09-06 12:29:25', NULL),
(105, 1, 1, 1, 106, 2, '2024-09-06 12:29:25', NULL),
(106, 1, 1, 1, 107, 2, '2024-09-06 12:29:25', NULL),
(107, 1, 1, 1, 108, 2, '2024-09-06 12:29:25', NULL),
(108, 1, 1, 1, 112, 2, '2024-09-06 12:29:25', NULL),
(109, 1, 1, 1, 113, 2, '2024-09-06 12:29:25', NULL),
(110, 1, 1, 1, 114, 2, '2024-09-06 12:29:25', NULL),
(111, 1, 1, 1, 115, 2, '2024-09-06 12:29:25', NULL),
(112, 1, 1, 1, 116, 2, '2024-09-06 12:29:25', NULL),
(113, 1, 1, 1, 118, 1, '2024-10-14 18:53:19', NULL),
(114, 1, 1, 1, 119, 1, '2024-10-19 09:34:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_sqllog`
--

CREATE TABLE `t_sqllog` (
  `LogId` int(11) NOT NULL,
  `LogDate` datetime NOT NULL,
  `RemoteIP` varchar(100) NOT NULL,
  `UserId` int(11) NOT NULL COMMENT 'In user table has Client and Branch',
  `QueryType` varchar(30) NOT NULL,
  `TableName` varchar(30) NOT NULL,
  `JsonText` longtext NOT NULL,
  `SqlText` longtext NOT NULL,
  `SqlParams` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `t_sqllog`
--

INSERT INTO `t_sqllog` (`LogId`, `LogDate`, `RemoteIP`, `UserId`, `QueryType`, `TableName`, `JsonText`, `SqlText`, `SqlParams`) VALUES
(1, '2024-10-15 00:53:19', '103.230.106.21', 1, 'INSERT', 't_role_menu_map', '[[\"RoleMenuId\",\"\",113],[\"ClientId\",\"\",1],[\"BranchId\",\"\",1],[\"RoleId\",\"\",1],[\"MenuId\",\"\",118],[\"PermissionType\",\"\",1],[\"CreateTs\",\"\",\"2024-10-15 00:53:19\"]]', 'INSERT INTO t_role_menu_map (ClientId,BranchId,RoleId,MenuId,PermissionType) values (:ClientId,:BranchId,:RoleId,:MenuId,:PermissionType)', '{\"values\":{\"ClientId\":\"1\",\"BranchId\":\"1\",\"RoleId\":\"1\",\"MenuId\":118,\"PermissionType\":1}}'),
(2, '2024-10-15 10:52:03', '103.112.53.118', 1, 'DELETE', 't_department', '[[\"DepartmentId\",1,\"\"],[\"DepartmentName\",\"[NA]\",\"\"],[\"CreateTs\",\"2023-08-10 00:14:16\",\"\"],[\"UpdateTs\",\"2023-08-10 00:14:16\",\"\"]]', 'DELETE FROM t_department  WHERE DepartmentId = :DepartmentId', '{\"values\":{\"DepartmentId\":1}}'),
(3, '2024-10-15 11:02:31', '103.112.53.118', 1, 'INSERT', 't_users', '[[\"UserId\",\"\",6],[\"ClientId\",\"\",1],[\"BranchId\",\"\",1],[\"UserName\",\"\",\"Monirul Islam\"],[\"LoginName\",\"\",\"monir\"],[\"Email\",\"\",\"monirul.islam@dysin.com\"],[\"Password\",\"\",\"$2y$10$m1n9isyrtTqt.xxErAN0I.\\/5p9.ikttRlNnfj7I.aXpbi1LHDnDpe\"],[\"DesignationId\",\"\",1],[\"DepartmentId\",\"\",2],[\"Address\",\"\",\"na\"],[\"LinemanUserId\",\"\",1],[\"IsActive\",\"\",1],[\"PhotoUrl\",\"\",\"placeholder.png\"],[\"CreateTs\",\"\",\"2024-10-15 11:02:31\"]]', 'INSERT INTO t_users (ClientId,BranchId,UserName,LoginName,Password,Email,IsActive,DesignationId,PhotoUrl,DepartmentId,TeamId,LinemanUserId,Address) values (:ClientId,:BranchId,:UserName,:LoginName,:Password,:Email,:IsActive,:DesignationId,:PhotoUrl,:DepartmentId,:TeamId,:LinemanUserId,:Address)', '{\"values\":{\"ClientId\":\"1\",\"BranchId\":\"1\",\"UserName\":\"Monirul Islam\",\"LoginName\":\"monir\",\"Password\":\"$2y$10$m1n9isyrtTqt.xxErAN0I.\\/5p9.ikttRlNnfj7I.aXpbi1LHDnDpe\",\"Email\":\"monirul.islam@dysin.com\",\"IsActive\":true,\"DesignationId\":\"1\",\"PhotoUrl\":\"placeholder.png\",\"DepartmentId\":\"2\",\"TeamId\":null,\"LinemanUserId\":\"1\",\"Address\":\"na\"}}'),
(4, '2024-10-15 11:02:31', '103.112.53.118', 1, 'INSERT', 't_user_role_map', '[[\"UserRoleId\",\"\",5],[\"UserId\",\"\",6],[\"RoleId\",\"\",1],[\"CreateTs\",\"\",\"2024-10-15 11:02:31\"]]', 'INSERT INTO t_user_role_map (UserId,RoleId) values (:UserId,:RoleId)', '{\"values\":{\"UserId\":\"6\",\"RoleId\":\"1\"}}'),
(5, '2024-10-15 11:16:52', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",4],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Chairman\"],[\"CreateTs\",\"\",\"2024-10-15 11:16:52\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Chairman\"}}'),
(6, '2024-10-15 11:17:09', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",5],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Managing Director\"],[\"CreateTs\",\"\",\"2024-10-15 11:17:09\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Managing Director\"}}'),
(7, '2024-10-15 11:17:18', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",6],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Director\"],[\"CreateTs\",\"\",\"2024-10-15 11:17:18\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Director\"}}'),
(8, '2024-10-15 11:18:02', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",7],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Head of Server & Network Infrastructure\"],[\"CreateTs\",\"\",\"2024-10-15 11:18:02\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Head of Server & Network Infrastructure\"}}'),
(9, '2024-10-15 11:18:36', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",8],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Head of Application Support\"],[\"CreateTs\",\"\",\"2024-10-15 11:18:36\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Head of Application Support\"}}'),
(10, '2024-10-15 11:19:19', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",9],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Cook\"],[\"CreateTs\",\"\",\"2024-10-15 11:19:19\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Cook\"}}'),
(11, '2024-10-15 11:19:51', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",10],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Assistant General\"],[\"CreateTs\",\"\",\"2024-10-15 11:19:51\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Assistant General\"}}'),
(12, '2024-10-15 11:20:17', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",11],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Assistant Manager\"],[\"CreateTs\",\"\",\"2024-10-15 11:20:17\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Assistant Manager\"}}'),
(13, '2024-10-15 11:20:54', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",13],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Assistant Operator\"],[\"CreateTs\",\"\",\"2024-10-15 11:20:54\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Assistant Operator\"}}'),
(14, '2024-10-15 11:21:55', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",14],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Assistant Officer\"],[\"CreateTs\",\"\",\"2024-10-15 11:21:55\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Assistant Officer\"}}'),
(15, '2024-10-15 11:22:48', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",15],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"CoordinatorServ Ice\"],[\"CreateTs\",\"\",\"2024-10-15 11:22:48\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"CoordinatorServ Ice\"}}'),
(16, '2024-10-15 11:23:01', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",16],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Cowboy\"],[\"CreateTs\",\"\",\"2024-10-15 11:23:01\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Cowboy\"}}'),
(17, '2024-10-15 11:23:17', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",17],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Data Entry Officer\"],[\"CreateTs\",\"\",\"2024-10-15 11:23:17\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Data Entry Officer\"}}'),
(18, '2024-10-15 11:25:34', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",18],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Delivery Man\"],[\"CreateTs\",\"\",\"2024-10-15 11:25:34\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Delivery Man\"}}'),
(19, '2024-10-15 11:26:42', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",19],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Deputy General Manager\"],[\"CreateTs\",\"\",\"2024-10-15 11:26:42\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Deputy General Manager\"}}'),
(20, '2024-10-15 11:27:09', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",20],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Driver\"],[\"CreateTs\",\"\",\"2024-10-15 11:27:09\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Driver\"}}'),
(21, '2024-10-15 11:27:48', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",21],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Electrician\"],[\"CreateTs\",\"\",\"2024-10-15 11:27:48\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Electrician\"}}'),
(22, '2024-10-15 11:28:05', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",22],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Engineer\"],[\"CreateTs\",\"\",\"2024-10-15 11:28:05\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Engineer\"}}'),
(23, '2024-10-15 11:28:13', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",23],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Executive\"],[\"CreateTs\",\"\",\"2024-10-15 11:28:13\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Executive\"}}'),
(24, '2024-10-15 11:28:44', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",24],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Executive Director (Printing)\"],[\"CreateTs\",\"\",\"2024-10-15 11:28:44\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Executive Director (Printing)\"}}'),
(25, '2024-10-15 11:28:58', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",25],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"General Manager\"],[\"CreateTs\",\"\",\"2024-10-15 11:28:58\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"General Manager\"}}'),
(26, '2024-10-15 11:29:22', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",26],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Junior Engineer\"],[\"CreateTs\",\"\",\"2024-10-15 11:29:22\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Junior Engineer\"}}'),
(27, '2024-10-15 11:30:09', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",27],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Junior Technician\"],[\"CreateTs\",\"\",\"2024-10-15 11:30:09\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Junior Technician\"}}'),
(28, '2024-10-15 11:30:46', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",28],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Lab Assistant\"],[\"CreateTs\",\"\",\"2024-10-15 11:30:46\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Lab Assistant\"}}'),
(29, '2024-10-15 11:31:02', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",29],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Lab Technician\"],[\"CreateTs\",\"\",\"2024-10-15 11:31:02\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Lab Technician\"}}'),
(30, '2024-10-15 11:31:43', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",31],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Officer\"],[\"CreateTs\",\"\",\"2024-10-15 11:31:43\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Officer\"}}'),
(31, '2024-10-15 11:31:55', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",32],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Operator\"],[\"CreateTs\",\"\",\"2024-10-15 11:31:55\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Operator\"}}'),
(32, '2024-10-15 11:32:12', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",33],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Sales Assistant\"],[\"CreateTs\",\"\",\"2024-10-15 11:32:12\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Sales Assistant\"}}'),
(33, '2024-10-15 11:32:42', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",34],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Security Guard\"],[\"CreateTs\",\"\",\"2024-10-15 11:32:42\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Security Guard\"}}'),
(34, '2024-10-15 11:32:57', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",35],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Senior Electrician\"],[\"CreateTs\",\"\",\"2024-10-15 11:32:57\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Senior Electrician\"}}'),
(35, '2024-10-15 11:33:13', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",36],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Senior General Manager\"],[\"CreateTs\",\"\",\"2024-10-15 11:33:13\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Senior General Manager\"}}'),
(36, '2024-10-15 11:33:34', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",37],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Senior Lab Assistant\"],[\"CreateTs\",\"\",\"2024-10-15 11:33:34\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Senior Lab Assistant\"}}'),
(37, '2024-10-15 11:33:54', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",38],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Senior Manager\"],[\"CreateTs\",\"\",\"2024-10-15 11:33:54\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Senior Manager\"}}'),
(38, '2024-10-15 11:34:07', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",39],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Senior Officer\"],[\"CreateTs\",\"\",\"2024-10-15 11:34:07\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Senior Officer\"}}'),
(39, '2024-10-15 11:34:29', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",40],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Senior operator\"],[\"CreateTs\",\"\",\"2024-10-15 11:34:29\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Senior operator\"}}'),
(40, '2024-10-15 11:34:43', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",41],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Senior Plumber\"],[\"CreateTs\",\"\",\"2024-10-15 11:34:43\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Senior Plumber\"}}'),
(41, '2024-10-15 11:34:59', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",42],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Senior Service Engineer\"],[\"CreateTs\",\"\",\"2024-10-15 11:34:59\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Senior Service Engineer\"}}'),
(42, '2024-10-15 11:35:22', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",43],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Senior Site Engineer\"],[\"CreateTs\",\"\",\"2024-10-15 11:35:22\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Senior Site Engineer\"}}'),
(43, '2024-10-15 11:35:44', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",44],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Service Engineer\"],[\"CreateTs\",\"\",\"2024-10-15 11:35:44\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Service Engineer\"}}'),
(44, '2024-10-15 11:35:58', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",45],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Site Operator\"],[\"CreateTs\",\"\",\"2024-10-15 11:35:58\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Site Operator\"}}'),
(45, '2024-10-15 11:36:16', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",46],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Supervisor\"],[\"CreateTs\",\"\",\"2024-10-15 11:36:16\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Supervisor\"}}'),
(46, '2024-10-15 11:36:33', '103.112.53.118', 6, 'INSERT', 't_designation', '[[\"DesignationId\",\"\",47],[\"ClientId\",\"\",1],[\"DesignationName\",\"\",\"Support Stuff\"],[\"CreateTs\",\"\",\"2024-10-15 11:36:33\"]]', 'INSERT INTO t_designation (ClientId,DesignationName) values (:ClientId,:DesignationName)', '{\"values\":{\"ClientId\":\"1\",\"DesignationName\":\"Support Stuff\"}}'),
(47, '2024-10-15 11:40:42', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",1],[\"MachineName\",\"\",\"AATCC Dryer\"],[\"CreateTs\",\"\",\"2024-10-15 11:40:42\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"AATCC Dryer\"}}'),
(48, '2024-10-15 11:41:31', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",2],[\"MachineName\",\"\",\"Amica Digital Sublimation Printer\"],[\"CreateTs\",\"\",\"2024-10-15 11:41:31\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"Amica Digital Sublimation Printer\"}}'),
(49, '2024-10-15 11:41:57', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",3],[\"MachineName\",\"\",\"AnaJet DTG Printer\"],[\"CreateTs\",\"\",\"2024-10-15 11:41:57\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"AnaJet DTG Printer\"}}'),
(50, '2024-10-15 11:42:24', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",4],[\"MachineName\",\"\",\"Atexco Reactive Printer\"],[\"CreateTs\",\"\",\"2024-10-15 11:42:24\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"Atexco Reactive Printer\"}}'),
(51, '2024-10-15 11:42:38', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",5],[\"MachineName\",\"\",\"Digital Printer\"],[\"CreateTs\",\"\",\"2024-10-15 11:42:38\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"Digital Printer\"}}'),
(52, '2024-10-15 11:43:02', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",6],[\"MachineName\",\"\",\"Electrolux Washing Machine\"],[\"CreateTs\",\"\",\"2024-10-15 11:43:02\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"Electrolux Washing Machine\"}}'),
(53, '2024-10-15 11:46:01', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",7],[\"MachineName\",\"\",\"Envraving Machine\"],[\"CreateTs\",\"\",\"2024-10-15 11:46:01\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"Envraving Machine\"}}'),
(54, '2024-10-15 11:46:21', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",8],[\"MachineName\",\"\",\"Flat Sticker Printer\"],[\"CreateTs\",\"\",\"2024-10-15 11:46:21\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"Flat Sticker Printer\"}}'),
(55, '2024-10-15 11:46:50', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",9],[\"MachineName\",\"\",\"Front Loading Garments Washing Machine\"],[\"CreateTs\",\"\",\"2024-10-15 11:46:50\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"Front Loading Garments Washing Machine\"}}'),
(56, '2024-10-15 11:47:10', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",10],[\"MachineName\",\"\",\"Garments Dryer\"],[\"CreateTs\",\"\",\"2024-10-15 11:47:10\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"Garments Dryer\"}}'),
(57, '2024-10-15 11:47:35', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",11],[\"MachineName\",\"\",\"Garments Dryer Machine\"],[\"CreateTs\",\"\",\"2024-10-15 11:47:35\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"Garments Dryer Machine\"}}'),
(58, '2024-10-15 11:48:18', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",12],[\"MachineName\",\"\",\"Garments Hydroextractor\"],[\"CreateTs\",\"\",\"2024-10-15 11:48:18\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"Garments Hydroextractor\"}}'),
(59, '2024-10-15 11:48:43', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",13],[\"MachineName\",\"\",\"Garments Washing Machine\"],[\"CreateTs\",\"\",\"2024-10-15 11:48:43\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"Garments Washing Machine\"}}'),
(60, '2024-10-15 11:49:01', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",14],[\"MachineName\",\"\",\"Heat Press Machine\"],[\"CreateTs\",\"\",\"2024-10-15 11:49:01\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"Heat Press Machine\"}}'),
(61, '2024-10-15 11:49:37', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",15],[\"MachineName\",\"\",\"JHF Digital Sublimation Printer\"],[\"CreateTs\",\"\",\"2024-10-15 11:49:37\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"JHF Digital Sublimation Printer\"}}'),
(62, '2024-10-15 11:49:56', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",16],[\"MachineName\",\"\",\"JY Garments Washing Machine\"],[\"CreateTs\",\"\",\"2024-10-15 11:49:56\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"JY Garments Washing Machine\"}}'),
(63, '2024-10-15 11:50:40', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",17],[\"MachineName\",\"\",\"KZ Series Hydroextractor \"],[\"CreateTs\",\"\",\"2024-10-15 11:50:40\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"KZ Series Hydroextractor \"}}'),
(64, '2024-10-15 11:51:17', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",18],[\"MachineName\",\"\",\"Lab Conditioning Chamber\"],[\"CreateTs\",\"\",\"2024-10-15 11:51:17\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"Lab Conditioning Chamber\"}}'),
(65, '2024-10-15 11:52:02', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",19],[\"MachineName\",\"\",\"Laboratory Precision Oven \"],[\"CreateTs\",\"\",\"2024-10-15 11:52:02\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"Laboratory Precision Oven \"}}'),
(66, '2024-10-15 11:52:49', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",20],[\"MachineName\",\"\",\"Laboratory Continuous Washing Machine\"],[\"CreateTs\",\"\",\"2024-10-15 11:52:49\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"Laboratory Continuous Washing Machine\"}}'),
(67, '2024-10-15 11:53:48', '103.112.53.118', 6, 'INSERT', 't_machine', '[[\"MachineId\",\"\",21],[\"MachineName\",\"\",\"Laboratory Corrosion Tester\"],[\"CreateTs\",\"\",\"2024-10-15 11:53:48\"]]', 'INSERT INTO t_machine (MachineName) values (:MachineName)', '{\"values\":{\"MachineName\":\"Laboratory Corrosion Tester\"}}'),
(68, '2024-10-15 12:02:09', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",1,\"\"],[\"MachineName\",\"AATCC Dryer\",\"\"],[\"CreateTs\",\"2024-10-15 11:40:42\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":1}}'),
(69, '2024-10-15 12:02:12', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",2,\"\"],[\"MachineName\",\"Amica Digital Sublimation Printer\",\"\"],[\"CreateTs\",\"2024-10-15 11:41:31\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":2}}'),
(70, '2024-10-15 12:02:14', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",3,\"\"],[\"MachineName\",\"AnaJet DTG Printer\",\"\"],[\"CreateTs\",\"2024-10-15 11:41:57\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":3}}'),
(71, '2024-10-15 12:02:16', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",4,\"\"],[\"MachineName\",\"Atexco Reactive Printer\",\"\"],[\"CreateTs\",\"2024-10-15 11:42:24\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":4}}'),
(72, '2024-10-15 12:02:19', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",5,\"\"],[\"MachineName\",\"Digital Printer\",\"\"],[\"CreateTs\",\"2024-10-15 11:42:38\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":5}}'),
(73, '2024-10-15 12:02:21', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",6,\"\"],[\"MachineName\",\"Electrolux Washing Machine\",\"\"],[\"CreateTs\",\"2024-10-15 11:43:02\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":6}}'),
(74, '2024-10-15 12:02:23', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",7,\"\"],[\"MachineName\",\"Envraving Machine\",\"\"],[\"CreateTs\",\"2024-10-15 11:46:01\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":7}}'),
(75, '2024-10-15 12:02:25', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",8,\"\"],[\"MachineName\",\"Flat Sticker Printer\",\"\"],[\"CreateTs\",\"2024-10-15 11:46:21\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":8}}'),
(76, '2024-10-15 12:02:27', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",9,\"\"],[\"MachineName\",\"Front Loading Garments Washing Machine\",\"\"],[\"CreateTs\",\"2024-10-15 11:46:50\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":9}}'),
(77, '2024-10-15 12:02:30', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",10,\"\"],[\"MachineName\",\"Garments Dryer\",\"\"],[\"CreateTs\",\"2024-10-15 11:47:10\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":10}}'),
(78, '2024-10-15 12:02:32', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",11,\"\"],[\"MachineName\",\"Garments Dryer Machine\",\"\"],[\"CreateTs\",\"2024-10-15 11:47:35\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":11}}'),
(79, '2024-10-15 12:02:35', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",12,\"\"],[\"MachineName\",\"Garments Hydroextractor\",\"\"],[\"CreateTs\",\"2024-10-15 11:48:18\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":12}}'),
(80, '2024-10-15 12:02:38', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",13,\"\"],[\"MachineName\",\"Garments Washing Machine\",\"\"],[\"CreateTs\",\"2024-10-15 11:48:43\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":13}}'),
(81, '2024-10-15 12:02:40', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",14,\"\"],[\"MachineName\",\"Heat Press Machine\",\"\"],[\"CreateTs\",\"2024-10-15 11:49:01\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":14}}'),
(82, '2024-10-15 12:02:42', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",15,\"\"],[\"MachineName\",\"JHF Digital Sublimation Printer\",\"\"],[\"CreateTs\",\"2024-10-15 11:49:37\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":15}}'),
(83, '2024-10-15 12:02:45', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",16,\"\"],[\"MachineName\",\"JY Garments Washing Machine\",\"\"],[\"CreateTs\",\"2024-10-15 11:49:56\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":16}}'),
(84, '2024-10-15 12:02:47', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",17,\"\"],[\"MachineName\",\"KZ Series Hydroextractor \",\"\"],[\"CreateTs\",\"2024-10-15 11:50:40\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":17}}'),
(85, '2024-10-15 12:02:50', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",18,\"\"],[\"MachineName\",\"Lab Conditioning Chamber\",\"\"],[\"CreateTs\",\"2024-10-15 11:51:17\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":18}}'),
(86, '2024-10-15 12:02:52', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",20,\"\"],[\"MachineName\",\"Laboratory Continuous Washing Machine\",\"\"],[\"CreateTs\",\"2024-10-15 11:52:49\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":20}}'),
(87, '2024-10-15 12:02:55', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",21,\"\"],[\"MachineName\",\"Laboratory Corrosion Tester\",\"\"],[\"CreateTs\",\"2024-10-15 11:53:48\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":21}}'),
(88, '2024-10-15 12:02:57', '103.112.53.118', 6, 'DELETE', 't_machine', '[[\"MachineId\",19,\"\"],[\"MachineName\",\"Laboratory Precision Oven \",\"\"],[\"CreateTs\",\"2024-10-15 11:52:02\",\"\"],[\"UpdateTs\",null,\"\"]]', 'DELETE FROM t_machine  WHERE MachineId = :MachineId', '{\"values\":{\"MachineId\":19}}'),
(89, '2024-10-15 13:00:28', '103.112.53.118', 6, 'INSERT', 't_roles', '[[\"RoleId\",\"\",6],[\"RoleName\",\"\",\"Sales Force\"],[\"DefaultRedirect\",\"\",\"\\/home\"]]', 'INSERT INTO t_roles (RoleName,DefaultRedirect) values (:RoleName,:DefaultRedirect)', '{\"values\":{\"RoleName\":\"Sales Force\",\"DefaultRedirect\":\"\\/home\"}}'),
(90, '2024-10-19 15:34:38', '103.26.246.41', 1, 'INSERT', 't_role_menu_map', '[[\"RoleMenuId\",\"\",114],[\"ClientId\",\"\",1],[\"BranchId\",\"\",1],[\"RoleId\",\"\",1],[\"MenuId\",\"\",119],[\"PermissionType\",\"\",1],[\"CreateTs\",\"\",\"2024-10-19 15:34:38\"]]', 'INSERT INTO t_role_menu_map (ClientId,BranchId,RoleId,MenuId,PermissionType) values (:ClientId,:BranchId,:RoleId,:MenuId,:PermissionType)', '{\"values\":{\"ClientId\":\"1\",\"BranchId\":\"1\",\"RoleId\":\"1\",\"MenuId\":119,\"PermissionType\":1}}'),
(91, '2024-10-19 15:43:31', '103.26.246.41', 1, 'INSERT', 't_customer', '[[\"CustomerId\",\"\",37],[\"ClientId\",\"\",1],[\"CustomerCode\",\"\",\"20241019154331\"],[\"CustomerName\",\"\",\"333\"],[\"IsActive\",\"\",1],[\"UserId\",\"\",1],[\"UpdateTs\",\"\",\"2024-10-19 15:43:31\"],[\"CreateTs\",\"\",\"2024-10-19 15:43:31\"]]', 'INSERT INTO t_customer (ClientId,CustomerCode,CustomerName,Designation,Address,Email,ContactPhone,CompanyName,NatureOfBusiness,CompanyEmail,CompanyAddress,IsActive,UserId) values (:ClientId,:CustomerCode,:CustomerName,:Designation,:Address,:Email,:ContactPhone,:CompanyName,:NatureOfBusiness,:CompanyEmail,:CompanyAddress,:IsActive,:UserId)', '{\"values\":{\"ClientId\":\"1\",\"CustomerCode\":\"20241019154331\",\"CustomerName\":\"333\",\"Designation\":null,\"Address\":null,\"Email\":null,\"ContactPhone\":null,\"CompanyName\":null,\"NatureOfBusiness\":null,\"CompanyEmail\":null,\"CompanyAddress\":null,\"IsActive\":1,\"UserId\":\"1\"}}'),
(92, '2024-10-19 15:43:35', '103.26.246.41', 1, 'DELETE', 't_customer', '[[\"CustomerId\",37,\"\"],[\"ClientId\",1,\"\"],[\"CustomerCode\",\"20241019154331\",\"\"],[\"CustomerName\",\"333\",\"\"],[\"Designation\",null,\"\"],[\"Address\",null,\"\"],[\"Email\",null,\"\"],[\"ContactPhone\",null,\"\"],[\"CompanyName\",null,\"\"],[\"NatureOfBusiness\",null,\"\"],[\"CompanyEmail\",null,\"\"],[\"CompanyAddress\",null,\"\"],[\"IsActive\",1,\"\"],[\"UserId\",1,\"\"],[\"UpdateTs\",\"2024-10-19 15:43:31\",\"\"],[\"CreateTs\",\"2024-10-19 15:43:31\",\"\"]]', 'DELETE FROM t_customer  WHERE CustomerId = :CustomerId', '{\"values\":{\"CustomerId\":37}}');

-- --------------------------------------------------------

--
-- Table structure for table `t_status`
--

CREATE TABLE `t_status` (
  `StatusId` smallint(3) NOT NULL,
  `StatusName` varchar(50) NOT NULL,
  `CreateTs` timestamp NULL DEFAULT NULL,
  `UpdateTs` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `t_status`
--

INSERT INTO `t_status` (`StatusId`, `StatusName`, `CreateTs`, `UpdateTs`) VALUES
(1, 'Draft', '2024-08-09 18:14:16', '2024-08-09 18:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `t_team`
--

CREATE TABLE `t_team` (
  `TeamId` smallint(3) NOT NULL,
  `TeamName` varchar(50) NOT NULL,
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdateTs` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_team`
--

INSERT INTO `t_team` (`TeamId`, `TeamName`, `CreateTs`, `UpdateTs`) VALUES
(1, '[NA]', '2024-08-09 12:14:16', '2024-08-09 12:14:16'),
(2, 'Team 1', '2024-08-09 12:14:16', '2024-08-09 12:14:16'),
(3, 'Team 2', '2024-08-09 12:14:16', '2024-08-09 12:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `t_transaction`
--

CREATE TABLE `t_transaction` (
  `TransactionId` int(11) NOT NULL,
  `ClientId` smallint(6) NOT NULL,
  `TransactionTypeId` smallint(3) NOT NULL,
  `TransactionDate` datetime NOT NULL,
  `InvoiceNo` varchar(20) NOT NULL,
  `PunchLocation` varchar(200) DEFAULT NULL,
  `Longitude` varchar(50) DEFAULT NULL,
  `Latitude` varchar(50) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `ContactPersonName` varchar(100) DEFAULT NULL,
  `ContactPersonDesignation` varchar(100) DEFAULT NULL,
  `ContactPersonMobileNumber` varchar(100) DEFAULT NULL,
  `DropDownListIDForPurpose` smallint(3) DEFAULT NULL,
  `DropDownListIDForTransportation` smallint(3) DEFAULT NULL,
  `DropDownListIDForVisitAction` smallint(3) DEFAULT NULL,
  `DropDownListIDForActivityResult` smallint(3) DEFAULT NULL,
  `DropDownListIDForFunnelStatus` smallint(3) DEFAULT NULL,
  `ConveyanceAmount` float(10,2) DEFAULT NULL COMMENT 'Entry by visitor',
  `RefreshmentAmount` float(10,2) DEFAULT NULL COMMENT 'Entry by visitor ',
  `ApprovedConveyanceAmount` float(10,2) DEFAULT NULL,
  `ApprovedRefreshmentAmount` float(10,2) DEFAULT NULL,
  `PublicTransportDesc` varchar(60) DEFAULT NULL,
  `DummyCustomerDesc` varchar(60) DEFAULT NULL,
  `SelfDiscussion` varchar(150) DEFAULT NULL COMMENT 'Visitor own feedback',
  `SelfFollowUpDate` date DEFAULT NULL COMMENT 'Visitor feedback date/next followupdate',
  `MachineId` smallint(3) DEFAULT NULL,
  `MachineModelId` smallint(3) DEFAULT NULL,
  `MachineSerial` varchar(60) DEFAULT NULL,
  `MachineComplain` varchar(150) DEFAULT NULL,
  `UserId` int(11) NOT NULL COMMENT 'Entry By',
  `IsVisitorFeedback` varchar(5) NOT NULL DEFAULT 'N' COMMENT 'Y=Yes, N=No',
  `IsLinemanFeedback` varchar(5) NOT NULL DEFAULT 'N' COMMENT 'Y=Yes, N=No',
  `LMAdvice` varchar(200) DEFAULT NULL COMMENT 'Line man feedback',
  `LMFollowUpDate` date DEFAULT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `ProductDetails` varchar(100) DEFAULT NULL,
  `TargetPrice` float(10,2) DEFAULT NULL,
  `SalesOrderVolume` float(10,2) DEFAULT NULL,
  `ExpectedPrice` int(11) DEFAULT NULL,
  `FinalPrice` int(11) DEFAULT NULL,
  `NegotiablePrice` int(11) DEFAULT NULL,
  `OfferQuantity` int(11) DEFAULT NULL,
  `RequiredQuantity` int(11) DEFAULT NULL,
  `UpdateTs` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `t_transaction`
--

INSERT INTO `t_transaction` (`TransactionId`, `ClientId`, `TransactionTypeId`, `TransactionDate`, `InvoiceNo`, `PunchLocation`, `Longitude`, `Latitude`, `CustomerId`, `ContactPersonName`, `ContactPersonDesignation`, `ContactPersonMobileNumber`, `DropDownListIDForPurpose`, `DropDownListIDForTransportation`, `DropDownListIDForVisitAction`, `DropDownListIDForActivityResult`, `DropDownListIDForFunnelStatus`, `ConveyanceAmount`, `RefreshmentAmount`, `ApprovedConveyanceAmount`, `ApprovedRefreshmentAmount`, `PublicTransportDesc`, `DummyCustomerDesc`, `SelfDiscussion`, `SelfFollowUpDate`, `MachineId`, `MachineModelId`, `MachineSerial`, `MachineComplain`, `UserId`, `IsVisitorFeedback`, `IsLinemanFeedback`, `LMAdvice`, `LMFollowUpDate`, `ProductName`, `ProductDetails`, `TargetPrice`, `SalesOrderVolume`, `ExpectedPrice`, `FinalPrice`, `NegotiablePrice`, `OfferQuantity`, `RequiredQuantity`, `UpdateTs`, `CreateTs`) VALUES
(52, 1, 1, '2024-10-15 10:30:28', '20241015103028', 'House 11 Rd 33, Dhaka 1212, Bangladesh', '90.4147947', '23.7864844', 2, 'kangkan', 'dev', '019', 1, 19, NULL, NULL, NULL, 12.00, 200.00, NULL, NULL, 'bus', NULL, 'test kangkan', '2024-10-15', NULL, NULL, NULL, NULL, 3, 'Y', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-15 04:31:35', '2024-10-15 04:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `t_transaction_dropdown`
--

CREATE TABLE `t_transaction_dropdown` (
  `TransactionDropdownId` int(11) NOT NULL,
  `TransactionId` int(11) NOT NULL,
  `DropDownListID` smallint(3) NOT NULL,
  `CategoryID` smallint(3) NOT NULL,
  `Qty` float(10,2) DEFAULT NULL,
  `Remarks` varchar(150) DEFAULT NULL,
  `UpdateTs` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `t_transaction_dropdown`
--

INSERT INTO `t_transaction_dropdown` (`TransactionDropdownId`, `TransactionId`, `DropDownListID`, `CategoryID`, `Qty`, `Remarks`, `UpdateTs`, `CreateTs`) VALUES
(23, 52, 28, 8, NULL, NULL, '2024-10-15 04:31:35', '2024-10-15 04:31:35'),
(24, 52, 29, 8, NULL, NULL, '2024-10-15 04:31:35', '2024-10-15 04:31:35'),
(25, 52, 30, 8, NULL, NULL, '2024-10-15 04:31:35', '2024-10-15 04:31:35'),
(26, 52, 31, 8, NULL, NULL, '2024-10-15 04:31:35', '2024-10-15 04:31:35'),
(27, 52, 32, 8, NULL, NULL, '2024-10-15 04:31:35', '2024-10-15 04:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `t_transaction_machineparts`
--

CREATE TABLE `t_transaction_machineparts` (
  `TransactionMachinePartsId` int(11) NOT NULL,
  `TransactionId` int(11) NOT NULL,
  `MachinePartsId` smallint(3) NOT NULL,
  `Qty` float(10,2) DEFAULT NULL,
  `Remarks` varchar(150) DEFAULT NULL,
  `UpdateTs` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_transaction_type`
--

CREATE TABLE `t_transaction_type` (
  `TransactionTypeId` smallint(3) NOT NULL,
  `ClientId` smallint(6) NOT NULL COMMENT 'Will not use',
  `TransactionType` varchar(50) NOT NULL,
  `IsPositive` tinyint(1) NOT NULL DEFAULT 1,
  `UpdateTs` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `t_transaction_type`
--

INSERT INTO `t_transaction_type` (`TransactionTypeId`, `ClientId`, `TransactionType`, `IsPositive`, `UpdateTs`, `CreateTs`) VALUES
(1, 1, 'Customer Visit', 0, '2024-09-13 03:43:20', '2023-08-09 18:14:16'),
(2, 1, 'Visit Plan', 0, '2024-09-26 11:32:54', '2023-08-09 18:14:16'),
(3, 1, 'Phone Visit', 0, '2024-09-30 16:08:15', '2023-08-09 18:14:16'),
(4, 1, 'Sample', 0, '2024-09-30 16:08:28', '2023-08-09 18:14:16'),
(5, 1, 'Sales Funnel', 0, '2024-09-30 16:08:28', '2023-08-09 18:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `t_users`
--

CREATE TABLE `t_users` (
  `UserId` int(11) NOT NULL,
  `ClientId` smallint(6) NOT NULL,
  `BranchId` smallint(6) NOT NULL,
  `UserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LoginName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesignationId` smallint(3) NOT NULL,
  `DepartmentId` smallint(3) NOT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `TeamId` smallint(3) DEFAULT NULL,
  `LinemanUserId` int(11) DEFAULT NULL COMMENT 'This is for team leader',
  `BusinessLineId` smallint(3) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT 0,
  `PhotoUrl` varchar(200) DEFAULT NULL,
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdateTs` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_users`
--

INSERT INTO `t_users` (`UserId`, `ClientId`, `BranchId`, `UserName`, `LoginName`, `Email`, `Password`, `DesignationId`, `DepartmentId`, `Address`, `TeamId`, `LinemanUserId`, `BusinessLineId`, `IsActive`, `PhotoUrl`, `CreateTs`, `UpdateTs`) VALUES
(1, 1, 1, 'Admin User', 'admin', 'admin@gmail.com', '$2y$10$gLjCIc3IjTZPr7YkYsi2Ruqo2A8gxRoC8C2DO30wula7Lbphxuaam', 1, 2, NULL, NULL, NULL, 1, 1, 'user.jpg', '2023-08-10 00:14:16', '2023-08-10 00:14:16'),
(2, 1, 1, 'Rubel', 'rubel714', 'rubel714@gmail.com', '$2y$10$fjKAXsOQK7Z.ipS34dhgXu/oeljZo4VvveKvh3e64YA1UM9ggz7l.', 1, 2, NULL, NULL, NULL, 1, 1, 'rubel.jpg', '2023-08-10 00:14:16', '2023-08-10 00:14:16'),
(3, 1, 1, 'Kangkan', 'Kangkan', 'kangkan@gmail.com', '$2y$10$4KU8xziD8I2rYxiksFmIiumjSPHKeKKU9Iufw12JPFOfbgjjxxQVK', 2, 2, NULL, NULL, 4, 1, 1, '1722494317_fdhfhfthjfcjcfghjnxdfhn.jpeg', '2024-02-04 05:23:00', NULL),
(4, 1, 1, 'Kangkan01', 'Kangkan01', 'kangkan01@gmail.com', '$2y$10$4KU8xziD8I2rYxiksFmIiumjSPHKeKKU9Iufw12JPFOfbgjjxxQVK', 2, 2, NULL, NULL, NULL, 1, 1, '1722494317_fdhfhfthjfcjcfghjnxdfhn.jpeg', '2024-02-04 05:23:00', NULL),
(6, 1, 1, 'Monirul Islam', 'monir', 'monirul.islam@dysin.com', '$2y$10$m1n9isyrtTqt.xxErAN0I./5p9.ikttRlNnfj7I.aXpbi1LHDnDpe', 1, 2, 'na', NULL, 1, 1, 1, 'placeholder.png', '2024-10-15 05:02:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_user_role_map`
--

CREATE TABLE `t_user_role_map` (
  `UserRoleId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `RoleId` smallint(11) NOT NULL,
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdateTs` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_user_role_map`
--

INSERT INTO `t_user_role_map` (`UserRoleId`, `UserId`, `RoleId`, `CreateTs`, `UpdateTs`) VALUES
(1, 1, 1, '2023-08-10 00:14:16', '2023-08-10 00:14:16'),
(2, 2, 1, '2023-08-10 00:14:16', '2023-08-10 00:14:16'),
(3, 3, 1, '2024-02-04 05:23:00', NULL),
(5, 6, 1, '2024-10-15 05:02:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_year`
--

CREATE TABLE `t_year` (
  `YearId` int(11) NOT NULL,
  `ClientId` smallint(6) NOT NULL,
  `YearName` varchar(10) NOT NULL,
  `UpdateTs` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CreateTs` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `t_year`
--

INSERT INTO `t_year` (`YearId`, `ClientId`, `YearName`, `UpdateTs`, `CreateTs`) VALUES
(1, 1, '2023', '2024-04-26 18:25:59', '2024-04-26 18:25:59'),
(2, 1, '2024', '2024-04-26 18:25:59', '2024-04-26 18:25:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_branch`
--
ALTER TABLE `t_branch`
  ADD PRIMARY KEY (`BranchId`),
  ADD UNIQUE KEY `UK_t_branch_ClientId_BranchName` (`ClientId`,`BranchName`);

--
-- Indexes for table `t_businessline`
--
ALTER TABLE `t_businessline`
  ADD PRIMARY KEY (`BusinessLineId`),
  ADD UNIQUE KEY `UK_t_businessline_BusinessLineName` (`BusinessLineName`) USING BTREE;

--
-- Indexes for table `t_client`
--
ALTER TABLE `t_client`
  ADD PRIMARY KEY (`ClientId`),
  ADD UNIQUE KEY `UK_t_client_ClientName` (`ClientName`),
  ADD UNIQUE KEY `UK_t_client_ClientCode` (`ClientCode`);

--
-- Indexes for table `t_customer`
--
ALTER TABLE `t_customer`
  ADD PRIMARY KEY (`CustomerId`),
  ADD UNIQUE KEY `UK_t_customer_Client_CustomerName` (`ClientId`,`CustomerName`),
  ADD KEY `FK_t_customer_t_users` (`UserId`);

--
-- Indexes for table `t_department`
--
ALTER TABLE `t_department`
  ADD PRIMARY KEY (`DepartmentId`),
  ADD UNIQUE KEY `UK_t_designation_Client_Designation` (`DepartmentName`) USING BTREE;

--
-- Indexes for table `t_designation`
--
ALTER TABLE `t_designation`
  ADD PRIMARY KEY (`DesignationId`),
  ADD UNIQUE KEY `UK_t_designation_Client_Designation` (`ClientId`,`DesignationName`) USING BTREE;

--
-- Indexes for table `t_dropdowncategory`
--
ALTER TABLE `t_dropdowncategory`
  ADD PRIMARY KEY (`CategoryID`),
  ADD UNIQUE KEY `UK_t_dropdowncategory_CategoryName` (`CategoryName`) USING BTREE;

--
-- Indexes for table `t_dropdownlist`
--
ALTER TABLE `t_dropdownlist`
  ADD PRIMARY KEY (`DropDownListID`),
  ADD UNIQUE KEY `UK_t_machineparts_CategoryName_DisplayName` (`CategoryID`,`DisplayName`) USING BTREE;

--
-- Indexes for table `t_errorlog`
--
ALTER TABLE `t_errorlog`
  ADD PRIMARY KEY (`LogId`),
  ADD KEY `FK_t_errorlog_t_users` (`UserId`);

--
-- Indexes for table `t_machine`
--
ALTER TABLE `t_machine`
  ADD PRIMARY KEY (`MachineId`),
  ADD UNIQUE KEY `UK_t_machine_MachineName` (`MachineName`) USING BTREE;

--
-- Indexes for table `t_machinemodel`
--
ALTER TABLE `t_machinemodel`
  ADD PRIMARY KEY (`MachineModelId`),
  ADD UNIQUE KEY `UK_t_machinemodel_MachineModelName` (`MachineModelName`) USING BTREE,
  ADD KEY `FK_t_machinemodel_t_machine` (`MachineId`);

--
-- Indexes for table `t_machineparts`
--
ALTER TABLE `t_machineparts`
  ADD PRIMARY KEY (`MachinePartsId`),
  ADD UNIQUE KEY `UK_t_machineparts_MachinePartsName` (`MachinePartsName`) USING BTREE,
  ADD KEY `FK_t_machineparts_t_machine` (`MachineId`);

--
-- Indexes for table `t_machineserial`
--
ALTER TABLE `t_machineserial`
  ADD PRIMARY KEY (`MachineSerialId`),
  ADD UNIQUE KEY `UK_t_machineserial_Machine_Mode_Serial` (`MachineId`,`MachineModelId`,`MachineSerial`) USING BTREE,
  ADD KEY `FK_t_machineserial_t_machinemodel` (`MachineModelId`);

--
-- Indexes for table `t_menu`
--
ALTER TABLE `t_menu`
  ADD PRIMARY KEY (`MenuId`);

--
-- Indexes for table `t_month`
--
ALTER TABLE `t_month`
  ADD PRIMARY KEY (`MonthId`),
  ADD UNIQUE KEY `UK_t_month_MonthName` (`MonthName`);

--
-- Indexes for table `t_roles`
--
ALTER TABLE `t_roles`
  ADD PRIMARY KEY (`RoleId`),
  ADD UNIQUE KEY `UK_t_roles_RoleName` (`RoleName`);

--
-- Indexes for table `t_role_menu_map`
--
ALTER TABLE `t_role_menu_map`
  ADD PRIMARY KEY (`RoleMenuId`),
  ADD UNIQUE KEY `UK_t_role_menu_map_ClientBranchRoleMenu` (`ClientId`,`BranchId`,`RoleId`,`MenuId`),
  ADD KEY `FK_t_role_menu_map_t_branch` (`BranchId`),
  ADD KEY `FK_t_role_menu_map_t_roles` (`RoleId`),
  ADD KEY `FK_t_role_menu_map_t_menu` (`MenuId`);

--
-- Indexes for table `t_sqllog`
--
ALTER TABLE `t_sqllog`
  ADD PRIMARY KEY (`LogId`),
  ADD KEY `FK_t_sqllog_t_users` (`UserId`);

--
-- Indexes for table `t_status`
--
ALTER TABLE `t_status`
  ADD PRIMARY KEY (`StatusId`),
  ADD UNIQUE KEY `UK_t_status_StatusName` (`StatusName`);

--
-- Indexes for table `t_team`
--
ALTER TABLE `t_team`
  ADD PRIMARY KEY (`TeamId`),
  ADD UNIQUE KEY `UK_t_team_TeamName` (`TeamName`) USING BTREE;

--
-- Indexes for table `t_transaction`
--
ALTER TABLE `t_transaction`
  ADD PRIMARY KEY (`TransactionId`),
  ADD KEY `FK_t_transaction_t_client` (`ClientId`),
  ADD KEY `FK_t_transaction_t_customer` (`CustomerId`),
  ADD KEY `FK_t_transaction_t_machine` (`MachineId`),
  ADD KEY `FK_t_transaction_t_machinemodel` (`MachineModelId`),
  ADD KEY `FK_t_transaction_t_transaction_type` (`TransactionTypeId`),
  ADD KEY `FK_t_transaction_t_users` (`UserId`);

--
-- Indexes for table `t_transaction_dropdown`
--
ALTER TABLE `t_transaction_dropdown`
  ADD PRIMARY KEY (`TransactionDropdownId`),
  ADD KEY `FK_t_transaction_dropdown_t_transaction` (`TransactionId`),
  ADD KEY `FK_t_transaction_dropdown_t_dropdownlist` (`DropDownListID`);

--
-- Indexes for table `t_transaction_machineparts`
--
ALTER TABLE `t_transaction_machineparts`
  ADD PRIMARY KEY (`TransactionMachinePartsId`),
  ADD KEY `FK_t_transaction_machineparts_t_machineparts` (`MachinePartsId`),
  ADD KEY `FK_t_transaction_machineparts_t_transaction` (`TransactionId`);

--
-- Indexes for table `t_transaction_type`
--
ALTER TABLE `t_transaction_type`
  ADD PRIMARY KEY (`TransactionTypeId`),
  ADD UNIQUE KEY `UK_t_transaction_type_ClientTransType` (`ClientId`,`TransactionType`);

--
-- Indexes for table `t_users`
--
ALTER TABLE `t_users`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `UK_t_users_LoginName` (`LoginName`),
  ADD KEY `FK_t_users_t_branch` (`BranchId`),
  ADD KEY `FK_t_users_t_designation` (`DesignationId`),
  ADD KEY `FK_t_users_t_client` (`ClientId`),
  ADD KEY `FK_t_users_t_department` (`DepartmentId`),
  ADD KEY `FK_t_users_t_team` (`TeamId`),
  ADD KEY `FK_t_users_t_businessline` (`BusinessLineId`);

--
-- Indexes for table `t_user_role_map`
--
ALTER TABLE `t_user_role_map`
  ADD PRIMARY KEY (`UserRoleId`),
  ADD UNIQUE KEY `UK_t_role_menu_map_UserRole` (`UserId`,`RoleId`),
  ADD KEY `FK_t_user_role_map_t_roles` (`RoleId`);

--
-- Indexes for table `t_year`
--
ALTER TABLE `t_year`
  ADD PRIMARY KEY (`YearId`),
  ADD UNIQUE KEY `UK_t_year_ClientIdYearName` (`ClientId`,`YearName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_branch`
--
ALTER TABLE `t_branch`
  MODIFY `BranchId` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_businessline`
--
ALTER TABLE `t_businessline`
  MODIFY `BusinessLineId` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_client`
--
ALTER TABLE `t_client`
  MODIFY `ClientId` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_customer`
--
ALTER TABLE `t_customer`
  MODIFY `CustomerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `t_department`
--
ALTER TABLE `t_department`
  MODIFY `DepartmentId` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_designation`
--
ALTER TABLE `t_designation`
  MODIFY `DesignationId` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `t_dropdowncategory`
--
ALTER TABLE `t_dropdowncategory`
  MODIFY `CategoryID` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `t_dropdownlist`
--
ALTER TABLE `t_dropdownlist`
  MODIFY `DropDownListID` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `t_errorlog`
--
ALTER TABLE `t_errorlog`
  MODIFY `LogId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_machine`
--
ALTER TABLE `t_machine`
  MODIFY `MachineId` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `t_machinemodel`
--
ALTER TABLE `t_machinemodel`
  MODIFY `MachineModelId` smallint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_machineparts`
--
ALTER TABLE `t_machineparts`
  MODIFY `MachinePartsId` smallint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_machineserial`
--
ALTER TABLE `t_machineserial`
  MODIFY `MachineSerialId` smallint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_menu`
--
ALTER TABLE `t_menu`
  MODIFY `MenuId` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `t_month`
--
ALTER TABLE `t_month`
  MODIFY `MonthId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t_roles`
--
ALTER TABLE `t_roles`
  MODIFY `RoleId` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_role_menu_map`
--
ALTER TABLE `t_role_menu_map`
  MODIFY `RoleMenuId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `t_sqllog`
--
ALTER TABLE `t_sqllog`
  MODIFY `LogId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `t_status`
--
ALTER TABLE `t_status`
  MODIFY `StatusId` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_team`
--
ALTER TABLE `t_team`
  MODIFY `TeamId` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_transaction`
--
ALTER TABLE `t_transaction`
  MODIFY `TransactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `t_transaction_dropdown`
--
ALTER TABLE `t_transaction_dropdown`
  MODIFY `TransactionDropdownId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `t_transaction_machineparts`
--
ALTER TABLE `t_transaction_machineparts`
  MODIFY `TransactionMachinePartsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `t_transaction_type`
--
ALTER TABLE `t_transaction_type`
  MODIFY `TransactionTypeId` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `t_users`
--
ALTER TABLE `t_users`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_user_role_map`
--
ALTER TABLE `t_user_role_map`
  MODIFY `UserRoleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_year`
--
ALTER TABLE `t_year`
  MODIFY `YearId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_branch`
--
ALTER TABLE `t_branch`
  ADD CONSTRAINT `FK_t_branch_t_client` FOREIGN KEY (`ClientId`) REFERENCES `t_client` (`ClientId`);

--
-- Constraints for table `t_customer`
--
ALTER TABLE `t_customer`
  ADD CONSTRAINT `FK_t_customer_t_client` FOREIGN KEY (`ClientId`) REFERENCES `t_client` (`ClientId`),
  ADD CONSTRAINT `FK_t_customer_t_users` FOREIGN KEY (`UserId`) REFERENCES `t_users` (`UserId`);

--
-- Constraints for table `t_designation`
--
ALTER TABLE `t_designation`
  ADD CONSTRAINT `FK_t_designation_t_client` FOREIGN KEY (`ClientId`) REFERENCES `t_client` (`ClientId`);

--
-- Constraints for table `t_dropdownlist`
--
ALTER TABLE `t_dropdownlist`
  ADD CONSTRAINT `FK_t_dropdownlist_t_dropdowncategory` FOREIGN KEY (`CategoryID`) REFERENCES `t_dropdowncategory` (`CategoryID`);

--
-- Constraints for table `t_errorlog`
--
ALTER TABLE `t_errorlog`
  ADD CONSTRAINT `FK_t_errorlog_t_users` FOREIGN KEY (`UserId`) REFERENCES `t_users` (`UserId`);

--
-- Constraints for table `t_machinemodel`
--
ALTER TABLE `t_machinemodel`
  ADD CONSTRAINT `FK_t_machinemodel_t_machine` FOREIGN KEY (`MachineId`) REFERENCES `t_machine` (`MachineId`);

--
-- Constraints for table `t_machineparts`
--
ALTER TABLE `t_machineparts`
  ADD CONSTRAINT `FK_t_machineparts_t_machine` FOREIGN KEY (`MachineId`) REFERENCES `t_machine` (`MachineId`);

--
-- Constraints for table `t_machineserial`
--
ALTER TABLE `t_machineserial`
  ADD CONSTRAINT `FK_t_machineserial_t_machine` FOREIGN KEY (`MachineId`) REFERENCES `t_machine` (`MachineId`),
  ADD CONSTRAINT `FK_t_machineserial_t_machinemodel` FOREIGN KEY (`MachineModelId`) REFERENCES `t_machinemodel` (`MachineModelId`);

--
-- Constraints for table `t_role_menu_map`
--
ALTER TABLE `t_role_menu_map`
  ADD CONSTRAINT `FK_t_role_menu_map_t_branch` FOREIGN KEY (`BranchId`) REFERENCES `t_branch` (`BranchId`),
  ADD CONSTRAINT `FK_t_role_menu_map_t_client` FOREIGN KEY (`ClientId`) REFERENCES `t_client` (`ClientId`),
  ADD CONSTRAINT `FK_t_role_menu_map_t_menu` FOREIGN KEY (`MenuId`) REFERENCES `t_menu` (`MenuId`),
  ADD CONSTRAINT `FK_t_role_menu_map_t_roles` FOREIGN KEY (`RoleId`) REFERENCES `t_roles` (`RoleId`);

--
-- Constraints for table `t_sqllog`
--
ALTER TABLE `t_sqllog`
  ADD CONSTRAINT `FK_t_sqllog_t_users` FOREIGN KEY (`UserId`) REFERENCES `t_users` (`UserId`);

--
-- Constraints for table `t_transaction`
--
ALTER TABLE `t_transaction`
  ADD CONSTRAINT `FK_t_transaction_t_client` FOREIGN KEY (`ClientId`) REFERENCES `t_client` (`ClientId`),
  ADD CONSTRAINT `FK_t_transaction_t_customer` FOREIGN KEY (`CustomerId`) REFERENCES `t_customer` (`CustomerId`),
  ADD CONSTRAINT `FK_t_transaction_t_machine` FOREIGN KEY (`MachineId`) REFERENCES `t_machine` (`MachineId`),
  ADD CONSTRAINT `FK_t_transaction_t_machinemodel` FOREIGN KEY (`MachineModelId`) REFERENCES `t_machinemodel` (`MachineModelId`),
  ADD CONSTRAINT `FK_t_transaction_t_transaction_type` FOREIGN KEY (`TransactionTypeId`) REFERENCES `t_transaction_type` (`TransactionTypeId`),
  ADD CONSTRAINT `FK_t_transaction_t_users` FOREIGN KEY (`UserId`) REFERENCES `t_users` (`UserId`);

--
-- Constraints for table `t_transaction_dropdown`
--
ALTER TABLE `t_transaction_dropdown`
  ADD CONSTRAINT `FK_t_transaction_dropdown_t_dropdownlist` FOREIGN KEY (`DropDownListID`) REFERENCES `t_dropdownlist` (`DropDownListID`),
  ADD CONSTRAINT `FK_t_transaction_dropdown_t_transaction` FOREIGN KEY (`TransactionId`) REFERENCES `t_transaction` (`TransactionId`);

--
-- Constraints for table `t_transaction_machineparts`
--
ALTER TABLE `t_transaction_machineparts`
  ADD CONSTRAINT `FK_t_transaction_machineparts_t_machineparts` FOREIGN KEY (`MachinePartsId`) REFERENCES `t_machineparts` (`MachinePartsId`),
  ADD CONSTRAINT `FK_t_transaction_machineparts_t_transaction` FOREIGN KEY (`TransactionId`) REFERENCES `t_transaction` (`TransactionId`);

--
-- Constraints for table `t_transaction_type`
--
ALTER TABLE `t_transaction_type`
  ADD CONSTRAINT `FK_t_transaction_type_t_client` FOREIGN KEY (`ClientId`) REFERENCES `t_client` (`ClientId`);

--
-- Constraints for table `t_users`
--
ALTER TABLE `t_users`
  ADD CONSTRAINT `FK_t_users_t_branch` FOREIGN KEY (`BranchId`) REFERENCES `t_branch` (`BranchId`),
  ADD CONSTRAINT `FK_t_users_t_businessline` FOREIGN KEY (`BusinessLineId`) REFERENCES `t_businessline` (`BusinessLineId`),
  ADD CONSTRAINT `FK_t_users_t_client` FOREIGN KEY (`ClientId`) REFERENCES `t_client` (`ClientId`),
  ADD CONSTRAINT `FK_t_users_t_department` FOREIGN KEY (`DepartmentId`) REFERENCES `t_department` (`DepartmentId`),
  ADD CONSTRAINT `FK_t_users_t_designation` FOREIGN KEY (`DesignationId`) REFERENCES `t_designation` (`DesignationId`),
  ADD CONSTRAINT `FK_t_users_t_team` FOREIGN KEY (`TeamId`) REFERENCES `t_team` (`TeamId`);

--
-- Constraints for table `t_user_role_map`
--
ALTER TABLE `t_user_role_map`
  ADD CONSTRAINT `FK_t_user_role_map_t_roles` FOREIGN KEY (`RoleId`) REFERENCES `t_roles` (`RoleId`),
  ADD CONSTRAINT `FK_t_user_role_map_t_users` FOREIGN KEY (`UserId`) REFERENCES `t_users` (`UserId`);

--
-- Constraints for table `t_year`
--
ALTER TABLE `t_year`
  ADD CONSTRAINT `FK_t_year_t_client` FOREIGN KEY (`ClientId`) REFERENCES `t_client` (`ClientId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
