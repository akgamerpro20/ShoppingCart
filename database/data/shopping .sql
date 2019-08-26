-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 23, 2019 at 02:19 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

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
-- Table structure for table `backends`
--

CREATE TABLE `backends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backends`
--

INSERT INTO `backends` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$TJy35QAWsHs6EjRqQh4PE.oWsjKzLVf3E7i2kWoFQaWD/I8HhSU7O', NULL, '2019-07-05 00:37:41', '2019-07-05 00:37:41');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Books', '2019-08-16 05:51:49', '2019-08-16 05:51:49'),
(2, 'Clothes', '2019-08-16 05:51:49', '2019-08-16 05:51:49'),
(3, 'Motocycles', '2019-08-16 05:51:49', '2019-08-16 05:51:49'),
(4, 'Bicycles', '2019-08-16 05:51:49', '2019-08-16 05:51:49');

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
(3, '2019_07_02_142904_create_products_table', 2),
(4, '2019_07_03_112322_create_categories_table', 3),
(5, '2019_07_05_070006_create_backends_table', 4),
(8, '2019_08_12_064448_create_orders_table', 5),
(9, '2016_06_01_000001_create_oauth_auth_codes_table', 6),
(10, '2016_06_01_000002_create_oauth_access_tokens_table', 6),
(11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 6),
(12, '2016_06_01_000004_create_oauth_clients_table', 6),
(13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Shopping Personal Access Client', 'jaVFqVuf4YIfWZtbkDK7GEmhl0A4I2ZBuEKiiptj', 'http://localhost', 1, 0, 0, '2019-08-22 14:31:01', '2019-08-22 14:31:01'),
(2, NULL, 'Shopping Password Grant Client', 'KeXo24VPZz1jqGfJNogxw36XOOPq4B7hsemE01lt', 'http://localhost', 0, 1, 0, '2019-08-22 14:31:01', '2019-08-22 14:31:01');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-08-22 14:31:01', '2019-08-22 14:31:01');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `cart` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exp_month` int(11) NOT NULL,
  `exp_year` int(11) NOT NULL,
  `cvc` int(11) NOT NULL,
  `user_del` int(11) NOT NULL DEFAULT 0,
  `admin_del` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `user_id`, `cart`, `name`, `address`, `card_name`, `card_number`, `exp_month`, `exp_year`, `cvc`, `user_del`, `admin_del`) VALUES
(3, '2019-08-15 09:23:27', '2019-08-15 09:23:27', 2, 'O:8:\"App\\Cart\":3:{s:5:\"items\";a:3:{i:2;a:3:{s:3:\"qty\";i:2;s:5:\"price\";i:60;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:5:{i:0;s:11:\"category_id\";i:1;s:5:\"price\";i:2;s:5:\"photo\";i:3;s:5:\"title\";i:4;s:11:\"description\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:2;s:11:\"category_id\";i:2;s:5:\"price\";s:2:\"30\";s:5:\"photo\";s:34:\"5d52a2b09cb3b_babygirlclothes.jpeg\";s:5:\"title\";s:17:\"Baby Girl Clothes\";s:11:\"description\";s:305:\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.\";s:10:\"created_at\";s:19:\"2019-08-13 11:44:48\";s:10:\"updated_at\";s:19:\"2019-08-13 11:44:48\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:2;s:11:\"category_id\";i:2;s:5:\"price\";s:2:\"30\";s:5:\"photo\";s:34:\"5d52a2b09cb3b_babygirlclothes.jpeg\";s:5:\"title\";s:17:\"Baby Girl Clothes\";s:11:\"description\";s:305:\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.\";s:10:\"created_at\";s:19:\"2019-08-13 11:44:48\";s:10:\"updated_at\";s:19:\"2019-08-13 11:44:48\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}i:4;a:3:{s:3:\"qty\";i:4;s:5:\"price\";i:12000;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:5:{i:0;s:11:\"category_id\";i:1;s:5:\"price\";i:2;s:5:\"photo\";i:3;s:5:\"title\";i:4;s:11:\"description\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:4;s:11:\"category_id\";i:4;s:5:\"price\";s:4:\"3000\";s:5:\"photo\";s:28:\"5d52abeee1ae8_bicycle_01.jpg\";s:5:\"title\";s:14:\"MTB Bicycle 21\";s:11:\"description\";s:116:\"Cosmic And Peachbag Proudly Present The Unique High Performance And Stylish 27.5 Inch Trium Mtb Bikes With 21 Speed.\";s:10:\"created_at\";s:19:\"2019-08-13 11:55:51\";s:10:\"updated_at\";s:19:\"2019-08-13 12:24:14\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:4;s:11:\"category_id\";i:4;s:5:\"price\";s:4:\"3000\";s:5:\"photo\";s:28:\"5d52abeee1ae8_bicycle_01.jpg\";s:5:\"title\";s:14:\"MTB Bicycle 21\";s:11:\"description\";s:116:\"Cosmic And Peachbag Proudly Present The Unique High Performance And Stylish 27.5 Inch Trium Mtb Bikes With 21 Speed.\";s:10:\"created_at\";s:19:\"2019-08-13 11:55:51\";s:10:\"updated_at\";s:19:\"2019-08-13 12:24:14\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}i:9;a:3:{s:3:\"qty\";i:3;s:5:\"price\";i:300;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:5:{i:0;s:11:\"category_id\";i:1;s:5:\"price\";i:2;s:5:\"photo\";i:3;s:5:\"title\";i:4;s:11:\"description\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:9;s:11:\"category_id\";i:1;s:5:\"price\";s:3:\"100\";s:5:\"photo\";s:33:\"5d5411455f82d_mind_programmin.jpg\";s:5:\"title\";s:16:\"Mind Programming\";s:11:\"description\";s:428:\"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.\";s:10:\"created_at\";s:19:\"2019-08-14 20:18:53\";s:10:\"updated_at\";s:19:\"2019-08-14 20:18:53\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:9;s:11:\"category_id\";i:1;s:5:\"price\";s:3:\"100\";s:5:\"photo\";s:33:\"5d5411455f82d_mind_programmin.jpg\";s:5:\"title\";s:16:\"Mind Programming\";s:11:\"description\";s:428:\"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.\";s:10:\"created_at\";s:19:\"2019-08-14 20:18:53\";s:10:\"updated_at\";s:19:\"2019-08-14 20:18:53\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:9;s:10:\"totalPrice\";i:12360;}', 'Nay Win', 'Shwe Pyi Thar', 'TGITF', '56543456', 3, 2019, 789, 0, 0),
(4, '2019-08-15 10:49:31', '2019-08-15 10:49:31', 1, 'O:8:\"App\\Cart\":3:{s:5:\"items\";a:5:{i:1;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:50;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:5:{i:0;s:11:\"category_id\";i:1;s:5:\"price\";i:2;s:5:\"photo\";i:3;s:5:\"title\";i:4;s:11:\"description\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:1;s:11:\"category_id\";i:1;s:5:\"price\";s:2:\"50\";s:5:\"photo\";s:35:\"5d52a24febd0e_programming_core .jpg\";s:5:\"title\";s:19:\"Programming ASP.NET\";s:11:\"description\";s:366:\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\";s:10:\"created_at\";s:19:\"2019-08-13 11:43:11\";s:10:\"updated_at\";s:19:\"2019-08-13 11:43:11\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:1;s:11:\"category_id\";i:1;s:5:\"price\";s:2:\"50\";s:5:\"photo\";s:35:\"5d52a24febd0e_programming_core .jpg\";s:5:\"title\";s:19:\"Programming ASP.NET\";s:11:\"description\";s:366:\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\";s:10:\"created_at\";s:19:\"2019-08-13 11:43:11\";s:10:\"updated_at\";s:19:\"2019-08-13 11:43:11\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}i:2;a:3:{s:3:\"qty\";i:2;s:5:\"price\";i:60;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:5:{i:0;s:11:\"category_id\";i:1;s:5:\"price\";i:2;s:5:\"photo\";i:3;s:5:\"title\";i:4;s:11:\"description\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:2;s:11:\"category_id\";i:2;s:5:\"price\";s:2:\"30\";s:5:\"photo\";s:34:\"5d52a2b09cb3b_babygirlclothes.jpeg\";s:5:\"title\";s:17:\"Baby Girl Clothes\";s:11:\"description\";s:305:\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.\";s:10:\"created_at\";s:19:\"2019-08-13 11:44:48\";s:10:\"updated_at\";s:19:\"2019-08-13 11:44:48\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:2;s:11:\"category_id\";i:2;s:5:\"price\";s:2:\"30\";s:5:\"photo\";s:34:\"5d52a2b09cb3b_babygirlclothes.jpeg\";s:5:\"title\";s:17:\"Baby Girl Clothes\";s:11:\"description\";s:305:\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.\";s:10:\"created_at\";s:19:\"2019-08-13 11:44:48\";s:10:\"updated_at\";s:19:\"2019-08-13 11:44:48\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}i:6;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:60;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:5:{i:0;s:11:\"category_id\";i:1;s:5:\"price\";i:2;s:5:\"photo\";i:3;s:5:\"title\";i:4;s:11:\"description\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:6;s:11:\"category_id\";i:2;s:5:\"price\";s:2:\"60\";s:5:\"photo\";s:29:\"5d52a61813a98_girlclothes.jpg\";s:5:\"title\";s:12:\"Girl Clothes\";s:11:\"description\";s:576:\"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC.\";s:10:\"created_at\";s:19:\"2019-08-13 11:59:20\";s:10:\"updated_at\";s:19:\"2019-08-13 11:59:20\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:6;s:11:\"category_id\";i:2;s:5:\"price\";s:2:\"60\";s:5:\"photo\";s:29:\"5d52a61813a98_girlclothes.jpg\";s:5:\"title\";s:12:\"Girl Clothes\";s:11:\"description\";s:576:\"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC.\";s:10:\"created_at\";s:19:\"2019-08-13 11:59:20\";s:10:\"updated_at\";s:19:\"2019-08-13 11:59:20\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}i:7;a:3:{s:3:\"qty\";i:2;s:5:\"price\";i:4598;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:5:{i:0;s:11:\"category_id\";i:1;s:5:\"price\";i:2;s:5:\"photo\";i:3;s:5:\"title\";i:4;s:11:\"description\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:7;s:11:\"category_id\";i:4;s:5:\"price\";s:4:\"2299\";s:5:\"photo\";s:29:\"5d52ac1fdef01_bicycle_02.webp\";s:5:\"title\";s:17:\"Priority Bicycles\";s:11:\"description\";s:134:\"BACK IN STOCK with limited quantities remaining! Use code \"velofix600\" for free Velofix white glove delivery where available, or free.\";s:10:\"created_at\";s:19:\"2019-08-13 12:01:22\";s:10:\"updated_at\";s:19:\"2019-08-13 12:25:03\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:7;s:11:\"category_id\";i:4;s:5:\"price\";s:4:\"2299\";s:5:\"photo\";s:29:\"5d52ac1fdef01_bicycle_02.webp\";s:5:\"title\";s:17:\"Priority Bicycles\";s:11:\"description\";s:134:\"BACK IN STOCK with limited quantities remaining! Use code \"velofix600\" for free Velofix white glove delivery where available, or free.\";s:10:\"created_at\";s:19:\"2019-08-13 12:01:22\";s:10:\"updated_at\";s:19:\"2019-08-13 12:25:03\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}i:8;a:3:{s:3:\"qty\";i:1;s:5:\"price\";i:11299;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:5:{i:0;s:11:\"category_id\";i:1;s:5:\"price\";i:2;s:5:\"photo\";i:3;s:5:\"title\";i:4;s:11:\"description\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:8;s:11:\"category_id\";i:3;s:5:\"price\";s:5:\"11299\";s:5:\"photo\";s:31:\"5d52a7873b6ba_motocycle_02.webp\";s:5:\"title\";s:8:\"Roadster\";s:11:\"description\";s:136:\"The 2019 Roadster is a street-eating machine packed with adrenaline. You get the Evolution engine with 1200cc of corner cranking torque.\";s:10:\"created_at\";s:19:\"2019-08-13 12:05:27\";s:10:\"updated_at\";s:19:\"2019-08-13 12:05:27\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:8;s:11:\"category_id\";i:3;s:5:\"price\";s:5:\"11299\";s:5:\"photo\";s:31:\"5d52a7873b6ba_motocycle_02.webp\";s:5:\"title\";s:8:\"Roadster\";s:11:\"description\";s:136:\"The 2019 Roadster is a street-eating machine packed with adrenaline. You get the Evolution engine with 1200cc of corner cranking torque.\";s:10:\"created_at\";s:19:\"2019-08-13 12:05:27\";s:10:\"updated_at\";s:19:\"2019-08-13 12:05:27\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:7;s:10:\"totalPrice\";i:16067;}', 'Aung Khant', 'Shwe Pyi Thar', 'John', '56765434', 2, 2019, 565, 0, 0),
(5, '2019-08-16 08:40:19', '2019-08-16 08:41:16', 1, 'O:8:\"App\\Cart\":3:{s:5:\"items\";a:2:{i:1;a:3:{s:3:\"qty\";i:2;s:5:\"price\";i:100;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:5:{i:0;s:11:\"category_id\";i:1;s:5:\"price\";i:2;s:5:\"photo\";i:3;s:5:\"title\";i:4;s:11:\"description\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:1;s:11:\"category_id\";i:1;s:5:\"price\";s:2:\"50\";s:5:\"photo\";s:35:\"5d52a24febd0e_programming_core .jpg\";s:5:\"title\";s:19:\"Programming ASP.NET\";s:11:\"description\";s:366:\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\";s:10:\"created_at\";s:19:\"2019-08-13 11:43:11\";s:10:\"updated_at\";s:19:\"2019-08-13 11:43:11\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:1;s:11:\"category_id\";i:1;s:5:\"price\";s:2:\"50\";s:5:\"photo\";s:35:\"5d52a24febd0e_programming_core .jpg\";s:5:\"title\";s:19:\"Programming ASP.NET\";s:11:\"description\";s:366:\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\";s:10:\"created_at\";s:19:\"2019-08-13 11:43:11\";s:10:\"updated_at\";s:19:\"2019-08-13 11:43:11\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}i:3;a:3:{s:3:\"qty\";i:4;s:5:\"price\";i:20000;s:4:\"item\";O:11:\"App\\Product\":26:{s:11:\"\0*\0fillable\";a:5:{i:0;s:11:\"category_id\";i:1;s:5:\"price\";i:2;s:5:\"photo\";i:3;s:5:\"title\";i:4;s:11:\"description\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:3;s:11:\"category_id\";i:3;s:5:\"price\";s:4:\"5000\";s:5:\"photo\";s:31:\"5d52abccc8cf5_motocycle_01.webp\";s:5:\"title\";s:19:\"Iron 883 Motorcycle\";s:11:\"description\";s:188:\"The 2019 Harley-Davidson Iron 883 is an original icon of the Harley-Davidson Dark Custom style. Aggressive throwback styling taken to a place altogether new. No need to shine this machine.\";s:10:\"created_at\";s:19:\"2019-08-13 11:52:17\";s:10:\"updated_at\";s:19:\"2019-08-13 12:23:40\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:3;s:11:\"category_id\";i:3;s:5:\"price\";s:4:\"5000\";s:5:\"photo\";s:31:\"5d52abccc8cf5_motocycle_01.webp\";s:5:\"title\";s:19:\"Iron 883 Motorcycle\";s:11:\"description\";s:188:\"The 2019 Harley-Davidson Iron 883 is an original icon of the Harley-Davidson Dark Custom style. Aggressive throwback styling taken to a place altogether new. No need to shine this machine.\";s:10:\"created_at\";s:19:\"2019-08-13 11:52:17\";s:10:\"updated_at\";s:19:\"2019-08-13 12:23:40\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:6;s:10:\"totalPrice\";i:20100;}', 'Aung Khant', 'Shwe Pyi Thar', 'John', '456765456', 3, 2019, 454, 1, 0);

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `price`, `photo`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, '50', '5d5fd88337c69_programming_core .jpg', 'Programming ASP.NET', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2019-08-13 05:13:11', '2019-08-23 12:13:55'),
(2, 2, '30', '5d5fd88d3ecb2_babygirlclothes.jpeg', 'Baby Girl Clothes', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', '2019-08-13 05:14:48', '2019-08-23 12:14:05'),
(3, 3, '5000', '5d5fd8a6d091e_motocycle_01.webp', 'Iron 883 Motorcycle', 'The 2019 Harley-Davidson Iron 883 is an original icon of the Harley-Davidson Dark Custom style. Aggressive throwback styling taken to a place altogether new. No need to shine this machine.', '2019-08-13 05:22:17', '2019-08-23 12:14:30'),
(4, 4, '3000', '5d5fd8c1001f4_bicycle_01.jpg', 'MTB Bicycle 21', 'Cosmic And Peachbag Proudly Present The Unique High Performance And Stylish 27.5 Inch Trium Mtb Bikes With 21 Speed.', '2019-08-13 05:25:51', '2019-08-23 12:14:57'),
(5, 1, '50', '5d5fd8cd93719_python.jpg', 'Python Book', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.', '2019-08-13 05:28:17', '2019-08-23 12:15:09'),
(6, 2, '60', '5d5fd8dd11672_girlclothes.jpg', 'Girl Clothes', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC.', '2019-08-13 05:29:20', '2019-08-23 12:15:25'),
(7, 4, '2299', '5d5fd8eb6fd7a_bicycle_02.webp', 'Priority Bicycles', 'BACK IN STOCK with limited quantities remaining! Use code \"velofix600\" for free Velofix white glove delivery where available, or free.', '2019-08-13 05:31:22', '2019-08-23 12:15:39'),
(8, 3, '11299', '5d5fd8fb5401b_motocycle_02.webp', 'Roadster', 'The 2019 Roadster is a street-eating machine packed with adrenaline. You get the Evolution engine with 1200cc of corner cranking torque.', '2019-08-13 05:35:27', '2019-08-23 12:15:55'),
(9, 1, '100', '5d5fd90c5aa1c_mind_programmin.jpg', 'Mind Programming', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.', '2019-08-14 13:48:53', '2019-08-23 12:16:12'),
(10, 1, '70', '5d5fd91aaa0df_flash_cards.jpg', 'PYTHON FLASH CARDS', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', '2019-08-14 14:15:37', '2019-08-23 12:16:26'),
(11, 1, '40', '5d5fd9378434c_nodejs.jpg', 'Node.js', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.', '2019-08-15 10:47:42', '2019-08-23 12:16:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'aung khant', 'aung@gmail.com', NULL, '$2y$10$VA93oLyJhtbPQrSjpUlac.nARuiPXycx/l.h.4TUNhnz70id8VCgG', NULL, '2019-07-05 01:09:53', '2019-07-05 01:09:53'),
(2, 'Nay Win', 'nay@gmail.com', NULL, '$2y$10$H97GPbfwgfGBo4uVFIZjbuoSLaaJjdc8L4nvvQUIDWAaMCKMEcy3y', NULL, '2019-08-13 05:46:51', '2019-08-13 05:46:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backends`
--
ALTER TABLE `backends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `backends_email_unique` (`email`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `backends`
--
ALTER TABLE `backends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
