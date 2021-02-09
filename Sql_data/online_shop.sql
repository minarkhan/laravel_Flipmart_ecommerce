-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2021 at 10:42 AM
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
(1, 'Bria Wunsch', 'admin@admin.com', NULL, '$2y$10$sRbHVeyDRI8KqQlCNjIrfeyYtnu.v1Uu26svYwNUZpMVFc/gJeX4e', 'GhUIfdF9s16H7r9mPHdz5rOxIPIz3slMebJ0HnTZELU6W4IlMDwQutBVKODV', '2020-12-07 12:12:01', '2020-12-07 12:12:01');

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
(1, 'Batapp', 'batapp', 'brands/GVwnpnQuCbIYcY8lHtHgUhNbs.png', '2020-12-07 12:15:29', '2021-01-03 01:58:14'),
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
(16, 'Wear Blazers', 'wear-blazers', 'fgdsafsadfasd', 11, 1, 1, NULL, '2020-12-07 16:01:00', '2021-01-03 01:56:16'),
(18, 'T-shirt', 't-shirt', NULL, 11, 1, 1, NULL, '2020-12-07 16:00:48', '2020-12-07 22:13:35'),
(19, 'Winter Blazers', 'winter-blazers', NULL, 11, 1, 1, NULL, '2020-12-07 16:01:00', '2020-12-07 22:53:37'),
(20, 'watch', 'watch', NULL, 11, 1, 1, 'categories/Q3AE7CaQbW42rsTnLaYIScCH2.jpg', '2020-12-07 16:00:35', '2020-12-07 22:15:43'),
(21, 'woman', 'woman', NULL, 11, 1, 1, NULL, '2020-12-07 22:53:16', '2020-12-07 22:53:16'),
(22, 'Electronics', 'electronics', 'dafasd', 1, 1, 1, NULL, '2020-12-08 20:38:45', '2020-12-08 20:39:53'),
(23, 'health & beauty', 'health-beauty', 'health & beauty', 1, 1, 1, 'categories/DgXNKWchFiz4CiK2tH8flaSq6.jpg', '2021-02-08 22:28:38', '2021-02-08 22:28:38'),
(24, 'soap', 'soap', 'soap', 23, 1, 1, 'categories/bQ7yVeieRmDAAv7uXQBeS7K3k.jpg', '2021-02-08 22:29:25', '2021-02-08 22:29:25'),
(25, 'lipsick', 'lipsick', 'lipsick', 23, 1, 1, 'categories/XV7QieDRvM7anDfyyePPUtwwi.jpg', '2021-02-08 22:29:56', '2021-02-08 22:29:56'),
(26, 'Headphone', 'headphone', 'PCMag\r\nThe Best Headphones for 2021\r\nPCMag\r\nThe Best Headphones for 2021', 22, 1, 1, 'categories/P0ayKiA81f80TOEBW9wqboxVX.jpg', '2021-02-08 22:58:48', '2021-02-08 22:58:48'),
(104, 'Rosemarie Christiansen PhD', 'rosemarie-christiansen-phd', 'Alice\'s, and they can\'t prove I did: there\'s no room at all like the look of the sort!\' said.', 1, 0, 1, '105.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(105, 'Dr. Shad Gutmann', 'dr-shad-gutmann', 'Bill, I fancy--Who\'s to go and get ready for your walk!\" \"Coming in a game of play with a.', 1, 0, 1, '110.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(106, 'Prof. Violet Rempel', 'prof-violet-rempel', 'I wish you could only hear whispers now and then, if I might venture to go and get ready for your.', 1, 0, 1, '105.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(107, 'Burdette Roob', 'burdette-roob', 'Alice. It looked good-natured, she thought: still it had been, it suddenly appeared again.', 1, 0, 1, '105.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(108, 'Allie Rogahn', 'allie-rogahn', 'Alice! Come here directly, and get ready for your walk!\" \"Coming in a game of play with a sigh.', 1, 0, 1, '101.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(109, 'Delmer Kuvalis', 'delmer-kuvalis', 'Dinah!\' she said aloud. \'I must be collected at once to eat some of YOUR adventures.\' \'I could.', 1, 0, 1, '110.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(110, 'Mr. Brice Beier Sr.', 'mr-brice-beier-sr', 'However, this bottle was NOT marked \'poison,\' it is I hate cats and dogs.\' It was the Duchess\'s.', 1, 0, 1, '103.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(111, 'Dr. Berniece Lockman', 'dr-berniece-lockman', 'London is the same age as herself, to see the Hatter were having tea at it: a Dormouse was sitting.', 1, 0, 1, '105.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(112, 'Mr. Adolfo Gutmann', 'mr-adolfo-gutmann', 'King, \'and don\'t look at all a pity. I said \"What for?\"\' \'She boxed the Queen\'s shrill cries to.', 1, 0, 1, '108.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(113, 'Berniece Krajcik', 'berniece-krajcik', 'Alice had no very clear notion how long ago anything had happened.) So she began: \'O Mouse, do you.', 1, 0, 1, '110.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(114, 'Bethany Quigley DVM', 'bethany-quigley-dvm', 'King. Here one of the trees had a head could be NO mistake about it: it was labelled \'ORANGE.', 22, 0, 1, '104.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(115, 'Imogene Denesik', 'imogene-denesik', 'Alice, \'when one wasn\'t always growing larger and smaller, and being ordered about by mice and.', 1, 0, 1, '106.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(116, 'Jarod Hodkiewicz DDS', 'jarod-hodkiewicz-dds', 'Alice. \'That\'s the judge,\' she said to the executioner: \'fetch her here.\' And the moral of that.', 23, 0, 1, '101.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(117, 'Brandt Prosacco', 'brandt-prosacco', 'She soon got it out again, and did not answer, so Alice ventured to say. \'What is his sorrow?\' she.', 1, 0, 1, '108.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(118, 'Ms. Antonette Gerhold', 'ms-antonette-gerhold', 'Alice\'s elbow was pressed so closely against her foot, that there was nothing on it in with a.', 155, 0, 1, '101.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(119, 'Anabel Walter', 'anabel-walter', 'I wonder what they WILL do next! As for pulling me out of a large arm-chair at one end to the.', 1, 0, 1, '103.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(120, 'Estel Barrows', 'estel-barrows', 'I don\'t take this young lady tells us a story.\' \'I\'m afraid I\'ve offended it again!\' For the Mouse.', 1, 0, 1, '104.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(121, 'Cristian Emmerich', 'cristian-emmerich', 'Gryphon; and then said \'The fourth.\' \'Two days wrong!\' sighed the Lory, who at last it sat for a.', 155, 0, 1, '103.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(122, 'Cloyd Heathcote DDS', 'cloyd-heathcote-dds', 'Alice, \'but I must have been a RED rose-tree, and we put a white one in by mistake; and if the.', 22, 0, 1, '109.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(123, 'Daniella Dach MD', 'daniella-dach-md', 'The Queen\'s argument was, that she might as well look and see what the name of nearly everything.', 1, 0, 1, '101.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(124, 'Prof. Edyth Lakin', 'prof-edyth-lakin', 'Queen, the royal children; there were ten of them, with her head!\' about once in the trial done,\'.', 23, 0, 1, '102.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(125, 'Prof. Emmanuelle Breitenberg V', 'prof-emmanuelle-breitenberg-v', 'SIT down,\' the King said gravely, \'and go on crying in this affair, He trusts to you never had to.', 1, 0, 1, '108.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(126, 'Mr. Lorenzo Gleason DDS', 'mr-lorenzo-gleason-dds', 'This time there could be beheaded, and that makes you forget to talk. I can\'t show it you myself,\'.', 155, 0, 1, '109.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(127, 'Beatrice Kilback', 'beatrice-kilback', 'The Dormouse had closed its eyes by this time?\' she said to the Knave of Hearts, and I shall have.', 155, 0, 1, '104.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(128, 'Daniella Crona', 'daniella-crona', 'Gryphon only answered \'Come on!\' and ran till she had but to get her head in the sea, though you.', 1, 0, 1, '105.jpg', '2021-02-09 01:32:50', '2021-02-09 01:32:50'),
(129, 'Grover Cruickshank IV', 'grover-cruickshank-iv', 'It was all dark overhead; before her was another puzzling question; and as for the moment she felt.', 1, 0, 1, '105.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(130, 'Lilyan Wiza', 'lilyan-wiza', 'I do hope it\'ll make me smaller, I can creep under the table: she opened the door that led into.', 1, 0, 1, '105.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(131, 'Jovany Parker', 'jovany-parker', 'YOU?\' Which brought them back again to the other ladder?--Why, I hadn\'t to bring tears into her.', 22, 0, 1, '104.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(132, 'Jacey Walker Jr.', 'jacey-walker-jr', 'Involved in this way! Stop this moment, and fetch me a pair of white kid gloves and a scroll of.', 1, 0, 1, '110.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(133, 'Wilfrid Hauck', 'wilfrid-hauck', 'Queen. \'Their heads are gone, if it thought that SOMEBODY ought to speak, and no one else seemed.', 23, 0, 1, '107.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(134, 'Earline Kub', 'earline-kub', 'Kings and Queens, and among them Alice recognised the White Rabbit read out, at the window.\' \'THAT.', 155, 0, 1, '108.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(135, 'Prof. Hettie Goyette II', 'prof-hettie-goyette-ii', 'Mock Turtle said with a sigh: \'he taught Laughing and Grief, they used to say anything. \'Why,\'.', 1, 0, 1, '110.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(136, 'Armand Kutch', 'armand-kutch', 'Trims his belt and his buttons, and turns out his toes.\' [later editions continued as follows The.', 1, 0, 1, '110.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(137, 'Arno Pouros', 'arno-pouros', 'Queen. \'Well, I can\'t remember,\' said the Hatter: \'as the things being alive; for instance.', 23, 0, 1, '104.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(138, 'Chelsea Douglas', 'chelsea-douglas', 'Dinah my dear! I shall be a comfort, one way--never to be Involved in this way! Stop this moment.', 1, 0, 1, '108.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(139, 'Wiley Bergnaum III', 'wiley-bergnaum-iii', 'Alice didn\'t think that proved it at all; and I\'m sure I can\'t remember,\' said the Gryphon: and it.', 1, 0, 1, '106.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(140, 'Hettie Hodkiewicz', 'hettie-hodkiewicz', 'He only does it matter to me whether you\'re nervous or not.\' \'I\'m a poor man, your Majesty,\' he.', 1, 0, 1, '107.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(141, 'Miss Adela Mills Jr.', 'miss-adela-mills-jr', 'ME,\' but nevertheless she uncorked it and put it to annoy, Because he knows it teases.\' CHORUS.', 155, 0, 1, '108.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(142, 'Maybell Gleichner', 'maybell-gleichner', 'I shall ever see you again, you dear old thing!\' said Alice, seriously, \'I\'ll have nothing more.', 1, 0, 1, '103.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(143, 'Mr. Jeromy Rodriguez I', 'mr-jeromy-rodriguez-i', 'Queen will hear you! You see, she came upon a neat little house, and found in it a very little!.', 1, 0, 1, '105.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(144, 'Herminia Moen', 'herminia-moen', 'March Hare. Visit either you like: they\'re both mad.\' \'But I don\'t like it, yer honour, at all, as.', 1, 0, 1, '107.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(145, 'Madaline Hayes', 'madaline-hayes', 'So she began: \'O Mouse, do you want to stay in here any longer!\' She waited for a moment like a.', 22, 0, 1, '107.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(146, 'Filiberto Ziemann', 'filiberto-ziemann', 'MINE,\' said the Caterpillar, just as usual. I wonder if I can go back and see that she looked back.', 155, 0, 1, '107.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(147, 'Jett Homenick I', 'jett-homenick-i', 'The Queen turned angrily away from her as she had not gone (We know it was only a child!\' The.', 1, 0, 1, '107.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(148, 'Dr. Jaycee Hegmann', 'dr-jaycee-hegmann', 'I must have been a holiday?\' \'Of course not,\' said Alice indignantly. \'Let me alone!\' \'Serpent, I.', 23, 0, 1, '104.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(149, 'Casey Schultz', 'casey-schultz', 'Queen furiously, throwing an inkstand at the bottom of the shepherd boy--and the sneeze of the.', 1, 0, 1, '105.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(150, 'Ola Deckow', 'ola-deckow', 'I suppose I ought to be managed? I suppose I ought to be sure! However, everything is to-day! And.', 1, 0, 1, '104.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(151, 'Prof. Hailee Moore Sr.', 'prof-hailee-moore-sr', 'However, it was growing, and growing, and very neatly and simply arranged; the only difficulty.', 155, 0, 1, '102.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(152, 'Dr. Elinor Cremin V', 'dr-elinor-cremin-v', 'Mouse had changed his mind, and was gone across to the Mock Turtle sighed deeply, and drew the.', 1, 0, 1, '103.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(153, 'Mr. Howard Shields DDS', 'mr-howard-shields-dds', 'I know all sorts of things, and she, oh! she knows such a puzzled expression that she never knew.', 1, 0, 1, '105.jpg', '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(155, 'Sports', 'sports', 'sports', 1, 1, 1, 'categories/NdvGkYjzv22ndJdaFnpVznOLw.jpg', '2021-02-09 03:01:36', '2021-02-09 03:01:36');

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
(19, '2020_12_09_114857_create_slide_table', 2),
(20, '2020_12_10_115333_create_shippings_table', 3);

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
(12, 'ORD-5FCFF4A2ACA25', 1, 'pending', '500.000000', 1, 0, NULL, 'Moaref', 'Billah', 'Ramdi, Ward no- 6, Bhuiyanhat, Kabirhat, Noakhali', 'Noakhali', 'Bangladesh', '3807', '01856230550', NULL, '2020-12-08 15:48:18', '2020-12-08 15:48:18'),
(13, 'ORD-5FD4478701A86', 1, 'pending', '2000.000000', 4, 0, NULL, 'Moaref', 'Billah', 'Ramdi, Ward no- 6, Bhuiyanhat, Kabirhat, Noakhali', 'Noakhali', 'Bangladesh', '3807', '01856230550', NULL, '2020-12-11 22:31:03', '2020-12-11 22:31:03'),
(14, 'ORD-5FE20D93E29FF', 1, 'pending', '15000.000000', 3, 0, NULL, 'Moaref', 'Billah', 'Ramdi, Ward no- 6, Bhuiyanhat, Kabirhat, Noakhali', 'Noakhali', 'Bangladesh', '3807', '01856230550', NULL, '2020-12-22 09:15:31', '2020-12-22 09:15:31');

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
(14, 12, 1, 1, '500.000000', '2020-12-08 15:48:18', '2020-12-08 15:48:18'),
(15, 13, 1, 4, '2000.000000', '2020-12-11 22:31:03', '2020-12-11 22:31:03'),
(16, 14, 8, 3, '15000.000000', '2020-12-22 09:15:31', '2020-12-22 09:15:31');

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
(1, 1, 'bata-5', 'Mes Shoes', 'mes-shoes', 'About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility.\r\nAbout Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility.\r\nAbout Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility.', 1, '64.00', '500.00', NULL, 1, 0, '2020-12-07 12:16:42', '2020-12-11 22:31:03'),
(5, 1, 'sadf', 'WeShare', 'weshare', NULL, 12, '5.00', '500.00', NULL, 1, 1, '2020-12-07 15:45:22', '2020-12-07 15:45:22'),
(6, 1, 'lotto-20', 'WeShare Billah', 'weshare-billah', NULL, 7, NULL, '99.00', NULL, 1, 0, '2020-12-07 16:09:29', '2020-12-08 15:47:20'),
(7, 1, 'lotto-45', 'Woman Crystal sandale', 'woman-crystal-sandale', NULL, 11, NULL, '1000.00', NULL, 1, 0, '2020-12-07 22:43:22', '2020-12-07 22:43:22'),
(8, 1, '8965', 'Men shoes', 'men-shoes', 'About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility. About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility. About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility.', 4, NULL, '5000.00', NULL, 1, 1, '2020-12-07 22:47:06', '2020-12-22 09:15:31'),
(10, 6, '4569', 'Shirt', 'shirt', 'About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility. About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility. About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility.', 20, NULL, '5000.00', NULL, 1, 0, '2020-12-07 22:51:29', '2020-12-07 22:51:29'),
(11, 2, '12389', 'Ladis jacket', 'ladis-jacket', 'About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility. About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility. About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility.', 26, NULL, '1000.00', NULL, 1, 1, '2020-12-07 22:52:49', '2020-12-07 22:52:49'),
(12, 6, '963', 'blazer', 'blazer', 'About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility. About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility. About Swapon\'s WorldSwapon\'s World is a trusted and reliable source for all your garment related needs from Bangladesh. Swapon\'s World manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility.', 6, NULL, '1000.00', '900.00', 1, 0, '2020-12-07 22:55:55', '2020-12-08 00:54:18'),
(13, 6, 'Cosmetics Matte Lipstick', 'Cosmetics Matte Lipstick', 'cosmetics-matte-lipstick', 'Cosmetics Matte LipstickCosmetics Matte LipstickCosmetics Matte LipstickCosmetics Matte LipstickCosmetics Matte LipstickCosmetics Matte LipstickCosmetics Matte LipstickCosmetics Matte LipstickCosmetics Matte LipstickCosmetics Matte LipstickCosmetics Matte LipstickCosmetics Matte LipstickCosmetics Matte Lipstick', 12, '64.00', '500.00', NULL, 1, 1, '2021-02-08 22:31:44', '2021-02-08 22:31:44'),
(14, 3, 'The Best Headphones for', 'The Best Headphones for 2021', 'the-best-headphones-for-2021', 'sda\r\nPCMag\r\nThe Best Headphones for 2021\r\nPCMag\r\nThe Best Headphones for 2021\r\nPCMag\r\nThe Best Headphones for 2021\r\nPCMag\r\nThe Best Headphones for 2021\r\nPCMag\r\nThe Best Headphones for 2021', 2, '64.00', '1000.00', NULL, 1, 1, '2021-02-08 22:59:33', '2021-02-08 22:59:33'),
(15, 6, 'Inglot HD Lip Tint.', 'Inglot HD Lip Tint.', 'inglot-hd-lip-tint', 'Inglot HD Lip Tint.Inglot HD Lip Tint.Inglot HD Lip Tint.Inglot HD Lip Tint.Inglot HD Lip Tint.Inglot HD Lip Tint.Inglot HD Lip Tint.Inglot HD Lip Tint.Inglot HD Lip Tint.Inglot HD Lip Tint.Inglot HD Lip Tint.Inglot HD Lip Tint.Inglot HD Lip Tint.Inglot HD Lip Tint.Inglot HD Lip Tint.Inglot HD Lip Tint.Inglot HD Lip Tint.', 12, '64.00', '500.00', NULL, 1, 1, '2021-02-08 23:23:20', '2021-02-08 23:23:20'),
(16, 6, 'Rimmel Moisture Renew Lipstick', 'Rimmel Moisture Renew Lipstick', 'rimmel-moisture-renew-lipstick', 'Rimmel Moisture Renew LipstickRimmel Moisture Renew LipstickRimmel Moisture Renew LipstickRimmel Moisture Renew LipstickRimmel Moisture Renew LipstickRimmel Moisture Renew LipstickRimmel Moisture Renew LipstickRimmel Moisture Renew LipstickRimmel Moisture Renew Lipstick', 12, '5.00', '5000.00', NULL, 1, 1, '2021-02-08 23:25:31', '2021-02-08 23:25:31'),
(17, 2, 'Lotus Herbals Pure Colors Lip Color', 'Lotus Herbals Pure Colors Lip Color', 'lotus-herbals-pure-colors-lip-color', 'Lotus Herbals Pure Colors Lip Color. ...Lotus Herbals Pure Colors Lip Color. ...Lotus Herbals Pure Colors Lip Color. ...Lotus Herbals Pure Colors Lip Color. ...Lotus Herbals Pure Colors Lip Color. ...Lotus Herbals Pure Colors Lip Color. ...Lotus Herbals Pure Colors Lip Color. ...Lotus Herbals Pure Colors Lip Color. ...', 24865, '54456.00', '78925.00', NULL, 1, 1, '2021-02-08 23:27:19', '2021-02-08 23:27:19'),
(18, 1, '5070', 'Davonte Mann', 'davonte-mann', 'Alice, \'a great girl like you,\' (she might well say that \"I see what this bottle was NOT marked.', 146, '167.00', '605.00', '466.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(19, 2, '5024', 'Morris Davis IV', 'morris-davis-iv', 'And she opened it, and found that, as nearly as large as himself, and this Alice thought to.', 155, '932.00', '381.00', '287.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(20, 3, '5384', 'Earline Bauch III', 'earline-bauch-iii', 'Queen to play croquet.\' Then they all crowded together at one corner of it: \'No room! No room!\'.', 128, '143.00', '163.00', '212.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(21, 1, '5268', 'Ima Leuschke', 'ima-leuschke', 'I used--and I don\'t think,\' Alice went on, taking first one side and then the Rabbit\'s little.', 142, '535.00', '325.00', '430.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(22, 6, '5843', 'Anya Kuphal V', 'anya-kuphal-v', 'Dinah\'ll be sending me on messages next!\' And she kept fanning herself all the while, till at last.', 179, '947.00', '867.00', '205.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(23, 4, '5384', 'Chanel Blanda Sr.', 'chanel-blanda-sr', 'Rabbit\'s voice; and Alice was too dark to see if she were looking up into the garden at once; but.', 108, '497.00', '392.00', '147.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(24, 5, '5645', 'Renee Adams', 'renee-adams', 'And yet I wish you were or might have been was not an encouraging opening for a minute, trying to.', 145, '517.00', '648.00', '403.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(25, 1, '5200', 'Asha Stark DDS', 'asha-stark-dds', 'She waited for a rabbit! I suppose I ought to be ashamed of yourself for asking such a thing.', 104, '909.00', '881.00', '268.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(26, 1, '5589', 'Miss Misty Green IV', 'miss-misty-green-iv', 'Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never said I could show you our.', 199, '939.00', '365.00', '215.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(27, 5, '5284', 'Laney Huel', 'laney-huel', 'Alice\'s head. \'Is that the Mouse only growled in reply. \'Idiot!\' said the Mouse had changed his.', 113, '467.00', '300.00', '573.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(28, 6, '5201', 'Veronica Grant DVM', 'veronica-grant-dvm', 'AT ALL. Soup does very well to introduce it.\' \'I don\'t see any wine,\' she remarked. \'There isn\'t.', 174, '983.00', '470.00', '493.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(29, 4, '5632', 'Else Bailey', 'else-bailey', 'Quick, now!\' And Alice was more than nine feet high. \'Whoever lives there,\' thought Alice, \'to.', 135, '412.00', '256.00', '561.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(30, 4, '5553', 'Mr. Rick Bahringer', 'mr-rick-bahringer', 'Hatter: and in THAT direction,\' the Cat again, sitting on a branch of a well?\' The Dormouse shook.', 133, '152.00', '722.00', '283.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(31, 2, '5582', 'Miss Tabitha Hermann III', 'miss-tabitha-hermann-iii', 'March Hare. Alice was rather doubtful whether she could not make out what she was as much right,\'.', 185, '623.00', '501.00', '743.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(32, 5, '5872', 'Leanna Pfannerstill', 'leanna-pfannerstill', 'Duchess to play croquet with the game,\' the Queen to play croquet.\' The Frog-Footman repeated, in.', 168, '213.00', '396.00', '171.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(33, 5, '5148', 'Elian Schuster', 'elian-schuster', 'WHAT? The other guests had taken his watch out of that is--\"Oh, \'tis love, \'tis love, that makes.', 101, '281.00', '130.00', '465.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(34, 6, '5456', 'Zachary Hayes', 'zachary-hayes', 'I didn\'t,\' said Alice: \'I don\'t know what it was: at first she thought it over afterwards, it.', 174, '168.00', '118.00', '289.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(35, 2, '5146', 'Audrey Boyer', 'audrey-boyer', 'Dinah, and saying to herself, in a furious passion, and went down to her usual height. It was as.', 116, '133.00', '412.00', '695.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(36, 4, '5357', 'Unique Weissnat', 'unique-weissnat', 'Mouse to tell me the list of the cattle in the sky. Twinkle, twinkle--\"\' Here the Dormouse turned.', 195, '386.00', '162.00', '498.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(37, 3, '5303', 'Giovanni Keebler', 'giovanni-keebler', 'Duck. \'Found IT,\' the Mouse was bristling all over, and both creatures hid their faces in their.', 119, '773.00', '445.00', '232.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(38, 1, '5757', 'Randi Skiles', 'randi-skiles', 'The jury all wrote down all three dates on their backs was the only difficulty was, that anything.', 197, '893.00', '486.00', '565.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(39, 6, '5431', 'Avis Hand', 'avis-hand', 'Alice, as the large birds complained that they had a pencil that squeaked. This of course, Alice.', 196, '103.00', '551.00', '258.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(40, 3, '5863', 'Ms. Mattie Gibson Sr.', 'ms-mattie-gibson-sr', 'You gave us three or more; They all made a memorandum of the door and went on muttering over the.', 126, '357.00', '539.00', '732.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(41, 3, '5695', 'Dr. Sylvester Collier I', 'dr-sylvester-collier-i', 'Alice. \'Who\'s making personal remarks now?\' the Hatter added as an explanation. \'Oh, you\'re sure.', 167, '808.00', '811.00', '289.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(42, 3, '5849', 'Ms. Georgette Klein Sr.', 'ms-georgette-klein-sr', 'King, with an M?\' said Alice. \'Why?\' \'IT DOES THE BOOTS AND SHOES.\' the Gryphon remarked: \'because.', 186, '764.00', '240.00', '130.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(43, 1, '5123', 'Sibyl Wunsch', 'sibyl-wunsch', 'King eagerly, and he went on eagerly: \'There is such a rule at processions; \'and besides, what.', 117, '191.00', '641.00', '505.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(44, 2, '5990', 'Freddy Baumbach', 'freddy-baumbach', 'You see the earth takes twenty-four hours to turn into a graceful zigzag, and was just going to.', 170, '140.00', '220.00', '418.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(45, 6, '5142', 'Breana Konopelski', 'breana-konopelski', 'Queen, who were all shaped like the three gardeners, but she could not even get her head pressing.', 153, '816.00', '816.00', '221.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(46, 6, '5061', 'Madonna Goyette', 'madonna-goyette', 'Let me see--how IS it to speak with. Alice waited a little, and then the Mock Turtle yawned and.', 172, '294.00', '141.00', '433.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(47, 2, '5134', 'Layne O\'Reilly IV', 'layne-oreilly-iv', 'Which way?\', holding her hand on the end of every line: \'Speak roughly to your little boy, And.', 156, '391.00', '810.00', '563.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(48, 6, '5079', 'Clara Bogan', 'clara-bogan', 'Alice. The poor little thing sobbed again (or grunted, it was just saying to herself \'Suppose it.', 173, '450.00', '409.00', '349.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(49, 6, '5528', 'Miss Edythe Hintz', 'miss-edythe-hintz', 'I don\'t want YOU with us!\"\' \'They were learning to draw, you know--\' She had quite a large piece.', 184, '953.00', '967.00', '418.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(50, 6, '5661', 'Rhea Keeling', 'rhea-keeling', 'Alice had been anxiously looking across the field after it, and burning with curiosity, she ran.', 103, '848.00', '772.00', '67.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(51, 1, '5810', 'Luella Spinka', 'luella-spinka', 'Alice; \'but when you come to the game, the Queen never left off sneezing by this very sudden.', 100, '663.00', '892.00', '581.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(52, 1, '5005', 'Loma D\'Amore', 'loma-damore', 'Queen say only yesterday you deserved to be no use in knocking,\' said the Caterpillar. Alice said.', 152, '246.00', '166.00', '216.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(53, 6, '5698', 'Orlo Kemmer DDS', 'orlo-kemmer-dds', 'Seaography: then Drawling--the Drawling-master was an old conger-eel, that used to do:-- \'How doth.', 128, '142.00', '778.00', '522.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(54, 1, '5128', 'Jean McDermott', 'jean-mcdermott', 'Duchess and the words all coming different, and then dipped suddenly down, so suddenly that Alice.', 106, '957.00', '206.00', '208.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(55, 6, '5227', 'Kali Schroeder', 'kali-schroeder', 'Alice. \'I\'ve tried the little door about fifteen inches high: she tried hard to whistle to it; but.', 121, '173.00', '502.00', '471.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(56, 1, '5941', 'Vicky Mraz PhD', 'vicky-mraz-phd', 'Alice severely. \'What are they made of?\' \'Pepper, mostly,\' said the Cat: \'we\'re all mad here. I\'m.', 159, '102.00', '484.00', '92.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(57, 6, '5171', 'Tess Schowalter Jr.', 'tess-schowalter-jr', 'And the moral of that is--\"The more there is of finding morals in things!\' Alice began to cry.', 168, '430.00', '363.00', '410.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(58, 4, '5720', 'Mrs. Arlie Roberts', 'mrs-arlie-roberts', 'Caterpillar, just as well as the rest waited in silence. Alice noticed with some severity; \'it\'s.', 160, '497.00', '953.00', '547.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(59, 4, '5790', 'Prof. Mittie Yundt', 'prof-mittie-yundt', 'This time there were no tears. \'If you\'re going to dive in among the trees, a little house in it a.', 199, '846.00', '338.00', '431.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(60, 5, '5946', 'Delaney Rath', 'delaney-rath', 'Alice timidly. \'Would you tell me, Pat, what\'s that in some alarm. This time Alice waited a.', 131, '682.00', '548.00', '129.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(61, 4, '5764', 'Dr. Riley Haley', 'dr-riley-haley', 'Hatter: \'I\'m on the floor, and a fan! Quick, now!\' And Alice was just in time to hear her try and.', 181, '785.00', '407.00', '475.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(62, 3, '5246', 'Audie Leuschke', 'audie-leuschke', 'However, the Multiplication Table doesn\'t signify: let\'s try Geography. London is the driest thing.', 162, '296.00', '422.00', '185.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(63, 2, '5334', 'Sienna Renner', 'sienna-renner', 'I only wish it was,\' he said. \'Fifteenth,\' said the Footman. \'That\'s the first figure,\' said the.', 200, '367.00', '978.00', '395.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(64, 2, '5782', 'Noemy Heaney V', 'noemy-heaney-v', 'ME, and told me he was in the direction it pointed to, without trying to fix on one, the cook was.', 103, '669.00', '644.00', '422.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(65, 4, '5767', 'Leilani Powlowski', 'leilani-powlowski', 'Bill, the Lizard) could not think of anything to say, she simply bowed, and took the hookah out of.', 185, '325.00', '765.00', '459.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(66, 4, '5030', 'Gardner Batz', 'gardner-batz', 'Alice. \'I\'ve read that in the flurry of the game, the Queen in front of the miserable Mock Turtle.', 181, '395.00', '381.00', '399.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(67, 6, '5721', 'Morton Borer', 'morton-borer', 'Cheshire Cat,\' said Alice: \'I don\'t like them raw.\' \'Well, be off, then!\' said the Caterpillar.', 197, '636.00', '291.00', '370.00', 1, 1, '2021-02-09 01:28:13', '2021-02-09 01:28:13'),
(68, 2, '5547', 'Prof. Ayla Kassulke', 'prof-ayla-kassulke', 'I was a dead silence instantly, and neither of the sea.\' \'I couldn\'t afford to learn it.\' said the.', 101, '620.00', '122.00', '565.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(69, 6, '5812', 'Halie Wisoky', 'halie-wisoky', 'Cheshire cat,\' said the Duck. \'Found IT,\' the Mouse had changed his mind, and was just possible it.', 162, '753.00', '979.00', '74.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(70, 2, '5481', 'Anissa Kris V', 'anissa-kris-v', 'Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little sharp bark just over her.', 120, '368.00', '242.00', '612.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(71, 6, '5900', 'Coty Stracke', 'coty-stracke', 'Next came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit.', 130, '302.00', '339.00', '262.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(72, 3, '5710', 'Dr. Kennith Mraz', 'dr-kennith-mraz', 'Alice an excellent plan, no doubt, and very nearly in the direction in which case it would be the.', 103, '811.00', '140.00', '215.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(73, 4, '5105', 'Prof. Ulices Welch IV', 'prof-ulices-welch-iv', 'And the Eaglet bent down its head to keep herself from being broken. She hastily put down yet.', 124, '156.00', '823.00', '111.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(74, 2, '5263', 'Lea Collins', 'lea-collins', 'Duchess: \'what a clear way you can;--but I must be on the OUTSIDE.\' He unfolded the paper as he.', 147, '964.00', '359.00', '596.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(75, 1, '5855', 'Tavares Toy V', 'tavares-toy-v', 'Hatter hurriedly left the court, \'Bring me the list of the evening, beautiful Soup! \'Beautiful.', 102, '248.00', '566.00', '342.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(76, 4, '5514', 'Kraig Herman', 'kraig-herman', 'Hatter: \'I\'m on the ground as she did so, and were resting in the lap of her own ears for having.', 155, '137.00', '667.00', '687.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(77, 3, '5410', 'Prof. Kari Gleason Jr.', 'prof-kari-gleason-jr', 'There was not going to be, from one of the guinea-pigs cheered, and was going off into a graceful.', 179, '244.00', '384.00', '444.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(78, 4, '5517', 'Weldon Stark MD', 'weldon-stark-md', 'There were doors all round the refreshments!\' But there seemed to follow, except a little door was.', 118, '413.00', '177.00', '254.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(79, 1, '5174', 'Dr. Aric Gutkowski V', 'dr-aric-gutkowski-v', 'Alice, in a trembling voice to a mouse: she had nibbled some more bread-and-butter--\' \'But what.', 142, '224.00', '468.00', '78.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(80, 5, '5449', 'Nakia Carroll', 'nakia-carroll', 'I\'ll tell him--it was for bringing the cook was busily stirring the soup, and seemed not to be no.', 147, '609.00', '957.00', '188.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(81, 6, '5216', 'Sienna Weimann', 'sienna-weimann', 'Gryphon said to Alice. \'Only a thimble,\' said Alice in a trembling voice to its feet, ran round.', 129, '206.00', '707.00', '653.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(82, 1, '5485', 'Dr. Uriah Fay', 'dr-uriah-fay', 'Queen jumped up in such long ringlets, and mine doesn\'t go in at all?\' said Alice, \'and why it is.', 143, '384.00', '861.00', '196.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(83, 4, '5737', 'Olaf O\'Connell', 'olaf-oconnell', 'She waited for a good deal frightened at the top of it. Presently the Rabbit say to this: so she.', 175, '449.00', '191.00', '498.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(84, 4, '5869', 'Mrs. Beverly Tremblay IV', 'mrs-beverly-tremblay-iv', 'Dinah, tell me who YOU are, first.\' \'Why?\' said the Pigeon in a melancholy way, being quite unable.', 184, '562.00', '847.00', '352.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(85, 6, '5184', 'Madonna O\'Hara', 'madonna-ohara', 'And she began nursing her child again, singing a sort of knot, and then they both sat silent and.', 125, '118.00', '783.00', '616.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(86, 1, '5509', 'Adriana Davis', 'adriana-davis', 'There was exactly three inches high). \'But I\'m NOT a serpent, I tell you!\' But she went on. \'Or.', 150, '782.00', '133.00', '490.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(87, 2, '5942', 'Prof. Antone Hudson', 'prof-antone-hudson', 'When she got used to queer things happening. While she was going on within--a constant howling and.', 141, '678.00', '291.00', '404.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(88, 3, '5901', 'Dr. Misael Homenick', 'dr-misael-homenick', 'I beg your acceptance of this remark, and thought it would,\' said the Cat: \'we\'re all mad here.', 147, '225.00', '719.00', '407.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(89, 3, '5483', 'Noble Jacobs MD', 'noble-jacobs-md', 'I meant,\' the King very decidedly, and the executioner ran wildly up and down, and felt quite.', 194, '182.00', '492.00', '75.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(90, 4, '5052', 'Neal Bins', 'neal-bins', 'Footman continued in the sand with wooden spades, then a great deal of thought, and rightly too.', 115, '721.00', '408.00', '304.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(91, 1, '5006', 'Jeanette O\'Hara III', 'jeanette-ohara-iii', 'I don\'t understand. Where did they draw the treacle from?\' \'You can draw water out of sight, they.', 154, '937.00', '388.00', '462.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(92, 4, '5248', 'Margie Pagac Sr.', 'margie-pagac-sr', 'Don\'t let me help to undo it!\' \'I shall do nothing of tumbling down stairs! How brave they\'ll all.', 109, '833.00', '379.00', '420.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(93, 6, '5753', 'Prof. Virgil Cassin', 'prof-virgil-cassin', 'And she went on to her that she knew the name again!\' \'I won\'t interrupt again. I dare say you\'re.', 148, '445.00', '283.00', '667.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(94, 1, '5873', 'Dayton Will', 'dayton-will', 'I think--\' (for, you see, Miss, this here ought to be done, I wonder?\' Alice guessed who it was.', 200, '482.00', '581.00', '565.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(95, 3, '5135', 'Marilie Mitchell', 'marilie-mitchell', 'Five, in a twinkling! Half-past one, time for dinner!\' (\'I only wish it was,\' the March Hare moved.', 167, '804.00', '678.00', '380.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(96, 5, '5796', 'Prof. Chelsey Kassulke Sr.', 'prof-chelsey-kassulke-sr', 'Our family always HATED cats: nasty, low, vulgar things! Don\'t let him know she liked them best.', 178, '881.00', '581.00', '491.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(97, 2, '5373', 'Kane Weissnat', 'kane-weissnat', 'Queen was to find that her idea of the water, and seemed not to be no doubt that it made Alice.', 178, '446.00', '574.00', '342.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(98, 6, '5402', 'Ashlynn Johnston', 'ashlynn-johnston', 'KNOW IT TO BE TRUE--\" that\'s the queerest thing about it.\' \'She\'s in prison,\' the Queen was to eat.', 188, '577.00', '962.00', '670.00', 1, 1, '2021-02-09 01:32:51', '2021-02-09 01:32:51'),
(99, 2, '5052', 'Claude Funk', 'claude-funk', 'I\'m not used to do:-- \'How doth the little--\"\' and she ran out of the Mock Turtle persisted. \'How.', 188, '985.00', '962.00', '693.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(100, 6, '5989', 'Misty Sauer', 'misty-sauer', 'Duchess: \'flamingoes and mustard both bite. And the muscular strength, which it gave to my right.', 148, '349.00', '595.00', '52.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(101, 2, '5625', 'Jammie Larkin', 'jammie-larkin', 'Half-past one, time for dinner!\' (\'I only wish they COULD! I\'m sure I don\'t like them raw.\' \'Well.', 142, '534.00', '190.00', '393.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(102, 5, '5876', 'Agnes Roob', 'agnes-roob', 'Queen, pointing to the Classics master, though. He was an old woman--but then--always to have.', 179, '799.00', '546.00', '784.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(103, 2, '5054', 'Kip Daugherty I', 'kip-daugherty-i', 'Seaography: then Drawling--the Drawling-master was an old Crab took the hookah into its face to.', 166, '732.00', '525.00', '461.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(104, 5, '5957', 'Mr. Daryl Hyatt III', 'mr-daryl-hyatt-iii', 'March Hare. \'It was a good deal frightened by this time.) \'You\'re nothing but out-of-the-way.', 165, '331.00', '530.00', '728.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(105, 3, '5980', 'Estell Hayes', 'estell-hayes', 'King, looking round the court was in managing her flamingo: she succeeded in getting its body.', 131, '799.00', '553.00', '464.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(106, 5, '5511', 'Quincy Larson', 'quincy-larson', 'I will prosecute YOU.--Come, I\'ll take no denial; We must have a prize herself, you know,\' said.', 171, '751.00', '964.00', '259.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(107, 2, '5620', 'Ila Schuppe', 'ila-schuppe', 'When the sands are all pardoned.\' \'Come, THAT\'S a good many voices all talking at once, and ran.', 136, '842.00', '243.00', '637.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(108, 4, '5671', 'Marianne Auer', 'marianne-auer', 'I wish you wouldn\'t keep appearing and vanishing so suddenly: you make one repeat lessons!\'.', 155, '685.00', '123.00', '220.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(109, 2, '5411', 'Mrs. Jewell Cole II', 'mrs-jewell-cole-ii', 'Queen, \'and he shall tell you just now what the next thing was snorting like a frog; and both.', 159, '842.00', '308.00', '786.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(110, 1, '5316', 'Mr. Gabriel Hirthe', 'mr-gabriel-hirthe', 'After a minute or two, looking for eggs, I know all sorts of things--I can\'t remember half of.', 168, '536.00', '342.00', '608.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(111, 6, '5508', 'Kolby Heaney', 'kolby-heaney', 'I only wish people knew that: then they wouldn\'t be so proud as all that.\' \'Well, it\'s got no.', 126, '376.00', '365.00', '420.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(112, 6, '5869', 'Robyn McGlynn', 'robyn-mcglynn', 'Duchess; \'and most of \'em do.\' \'I don\'t know one,\' said Alice. \'And be quick about it,\' said.', 190, '870.00', '290.00', '771.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(113, 4, '5416', 'Dixie Glover', 'dixie-glover', 'Pat, what\'s that in about half no time! Take your choice!\' The Duchess took no notice of her or of.', 183, '931.00', '170.00', '640.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(114, 4, '5828', 'Maureen Swaniawski Jr.', 'maureen-swaniawski-jr', 'Alice! when she had never done such a very curious sensation, which puzzled her a good many little.', 102, '307.00', '411.00', '219.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(115, 3, '5879', 'Prof. Wilber Stroman PhD', 'prof-wilber-stroman-phd', 'Alice gently remarked; \'they\'d have been ill.\' \'So they were,\' said the March Hare. \'I didn\'t.', 155, '385.00', '724.00', '323.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(116, 4, '5051', 'Prof. Helena Langosh DDS', 'prof-helena-langosh-dds', 'Duchess and the White Rabbit, jumping up in spite of all the jurymen on to the Classics master.', 146, '206.00', '379.00', '735.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(117, 1, '5244', 'Linnie Gislason DVM', 'linnie-gislason-dvm', 'However, the Multiplication Table doesn\'t signify: let\'s try Geography. London is the capital of.', 164, '212.00', '325.00', '777.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(118, 1, '5413', 'Marilie Kessler', 'marilie-kessler', 'So she called softly after it, never once considering how in the pictures of him), while the Dodo.', 121, '757.00', '752.00', '700.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(119, 6, '5931', 'Prof. Sigrid Lubowitz II', 'prof-sigrid-lubowitz-ii', 'What WILL become of you? I gave her answer. \'They\'re done with blacking, I believe.\' \'Boots and.', 124, '179.00', '714.00', '715.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(120, 1, '5113', 'Bernadine Franecki Sr.', 'bernadine-franecki-sr', 'Between yourself and me.\' \'That\'s the judge,\' she said to Alice. \'Only a thimble,\' said Alice.', 164, '975.00', '572.00', '656.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(121, 1, '5746', 'Mr. Lane Blick', 'mr-lane-blick', 'Yet you balanced an eel on the top of her sister, as well as if she were looking over their heads.', 143, '918.00', '745.00', '369.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(122, 4, '5764', 'Ms. Luisa Bernhard IV', 'ms-luisa-bernhard-iv', 'Pigeon; \'but if they do, why then they\'re a kind of authority among them, called out, \'Sit down.', 191, '290.00', '359.00', '235.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(123, 5, '5004', 'Miss Arianna Johns', 'miss-arianna-johns', 'I think I should frighten them out with his head!\' she said, as politely as she could, for her to.', 176, '544.00', '796.00', '623.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(124, 4, '5804', 'Kylie Moore', 'kylie-moore', 'Gryphon. \'Of course,\' the Dodo solemnly presented the thimble, looking as solemn as she did not.', 137, '444.00', '254.00', '679.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(125, 6, '5517', 'Prof. Hiram Haley', 'prof-hiram-haley', 'How puzzling all these strange Adventures of hers that you have just been reading about; and when.', 134, '549.00', '152.00', '272.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(126, 6, '5965', 'Dr. Madaline Johnson IV', 'dr-madaline-johnson-iv', 'And oh, I wish I had not got into a large crowd collected round it: there were TWO little shrieks.', 171, '758.00', '696.00', '166.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(127, 3, '5573', 'Jennyfer Schaden', 'jennyfer-schaden', 'I\'ll give them a new idea to Alice, and looking anxiously about her. \'Oh, do let me help to undo.', 190, '293.00', '726.00', '167.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(128, 3, '5168', 'Ms. Martina Kuphal', 'ms-martina-kuphal', 'HE was.\' \'I never went to school in the kitchen. \'When I\'M a Duchess,\' she said to live. \'I\'ve.', 174, '585.00', '909.00', '654.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(129, 1, '5186', 'Prof. Frieda Torphy Jr.', 'prof-frieda-torphy-jr', 'Miss, this here ought to be no use in knocking,\' said the Gryphon: and it put the hookah out of a.', 166, '847.00', '843.00', '270.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(130, 2, '5649', 'Pinkie Considine', 'pinkie-considine', 'Alice put down her flamingo, and began bowing to the jury, and the little thing sat down again in.', 139, '712.00', '529.00', '147.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(131, 1, '5227', 'Tyshawn Durgan', 'tyshawn-durgan', 'She said this last remark that had made the whole thing very absurd, but they began running about.', 131, '802.00', '338.00', '539.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(132, 3, '5427', 'Kallie Fadel', 'kallie-fadel', 'The Mouse looked at them with the dream of Wonderland of long ago: and how she would have called.', 154, '676.00', '875.00', '313.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(133, 3, '5067', 'Scot O\'Hara IV', 'scot-ohara-iv', 'King; and as it settled down again, the cook was leaning over the verses the White Rabbit, who was.', 169, '722.00', '954.00', '494.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(134, 1, '5777', 'Consuelo Erdman', 'consuelo-erdman', 'Queen. \'Well, I shan\'t go, at any rate, the Dormouse shook itself, and began bowing to the other.', 140, '780.00', '376.00', '105.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(135, 3, '5861', 'Florence Goyette', 'florence-goyette', 'Her first idea was that you couldn\'t cut off a bit of stick, and tumbled head over heels in its.', 129, '816.00', '788.00', '692.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(136, 3, '5593', 'Mrs. Lexi Brown MD', 'mrs-lexi-brown-md', 'Caterpillar. Alice folded her hands, and she felt that there was silence for some way, and nothing.', 142, '897.00', '741.00', '175.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(137, 3, '5636', 'Everette Corwin', 'everette-corwin', 'But, now that I\'m doubtful about the reason and all the time she saw maps and pictures hung upon.', 126, '886.00', '336.00', '532.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(138, 5, '5272', 'Dr. Karlee Kuvalis DVM', 'dr-karlee-kuvalis-dvm', 'CHAPTER IX. The Mock Turtle in the pictures of him), while the Mouse replied rather impatiently.', 181, '373.00', '314.00', '654.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(139, 1, '5429', 'Frederic Tremblay', 'frederic-tremblay', 'Do you think you might like to be rude, so she helped herself to some tea and bread-and-butter.', 119, '539.00', '591.00', '378.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(140, 4, '5044', 'Prof. Norene Pollich Jr.', 'prof-norene-pollich-jr', 'There was a little more conversation with her friend. When she got up this morning? I almost wish.', 151, '714.00', '276.00', '205.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(141, 5, '5601', 'Gracie Volkman Sr.', 'gracie-volkman-sr', 'As for pulling me out of the month is it?\' The Gryphon sat up and down in a bit.\' \'Perhaps it.', 161, '309.00', '902.00', '474.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(142, 4, '5150', 'Trever Marquardt', 'trever-marquardt', 'Alice; \'it\'s laid for a minute, nurse! But I\'ve got to go from here?\' \'That depends a good thing!\'.', 103, '549.00', '282.00', '254.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(143, 3, '5635', 'Randal Heidenreich', 'randal-heidenreich', 'Don\'t be all day about it!\' Last came a rumbling of little animals and birds waiting outside. The.', 179, '289.00', '225.00', '592.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(144, 3, '5535', 'Justus Bins', 'justus-bins', 'The question is, what?\' The great question is, what?\' The great question certainly was, what?.', 128, '985.00', '890.00', '98.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(145, 2, '5746', 'Emile Hill', 'emile-hill', 'Two. Two began in a bit.\' \'Perhaps it doesn\'t matter much,\' thought Alice, \'shall I NEVER get any.', 176, '745.00', '589.00', '609.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(146, 1, '5293', 'Easter Russel', 'easter-russel', 'Dormouse again, so she waited. The Gryphon sat up and throw us, with the bread-and-butter getting.', 131, '113.00', '702.00', '74.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(147, 4, '5654', 'Carey Wisoky', 'carey-wisoky', 'Alice for protection. \'You shan\'t be beheaded!\' \'What for?\' said Alice. \'Why, SHE,\' said the.', 113, '871.00', '212.00', '187.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(148, 3, '5953', 'Dr. Kennith Mayert DVM', 'dr-kennith-mayert-dvm', 'I look like one, but the Mouse in the pool a little pattering of feet on the floor, as it turned.', 186, '1000.00', '509.00', '488.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(149, 2, '5773', 'Whitney Dibbert', 'whitney-dibbert', 'Mock Turtle. \'Seals, turtles, salmon, and so on; then, when you\'ve cleared all the other was.', 163, '130.00', '220.00', '664.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(150, 2, '5859', 'Zelda Streich', 'zelda-streich', 'There was a queer-shaped little creature, and held it out to sea. So they went on planning to.', 172, '608.00', '166.00', '458.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(151, 2, '5541', 'Leon Mitchell', 'leon-mitchell', 'Said the mouse doesn\'t get out.\" Only I don\'t want YOU with us!\"\' \'They were learning to draw, you.', 160, '512.00', '188.00', '471.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(152, 6, '5058', 'Bennie Jacobi', 'bennie-jacobi', 'I could shut up like telescopes: this time she saw in another minute the whole party look so grave.', 124, '280.00', '950.00', '413.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(153, 5, '5544', 'Evelyn Harris', 'evelyn-harris', 'Alice was soon left alone. \'I wish I hadn\'t quite finished my tea when I was going to leave off.', 111, '935.00', '344.00', '676.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(154, 1, '5198', 'Ibrahim Klocko', 'ibrahim-klocko', 'I could show you our cat Dinah: I think that proved it at all,\' said the Mouse. \'--I proceed.', 163, '196.00', '388.00', '334.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(155, 5, '5566', 'Zoila Rempel', 'zoila-rempel', 'Alice a little house in it a little bit, and said nothing. \'This here young lady,\' said the cook.', 178, '979.00', '618.00', '152.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(156, 1, '5046', 'Isobel Padberg', 'isobel-padberg', 'I\'ve tried hedges,\' the Pigeon went on, \'you see, a dog growls when it\'s angry, and wags its tail.', 175, '763.00', '119.00', '291.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(157, 3, '5070', 'Shea Lesch', 'shea-lesch', 'Gryphon, \'that they WOULD not remember ever having seen such a dreadful time.\' So Alice began to.', 144, '936.00', '328.00', '326.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(158, 1, '5979', 'Jayden Miller', 'jayden-miller', 'Yet you finished the goose, with the Duchess, who seemed ready to ask help of any one; so, when.', 127, '305.00', '606.00', '509.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(159, 3, '5986', 'Colton Greenfelder', 'colton-greenfelder', 'The baby grunted again, so violently, that she had never before seen a good deal frightened by.', 107, '720.00', '774.00', '493.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(160, 4, '5463', 'Montana Cormier', 'montana-cormier', 'King repeated angrily, \'or I\'ll have you executed, whether you\'re a little scream of laughter.', 187, '322.00', '661.00', '509.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(161, 1, '5091', 'Sterling Bins', 'sterling-bins', 'Caucus-race.\' \'What IS the use of repeating all that green stuff be?\' said Alice. \'Who\'s making.', 182, '564.00', '267.00', '403.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(162, 3, '5583', 'Austyn Stanton', 'austyn-stanton', 'Footman continued in the chimney close above her: then, saying to her that she was dozing off, and.', 175, '367.00', '367.00', '81.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(163, 5, '5150', 'Electa Upton', 'electa-upton', 'I can kick a little!\' She drew her foot slipped, and in a moment that it is!\' \'Why should it?\'.', 120, '479.00', '300.00', '459.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(164, 4, '5251', 'Mr. Linwood Marquardt', 'mr-linwood-marquardt', 'Little Bill It was opened by another footman in livery, with a kind of rule, \'and vinegar that.', 125, '168.00', '780.00', '112.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(165, 1, '5390', 'Darrel Kautzer MD', 'darrel-kautzer-md', 'Hatter went on growing, and, as there seemed to be done, I wonder?\' And here poor Alice began to.', 131, '466.00', '170.00', '719.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(166, 4, '5347', 'Ernie Trantow Jr.', 'ernie-trantow-jr', 'The Duchess took her choice, and was going off into a pig, my dear,\' said Alice, feeling very glad.', 113, '125.00', '728.00', '224.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(167, 5, '5672', 'Ophelia Yost', 'ophelia-yost', 'Queen never left off sneezing by this time, sat down again in a deep voice, \'are done with.', 186, '410.00', '884.00', '404.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(168, 3, '5480', 'Ignacio Stracke', 'ignacio-stracke', 'Mock Turtle said: \'no wise fish would go anywhere without a cat! It\'s the most confusing thing I.', 153, '659.00', '930.00', '268.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(169, 6, '5138', 'Ressie Zulauf III', 'ressie-zulauf-iii', 'So Bill\'s got the other--Bill! fetch it here, lad!--Here, put \'em up at the window.\' \'THAT you.', 113, '831.00', '782.00', '170.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(170, 1, '5037', 'Esta Trantow', 'esta-trantow', 'On various pretexts they all cheered. Alice thought this a good deal frightened at the mushroom.', 118, '475.00', '626.00', '699.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(171, 1, '5536', 'Markus Yundt', 'markus-yundt', 'Magpie began wrapping itself up very carefully, with one finger pressed upon its nose. The.', 177, '577.00', '146.00', '318.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(172, 4, '5621', 'Misael Davis DVM', 'misael-davis-dvm', 'I don\'t like it, yer honour, at all, at all!\' \'Do as I do,\' said the White Rabbit interrupted.', 108, '179.00', '910.00', '702.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(173, 5, '5683', 'Ruthe Gerhold', 'ruthe-gerhold', 'SIT down,\' the King sharply. \'Do you take me for a baby: altogether Alice did not like to see what.', 149, '701.00', '766.00', '317.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(174, 4, '5485', 'Araceli Gutkowski', 'araceli-gutkowski', 'Alice heard the Queen\'s hedgehog just now, only it ran away when it grunted again, and made.', 157, '927.00', '650.00', '303.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(175, 5, '5767', 'Myrl Cartwright', 'myrl-cartwright', 'Caterpillar contemptuously. \'Who are YOU?\' Which brought them back again to the game. CHAPTER IX.', 107, '279.00', '872.00', '461.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(176, 4, '5073', 'Green Nicolas', 'green-nicolas', 'Gryphon at the window.\' \'THAT you won\'t\' thought Alice, \'it\'ll never do to ask: perhaps I shall.', 186, '886.00', '553.00', '735.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(177, 1, '5129', 'Bernita Rogahn', 'bernita-rogahn', 'Five. \'I heard the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked at Alice.', 185, '841.00', '253.00', '285.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(178, 5, '5087', 'Walter Torp III', 'walter-torp-iii', 'Dormouse fell asleep instantly, and Alice looked at each other for some time without hearing.', 165, '328.00', '815.00', '615.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(179, 4, '5450', 'Elliott Cole', 'elliott-cole', 'Heads below!\' (a loud crash)--\'Now, who did that?--It was Bill, the Lizard) could not help.', 126, '489.00', '912.00', '669.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(180, 6, '5735', 'Madalyn Rutherford', 'madalyn-rutherford', 'I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the patience of an oyster!\' \'I wish I could show.', 118, '406.00', '570.00', '647.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(181, 3, '5139', 'Carey Kuhn I', 'carey-kuhn-i', 'Alice,) and round goes the clock in a deep voice, \'What are tarts made of?\' Alice asked in a sulky.', 167, '885.00', '913.00', '279.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(182, 2, '5614', 'Kenya Crist', 'kenya-crist', 'There was a dispute going on shrinking rapidly: she soon found herself safe in a trembling.', 199, '183.00', '120.00', '109.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(183, 2, '5611', 'Prof. Montana Simonis', 'prof-montana-simonis', 'Let me see: I\'ll give them a new idea to Alice, and sighing. \'It IS the use of a muchness?\'.', 101, '559.00', '391.00', '628.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(184, 2, '5924', 'Macy Connelly', 'macy-connelly', 'Dormouse: \'not in that poky little house, and the three gardeners instantly jumped up, and reduced.', 126, '175.00', '260.00', '240.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(185, 6, '5422', 'Yvette Keebler', 'yvette-keebler', 'I\'d taken the highest tree in the air: it puzzled her too much, so she went back for a great.', 192, '377.00', '551.00', '365.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(186, 3, '5950', 'Prof. Loraine Breitenberg', 'prof-loraine-breitenberg', 'I do,\' said the March Hare had just succeeded in getting its body tucked away, comfortably enough.', 120, '757.00', '844.00', '746.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(187, 3, '5440', 'Dr. Elmo Muller Jr.', 'dr-elmo-muller-jr', 'Why, she\'ll eat a little pattering of footsteps in the last words out loud, and the little golden.', 193, '499.00', '386.00', '237.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(188, 3, '5159', 'Marisa Herzog', 'marisa-herzog', 'Alice to herself. \'Shy, they seem to encourage the witness at all: he kept shifting from one of.', 120, '689.00', '366.00', '718.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(189, 1, '5982', 'Armani Cormier', 'armani-cormier', 'Alice, they all crowded together at one end to the Mock Turtle. \'Seals, turtles, salmon, and so.', 185, '623.00', '818.00', '189.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(190, 2, '5737', 'Abraham Abbott', 'abraham-abbott', 'Caterpillar, just as if she had put on your head-- Do you think, at your age, it is you hate--C.', 169, '633.00', '486.00', '396.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52');
INSERT INTO `products` (`id`, `brand_id`, `sku`, `name`, `slug`, `description`, `quantity`, `weight`, `price`, `sale_price`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(191, 1, '5350', 'Antonetta Mitchell', 'antonetta-mitchell', 'Rabbit began. Alice gave a sudden burst of tears, but said nothing. \'When we were little,\' the.', 120, '968.00', '332.00', '477.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(192, 5, '5749', 'Elijah Willms', 'elijah-willms', 'Gryphon, \'she wants for to know your history, she do.\' \'I\'ll tell it her,\' said the Gryphon said.', 106, '502.00', '346.00', '101.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(193, 5, '5986', 'Braxton Pollich I', 'braxton-pollich-i', 'Alice was not otherwise than what you would have appeared to them to sell,\' the Hatter went on, \'I.', 170, '161.00', '804.00', '544.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(194, 6, '5514', 'Mrs. Corrine Gottlieb', 'mrs-corrine-gottlieb', 'They were indeed a queer-looking party that assembled on the ground near the door opened inwards.', 196, '236.00', '482.00', '733.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(195, 4, '5304', 'Arlo Rolfson', 'arlo-rolfson', 'Rabbit hastily interrupted. \'There\'s a great deal to come out among the trees had a consultation.', 109, '546.00', '246.00', '658.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(196, 2, '5300', 'Magnolia Bartoletti', 'magnolia-bartoletti', 'Duck: \'it\'s generally a ridge or furrow in the last word two or three times over to herself, and.', 198, '260.00', '397.00', '427.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(197, 2, '5294', 'Erika Swaniawski', 'erika-swaniawski', 'King, and the March Hare went on. \'We had the best thing to get through was more than nine feet.', 118, '516.00', '639.00', '98.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(198, 4, '5721', 'Shirley Prosacco', 'shirley-prosacco', 'Dormouse. \'Write that down,\' the King hastily said, and went in. The door led right into it.', 180, '791.00', '417.00', '539.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(199, 4, '5216', 'Monserrat Schumm', 'monserrat-schumm', 'I know all sorts of things--I can\'t remember half of anger, and tried to beat them off, and had.', 142, '812.00', '950.00', '95.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(200, 5, '5261', 'Janet Brown', 'janet-brown', 'I know I do!\' said Alice as he could go. Alice took up the fan and gloves, and, as there seemed to.', 144, '120.00', '185.00', '433.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(201, 4, '5621', 'Dr. Timothy Lemke DDS', 'dr-timothy-lemke-dds', 'King; and as the other.\' As soon as it went, \'One side of the lefthand bit. * * * * * * * *.', 105, '633.00', '334.00', '482.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(202, 2, '5382', 'Abagail Flatley', 'abagail-flatley', 'Last came a little different. But if I\'m Mabel, I\'ll stay down here with me! There are no mice in.', 167, '535.00', '827.00', '758.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(203, 2, '5879', 'Miss Roxane O\'Reilly', 'miss-roxane-oreilly', 'Alice, who felt very glad to find her way into a large caterpillar, that was sitting on a summer.', 123, '420.00', '976.00', '335.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(204, 1, '5136', 'Katharina Little DDS', 'katharina-little-dds', 'Now you know.\' He was an old Turtle--we used to queer things happening. While she was up to her.', 110, '917.00', '383.00', '419.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(205, 1, '5048', 'Rachael Reynolds', 'rachael-reynolds', 'Lizard in head downwards, and the Dormouse go on crying in this affair, He trusts to you how it.', 153, '135.00', '932.00', '289.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(206, 4, '5757', 'Christy Sauer', 'christy-sauer', 'This time there were ten of them, with her head!\' the Queen never left off staring at the door.', 134, '957.00', '281.00', '449.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(207, 5, '5779', 'Mr. Payton Green', 'mr-payton-green', 'The poor little thing howled so, that he had to fall upon Alice, as she spoke, but no result.', 198, '388.00', '266.00', '457.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(208, 5, '5092', 'Mr. Tate Raynor', 'mr-tate-raynor', 'Lory, as soon as there was a little bit of mushroom, and raised herself to about two feet high.', 104, '927.00', '191.00', '512.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(209, 5, '5607', 'Mrs. Thelma Bode', 'mrs-thelma-bode', 'Cat. \'I said pig,\' replied Alice; \'and I do hope it\'ll make me grow larger, I can listen all day.', 147, '501.00', '799.00', '413.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(210, 6, '5269', 'Lorena Veum', 'lorena-veum', 'So you see, as well be at school at once.\' However, she did not much surprised at this, that she.', 183, '805.00', '185.00', '660.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(211, 4, '5765', 'Prof. Sydnie Lemke', 'prof-sydnie-lemke', 'Heads below!\' (a loud crash)--\'Now, who did that?--It was Bill, I fancy--Who\'s to go from here?\'.', 128, '981.00', '733.00', '389.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(212, 6, '5543', 'Hillard Stamm', 'hillard-stamm', 'Next came the royal children, and everybody laughed, \'Let the jury consider their verdict,\' the.', 122, '308.00', '364.00', '636.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(213, 4, '5643', 'Mac Crona', 'mac-crona', 'Tarts? The King turned pale, and shut his note-book hastily. \'Consider your verdict,\' he said in a.', 112, '151.00', '716.00', '735.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(214, 5, '5294', 'Della Hermiston', 'della-hermiston', 'The Mock Turtle\'s heavy sobs. Lastly, she pictured to herself that perhaps it was only too glad to.', 190, '680.00', '731.00', '530.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(215, 6, '5568', 'Ms. Abigale Herzog IV', 'ms-abigale-herzog-iv', 'I beg your pardon!\' said the Lory, who at last it sat down again in a more subdued tone, and added.', 143, '485.00', '142.00', '430.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(216, 4, '5192', 'Dr. Juliana Stiedemann PhD', 'dr-juliana-stiedemann-phd', 'M?\' said Alice. \'Well, I should like to show you! A little bright-eyed terrier, you know, as we.', 153, '711.00', '355.00', '767.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(217, 5, '5931', 'Domingo Bauch', 'domingo-bauch', 'Dormouse; \'VERY ill.\' Alice tried to fancy to herself in a great hurry. An enormous puppy was.', 126, '316.00', '728.00', '157.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(218, 3, '5935', 'Hettie Mitchell', 'hettie-mitchell', 'Queen merely remarking that a red-hot poker will burn you if you only kept on puzzling about it in.', 189, '355.00', '401.00', '708.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(219, 1, '5478', 'Janessa Padberg', 'janessa-padberg', 'Knave was standing before them, in chains, with a little before she had to kneel down on their.', 132, '450.00', '757.00', '121.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(220, 4, '5082', 'Napoleon Mosciski', 'napoleon-mosciski', 'My notion was that you weren\'t to talk nonsense. The Queen\'s Croquet-Ground A large rose-tree.', 138, '179.00', '863.00', '60.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(221, 6, '5613', 'Reid Connelly', 'reid-connelly', 'Mock Turtle would be worth the trouble of getting up and said, \'So you think you could draw.', 154, '274.00', '406.00', '485.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(222, 4, '5401', 'Prof. Bernita Prosacco', 'prof-bernita-prosacco', 'I am very tired of sitting by her sister was reading, but it just grazed his nose, and broke off a.', 106, '144.00', '487.00', '228.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(223, 3, '5862', 'Dr. Cristopher Daugherty II', 'dr-cristopher-daugherty-ii', 'At last the Caterpillar took the opportunity of taking it away. She did not see anything that.', 182, '306.00', '785.00', '164.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(224, 3, '5089', 'Hardy Lebsack', 'hardy-lebsack', 'So she began: \'O Mouse, do you mean that you think you could only see her. She is such a curious.', 104, '643.00', '166.00', '768.00', 1, 1, '2021-02-09 01:32:52', '2021-02-09 01:32:52'),
(225, 5, '5437', 'Richmond Gerhold', 'richmond-gerhold', 'Mouse. \'--I proceed. \"Edwin and Morcar, the earls of Mercia and Northumbria, declared for him: and.', 157, '543.00', '435.00', '493.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(226, 3, '5677', 'Dr. Arely Braun', 'dr-arely-braun', 'The Mouse only shook its head to hide a smile: some of the conversation. Alice replied, so eagerly.', 181, '472.00', '142.00', '800.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(227, 4, '5356', 'Seamus Rowe', 'seamus-rowe', 'The first question of course you know the meaning of it at last, more calmly, though still sobbing.', 159, '931.00', '841.00', '333.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(228, 1, '5516', 'Francis Grant', 'francis-grant', 'Gryphon said to the Caterpillar, and the Queen shrieked out. \'Behead that Dormouse! Turn that.', 187, '818.00', '167.00', '259.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(229, 3, '5293', 'Jaylon Rogahn', 'jaylon-rogahn', 'Alice was not otherwise than what it was: at first was moderate. But the insolence of his head.', 170, '153.00', '808.00', '770.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(230, 3, '5572', 'Ms. Sophia Mayer', 'ms-sophia-mayer', 'Cat\'s head began fading away the time. Alice had been anything near the house if it had fallen.', 110, '239.00', '580.00', '638.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(231, 3, '5254', 'Ariel Lakin', 'ariel-lakin', 'SAID was, \'Why is a very curious to know what a delightful thing a Lobster Quadrille The Mock.', 119, '974.00', '281.00', '121.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(232, 4, '5521', 'Dr. Devan Armstrong MD', 'dr-devan-armstrong-md', 'The question is, what did the Dormouse denied nothing, being fast asleep. \'After that,\' continued.', 194, '505.00', '128.00', '421.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(233, 3, '5030', 'Sarai Haley IV', 'sarai-haley-iv', 'THE VOICE OF THE SLUGGARD,\"\' said the Dormouse again, so that by the way the people that walk with.', 129, '716.00', '106.00', '153.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(234, 3, '5559', 'Gudrun Kemmer PhD', 'gudrun-kemmer-phd', 'Alice had learnt several things of this elegant thimble\'; and, when it saw mine coming!\' \'How do.', 147, '466.00', '483.00', '298.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(235, 1, '5704', 'Oswaldo Kilback', 'oswaldo-kilback', 'I beg your pardon!\' she exclaimed in a day did you manage to do THAT in a trembling voice:-- \'I.', 145, '331.00', '145.00', '714.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(236, 1, '5408', 'Prof. Emory Legros PhD', 'prof-emory-legros-phd', 'COULD grin.\' \'They all can,\' said the Hatter. He had been for some minutes. Alice thought this.', 117, '769.00', '831.00', '714.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(237, 5, '5808', 'Tyra West', 'tyra-west', 'I used--and I don\'t know what a wonderful dream it had entirely disappeared; so the King in a.', 180, '991.00', '360.00', '264.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(238, 4, '5728', 'Clare Lehner DVM', 'clare-lehner-dvm', 'Alice cautiously replied, not feeling at all fairly,\' Alice began, in a minute, while Alice.', 145, '185.00', '184.00', '588.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(239, 2, '5864', 'Zula Brekke', 'zula-brekke', 'March Hare. \'I didn\'t know that cats COULD grin.\' \'They all can,\' said the Cat. \'I don\'t think.', 104, '988.00', '724.00', '456.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(240, 1, '5232', 'Mrs. Jakayla Kuvalis PhD', 'mrs-jakayla-kuvalis-phd', 'But, now that I\'m perfectly sure I don\'t like them!\' When the procession came opposite to Alice.', 152, '136.00', '345.00', '653.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(241, 3, '5889', 'Darlene Konopelski', 'darlene-konopelski', 'Alice had been jumping about like that!\' But she went in without knocking, and hurried off at.', 146, '616.00', '511.00', '735.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(242, 6, '5903', 'Ms. Annie Dietrich PhD', 'ms-annie-dietrich-phd', 'That WILL be a grin, and she hurried out of its mouth and began staring at the frontispiece if you.', 129, '800.00', '774.00', '372.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(243, 4, '5300', 'Rubie Dach', 'rubie-dach', 'I find a thing,\' said the Mock Turtle at last, they must needs come wriggling down from the.', 148, '700.00', '636.00', '374.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(244, 3, '5812', 'Peggie Bogan', 'peggie-bogan', 'Gryphon, \'you first form into a doze; but, on being pinched by the time she found to be said. At.', 119, '215.00', '327.00', '222.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(245, 5, '5636', 'Jake Veum', 'jake-veum', 'Alice began, in a low curtain she had never forgotten that, if you were INSIDE, you might do very.', 198, '255.00', '431.00', '778.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(246, 6, '5757', 'Juston Boehm', 'juston-boehm', 'YOU manage?\' Alice asked. The Hatter was the Duchess\'s cook. She carried the pepper-box in her.', 106, '594.00', '487.00', '83.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(247, 4, '5173', 'Clinton Boyle', 'clinton-boyle', 'Alice severely. \'What are tarts made of?\' \'Pepper, mostly,\' said the Queen, in a voice of thunder.', 143, '223.00', '269.00', '676.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(248, 5, '5127', 'Juana McDermott', 'juana-mcdermott', 'She soon got it out to be full of smoke from one foot up the conversation dropped, and the little.', 121, '145.00', '821.00', '264.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(249, 2, '5039', 'Katharina Stark', 'katharina-stark', 'Alice looked up, and there was the White Rabbit, who was beginning to grow to my right size: the.', 199, '496.00', '947.00', '382.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(250, 2, '5040', 'Mateo Berge', 'mateo-berge', 'Alice. \'Why, you don\'t even know what \"it\" means well enough, when I got up and said, without even.', 121, '566.00', '444.00', '286.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(251, 3, '5997', 'Zoila Smith', 'zoila-smith', 'There seemed to be true): If she should push the matter worse. You MUST have meant some mischief.', 170, '411.00', '706.00', '606.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(252, 6, '5410', 'Eulalia Satterfield', 'eulalia-satterfield', 'Hatter: \'but you could only hear whispers now and then the Rabbit\'s little white kid gloves, and.', 183, '724.00', '564.00', '301.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(253, 1, '5947', 'Clara Cartwright', 'clara-cartwright', 'Alice led the way, and the turtles all advance! They are waiting on the door that led into the.', 136, '196.00', '907.00', '708.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(254, 5, '5580', 'Maybelle Boyer', 'maybelle-boyer', 'Duchess was sitting on the glass table and the baby was howling so much already, that it might.', 151, '921.00', '587.00', '517.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(255, 1, '5231', 'Geraldine Nicolas', 'geraldine-nicolas', 'March Hare said in a great interest in questions of eating and drinking. \'They lived on treacle,\'.', 188, '120.00', '218.00', '644.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(256, 2, '5649', 'Dr. Daija Ankunding MD', 'dr-daija-ankunding-md', 'Alice, \'how am I to do?\' said Alice. \'Of course not,\' Alice replied in a large plate came skimming.', 160, '806.00', '948.00', '160.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(257, 3, '5308', 'Prof. Jovany O\'Connell', 'prof-jovany-oconnell', 'Alice remarked. \'Right, as usual,\' said the Dodo, \'the best way you go,\' said the Cat. \'I\'d nearly.', 138, '664.00', '919.00', '644.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(258, 6, '5357', 'Julio Morar', 'julio-morar', 'Alice; \'I might as well look and see what the flame of a tree. By the time he was gone, and the.', 111, '418.00', '634.00', '490.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(259, 1, '5288', 'Mrs. Malvina Lockman III', 'mrs-malvina-lockman-iii', 'VERY good opportunity for repeating his remark, with variations. \'I shall be late!\' (when she.', 165, '877.00', '958.00', '454.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(260, 3, '5220', 'Lincoln Rohan', 'lincoln-rohan', 'Caterpillar\'s making such VERY short remarks, and she was playing against herself, for she was.', 173, '627.00', '200.00', '360.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(261, 1, '5159', 'Mr. Hailey Bahringer', 'mr-hailey-bahringer', 'How the Owl and the other side will make you grow taller, and the constant heavy sobbing of the.', 188, '855.00', '691.00', '175.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(262, 4, '5042', 'Dimitri Stamm', 'dimitri-stamm', 'I can reach the key; and if it likes.\' \'I\'d rather not,\' the Cat remarked. \'Don\'t be impertinent,\'.', 141, '204.00', '143.00', '792.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(263, 5, '5693', 'Jordan Bahringer III', 'jordan-bahringer-iii', 'I shall ever see you again, you dear old thing!\' said the Mouse. \'Of course,\' the Dodo said.', 139, '730.00', '990.00', '765.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(264, 5, '5787', 'Vallie Purdy', 'vallie-purdy', 'I get SOMEWHERE,\' Alice added as an explanation. \'Oh, you\'re sure to happen,\' she said aloud. \'I.', 199, '366.00', '305.00', '121.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(265, 2, '5687', 'Prof. Amara Kulas', 'prof-amara-kulas', 'NO mistake about it: it was over at last, and they lived at the door--I do wish I hadn\'t mentioned.', 142, '876.00', '212.00', '690.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(266, 6, '5272', 'Maia Cassin', 'maia-cassin', 'March--just before HE went mad, you know--\' \'But, it goes on \"THEY ALL RETURNED FROM HIM TO YOU,\"\'.', 159, '278.00', '309.00', '247.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(267, 3, '5568', 'Santiago Tremblay', 'santiago-tremblay', 'I suppose?\' said Alice. \'Why?\' \'IT DOES THE BOOTS AND SHOES.\' the Gryphon at the bottom of a.', 149, '289.00', '560.00', '451.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(268, 5, '5236', 'Burnice Schimmel Jr.', 'burnice-schimmel-jr', 'Alice,) and round Alice, every now and then the puppy made another snatch in the book,\' said the.', 169, '638.00', '132.00', '163.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(269, 2, '5603', 'Karolann Streich IV', 'karolann-streich-iv', 'The Knave of Hearts, carrying the King\'s crown on a bough of a globe of goldfish she had never had.', 139, '825.00', '952.00', '532.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(270, 5, '5740', 'Miss Dawn Sipes', 'miss-dawn-sipes', 'The Dormouse again took a great hurry. An enormous puppy was looking up into the sea, some.', 148, '752.00', '773.00', '363.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(271, 3, '5419', 'Julianne Shields IV', 'julianne-shields-iv', 'There were doors all round her head. Still she went on for some minutes. Alice thought to herself.', 103, '284.00', '738.00', '409.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(272, 6, '5959', 'Dr. Concepcion Beer I', 'dr-concepcion-beer-i', 'I say,\' the Mock Turtle. \'She can\'t explain it,\' said Alice, in a very curious thing, and she swam.', 182, '510.00', '637.00', '293.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(273, 6, '5560', 'Catherine Terry', 'catherine-terry', 'Atheling to meet William and offer him the crown. William\'s conduct at first was moderate. But the.', 148, '852.00', '422.00', '95.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(274, 5, '5618', 'Estella Hyatt', 'estella-hyatt', 'At last the Mock Turtle recovered his voice, and, with tears again as she added, to herself, \'it.', 175, '465.00', '681.00', '304.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(275, 4, '5379', 'Prof. Jacques Bode', 'prof-jacques-bode', 'Alice. \'Well, then,\' the Cat said, waving its tail about in all my limbs very supple By the time.', 166, '463.00', '168.00', '544.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(276, 4, '5512', 'Dr. Juston Buckridge III', 'dr-juston-buckridge-iii', 'Mouse splashed his way through the neighbouring pool--she could hear the name again!\' \'I won\'t.', 124, '324.00', '201.00', '427.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(277, 3, '5724', 'Elenor Wilkinson', 'elenor-wilkinson', 'Soo--oop! Beau--ootiful Soo--oop! Soo--oop of the Queen\'s ears--\' the Rabbit noticed Alice, as she.', 126, '508.00', '298.00', '717.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(278, 1, '5048', 'Mrs. Missouri Carroll', 'mrs-missouri-carroll', 'Alice could see it again, but it was talking in a whisper, half afraid that it is!\' As she said to.', 137, '472.00', '534.00', '549.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(279, 2, '5876', 'Ms. Esther Pacocha', 'ms-esther-pacocha', 'Alice, as she went on at last, and managed to swallow a morsel of the Mock Turtle, and said.', 101, '762.00', '132.00', '407.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(280, 2, '5607', 'Dr. Lonny Dare DDS', 'dr-lonny-dare-dds', 'Dormouse,\' thought Alice; \'I daresay it\'s a very pretty dance,\' said Alice sharply, for she.', 154, '302.00', '851.00', '754.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(281, 5, '5502', 'Libby Hill', 'libby-hill', 'Mock Turtle, and to her usual height. It was the matter on, What would become of me? They\'re.', 145, '649.00', '473.00', '716.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(282, 1, '5416', 'Deven Rau', 'deven-rau', 'Alice angrily. \'It wasn\'t very civil of you to learn?\' \'Well, there was no time to see what was.', 138, '358.00', '862.00', '335.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(283, 3, '5675', 'Sherman Jerde', 'sherman-jerde', 'The chief difficulty Alice found at first she thought of herself, \'I don\'t quite understand you,\'.', 182, '925.00', '109.00', '261.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(284, 3, '5217', 'Kendra Cremin', 'kendra-cremin', 'Alice, who felt very curious thing, and she had hurt the poor little thing howled so, that Alice.', 117, '804.00', '732.00', '547.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(285, 2, '5118', 'Isabelle Leffler', 'isabelle-leffler', 'In another moment that it seemed quite natural); but when the Rabbit began. Alice thought the poor.', 141, '698.00', '752.00', '373.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(286, 1, '5039', 'Nikita Pacocha', 'nikita-pacocha', 'Allow me to introduce some other subject of conversation. While she was trying to box her own mind.', 147, '163.00', '150.00', '131.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(287, 2, '5355', 'Dr. Nikita Hudson', 'dr-nikita-hudson', 'And beat him when he pleases!\' CHORUS. \'Wow! wow! wow!\' \'Here! you may stand down,\' continued the.', 108, '672.00', '556.00', '525.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(288, 3, '5119', 'Verdie Langosh DDS', 'verdie-langosh-dds', 'Hatter, and, just as if his heart would break. She pitied him deeply. \'What is his sorrow?\' she.', 118, '971.00', '629.00', '102.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(289, 1, '5224', 'Miss Lisa Runolfsdottir PhD', 'miss-lisa-runolfsdottir-phd', 'March Hare meekly replied. \'Yes, but I shall ever see you any more!\' And here Alice began to.', 167, '158.00', '187.00', '273.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(290, 4, '5313', 'Dr. Delores Rosenbaum II', 'dr-delores-rosenbaum-ii', 'Alice; and Alice looked at Two. Two began in a ring, and begged the Mouse was speaking, so that.', 137, '534.00', '244.00', '288.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(291, 1, '5379', 'Prof. Jayden Lowe', 'prof-jayden-lowe', 'However, I\'ve got to come once a week: HE taught us Drawling, Stretching, and Fainting in Coils.\'.', 181, '142.00', '525.00', '784.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(292, 5, '5974', 'Pansy Towne V', 'pansy-towne-v', 'I\'ll manage better this time,\' she said, \'than waste it in the other: he came trotting along in a.', 172, '741.00', '371.00', '489.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(293, 6, '5198', 'Mose Schaefer', 'mose-schaefer', 'Alice could see this, as she could, for her to begin.\' He looked at the end of the guinea-pigs.', 167, '853.00', '613.00', '658.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(294, 1, '5586', 'Mrs. Alva Smith', 'mrs-alva-smith', 'She pitied him deeply. \'What is his sorrow?\' she asked the Mock Turtle said with some difficulty.', 156, '247.00', '251.00', '147.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(295, 5, '5451', 'Miss Haylie Kertzmann IV', 'miss-haylie-kertzmann-iv', 'Miss, we\'re doing our best, afore she comes, to--\' At this the whole head appeared, and then.', 157, '154.00', '996.00', '383.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(296, 5, '5492', 'Jessy Rau', 'jessy-rau', 'Alice to herself. \'Of the mushroom,\' said the Caterpillar. \'Well, I\'ve tried to say but \'It.', 108, '304.00', '972.00', '234.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(297, 2, '5128', 'Saige Ward', 'saige-ward', 'I dare say you never to lose YOUR temper!\' \'Hold your tongue, Ma!\' said the King, and the Queen.', 138, '207.00', '862.00', '405.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(298, 5, '5242', 'Kathryn Walker', 'kathryn-walker', 'WILL become of you? I gave her one, they gave him two, You gave us three or more; They all.', 123, '244.00', '447.00', '714.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(299, 1, '5690', 'Mrs. Fanny Schaden', 'mrs-fanny-schaden', 'I\'ll go round a deal too far off to trouble myself about you: you must manage the best of.', 185, '320.00', '137.00', '536.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(300, 3, '5111', 'Efrain Haley', 'efrain-haley', 'Gryphon: and Alice looked at Two. Two began in a very interesting dance to watch,\' said Alice.', 197, '404.00', '629.00', '126.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(301, 4, '5761', 'Adalberto Lueilwitz', 'adalberto-lueilwitz', 'The pepper when he sneezes; For he can EVEN finish, if he would deny it too: but the tops of the.', 181, '317.00', '843.00', '686.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(302, 2, '5727', 'Vaughn Rau', 'vaughn-rau', 'Caterpillar. Alice folded her hands, and was just possible it had finished this short speech, they.', 132, '932.00', '377.00', '403.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(303, 4, '5384', 'Meta Armstrong', 'meta-armstrong', 'Rabbit whispered in reply, \'for fear they should forget them before the trial\'s over!\' thought.', 104, '792.00', '410.00', '738.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(304, 3, '5580', 'Duane Blanda II', 'duane-blanda-ii', 'March Hare was said to herself, \'I don\'t see how the game was going to do THAT in a few minutes to.', 184, '458.00', '134.00', '304.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(305, 5, '5822', 'Bernita Daniel', 'bernita-daniel', 'Gryphon: and it set to work very diligently to write with one of the table. \'Nothing can be.', 160, '844.00', '981.00', '154.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(306, 2, '5079', 'Coleman Kessler', 'coleman-kessler', 'Hatter: \'it\'s very easy to know your history, she do.\' \'I\'ll tell it her,\' said the Dormouse.', 169, '841.00', '795.00', '732.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(307, 5, '5699', 'Jordane Kassulke', 'jordane-kassulke', 'Who ever saw one that size? Why, it fills the whole pack of cards, after all. I needn\'t be so.', 104, '772.00', '547.00', '425.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(308, 6, '5801', 'Prof. Rene Langosh II', 'prof-rene-langosh-ii', 'Queen. \'I haven\'t the least notice of them were animals, and some \'unimportant.\' Alice could see.', 145, '161.00', '575.00', '580.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(309, 5, '5125', 'Robb Waelchi', 'robb-waelchi', 'Will you, won\'t you, will you, old fellow?\' The Mock Turtle\'s Story \'You can\'t think how glad I am.', 139, '668.00', '756.00', '591.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(310, 5, '5257', 'Evelyn Casper', 'evelyn-casper', 'I\'d nearly forgotten that I\'ve got to see it quite plainly through the neighbouring pool--she.', 110, '272.00', '328.00', '625.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(311, 4, '5138', 'Grayce Maggio', 'grayce-maggio', 'Alice began in a sulky tone, as it went, \'One side will make you a song?\' \'Oh, a song, please, if.', 166, '595.00', '234.00', '150.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(312, 4, '5470', 'Johnny Zulauf', 'johnny-zulauf', 'I think?\' \'I had NOT!\' cried the Gryphon, and the bright eager eyes were looking over their heads.', 197, '660.00', '112.00', '639.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(313, 2, '5099', 'Alan Hamill', 'alan-hamill', 'MORE than nothing.\' \'Nobody asked YOUR opinion,\' said Alice. \'I don\'t see,\' said the White Rabbit.', 190, '470.00', '174.00', '498.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(314, 6, '5749', 'Glenda Muller', 'glenda-muller', 'YOU like cats if you could keep it to make personal remarks,\' Alice said to the part about her.', 135, '984.00', '892.00', '230.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(315, 4, '5409', 'Miss Orpha Oberbrunner PhD', 'miss-orpha-oberbrunner-phd', 'You know the way the people that walk with their fur clinging close to her: its face in some.', 152, '883.00', '256.00', '526.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(316, 3, '5649', 'Loma Prohaska DDS', 'loma-prohaska-dds', 'Said the mouse to the waving of the birds hurried off to trouble myself about you: you must manage.', 159, '986.00', '878.00', '410.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(317, 3, '5516', 'Naomie Crona V', 'naomie-crona-v', 'Seaography: then Drawling--the Drawling-master was an uncomfortably sharp chin. However, she did.', 156, '563.00', '839.00', '154.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(318, 2, '5578', 'Miss Audreanne Grant Sr.', 'miss-audreanne-grant-sr', 'Mouse replied rather impatiently: \'any shrimp could have told you butter wouldn\'t suit the works!\'.', 101, '412.00', '637.00', '494.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(319, 2, '5858', 'Gerry Lind', 'gerry-lind', 'Alice indignantly. \'Ah! then yours wasn\'t a bit hurt, and she could see this, as she could, and.', 111, '144.00', '241.00', '215.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(320, 4, '5694', 'Xander Kohler', 'xander-kohler', 'Duchess, digging her sharp little chin into Alice\'s head. \'Is that the pebbles were all writing.', 109, '729.00', '254.00', '439.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(321, 5, '5783', 'Rosa Schiller', 'rosa-schiller', 'So you see, Miss, this here ought to have lessons to learn! No, I\'ve made up my mind about it; if.', 159, '763.00', '350.00', '127.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(322, 1, '5376', 'Vilma Schimmel', 'vilma-schimmel', 'She was close behind it when she caught it, and then turned to the Queen, in a mournful tone, \'he.', 185, '134.00', '902.00', '315.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(323, 1, '5177', 'Green Bailey', 'green-bailey', 'Exactly as we were. My notion was that she had succeeded in bringing herself down to look down and.', 100, '690.00', '950.00', '491.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(324, 6, '5491', 'Wilber Rice', 'wilber-rice', 'The first question of course had to ask his neighbour to tell its age, there was no time to be.', 153, '696.00', '961.00', '654.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(325, 3, '5655', 'Haleigh Predovic II', 'haleigh-predovic-ii', 'HIS time of life. The King\'s argument was, that anything that looked like the Mock Turtle yet?\'.', 155, '524.00', '675.00', '82.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(326, 6, '5684', 'Gloria Cruickshank', 'gloria-cruickshank', 'I don\'t know,\' he went on, without attending to her; \'but those serpents! There\'s no pleasing.', 177, '942.00', '143.00', '763.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(327, 4, '5624', 'Prof. Camron Kovacek Jr.', 'prof-camron-kovacek-jr', 'There are no mice in the middle of her age knew the name again!\' \'I won\'t have any rules in.', 182, '535.00', '626.00', '746.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(328, 6, '5094', 'Mr. Austen Denesik', 'mr-austen-denesik', 'Queen of Hearts were seated on their hands and feet at once, in a thick wood. \'The first thing.', 114, '358.00', '402.00', '671.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(329, 5, '5510', 'Donnell Marks', 'donnell-marks', 'Bill, the Lizard) could not tell whether they were playing the Queen furiously, throwing an.', 111, '585.00', '659.00', '236.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(330, 1, '5622', 'Prof. Jairo Trantow', 'prof-jairo-trantow', 'King replied. Here the other arm curled round her at the door and found that, as nearly as large.', 121, '672.00', '999.00', '792.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(331, 2, '5625', 'Ms. Elda Stracke', 'ms-elda-stracke', 'The long grass rustled at her hands, and was just in time to begin with; and being ordered about.', 150, '555.00', '609.00', '476.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(332, 2, '5277', 'Zola Rippin', 'zola-rippin', 'I used--and I don\'t keep the same thing a Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Of.', 111, '713.00', '306.00', '686.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(333, 4, '5440', 'Mr. Van Ledner', 'mr-van-ledner', 'Alice for some way, and nothing seems to like her, down here, that I should be free of them can.', 130, '526.00', '864.00', '795.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(334, 6, '5412', 'Lauryn Stanton', 'lauryn-stanton', 'There was not easy to take MORE than nothing.\' \'Nobody asked YOUR opinion,\' said Alice. \'And where.', 157, '908.00', '313.00', '459.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(335, 5, '5526', 'Monte Schulist', 'monte-schulist', 'Gryphon, the squeaking of the what?\' said the March Hare moved into the jury-box, and saw that, in.', 123, '237.00', '161.00', '202.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(336, 6, '5897', 'Mr. Sven Monahan III', 'mr-sven-monahan-iii', 'King. (The jury all looked puzzled.) \'He must have prizes.\' \'But who has won?\' This question the.', 139, '708.00', '608.00', '573.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(337, 5, '5955', 'Delores Huel', 'delores-huel', 'Alice. It looked good-natured, she thought: still it was all about, and make out that the hedgehog.', 184, '596.00', '807.00', '260.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(338, 4, '5143', 'Devonte Shields Sr.', 'devonte-shields-sr', 'March.\' As she said to the jury, who instantly made a dreadfully ugly child: but it was talking in.', 123, '693.00', '601.00', '780.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(339, 2, '5103', 'Ayana King', 'ayana-king', 'It sounded an excellent plan, no doubt, and very neatly and simply arranged; the only one way up.', 127, '407.00', '432.00', '95.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(340, 6, '5689', 'Ian Romaguera', 'ian-romaguera', 'I growl when I\'m pleased, and wag my tail when I\'m angry. Therefore I\'m mad.\' \'I call it purring.', 114, '870.00', '893.00', '161.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(341, 5, '5401', 'Junius Smith', 'junius-smith', 'So she went on, \'you see, a dog growls when it\'s angry, and wags its tail when it\'s angry, and.', 136, '223.00', '801.00', '401.00', 1, 1, '2021-02-09 01:32:53', '2021-02-09 01:32:53'),
(342, 6, '5645', 'Mrs. Janis Durgan Jr.', 'mrs-janis-durgan-jr', 'March Hare took the place of the court, \'Bring me the truth: did you call him Tortoise, if he had.', 174, '114.00', '513.00', '458.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(343, 6, '5848', 'Lane Harber', 'lane-harber', 'Poor Alice! It was so full of the what?\' said the Hatter: \'as the things being alive; for.', 131, '326.00', '137.00', '73.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(344, 2, '5794', 'Mr. Tevin Grady PhD', 'mr-tevin-grady-phd', 'King, and he went on again:-- \'You may go,\' said the King. \'I can\'t explain it,\' said Alice.', 179, '440.00', '128.00', '768.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(345, 4, '5867', 'Margarita Denesik', 'margarita-denesik', 'Caterpillar sternly. \'Explain yourself!\' \'I can\'t remember half of fright and half believed.', 191, '144.00', '358.00', '463.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(346, 2, '5091', 'Kay Bode', 'kay-bode', 'Queen, \'Really, my dear, YOU must cross-examine the next witness!\' said the Dormouse; \'VERY ill.\'.', 133, '697.00', '963.00', '354.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(347, 4, '5135', 'Jamir Bradtke', 'jamir-bradtke', 'Alice appeared, she was up to them she heard a little irritated at the door--I do wish they COULD!.', 165, '348.00', '714.00', '450.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(348, 1, '5917', 'Stephany Adams', 'stephany-adams', 'WOULD put their heads down and saying \"Come up again, dear!\" I shall have to beat them off, and.', 186, '323.00', '705.00', '740.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(349, 5, '5241', 'Darion Kuphal', 'darion-kuphal', 'I don\'t know,\' he went on eagerly. \'That\'s enough about lessons,\' the Gryphon never learnt it.\'.', 112, '281.00', '241.00', '550.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(350, 6, '5455', 'Mr. Enoch Kautzer Jr.', 'mr-enoch-kautzer-jr', 'I never knew so much into the garden. Then she went on, spreading out the Fish-Footman was gone.', 100, '229.00', '559.00', '267.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(351, 3, '5933', 'Mr. Kyleigh Torphy', 'mr-kyleigh-torphy', 'Footman remarked, \'till tomorrow--\' At this moment the King, looking round the court was in a.', 128, '217.00', '197.00', '749.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(352, 1, '5390', 'Prof. Jedidiah Cremin Sr.', 'prof-jedidiah-cremin-sr', 'HAVE tasted eggs, certainly,\' said Alice, \'and those twelve creatures,\' (she was obliged to write.', 184, '869.00', '413.00', '247.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(353, 2, '5044', 'Libby Dickens', 'libby-dickens', 'Alice. \'Well, then,\' the Cat went on, taking first one side and up I goes like a steam-engine when.', 148, '319.00', '368.00', '166.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(354, 6, '5160', 'Johnny Mueller', 'johnny-mueller', 'BUSY BEE,\" but it makes me grow smaller, I can kick a little!\' She drew her foot as far as they.', 122, '731.00', '972.00', '529.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(355, 3, '5315', 'Maximilian Goyette', 'maximilian-goyette', 'I needn\'t be afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe it,\' said.', 129, '771.00', '815.00', '461.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(356, 5, '5969', 'Kayleigh Kohler', 'kayleigh-kohler', 'I can\'t show it you myself,\' the Mock Turtle is.\' \'It\'s the Cheshire Cat sitting on the look-out.', 122, '964.00', '815.00', '183.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(357, 3, '5360', 'Trace Lehner', 'trace-lehner', 'Majesty!\' the soldiers had to run back into the wood. \'It\'s the first figure,\' said the Duchess.', 198, '527.00', '130.00', '111.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(358, 3, '5526', 'Mr. Tyshawn Reynolds', 'mr-tyshawn-reynolds', 'However, on the door of which was a very interesting dance to watch,\' said Alice, in a dreamy sort.', 132, '956.00', '576.00', '345.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(359, 6, '5470', 'Kiana Hansen', 'kiana-hansen', 'Conqueror, whose cause was favoured by the prisoner to--to somebody.\' \'It must have prizes.\' \'But.', 125, '226.00', '605.00', '395.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(360, 3, '5601', 'Francisco Hettinger', 'francisco-hettinger', 'Bill,\' she gave a look askance-- Said he thanked the whiting kindly, but he would not join the.', 152, '417.00', '741.00', '122.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(361, 2, '5425', 'Mallie Glover', 'mallie-glover', 'Alice angrily. \'It wasn\'t very civil of you to offer it,\' said Alice. \'Exactly so,\' said Alice.', 141, '511.00', '260.00', '246.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(362, 2, '5434', 'Dahlia Wunsch', 'dahlia-wunsch', 'Duchess. An invitation for the Dormouse,\' thought Alice; \'only, as it\'s asleep, I suppose I ought.', 168, '734.00', '315.00', '607.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(363, 5, '5032', 'Kyleigh Jenkins', 'kyleigh-jenkins', 'Alice remarked. \'Right, as usual,\' said the Caterpillar. \'Is that the hedgehog had unrolled.', 162, '849.00', '438.00', '679.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(364, 4, '5082', 'Ayden Hammes', 'ayden-hammes', 'Pigeon in a hot tureen! Who for such dainties would not give all else for two reasons. First.', 101, '880.00', '611.00', '501.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(365, 6, '5751', 'Ms. Elisabeth Torphy III', 'ms-elisabeth-torphy-iii', 'I\'ve tried hedges,\' the Pigeon went on, \'What\'s your name, child?\' \'My name is Alice, so please.', 177, '998.00', '416.00', '298.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(366, 3, '5499', 'Ms. Karolann Little', 'ms-karolann-little', 'WILL do next! As for pulling me out of THIS!\' (Sounds of more broken glass.) \'Now tell me, Pat.', 112, '108.00', '242.00', '762.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54'),
(367, 1, '5708', 'Meagan Hane', 'meagan-hane', 'Alice, as she spoke. Alice did not look at it!\' This speech caused a remarkable sensation among.', 103, '952.00', '701.00', '594.00', 1, 1, '2021-02-09 01:32:54', '2021-02-09 01:32:54');

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
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `category_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 11, 1, NULL, NULL),
(2, 13, 5, NULL, NULL),
(3, 15, 6, NULL, NULL),
(4, 11, 7, NULL, NULL),
(5, 11, 8, NULL, NULL),
(6, 12, 8, NULL, NULL),
(7, 12, 10, NULL, NULL),
(8, 11, 11, NULL, NULL),
(9, 12, 12, NULL, NULL),
(10, 16, 12, NULL, NULL),
(11, 19, 12, NULL, NULL),
(12, 21, 12, NULL, NULL),
(13, 23, 13, NULL, NULL),
(14, 25, 13, NULL, NULL),
(15, 22, 14, NULL, NULL),
(16, 26, 14, NULL, NULL),
(17, 23, 15, NULL, NULL),
(18, 25, 15, NULL, NULL),
(19, 12, 15, NULL, NULL),
(20, 21, 15, NULL, NULL),
(21, 23, 16, NULL, NULL),
(22, 25, 16, NULL, NULL),
(23, 12, 16, NULL, NULL),
(24, 24, 16, NULL, NULL),
(25, 21, 16, NULL, NULL),
(26, 23, 17, NULL, NULL),
(27, 25, 17, NULL, NULL),
(28, 12, 17, NULL, NULL),
(29, 21, 17, NULL, NULL),
(30, 153, 1, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(31, 118, 203, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(32, 128, 17, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(33, 24, 196, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(34, 126, 267, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(35, 148, 134, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(36, 146, 73, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(37, 127, 340, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(38, 134, 252, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(39, 20, 286, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(40, 108, 135, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(41, 150, 299, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(42, 18, 114, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(43, 105, 110, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(44, 152, 78, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(45, 23, 38, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(46, 142, 165, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(47, 123, 271, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(48, 139, 8, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(49, 106, 117, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(50, 149, 254, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(51, 18, 42, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(52, 21, 346, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(53, 139, 351, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(54, 109, 271, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(55, 104, 254, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(56, 116, 88, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(57, 118, 288, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(58, 127, 89, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(59, 142, 337, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(60, 121, 301, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(61, 139, 292, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(62, 13, 224, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(63, 137, 112, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(64, 144, 26, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(65, 1, 117, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(66, 19, 196, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(67, 129, 94, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(68, 113, 267, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(69, 19, 155, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(70, 137, 100, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(71, 134, 218, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(72, 16, 294, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(73, 143, 308, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(74, 108, 309, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(75, 21, 125, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(76, 113, 315, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(77, 25, 203, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(78, 145, 187, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(79, 23, 269, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(80, 107, 106, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(81, 146, 81, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(82, 106, 63, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(83, 115, 253, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(84, 12, 178, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(85, 123, 96, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(86, 117, 170, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(87, 148, 156, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(88, 116, 74, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(89, 153, 79, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(90, 133, 155, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(91, 149, 354, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(92, 107, 124, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(93, 25, 341, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(94, 129, 111, '2021-02-09 01:55:51', '2021-02-09 01:55:51'),
(95, 149, 352, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(96, 153, 65, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(97, 111, 173, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(98, 145, 313, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(99, 106, 211, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(100, 106, 18, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(101, 106, 199, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(102, 116, 101, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(103, 19, 235, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(104, 12, 303, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(105, 21, 195, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(106, 122, 91, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(107, 118, 11, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(108, 112, 78, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(109, 13, 34, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(110, 1, 10, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(111, 16, 218, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(112, 123, 171, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(113, 25, 125, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(114, 139, 128, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(115, 149, 52, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(116, 147, 271, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(117, 140, 177, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(118, 13, 149, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(119, 127, 1, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(120, 14, 358, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(121, 108, 46, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(122, 25, 364, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(123, 12, 230, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(124, 128, 350, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(125, 107, 25, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(126, 117, 152, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(127, 24, 250, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(128, 127, 292, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(129, 137, 21, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(130, 121, 237, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(131, 118, 259, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(132, 124, 166, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(133, 23, 81, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(134, 110, 250, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(135, 148, 159, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(136, 132, 264, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(137, 133, 88, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(138, 21, 316, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(139, 131, 237, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(140, 122, 287, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(141, 133, 336, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(142, 111, 357, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(143, 126, 191, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(144, 147, 324, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(145, 129, 29, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(146, 130, 291, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(147, 111, 73, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(148, 134, 50, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(149, 18, 346, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(150, 22, 270, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(151, 137, 217, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(152, 22, 85, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(153, 24, 31, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(154, 146, 276, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(155, 144, 240, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(156, 1, 158, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(157, 152, 276, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(158, 124, 326, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(159, 121, 21, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(160, 112, 146, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(161, 143, 102, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(162, 142, 10, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(163, 15, 185, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(164, 123, 57, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(165, 153, 359, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(166, 148, 131, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(167, 20, 193, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(168, 26, 363, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(169, 138, 348, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(170, 11, 24, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(171, 119, 291, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(172, 15, 247, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(173, 138, 283, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(174, 114, 202, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(175, 151, 206, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(176, 119, 257, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(177, 107, 327, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(178, 108, 275, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(179, 25, 274, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(180, 12, 366, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(181, 22, 103, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(182, 151, 355, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(183, 112, 346, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(184, 141, 71, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(185, 108, 359, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(186, 21, 366, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(187, 22, 280, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(188, 23, 37, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(189, 149, 199, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(190, 134, 114, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(191, 137, 309, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(192, 143, 238, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(193, 141, 158, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(194, 116, 288, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(195, 122, 300, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(196, 24, 260, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(197, 149, 190, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(198, 108, 319, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(199, 128, 277, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(200, 105, 242, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(201, 11, 187, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(202, 130, 133, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(203, 147, 249, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(204, 144, 278, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(205, 104, 56, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(206, 112, 287, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(207, 150, 26, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(208, 108, 175, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(209, 104, 294, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(210, 15, 309, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(211, 11, 15, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(212, 125, 209, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(213, 142, 314, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(214, 125, 148, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(215, 19, 190, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(216, 11, 329, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(217, 20, 251, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(218, 150, 308, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(219, 146, 238, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(220, 134, 137, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(221, 108, 11, '2021-02-09 01:55:52', '2021-02-09 01:55:52'),
(222, 141, 161, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(223, 23, 196, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(224, 26, 241, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(225, 122, 224, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(226, 133, 69, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(227, 21, 17, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(228, 135, 226, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(229, 147, 174, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(230, 111, 303, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(231, 107, 260, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(232, 133, 242, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(233, 153, 228, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(234, 26, 126, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(235, 141, 41, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(236, 122, 54, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(237, 132, 41, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(238, 149, 19, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(239, 120, 310, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(240, 135, 185, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(241, 1, 344, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(242, 106, 105, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(243, 147, 144, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(244, 131, 51, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(245, 122, 126, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(246, 22, 181, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(247, 145, 346, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(248, 112, 140, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(249, 130, 160, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(250, 132, 15, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(251, 125, 76, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(252, 145, 180, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(253, 152, 63, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(254, 149, 76, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(255, 24, 202, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(256, 116, 23, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(257, 128, 291, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(258, 136, 305, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(259, 128, 294, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(260, 130, 350, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(261, 21, 146, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(262, 140, 269, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(263, 142, 202, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(264, 128, 83, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(265, 23, 118, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(266, 105, 288, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(267, 129, 211, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(268, 141, 170, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(269, 13, 366, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(270, 139, 257, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(271, 124, 55, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(272, 123, 116, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(273, 24, 126, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(274, 126, 238, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(275, 148, 204, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(276, 115, 348, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(277, 23, 185, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(278, 140, 346, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(279, 153, 144, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(280, 135, 59, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(281, 23, 357, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(282, 24, 188, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(283, 22, 256, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(284, 114, 29, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(285, 139, 364, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(286, 120, 53, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(287, 20, 120, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(288, 18, 246, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(289, 142, 13, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(290, 120, 257, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(291, 135, 223, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(292, 20, 163, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(293, 142, 115, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(294, 135, 339, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(295, 109, 294, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(296, 119, 82, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(297, 105, 307, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(298, 123, 154, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(299, 128, 248, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(300, 130, 235, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(301, 120, 212, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(302, 125, 19, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(303, 125, 346, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(304, 139, 128, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(305, 134, 69, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(306, 110, 142, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(307, 146, 56, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(308, 23, 132, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(309, 153, 108, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(310, 133, 87, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(311, 124, 64, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(312, 22, 223, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(313, 115, 222, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(314, 115, 26, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(315, 115, 219, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(316, 23, 231, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(317, 136, 322, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(318, 136, 217, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(319, 112, 98, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(320, 24, 102, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(321, 129, 291, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(322, 116, 238, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(323, 118, 323, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(324, 143, 58, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(325, 139, 360, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(326, 115, 281, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(327, 135, 184, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(328, 118, 72, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(329, 139, 18, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(330, 143, 289, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(331, 126, 269, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(332, 139, 363, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(333, 125, 200, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(334, 141, 199, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(335, 105, 105, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(336, 22, 73, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(337, 139, 209, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(338, 132, 36, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(339, 136, 304, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(340, 131, 194, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(341, 129, 150, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(342, 130, 284, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(343, 11, 273, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(344, 107, 308, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(345, 110, 79, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(346, 122, 290, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(347, 123, 303, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(348, 114, 112, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(349, 106, 133, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(350, 142, 301, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(351, 125, 331, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(352, 22, 93, '2021-02-09 01:55:53', '2021-02-09 01:55:53'),
(353, 115, 56, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(354, 14, 326, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(355, 20, 86, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(356, 120, 306, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(357, 136, 32, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(358, 127, 332, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(359, 127, 350, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(360, 118, 261, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(361, 21, 268, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(362, 131, 286, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(363, 121, 28, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(364, 146, 31, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(365, 15, 110, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(366, 22, 159, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(367, 148, 196, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(368, 112, 127, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(369, 143, 124, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(370, 21, 258, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(371, 18, 93, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(372, 16, 253, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(373, 124, 79, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(374, 13, 49, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(375, 141, 295, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(376, 147, 333, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(377, 131, 99, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(378, 138, 72, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(379, 148, 326, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(380, 130, 135, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(381, 18, 270, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(382, 134, 31, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(383, 143, 366, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(384, 143, 125, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(385, 126, 247, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(386, 18, 29, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(387, 26, 225, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(388, 110, 200, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(389, 128, 207, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(390, 131, 167, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(391, 149, 104, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(392, 23, 156, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(393, 20, 303, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(394, 26, 99, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(395, 25, 305, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(396, 23, 230, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(397, 12, 136, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(398, 143, 335, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(399, 146, 134, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(400, 115, 48, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(401, 110, 62, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(402, 115, 296, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(403, 122, 47, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(404, 145, 36, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(405, 137, 40, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(406, 113, 237, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(407, 115, 131, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(408, 142, 34, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(409, 140, 174, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(410, 136, 247, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(411, 109, 278, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(412, 21, 338, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(413, 126, 51, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(414, 11, 230, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(415, 26, 70, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(416, 108, 118, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(417, 140, 330, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(418, 113, 114, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(419, 118, 84, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(420, 12, 364, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(421, 127, 258, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(422, 120, 342, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(423, 127, 13, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(424, 140, 241, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(425, 14, 233, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(426, 133, 300, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(427, 115, 116, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(428, 113, 68, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(429, 135, 8, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(430, 107, 66, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(431, 118, 28, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(432, 13, 154, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(433, 139, 236, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(434, 147, 291, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(435, 121, 296, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(436, 105, 181, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(437, 104, 143, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(438, 144, 128, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(439, 131, 137, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(440, 131, 248, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(441, 129, 158, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(442, 24, 131, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(443, 125, 39, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(444, 138, 274, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(445, 135, 130, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(446, 149, 323, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(447, 153, 5, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(448, 127, 14, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(449, 19, 55, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(450, 140, 110, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(451, 12, 290, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(452, 138, 106, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(453, 150, 13, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(454, 151, 296, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(455, 16, 112, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(456, 117, 141, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(457, 125, 224, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(458, 104, 281, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(459, 106, 196, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(460, 105, 212, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(461, 124, 94, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(462, 153, 27, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(463, 144, 94, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(464, 25, 191, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(465, 144, 322, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(466, 107, 328, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(467, 107, 29, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(468, 116, 315, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(469, 136, 314, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(470, 13, 87, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(471, 112, 80, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(472, 21, 185, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(473, 126, 292, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(474, 25, 23, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(475, 127, 173, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(476, 20, 181, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(477, 26, 272, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(478, 139, 126, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(479, 147, 128, '2021-02-09 01:55:54', '2021-02-09 01:55:54'),
(480, 115, 165, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(481, 105, 263, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(482, 133, 116, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(483, 24, 303, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(484, 115, 157, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(485, 135, 31, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(486, 112, 136, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(487, 128, 217, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(488, 117, 192, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(489, 115, 116, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(490, 11, 56, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(491, 133, 349, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(492, 23, 285, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(493, 139, 84, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(494, 117, 269, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(495, 118, 266, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(496, 138, 119, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(497, 140, 305, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(498, 145, 346, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(499, 134, 77, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(500, 25, 344, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(501, 125, 189, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(502, 19, 5, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(503, 120, 40, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(504, 15, 208, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(505, 24, 308, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(506, 140, 359, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(507, 15, 277, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(508, 127, 188, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(509, 153, 271, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(510, 127, 258, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(511, 126, 161, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(512, 141, 64, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(513, 14, 224, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(514, 121, 200, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(515, 130, 183, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(516, 135, 40, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(517, 150, 131, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(518, 23, 270, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(519, 117, 290, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(520, 109, 187, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(521, 124, 134, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(522, 26, 36, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(523, 142, 78, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(524, 108, 301, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(525, 124, 203, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(526, 115, 255, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(527, 117, 212, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(528, 150, 321, '2021-02-09 01:55:55', '2021-02-09 01:55:55'),
(529, 108, 231, '2021-02-09 01:55:55', '2021-02-09 01:55:55');

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
(14, 12, 'products/3K7u4amne1gQVuBoE9yhjF9Nl.jpg', '2020-12-07 22:56:44', '2020-12-07 22:56:44'),
(15, 13, 'products/PSNz2ctWc8yQnEO2VJ8ANC7Mr.jpg', '2021-02-08 22:52:19', '2021-02-08 22:52:19'),
(16, 13, 'products/dDUfHAm8flAfZlRT3ZhQqCpLs.jpg', '2021-02-08 22:52:20', '2021-02-08 22:52:20'),
(17, 13, 'products/V51qo34n5IsJs0jwqTPDsI4gk.jpg', '2021-02-08 22:52:26', '2021-02-08 22:52:26'),
(18, 13, 'products/68ELc7hwqkYATeUoMa88YTKAT.jpg', '2021-02-08 22:52:27', '2021-02-08 22:52:27'),
(19, 13, 'products/Kn7pxU9722KhLra4QlDXflgdJ.jpg', '2021-02-08 22:52:27', '2021-02-08 22:52:27'),
(20, 13, 'products/YJ65tZg5b6f0dmM4xWtm6UYD9.jpg', '2021-02-08 22:52:27', '2021-02-08 22:52:27'),
(21, 14, 'products/9DZjMfWWBhSv0nI7cITJT2x1q.jpg', '2021-02-08 23:01:21', '2021-02-08 23:01:21'),
(22, 14, 'products/2AFKAQWSsm5iLBhvc1qxYT305.jpg', '2021-02-08 23:01:21', '2021-02-08 23:01:21'),
(23, 15, 'products/TlPX3m0jjlir1XwHTB9jxhQXP.jpg', '2021-02-08 23:23:50', '2021-02-08 23:23:50'),
(24, 15, 'products/9ePzaTPeRUXTitEnD1kkG8PeP.jpg', '2021-02-08 23:23:50', '2021-02-08 23:23:50'),
(25, 16, 'products/CvV7RyPHjUSjHz8slC5My5PeO.jpg', '2021-02-08 23:26:22', '2021-02-08 23:26:22'),
(26, 16, 'products/lC49vWAdLsxXtM8W7MDCoXKm2.jpg', '2021-02-08 23:26:22', '2021-02-08 23:26:22'),
(27, 16, 'products/vOqAMGZbwmooilg2vLfCtw2B2.jpg', '2021-02-08 23:26:26', '2021-02-08 23:26:26'),
(28, 16, 'products/CQxIYvK96Y03KK0jYdcw9o6vn.jpg', '2021-02-08 23:26:26', '2021-02-08 23:26:26'),
(29, 17, 'products/cAcRjPob2iHtn5lzbZR98Ex0R.jpg', '2021-02-08 23:27:45', '2021-02-08 23:27:45'),
(30, 17, 'products/bryCz7cyf7foJ7KZG4GZfQr5P.jpg', '2021-02-08 23:27:46', '2021-02-08 23:27:46'),
(31, 17, 'products/yuaffCFSOkmF1orbg4sSGGPM3.jpg', '2021-02-08 23:27:48', '2021-02-08 23:27:48'),
(32, 17, 'products/sbv0gIRRDJyGcsBUare61L6oi.jpg', '2021-02-08 23:27:49', '2021-02-08 23:27:49'),
(33, 17, 'products/F8hcaAD6wRkcX9Myz9CLcmz5A.png', '2021-02-08 23:27:58', '2021-02-08 23:27:58'),
(34, 17, 'products/GDJdogLTZwVwrPW1pSP2h8JRp.jpg', '2021-02-08 23:27:59', '2021-02-08 23:27:59'),
(35, 293, 'products/13.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(36, 28, 'products/13.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(37, 363, 'products/6.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(38, 29, 'products/4.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(39, 264, 'products/1.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(40, 69, 'products/9.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(41, 199, 'products/7.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(42, 226, 'products/11.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(43, 78, 'products/5.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(44, 184, 'products/4.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(45, 319, 'products/1.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(46, 148, 'products/2.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(47, 231, 'products/11.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(48, 127, 'products/11.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(49, 103, 'products/11.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(50, 292, 'products/7.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(51, 137, 'products/8.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(52, 365, 'products/17.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(53, 331, 'products/15.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(54, 168, 'products/4.jpg', '2021-02-09 02:09:16', '2021-02-09 02:09:16'),
(55, 65, 'products/1.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(56, 71, 'products/20.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(57, 294, 'products/1.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(58, 43, 'products/4.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(59, 264, 'products/1.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(60, 152, 'products/15.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(61, 31, 'products/4.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(62, 118, 'products/14.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(63, 169, 'products/14.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(64, 323, 'products/6.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(65, 25, 'products/12.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(66, 365, 'products/11.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(67, 321, 'products/2.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(68, 229, 'products/10.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(69, 318, 'products/11.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(70, 268, 'products/17.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(71, 24, 'products/15.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(72, 64, 'products/15.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(73, 240, 'products/16.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(74, 189, 'products/9.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(75, 62, 'products/12.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(76, 285, 'products/4.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(77, 347, 'products/11.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(78, 321, 'products/16.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(79, 288, 'products/7.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(80, 216, 'products/16.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(81, 282, 'products/4.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(82, 329, 'products/4.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(83, 112, 'products/15.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(84, 108, 'products/1.jpg', '2021-02-09 02:13:10', '2021-02-09 02:13:10'),
(85, 66, 'products/8.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(86, 208, 'products/13.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(87, 172, 'products/20.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(88, 346, 'products/16.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(89, 263, 'products/13.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(90, 361, 'products/3.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(91, 190, 'products/12.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(92, 194, 'products/7.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(93, 66, 'products/19.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(94, 185, 'products/8.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(95, 350, 'products/16.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(96, 253, 'products/6.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(97, 322, 'products/6.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(98, 35, 'products/15.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(99, 293, 'products/17.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(100, 239, 'products/8.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(101, 13, 'products/7.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(102, 216, 'products/6.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(103, 288, 'products/13.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(104, 326, 'products/18.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(105, 362, 'products/2.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(106, 44, 'products/5.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(107, 6, 'products/19.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(108, 120, 'products/19.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(109, 336, 'products/18.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(110, 14, 'products/14.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(111, 154, 'products/12.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(112, 117, 'products/14.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(113, 116, 'products/4.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(114, 295, 'products/8.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(115, 173, 'products/12.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(116, 351, 'products/10.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(117, 240, 'products/11.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(118, 177, 'products/1.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(119, 242, 'products/16.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(120, 242, 'products/3.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(121, 101, 'products/3.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(122, 43, 'products/1.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(123, 307, 'products/20.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(124, 49, 'products/4.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(125, 177, 'products/1.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(126, 121, 'products/14.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(127, 100, 'products/2.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(128, 20, 'products/11.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(129, 11, 'products/2.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(130, 276, 'products/20.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(131, 88, 'products/14.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(132, 146, 'products/8.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(133, 255, 'products/1.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(134, 328, 'products/1.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(135, 316, 'products/2.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(136, 69, 'products/14.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(137, 251, 'products/6.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(138, 41, 'products/20.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(139, 15, 'products/17.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(140, 22, 'products/8.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(141, 47, 'products/16.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(142, 147, 'products/16.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(143, 225, 'products/3.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(144, 242, 'products/7.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(145, 35, 'products/6.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(146, 339, 'products/19.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(147, 275, 'products/4.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(148, 212, 'products/19.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(149, 275, 'products/10.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(150, 109, 'products/1.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(151, 156, 'products/16.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(152, 255, 'products/17.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(153, 206, 'products/12.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(154, 250, 'products/11.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(155, 266, 'products/7.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(156, 57, 'products/10.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(157, 23, 'products/18.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(158, 49, 'products/2.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(159, 24, 'products/10.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(160, 96, 'products/20.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(161, 221, 'products/6.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(162, 210, 'products/3.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(163, 161, 'products/2.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(164, 212, 'products/17.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(165, 249, 'products/16.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(166, 303, 'products/17.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(167, 138, 'products/2.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(168, 284, 'products/7.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(169, 359, 'products/6.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(170, 29, 'products/3.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(171, 287, 'products/2.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(172, 130, 'products/4.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(173, 14, 'products/2.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(174, 144, 'products/12.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(175, 53, 'products/15.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(176, 316, 'products/3.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(177, 295, 'products/2.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(178, 240, 'products/17.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(179, 72, 'products/1.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(180, 259, 'products/2.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(181, 158, 'products/13.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(182, 330, 'products/11.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(183, 162, 'products/13.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(184, 302, 'products/13.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(185, 219, 'products/14.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(186, 120, 'products/3.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(187, 68, 'products/7.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(188, 83, 'products/9.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(189, 333, 'products/2.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(190, 166, 'products/18.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(191, 137, 'products/19.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(192, 187, 'products/18.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(193, 34, 'products/14.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(194, 47, 'products/13.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(195, 353, 'products/13.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(196, 86, 'products/8.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(197, 114, 'products/10.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(198, 37, 'products/20.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(199, 316, 'products/4.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(200, 129, 'products/17.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(201, 233, 'products/19.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(202, 57, 'products/8.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(203, 144, 'products/1.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(204, 181, 'products/6.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(205, 148, 'products/7.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(206, 300, 'products/20.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(207, 302, 'products/19.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(208, 285, 'products/4.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(209, 87, 'products/12.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(210, 256, 'products/16.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(211, 191, 'products/15.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(212, 148, 'products/10.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(213, 319, 'products/4.jpg', '2021-02-09 02:13:11', '2021-02-09 02:13:11'),
(214, 196, 'products/1.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(215, 354, 'products/17.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(216, 274, 'products/11.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(217, 70, 'products/1.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(218, 337, 'products/7.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(219, 349, 'products/4.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(220, 364, 'products/14.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(221, 324, 'products/10.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(222, 244, 'products/17.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(223, 274, 'products/15.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(224, 366, 'products/10.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(225, 57, 'products/10.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(226, 174, 'products/2.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(227, 114, 'products/9.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(228, 165, 'products/4.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(229, 309, 'products/20.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(230, 268, 'products/1.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(231, 20, 'products/19.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(232, 187, 'products/15.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(233, 317, 'products/17.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(234, 285, 'products/16.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(235, 184, 'products/13.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(236, 128, 'products/5.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(237, 91, 'products/11.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(238, 275, 'products/19.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(239, 321, 'products/8.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(240, 312, 'products/8.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(241, 298, 'products/9.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(242, 199, 'products/16.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(243, 34, 'products/20.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(244, 295, 'products/17.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(245, 126, 'products/12.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(246, 77, 'products/3.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(247, 358, 'products/3.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(248, 44, 'products/8.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(249, 5, 'products/18.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(250, 210, 'products/16.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(251, 341, 'products/1.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(252, 132, 'products/2.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(253, 161, 'products/13.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(254, 253, 'products/20.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(255, 120, 'products/5.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(256, 259, 'products/8.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(257, 289, 'products/17.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(258, 222, 'products/11.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(259, 19, 'products/15.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(260, 238, 'products/10.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(261, 127, 'products/2.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(262, 70, 'products/1.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(263, 30, 'products/3.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(264, 48, 'products/9.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(265, 100, 'products/2.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(266, 165, 'products/15.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(267, 304, 'products/12.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(268, 318, 'products/20.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(269, 248, 'products/10.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(270, 335, 'products/9.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(271, 78, 'products/5.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(272, 282, 'products/2.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(273, 95, 'products/13.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(274, 201, 'products/14.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(275, 173, 'products/14.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(276, 64, 'products/5.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(277, 195, 'products/2.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(278, 207, 'products/2.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(279, 288, 'products/4.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(280, 341, 'products/4.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(281, 320, 'products/14.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(282, 268, 'products/19.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(283, 351, 'products/17.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(284, 120, 'products/19.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(285, 332, 'products/16.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(286, 336, 'products/18.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(287, 195, 'products/16.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(288, 137, 'products/17.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(289, 207, 'products/10.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(290, 89, 'products/4.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(291, 42, 'products/15.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(292, 363, 'products/18.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(293, 246, 'products/18.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(294, 367, 'products/5.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(295, 207, 'products/18.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(296, 329, 'products/5.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(297, 76, 'products/4.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(298, 271, 'products/13.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(299, 280, 'products/9.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(300, 121, 'products/10.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(301, 42, 'products/15.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(302, 298, 'products/8.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(303, 325, 'products/3.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(304, 71, 'products/6.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(305, 120, 'products/20.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(306, 216, 'products/1.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(307, 128, 'products/16.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(308, 315, 'products/5.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(309, 99, 'products/4.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(310, 76, 'products/8.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(311, 115, 'products/19.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(312, 313, 'products/4.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(313, 29, 'products/14.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(314, 285, 'products/3.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(315, 63, 'products/15.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(316, 361, 'products/9.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(317, 125, 'products/19.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(318, 215, 'products/10.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(319, 179, 'products/12.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(320, 111, 'products/6.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(321, 265, 'products/3.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(322, 110, 'products/7.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(323, 346, 'products/2.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(324, 220, 'products/1.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(325, 24, 'products/16.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(326, 263, 'products/6.jpg', '2021-02-09 02:13:12', '2021-02-09 02:13:12'),
(327, 292, 'products/6.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(328, 197, 'products/11.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(329, 319, 'products/11.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(330, 8, 'products/17.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(331, 124, 'products/9.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(332, 235, 'products/12.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(333, 267, 'products/11.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(334, 321, 'products/14.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(335, 350, 'products/7.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(336, 297, 'products/3.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(337, 111, 'products/13.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(338, 16, 'products/16.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(339, 17, 'products/4.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(340, 240, 'products/9.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(341, 312, 'products/14.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(342, 65, 'products/18.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(343, 208, 'products/11.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(344, 235, 'products/6.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(345, 87, 'products/4.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(346, 167, 'products/15.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(347, 68, 'products/1.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(348, 288, 'products/11.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(349, 44, 'products/19.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(350, 348, 'products/10.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(351, 72, 'products/6.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(352, 69, 'products/13.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(353, 151, 'products/11.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(354, 82, 'products/3.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(355, 231, 'products/18.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(356, 115, 'products/10.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(357, 276, 'products/17.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(358, 136, 'products/15.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(359, 11, 'products/14.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(360, 362, 'products/11.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(361, 238, 'products/13.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(362, 211, 'products/19.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(363, 178, 'products/20.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(364, 59, 'products/16.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(365, 312, 'products/3.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(366, 109, 'products/18.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(367, 176, 'products/11.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(368, 327, 'products/2.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(369, 345, 'products/5.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(370, 344, 'products/11.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(371, 176, 'products/17.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(372, 361, 'products/20.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(373, 130, 'products/1.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(374, 294, 'products/6.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(375, 326, 'products/14.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(376, 254, 'products/10.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(377, 187, 'products/13.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(378, 285, 'products/19.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(379, 118, 'products/15.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(380, 21, 'products/19.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(381, 127, 'products/11.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(382, 90, 'products/6.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(383, 238, 'products/18.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(384, 8, 'products/3.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(385, 52, 'products/15.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(386, 142, 'products/6.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(387, 207, 'products/17.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(388, 284, 'products/12.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(389, 51, 'products/15.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(390, 183, 'products/19.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(391, 144, 'products/8.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(392, 32, 'products/14.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(393, 181, 'products/4.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(394, 172, 'products/3.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(395, 159, 'products/6.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(396, 54, 'products/20.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(397, 159, 'products/5.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(398, 199, 'products/11.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(399, 205, 'products/5.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(400, 127, 'products/3.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(401, 50, 'products/18.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(402, 22, 'products/17.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(403, 145, 'products/13.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(404, 6, 'products/10.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(405, 46, 'products/17.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(406, 56, 'products/3.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(407, 269, 'products/7.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(408, 83, 'products/13.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(409, 167, 'products/13.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(410, 142, 'products/19.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(411, 13, 'products/13.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(412, 145, 'products/8.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(413, 148, 'products/10.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(414, 222, 'products/12.jpg', '2021-02-09 02:13:13', '2021-02-09 02:13:13'),
(415, 75, 'products/8.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(416, 147, 'products/2.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(417, 41, 'products/5.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(418, 54, 'products/4.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(419, 203, 'products/20.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(420, 164, 'products/15.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(421, 122, 'products/1.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(422, 202, 'products/7.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(423, 339, 'products/9.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(424, 27, 'products/11.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(425, 134, 'products/16.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(426, 338, 'products/17.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(427, 280, 'products/17.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(428, 288, 'products/6.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(429, 328, 'products/7.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(430, 249, 'products/16.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(431, 219, 'products/16.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(432, 284, 'products/18.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(433, 122, 'products/6.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(434, 266, 'products/8.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(435, 27, 'products/10.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(436, 146, 'products/15.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(437, 133, 'products/8.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(438, 140, 'products/7.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(439, 82, 'products/3.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(440, 223, 'products/15.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(441, 214, 'products/17.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(442, 207, 'products/2.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(443, 353, 'products/12.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(444, 356, 'products/10.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(445, 331, 'products/15.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(446, 44, 'products/13.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(447, 190, 'products/13.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(448, 332, 'products/1.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(449, 352, 'products/11.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(450, 274, 'products/19.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(451, 134, 'products/2.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(452, 180, 'products/17.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(453, 124, 'products/14.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(454, 16, 'products/4.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(455, 165, 'products/5.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(456, 79, 'products/3.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(457, 47, 'products/13.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(458, 131, 'products/18.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(459, 123, 'products/10.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(460, 95, 'products/6.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(461, 220, 'products/6.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(462, 5, 'products/17.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(463, 355, 'products/4.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(464, 209, 'products/20.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(465, 164, 'products/15.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(466, 203, 'products/9.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(467, 174, 'products/7.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(468, 38, 'products/8.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(469, 23, 'products/20.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(470, 133, 'products/15.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(471, 109, 'products/8.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(472, 62, 'products/17.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(473, 68, 'products/6.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(474, 233, 'products/5.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(475, 293, 'products/9.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(476, 96, 'products/2.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(477, 228, 'products/16.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(478, 321, 'products/12.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(479, 88, 'products/13.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(480, 118, 'products/13.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(481, 346, 'products/18.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(482, 229, 'products/1.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(483, 300, 'products/20.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(484, 163, 'products/14.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(485, 258, 'products/20.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(486, 166, 'products/19.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(487, 186, 'products/7.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(488, 178, 'products/8.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(489, 87, 'products/14.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(490, 194, 'products/13.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(491, 315, 'products/8.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(492, 252, 'products/8.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(493, 240, 'products/19.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(494, 319, 'products/11.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(495, 88, 'products/16.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(496, 222, 'products/8.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(497, 206, 'products/2.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(498, 299, 'products/5.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(499, 348, 'products/4.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(500, 36, 'products/1.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(501, 355, 'products/14.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(502, 338, 'products/2.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(503, 99, 'products/12.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(504, 197, 'products/9.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(505, 160, 'products/7.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(506, 124, 'products/13.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(507, 188, 'products/2.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(508, 343, 'products/5.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(509, 134, 'products/7.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(510, 248, 'products/8.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(511, 38, 'products/16.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(512, 269, 'products/8.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(513, 314, 'products/17.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(514, 190, 'products/19.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(515, 120, 'products/19.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(516, 244, 'products/7.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(517, 285, 'products/20.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(518, 254, 'products/8.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(519, 356, 'products/20.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(520, 278, 'products/10.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(521, 18, 'products/5.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(522, 181, 'products/20.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(523, 191, 'products/2.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(524, 20, 'products/12.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(525, 334, 'products/14.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(526, 211, 'products/2.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(527, 262, 'products/15.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(528, 245, 'products/17.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(529, 236, 'products/5.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(530, 246, 'products/18.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(531, 323, 'products/3.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(532, 227, 'products/6.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(533, 119, 'products/6.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(534, 122, 'products/2.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(535, 8, 'products/10.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(536, 156, 'products/13.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(537, 366, 'products/20.jpg', '2021-02-09 02:13:14', '2021-02-09 02:13:14'),
(538, 169, 'products/6.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(539, 42, 'products/14.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(540, 298, 'products/6.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(541, 186, 'products/16.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(542, 332, 'products/7.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(543, 365, 'products/20.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(544, 286, 'products/7.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(545, 353, 'products/13.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(546, 27, 'products/1.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(547, 144, 'products/2.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(548, 122, 'products/17.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(549, 207, 'products/3.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(550, 36, 'products/19.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(551, 315, 'products/11.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(552, 203, 'products/2.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(553, 290, 'products/10.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(554, 359, 'products/9.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(555, 350, 'products/14.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(556, 312, 'products/14.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(557, 319, 'products/12.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(558, 350, 'products/12.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(559, 117, 'products/11.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(560, 187, 'products/15.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(561, 31, 'products/17.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(562, 269, 'products/2.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(563, 163, 'products/17.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(564, 75, 'products/10.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(565, 273, 'products/2.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(566, 45, 'products/15.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(567, 79, 'products/15.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(568, 14, 'products/17.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(569, 282, 'products/18.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(570, 173, 'products/15.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(571, 314, 'products/8.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(572, 295, 'products/16.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(573, 97, 'products/4.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(574, 69, 'products/12.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(575, 172, 'products/8.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(576, 142, 'products/9.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(577, 286, 'products/4.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(578, 101, 'products/3.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(579, 273, 'products/8.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(580, 258, 'products/17.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(581, 358, 'products/7.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(582, 220, 'products/8.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(583, 53, 'products/19.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(584, 20, 'products/11.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(585, 25, 'products/20.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(586, 366, 'products/3.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(587, 109, 'products/4.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(588, 191, 'products/8.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(589, 92, 'products/15.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(590, 137, 'products/10.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(591, 140, 'products/3.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(592, 230, 'products/3.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(593, 358, 'products/20.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(594, 28, 'products/20.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(595, 327, 'products/8.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(596, 152, 'products/12.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(597, 250, 'products/7.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(598, 15, 'products/3.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(599, 93, 'products/2.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(600, 16, 'products/15.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(601, 241, 'products/4.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(602, 312, 'products/2.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(603, 231, 'products/6.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(604, 279, 'products/13.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(605, 86, 'products/13.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(606, 228, 'products/5.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(607, 279, 'products/4.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(608, 322, 'products/3.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(609, 28, 'products/12.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(610, 186, 'products/9.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(611, 287, 'products/9.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(612, 358, 'products/15.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(613, 86, 'products/10.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(614, 305, 'products/7.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(615, 245, 'products/17.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(616, 197, 'products/3.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(617, 362, 'products/8.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(618, 44, 'products/3.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(619, 308, 'products/1.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(620, 328, 'products/11.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(621, 265, 'products/20.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(622, 75, 'products/7.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(623, 150, 'products/19.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(624, 202, 'products/18.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(625, 131, 'products/2.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(626, 184, 'products/13.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(627, 150, 'products/18.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(628, 207, 'products/18.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(629, 325, 'products/20.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(630, 282, 'products/11.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(631, 347, 'products/7.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(632, 350, 'products/13.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(633, 180, 'products/15.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(634, 148, 'products/4.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(635, 156, 'products/4.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(636, 185, 'products/5.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(637, 203, 'products/7.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(638, 87, 'products/6.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(639, 295, 'products/18.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(640, 259, 'products/18.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(641, 362, 'products/2.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(642, 315, 'products/2.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(643, 195, 'products/17.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(644, 90, 'products/12.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(645, 33, 'products/10.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(646, 271, 'products/1.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(647, 318, 'products/19.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(648, 135, 'products/19.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(649, 291, 'products/17.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(650, 206, 'products/11.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(651, 151, 'products/1.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(652, 166, 'products/12.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(653, 164, 'products/14.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(654, 359, 'products/19.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(655, 214, 'products/7.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(656, 155, 'products/4.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(657, 93, 'products/15.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(658, 213, 'products/17.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(659, 82, 'products/8.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(660, 306, 'products/4.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(661, 201, 'products/9.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(662, 102, 'products/10.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(663, 242, 'products/15.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(664, 269, 'products/14.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(665, 306, 'products/20.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15');
INSERT INTO `product_images` (`id`, `product_id`, `full`, `created_at`, `updated_at`) VALUES
(666, 294, 'products/10.jpg', '2021-02-09 02:13:15', '2021-02-09 02:13:15'),
(667, 86, 'products/10.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(668, 147, 'products/7.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(669, 253, 'products/11.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(670, 75, 'products/3.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(671, 115, 'products/15.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(672, 42, 'products/17.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(673, 196, 'products/15.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(674, 316, 'products/3.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(675, 311, 'products/4.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(676, 217, 'products/12.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(677, 49, 'products/4.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(678, 285, 'products/8.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(679, 195, 'products/14.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(680, 275, 'products/8.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(681, 242, 'products/17.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(682, 103, 'products/1.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(683, 218, 'products/13.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(684, 226, 'products/13.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(685, 268, 'products/2.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(686, 233, 'products/20.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(687, 164, 'products/1.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(688, 276, 'products/15.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(689, 46, 'products/11.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(690, 346, 'products/15.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(691, 180, 'products/9.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(692, 39, 'products/17.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(693, 310, 'products/7.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(694, 285, 'products/14.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(695, 217, 'products/2.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(696, 298, 'products/13.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(697, 288, 'products/9.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(698, 246, 'products/1.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(699, 216, 'products/13.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(700, 269, 'products/1.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(701, 253, 'products/2.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(702, 278, 'products/11.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(703, 263, 'products/1.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(704, 270, 'products/1.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(705, 70, 'products/14.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(706, 53, 'products/15.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(707, 63, 'products/11.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(708, 284, 'products/18.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(709, 111, 'products/11.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(710, 85, 'products/3.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(711, 162, 'products/12.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(712, 119, 'products/9.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(713, 265, 'products/20.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(714, 35, 'products/15.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(715, 240, 'products/11.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(716, 83, 'products/4.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(717, 45, 'products/6.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(718, 225, 'products/6.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(719, 279, 'products/13.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(720, 255, 'products/1.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(721, 123, 'products/16.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(722, 282, 'products/4.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(723, 309, 'products/20.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(724, 293, 'products/19.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(725, 5, 'products/10.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(726, 73, 'products/19.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(727, 20, 'products/20.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(728, 328, 'products/18.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(729, 89, 'products/12.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(730, 198, 'products/2.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(731, 123, 'products/3.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(732, 237, 'products/18.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(733, 302, 'products/16.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(734, 259, 'products/4.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(735, 67, 'products/9.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(736, 301, 'products/6.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(737, 121, 'products/6.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(738, 317, 'products/10.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(739, 180, 'products/4.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(740, 313, 'products/7.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(741, 235, 'products/11.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(742, 270, 'products/18.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(743, 143, 'products/10.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(744, 49, 'products/10.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(745, 172, 'products/2.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(746, 348, 'products/15.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(747, 56, 'products/11.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(748, 132, 'products/5.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(749, 31, 'products/13.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(750, 306, 'products/13.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(751, 312, 'products/17.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(752, 14, 'products/13.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(753, 266, 'products/19.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16'),
(754, 350, 'products/10.jpg', '2021-02-09 02:13:16', '2021-02-09 02:13:16');

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
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `zone_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_regions` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `zone_name`, `zone_regions`, `method`, `price`, `status`, `created_at`, `updated_at`) VALUES
(2, 'dhaka', 'inside dhaka', 'Free Shipping', 500, 'active', '2020-12-10 08:06:12', '2020-12-10 08:06:12'),
(3, 'dhaka', 'inside dhaka', 'Free Shipping', 500, 'active', '2020-12-10 08:07:13', '2020-12-10 08:07:13'),
(4, 'dhaka', 'inside dhaka', 'Free Shipping', 1000, 'active', '2020-12-10 08:07:30', '2020-12-10 08:07:30'),
(9, 'dhaka', 'inside dhaka', 'Free Shipping', 1000, 'inactive', '2020-12-11 22:29:37', '2020-12-11 22:29:37'),
(10, 'inside', 'inside dhaka', 'Free Shipping', 0, 'active', '2020-12-11 22:44:07', '2020-12-11 22:44:07');

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
(4, '\r\nShopify Factor\r\nShop Latest ', 'Welcome To Our 5G corridor!', 'Double-sided PCBs are one of the most', 'Shop Now', 'http://127.0.0.1:8000/category/man', 'slides/8sQt5yeEO3eDKUEaf7T4PKjCj.jpg', '2020-12-10 08:15:54', '2021-01-03 02:01:28'),
(5, 'valentinesday-campaign-February21', 'Our Humble Beginningssfgsfdg', 'Flex circuits allow to mount electronic devices on flexible plastic substrates.\r\nThey are ideal for tightly assembl', 'Shop Now', 'http://127.0.0.1:8000/category/man', 'slides/xj8GFLQODPm1VJTuYp1D8UPvU.jpg', '2020-12-10 08:17:30', '2020-12-10 08:17:30'),
(7, 'Better colouring Products', 'Our Humble Beginnings', 'when an unknown printer took a galley', 'Shop Now', 'http://127.0.0.1:8000/category/man', 'slides/1GuD3wlZt4qooook0wVP2nQax.jpg', '2020-12-22 09:26:09', '2020-12-22 09:26:09');

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
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `homes`
--
ALTER TABLE `homes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=368;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=530;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=755;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
