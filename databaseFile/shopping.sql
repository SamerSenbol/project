-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2020 at 09:08 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_01_02_110103_create_products_table', 1),
(5, '2020_01_02_112307_add_fields_to_products_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `status` text DEFAULT NULL,
  `price` float DEFAULT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(100) NOT NULL,
  `zip` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `date`, `status`, `price`, `name`, `address`, `phone`, `zip`, `email`) VALUES
(1, '2020-03-11 08:02:38', NULL, 113.9, 'asd', 'sad', '123', 'asd', 'asd@mil.com'),
(2, '2020-03-11 08:05:08', 'Booked', 113.9, 'asd', 'sad', '123', 'asd', 'asd@mil.com'),
(3, '2020-03-11 08:05:33', 'Booked', 113.9, 'asd', 'sad', '123', 'asd', 'asd@mil.com'),
(4, '2020-03-11 08:07:40', 'Booked', 113.9, 'asd', 'sad', '123', 'asd', 'asd@mil.com'),
(5, '2020-03-11 08:18:09', 'Booked', 70.35, 'Test', 'test address', '128374', '284757', 'test@mail.com'),
(6, '2020-03-12 09:08:24', 'Booked', 113.9, 'Test CUSTOMER', 'TEST ADDRESS', '249586', '133748', 'test@mail.com'),
(7, '2020-03-12 09:14:43', 'Booked', 23.45, 'test', 'lextorps', '720203140', '1234567', 'samer@exampel.com'),
(8, '2020-03-12 09:30:23', 'Booked', 56.95, 'test', 'lextorps', '0720203140', '1234567', 'samer@exampel.com');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `item_price` float DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `item_id`, `order_id`, `item_price`, `quantity`, `total_price`) VALUES
(1, 2, 1, 23.45, 2, '67'),
(2, 2, 2, 28.45, 2, '67'),
(3, 1, 3, 46.9, 2, '46.9'),
(4, 2, 3, 67, 2, '67'),
(5, 1, 4, 46.9, 2, '46.9'),
(6, 2, 4, 67, 2, '67'),
(7, 1, 5, 70.35, 3, '70.35'),
(8, 1, 6, 46.9, 2, '46.9'),
(9, 2, 6, 67, 2, '67'),
(10, 1, 7, 23.45, 1, '23.45'),
(11, 1, 8, 23.45, 1, '23.45'),
(12, 2, 8, 33.5, 1, '33.5');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `paypal_payment_id` text DEFAULT NULL,
  `paypal_payer_id` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `type` int(11) NOT NULL,
  `image` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `type`, `image`) VALUES
(1, 'White shirt', 'wome shirt', 499, 0, 'Women.jpg'),
(2, 'Black shirt', 'men shirt', 349, 0, 'Men.jpg'),
(3, 'Accessories ', 'Very nice and modern', 119, 0, 'accessories1.jpg'),
(4, 'Accessories', 'This is very nice accessories', 85, 0, 'accessories2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `remember_token` text DEFAULT NULL,
  `admin_level` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `admin`, `updated_at`, `created_at`, `remember_token`, `admin_level`) VALUES
(1, 'Administrator', 'admin@mail.com', '$2y$10$OWnOfhKdwlb6AxXMnCgXBehFMpkxSmDHW6y/iyGk3x.6muG6XvY1K', 1, '2020-03-09 12:41:28', '2020-03-09 12:41:28', NULL, 0),
(2, 'Test', 'test@mail.com', '$2y$10$lm/Io3yk0Jlf7ICxj4bcHuClgVWgeH7UWaGvfd/kvGXQvYq1SHfV2', 0, '2020-03-14 17:11:52', '2020-03-12 20:01:38', NULL, 0),
(3, 'SAMER', 'SAMER@TEST.COM', '$2y$10$5DeQsiGQufeTwsOjNZ89YO1GTtfeklD82GjnSXBZVKwMRwWeVhQ4K', 1, '2020-03-12 20:13:17', '2020-03-12 20:13:17', NULL, 0),
(4, 'test1', 'same2r@exampel.com', '$2y$10$7AKJwf4XGl5idWa/NatgB.wtIK/YX8ztVdMt9rpmWiXk5GMi3ysVK', 0, '2020-03-14 18:13:20', '2020-03-14 16:08:05', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
