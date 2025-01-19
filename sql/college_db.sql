-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306
-- Generation Time: Jan 19, 2025 at 08:02 AM
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
-- Database: `college_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`) VALUES
(1, 'Computer Science'),
(2, 'Mechanical Engineering'),
(3, 'Civil Engineering'),
(4, 'Electrical Engineering'),
(5, 'Mathematics');

-- --------------------------------------------------------

--
-- Table structure for table `course_subject`
--

CREATE TABLE `course_subject` (
  `course_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_subject`
--

INSERT INTO `course_subject` (`course_id`, `subject_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(4, 16),
(4, 17),
(4, 18),
(4, 19),
(4, 20),
(5, 21),
(5, 22),
(5, 23),
(5, 24),
(5, 25);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `prn` varchar(20) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`prn`, `course_id`) VALUES
('CE301', 3),
('CE302', 3),
('CE303', 3),
('CE304', 3),
('CE305', 3),
('CE306', 3),
('CE307', 3),
('CE308', 3),
('CE309', 3),
('CE310', 3),
('CS101', 1),
('CS102', 1),
('CS103', 1),
('CS104', 1),
('CS105', 1),
('CS106', 1),
('CS107', 1),
('CS108', 1),
('CS109', 1),
('CS110', 1),
('EE401', 4),
('EE402', 4),
('EE403', 4),
('EE404', 4),
('EE405', 4),
('EE406', 4),
('EE407', 4),
('EE408', 4),
('EE409', 4),
('EE410', 4),
('MA501', 5),
('MA502', 5),
('MA503', 5),
('MA504', 5),
('MA505', 5),
('MA506', 5),
('MA507', 5),
('MA508', 5),
('MA509', 5),
('MA510', 5),
('ME201', 2),
('ME202', 2),
('ME203', 2),
('ME204', 2),
('ME205', 2),
('ME206', 2),
('ME207', 2),
('ME208', 2),
('ME209', 2),
('ME210', 2);

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `subject_id` int(11) NOT NULL,
  `prn` varchar(20) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `marks_received` int(11) DEFAULT NULL,
  `total_marks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`subject_id`, `prn`, `semester_id`, `marks_received`, `total_marks`) VALUES
(1, 'CS101', 1, 80, 100),
(1, 'CS101', 2, 85, 100),
(1, 'CS102', 1, 85, 100),
(1, 'CS102', 2, 78, 100),
(1, 'CS103', 1, 78, 100),
(1, 'CS103', 2, 82, 100),
(1, 'CS104', 1, 83, 100),
(1, 'CS104', 2, 80, 100),
(1, 'CS105', 1, 75, 100),
(1, 'CS105', 2, 91, 100),
(1, 'CS106', 1, 88, 100),
(1, 'CS106', 2, 88, 100),
(1, 'CS107', 1, 77, 100),
(1, 'CS107', 2, 79, 100),
(1, 'CS108', 1, 81, 100),
(1, 'CS108', 2, 85, 100),
(1, 'CS109', 1, 84, 100),
(1, 'CS109', 2, 91, 100),
(1, 'CS110', 1, 79, 100),
(1, 'CS110', 2, 84, 100),
(2, 'CS101', 1, 82, 100),
(2, 'CS101', 2, 75, 100),
(2, 'CS102', 1, 75, 100),
(2, 'CS102', 2, 67, 100),
(2, 'CS103', 1, 80, 100),
(2, 'CS103', 2, 79, 100),
(2, 'CS104', 1, 87, 100),
(2, 'CS104', 2, 76, 100),
(2, 'CS105', 1, 83, 100),
(2, 'CS105', 2, 88, 100),
(2, 'CS106', 1, 78, 100),
(2, 'CS106', 2, 83, 100),
(2, 'CS107', 1, 79, 100),
(2, 'CS107', 2, 75, 100),
(2, 'CS108', 1, 82, 100),
(2, 'CS108', 2, 80, 100),
(2, 'CS109', 1, 75, 100),
(2, 'CS109', 2, 87, 100),
(2, 'CS110', 1, 90, 100),
(2, 'CS110', 2, 78, 100),
(3, 'CS101', 1, 85, 100),
(3, 'CS101', 2, 88, 100),
(3, 'CS102', 1, 88, 100),
(3, 'CS102', 2, 85, 100),
(3, 'CS103', 1, 81, 100),
(3, 'CS103', 2, 84, 100),
(3, 'CS104', 1, 79, 100),
(3, 'CS104', 2, 82, 100),
(3, 'CS105', 1, 84, 100),
(3, 'CS105', 2, 93, 100),
(3, 'CS106', 1, 77, 100),
(3, 'CS106', 2, 85, 100),
(3, 'CS107', 1, 80, 100),
(3, 'CS107', 2, 80, 100),
(3, 'CS108', 1, 82, 100),
(3, 'CS108', 2, 82, 100),
(3, 'CS109', 1, 83, 100),
(3, 'CS109', 2, 90, 100),
(3, 'CS110', 1, 76, 100),
(3, 'CS110', 2, 86, 100),
(4, 'CS101', 1, 83, 100),
(4, 'CS101', 2, 90, 100),
(4, 'CS102', 1, 90, 100),
(4, 'CS102', 2, 80, 100),
(4, 'CS103', 1, 85, 100),
(4, 'CS103', 2, 81, 100),
(4, 'CS104', 1, 76, 100),
(4, 'CS104', 2, 85, 100),
(4, 'CS105', 1, 88, 100),
(4, 'CS105', 2, 90, 100),
(4, 'CS106', 1, 80, 100),
(4, 'CS106', 2, 89, 100),
(4, 'CS107', 1, 77, 100),
(4, 'CS107', 2, 77, 100),
(4, 'CS108', 1, 84, 100),
(4, 'CS108', 2, 85, 100),
(4, 'CS109', 1, 81, 100),
(4, 'CS109', 2, 88, 100),
(4, 'CS110', 1, 79, 100),
(4, 'CS110', 2, 84, 100),
(5, 'CS101', 1, 90, 100),
(5, 'CS101', 2, 92, 100),
(5, 'CS102', 1, 85, 100),
(5, 'CS102', 2, 86, 100),
(5, 'CS103', 1, 88, 100),
(5, 'CS103', 2, 87, 100),
(5, 'CS104', 1, 79, 100),
(5, 'CS104', 2, 83, 100),
(5, 'CS105', 1, 77, 100),
(5, 'CS105', 2, 95, 100),
(5, 'CS106', 1, 84, 100),
(5, 'CS106', 2, 91, 100),
(5, 'CS107', 1, 78, 100),
(5, 'CS107', 2, 86, 100),
(5, 'CS108', 1, 82, 100),
(5, 'CS108', 2, 85, 100),
(5, 'CS109', 1, 75, 100),
(5, 'CS109', 2, 91, 100),
(5, 'CS110', 1, 83, 100),
(5, 'CS110', 2, 85, 100),
(6, 'ME201', 1, 81, 100),
(6, 'ME201', 2, 82, 100),
(6, 'ME202', 1, 78, 100),
(6, 'ME202', 2, 81, 100),
(6, 'ME203', 1, 84, 100),
(6, 'ME203', 2, 84, 100),
(6, 'ME204', 1, 86, 100),
(6, 'ME204', 2, 78, 100),
(6, 'ME205', 1, 75, 100),
(6, 'ME205', 2, 87, 100),
(6, 'ME206', 1, 80, 100),
(6, 'ME206', 2, 89, 100),
(6, 'ME207', 1, 77, 100),
(6, 'ME207', 2, 77, 100),
(6, 'ME208', 1, 90, 100),
(6, 'ME208', 2, 80, 100),
(6, 'ME209', 1, 79, 100),
(6, 'ME209', 2, 85, 100),
(6, 'ME210', 1, 82, 100),
(6, 'ME210', 2, 88, 100),
(7, 'ME201', 1, 85, 100),
(7, 'ME201', 2, 89, 100),
(7, 'ME202', 1, 80, 100),
(7, 'ME202', 2, 77, 100),
(7, 'ME203', 1, 75, 100),
(7, 'ME203', 2, 85, 100),
(7, 'ME204', 1, 88, 100),
(7, 'ME204', 2, 75, 100),
(7, 'ME205', 1, 82, 100),
(7, 'ME205', 2, 88, 100),
(7, 'ME206', 1, 90, 100),
(7, 'ME206', 2, 85, 100),
(7, 'ME207', 1, 77, 100),
(7, 'ME207', 2, 82, 100),
(7, 'ME208', 1, 79, 100),
(7, 'ME208', 2, 86, 100),
(7, 'ME209', 1, 76, 100),
(7, 'ME209', 2, 91, 100),
(7, 'ME210', 1, 85, 100),
(7, 'ME210', 2, 87, 100),
(8, 'ME201', 1, 77, 100),
(8, 'ME201', 2, 83, 100),
(8, 'ME202', 1, 84, 100),
(8, 'ME202', 2, 79, 100),
(8, 'ME203', 1, 80, 100),
(8, 'ME203', 2, 86, 100),
(8, 'ME204', 1, 82, 100),
(8, 'ME204', 2, 79, 100),
(8, 'ME205', 1, 78, 100),
(8, 'ME205', 2, 90, 100),
(8, 'ME206', 1, 79, 100),
(8, 'ME206', 2, 81, 100),
(8, 'ME207', 1, 83, 100),
(8, 'ME207', 2, 84, 100),
(8, 'ME208', 1, 76, 100),
(8, 'ME208', 2, 79, 100),
(8, 'ME209', 1, 90, 100),
(8, 'ME209', 2, 87, 100),
(8, 'ME210', 1, 85, 100),
(8, 'ME210', 2, 82, 100),
(9, 'ME201', 1, 81, 100),
(9, 'ME201', 2, 91, 100),
(9, 'ME202', 1, 88, 100),
(9, 'ME202', 2, 88, 100),
(9, 'ME203', 1, 80, 100),
(9, 'ME203', 2, 87, 100),
(9, 'ME204', 1, 85, 100),
(9, 'ME204', 2, 90, 100),
(9, 'ME205', 1, 78, 100),
(9, 'ME205', 2, 92, 100),
(9, 'ME206', 1, 79, 100),
(9, 'ME206', 2, 85, 100),
(9, 'ME207', 1, 87, 100),
(9, 'ME207', 2, 84, 100),
(9, 'ME208', 1, 82, 100),
(9, 'ME208', 2, 83, 100),
(9, 'ME209', 1, 83, 100),
(9, 'ME209', 2, 89, 100),
(9, 'ME210', 1, 76, 100),
(9, 'ME210', 2, 94, 100),
(10, 'ME201', 1, 84, 100),
(10, 'ME201', 2, 85, 100),
(10, 'ME202', 1, 79, 100),
(10, 'ME202', 2, 82, 100),
(10, 'ME203', 1, 82, 100),
(10, 'ME203', 2, 80, 100),
(10, 'ME204', 1, 80, 100),
(10, 'ME204', 2, 84, 100),
(10, 'ME205', 1, 85, 100),
(10, 'ME205', 2, 91, 100),
(10, 'ME206', 1, 76, 100),
(10, 'ME206', 2, 78, 100),
(10, 'ME207', 1, 79, 100),
(10, 'ME207', 2, 76, 100),
(10, 'ME208', 1, 87, 100),
(10, 'ME208', 2, 83, 100),
(10, 'ME209', 1, 75, 100),
(10, 'ME209', 2, 85, 100),
(10, 'ME210', 1, 78, 100),
(10, 'ME210', 2, 90, 100),
(11, 'CE301', 1, 80, 100),
(11, 'CE301', 2, 79, 100),
(11, 'CE302', 1, 75, 100),
(11, 'CE302', 2, 72, 100),
(11, 'CE303', 1, 85, 100),
(11, 'CE303', 2, 84, 100),
(11, 'CE304', 1, 82, 100),
(11, 'CE304', 2, 81, 100),
(11, 'CE305', 1, 88, 100),
(11, 'CE305', 2, 88, 100),
(11, 'CE306', 1, 77, 100),
(11, 'CE306', 2, 87, 100),
(11, 'CE307', 1, 79, 100),
(11, 'CE307', 2, 79, 100),
(11, 'CE308', 1, 81, 100),
(11, 'CE308', 2, 80, 100),
(11, 'CE309', 1, 80, 100),
(11, 'CE309', 2, 86, 100),
(11, 'CE310', 1, 76, 100),
(11, 'CE310', 2, 92, 100),
(12, 'CE301', 1, 85, 100),
(12, 'CE301', 2, 75, 100),
(12, 'CE302', 1, 88, 100),
(12, 'CE302', 2, 80, 100),
(12, 'CE303', 1, 79, 100),
(12, 'CE303', 2, 83, 100),
(12, 'CE304', 1, 80, 100),
(12, 'CE304', 2, 79, 100),
(12, 'CE305', 1, 76, 100),
(12, 'CE305', 2, 84, 100),
(12, 'CE306', 1, 77, 100),
(12, 'CE306', 2, 82, 100),
(12, 'CE307', 1, 82, 100),
(12, 'CE307', 2, 77, 100),
(12, 'CE308', 1, 81, 100),
(12, 'CE308', 2, 78, 100),
(12, 'CE309', 1, 83, 100),
(12, 'CE309', 2, 80, 100),
(12, 'CE310', 1, 78, 100),
(12, 'CE310', 2, 91, 100),
(13, 'CE301', 1, 77, 100),
(13, 'CE301', 2, 84, 100),
(13, 'CE302', 1, 79, 100),
(13, 'CE302', 2, 85, 100),
(13, 'CE303', 1, 75, 100),
(13, 'CE303', 2, 90, 100),
(13, 'CE304', 1, 82, 100),
(13, 'CE304', 2, 82, 100),
(13, 'CE305', 1, 86, 100),
(13, 'CE305', 2, 87, 100),
(13, 'CE306', 1, 83, 100),
(13, 'CE306', 2, 81, 100),
(13, 'CE307', 1, 88, 100),
(13, 'CE307', 2, 83, 100),
(13, 'CE308', 1, 80, 100),
(13, 'CE308', 2, 89, 100),
(13, 'CE309', 1, 76, 100),
(13, 'CE309', 2, 86, 100),
(13, 'CE310', 1, 78, 100),
(13, 'CE310', 2, 88, 100),
(14, 'CE301', 1, 83, 100),
(14, 'CE301', 2, 78, 100),
(14, 'CE302', 1, 87, 100),
(14, 'CE302', 2, 84, 100),
(14, 'CE303', 1, 82, 100),
(14, 'CE303', 2, 79, 100),
(14, 'CE304', 1, 80, 100),
(14, 'CE304', 2, 80, 100),
(14, 'CE305', 1, 85, 100),
(14, 'CE305', 2, 87, 100),
(14, 'CE306', 1, 76, 100),
(14, 'CE306', 2, 85, 100),
(14, 'CE307', 1, 79, 100),
(14, 'CE307', 2, 91, 100),
(14, 'CE308', 1, 75, 100),
(14, 'CE308', 2, 79, 100),
(14, 'CE309', 1, 80, 100),
(14, 'CE309', 2, 82, 100),
(14, 'CE310', 1, 78, 100),
(14, 'CE310', 2, 90, 100),
(15, 'CE301', 1, 79, 100),
(15, 'CE301', 2, 82, 100),
(15, 'CE302', 1, 76, 100),
(15, 'CE302', 2, 81, 100),
(15, 'CE303', 1, 80, 100),
(15, 'CE303', 2, 86, 100),
(15, 'CE304', 1, 85, 100),
(15, 'CE304', 2, 80, 100),
(15, 'CE305', 1, 83, 100),
(15, 'CE305', 2, 92, 100),
(15, 'CE306', 1, 77, 100),
(15, 'CE306', 2, 89, 100),
(15, 'CE307', 1, 82, 100),
(15, 'CE307', 2, 85, 100),
(15, 'CE308', 1, 79, 100),
(15, 'CE308', 2, 84, 100),
(15, 'CE309', 1, 84, 100),
(15, 'CE309', 2, 88, 100),
(15, 'CE310', 1, 75, 100),
(15, 'CE310', 2, 91, 100),
(16, 'EE401', 1, 82, 100),
(16, 'EE401', 2, 88, 100),
(16, 'EE402', 1, 75, 100),
(16, 'EE402', 2, 83, 100),
(16, 'EE403', 1, 80, 100),
(16, 'EE403', 2, 90, 100),
(16, 'EE404', 1, 79, 100),
(16, 'EE404', 2, 89, 100),
(16, 'EE405', 1, 74, 100),
(16, 'EE405', 2, 87, 100),
(16, 'EE406', 1, 83, 100),
(16, 'EE406', 2, 81, 100),
(16, 'EE407', 1, 78, 100),
(16, 'EE407', 2, 80, 100),
(16, 'EE408', 1, 76, 100),
(16, 'EE408', 2, 79, 100),
(16, 'EE409', 1, 80, 100),
(16, 'EE409', 2, 86, 100),
(16, 'EE410', 1, 70, 100),
(16, 'EE410', 2, 85, 100),
(17, 'EE401', 1, 85, 100),
(17, 'EE401', 2, 79, 100),
(17, 'EE402', 1, 77, 100),
(17, 'EE402', 2, 78, 100),
(17, 'EE403', 1, 88, 100),
(17, 'EE403', 2, 80, 100),
(17, 'EE404', 1, 76, 100),
(17, 'EE404', 2, 82, 100),
(17, 'EE405', 1, 74, 100),
(17, 'EE405', 2, 87, 100),
(17, 'EE406', 1, 81, 100),
(17, 'EE406', 2, 91, 100),
(17, 'EE407', 1, 79, 100),
(17, 'EE407', 2, 86, 100),
(17, 'EE408', 1, 82, 100),
(17, 'EE408', 2, 75, 100),
(17, 'EE409', 1, 78, 100),
(17, 'EE409', 2, 79, 100),
(17, 'EE410', 1, 85, 100),
(17, 'EE410', 2, 84, 100),
(18, 'EE401', 1, 79, 100),
(18, 'EE401', 2, 91, 100),
(18, 'EE402', 1, 82, 100),
(18, 'EE402', 2, 88, 100),
(18, 'EE403', 1, 75, 100),
(18, 'EE403', 2, 90, 100),
(18, 'EE404', 1, 80, 100),
(18, 'EE404', 2, 92, 100),
(18, 'EE405', 1, 84, 100),
(18, 'EE405', 2, 93, 100),
(18, 'EE406', 1, 78, 100),
(18, 'EE406', 2, 86, 100),
(18, 'EE407', 1, 77, 100),
(18, 'EE407', 2, 80, 100),
(18, 'EE408', 1, 79, 100),
(18, 'EE408', 2, 84, 100),
(18, 'EE409', 1, 81, 100),
(18, 'EE409', 2, 85, 100),
(18, 'EE410', 1, 76, 100),
(18, 'EE410', 2, 81, 100),
(19, 'EE401', 1, 82, 100),
(19, 'EE401', 2, 85, 100),
(19, 'EE402', 1, 75, 100),
(19, 'EE402', 2, 82, 100),
(19, 'EE403', 1, 78, 100),
(19, 'EE403', 2, 79, 100),
(19, 'EE404', 1, 84, 100),
(19, 'EE404', 2, 80, 100),
(19, 'EE405', 1, 77, 100),
(19, 'EE405', 2, 90, 100),
(19, 'EE406', 1, 80, 100),
(19, 'EE406', 2, 83, 100),
(19, 'EE407', 1, 79, 100),
(19, 'EE407', 2, 81, 100),
(19, 'EE408', 1, 85, 100),
(19, 'EE408', 2, 79, 100),
(19, 'EE409', 1, 90, 100),
(19, 'EE409', 2, 88, 100),
(19, 'EE410', 1, 76, 100),
(19, 'EE410', 2, 92, 100),
(20, 'EE401', 1, 75, 100),
(20, 'EE401', 2, 93, 100),
(20, 'EE402', 1, 82, 100),
(20, 'EE402', 2, 84, 100),
(20, 'EE403', 1, 78, 100),
(20, 'EE403', 2, 87, 100),
(20, 'EE404', 1, 80, 100),
(20, 'EE404', 2, 80, 100),
(20, 'EE405', 1, 79, 100),
(20, 'EE405', 2, 92, 100),
(20, 'EE406', 1, 84, 100),
(20, 'EE406', 2, 90, 100),
(20, 'EE407', 1, 85, 100),
(20, 'EE407', 2, 85, 100),
(20, 'EE408', 1, 76, 100),
(20, 'EE408', 2, 88, 100),
(20, 'EE409', 1, 83, 100),
(20, 'EE409', 2, 91, 100),
(20, 'EE410', 1, 86, 100),
(20, 'EE410', 2, 89, 100),
(21, 'MA501', 1, 85, 100),
(21, 'MA501', 2, 90, 100),
(21, 'MA502', 1, 78, 100),
(21, 'MA502', 2, 84, 100),
(21, 'MA503', 1, 80, 100),
(21, 'MA503', 2, 86, 100),
(21, 'MA504', 1, 76, 100),
(21, 'MA504', 2, 87, 100),
(21, 'MA505', 1, 81, 100),
(21, 'MA505', 2, 88, 100),
(21, 'MA506', 1, 79, 100),
(21, 'MA506', 2, 90, 100),
(21, 'MA507', 1, 77, 100),
(21, 'MA507', 2, 85, 100),
(21, 'MA508', 1, 84, 100),
(21, 'MA508', 2, 82, 100),
(21, 'MA509', 1, 90, 100),
(21, 'MA509', 2, 91, 100),
(21, 'MA510', 1, 75, 100),
(21, 'MA510', 2, 92, 100),
(22, 'MA501', 1, 88, 100),
(22, 'MA501', 2, 84, 100),
(22, 'MA502', 1, 84, 100),
(22, 'MA502', 2, 79, 100),
(22, 'MA503', 1, 79, 100),
(22, 'MA503', 2, 80, 100),
(22, 'MA504', 1, 82, 100),
(22, 'MA504', 2, 77, 100),
(22, 'MA505', 1, 81, 100),
(22, 'MA505', 2, 85, 100),
(22, 'MA506', 1, 75, 100),
(22, 'MA506', 2, 83, 100),
(22, 'MA507', 1, 83, 100),
(22, 'MA507', 2, 81, 100),
(22, 'MA508', 1, 90, 100),
(22, 'MA508', 2, 79, 100),
(22, 'MA509', 1, 77, 100),
(22, 'MA509', 2, 87, 100),
(22, 'MA510', 1, 78, 100),
(22, 'MA510', 2, 89, 100),
(23, 'MA501', 1, 80, 100),
(23, 'MA501', 2, 92, 100),
(23, 'MA502', 1, 86, 100),
(23, 'MA502', 2, 90, 100),
(23, 'MA503', 1, 75, 100),
(23, 'MA503', 2, 88, 100),
(23, 'MA504', 1, 78, 100),
(23, 'MA504', 2, 89, 100),
(23, 'MA505', 1, 82, 100),
(23, 'MA505', 2, 85, 100),
(23, 'MA506', 1, 79, 100),
(23, 'MA506', 2, 83, 100),
(23, 'MA507', 1, 81, 100),
(23, 'MA507', 2, 91, 100),
(23, 'MA508', 1, 83, 100),
(23, 'MA508', 2, 88, 100),
(23, 'MA509', 1, 77, 100),
(23, 'MA509', 2, 87, 100),
(23, 'MA510', 1, 85, 100),
(23, 'MA510', 2, 89, 100),
(24, 'MA501', 1, 85, 100),
(24, 'MA501', 2, 85, 100),
(24, 'MA502', 1, 77, 100),
(24, 'MA502', 2, 84, 100),
(24, 'MA503', 1, 84, 100),
(24, 'MA503', 2, 82, 100),
(24, 'MA504', 1, 79, 100),
(24, 'MA504', 2, 79, 100),
(24, 'MA505', 1, 90, 100),
(24, 'MA505', 2, 90, 100),
(24, 'MA506', 1, 82, 100),
(24, 'MA506', 2, 87, 100),
(24, 'MA507', 1, 78, 100),
(24, 'MA507', 2, 85, 100),
(24, 'MA508', 1, 81, 100),
(24, 'MA508', 2, 80, 100),
(24, 'MA509', 1, 76, 100),
(24, 'MA509', 2, 88, 100),
(24, 'MA510', 1, 80, 100),
(24, 'MA510', 2, 86, 100),
(25, 'MA501', 1, 84, 100),
(25, 'MA501', 2, 89, 100),
(25, 'MA502', 1, 79, 100),
(25, 'MA502', 2, 85, 100),
(25, 'MA503', 1, 85, 100),
(25, 'MA503', 2, 80, 100),
(25, 'MA504', 1, 77, 100),
(25, 'MA504', 2, 87, 100),
(25, 'MA505', 1, 82, 100),
(25, 'MA505', 2, 93, 100),
(25, 'MA506', 1, 80, 100),
(25, 'MA506', 2, 90, 100),
(25, 'MA507', 1, 76, 100),
(25, 'MA507', 2, 89, 100),
(25, 'MA508', 1, 81, 100),
(25, 'MA508', 2, 88, 100),
(25, 'MA509', 1, 83, 100),
(25, 'MA509', 2, 85, 100),
(25, 'MA510', 1, 78, 100),
(25, 'MA510', 2, 92, 100);

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `semester_id` int(11) NOT NULL,
  `semester_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`semester_id`, `semester_name`) VALUES
(1, 'Semester 1'),
(2, 'Semester 2');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `prn` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `roll` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`prn`, `name`, `roll`, `email`, `password`, `address`) VALUES
('CE301', 'Anil Patel', 301, 'anil.patel@gmail.com', 'password123', 'Delhi'),
('CE302', 'Rina Gupta', 302, 'rina.gupta@gmail.com', 'password123', 'Mumbai'),
('CE303', 'Mohit Verma', 303, 'mohit.verma@gmail.com', 'password123', 'Bangalore'),
('CE304', 'Tanvi Reddy', 304, 'tanvi.reddy@gmail.com', 'password123', 'Chennai'),
('CE305', 'Nikhil Jain', 305, 'nikhil.jain@gmail.com', 'password123', 'Kolkata'),
('CE306', 'Sonali Mishra', 306, 'sonali.mishra@gmail.com', 'password123', 'Hyderabad'),
('CE307', 'Amit Bansal', 307, 'amit.bansal@gmail.com', 'password123', 'Lucknow'),
('CE308', 'Rohit Agarwal', 308, 'rohit.agarwal@gmail.com', 'password123', 'Ahmedabad'),
('CE309', 'Neha Chauhan', 309, 'neha.chauhan@gmail.com', 'password123', 'Pune'),
('CE310', 'Pranav Mehta', 310, 'pranav.mehta@gmail.com', 'password123', 'Mumbai'),
('CS101', 'Amit Kumar', 101, 'amitkumar@gmail.com', 'password123', 'Patna'),
('CS102', 'Priya Sharma', 102, 'priya.sharma@gmail.com', 'password123', 'Mumbai'),
('CS103', 'Ravi Patel', 103, 'ravi.patel@gmail.com', 'password123', 'Bangalore'),
('CS104', 'Sneha Gupta', 104, 'sneha.gupta@gmail.com', 'password123', 'Chennai'),
('CS105', 'Rahul Verma', 105, 'rahul.verma@gmail.com', 'password123', 'Kolkata'),
('CS106', 'Neha Reddy', 106, 'neha.reddy@gmail.com', 'password123', 'Hyderabad'),
('CS107', 'Vikram Singh', 107, 'vikram.singh@gmail.com', 'password123', 'Lucknow'),
('CS108', 'Isha Desai', 108, 'isha.desai@gmail.com', 'password123', 'Ahmedabad'),
('CS109', 'Manish Kumar', 109, 'manish.kumar@gmail.com', 'password123', 'Pune'),
('CS110', 'Ananya Rao', 110, 'ananya.rao@gmail.com', 'password123', 'Mumbai'),
('EE401', 'Ravi Sharma', 401, 'ravi.sharma@gmail.com', 'password123', 'Delhi'),
('EE402', 'Anju Gupta', 402, 'anju.gupta@gmail.com', 'password123', 'Mumbai'),
('EE403', 'Sandeep Kumar', 403, 'sandeep.kumar@gmail.com', 'password123', 'Bangalore'),
('EE404', 'Priyanka Singh', 404, 'priyanka.singh@gmail.com', 'password123', 'Chennai'),
('EE405', 'Vikas Mehta', 405, 'vikas.mehta@gmail.com', 'password123', 'Kolkata'),
('EE406', 'Vandana Reddy', 406, 'vandana.reddy@gmail.com', 'password123', 'Hyderabad'),
('EE407', 'Kunal Patel', 407, 'kunal.patel@gmail.com', 'password123', 'Lucknow'),
('EE408', 'Deepa Desai', 408, 'deepa.desai@gmail.com', 'password123', 'Ahmedabad'),
('EE409', 'Amit Yadav', 409, 'amit.yadav@gmail.com', 'password123', 'Pune'),
('EE410', 'Neha Sharma', 410, 'neha.sharma@gmail.com', 'password123', 'Mumbai'),
('MA501', 'Rajesh Reddy', 501, 'rajesh.reddy@gmail.com', 'password123', 'Delhi'),
('MA502', 'Anita Bansal', 502, 'anita.bansal@gmail.com', 'password123', 'Mumbai'),
('MA503', 'Vikas Chauhan', 503, 'vikas.chauhan@gmail.com', 'password123', 'Bangalore'),
('MA504', 'Madhavi Verma', 504, 'madhavi.verma@gmail.com', 'password123', 'Chennai'),
('MA505', 'Ravi Kiran', 505, 'ravi.kiran@gmail.com', 'password123', 'Kolkata'),
('MA506', 'Shalini Kapoor', 506, 'shalini.kapoor@gmail.com', 'password123', 'Hyderabad'),
('MA507', 'Manoj Gupta', 507, 'manoj.gupta@gmail.com', 'password123', 'Lucknow'),
('MA508', 'Kiran Yadav', 508, 'kiran.yadav@gmail.com', 'password123', 'Ahmedabad'),
('MA509', 'Anju Singh', 509, 'anju.singh@gmail.com', 'password123', 'Pune'),
('MA510', 'Sonali Patel', 510, 'sonali.patel@gmail.com', 'password123', 'Mumbai'),
('ME201', 'Vikas Mehta', 201, 'vikas.mehta@gmail.com', 'password123', 'Delhi'),
('ME202', 'Pooja Agarwal', 202, 'pooja.agarwal@gmail.com', 'password123', 'Mumbai'),
('ME203', 'Arun Kumar', 203, 'arun.kumar@gmail.com', 'password123', 'Bangalore'),
('ME204', 'Nidhi Chauhan', 204, 'nidhi.chauhan@gmail.com', 'password123', 'Chennai'),
('ME205', 'Ravi Kumar', 205, 'ravi.kumar@gmail.com', 'password123', 'Kolkata'),
('ME206', 'Shreya Verma', 206, 'shreya.verma@gmail.com', 'password123', 'Hyderabad'),
('ME207', 'Karan Singh', 207, 'karan.singh@gmail.com', 'password123', 'Lucknow'),
('ME208', 'Priya Kapoor', 208, 'priya.kapoor@gmail.com', 'password123', 'Ahmedabad'),
('ME209', 'Manoj Yadav', 209, 'manoj.yadav@gmail.com', 'password123', 'Pune'),
('ME210', 'Sonia Sharma', 210, 'sonia.sharma@gmail.com', 'password123', 'Mumbai');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_name`) VALUES
(1, 'Data Structures'),
(2, 'Algorithms'),
(3, 'Operating Systems'),
(4, 'Databases'),
(5, 'Software Engineering'),
(6, 'Thermodynamics'),
(7, 'Fluid Mechanics'),
(8, 'Machine Design'),
(9, 'Strength of Materials'),
(10, 'Heat Transfer'),
(11, 'Structural Analysis'),
(12, 'Concrete Technology'),
(13, 'Transportation Engineering'),
(14, 'Hydrology'),
(15, 'Surveying'),
(16, 'Circuit Theory'),
(17, 'Electromagnetics'),
(18, 'Control Systems'),
(19, 'Power Systems'),
(20, 'Electrical Machines'),
(21, 'Calculus'),
(22, 'Linear Algebra'),
(23, 'Probability'),
(24, 'Differential Equations'),
(25, 'Discrete Mathematics');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `course_subject`
--
ALTER TABLE `course_subject`
  ADD PRIMARY KEY (`course_id`,`subject_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`prn`,`course_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`subject_id`,`prn`,`semester_id`),
  ADD KEY `student_prn` (`prn`),
  ADD KEY `semester_id` (`semester_id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`semester_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`prn`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `semester_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_subject`
--
ALTER TABLE `course_subject`
  ADD CONSTRAINT `course_subject_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `course_subject_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`prn`) REFERENCES `students` (`prn`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`prn`) REFERENCES `students` (`prn`),
  ADD CONSTRAINT `marks_ibfk_3` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`semester_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
