-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 11, 2023 at 07:00 PM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id21141477_grc`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `AdminName` varchar(200) NOT NULL,
  `EmailId` varchar(150) NOT NULL,
  `ContactNumber` bigint(12) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `AdminName`, `EmailId`, `ContactNumber`, `password`, `updationDate`) VALUES
(1, 'GPA', 'gpa1051', 'gpawasari@gmail.com', 1234567890, 'f925916e2754e5e03f75dd58a5733251', '11-05-2021 04:18:16'),
(2, 'mahesh', 'mahesh', 'mahesh.yadav250502@gmail.com', 0, 'ea9061a4c109b0a6898dbbd911bee2f1', ''),
(5, 'mahesh', 'mahesh', 'mahesh.yadav250502@gmail.com', 0, 'Mahesh@0', '');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(1, 'E-commerce', 'E-commerce', '2020-06-21 07:06:04', '2020-06-27 18:56:17'),
(2, 'Other', 'Other', '2020-06-22 18:30:00', '2020-06-27 18:59:53');

-- --------------------------------------------------------

--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL,
  `complaintNumber` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `remarkDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `stateName` varchar(255) DEFAULT NULL,
  `stateDescription` tinytext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `stateName`, `stateDescription`, `postingDate`, `updationDate`) VALUES
(1, 'Delhi', 'India Capital', '2020-06-27 19:18:02', NULL),
(2, 'Punjab', 'Punjab', '2020-06-27 19:18:14', NULL),
(3, 'Haryana', 'HR', '2020-06-27 19:18:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(1, 1, 'Online Shopping', '2020-03-28 07:11:07', '2020-06-27 18:56:39'),
(2, 1, 'E-wllaet', '2020-03-28 07:11:20', '2020-06-27 18:56:44'),
(5, 2, 'asd', '2023-07-30 06:38:21', NULL),
(6, 2, 'asd', '2023-07-30 06:41:41', NULL),
(8, 2, 'asd', '2023-07-30 06:44:46', NULL),
(10, 2, 'asd', '2023-07-30 06:46:10', NULL),
(11, 2, 'asd', '2023-07-30 06:47:06', NULL),
(13, 1, 'mahesh', '2023-07-30 06:50:40', NULL),
(14, 1, 'mahesh', '2023-07-30 06:50:55', NULL),
(15, 1, 'akash', '2023-07-30 06:51:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `complaintType` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `noc` varchar(255) DEFAULT NULL,
  `complaintDetails` mediumtext DEFAULT NULL,
  `complaintFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcomplaints`
--

INSERT INTO `tblcomplaints` (`complaintNumber`, `userId`, `category`, `subcategory`, `complaintType`, `state`, `noc`, `complaintDetails`, `complaintFile`, `regDate`, `status`, `lastUpdationDate`) VALUES
(1, 2, 1, 'Online Shopping', ' Complaint', 'Delhi', 'Test Complaint', 'This is test complaint', '', '2020-06-28 13:20:55', 'closed', '2020-06-28 13:27:41'),
(2, 4, 2, 'other', ' Complaint', 'Delhi', 'Parent', 'gvy', '', '2023-07-24 15:58:16', '', '2023-07-25 18:29:50'),
(3, 4, 1, 'E-wllaet', 'General Query', 'Delhi', 'Student', 'Hi', '', '2023-07-25 14:07:53', NULL, NULL),
(4, 4, 1, 'Online Shopping', ' Complaint', 'Punjab', 'Teacher', 'sdf', '', '2023-07-25 15:57:48', NULL, NULL),
(5, 4, 1, 'E-wllaet', 'General Query', 'Punjab', 'Parent', 'sc', '', '2023-07-25 18:33:44', NULL, NULL),
(6, 4, 2, 'other', 'General Query', 'Haryana', 'Parent', 'df', '', '2023-07-25 18:33:57', NULL, NULL),
(7, 4, 1, 'Online Shopping', 'General Query', 'Punjab', 'Teacher', 's', '', '2023-07-25 18:34:11', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblforwardhistory`
--

CREATE TABLE `tblforwardhistory` (
  `id` int(11) NOT NULL,
  `ComplaintNumber` bigint(12) DEFAULT NULL,
  `ForwardFrom` int(6) DEFAULT NULL,
  `ForwardTo` int(6) DEFAULT NULL,
  `ForwadDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblforwardhistory`
--

INSERT INTO `tblforwardhistory` (`id`, `ComplaintNumber`, `ForwardFrom`, `ForwardTo`, `ForwadDate`) VALUES
(1, 1, 1, 2, '2020-06-28 13:22:58'),
(2, 2, 4, 2, '2023-07-25 14:10:38'),
(3, 3, 4, 1, '2023-07-25 14:11:25'),
(4, 4, 4, 4, '2023-07-25 16:00:32'),
(5, 5, 4, 7, '2023-07-25 18:34:28'),
(6, 6, 4, 5, '2023-07-25 18:34:43'),
(7, 7, 4, 6, '2023-07-25 18:35:30');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubadmin`
--

CREATE TABLE `tblsubadmin` (
  `id` int(11) NOT NULL,
  `SubAdminName` varchar(150) DEFAULT NULL,
  `Department` varchar(150) DEFAULT NULL,
  `EmailId` varchar(150) DEFAULT NULL,
  `ContactNumber` bigint(12) DEFAULT NULL,
  `UserName` varchar(12) DEFAULT NULL,
  `Password` varchar(150) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `LastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IsActive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsubadmin`
--

INSERT INTO `tblsubadmin` (`id`, `SubAdminName`, `Department`, `EmailId`, `ContactNumber`, `UserName`, `Password`, `RegDate`, `LastUpdationDate`, `IsActive`) VALUES
(1, 'Anuj kumar', 'Information Technology', 'test@gmail.com', 1234567890, 'anujk30', '5c428d8875d2948607f3e3fe134d71b4', '2020-06-28 13:00:51', '2020-06-28 13:01:20', 1),
(2, 'Test subadmin', 'Finace', 'testsa@gmail.com', 1234567890, 'testsa', 'f925916e2754e5e03f75dd58a5733251', '2020-06-28 13:22:17', NULL, 1),
(3, 'abc', 'Scholarship', 'scholarship@nmiet.in', 9999999999, 'scholarship', 'f03d4854848716a1087ee0bdbe549594', '2023-07-25 15:54:38', NULL, 1),
(4, 'pqr', 'Fees', 'Fees@nmiet.in', 1111111111, 'fees', 'a1ff09453cc85d1a8cc7fb1f4911f8e4', '2023-07-25 15:55:12', NULL, 1),
(5, 'Internal', 'Principle', 'principle@nmiet.in', 2222222222, 'principle', 'fd36d69b2066042bc6bce637cb86ebde', '2023-07-25 15:56:13', NULL, 1),
(6, 'HOD', 'Information Technology', 'IT@nmiet.in', 3333333333, 'IT', 'cd32106bcb6de321930cf34574ea388c', '2023-07-25 15:57:02', NULL, 1),
(7, 'HOD', 'Civil', 'civil@nmiet.in', 4444444444, 'civil', '6af2462065474ec7892340e39339eb38', '2023-07-25 15:57:32', NULL, 1),
(8, 'mahesh', 'it', 'mahesh.yadav250502@gmail.com', 1111111111, 'mahesh.yadav', '35ac69d6aca6f0cc237fe9ab752673e2', '2023-07-26 14:06:53', NULL, 1),
(9, 'omkar ', 'mechanical', 'omkar@gmail.com', 5555555555, 'omkarsubadmi', '68115705108ddd6f7ba9a458bb175363', '2023-07-26 14:29:50', NULL, 1),
(10, 'Saurabh', 'civil', 'saurabh@gmail.con', 6666666666, 'saurabh', '133057facf49cbe6520b15a4d96ee395', '2023-07-26 14:32:56', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblsubadminremark`
--

CREATE TABLE `tblsubadminremark` (
  `id` int(11) NOT NULL,
  `ComplainNumber` bigint(12) DEFAULT NULL,
  `ComplainStatus` varchar(20) DEFAULT NULL,
  `ComplainRemark` mediumtext DEFAULT NULL,
  `RemarkBy` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsubadminremark`
--

INSERT INTO `tblsubadminremark` (`id`, `ComplainNumber`, `ComplainStatus`, `ComplainRemark`, `RemarkBy`, `PostingDate`) VALUES
(1, 1, 'closed', 'Complaint closed.', 2, '2020-06-28 13:27:41');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 0, 'phpgurukulteam@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-27 19:14:33', '', 0),
(2, 1, 'phpgurukultest@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-27 19:15:08', '28-06-2020 12:47:04 AM', 1),
(3, 2, 'testuser@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-28 13:19:32', '28-06-2020 06:51:17 PM', 1),
(4, 2, 'testuser@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-28 14:12:03', '', 1),
(5, 3, 'r9359840@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-23 17:50:52', '', 1),
(6, 0, 'mahesh', 0x3a3a3100000000000000000000000000, '2023-07-24 15:50:56', '', 0),
(7, 0, 'mahesh', 0x3a3a3100000000000000000000000000, '2023-07-24 15:56:44', '', 0),
(8, 0, 'mahesh.yadav', 0x3a3a3100000000000000000000000000, '2023-07-24 15:56:55', '', 0),
(9, 0, 'mahesh.yadav250502@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-24 15:57:02', '', 0),
(10, 0, 'mahesh.yadav250502@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-24 15:57:40', '', 0),
(11, 4, 'mahesh.yadav250502@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-24 15:57:49', '', 1),
(12, 0, 'mahesh.yadav250502@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-25 14:07:23', '', 0),
(13, 4, 'mahesh.yadav250502@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-25 14:07:31', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contactNo` bigint(11) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `userEmail`, `password`, `contactNo`, `address`, `State`, `country`, `pincode`, `userImage`, `regDate`, `updationDate`, `status`) VALUES
(1, 'Anuj kumar', 'phpgurukultest@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 1234567890, NULL, NULL, NULL, NULL, '1fc8381ccac933612936bb617a5ae906.png', '2020-06-27 19:14:17', NULL, 1),
(2, 'Test user', 'testuser@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 1234567899, 'New Delhi', 'Delhi', 'India', 110091, '1fc8381ccac933612936bb617a5ae906.png', '2020-06-28 13:19:15', NULL, 1),
(3, 'mahesh', 'r9359840@gmail.com', '35ac69d6aca6f0cc237fe9ab752673e2', 9359840399, NULL, NULL, NULL, NULL, NULL, '2023-07-23 17:50:41', NULL, 1),
(4, 'mahesh', 'mahesh.yadav250502@gmail.com', '35ac69d6aca6f0cc237fe9ab752673e2', 9359840399, NULL, NULL, NULL, NULL, NULL, '2023-07-24 15:57:31', NULL, 1),
(5, 'omkar yadav', 'omkar@gmail.com', '8c8fc186ffa46ad0bb06e0adc9f7fb97', 1234567890, NULL, NULL, NULL, NULL, NULL, '2023-08-17 21:16:36', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  ADD PRIMARY KEY (`complaintNumber`);

--
-- Indexes for table `tblforwardhistory`
--
ALTER TABLE `tblforwardhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubadmin`
--
ALTER TABLE `tblsubadmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubadminremark`
--
ALTER TABLE `tblsubadminremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblforwardhistory`
--
ALTER TABLE `tblforwardhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblsubadmin`
--
ALTER TABLE `tblsubadmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblsubadminremark`
--
ALTER TABLE `tblsubadminremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
