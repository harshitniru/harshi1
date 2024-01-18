-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2024 at 05:55 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `harshi1`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `Book_Id` int(11) NOT NULL,
  `Title` varchar(40) DEFAULT NULL,
  `Publisher_Name` varchar(20) DEFAULT NULL,
  `Pub_Year` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`Book_Id`, `Title`, `Publisher_Name`, `Pub_Year`) VALUES
(101, 'Python', 'Yashu', '2001'),
(102, 'Java', 'Manju', '2000'),
(103, 'html', 'Sonu', '0000'),
(104, 'C++', 'Manya', '2005');

-- --------------------------------------------------------

--
-- Stand-in structure for view `books_avail`
-- (See below for the actual view)
--
CREATE TABLE `books_avail` (
`Book_Id` int(11)
,`Title` varchar(40)
,`No_of_Copies` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `book_authors`
--

CREATE TABLE `book_authors` (
  `Book_Id` int(11) NOT NULL,
  `Author_Name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_authors`
--

INSERT INTO `book_authors` (`Book_Id`, `Author_Name`) VALUES
(101, 'Nagesh'),
(102, 'Savitha'),
(103, 'Lavanya'),
(104, 'Pruthvi');

-- --------------------------------------------------------

--
-- Table structure for table `book_copies`
--

CREATE TABLE `book_copies` (
  `Book_Id` int(11) NOT NULL,
  `Program_Id` int(11) NOT NULL,
  `No_of_Copies` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_copies`
--

INSERT INTO `book_copies` (`Book_Id`, `Program_Id`, `No_of_Copies`) VALUES
(101, 51, 20),
(102, 52, 15),
(103, 53, 10),
(104, 54, 5);

-- --------------------------------------------------------

--
-- Table structure for table `book_lending`
--

CREATE TABLE `book_lending` (
  `Book_Id` int(11) NOT NULL,
  `Program_Id` int(11) NOT NULL,
  `Card_No` int(11) NOT NULL,
  `Date_Out` date DEFAULT NULL,
  `Due_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_lending`
--

INSERT INTO `book_lending` (`Book_Id`, `Program_Id`, `Card_No`, `Date_Out`, `Due_Date`) VALUES
(101, 51, 1, '2017-01-01', '2017-04-03'),
(102, 52, 1, '2017-02-02', '2017-03-15'),
(103, 52, 1, '2017-02-14', '2017-05-14'),
(103, 53, 2, '2017-01-10', '2017-06-01'),
(104, 51, 1, '2017-01-10', '2017-03-15'),
(104, 54, 2, '2018-02-10', '2018-03-15');

-- --------------------------------------------------------

--
-- Stand-in structure for view `book_view`
-- (See below for the actual view)
--
CREATE TABLE `book_view` (
`PUB_YEAR` year(4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `book_view1`
-- (See below for the actual view)
--
CREATE TABLE `book_view1` (
`PUB_YEAR` year(4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `book_view2`
-- (See below for the actual view)
--
CREATE TABLE `book_view2` (
`PUB_YEAR` year(4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `book_view4`
-- (See below for the actual view)
--
CREATE TABLE `book_view4` (
`PUB_YEAR` year(4)
);

-- --------------------------------------------------------

--
-- Table structure for table `library_program`
--

CREATE TABLE `library_program` (
  `Program_Id` int(11) NOT NULL,
  `Program_Name` varchar(20) DEFAULT NULL,
  `Address` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `library_program`
--

INSERT INTO `library_program` (`Program_Id`, `Program_Name`, `Address`) VALUES
(51, 'CSE', 'Mysore'),
(52, 'ISE', 'Jaipur'),
(53, 'EC', 'Delhi'),
(54, 'EEE', 'Kerala'),
(55, 'Civil', 'Mandya');

-- --------------------------------------------------------

--
-- Stand-in structure for view `p1`
-- (See below for the actual view)
--
CREATE TABLE `p1` (
`Book_Id` int(11)
,`Title` varchar(40)
,`Publisher_Name` varchar(20)
,`Pub_Year` year(4)
);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `Name` varchar(20) NOT NULL,
  `Address` varchar(40) DEFAULT NULL,
  `Phone` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`Name`, `Address`, `Phone`) VALUES
('Manju', 'Bangalore', 9148644600),
('Manya', 'Mysore', 9964733372),
('Sonu', 'Mandya', 9164922649),
('Teju', 'Manglore', 9164024258),
('Yashu', 'Maddur', 9148644680);

-- --------------------------------------------------------

--
-- Structure for view `books_avail`
--
DROP TABLE IF EXISTS `books_avail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `books_avail`  AS SELECT `b`.`Book_Id` AS `Book_Id`, `b`.`Title` AS `Title`, `c`.`No_of_Copies` AS `No_of_Copies` FROM (`book` `b` join `book_copies` `c`) WHERE `b`.`Book_Id` = `c`.`Book_Id` ;

-- --------------------------------------------------------

--
-- Structure for view `book_view`
--
DROP TABLE IF EXISTS `book_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book_view`  AS SELECT `book`.`Pub_Year` AS `PUB_YEAR` FROM `book` ;

-- --------------------------------------------------------

--
-- Structure for view `book_view1`
--
DROP TABLE IF EXISTS `book_view1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book_view1`  AS SELECT `book`.`Pub_Year` AS `PUB_YEAR` FROM `book` WHERE `book`.`Pub_Year` between 2001 and 2004 ;

-- --------------------------------------------------------

--
-- Structure for view `book_view2`
--
DROP TABLE IF EXISTS `book_view2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book_view2`  AS SELECT `book`.`Pub_Year` AS `PUB_YEAR` FROM `book` WHERE `book`.`Pub_Year` between 2001 and 2011 ;

-- --------------------------------------------------------

--
-- Structure for view `book_view4`
--
DROP TABLE IF EXISTS `book_view4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book_view4`  AS SELECT `book`.`Pub_Year` AS `PUB_YEAR` FROM `book` WHERE `book`.`Pub_Year` between '2001' and '2011' ;

-- --------------------------------------------------------

--
-- Structure for view `p1`
--
DROP TABLE IF EXISTS `p1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `p1`  AS SELECT `book`.`Book_Id` AS `Book_Id`, `book`.`Title` AS `Title`, `book`.`Publisher_Name` AS `Publisher_Name`, `book`.`Pub_Year` AS `Pub_Year` FROM `book` WHERE `book`.`Pub_Year` between '2001' and '2004' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Book_Id`),
  ADD KEY `Publisher_Name` (`Publisher_Name`);

--
-- Indexes for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD PRIMARY KEY (`Book_Id`);

--
-- Indexes for table `book_copies`
--
ALTER TABLE `book_copies`
  ADD PRIMARY KEY (`Book_Id`,`Program_Id`),
  ADD KEY `Program_Id` (`Program_Id`);

--
-- Indexes for table `book_lending`
--
ALTER TABLE `book_lending`
  ADD PRIMARY KEY (`Book_Id`,`Program_Id`,`Card_No`),
  ADD KEY `Program_Id` (`Program_Id`);

--
-- Indexes for table `library_program`
--
ALTER TABLE `library_program`
  ADD PRIMARY KEY (`Program_Id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`Name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`Publisher_Name`) REFERENCES `publisher` (`Name`);

--
-- Constraints for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`Book_Id`) REFERENCES `book` (`Book_Id`) ON DELETE CASCADE;

--
-- Constraints for table `book_copies`
--
ALTER TABLE `book_copies`
  ADD CONSTRAINT `book_copies_ibfk_1` FOREIGN KEY (`Book_Id`) REFERENCES `book` (`Book_Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_copies_ibfk_2` FOREIGN KEY (`Program_Id`) REFERENCES `library_program` (`Program_Id`) ON DELETE CASCADE;

--
-- Constraints for table `book_lending`
--
ALTER TABLE `book_lending`
  ADD CONSTRAINT `book_lending_ibfk_1` FOREIGN KEY (`Book_Id`) REFERENCES `book` (`Book_Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_lending_ibfk_2` FOREIGN KEY (`Program_Id`) REFERENCES `library_program` (`Program_Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
