-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2026 at 10:32 PM
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
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `photo` varchar(255) DEFAULT 'default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `user_id`, `name`, `email`, `phone`, `created_at`, `photo`) VALUES
(1, 8, 'wwww', 'wwww@gmail.com', '9762475536', '2026-01-27 22:11:53', '1769551913_69793829b304c.png');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `publisher` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `publication_year` year(4) NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `book_cover` varchar(255) DEFAULT NULL,
  `cover_photo` varchar(255) DEFAULT NULL,
  `total_copies` int(11) NOT NULL DEFAULT 1,
  `available_copies` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `publisher`, `category`, `publication_year`, `isbn`, `book_cover`, `cover_photo`, `total_copies`, `available_copies`, `created_at`, `category_id`) VALUES
(110, 'Spider-Man: Blue', 'Jeph Loeb', 'Marvel Comics', '', '2002', '9780785110710', NULL, NULL, 5, 1, '2026-01-30 18:08:03', 1),
(111, 'Batman: Year One', 'Frank Miller', 'DC Comics', '', '1987', '9781401207526', NULL, NULL, 4, 0, '2026-01-30 18:08:03', 1),
(112, 'Superman: Red Son', 'Mark Millar', 'DC Comics', '', '2003', '9781401201913', NULL, NULL, 3, 1, '2026-01-30 18:08:03', 1),
(113, 'Avengers: Infinity War', 'Jim Starlin', 'Marvel Comics', '', '2018', '9781302913220', NULL, NULL, 6, 0, '2026-01-30 18:08:03', 1),
(114, 'A Brief History of Time', 'Stephen Hawking', 'Bantam Books', '', '1988', '9780553380163', NULL, NULL, 5, 1, '2026-01-30 18:08:03', 2),
(115, 'The Selfish Gene', 'Richard Dawkins', 'Oxford Press', '', '1976', '9780192860927', NULL, NULL, 4, 1, '2026-01-30 18:08:03', 2),
(116, 'Cosmos', 'Carl Sagan', 'Random House', '', '1980', '9780345539434', NULL, NULL, 6, 1, '2026-01-30 18:08:03', 2),
(117, 'The Gene', 'Siddhartha Mukherjee', 'Scribner', '', '2016', '9781476733524', NULL, NULL, 3, 1, '2026-01-30 18:08:03', 2),
(118, 'Clean Code', 'Robert C. Martin', 'Prentice Hall', '', '2008', '9780132350884', NULL, NULL, 5, 1, '2026-01-30 18:08:03', 3),
(119, 'The Pragmatic Programmer', 'Andrew Hunt', 'Addison-Wesley', '', '1999', '9780201616224', NULL, NULL, 4, 1, '2026-01-30 18:08:03', 3),
(120, 'Code Complete', 'Steve McConnell', 'Microsoft Press', '', '2004', '9780735619678', NULL, NULL, 6, 1, '2026-01-30 18:08:03', 3),
(121, 'Design Patterns', 'Erich Gamma', 'Addison-Wesley', '', '1994', '9780201633610', NULL, NULL, 3, 1, '2026-01-30 18:08:03', 3),
(122, 'Artificial Intelligence: A Modern Approach', 'Stuart Russell', 'Pearson', '', '2020', '9780134610993', NULL, NULL, 5, 1, '2026-01-30 18:08:03', 4),
(123, 'Deep Learning', 'Ian Goodfellow', 'MIT Press', '', '2016', '9780262035613', NULL, NULL, 4, 1, '2026-01-30 18:08:03', 4),
(124, 'Machine Learning', 'Tom Mitchell', 'McGraw-Hill', '', '2012', '9780070428072', NULL, NULL, 3, 0, '2026-01-30 18:08:03', 4),
(125, 'Hands-On Machine Learning', 'Aurelien Geron', 'OReilly Media', '', '2019', '9781492032649', NULL, NULL, 6, 1, '2026-01-30 18:08:03', 4),
(126, 'Python Crash Course', 'Eric Matthes', 'No Starch Press', '', '2019', '9781593279288', NULL, NULL, 5, 1, '2026-01-30 18:08:03', 5),
(127, 'Eloquent JavaScript', 'Marijn Haverbeke', 'No Starch Press', '', '2018', '9781593279509', NULL, NULL, 4, 1, '2026-01-30 18:08:03', 5),
(128, 'Learning PHP and MySQL', 'Jon Duckett', 'OReilly Media', '', '2016', '9781491978917', NULL, NULL, 3, 1, '2026-01-30 18:08:03', 5),
(129, 'Java: The Complete Reference', 'Herbert Schildt', 'McGraw-Hill', '', '2018', '9781260440232', NULL, NULL, 6, 1, '2026-01-30 18:08:03', 5),
(130, 'HTML and CSS', 'Jon Duckett', 'Wiley', '', '2011', '9781118008188', NULL, NULL, 5, 1, '2026-01-30 18:08:03', 6),
(131, 'JavaScript: The Good Parts', 'Douglas Crockford', 'OReilly Media', '', '2008', '9780596517748', NULL, NULL, 4, 1, '2026-01-30 18:08:03', 6),
(132, 'Learning Web Design', 'Jennifer Robbins', 'OReilly Media', '', '2018', '9781491960202', NULL, NULL, 6, 1, '2026-01-30 18:08:03', 6),
(133, 'PHP Objects and Patterns', 'Matt Zandstra', 'Apress', '', '2014', '9781430260003', NULL, NULL, 3, 1, '2026-01-30 18:08:03', 6),
(134, 'Data Science from Scratch', 'Joel Grus', 'OReilly Media', '', '2019', '9781492041139', NULL, NULL, 5, 0, '2026-01-30 18:08:03', 7),
(135, 'Practical Statistics', 'Peter Bruce', 'OReilly Media', '', '2020', '9781492072942', NULL, NULL, 4, 1, '2026-01-30 18:08:03', 7),
(136, 'Python for Data Analysis', 'Wes McKinney', 'OReilly Media', '', '2017', '9781491957660', NULL, NULL, 6, 1, '2026-01-30 18:08:03', 7),
(137, 'Storytelling with Data', 'Cole Nussbaumer', 'Wiley', '', '2015', '9781119002253', NULL, NULL, 3, 1, '2026-01-30 18:08:03', 7),
(138, 'The Web Application Hackers Handbook', 'Dafydd Stuttard', 'Wiley', '', '2011', '9781118026472', NULL, NULL, 4, 1, '2026-01-30 18:08:03', 8),
(139, 'Hacking: The Art of Exploitation', 'Jon Erickson', 'No Starch Press', '', '2008', '9781593271442', NULL, NULL, 5, 1, '2026-01-30 18:08:03', 8),
(140, 'Cybersecurity Essentials', 'Charles Brooks', 'Cisco Press', '', '2018', '9780134996882', NULL, NULL, 3, 1, '2026-01-30 18:08:03', 8),
(141, 'Practical Malware Analysis', 'Michael Sikorski', 'No Starch Press', '', '2012', '9781593272906', NULL, NULL, 4, 1, '2026-01-30 18:08:03', 8),
(142, 'How Learning Works', 'Susan Ambrose', 'Jossey-Bass', '', '2010', '9780470484104', NULL, NULL, 5, 1, '2026-01-30 18:08:03', 9),
(143, 'Make It Stick', 'Peter Brown', 'Harvard Press', '', '2014', '9780674729014', NULL, NULL, 4, 1, '2026-01-30 18:08:03', 9),
(144, 'Teaching Tech Together', 'Greg Wilson', 'CRC Press', '', '2019', '9780367352974', NULL, NULL, 3, 1, '2026-01-30 18:08:03', 9),
(145, 'Learning How to Learn', 'Barbara Oakley', 'Penguin', '', '2015', '9780143128257', NULL, NULL, 6, 1, '2026-01-30 18:08:03', 9),
(146, '1984', 'George Orwell', 'Penguin Books', '', '1949', '9780451524935', NULL, NULL, 5, 1, '2026-01-30 18:08:03', 10),
(147, 'The Hobbit', 'J.R.R. Tolkien', 'HarperCollins', '', '1937', '9780261103344', NULL, NULL, 4, 1, '2026-01-30 18:08:03', 10),
(148, 'Dune', 'Frank Herbert', 'Ace Books', '', '1965', '9780441013593', NULL, NULL, 6, 1, '2026-01-30 18:08:03', 10),
(149, 'The Alchemist', 'Paulo Coelho', 'HarperOne', '', '1988', '9780061122415', NULL, NULL, 4, 4, '2026-01-30 18:08:03', 10),
(150, 'Introduction to Database Systems', 'C. J. Date', 'Pearson Education', '', '0000', '978-9332582705', NULL, NULL, 5, 5, '2026-01-30 18:43:52', 11),
(151, 'dummmy', 'dhiraj', 'dhiru', '', '0000', '111111111111', NULL, NULL, 2, 2, '2026-01-31 20:47:00', 12);

-- --------------------------------------------------------

--
-- Table structure for table `borrow_records`
--

CREATE TABLE `borrow_records` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `borrow_date` date NOT NULL,
  `return_date` date NOT NULL,
  `actual_return_date` date DEFAULT NULL,
  `status` enum('borrowed','returned','overdue') NOT NULL DEFAULT 'borrowed',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrow_records`
--

INSERT INTO `borrow_records` (`id`, `member_id`, `book_id`, `borrow_date`, `return_date`, `actual_return_date`, `status`, `created_at`) VALUES
(1, 7, 124, '2026-01-15', '2026-01-23', NULL, 'borrowed', '2026-01-30 18:50:44'),
(3, 7, 146, '2026-01-31', '0000-00-00', '2026-01-31', 'returned', '2026-01-31 17:12:40'),
(4, 7, 114, '2026-01-31', '2026-01-31', NULL, 'returned', '2026-01-31 17:15:20'),
(5, 7, 122, '2026-01-31', '2026-01-31', NULL, 'returned', '2026-01-31 17:38:50'),
(7, 7, 111, '2026-01-31', '0000-00-00', NULL, 'borrowed', '2026-01-31 18:09:11'),
(8, 7, 134, '2026-01-24', '2025-12-31', NULL, 'borrowed', '2026-01-31 20:42:46'),
(9, 7, 122, '2026-02-01', '0000-00-00', '2026-02-01', 'returned', '2026-01-31 21:11:05'),
(10, 7, 135, '2026-02-01', '0000-00-00', NULL, 'borrowed', '2026-01-31 21:11:10'),
(11, 7, 151, '2026-02-01', '0000-00-00', NULL, 'borrowed', '2026-01-31 21:11:18');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(4, 'AI'),
(1, 'Comic'),
(11, 'Computer Science'),
(8, 'Cyber Security'),
(7, 'Data Science'),
(12, 'dummy'),
(9, 'Education'),
(10, 'Fiction'),
(5, 'Programming'),
(2, 'Science'),
(3, 'Technology'),
(6, 'Web Development');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','addressed') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `member_id`, `message`, `created_at`, `status`) VALUES
(1, 10, 'the collection of books are low ', '2026-01-27 23:14:43', 'pending'),
(2, 7, 'dhksdskd', '2026-01-31 20:14:56', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `fines`
--

CREATE TABLE `fines` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `borrow_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paid` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fines`
--

INSERT INTO `fines` (`id`, `member_id`, `borrow_id`, `amount`, `paid`) VALUES
(1, 7, 1, 20.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('open','in_progress','resolved') DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`id`, `member_id`, `book_id`, `subject`, `description`, `status`, `created_at`) VALUES
(1, 7, NULL, 'cant change my password', 'i m trying to change my password but it showing error .', 'open', '2026-01-27 23:34:40'),
(2, 7, NULL, 'About passwords', 'when i try to change  password  it show error', 'open', '2026-01-29 08:54:26'),
(3, 7, NULL, 'About passwords', 'ffffffffffffff', 'resolved', '2026-01-31 20:05:27'),
(4, 7, NULL, 'About passwords', 'ffffffffffffff', 'in_progress', '2026-01-31 20:08:00');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `photo` varchar(255) DEFAULT 'default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `user_id`, `name`, `email`, `phone`, `created_at`, `photo`) VALUES
(1, NULL, 'Dhiraj Bohara', 'dhirajbohara767@gmail.com', '9762475537', '2026-01-27 21:11:10', '1769548270_697929eea765c.jpeg'),
(2, NULL, 'Admin', 'admin00@gmail.com', '1234567890', '2026-01-27 21:21:27', '1769548887_69792c5725baf.jpeg'),
(3, 6, '111111', '1111111@gmail.com', '1111111', '2026-01-27 21:30:09', '1769549409_69792e61c842e.jpeg'),
(4, 7, 'Dhiru Bohara', 'dhirajbohara07@gmail.com', '9712345678', '2026-01-27 22:03:27', '1769551407_6979362f9ab27.jpeg'),
(5, 8, 'wwww', 'wwww@gmail.com', '9762475536', '2026-01-27 22:11:53', '1769551913_69793829b304c.png'),
(6, NULL, 'staff', 'staff@gmail.com', '1234567890', '2026-01-27 22:51:45', '1769554304_69794180e6623.png'),
(7, 10, 'member', 'member@gmail.com', '9762475536', '2026-01-27 23:07:06', '1769555226_6979451abd982.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `read_status` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `fine_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_number` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `member_id`, `fine_id`, `book_id`, `amount`, `payment_method`, `payment_date`, `reference_number`, `notes`) VALUES
(1, 7, NULL, NULL, 500.00, 'Dummy Payment', '2026-01-31 19:56:37', '697e5e758d8c8', 'payment of fine'),
(2, 7, NULL, NULL, 500.00, ' FonePay', '2026-01-31 19:57:42', '697e5eb645bc9', 'payment of fine'),
(3, 7, NULL, NULL, 20.00, ' FonePay', '2026-01-31 19:57:55', '697e5ec316500', '1');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `reservation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','approved','cancelled') NOT NULL DEFAULT 'pending',
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reserve_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `member_id`, `book_id`, `reservation_date`, `status`, `expires_at`, `created_at`, `reserve_date`) VALUES
(1, 7, 117, '2026-01-30 18:15:00', '', NULL, '2026-01-30 21:01:34', '2026-01-31 23:01:20'),
(2, 7, 117, '2026-01-30 18:15:00', '', NULL, '2026-01-30 21:01:46', '2026-01-31 23:01:20'),
(3, 7, 117, '2026-01-30 18:15:00', '', NULL, '2026-01-30 21:01:50', '2026-01-31 23:01:20'),
(4, 7, 117, '2026-01-30 18:15:00', '', NULL, '2026-01-30 21:06:09', '2026-01-31 23:01:20'),
(5, 7, 148, '2026-01-30 18:15:00', '', NULL, '2026-01-30 21:10:45', '2026-01-31 23:01:20'),
(6, 10, 122, '2026-01-31 17:16:35', '', NULL, '2026-01-31 17:16:35', '2026-01-31 23:01:35'),
(7, 7, 122, '2026-01-31 17:18:25', '', '2026-02-02 16:02:25', '2026-01-31 17:18:25', '2026-01-31 23:03:25'),
(8, 7, 122, '2026-01-31 17:24:43', 'cancelled', NULL, '2026-01-31 17:24:43', '2026-01-31 23:09:43'),
(9, 10, 113, '2026-01-31 17:38:55', 'pending', NULL, '2026-01-31 17:38:55', '2026-01-31 23:23:55'),
(10, 7, 148, '2026-01-31 18:15:00', '', NULL, '2026-01-31 19:14:48', '2026-02-01 00:59:48'),
(11, 7, 126, '2026-01-31 18:15:00', '', NULL, '2026-01-31 19:14:59', '2026-02-01 00:59:59'),
(12, 7, 135, '2026-01-31 20:21:26', '', '2026-02-02 15:55:50', '2026-01-31 20:21:26', '2026-02-01 02:06:26'),
(13, 7, 151, '2026-01-31 20:50:07', '', '2026-02-02 16:05:29', '2026-01-31 20:50:07', '2026-02-01 02:35:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','staff','member') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(6, '111111', '$2y$10$sZMqUPRAQixIvSkvJjvk2O14g6myGiyDLhCMlMIZA/ZmJHf7EOcqe', 'admin'),
(7, 'Dhiraj', '$2y$10$SyCJy51Vz3c6GVPLW6pcKO1XPT9cESpkaEW32J76mgqtyOnTiAXJ.', 'admin'),
(8, 'wwww', '$2y$10$ObvzQBT.aIFRFKef7.PAVukrVrI9BQ/9lV/lbBuDEhTfLecCfSc1C', 'admin'),
(10, 'member', '$2y$10$XpBVYZDK8Aj5/Lf2kEvUzOvp80NfI282AgEqJqYwuiEuVRZL2HZNu', 'member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `isbn` (`isbn`),
  ADD KEY `fk_category` (`category_id`);

--
-- Indexes for table `borrow_records`
--
ALTER TABLE `borrow_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `fines`
--
ALTER TABLE `fines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `borrow_id` (`borrow_id`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `fine_id` (`fine_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `borrow_records`
--
ALTER TABLE `borrow_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fines`
--
ALTER TABLE `fines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `borrow_records`
--
ALTER TABLE `borrow_records`
  ADD CONSTRAINT `borrow_records_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  ADD CONSTRAINT `borrow_records_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `fines`
--
ALTER TABLE `fines`
  ADD CONSTRAINT `fines_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  ADD CONSTRAINT `fines_ibfk_2` FOREIGN KEY (`borrow_id`) REFERENCES `borrow_records` (`id`);

--
-- Constraints for table `issues`
--
ALTER TABLE `issues`
  ADD CONSTRAINT `issues_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `issues_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`fine_id`) REFERENCES `fines` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `payments_ibfk_3` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
