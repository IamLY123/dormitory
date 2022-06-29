-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 14, 2022 at 06:18 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dormitory`
--

-- --------------------------------------------------------

--
-- Table structure for table `beds`
--

CREATE TABLE `beds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bed` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beds`
--

INSERT INTO `beds` (`id`, `bed`, `created_at`, `updated_at`) VALUES
(1, '1เตียง', NULL, NULL),
(2, '2เตียง', NULL, NULL),
(3, '3เตียง', NULL, NULL),
(4, '4เตียง', NULL, NULL),
(5, '5เตียง', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `electricities`
--

CREATE TABLE `electricities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `power_use` int(11) NOT NULL,
  `unit` int(11) NOT NULL DEFAULT 3,
  `room_rent_id` bigint(20) UNSIGNED NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `electricities`
--

INSERT INTO `electricities` (`id`, `power_use`, `unit`, `room_rent_id`, `total`, `created_at`, `updated_at`, `status_id`) VALUES
(5, 120, 3, 3, 360, '2022-01-31 04:51:10', '2022-02-01 09:30:05', 1),
(6, 20, 3, 8, 60, '2022-01-31 04:53:03', '2022-02-01 09:31:27', 1),
(7, 34, 3, 5, 102, '2022-01-31 07:04:44', '2022-02-01 09:31:18', 1),
(8, 17, 3, 4, 51, '2022-01-31 07:04:56', '2022-02-01 09:31:33', 1),
(10, 35, 3, 9, 105, '2022-02-02 05:51:00', '2022-02-02 05:51:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `floors`
--

CREATE TABLE `floors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `floor_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `floors`
--

INSERT INTO `floors` (`id`, `floor_name`, `created_at`, `updated_at`) VALUES
(1, 'ชั้นล่าง', NULL, NULL),
(2, 'ชั้นที่หนึ่ง', NULL, NULL),
(3, 'ชั้นที่สอง', NULL, NULL),
(4, 'ชั้นที่สาม', NULL, NULL),
(5, 'ชั้นที่สี่', NULL, NULL),
(6, 'ชั้นที่ห้า', NULL, NULL),
(7, 'ชั้นที่หก', NULL, NULL);

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
(15, '2022_01_20_160625_create_room', 3),
(155, '2014_10_12_000000_create_users_table', 4),
(156, '2014_10_12_100000_create_password_resets_table', 4),
(157, '2014_10_12_200000_add_two_factor_columns_to_users_table', 4),
(158, '2019_08_19_000000_create_failed_jobs_table', 4),
(159, '2019_12_14_000001_create_personal_access_tokens_table', 4),
(160, '2022_01_20_081205_create_sessions_table', 4),
(161, '2022_01_20_155651_create_sizes_table', 4),
(162, '2022_01_20_155720_create_beds_table', 4),
(163, '2022_01_20_161140_create_floors', 4),
(164, '2022_01_20_161637_create_rooms', 4),
(165, '2022_01_21_140239_create_room_rent', 4),
(166, '2022_01_21_223102_add_photo_to_rooms', 4),
(167, '2022_01_22_213254_create_statuses_table', 4),
(168, '2022_01_22_213536_add_status_to_rooms', 4),
(169, '2022_01_22_223900_create_rules_table', 4),
(170, '2022_01_24_215011_create_electricities_table', 4),
(171, '2022_01_30_133332_add_status_to_electricities', 4),
(172, '2022_01_30_142029_create_waters_table', 5),
(173, '2022_01_31_132210_add_totalpay_to_room_rents', 5),
(174, '2022_01_31_141721_create_payments_table', 5),
(175, '2022_01_31_210215_add_status_to_payments', 5),
(176, '2022_02_01_114107_create_status_paids_table', 6);

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_rent_id` bigint(20) UNSIGNED NOT NULL,
  `payment` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `room_rent_id`, `payment`, `created_at`, `updated_at`, `status_id`) VALUES
(10, 3, 3350, '2022-01-31 04:59:51', '2022-02-01 09:02:23', 1),
(11, 8, 3850, '2022-01-31 06:49:25', '2022-02-01 06:59:47', 1),
(12, 4, 3350, '2022-01-31 07:00:40', '2022-02-01 07:00:50', 1),
(13, 5, 3350, '2022-01-31 07:00:59', '2022-02-01 07:01:05', 1),
(14, 9, 3850, '2022-02-01 07:11:31', '2022-02-01 07:11:31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size_id` bigint(20) UNSIGNED NOT NULL,
  `bed_id` bigint(20) UNSIGNED NOT NULL,
  `floor_id` bigint(20) UNSIGNED NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `internet_price` int(11) NOT NULL DEFAULT 350,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_number`, `size_id`, `bed_id`, `floor_id`, `detail`, `price`, `internet_price`, `created_at`, `updated_at`, `status_id`, `photo`) VALUES
(1, '001', 1, 1, 1, 'air, microwave, shelf, table, closet', 3000, 350, '2022-01-31 07:44:09', '2022-02-01 17:11:41', 2, 'room1_1643615049.jpeg'),
(2, '002', 2, 2, 1, 'air, table, microwave,closet', 3500, 350, '2022-01-31 07:46:01', '2022-01-31 15:44:19', 2, 'room2_1643615161.jpeg'),
(3, '003', 1, 1, 1, 'air, microwave, shelf, closet, table', 3000, 350, '2022-01-31 07:47:05', '2022-01-31 08:07:39', 2, 'room1_1643615225.jpeg'),
(4, '004', 1, 1, 1, 'air,microwave, closet, shelf, table', 3000, 350, '2022-01-31 15:00:14', '2022-01-31 15:29:37', 2, 'room1_1643641214.jpeg'),
(9, '009', 2, 2, 1, 'air, microwave, table, closet', 3500, 350, '2022-02-01 07:10:00', '2022-02-01 07:11:31', 2, 'room2_1643699400.jpeg'),
(16, '005', 2, 3, 1, 'air,closet', 3800, 350, '2022-02-02 06:40:57', '2022-02-02 06:40:57', 1, 'room3_1643784057.jpeg'),
(19, '008', 1, 1, 1, 'air, closet , table, shelf', 3000, 350, '2022-02-02 06:43:12', '2022-02-02 06:43:12', 1, 'room1_1643784192.jpeg'),
(21, '006', 3, 4, 1, 'air, closet , table', 4200, 350, '2022-02-02 06:49:14', '2022-02-02 06:49:14', 1, 'room4_1643784554.jpeg'),
(22, '007', 3, 5, 1, 'air, closet', 4500, 350, '2022-02-02 06:50:40', '2022-02-02 06:50:40', 1, 'room5_1643784640.jpeg'),
(23, '010', 2, 2, 1, 'air, closet ,microwave, table , shelf', 3500, 350, '2022-02-02 06:51:26', '2022-02-02 06:51:26', 1, 'room2_1643784686.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `room_rent`
--

CREATE TABLE `room_rent` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `timeout` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_rent`
--

INSERT INTO `room_rent` (`id`, `user_id`, `room_id`, `created_at`, `updated_at`, `timeout`) VALUES
(3, 5, 1, '2022-01-31 07:59:04', '2022-01-31 07:59:04', NULL),
(4, 6, 3, '2022-01-31 08:07:39', '2022-01-31 08:07:39', NULL),
(5, 7, 4, '2022-01-31 15:29:37', '2022-01-31 15:29:37', NULL),
(8, 10, 2, '2022-01-31 15:44:19', '2022-01-31 15:44:19', NULL),
(9, 11, 9, '2022-02-01 07:11:31', '2022-02-01 10:43:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rules`
--

CREATE TABLE `rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rules`
--

INSERT INTO `rules` (`id`, `content`, `created_at`, `updated_at`) VALUES
(1, 'ห้ามเข้าหอหลัง 4 ทุ่ม', '2022-01-31 14:57:17', '2022-01-31 14:57:17'),
(4, 'ดูค่านำ้ ค่าไฟ ค่าห้อง ค่าไฟ ได้ที่ระบบของผู้เช้า', '2022-02-02 06:53:23', '2022-02-02 06:53:23'),
(5, 'จ่ายค่าไฟ ค่านำ้ ค่าห้อง กับค่าเน็ตภายในวันที่25 จนถึงวันสิ้นสุดของทุกๆเดือน', '2022-02-02 06:55:04', '2022-02-02 06:55:04'),
(6, 'ห้ามทิ้งขยะหน้าห้อง', '2022-02-02 06:55:37', '2022-02-02 06:55:37'),
(7, 'กรุณารักษาความสะอาดภายในหอ', '2022-02-02 06:56:13', '2022-02-02 06:56:13'),
(8, 'ห้ามดืมสุรา ห้ามสูบบุหรี', '2022-02-02 06:56:35', '2022-02-02 06:56:35'),
(9, 'ห้องที่ค้างจ่ายค่าห้อง 3 เดือนจะคืนห้องกลับ', '2022-02-02 06:57:14', '2022-02-02 06:57:14'),
(10, 'ถ้าหากมีห้องใดไม่ได้จ่ายค่านำ้ ค่าไฟ 3 เดือนจะถูกตัดไฟและนำ้', '2022-02-02 06:58:05', '2022-02-02 06:58:05'),
(11, 'หากมีปัญหาใดๆในห้องสามารถมาที่ เขียนแจ้งบนกระดานชั้นล่างหน้าห้องแม่บ้าน หรือโทรเบอร์  +855 10499958 หรือบอกผู้ดูแลหอ', '2022-02-02 07:01:43', '2022-02-02 07:05:02');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('3dQtCtmLP1Po5h3CwoYjwnIBy5JmuWutYasQq34D', 4, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiSGlKNXRyN2ZQaUt6REIyZVhVQ282NXhVSXBuZEsxbndIb1NBZWdHWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJE1tSG0wUUUzSEMvbkRxeDRzZkRFYU92MkZ0UWtsekY2NDZsQnZpa2FIR3VrTm5WekhaSWlTIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRNbUhtMFFFM0hDL25EcXg0c2ZERWFPdjJGdFFrbHpGNjQ2bEJ2aWthSEd1a05uVnpIWklpUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC91cGRhdGUvcnVsZS8kMTEiO319', 1643785514),
('qGBU88j8Ok1qNTItjDJ3LNS9xXQw6W3nrVMkkfAW', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVWFXYm1uMXZjQml2YURnWmZCYk1TTkxQY3lRZERUVTdobXUwcVJBVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1643867752);

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size`, `created_at`, `updated_at`) VALUES
(1, 'เล็ก', NULL, NULL),
(2, 'กลาง', NULL, NULL),
(3, 'ใหญ่', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'active', NULL, NULL),
(2, 'deactive', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `status_paids`
--

CREATE TABLE `status_paids` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status_paids`
--

INSERT INTO `status_paids` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'paid', NULL, NULL),
(2, 'unpaid', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateofbirth` date NOT NULL,
  `status` enum('admin','renter') COLLATE utf8mb4_unicode_ci NOT NULL,
  `thai_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `dateofbirth`, `status`, `thai_id`, `address`, `phone`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(4, 'Makly', 'Sim', '2000-06-04', 'admin', '1234567890', '41 m5 thachang mueng chanthaburi 22000', '0660018286', 'lysimcam@gmail.com', NULL, '$2y$10$MmHm0QE3HC/nDqx4sfDEaOv2FtQklzF646lBvikaHGukNnVzHZIiS', NULL, NULL, NULL, NULL, NULL, '2022-01-31 07:42:33', '2022-01-31 07:42:33'),
(5, 'Rita', 'Rita', '2002-01-07', 'renter', '123456789', '41 m5 thachang mueng chanthaburi 22000', '0660018286', 'simmaklyly@gmail.com', NULL, '$2y$10$Gm5UgArmyAaBbAOo77JslOnnFcGFbLYOp2FEU5Y8SJbarftOJW2du', NULL, NULL, NULL, NULL, NULL, '2022-01-31 07:59:04', '2022-01-31 07:59:04'),
(6, 'Bora', 'Bora', '2009-12-27', 'renter', '1234567890', '41 m5 thachang mueng chanthaburi 22000', '0660018286', 'customer002@vegetable.estore', NULL, '$2y$10$Q9vYJn/8027xht38GUNk5OAZ/Sq8vGFIhdGBTlPivl57zuSIplMKy', NULL, NULL, NULL, NULL, NULL, '2022-01-31 08:07:39', '2022-01-31 08:07:39'),
(7, 'Karina', 'Karina', '1997-02-04', 'renter', '1234567890', 'chanthaburi', '0660018286', 'market001@vegetable.estore', NULL, '$2y$10$4XUnAIPOpWVbLSohuWsz.eCdszEz0.p10pg5s2ncoyoRS3a4qrw3q', NULL, NULL, NULL, NULL, NULL, '2022-01-31 15:29:37', '2022-01-31 15:29:37'),
(10, 'Jay', 'Lee', '1996-06-30', 'renter', 'N01234546547', 'bangkok', '0660018286', 'deliver001@vegetable.estore', NULL, '$2y$10$q6iZYOck3NabbmRBCi5aYueMr0ePvxkWii/9sT05hnmx/uj2tCTHi', NULL, NULL, NULL, NULL, NULL, '2022-01-31 15:44:19', '2022-01-31 15:44:19'),
(11, 'David', 'David', '2009-02-06', 'renter', 'N0123456789', '41 m5 thachang mueng chanthaburi 22000', '0660018286', 'deliver002@vegetable.estore', NULL, '$2y$10$gZLjqievQEwE6upDn4OpTufVZyRqYzSxVLpu3pUIdxYL5.5H7bvUC', NULL, NULL, NULL, NULL, NULL, '2022-02-01 07:11:31', '2022-02-01 07:11:31');

-- --------------------------------------------------------

--
-- Table structure for table `waters`
--

CREATE TABLE `waters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `power_use` int(11) NOT NULL,
  `unit` int(11) NOT NULL DEFAULT 1,
  `room_rent_id` bigint(20) UNSIGNED NOT NULL,
  `total` double(8,2) NOT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `waters`
--

INSERT INTO `waters` (`id`, `power_use`, `unit`, `room_rent_id`, `total`, `status_id`, `created_at`, `updated_at`) VALUES
(3, 20, 1, 3, 20.00, 1, '2022-01-31 04:53:38', '2022-02-01 10:51:42'),
(4, 45, 1, 4, 45.00, 1, '2022-01-31 07:03:58', '2022-02-01 10:57:41'),
(5, 34, 1, 8, 34.00, 1, '2022-01-31 07:04:17', '2022-02-01 10:57:37'),
(6, 50, 1, 5, 50.00, 1, '2022-01-31 07:04:28', '2022-02-01 10:57:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beds`
--
ALTER TABLE `beds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `electricities`
--
ALTER TABLE `electricities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_renter` (`room_rent_id`),
  ADD KEY `fk_statusp2` (`status_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `floors`
--
ALTER TABLE `floors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_roomrent1` (`room_rent_id`),
  ADD KEY `fk_statusp1` (`status_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_size_id_foreign` (`size_id`),
  ADD KEY `rooms_bed_id_foreign` (`bed_id`),
  ADD KEY `rooms_floor_id_foreign` (`floor_id`),
  ADD KEY `rooms_status_id_foreign` (`status_id`);

--
-- Indexes for table `room_rent`
--
ALTER TABLE `room_rent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_rent_user_id_foreign` (`user_id`),
  ADD KEY `room_rent_room_id_foreign` (`room_id`);

--
-- Indexes for table `rules`
--
ALTER TABLE `rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_paids`
--
ALTER TABLE `status_paids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `waters`
--
ALTER TABLE `waters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_roomrent` (`room_rent_id`),
  ADD KEY `fk_statusp` (`status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `beds`
--
ALTER TABLE `beds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `electricities`
--
ALTER TABLE `electricities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `floors`
--
ALTER TABLE `floors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `room_rent`
--
ALTER TABLE `room_rent`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rules`
--
ALTER TABLE `rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_paids`
--
ALTER TABLE `status_paids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `waters`
--
ALTER TABLE `waters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `electricities`
--
ALTER TABLE `electricities`
  ADD CONSTRAINT `fk_renter` FOREIGN KEY (`room_rent_id`) REFERENCES `room_rent` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_statusp2` FOREIGN KEY (`status_id`) REFERENCES `status_paids` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_roomrent1` FOREIGN KEY (`room_rent_id`) REFERENCES `room_rent` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_statusp1` FOREIGN KEY (`status_id`) REFERENCES `status_paids` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_bed_id_foreign` FOREIGN KEY (`bed_id`) REFERENCES `beds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rooms_floor_id_foreign` FOREIGN KEY (`floor_id`) REFERENCES `floors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rooms_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rooms_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `room_rent`
--
ALTER TABLE `room_rent`
  ADD CONSTRAINT `room_rent_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_rent_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `waters`
--
ALTER TABLE `waters`
  ADD CONSTRAINT `fk_roomrent` FOREIGN KEY (`room_rent_id`) REFERENCES `room_rent` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_statusp` FOREIGN KEY (`status_id`) REFERENCES `status_paids` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
