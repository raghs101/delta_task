-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Jun 01, 2023 at 12:22 PM
-- Server version: 8.0.33
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php_docker`
--

-- --------------------------------------------------------

--
-- Table structure for table `studentDetail`
--

CREATE TABLE `studentDetail` (
  `Name` varchar(255) DEFAULT NULL,
  `RollNumber` int DEFAULT NULL,
  `Hostel` varchar(255) DEFAULT NULL,
  `Room` int DEFAULT NULL,
  `Mess` int DEFAULT NULL,
  `MessPref` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `studentDetail`
--

INSERT INTO `studentDetail` (`Name`, `RollNumber`, `Hostel`, `Room`, `Mess`, `MessPref`) VALUES
('Jennee', 102122001, 'GarnetA', 0, 1, '-'),
('Jacquelin', 102122002, 'GarnetA', 0, 3, '-'),
('Barbaraanne', 102122003, 'GarnetA', 1, 1, '-'),
('Doe', 102122004, 'GarnetA', 1, 2, '-'),
('Godiva', 102122005, 'GarnetA', 2, 3, '-'),
('Karla', 102122006, 'GarnetA', 2, 2, '-'),
('Lian', 102122007, 'GarnetA', 3, 2, '-'),
('Aili', 102122008, 'GarnetA', 3, 3, '-'),
('Sigrid', 102122009, 'GarnetA', 4, 1, '-'),
('Aimil', 102122010, 'GarnetA', 4, 1, '-'),
('Katusha', 103122001, 'GarnetA', 5, 1, '-'),
('Christiana', 103122002, 'GarnetA', 5, 3, '-'),
('Rosina', 103122003, 'GarnetA', 6, 2, '-'),
('Eileen', 103122004, 'GarnetA', 6, 1, '-'),
('Leyla', 103122005, 'GarnetA', 7, 2, '-'),
('Jewel', 103122006, 'GarnetA', 7, 3, '-'),
('Sarine', 103122007, 'GarnetA', 8, 2, '-'),
('Rebeca', 103122008, 'GarnetA', 8, 3, '-'),
('Alameda', 103122009, 'GarnetA', 9, 1, '-'),
('Wenonah', 103122010, 'GarnetA', 9, 2, '-'),
('Carin', 106122001, 'GarnetA', 10, 2, '-'),
('Caprice', 106122002, 'GarnetA', 10, 1, '-'),
('Goldina', 106122003, 'GarnetA', 11, 1, '-'),
('Shay', 106122004, 'GarnetA', 11, 3, '-'),
('Luz', 106122005, 'GarnetB', 0, 3, '-'),
('Crista', 106122006, 'GarnetB', 0, 1, '-'),
('Kerstin', 106122007, 'GarnetB', 1, 1, '-'),
('Rochella', 106122008, 'GarnetB', 1, 3, '-'),
('Gilemette', 106122009, 'GarnetB', 2, 1, '-'),
('Elfreda', 106122010, 'GarnetB', 2, 1, '-'),
('Leontyne', 107122001, 'GarnetB', 3, 3, '-'),
('Rhona', 107122002, 'GarnetB', 3, 1, '-'),
('Mabel', 107122003, 'GarnetB', 4, 1, '-'),
('Charyl', 107122004, 'GarnetB', 4, 1, '-'),
('Audre', 107122005, 'GarnetB', 5, 3, '-'),
('Devan', 107122006, 'GarnetB', 5, 3, '-'),
('Kym', 107122007, 'GarnetB', 6, 1, '-'),
('Kally', 107122008, 'GarnetB', 6, 2, '-'),
('Reena', 107122009, 'GarnetB', 7, 2, '-'),
('Sissy', 107122010, 'GarnetB', 7, 2, '-'),
('Cathrine', 108122001, 'GarnetB', 8, 1, '-'),
('Emilia', 108122002, 'GarnetB', 8, 1, '-'),
('Dyan', 108122003, 'GarnetB', 9, 3, '-'),
('Mora', 108122004, 'GarnetB', 9, 2, '-'),
('Rosmunda', 108122005, 'GarnetB', 10, 2, '-'),
('Ardella', 108122006, 'GarnetB', 10, 3, '-'),
('Darcey', 108122007, 'GarnetB', 11, 3, '-'),
('Nissy', 108122008, 'GarnetB', 11, 3, '-'),
('Doretta', 108122009, 'Opal', 0, 1, '-'),
('Yolanthe', 108122010, 'Opal', 0, 3, '-'),
('Cynde', 110122001, 'Opal', 1, 3, '-'),
('Paulette', 110122002, 'Opal', 1, 2, '-'),
('Karrie', 110122003, 'Opal', 2, 2, '-'),
('Kirsteni', 110122004, 'Opal', 2, 1, '-'),
('Louella', 110122005, 'Opal', 3, 3, '-'),
('Mariellen', 110122006, 'Opal', 3, 3, '-'),
('Dione', 110122007, 'Opal', 4, 2, '-'),
('Carlita', 110122008, 'Opal', 4, 3, '-'),
('Anitra', 110122009, 'Opal', 5, 3, '-'),
('Aimee', 110122010, 'Opal', 5, 2, '-'),
('Laurette', 111122001, 'Opal', 6, 2, '-'),
('Rafa', 111122002, 'Opal', 6, 3, '-'),
('Madalena', 111122003, 'Opal', 7, 2, '-'),
('Beitris', 111122004, 'Opal', 7, 2, '-'),
('Perl', 111122005, 'Opal', 8, 3, '-'),
('Elfrieda', 111122006, 'Opal', 8, 2, '-'),
('Kailey', 111122007, 'Opal', 9, 2, '-'),
('Gweneth', 111122008, 'Opal', 9, 1, '-'),
('Velvet', 111122009, 'Opal', 10, 3, '-'),
('Ola', 111122010, 'Opal', 10, 1, '-'),
('Andriette', 112122001, 'Opal', 11, 3, '-'),
('Karyl', 112122002, 'Opal', 11, 3, '-'),
('Saidee', 112122003, 'Agate', 0, 1, '-'),
('Thia', 112122004, 'Agate', 0, 2, '-'),
('Maure', 112122005, 'Agate', 1, 1, '-'),
('Audrye', 112122006, 'Agate', 1, 1, '-'),
('Dallas', 112122007, 'Agate', 2, 2, '-'),
('Ailsun', 112122008, 'Agate', 2, 1, '-'),
('Madelyn', 112122009, 'Agate', 3, 2, '-'),
('Antonella', 112122010, 'Agate', 3, 1, '-'),
('Isidora', 114122001, 'Agate', 4, 3, '-'),
('Giulia', 114122002, 'Agate', 4, 2, '-'),
('Astra', 114122003, 'Agate', 5, 1, '-'),
('Laurena', 114122004, 'Agate', 5, 2, '-'),
('Rikki', 114122005, 'Agate', 6, 1, '-'),
('Aveline', 114122006, 'Agate', 6, 3, '-'),
('Shayna', 114122007, 'Agate', 7, 1, '-'),
('Lucienne', 114122008, 'Agate', 7, 1, '-'),
('Ofilia', 114122009, 'Agate', 8, 3, '-'),
('Francisca', 114122010, 'Agate', 8, 1, '-');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;