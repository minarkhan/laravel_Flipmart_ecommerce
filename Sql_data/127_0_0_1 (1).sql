-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2020 at 10:23 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_shop`
--
CREATE DATABASE IF NOT EXISTS `online_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `online_shop`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Bria Wunsch', 'admin@admin.com', NULL, '$2y$10$sRbHVeyDRI8KqQlCNjIrfeyYtnu.v1Uu26svYwNUZpMVFc/gJeX4e', 'aOwNVdqOi7TJVjBaAtJlFv0WCDHFV3BH4DmDqPQzulVg8b6feKpT0TcgvvBP', '2020-12-07 12:12:01', '2020-12-07 12:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frontend_type` enum('select','radio','text','text_area') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_filterable` tinyint(1) NOT NULL DEFAULT 0,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `code`, `name`, `frontend_type`, `is_filterable`, `is_required`, `created_at`, `updated_at`) VALUES
(1, 'size', 'Size', 'select', 1, 1, '2020-12-07 12:12:02', '2020-12-07 12:12:02'),
(2, 'color', 'Color', 'select', 1, 1, '2020-12-07 12:12:02', '2020-12-07 12:12:02');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `value`, `price`, `created_at`, `updated_at`) VALUES
(1, 2, 'red', '9.00', '2020-12-07 12:15:46', '2020-12-07 12:15:46');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'Bata', 'bata', 'brands/GVwnpnQuCbIYcY8lHtHgUhNbs.png', '2020-12-07 12:15:29', '2020-12-07 12:15:29'),
(2, 'Easy', 'easy', NULL, '2020-12-07 22:49:46', '2020-12-07 22:49:46'),
(3, 'HP', 'hp', NULL, '2020-12-07 22:49:57', '2020-12-07 22:49:57'),
(4, 'Clear', 'clear', NULL, '2020-12-07 22:50:07', '2020-12-07 22:50:07'),
(5, 'RFL', 'rfl', NULL, '2020-12-07 22:50:19', '2020-12-07 22:50:19'),
(6, 'Local', 'local', NULL, '2020-12-07 22:50:44', '2020-12-07 22:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT 1,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `menu` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `parent_id`, `featured`, `menu`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Root', 'root', 'This is the root category, don\'t delete this one', NULL, 0, 0, NULL, '2020-12-07 12:12:01', '2020-12-07 12:12:01'),
(11, 'Clothing', 'clothing', 'About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility.', 1, 1, 1, NULL, '2020-12-07 12:12:01', '2020-12-07 16:00:04'),
(12, 'Man', 'man', NULL, 11, 1, 1, 'categories/QCIsjl0oOEwZiaTr9iGPTUw0O.jpg', '2020-12-07 15:40:08', '2020-12-07 15:40:08'),
(13, 'Shoes', 'shoes', NULL, 12, 1, 1, NULL, '2020-12-07 15:40:37', '2020-12-07 15:40:46'),
(14, 'Sunglasses', 'sunglasses', NULL, 11, 1, 1, NULL, '2020-12-07 16:00:35', '2020-12-07 22:15:07'),
(15, 'Sport', 'sport', NULL, 11, 1, 1, NULL, '2020-12-07 16:00:48', '2020-12-07 22:15:55'),
(16, 'Wear Blazers', 'wear-blazers', NULL, 11, 1, 1, NULL, '2020-12-07 16:01:00', '2020-12-07 22:16:10'),
(18, 'T-shirt', 't-shirt', NULL, 11, 1, 1, NULL, '2020-12-07 16:00:48', '2020-12-07 22:13:35'),
(19, 'Winter Blazers', 'winter-blazers', NULL, 11, 1, 1, NULL, '2020-12-07 16:01:00', '2020-12-07 22:53:37'),
(20, 'watch', 'watch', NULL, 11, 1, 1, 'categories/Q3AE7CaQbW42rsTnLaYIScCH2.jpg', '2020-12-07 16:00:35', '2020-12-07 22:15:43'),
(21, 'woman', 'woman', NULL, 11, 1, 1, NULL, '2020-12-07 22:53:16', '2020-12-07 22:53:16'),
(22, 'Electronics', 'electronics', 'dafasd', 1, 1, 1, NULL, '2020-12-08 20:38:45', '2020-12-08 20:39:53');

-- --------------------------------------------------------

--
-- Table structure for table `homes`
--

CREATE TABLE `homes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_13_144617_create_admins_table', 1),
(4, '2019_08_14_124941_create_settings_table', 1),
(5, '2019_08_17_062138_create_categories_table', 1),
(6, '2019_09_25_150201_create_attributes_table', 1),
(7, '2019_09_25_150525_create_attribute_values_table', 1),
(8, '2019_10_03_074636_create_brands_table', 1),
(9, '2019_10_12_045505_create_products_table', 1),
(10, '2019_10_12_045901_create_product_images_table', 1),
(11, '2019_10_12_052914_create_product_attributes_table', 1),
(12, '2019_10_12_053859_create_attribute_value_product_attribute_table', 1),
(13, '2019_10_12_054326_create_product_categories_table', 1),
(14, '2019_10_16_151743_drop_attribute_value_product_attribute_table', 1),
(15, '2019_10_16_152051_alter_product_attributes_table', 1),
(16, '2019_11_27_122203_create_orders_table', 1),
(17, '2019_11_27_145048_create_order_items_table', 1),
(18, '2020_12_09_001952_create_homes_table', 2),
(19, '2020_12_09_114857_create_slide_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','processing','completed','decline') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `grand_total` decimal(20,6) NOT NULL,
  `item_count` int(10) UNSIGNED NOT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT 1,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `status`, `grand_total`, `item_count`, `payment_status`, `payment_method`, `first_name`, `last_name`, `address`, `city`, `country`, `post_code`, `phone_number`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'ORD-5FCE72545B4EF', 1, 'pending', '1000.000000', 2, 0, NULL, 'Moaref', 'Billah', 'Ramdi, Ward no- 6, Bhuiyanhat, Kabirhat, Noakhali', 'Noakhali', 'Bangladesh', '3807', '01856230550', NULL, '2020-12-07 12:20:04', '2020-12-07 12:20:04'),
(2, 'ORD-5FCE72E364FAD', 1, 'pending', '2500.000000', 5, 0, NULL, 'Moaref', 'Billah', 'Ramdi, Ward no- 6, Bhuiyanhat, Kabirhat, Noakhali', 'Noakhali', 'Bangladesh', '3807', '01856230550', NULL, '2020-12-07 12:22:27', '2020-12-07 12:22:27'),
(3, 'ORD-5FCE91CC6918C', 1, 'pending', '1000.000000', 2, 0, NULL, 'Moaref', 'Billah', 'Ramdi, Ward no- 6, Bhuiyanhat, Kabirhat, Noakhali', 'Noakhali', 'Bangladesh', '3807', '01856230550', NULL, '2020-12-07 14:34:20', '2020-12-07 14:34:20'),
(4, 'ORD-5FCE9BFF98209', 1, 'pending', '1000.000000', 2, 0, NULL, 'Moaref', 'Billah', 'Ramdi, Ward no- 6, Bhuiyanhat, Kabirhat, Noakhali', 'Noakhali', 'Bangladesh', '3807', '01856230550', NULL, '2020-12-07 15:17:51', '2020-12-07 15:17:51'),
(5, 'ORD-5FCE9C8B2F23F', 1, 'pending', '1000.000000', 2, 0, NULL, 'WeShare', 'Billah', '123 Street', 'Phnom Penh', 'Cambodia', '12252', '010313234', NULL, '2020-12-07 15:20:11', '2020-12-07 15:20:11'),
(6, 'ORD-5FCF231A757F7', 1, 'pending', '5400.000000', 6, 0, NULL, 'Moaref', 'Billah', 'Ramdi, Ward no- 6, Bhuiyanhat, Kabirhat, Noakhali', 'Noakhali', 'Bangladesh', '3807', '01856230550', NULL, '2020-12-08 00:54:18', '2020-12-08 00:54:18'),
(7, 'ORD-5FCFE7A21200A', 1, 'pending', '15000.000000', 3, 0, NULL, 'Moaref', 'Billah', 'Ramdi, Ward no- 6, Bhuiyanhat, Kabirhat, Noakhali', 'Noakhali', 'Bangladesh', '3807', '01856230550', NULL, '2020-12-08 14:52:50', '2020-12-08 14:52:50'),
(8, 'ORD-5FCFF2B8DDCB6', 1, 'pending', '99.000000', 1, 0, NULL, 'Moaref', 'Billah', 'Ramdi, Ward no- 6, Bhuiyanhat, Kabirhat, Noakhali', 'Noakhali', 'Bangladesh', '3807', '01856230550', NULL, '2020-12-08 15:40:08', '2020-12-08 15:40:08'),
(9, 'ORD-5FCFF3D43FDE6', 1, 'pending', '99.000000', 1, 0, NULL, 'Moaref', 'Billah', 'Ramdi, Ward no- 6, Bhuiyanhat, Kabirhat, Noakhali', 'Noakhali', 'Bangladesh', '3807', '01856230550', NULL, '2020-12-08 15:44:52', '2020-12-08 15:44:52'),
(10, 'ORD-5FCFF44961194', 1, 'pending', '99.000000', 1, 0, NULL, 'Moaref', 'Billah', 'Ramdi, Ward no- 6, Bhuiyanhat, Kabirhat, Noakhali', 'Noakhali', 'Bangladesh', '3807', '01856230550', NULL, '2020-12-08 15:46:49', '2020-12-08 15:46:49'),
(11, 'ORD-5FCFF4680BE52', 1, 'pending', '99.000000', 1, 0, NULL, 'Moaref', 'Billah', 'Ramdi, Ward no- 6, Bhuiyanhat, Kabirhat, Noakhali', 'Noakhali', 'Bangladesh', '3807', '01856230550', NULL, '2020-12-08 15:47:20', '2020-12-08 15:47:20'),
(12, 'ORD-5FCFF4A2ACA25', 1, 'pending', '500.000000', 1, 0, NULL, 'Moaref', 'Billah', 'Ramdi, Ward no- 6, Bhuiyanhat, Kabirhat, Noakhali', 'Noakhali', 'Bangladesh', '3807', '01856230550', NULL, '2020-12-08 15:48:18', '2020-12-08 15:48:18');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `price` decimal(20,6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, '1000.000000', '2020-12-07 12:20:04', '2020-12-07 12:20:04'),
(2, 2, 1, 5, '2500.000000', '2020-12-07 12:22:27', '2020-12-07 12:22:27'),
(3, 3, 1, 2, '1000.000000', '2020-12-07 14:34:20', '2020-12-07 14:34:20'),
(4, 4, 1, 2, '1000.000000', '2020-12-07 15:17:51', '2020-12-07 15:17:51'),
(5, 5, 1, 2, '1000.000000', '2020-12-07 15:20:11', '2020-12-07 15:20:11'),
(6, 6, 12, 1, '900.000000', '2020-12-08 00:54:18', '2020-12-08 00:54:18'),
(7, 6, 12, 1, '900.000000', '2020-12-08 00:54:18', '2020-12-08 00:54:18'),
(8, 6, 12, 4, '3600.000000', '2020-12-08 00:54:18', '2020-12-08 00:54:18'),
(9, 7, 8, 3, '15000.000000', '2020-12-08 14:52:50', '2020-12-08 14:52:50'),
(10, 8, 6, 1, '99.000000', '2020-12-08 15:40:08', '2020-12-08 15:40:08'),
(11, 9, 6, 1, '99.000000', '2020-12-08 15:44:52', '2020-12-08 15:44:52'),
(12, 10, 6, 1, '99.000000', '2020-12-08 15:46:49', '2020-12-08 15:46:49'),
(13, 11, 6, 1, '99.000000', '2020-12-08 15:47:20', '2020-12-08 15:47:20'),
(14, 12, 1, 1, '500.000000', '2020-12-08 15:48:18', '2020-12-08 15:48:18');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `weight` decimal(8,2) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `sku`, `name`, `slug`, `description`, `quantity`, `weight`, `price`, `sale_price`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 1, 'bata-5', 'Mes Shoes', 'mes-shoes', 'About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility.\r\nAbout Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility.\r\nAbout Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility.', 5, '64.00', '500.00', NULL, 1, 0, '2020-12-07 12:16:42', '2020-12-08 15:48:18'),
(5, 1, 'sadf', 'WeShare', 'weshare', NULL, 12, '5.00', '500.00', NULL, 1, 1, '2020-12-07 15:45:22', '2020-12-07 15:45:22'),
(6, 1, 'lotto-20', 'WeShare Billah', 'weshare-billah', NULL, 7, NULL, '99.00', NULL, 1, 0, '2020-12-07 16:09:29', '2020-12-08 15:47:20'),
(7, 1, 'lotto-45', 'Woman Crystal sandale', 'woman-crystal-sandale', NULL, 11, NULL, '1000.00', NULL, 1, 0, '2020-12-07 22:43:22', '2020-12-07 22:43:22'),
(8, 1, '8965', 'Men shoes', 'men-shoes', 'About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility. About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility. About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility.', 7, NULL, '5000.00', NULL, 1, 1, '2020-12-07 22:47:06', '2020-12-08 14:52:50'),
(10, 6, '4569', 'Shirt', 'shirt', 'About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility. About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility. About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility.', 20, NULL, '5000.00', NULL, 1, 0, '2020-12-07 22:51:29', '2020-12-07 22:51:29'),
(11, 2, '12389', 'Ladis jacket', 'ladis-jacket', 'About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility. About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility. About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility.', 26, NULL, '1000.00', NULL, 1, 1, '2020-12-07 22:52:49', '2020-12-07 22:52:49'),
(12, 6, '963', 'blazer', 'blazer', 'About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility. About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility. About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility.', 6, NULL, '1000.00', '900.00', 1, 0, '2020-12-07 22:55:55', '2020-12-08 00:54:18');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `attribute_id`, `value`, `quantity`, `price`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'red', 10, '900.00', 1, '2020-12-07 12:17:47', '2020-12-07 12:17:47');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `category_id`, `product_id`) VALUES
(1, 11, 1),
(2, 13, 5),
(3, 15, 6),
(4, 11, 7),
(5, 11, 8),
(6, 12, 8),
(7, 12, 10),
(8, 11, 11),
(9, 12, 12),
(10, 16, 12),
(11, 19, 12),
(12, 21, 12);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `full` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `full`, `created_at`, `updated_at`) VALUES
(1, 1, 'products/6JZ75FWspLMC8kS6WBSwA7RjM.jpg', '2020-12-07 12:17:23', '2020-12-07 12:17:23'),
(2, 1, 'products/NflDvYXi8BmV01ivkTMVteQOG.jpg', '2020-12-07 12:17:24', '2020-12-07 12:17:24'),
(3, 1, 'products/IHt152m7eHzSqUCCcvE8el0NW.jpg', '2020-12-07 12:17:26', '2020-12-07 12:17:26'),
(4, 5, 'products/DjHqjG4ZjuCecclJ18NdNHAiO.jpg', '2020-12-07 16:38:16', '2020-12-07 16:38:16'),
(5, 5, 'products/HMFPo6CaE3xpD2Mg4OVzGy0oU.jpg', '2020-12-07 16:38:16', '2020-12-07 16:38:16'),
(6, 5, 'products/8MPeLcCJevtINoYwcpP5yAssL.jpg', '2020-12-07 16:38:20', '2020-12-07 16:38:20'),
(8, 7, 'products/udtIP5oJKwsCkDrkCeAamsHK1.jpg', '2020-12-07 22:44:53', '2020-12-07 22:44:53'),
(9, 8, 'products/Is2aZC1vXoXLqHTS9nWHKfc0C.jpg', '2020-12-07 22:47:24', '2020-12-07 22:47:24'),
(11, 10, 'products/ba4Igh1ESp1KE9In82wyMTd12.jpg', '2020-12-07 22:52:10', '2020-12-07 22:52:10'),
(12, 12, 'products/IBqgML7vSpkEuXXQqc4dusGhO.jpg', '2020-12-07 22:56:40', '2020-12-07 22:56:40'),
(13, 12, 'products/a46ea0EjAHtoARh8AE9nYJT8L.jpg', '2020-12-07 22:56:40', '2020-12-07 22:56:40'),
(14, 12, 'products/3K7u4amne1gQVuBoE9yhjF9Nl.jpg', '2020-12-07 22:56:44', '2020-12-07 22:56:44');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'E-Commerce Application', '2020-12-07 12:12:01', '2020-12-07 12:12:01'),
(2, 'site_title', 'E-Commerce', '2020-12-07 12:12:01', '2020-12-07 12:12:01'),
(3, 'default_email_address', 'admin@admin.com', '2020-12-07 12:12:01', '2020-12-07 12:12:01'),
(4, 'currency_code', 'GBP', '2020-12-07 12:12:01', '2020-12-07 12:12:01'),
(5, 'currency_symbol', '$', '2020-12-07 12:12:01', '2020-12-08 15:34:35'),
(6, 'site_logo', 'img/rT31TqoRUXIni6Q7sINV9rYcL.jpg', '2020-12-07 12:12:01', '2020-12-08 15:36:04'),
(7, 'site_favicon', 'img/3ZQPcpCAo9kI9QTDMoxiI5GIm.jpg', '2020-12-07 12:12:01', '2020-12-08 15:36:40'),
(8, 'footer_copyright_text', 'All right reserve minarkhan.com', '2020-12-07 12:12:01', '2020-12-08 15:37:41'),
(9, 'seo_meta_title', 'All right reserve minarkhan.com', '2020-12-07 12:12:01', '2020-12-08 15:37:41'),
(10, 'seo_meta_description', 'All right reserve minarkhan.comAll right reserve minarkhan.com', '2020-12-07 12:12:01', '2020-12-08 15:37:41'),
(11, 'social_facebook', 'https://www.facebook.com/minar1995', '2020-12-07 12:12:01', '2020-12-08 15:38:51'),
(12, 'social_twitter', 'twitter', '2020-12-07 12:12:02', '2020-12-08 15:38:51'),
(13, 'social_instagram', 'insttragram', '2020-12-07 12:12:02', '2020-12-08 15:38:51'),
(14, 'social_linkedin', 'linkdin', '2020-12-07 12:12:02', '2020-12-08 15:38:51'),
(15, 'google_analytics', '', '2020-12-07 12:12:02', '2020-12-07 12:12:02'),
(16, 'facebook_pixels', '', '2020-12-07 12:12:02', '2020-12-07 12:12:02'),
(17, 'stripe_payment_method', '1', '2020-12-07 12:12:02', '2020-12-08 15:39:38'),
(18, 'stripe_key', NULL, '2020-12-07 12:12:02', '2020-12-08 15:39:38'),
(19, 'stripe_secret_key', NULL, '2020-12-07 12:12:02', '2020-12-08 15:39:38'),
(20, 'paypal_payment_method', '1', '2020-12-07 12:12:02', '2020-12-08 15:39:38'),
(21, 'paypal_client_id', NULL, '2020-12-07 12:12:02', '2020-12-08 15:39:38'),
(22, 'paypal_secret_id', NULL, '2020-12-07 12:12:02', '2020-12-08 15:39:38');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'description',
  `button_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `title`, `sub_title`, `description`, `button_text`, `button_link`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Web page template', 'Our Humble Beginnings', 'description', NULL, NULL, 'C:\\xampp\\tmp\\phpC8B8.tmp', '2020-12-10 02:26:01', '2020-12-10 02:26:01'),
(2, 'Web page template', 'Our Humble Beginnings', 'description', NULL, NULL, 'C:\\xampp\\tmp\\php2541.tmp', '2020-12-10 02:26:25', '2020-12-10 02:26:25'),
(3, 'Better colouring and header image', 'Our Humble Beginnings', 'dsafasdfasf', 'sdfasdf', 'adsfasdf', 'C:\\xampp\\tmp\\phpF4DC.tmp', '2020-12-10 02:29:29', '2020-12-10 02:29:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `address`, `city`, `country`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Moaref', 'Billah', 'minar@gmail.com', NULL, '$2y$10$wmAo/Lzou5kFfGyLwYhtue0TS1ATKqBtzuvwzh6UKX4LF9EuNMava', 'Ramdi, Ward no- 6, Bhuiyanhat, Kabirhat, Noakhali', 'Noakhali', 'United Kingdom', 'ePXjTZf7ZZEzgUpseiBUKa5heWCPDeuJlgt4mnw4VSDt5czBAa7I6ACnOUdO', '2020-12-07 12:12:47', '2020-12-07 12:12:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attributes_code_unique` (`code`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `homes`
--
ALTER TABLE `homes`
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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_index` (`order_id`),
  ADD KEY `order_items_product_id_index` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_index` (`brand_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attributes_product_id_foreign` (`product_id`),
  ADD KEY `product_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_categories_category_id_index` (`category_id`),
  ADD KEY `product_categories_product_id_index` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_index` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `homes`
--
ALTER TABLE `homes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
