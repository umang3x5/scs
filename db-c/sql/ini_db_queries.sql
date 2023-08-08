-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2022 at 09:38 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

ALTER USER 'root'@'%' IDENTIFIED WITH 'mysql_native_password' BY '';

CREATE DATABASE IF NOT EXISTS scs;

USE scs;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE  IF NOT EXISTS `inventory` (
  `RFID` bigint(20) NOT NULL,
  `deviceID` int(11) NOT NULL,
  `uID` int(11) NOT NULL,
  `cType` int(11) NOT NULL,
  `usedBeforeWash` int(11) NOT NULL,
  `availableInCloset` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`RFID`, `deviceID`, `uID`, `cType`, `usedBeforeWash`, `availableInCloset`) VALUES
(123456785, 123456, 5857572, 9, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `super_user`
--

CREATE TABLE  IF NOT EXISTS `super_user` (
  `deviceID` int(11) NOT NULL,
  `devicename` varchar(255) NOT NULL,
  `pin` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `super_user`
--

INSERT INTO `super_user` (`deviceID`, `devicename`, `pin`) VALUES
(123456, 'Mydevice', 123456);

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE  IF NOT EXISTS `user_profile` (
  `uID` int(11) NOT NULL,
  `deviceID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`uID`, `deviceID`, `username`, `firstname`, `lastname`, `gender`, `age`, `city`) VALUES
(5857572, 123456, 'meet', 'Meet', 'Kevadiya', 'male', 22, 'Windsor'),
(5857573, 123456, 'arjun', 'Arjun', 'Kheni', 'male', 22, 'Windsor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`RFID`,`deviceID`);

--
-- Indexes for table `super_user`
--
ALTER TABLE `super_user`
  ADD PRIMARY KEY (`deviceID`),
  ADD UNIQUE KEY `username` (`devicename`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`uID`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `uID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5857574;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- Migrations
ALTER TABLE `super_user` CHANGE `deviceID` `deviceID` VARCHAR(255) NOT NULL;
ALTER TABLE `user_profile` CHANGE `deviceID` `deviceID` VARCHAR(255) NOT NULL;

ALTER TABLE `inventory` ADD `cSubType` INT(11) NOT NULL AFTER `cType`;
ALTER TABLE `inventory` CHANGE `deviceID` `deviceID` VARCHAR(255) NOT NULL;

ALTER TABLE `super_user` ADD `lat` FLOAT NULL AFTER `pin`;
ALTER TABLE `super_user` ADD `long` FLOAT NULL AFTER `lat`;
ALTER TABLE `inventory` CHANGE `usedBeforeWash` `used` INT(11) NOT NULL;
ALTER TABLE `super_user` ADD `city` VARCHAR(255) NOT NULL AFTER `pin`;
ALTER TABLE `user_profile` DROP `city`;

ALTER TABLE `user_profile` ADD `email` VARCHAR(255) NOT NULL ;