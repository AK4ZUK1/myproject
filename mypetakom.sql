-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2025 at 05:31 PM
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
-- Database: `mypetakom`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `slot_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `checkin_time` datetime DEFAULT NULL,
  `geolocation_match` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `slot_id`, `user_id`, `checkin_time`, `geolocation_match`) VALUES
(1, 1, 1, '2025-05-08 05:51:00', 1),
(2, 1, 2, '2025-05-14 23:57:00', 1),
(3, 2, 1, '2025-05-29 08:04:00', 0),
(4, 2, 2, '2025-05-01 15:38:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `committee`
--

CREATE TABLE `committee` (
  `committee_id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `committee`
--

INSERT INTO `committee` (`committee_id`, `event_id`, `user_id`, `role_id`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `c_role`
--

CREATE TABLE `c_role` (
  `cr_id` int(11) NOT NULL,
  `cr_description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `c_role`
--

INSERT INTO `c_role` (`cr_id`, `cr_description`) VALUES
(1, 'Chairperson'),
(2, 'Secretary'),
(3, 'Treasurer'),
(4, 'Logistics'),
(5, 'Promotion');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `event_name` varchar(100) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `approval_letter` varchar(255) DEFAULT NULL,
  `merit_applied` tinyint(1) DEFAULT NULL,
  `event_qr_code_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `user_id`, `event_name`, `event_date`, `location`, `status`, `approval_letter`, `merit_applied`, `event_qr_code_url`) VALUES
(1, 3, 'Tech Innovation Fair', '2025-06-01', 'Main Hall A', 'Upcoming', 'approval1.pdf', 1, 'qrcodes/event_1.png'),
(2, 3, 'Cybersecurity Bootcamp', '2025-05-15', 'ICT Lab 2', 'Upcoming', 'approval2.pdf', 1, 'qrcodes/event_2.png'),
(3, 4, 'Blockchain Seminar', '2025-05-25', 'Seminar Room B', 'Postponed', 'approval3.pdf', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_attendance_slot`
--

CREATE TABLE `event_attendance_slot` (
  `slot_id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `attendance_date` date DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `attendance_qr_code_url` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_attendance_slot`
--

INSERT INTO `event_attendance_slot` (`slot_id`, `event_id`, `attendance_date`, `location`, `attendance_qr_code_url`, `created_by`) VALUES
(1, 1, '2025-06-01', 'Main Hall A', 'qrcodes/slot1.png', 3),
(2, 2, '2025-05-15', 'ICT Lab 2', 'qrcodes/slot2.png', 3);

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `membership_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`membership_id`, `user_id`, `status`) VALUES
(1, 1, 'Approved'),
(2, 2, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `merit`
--

CREATE TABLE `merit` (
  `m_id` int(11) NOT NULL,
  `m_description` varchar(100) DEFAULT NULL,
  `m_score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `merit`
--

INSERT INTO `merit` (`m_id`, `m_description`, `m_score`) VALUES
(1, 'Attend Workshop', 10),
(2, 'Lead Committee', 20);

-- --------------------------------------------------------

--
-- Table structure for table `merit_award`
--

CREATE TABLE `merit_award` (
  `award_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `m_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `semester` varchar(20) DEFAULT NULL,
  `merit_qr_code_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `merit_award`
--

INSERT INTO `merit_award` (`award_id`, `user_id`, `event_id`, `m_id`, `total`, `semester`, `merit_qr_code_url`) VALUES
(1, 1, 1, 1, 10, 'S2-2025', 'qrcodes/merit1.png');

-- --------------------------------------------------------

--
-- Table structure for table `merit_claim`
--

CREATE TABLE `merit_claim` (
  `claim_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `participation_letter` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `merit_claim`
--

INSERT INTO `merit_claim` (`claim_id`, `user_id`, `participation_letter`, `status`) VALUES
(1, 1, 'letter1.pdf', 'Approved'),
(2, 2, 'letter2.pdf', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `user_id` int(11) NOT NULL,
  `role` enum('Advisor','Admin') NOT NULL,
  `staff_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`user_id`, `role`, `staff_id`) VALUES
(3, 'Advisor', 'AV001'),
(5, 'Admin', 'AD001');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `user_id` int(11) NOT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `student_hard_copy` varchar(255) DEFAULT NULL,
  `program` varchar(100) DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`user_id`, `student_id`, `student_hard_copy`, `program`, `year`) VALUES
(1, 'S001', 'student_card1.jpg', 'Software Engineering', 3),
(2, 'S002', 'student_card2.jpg', 'Data Science', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT NULL,
  `role_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `name`, `password`, `profile_pic`, `is_verified`, `role_type`) VALUES
(1, 'student@ump.edu.my', 'John Doe', '$2y$10$nsAFsZxnleQyqE5zxea66ub82W8JtA0AsS8hcnTSaKcZn33k/7M/O', 'profile1.jpg', 1, 'Student'),
(2, 'emma@example.com', 'Emma Lim', '$2y$10$nsAFsZxnleQyqE5zxea66ub82W8JtA0AsS8hcnTSaKcZn33k/7M/O', 'profile2.jpg', 1, 'Student'),
(3, 'advisor@ump.edu.my', 'Mr. Tan', '$2y$10$nsAFsZxnleQyqE5zxea66ub82W8JtA0AsS8hcnTSaKcZn33k/7M/O', 'profile3.jpg', 1, 'Advisor'),
(4, 'lim@example.com', 'Prof. Lim', '$2y$10$nsAFsZxnleQyqE5zxea66ub82W8JtA0AsS8hcnTSaKcZn33k/7M/O', 'profile4.jpg', 1, 'Coordinator'),
(5, 'admin@ump.edu.my', 'Admin Lee', '$2y$10$nsAFsZxnleQyqE5zxea66ub82W8JtA0AsS8hcnTSaKcZn33k/7M/O', 'profile5.jpg', 1, 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `slot_id` (`slot_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `committee`
--
ALTER TABLE `committee`
  ADD PRIMARY KEY (`committee_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `committee_ibfk_1` (`event_id`);

--
-- Indexes for table `c_role`
--
ALTER TABLE `c_role`
  ADD PRIMARY KEY (`cr_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD UNIQUE KEY `event_name` (`event_name`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `event_attendance_slot`
--
ALTER TABLE `event_attendance_slot`
  ADD PRIMARY KEY (`slot_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`membership_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `merit`
--
ALTER TABLE `merit`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `merit_award`
--
ALTER TABLE `merit_award`
  ADD PRIMARY KEY (`award_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `m_id` (`m_id`);

--
-- Indexes for table `merit_claim`
--
ALTER TABLE `merit_claim`
  ADD PRIMARY KEY (`claim_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `staff_id` (`staff_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `committee`
--
ALTER TABLE `committee`
  MODIFY `committee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `c_role`
--
ALTER TABLE `c_role`
  MODIFY `cr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `event_attendance_slot`
--
ALTER TABLE `event_attendance_slot`
  MODIFY `slot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `membership_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `merit`
--
ALTER TABLE `merit`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `merit_award`
--
ALTER TABLE `merit_award`
  MODIFY `award_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `merit_claim`
--
ALTER TABLE `merit_claim`
  MODIFY `claim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`slot_id`) REFERENCES `event_attendance_slot` (`slot_id`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `committee`
--
ALTER TABLE `committee`
  ADD CONSTRAINT `committee_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `committee_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `committee_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `c_role` (`cr_id`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `event_attendance_slot`
--
ALTER TABLE `event_attendance_slot`
  ADD CONSTRAINT `event_attendance_slot_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`),
  ADD CONSTRAINT `event_attendance_slot_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `merit_award`
--
ALTER TABLE `merit_award`
  ADD CONSTRAINT `merit_award_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `merit_award_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`),
  ADD CONSTRAINT `merit_award_ibfk_3` FOREIGN KEY (`m_id`) REFERENCES `merit` (`m_id`);

--
-- Constraints for table `merit_claim`
--
ALTER TABLE `merit_claim`
  ADD CONSTRAINT `merit_claim_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
