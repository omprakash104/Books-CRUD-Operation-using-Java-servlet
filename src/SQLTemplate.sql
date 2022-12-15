/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Om prakash
 * Created: Jun 11, 2020
 */
-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2020 at 08:13 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `courseworkdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `name`, `email`, `password`) VALUES
(5, 'om', 'om@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `name` varchar(40) NOT NULL,
  `activity_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `activity` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`name`, `activity_date`, `activity`) VALUES
('asdf', '2020-06-10 08:08:37', 'User Registered'),
('asdfg', '2020-06-10 08:11:08', 'User Registered');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `question` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `question`) VALUES
(1, '--Select Question:--'),
(2, 'What is your Pet Name ?'),
(3, 'What is your best friend name ?'),
(4, 'What was the last name of your favourite teacher?'),
(5, 'Where were you when you had your first kiss?');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(18) NOT NULL,
  `conpass` varchar(18) NOT NULL,
  `Question` varchar(50) NOT NULL,
  `Answer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `name`, `password`, `conpass`, `Question`, `Answer`) VALUES
(2, 'om', '12345', '12345', '', ''),
(5, 'omp', '12345', '12345', '', ''),
(6, 'mhesh', '12345', '12345', '', ''),
(7, 'om', '12345', 'asdfgh', '', ''),
(8, 'nilesh', 'nilesh', 'nilesh', '', ''),
(9, 'nisha', 'nisha@##', 'nisha@##', '', ''),
(10, 'sd', 'asda', 'asda', '', ''),
(11, 'asdf', 'adsfd', 'asdf', '', ''),
(12, 'kundan', 'kundan', 'kundan', '', ''),
(13, 'asas', 'asd', 'asdf', '', ''),
(14, 'asd', 'asda', 'asd', '', ''),
(15, 'asdf', 'asdf', 'asdf', '', ''),
(16, 'asdfsdfg', 'sdfg', 'sdfg', 'What is your best friend name ?', 'sdfghjk'),
(17, 'om', '12345', '123', 'What was the last name of your favourite teacher?', 'shrestha'),
(18, 'asdfgh', 'asdf', 'sdfg', 'Where were you when you had your first kiss?', 'asdfg'),
(19, 'asdf', 'asdf', 'adf', 'What is your best friend name ?', 'asdfg'),
(20, 'asdfg', 'sdfg', 'sd', 'What is your best friend name ?', 'asdfg'),
(21, 'asdfgw', 'esdf', 'sdfg', 'What is your best friend name ?', 'sdfgh'),
(22, 'asdf', 'asdfg', 'asdf', 'What is your best friend name ?', 'asdfgh'),
(23, 'asdfg', 'asdf', 'asdf', 'What is your best friend name ?', 'asdfg');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `user_deleted_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`report_id`, `name`, `user_deleted_date`) VALUES
(1, 'om2', '2020-06-10'),
(2, 'nisha', '2020-06-10');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `contactno` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `confirmpass` varchar(20) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `contactno`, `password`, `confirmpass`, `date`) VALUES
(3, 'asdd', 'asd@sad', '1245', 'asa', 'asdsd', '2020-06-03 00:00:00'),
(4, 'aaaasd', 'asd@sad', '12445', 'asdf', 'asdsd', '2020-06-03 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


