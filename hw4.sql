-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 19, 2017 at 04:50 AM
-- Server version: 5.6.34-log
-- PHP Version: 7.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hw4`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `Author-id` int(11) NOT NULL,
  `Author_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`Author-id`, `Author_name`) VALUES
(1, 'Giada De Laurentiis'),
(2, 'J K. Rowling'),
(3, 'James McGovern'),
(4, 'Per Bothner'),
(5, 'Kurt Cagle'),
(6, 'James Linn'),
(7, 'Vaidyanathan Nagarajan'),
(8, 'Erik T. Ray');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book-id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book-id`, `title`, `year`, `price`, `category`) VALUES
(1, 'Everyday Italian', 2005, 30, 'cooking'),
(2, 'Harry Potter', 2005, 30, 'children'),
(3, 'XQuery Kick Start', 2003, 50, 'web'),
(4, 'Learning XML', 2003, 40, 'web');

-- --------------------------------------------------------

--
-- Table structure for table `book_authors`
--

CREATE TABLE `book_authors` (
  `Book-id` int(11) NOT NULL,
  `Author-id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_authors`
--

INSERT INTO `book_authors` (`Book-id`, `Author-id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`Author-id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book-id`);

--
-- Indexes for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD KEY `Author-id_FK` (`Author-id`),
  ADD KEY `Book-id_FK` (`Book-id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `Author-id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book-id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD CONSTRAINT `Author-id_FK` FOREIGN KEY (`Author-id`) REFERENCES `authors` (`Author-id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Book-id_FK` FOREIGN KEY (`Book-id`) REFERENCES `book` (`book-id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
