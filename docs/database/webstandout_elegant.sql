-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 19, 2018 at 12:08 AM
-- Server version: 10.2.12-MariaDB-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webstandout_elegant`
--

-- --------------------------------------------------------

--
-- Table structure for table `mm_age_groups`
--

CREATE TABLE `mm_age_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_age_groups`
--

INSERT INTO `mm_age_groups` (`id`, `value`, `order`, `created_at`, `updated_at`) VALUES
(1, '21-25', 1, '2018-08-26 13:00:00', '2018-08-26 13:00:00'),
(2, '26-30', 2, '2018-08-26 13:00:00', '2018-08-26 13:00:00'),
(3, '31-35', 3, '2018-08-26 13:00:00', '2018-08-26 13:00:00'),
(4, '36-40', 4, '2018-08-26 13:00:00', '2018-08-26 13:00:00'),
(5, '41-45', 5, '2018-08-26 13:00:00', '2018-08-26 13:00:00'),
(6, '45+', 6, '2018-08-26 13:00:00', '2018-08-26 13:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `mm_home_advertisements`
--

CREATE TABLE `mm_home_advertisements` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_home_advertisements`
--

INSERT INTO `mm_home_advertisements` (`id`, `type_id`, `image`, `width`, `height`, `created_at`, `updated_at`) VALUES
(15, 15, '/uploads/advertisement/bf50080b68123fbf030492253dc697ec.jpg', '', '', '2018-09-28 08:16:10', '2018-10-10 20:29:24'),
(16, 17, '/uploads/advertisement/8accc9d80468c71cd7ed3e3f0f4509a1.jpg', '', '', '2018-09-29 01:01:46', '2018-10-10 20:29:24'),
(17, 19, '/uploads/advertisement/1aec609c74b66fdbed5f93367ff09d84.jpg', '', '', '2018-09-29 01:01:47', '2018-10-10 20:29:24'),
(19, 21, '/uploads/advertisement/b74e08fe9c1b86d9697175a39134d636.jpg', '', '', '2018-09-29 01:16:50', '2018-10-10 20:29:24');

-- --------------------------------------------------------

--
-- Table structure for table `mm_home_settings`
--

CREATE TABLE `mm_home_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(4) NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_home_settings`
--

INSERT INTO `mm_home_settings` (`id`, `type`, `heading`, `order`, `status`, `created_at`, `updated_at`) VALUES
(15, 'ads', 'Advertisement', 1, 'inactive', '2018-09-28 03:29:59', '2018-10-10 20:29:24'),
(16, 'tag', 'RECOMMENDED VIDEOS', 2, 'active', '2018-09-28 03:30:00', '2018-10-10 20:29:24'),
(17, 'ads', 'Advertisement', 3, 'active', '2018-09-28 03:30:00', '2018-10-10 20:29:24'),
(18, 'trending', 'TRENDING VIDEOS', 4, 'active', '2018-09-28 03:30:57', '2018-10-10 20:29:24'),
(19, 'ads', 'Advertisement', 5, 'active', '2018-09-28 03:30:57', '2018-10-10 20:29:24'),
(20, 'popular', 'POPULAR VIDEOS', 6, 'active', '2018-09-28 04:02:39', '2018-10-10 20:29:24'),
(21, 'ads', 'Advertisement', 7, 'active', '2018-09-29 01:15:00', '2018-10-10 20:29:24'),
(22, 'transparant-ulip', 'TRANSPARANT ULIP', 8, 'active', '2018-09-29 09:24:07', '2018-10-10 20:29:24');

-- --------------------------------------------------------

--
-- Table structure for table `mm_informations`
--

CREATE TABLE `mm_informations` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_informations`
--

INSERT INTO `mm_informations` (`id`, `created_at`, `updated_at`) VALUES
(8, '2018-09-14 03:50:21', '2018-09-21 04:09:02');

-- --------------------------------------------------------

--
-- Table structure for table `mm_information_descriptions`
--

CREATE TABLE `mm_information_descriptions` (
  `information_id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_information_descriptions`
--

INSERT INTO `mm_information_descriptions` (`information_id`, `language_id`, `title`, `short_description`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(8, 3, 'asdf adsf', 'sddsf', '<p>asdf a</p>', 'dsafs', 'sadsf', 'asdf'),
(8, 4, 'sd', 'asdsdf', '<p>sadfd asdf</p>', 'adsdsf', 'asdfd', 'adsf');

-- --------------------------------------------------------

--
-- Table structure for table `mm_information_metas`
--

CREATE TABLE `mm_information_metas` (
  `information_id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mm_menus`
--

CREATE TABLE `mm_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_menus`
--

INSERT INTO `mm_menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(23, 'Header Menu', '2018-09-20 05:36:45', '2018-09-20 06:07:50'),
(24, 'Profile Menu', '2018-09-20 06:08:30', '2018-09-20 06:08:30'),
(25, 'Footer Menu', '2018-09-20 06:22:13', '2018-09-20 06:22:13'),
(26, 'Footer CMS Menu', '2018-09-20 06:25:32', '2018-09-20 06:25:32'),
(27, 'sdf', '2018-09-21 05:34:02', '2018-09-21 05:34:02'),
(28, 'cc', '2018-10-29 15:25:29', '2018-10-29 15:25:29');

-- --------------------------------------------------------

--
-- Table structure for table `mm_menu_items`
--

CREATE TABLE `mm_menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_class` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_menu_items`
--

INSERT INTO `mm_menu_items` (`id`, `menu_id`, `parent_id`, `title`, `slug`, `target`, `icon_class`, `order`, `created_at`, `updated_at`) VALUES
(2, 23, 0, 'Speakers', 'speaker', NULL, NULL, 2, '2018-09-20 05:39:12', '2018-09-25 02:52:38'),
(3, 23, 0, 'About', 'about', NULL, NULL, 3, '2018-09-20 05:39:23', '2018-09-25 02:52:26'),
(4, 23, 0, 'Contact', 'contact', NULL, NULL, 4, '2018-09-20 05:39:44', '2018-09-25 02:52:32'),
(6, 24, 0, 'My Profile', 'profile', NULL, NULL, 7, '2018-09-20 06:09:04', '2018-09-26 02:29:55'),
(7, 24, 0, 'My Lists', 'mylist', NULL, NULL, 8, '2018-09-20 06:09:27', '2018-10-09 00:56:09'),
(8, 24, 0, 'Profile Settings', 'profile-settings', NULL, NULL, 9, '2018-09-20 06:09:48', '2018-10-09 00:56:34'),
(9, 25, 0, 'Videos', 'video', NULL, NULL, 10, '2018-09-20 06:23:21', '2018-09-20 06:24:56'),
(10, 25, 0, 'Speakers', 'speaker', NULL, NULL, 11, '2018-09-20 06:23:46', '2018-09-20 06:23:46'),
(11, 25, 0, 'About', 'about', NULL, NULL, 12, '2018-09-20 06:23:59', '2018-09-20 06:23:59'),
(12, 25, 0, 'Contact', 'contact', NULL, NULL, 13, '2018-09-20 06:24:10', '2018-09-20 06:24:10'),
(13, 23, 2, 'Vivek Law', 'speaker/vivek-law', NULL, NULL, 14, '2018-09-20 06:27:31', '2018-09-25 01:52:49'),
(14, 26, 0, 'Privacy', 'privacy', NULL, NULL, 15, '2018-09-20 06:37:01', '2018-09-20 06:37:01'),
(15, 26, 0, 'Terms  Conditions', 'terms-conditions', NULL, NULL, 16, '2018-09-20 06:37:52', '2018-09-20 06:37:52'),
(16, 26, 0, 'Agreements', 'agreements', NULL, NULL, 17, '2018-09-20 06:38:08', '2018-09-20 06:38:08'),
(17, 23, 2, 'Surya Bhatia', 'speaker/surya-bhatia', NULL, NULL, 18, '2018-09-24 08:59:33', '2018-09-25 01:52:41');

-- --------------------------------------------------------

--
-- Table structure for table `mm_migrations`
--

CREATE TABLE `mm_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_migrations`
--

INSERT INTO `mm_migrations` (`id`, `migration`, `batch`) VALUES
(1, '2018_08_18_095022_create_users_table', 1),
(2, '2018_08_27_074200_create_user_metas_table', 1),
(3, '2018_08_30_080506_create_videos_table', 1),
(4, '2018_08_30_134358_create_video_metas_table', 1),
(5, '2018_08_31_093717_create_playlists_table', 1),
(6, '2018_08_31_094004_create_playlist_metas_table', 1),
(7, '2018_08_31_122311_create_user_verifies_table', 1),
(8, '2018_08_31_124101_create_user_password_resets_table', 1),
(9, '2018_08_31_125018_create_roles_table', 1),
(10, '2018_08_31_130016_create_age_groups_table', 1),
(11, '2018_08_31_133425_create_tags_table', 1),
(12, '2018_08_31_133847_create_reason_for_account_deactivations_table', 1),
(13, '2018_08_31_140340_create_user_wishlists_table', 1),
(14, '2018_09_01_053627_create_permissions_table', 1),
(15, '2018_09_01_053706_create_role_permissions_table', 1),
(16, '2018_09_01_061010_create_translations_table', 1),
(17, '2018_09_01_062037_create_settings_table', 1),
(18, '2018_09_01_063126_create_user_comments_table', 1),
(21, '2018_09_01_065912_create_menus_table', 1),
(23, '2018_09_01_084826_create_subscriptions_table', 1),
(25, '2018_09_01_065935_create_menu_items_table', 2),
(33, '2018_09_07_091548_create_players_table', 4),
(34, '2018_09_07_091804_create_player_metas_table', 4),
(37, '2018_09_14_083324_create_informations_table', 5),
(38, '2018_09_14_083340_create_information_descriptions_table', 5),
(41, '2018_09_01_063623_create_speakers_table', 6),
(42, '2018_09_21_070229__create_speaker_descriptions_table', 6),
(43, '2018_09_25_084911_create_speaker_socials_table', 7),
(44, '2018_09_27_143008_create_home_settings_table', 8),
(45, '2018_09_28_081153_create_home_advertisements_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `mm_permissions`
--

CREATE TABLE `mm_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mm_players`
--

CREATE TABLE `mm_players` (
  `player_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_players`
--

INSERT INTO `mm_players` (`player_id`, `name`, `created_at`, `updated_at`) VALUES
('2N7wx9DlN', 'Home Page Full page playe 1901', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('default', 'Default', '2018-10-04 02:19:33', '2018-10-04 02:19:33'),
('iGAicgqoE9', 'Pre-Roll Ad - On Load - Without Skip', '2018-10-04 02:19:34', '2018-10-04 02:19:34'),
('k089Hf8le8', 'On Cue Point Ads 1', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('Ksc5sbbZq', 'Mid Ad Post Ad  using Cue Points', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('oI9Ys62fi', 'Pre-Roll Ad - On Load - Skip', '2018-09-10 06:48:07', '2018-09-10 06:48:07'),
('oNgLTdNCH', '[Matt] Test Player', '2018-10-04 02:19:36', '2018-10-04 02:19:36'),
('t96CU0JUI', 'Pre  / Mid / Post - On Load', '2018-09-10 06:48:07', '2018-09-10 06:48:07'),
('tRMX2rkxce', 'Post / Pre / Mid - On Cue Point', '2018-09-10 06:48:09', '2018-09-10 06:48:09');

-- --------------------------------------------------------

--
-- Table structure for table `mm_player_metas`
--

CREATE TABLE `mm_player_metas` (
  `player_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_player_metas`
--

INSERT INTO `mm_player_metas` (`player_id`, `meta_key`, `meta_value`, `created_at`, `updated_at`) VALUES
('Ksc5sbbZq', 'id', 'Ksc5sbbZq', '2018-09-07 04:39:46', '2018-09-07 04:39:46'),
('Ksc5sbbZq', 'name', 'Mid Ad Post Ad  using Cue Points', '2018-09-07 04:39:46', '2018-09-07 04:39:46'),
('Ksc5sbbZq', 'description', 'Mid Ad Post Ad  using Cue Points', '2018-09-07 04:39:46', '2018-09-07 04:39:46'),
('Ksc5sbbZq', 'branches', 'a:2:{s:7:\"preview\";a:4:{s:13:\"configuration\";a:8:{s:6:\"player\";a:1:{s:8:\"template\";a:2:{s:7:\"version\";s:6:\"6.22.7\";s:4:\"name\";s:21:\"single-video-template\";}}s:11:\"video_cloud\";a:2:{s:10:\"policy_key\";s:144:\"BCpkADawqM2oSmt6f0PMEnLmHYUkqC4qfLov4TkCnXNKnZgkOH-s2Xhxu034OIr5HuKthLfh6JJRt61fFvsyssGfHhzYPK5A1wZVbNcLLt1z08brHd0v13ryJuZWO0q5NM4KyeLpTRAFXoeE\";s:5:\"video\";N;}s:13:\"compatibility\";b:1;s:7:\"plugins\";a:1:{i:0;a:2:{s:7:\"options\";a:7:{s:9:\"serverUrl\";s:240:\"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/single_ad_samples&ciu_szs=300x250&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ct%3Dlinear&correlator=\";s:7:\"timeout\";i:4000;s:12:\"hardTimeouts\";b:1;s:11:\"requestMode\";s:5:\"oncue\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:9:\"vpaidMode\";s:7:\"ENABLED\";s:17:\"useMediaCuePoints\";b:1;}s:4:\"name\";s:4:\"ima3\";}}s:7:\"scripts\";a:1:{i:0;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:11:\"stylesheets\";a:1:{i:0;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}s:2:\"id\";s:9:\"Ksc5sbbZq\";s:20:\"studio_configuration\";a:1:{s:12:\"availability\";a:2:{s:7:\"domains\";a:0:{}s:10:\"policy_key\";s:144:\"BCpkADawqM2oSmt6f0PMEnLmHYUkqC4qfLov4TkCnXNKnZgkOH-s2Xhxu034OIr5HuKthLfh6JJRt61fFvsyssGfHhzYPK5A1wZVbNcLLt1z08brHd0v13ryJuZWO0q5NM4KyeLpTRAFXoeE\";}}}s:10:\"updated_at\";s:24:\"2018-08-14T08:23:13.008Z\";s:19:\"template_updated_at\";s:24:\"2018-08-30T20:20:58.256Z\";s:11:\"preview_url\";s:122:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/Ksc5sbbZq/preview/embeds/default/master/index.html\";}s:6:\"master\";a:4:{s:13:\"configuration\";a:8:{s:20:\"studio_configuration\";a:1:{s:12:\"availability\";a:2:{s:10:\"policy_key\";s:144:\"BCpkADawqM2oSmt6f0PMEnLmHYUkqC4qfLov4TkCnXNKnZgkOH-s2Xhxu034OIr5HuKthLfh6JJRt61fFvsyssGfHhzYPK5A1wZVbNcLLt1z08brHd0v13ryJuZWO0q5NM4KyeLpTRAFXoeE\";s:7:\"domains\";a:0:{}}}s:2:\"id\";s:9:\"Ksc5sbbZq\";s:11:\"stylesheets\";a:1:{i:0;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}s:7:\"scripts\";a:1:{i:0;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:7:\"plugins\";a:1:{i:0;a:2:{s:7:\"options\";a:7:{s:17:\"useMediaCuePoints\";b:1;s:9:\"vpaidMode\";s:7:\"ENABLED\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:11:\"requestMode\";s:5:\"oncue\";s:12:\"hardTimeouts\";b:1;s:7:\"timeout\";i:4000;s:9:\"serverUrl\";s:240:\"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/single_ad_samples&ciu_szs=300x250&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ct%3Dlinear&correlator=\";}s:4:\"name\";s:4:\"ima3\";}}s:13:\"compatibility\";b:1;s:11:\"video_cloud\";a:2:{s:5:\"video\";N;s:10:\"policy_key\";s:144:\"BCpkADawqM2oSmt6f0PMEnLmHYUkqC4qfLov4TkCnXNKnZgkOH-s2Xhxu034OIr5HuKthLfh6JJRt61fFvsyssGfHhzYPK5A1wZVbNcLLt1z08brHd0v13ryJuZWO0q5NM4KyeLpTRAFXoeE\";}s:6:\"player\";a:1:{s:8:\"template\";a:2:{s:4:\"name\";s:21:\"single-video-template\";s:7:\"version\";s:6:\"6.22.7\";}}}s:10:\"updated_at\";s:24:\"2018-08-14T08:23:11.932Z\";s:19:\"template_updated_at\";s:24:\"2018-08-30T20:21:08.336Z\";s:11:\"preview_url\";s:121:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/Ksc5sbbZq/master/embeds/default/master/index.html\";}}', '2018-09-07 04:39:46', '2018-09-07 04:39:46'),
('Ksc5sbbZq', 'created_at', '2018-08-14T07:53:03.778Z', '2018-09-07 04:39:46', '2018-09-07 04:39:46'),
('Ksc5sbbZq', 'url', 'http://players.brightcove.net/5814665417001/Ksc5sbbZq_default/index.html', '2018-09-07 04:39:46', '2018-09-07 04:39:46'),
('Ksc5sbbZq', 'embed_count', '1', '2018-09-07 04:39:46', '2018-09-07 04:39:46'),
('Ksc5sbbZq', 'accountId', '5814665417001', '2018-09-07 04:39:46', '2018-09-07 04:39:46'),
('oI9Ys62fi', 'id', 'oI9Ys62fi', '2018-09-07 04:39:48', '2018-09-07 04:39:48'),
('oI9Ys62fi', 'name', 'Pre-Roll Ad - On Load - Skip', '2018-09-07 04:39:48', '2018-09-07 04:39:48'),
('oI9Ys62fi', 'description', 'Pre-Roll Ad - On Load', '2018-09-07 04:39:48', '2018-09-07 04:39:48'),
('oI9Ys62fi', 'branches', 'a:2:{s:6:\"master\";a:4:{s:19:\"template_updated_at\";s:24:\"2018-08-30T20:21:08.336Z\";s:10:\"updated_at\";s:24:\"2018-08-14T05:59:10.818Z\";s:13:\"configuration\";a:9:{s:6:\"player\";a:1:{s:8:\"template\";a:2:{s:7:\"version\";s:6:\"6.22.7\";s:4:\"name\";s:21:\"single-video-template\";}}s:11:\"video_cloud\";a:2:{s:10:\"policy_key\";s:144:\"BCpkADawqM0Z5JvQNM7nZ74t7QiN3zVbjQOYgFIOqtPh8FLYEiPXmUugNI0BTl5FkJZ6Q0QIkDMZrVDQ6qWRDxOf_O2t5ZHx13CZO62bcZ5Arwy_7Zt5gICeyI2RRs3AJVhctHRYiPQRqulk\";s:5:\"video\";N;}s:13:\"compatibility\";b:1;s:7:\"plugins\";a:2:{i:0;a:2:{s:7:\"options\";a:7:{s:11:\"deeplinking\";b:0;s:5:\"title\";s:0:\"\";s:11:\"description\";s:0:\"\";s:3:\"url\";s:0:\"\";s:6:\"offset\";s:0:\"\";s:8:\"services\";a:6:{s:8:\"facebook\";b:1;s:6:\"google\";b:1;s:7:\"twitter\";b:1;s:9:\"pinterest\";b:1;s:8:\"linkedin\";b:1;s:6:\"tumblr\";b:1;}s:17:\"displayAfterVideo\";b:1;}s:4:\"name\";s:6:\"social\";}i:1;a:2:{s:7:\"options\";a:7:{s:9:\"serverUrl\";s:249:\"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/single_ad_samples&ciu_szs=300x250&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ct%3Dskippablelinear&correlator=\";s:7:\"timeout\";i:4000;s:12:\"hardTimeouts\";b:1;s:11:\"requestMode\";s:6:\"onload\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:9:\"vpaidMode\";s:7:\"ENABLED\";s:17:\"useMediaCuePoints\";b:0;}s:4:\"name\";s:4:\"ima3\";}}s:7:\"scripts\";a:2:{i:0;s:63:\"//players.brightcove.net/videojs-social/3/videojs-social.min.js\";i:1;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:11:\"stylesheets\";a:2:{i:0;s:60:\"//players.brightcove.net/videojs-social/3/videojs-social.css\";i:1;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}s:3:\"css\";a:3:{s:12:\"controlColor\";s:4:\"#fff\";s:15:\"controlBarColor\";s:19:\"rgba(0, 0, 0, 0.45)\";s:13:\"progressColor\";s:7:\"#d52484\";}s:4:\"skin\";N;s:4:\"dock\";b:1;}s:11:\"preview_url\";s:121:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/oI9Ys62fi/master/embeds/default/master/index.html\";}s:7:\"preview\";a:4:{s:19:\"template_updated_at\";s:24:\"2018-08-30T20:20:58.256Z\";s:10:\"updated_at\";s:24:\"2018-08-14T05:59:11.842Z\";s:13:\"configuration\";a:9:{s:4:\"dock\";b:1;s:4:\"skin\";N;s:3:\"css\";a:3:{s:13:\"progressColor\";s:7:\"#d52484\";s:15:\"controlBarColor\";s:19:\"rgba(0, 0, 0, 0.45)\";s:12:\"controlColor\";s:4:\"#fff\";}s:11:\"stylesheets\";a:2:{i:0;s:60:\"//players.brightcove.net/videojs-social/3/videojs-social.css\";i:1;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}s:7:\"scripts\";a:2:{i:0;s:63:\"//players.brightcove.net/videojs-social/3/videojs-social.min.js\";i:1;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:7:\"plugins\";a:2:{i:0;a:2:{s:7:\"options\";a:7:{s:17:\"displayAfterVideo\";b:1;s:8:\"services\";a:6:{s:6:\"tumblr\";b:1;s:8:\"linkedin\";b:1;s:9:\"pinterest\";b:1;s:7:\"twitter\";b:1;s:6:\"google\";b:1;s:8:\"facebook\";b:1;}s:6:\"offset\";s:0:\"\";s:3:\"url\";s:0:\"\";s:11:\"description\";s:0:\"\";s:5:\"title\";s:0:\"\";s:11:\"deeplinking\";b:0;}s:4:\"name\";s:6:\"social\";}i:1;a:2:{s:7:\"options\";a:7:{s:17:\"useMediaCuePoints\";b:0;s:9:\"vpaidMode\";s:7:\"ENABLED\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:11:\"requestMode\";s:6:\"onload\";s:12:\"hardTimeouts\";b:1;s:7:\"timeout\";i:4000;s:9:\"serverUrl\";s:249:\"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/single_ad_samples&ciu_szs=300x250&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ct%3Dskippablelinear&correlator=\";}s:4:\"name\";s:4:\"ima3\";}}s:13:\"compatibility\";b:1;s:11:\"video_cloud\";a:2:{s:5:\"video\";N;s:10:\"policy_key\";s:144:\"BCpkADawqM0Z5JvQNM7nZ74t7QiN3zVbjQOYgFIOqtPh8FLYEiPXmUugNI0BTl5FkJZ6Q0QIkDMZrVDQ6qWRDxOf_O2t5ZHx13CZO62bcZ5Arwy_7Zt5gICeyI2RRs3AJVhctHRYiPQRqulk\";}s:6:\"player\";a:1:{s:8:\"template\";a:2:{s:4:\"name\";s:21:\"single-video-template\";s:7:\"version\";s:6:\"6.22.7\";}}}s:11:\"preview_url\";s:122:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/oI9Ys62fi/preview/embeds/default/master/index.html\";}}', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('oI9Ys62fi', 'created_at', '2018-08-14T05:47:54.541Z', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('oI9Ys62fi', 'url', 'http://players.brightcove.net/5814665417001/oI9Ys62fi_default/index.html', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('oI9Ys62fi', 'embed_count', '1', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('oI9Ys62fi', 'accountId', '5814665417001', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('t96CU0JUI', 'id', 't96CU0JUI', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('t96CU0JUI', 'name', 'Pre  / Mid / Post - On Load', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('t96CU0JUI', 'description', '', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('t96CU0JUI', 'branches', 'a:2:{s:6:\"master\";a:4:{s:19:\"template_updated_at\";s:24:\"2018-08-30T20:21:08.336Z\";s:10:\"updated_at\";s:24:\"2018-08-14T08:47:28.308Z\";s:13:\"configuration\";a:6:{s:7:\"plugins\";a:1:{i:0;a:2:{s:7:\"options\";a:7:{s:17:\"useMediaCuePoints\";b:0;s:9:\"vpaidMode\";s:7:\"ENABLED\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:11:\"requestMode\";s:6:\"onload\";s:12:\"hardTimeouts\";b:1;s:7:\"timeout\";i:4000;s:9:\"serverUrl\";s:282:\"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostpod&cmsid=496&vid=short_onecue&correlator=\";}s:4:\"name\";s:4:\"ima3\";}}s:13:\"compatibility\";b:1;s:11:\"video_cloud\";a:2:{s:5:\"video\";N;s:10:\"policy_key\";s:144:\"BCpkADawqM075RwoD8PAw8vGI9OAScJBoqwKjawxtb4RAy5X7WnPuCTEsbBdwe7kTj3nLLIfpTG8hJQoPMI42ceftbIFjbCG5myIwGupiEvM0ipr2TD8mTtu_lTVzqpZGxxO2D79r3ztImzr\";}s:6:\"player\";a:1:{s:8:\"template\";a:2:{s:4:\"name\";s:21:\"single-video-template\";s:7:\"version\";s:6:\"6.22.7\";}}s:7:\"scripts\";a:1:{i:0;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:11:\"stylesheets\";a:1:{i:0;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}}s:11:\"preview_url\";s:121:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/t96CU0JUI/master/embeds/default/master/index.html\";}s:7:\"preview\";a:4:{s:19:\"template_updated_at\";s:24:\"2018-08-30T20:20:58.256Z\";s:10:\"updated_at\";s:24:\"2018-08-14T08:47:29.071Z\";s:13:\"configuration\";a:6:{s:6:\"player\";a:1:{s:8:\"template\";a:2:{s:7:\"version\";s:6:\"6.22.7\";s:4:\"name\";s:21:\"single-video-template\";}}s:11:\"video_cloud\";a:2:{s:10:\"policy_key\";s:144:\"BCpkADawqM075RwoD8PAw8vGI9OAScJBoqwKjawxtb4RAy5X7WnPuCTEsbBdwe7kTj3nLLIfpTG8hJQoPMI42ceftbIFjbCG5myIwGupiEvM0ipr2TD8mTtu_lTVzqpZGxxO2D79r3ztImzr\";s:5:\"video\";N;}s:13:\"compatibility\";b:1;s:7:\"plugins\";a:1:{i:0;a:2:{s:7:\"options\";a:7:{s:9:\"serverUrl\";s:282:\"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostpod&cmsid=496&vid=short_onecue&correlator=\";s:7:\"timeout\";i:4000;s:12:\"hardTimeouts\";b:1;s:11:\"requestMode\";s:6:\"onload\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:9:\"vpaidMode\";s:7:\"ENABLED\";s:17:\"useMediaCuePoints\";b:0;}s:4:\"name\";s:4:\"ima3\";}}s:7:\"scripts\";a:1:{i:0;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:11:\"stylesheets\";a:1:{i:0;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}}s:11:\"preview_url\";s:122:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/t96CU0JUI/preview/embeds/default/master/index.html\";}}', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('t96CU0JUI', 'created_at', '2018-08-14T08:47:08.055Z', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('t96CU0JUI', 'url', 'http://players.brightcove.net/5814665417001/t96CU0JUI_default/index.html', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('t96CU0JUI', 'embed_count', '1', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('t96CU0JUI', 'accountId', '5814665417001', '2018-09-07 04:39:50', '2018-09-07 04:39:50'),
('tRMX2rkxce', 'id', 'tRMX2rkxce', '2018-09-07 04:39:50', '2018-09-07 04:39:50'),
('tRMX2rkxce', 'name', 'Post / Pre / Mid - On Cue Point', '2018-09-07 04:39:50', '2018-09-07 04:39:50'),
('tRMX2rkxce', 'description', '', '2018-09-07 04:39:50', '2018-09-07 04:39:50'),
('tRMX2rkxce', 'branches', 'a:2:{s:7:\"preview\";a:4:{s:13:\"configuration\";a:6:{s:6:\"player\";a:1:{s:8:\"template\";a:2:{s:7:\"version\";s:6:\"6.22.7\";s:4:\"name\";s:21:\"single-video-template\";}}s:11:\"video_cloud\";a:2:{s:10:\"policy_key\";s:144:\"BCpkADawqM01n2-_4nIxvBma2qyKBjwSAU34rAlTK1wYe52UYzXuR8vln0nuO6YUWxZizGAabxuidXtLi3tAtgFrJxLpfpGeUkgUx3cRpLLC_Hy2sPGov6oeiA1kxWnkxSDtEMMmAS19SIfU\";s:5:\"video\";N;}s:13:\"compatibility\";b:1;s:7:\"plugins\";a:1:{i:0;a:2:{s:7:\"options\";a:7:{s:9:\"serverUrl\";s:282:\"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostpod&cmsid=496&vid=short_onecue&correlator=\";s:7:\"timeout\";i:4000;s:12:\"hardTimeouts\";b:1;s:11:\"requestMode\";s:5:\"oncue\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:9:\"vpaidMode\";s:7:\"ENABLED\";s:17:\"useMediaCuePoints\";b:1;}s:4:\"name\";s:4:\"ima3\";}}s:7:\"scripts\";a:1:{i:0;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:11:\"stylesheets\";a:1:{i:0;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}}s:10:\"updated_at\";s:24:\"2018-08-14T08:46:43.560Z\";s:19:\"template_updated_at\";s:24:\"2018-08-30T20:20:58.256Z\";s:11:\"preview_url\";s:123:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/tRMX2rkxce/preview/embeds/default/master/index.html\";}s:6:\"master\";a:4:{s:13:\"configuration\";a:6:{s:6:\"player\";a:1:{s:8:\"template\";a:2:{s:7:\"version\";s:6:\"6.22.7\";s:4:\"name\";s:21:\"single-video-template\";}}s:11:\"video_cloud\";a:2:{s:10:\"policy_key\";s:144:\"BCpkADawqM01n2-_4nIxvBma2qyKBjwSAU34rAlTK1wYe52UYzXuR8vln0nuO6YUWxZizGAabxuidXtLi3tAtgFrJxLpfpGeUkgUx3cRpLLC_Hy2sPGov6oeiA1kxWnkxSDtEMMmAS19SIfU\";s:5:\"video\";N;}s:13:\"compatibility\";b:1;s:7:\"plugins\";a:1:{i:0;a:2:{s:7:\"options\";a:7:{s:9:\"serverUrl\";s:282:\"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostpod&cmsid=496&vid=short_onecue&correlator=\";s:7:\"timeout\";i:4000;s:12:\"hardTimeouts\";b:1;s:11:\"requestMode\";s:5:\"oncue\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:9:\"vpaidMode\";s:7:\"ENABLED\";s:17:\"useMediaCuePoints\";b:1;}s:4:\"name\";s:4:\"ima3\";}}s:7:\"scripts\";a:1:{i:0;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:11:\"stylesheets\";a:1:{i:0;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}}s:10:\"updated_at\";s:24:\"2018-08-14T08:46:42.466Z\";s:19:\"template_updated_at\";s:24:\"2018-08-30T20:21:08.336Z\";s:11:\"preview_url\";s:122:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/tRMX2rkxce/master/embeds/default/master/index.html\";}}', '2018-09-07 04:39:50', '2018-09-07 04:39:50'),
('tRMX2rkxce', 'created_at', '2018-08-14T08:40:44.979Z', '2018-09-07 04:39:50', '2018-09-07 04:39:50'),
('tRMX2rkxce', 'url', 'http://players.brightcove.net/5814665417001/tRMX2rkxce_default/index.html', '2018-09-07 04:39:50', '2018-09-07 04:39:50'),
('tRMX2rkxce', 'embed_count', '1', '2018-09-07 04:39:50', '2018-09-07 04:39:50'),
('tRMX2rkxce', 'accountId', '5814665417001', '2018-09-07 04:39:50', '2018-09-07 04:39:50'),
('2N7wx9DlN', 'id', '2N7wx9DlN', '2018-09-07 05:22:10', '2018-09-07 05:22:10'),
('2N7wx9DlN', 'name', 'Home Page Full page playe 1901', '2018-09-07 05:22:10', '2018-09-07 05:22:10'),
('2N7wx9DlN', 'description', 'Home Page Full page player', '2018-09-07 05:22:10', '2018-09-07 05:22:10'),
('2N7wx9DlN', 'branches', 'a:2:{s:7:\"preview\";a:4:{s:13:\"configuration\";a:13:{s:6:\"player\";a:2:{s:8:\"template\";a:4:{s:7:\"version\";s:6:\"6.22.7\";s:4:\"name\";s:21:\"single-video-template\";s:6:\"locked\";b:0;s:13:\"version_alias\";N;}s:8:\"inactive\";b:0;}s:11:\"video_cloud\";a:2:{s:10:\"policy_key\";s:144:\"BCpkADawqM18vdrb6kOdPSItBdtNy_nRdlHq9ltCVVG0n6FniJauupbrfxZDJlTEtWOiuUQd_OAn6Fw0Uf7dN_6Nh2XcwkvXrC91dKWSFIyGstWD1QwaS3mKWtA4Uz1kCsyyJVDwh2yiujcY\";s:5:\"video\";N;}s:13:\"compatibility\";b:1;s:2:\"id\";s:9:\"2N7wx9DlN\";s:7:\"preload\";s:8:\"metadata\";s:8:\"autoplay\";b:1;s:17:\"fullscreenControl\";b:1;s:20:\"studio_configuration\";a:1:{s:6:\"player\";a:4:{s:5:\"width\";i:4;s:6:\"height\";i:750;s:8:\"adjusted\";b:0;s:10:\"responsive\";b:0;}}s:11:\"autoadvance\";i:0;s:7:\"plugins\";a:2:{i:0;a:2:{s:7:\"options\";a:2:{s:19:\"useResolutionLabels\";b:0;s:23:\"resolutionLabelBitrates\";b:1;}s:4:\"name\";s:11:\"qualityMenu\";}i:1;a:2:{s:7:\"options\";a:7:{s:9:\"serverUrl\";s:14:\"this is my url\";s:7:\"timeout\";i:4000;s:12:\"hardTimeouts\";b:1;s:11:\"requestMode\";s:6:\"onload\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:9:\"vpaidMode\";s:7:\"ENABLED\";s:17:\"useMediaCuePoints\";b:0;}s:4:\"name\";s:4:\"ima3\";}}s:7:\"scripts\";a:2:{i:0;s:75:\"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.min.js\";i:1;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:11:\"stylesheets\";a:2:{i:0;s:72:\"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.css\";i:1;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}s:8:\"playlist\";b:1;}s:10:\"updated_at\";s:24:\"2018-09-07T10:47:29.154Z\";s:19:\"template_updated_at\";s:24:\"2018-08-30T20:20:58.256Z\";s:11:\"preview_url\";s:122:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/2N7wx9DlN/preview/embeds/default/master/index.html\";}s:6:\"master\";a:4:{s:13:\"configuration\";a:13:{s:8:\"playlist\";b:1;s:11:\"stylesheets\";a:2:{i:0;s:72:\"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.css\";i:1;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}s:7:\"scripts\";a:2:{i:0;s:75:\"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.min.js\";i:1;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:7:\"plugins\";a:2:{i:0;a:2:{s:7:\"options\";a:2:{s:23:\"resolutionLabelBitrates\";b:1;s:19:\"useResolutionLabels\";b:0;}s:4:\"name\";s:11:\"qualityMenu\";}i:1;a:2:{s:7:\"options\";a:7:{s:17:\"useMediaCuePoints\";b:0;s:9:\"vpaidMode\";s:7:\"ENABLED\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:11:\"requestMode\";s:6:\"onload\";s:12:\"hardTimeouts\";b:1;s:7:\"timeout\";i:4000;s:9:\"serverUrl\";s:14:\"this is my url\";}s:4:\"name\";s:4:\"ima3\";}}s:11:\"autoadvance\";i:0;s:20:\"studio_configuration\";a:1:{s:6:\"player\";a:4:{s:10:\"responsive\";b:0;s:8:\"adjusted\";b:0;s:6:\"height\";i:750;s:5:\"width\";i:4;}}s:17:\"fullscreenControl\";b:1;s:8:\"autoplay\";b:1;s:7:\"preload\";s:8:\"metadata\";s:2:\"id\";s:9:\"2N7wx9DlN\";s:13:\"compatibility\";b:1;s:11:\"video_cloud\";a:2:{s:5:\"video\";N;s:10:\"policy_key\";s:144:\"BCpkADawqM18vdrb6kOdPSItBdtNy_nRdlHq9ltCVVG0n6FniJauupbrfxZDJlTEtWOiuUQd_OAn6Fw0Uf7dN_6Nh2XcwkvXrC91dKWSFIyGstWD1QwaS3mKWtA4Uz1kCsyyJVDwh2yiujcY\";}s:6:\"player\";a:2:{s:8:\"inactive\";b:0;s:8:\"template\";a:4:{s:13:\"version_alias\";N;s:6:\"locked\";b:0;s:4:\"name\";s:21:\"single-video-template\";s:7:\"version\";s:6:\"6.22.7\";}}}s:10:\"updated_at\";s:24:\"2018-09-07T10:47:28.544Z\";s:19:\"template_updated_at\";s:24:\"2018-08-30T20:21:08.336Z\";s:11:\"preview_url\";s:121:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/2N7wx9DlN/master/embeds/default/master/index.html\";}}', '2018-09-07 05:22:10', '2018-09-07 05:22:10'),
('2N7wx9DlN', 'created_at', '2018-08-20T05:23:34.304Z', '2018-09-07 05:22:11', '2018-09-07 05:22:11'),
('2N7wx9DlN', 'url', 'http://players.brightcove.net/5814665417001/2N7wx9DlN_default/index.html', '2018-09-07 05:22:11', '2018-09-07 05:22:11'),
('2N7wx9DlN', 'embed_count', '1', '2018-09-07 05:22:11', '2018-09-07 05:22:11'),
('2N7wx9DlN', 'accountId', '5814665417001', '2018-09-07 05:22:11', '2018-09-07 05:22:11'),
('2N7wx9DlN', 'id', '2N7wx9DlN', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('2N7wx9DlN', 'name', 'Home Page Full page playe 1901', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('2N7wx9DlN', 'description', 'Home Page Full page player', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('2N7wx9DlN', 'branches', 'a:2:{s:7:\"preview\";a:4:{s:13:\"configuration\";a:13:{s:6:\"player\";a:2:{s:8:\"template\";a:4:{s:7:\"version\";s:6:\"6.22.7\";s:4:\"name\";s:21:\"single-video-template\";s:6:\"locked\";b:0;s:13:\"version_alias\";N;}s:8:\"inactive\";b:0;}s:11:\"video_cloud\";a:2:{s:10:\"policy_key\";s:144:\"BCpkADawqM18vdrb6kOdPSItBdtNy_nRdlHq9ltCVVG0n6FniJauupbrfxZDJlTEtWOiuUQd_OAn6Fw0Uf7dN_6Nh2XcwkvXrC91dKWSFIyGstWD1QwaS3mKWtA4Uz1kCsyyJVDwh2yiujcY\";s:5:\"video\";N;}s:13:\"compatibility\";b:1;s:2:\"id\";s:9:\"2N7wx9DlN\";s:7:\"preload\";s:8:\"metadata\";s:8:\"autoplay\";b:1;s:17:\"fullscreenControl\";b:1;s:20:\"studio_configuration\";a:1:{s:6:\"player\";a:4:{s:5:\"width\";i:4;s:6:\"height\";i:750;s:8:\"adjusted\";b:0;s:10:\"responsive\";b:0;}}s:11:\"autoadvance\";i:0;s:7:\"plugins\";a:2:{i:0;a:2:{s:7:\"options\";a:2:{s:19:\"useResolutionLabels\";b:0;s:23:\"resolutionLabelBitrates\";b:1;}s:4:\"name\";s:11:\"qualityMenu\";}i:1;a:2:{s:7:\"options\";a:7:{s:9:\"serverUrl\";s:14:\"this is my url\";s:7:\"timeout\";i:4000;s:12:\"hardTimeouts\";b:1;s:11:\"requestMode\";s:6:\"onload\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:9:\"vpaidMode\";s:7:\"ENABLED\";s:17:\"useMediaCuePoints\";b:0;}s:4:\"name\";s:4:\"ima3\";}}s:7:\"scripts\";a:2:{i:0;s:75:\"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.min.js\";i:1;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:11:\"stylesheets\";a:2:{i:0;s:72:\"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.css\";i:1;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}s:8:\"playlist\";b:1;}s:10:\"updated_at\";s:24:\"2018-09-07T10:47:29.154Z\";s:19:\"template_updated_at\";s:24:\"2018-08-30T20:20:58.256Z\";s:11:\"preview_url\";s:122:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/2N7wx9DlN/preview/embeds/default/master/index.html\";}s:6:\"master\";a:4:{s:13:\"configuration\";a:13:{s:8:\"playlist\";b:1;s:11:\"stylesheets\";a:2:{i:0;s:72:\"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.css\";i:1;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}s:7:\"scripts\";a:2:{i:0;s:75:\"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.min.js\";i:1;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:7:\"plugins\";a:2:{i:0;a:2:{s:7:\"options\";a:2:{s:23:\"resolutionLabelBitrates\";b:1;s:19:\"useResolutionLabels\";b:0;}s:4:\"name\";s:11:\"qualityMenu\";}i:1;a:2:{s:7:\"options\";a:7:{s:17:\"useMediaCuePoints\";b:0;s:9:\"vpaidMode\";s:7:\"ENABLED\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:11:\"requestMode\";s:6:\"onload\";s:12:\"hardTimeouts\";b:1;s:7:\"timeout\";i:4000;s:9:\"serverUrl\";s:14:\"this is my url\";}s:4:\"name\";s:4:\"ima3\";}}s:11:\"autoadvance\";i:0;s:20:\"studio_configuration\";a:1:{s:6:\"player\";a:4:{s:10:\"responsive\";b:0;s:8:\"adjusted\";b:0;s:6:\"height\";i:750;s:5:\"width\";i:4;}}s:17:\"fullscreenControl\";b:1;s:8:\"autoplay\";b:1;s:7:\"preload\";s:8:\"metadata\";s:2:\"id\";s:9:\"2N7wx9DlN\";s:13:\"compatibility\";b:1;s:11:\"video_cloud\";a:2:{s:5:\"video\";N;s:10:\"policy_key\";s:144:\"BCpkADawqM18vdrb6kOdPSItBdtNy_nRdlHq9ltCVVG0n6FniJauupbrfxZDJlTEtWOiuUQd_OAn6Fw0Uf7dN_6Nh2XcwkvXrC91dKWSFIyGstWD1QwaS3mKWtA4Uz1kCsyyJVDwh2yiujcY\";}s:6:\"player\";a:2:{s:8:\"inactive\";b:0;s:8:\"template\";a:4:{s:13:\"version_alias\";N;s:6:\"locked\";b:0;s:4:\"name\";s:21:\"single-video-template\";s:7:\"version\";s:6:\"6.22.7\";}}}s:10:\"updated_at\";s:24:\"2018-09-07T10:47:28.544Z\";s:19:\"template_updated_at\";s:24:\"2018-08-30T20:21:08.336Z\";s:11:\"preview_url\";s:121:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/2N7wx9DlN/master/embeds/default/master/index.html\";}}', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('2N7wx9DlN', 'created_at', '2018-08-20T05:23:34.304Z', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('2N7wx9DlN', 'url', 'http://players.brightcove.net/5814665417001/2N7wx9DlN_default/index.html', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('2N7wx9DlN', 'embed_count', '1', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('2N7wx9DlN', 'accountId', '5814665417001', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('Ksc5sbbZq', 'id', 'Ksc5sbbZq', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('Ksc5sbbZq', 'name', 'Mid Ad Post Ad  using Cue Points', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('Ksc5sbbZq', 'description', 'Mid Ad Post Ad  using Cue Points', '2018-09-10 06:48:04', '2018-09-10 06:48:04'),
('Ksc5sbbZq', 'branches', 'a:2:{s:7:\"preview\";a:4:{s:13:\"configuration\";a:8:{s:6:\"player\";a:1:{s:8:\"template\";a:2:{s:7:\"version\";s:6:\"6.22.7\";s:4:\"name\";s:21:\"single-video-template\";}}s:11:\"video_cloud\";a:2:{s:10:\"policy_key\";s:144:\"BCpkADawqM2oSmt6f0PMEnLmHYUkqC4qfLov4TkCnXNKnZgkOH-s2Xhxu034OIr5HuKthLfh6JJRt61fFvsyssGfHhzYPK5A1wZVbNcLLt1z08brHd0v13ryJuZWO0q5NM4KyeLpTRAFXoeE\";s:5:\"video\";N;}s:13:\"compatibility\";b:1;s:7:\"plugins\";a:1:{i:0;a:2:{s:7:\"options\";a:7:{s:9:\"serverUrl\";s:240:\"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/single_ad_samples&ciu_szs=300x250&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ct%3Dlinear&correlator=\";s:7:\"timeout\";i:4000;s:12:\"hardTimeouts\";b:1;s:11:\"requestMode\";s:5:\"oncue\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:9:\"vpaidMode\";s:7:\"ENABLED\";s:17:\"useMediaCuePoints\";b:1;}s:4:\"name\";s:4:\"ima3\";}}s:7:\"scripts\";a:1:{i:0;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:11:\"stylesheets\";a:1:{i:0;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}s:2:\"id\";s:9:\"Ksc5sbbZq\";s:20:\"studio_configuration\";a:1:{s:12:\"availability\";a:2:{s:7:\"domains\";a:0:{}s:10:\"policy_key\";s:144:\"BCpkADawqM2oSmt6f0PMEnLmHYUkqC4qfLov4TkCnXNKnZgkOH-s2Xhxu034OIr5HuKthLfh6JJRt61fFvsyssGfHhzYPK5A1wZVbNcLLt1z08brHd0v13ryJuZWO0q5NM4KyeLpTRAFXoeE\";}}}s:10:\"updated_at\";s:24:\"2018-08-14T08:23:13.008Z\";s:19:\"template_updated_at\";s:24:\"2018-08-30T20:20:58.256Z\";s:11:\"preview_url\";s:122:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/Ksc5sbbZq/preview/embeds/default/master/index.html\";}s:6:\"master\";a:4:{s:13:\"configuration\";a:8:{s:20:\"studio_configuration\";a:1:{s:12:\"availability\";a:2:{s:10:\"policy_key\";s:144:\"BCpkADawqM2oSmt6f0PMEnLmHYUkqC4qfLov4TkCnXNKnZgkOH-s2Xhxu034OIr5HuKthLfh6JJRt61fFvsyssGfHhzYPK5A1wZVbNcLLt1z08brHd0v13ryJuZWO0q5NM4KyeLpTRAFXoeE\";s:7:\"domains\";a:0:{}}}s:2:\"id\";s:9:\"Ksc5sbbZq\";s:11:\"stylesheets\";a:1:{i:0;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}s:7:\"scripts\";a:1:{i:0;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:7:\"plugins\";a:1:{i:0;a:2:{s:7:\"options\";a:7:{s:17:\"useMediaCuePoints\";b:1;s:9:\"vpaidMode\";s:7:\"ENABLED\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:11:\"requestMode\";s:5:\"oncue\";s:12:\"hardTimeouts\";b:1;s:7:\"timeout\";i:4000;s:9:\"serverUrl\";s:240:\"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/single_ad_samples&ciu_szs=300x250&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ct%3Dlinear&correlator=\";}s:4:\"name\";s:4:\"ima3\";}}s:13:\"compatibility\";b:1;s:11:\"video_cloud\";a:2:{s:5:\"video\";N;s:10:\"policy_key\";s:144:\"BCpkADawqM2oSmt6f0PMEnLmHYUkqC4qfLov4TkCnXNKnZgkOH-s2Xhxu034OIr5HuKthLfh6JJRt61fFvsyssGfHhzYPK5A1wZVbNcLLt1z08brHd0v13ryJuZWO0q5NM4KyeLpTRAFXoeE\";}s:6:\"player\";a:1:{s:8:\"template\";a:2:{s:4:\"name\";s:21:\"single-video-template\";s:7:\"version\";s:6:\"6.22.7\";}}}s:10:\"updated_at\";s:24:\"2018-08-14T08:23:11.932Z\";s:19:\"template_updated_at\";s:24:\"2018-08-30T20:21:08.336Z\";s:11:\"preview_url\";s:121:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/Ksc5sbbZq/master/embeds/default/master/index.html\";}}', '2018-09-10 06:48:04', '2018-09-10 06:48:04'),
('Ksc5sbbZq', 'created_at', '2018-08-14T07:53:03.778Z', '2018-09-10 06:48:04', '2018-09-10 06:48:04'),
('Ksc5sbbZq', 'url', 'http://players.brightcove.net/5814665417001/Ksc5sbbZq_default/index.html', '2018-09-10 06:48:04', '2018-09-10 06:48:04'),
('Ksc5sbbZq', 'embed_count', '1', '2018-09-10 06:48:04', '2018-09-10 06:48:04'),
('Ksc5sbbZq', 'accountId', '5814665417001', '2018-09-10 06:48:04', '2018-09-10 06:48:04'),
('oI9Ys62fi', 'id', 'oI9Ys62fi', '2018-09-10 06:48:07', '2018-09-10 06:48:07'),
('oI9Ys62fi', 'name', 'Pre-Roll Ad - On Load - Skip', '2018-09-10 06:48:07', '2018-09-10 06:48:07'),
('oI9Ys62fi', 'description', 'Pre-Roll Ad - On Load', '2018-09-10 06:48:07', '2018-09-10 06:48:07'),
('oI9Ys62fi', 'branches', 'a:2:{s:6:\"master\";a:4:{s:19:\"template_updated_at\";s:24:\"2018-08-30T20:21:08.336Z\";s:10:\"updated_at\";s:24:\"2018-08-14T05:59:10.818Z\";s:13:\"configuration\";a:9:{s:6:\"player\";a:1:{s:8:\"template\";a:2:{s:7:\"version\";s:6:\"6.22.7\";s:4:\"name\";s:21:\"single-video-template\";}}s:11:\"video_cloud\";a:2:{s:10:\"policy_key\";s:144:\"BCpkADawqM0Z5JvQNM7nZ74t7QiN3zVbjQOYgFIOqtPh8FLYEiPXmUugNI0BTl5FkJZ6Q0QIkDMZrVDQ6qWRDxOf_O2t5ZHx13CZO62bcZ5Arwy_7Zt5gICeyI2RRs3AJVhctHRYiPQRqulk\";s:5:\"video\";N;}s:13:\"compatibility\";b:1;s:7:\"plugins\";a:2:{i:0;a:2:{s:7:\"options\";a:7:{s:11:\"deeplinking\";b:0;s:5:\"title\";s:0:\"\";s:11:\"description\";s:0:\"\";s:3:\"url\";s:0:\"\";s:6:\"offset\";s:0:\"\";s:8:\"services\";a:6:{s:8:\"facebook\";b:1;s:6:\"google\";b:1;s:7:\"twitter\";b:1;s:9:\"pinterest\";b:1;s:8:\"linkedin\";b:1;s:6:\"tumblr\";b:1;}s:17:\"displayAfterVideo\";b:1;}s:4:\"name\";s:6:\"social\";}i:1;a:2:{s:7:\"options\";a:7:{s:9:\"serverUrl\";s:249:\"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/single_ad_samples&ciu_szs=300x250&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ct%3Dskippablelinear&correlator=\";s:7:\"timeout\";i:4000;s:12:\"hardTimeouts\";b:1;s:11:\"requestMode\";s:6:\"onload\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:9:\"vpaidMode\";s:7:\"ENABLED\";s:17:\"useMediaCuePoints\";b:0;}s:4:\"name\";s:4:\"ima3\";}}s:7:\"scripts\";a:2:{i:0;s:63:\"//players.brightcove.net/videojs-social/3/videojs-social.min.js\";i:1;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:11:\"stylesheets\";a:2:{i:0;s:60:\"//players.brightcove.net/videojs-social/3/videojs-social.css\";i:1;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}s:3:\"css\";a:3:{s:12:\"controlColor\";s:4:\"#fff\";s:15:\"controlBarColor\";s:19:\"rgba(0, 0, 0, 0.45)\";s:13:\"progressColor\";s:7:\"#d52484\";}s:4:\"skin\";N;s:4:\"dock\";b:1;}s:11:\"preview_url\";s:121:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/oI9Ys62fi/master/embeds/default/master/index.html\";}s:7:\"preview\";a:4:{s:19:\"template_updated_at\";s:24:\"2018-08-30T20:20:58.256Z\";s:10:\"updated_at\";s:24:\"2018-08-14T05:59:11.842Z\";s:13:\"configuration\";a:9:{s:4:\"dock\";b:1;s:4:\"skin\";N;s:3:\"css\";a:3:{s:13:\"progressColor\";s:7:\"#d52484\";s:15:\"controlBarColor\";s:19:\"rgba(0, 0, 0, 0.45)\";s:12:\"controlColor\";s:4:\"#fff\";}s:11:\"stylesheets\";a:2:{i:0;s:60:\"//players.brightcove.net/videojs-social/3/videojs-social.css\";i:1;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}s:7:\"scripts\";a:2:{i:0;s:63:\"//players.brightcove.net/videojs-social/3/videojs-social.min.js\";i:1;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:7:\"plugins\";a:2:{i:0;a:2:{s:7:\"options\";a:7:{s:17:\"displayAfterVideo\";b:1;s:8:\"services\";a:6:{s:6:\"tumblr\";b:1;s:8:\"linkedin\";b:1;s:9:\"pinterest\";b:1;s:7:\"twitter\";b:1;s:6:\"google\";b:1;s:8:\"facebook\";b:1;}s:6:\"offset\";s:0:\"\";s:3:\"url\";s:0:\"\";s:11:\"description\";s:0:\"\";s:5:\"title\";s:0:\"\";s:11:\"deeplinking\";b:0;}s:4:\"name\";s:6:\"social\";}i:1;a:2:{s:7:\"options\";a:7:{s:17:\"useMediaCuePoints\";b:0;s:9:\"vpaidMode\";s:7:\"ENABLED\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:11:\"requestMode\";s:6:\"onload\";s:12:\"hardTimeouts\";b:1;s:7:\"timeout\";i:4000;s:9:\"serverUrl\";s:249:\"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/single_ad_samples&ciu_szs=300x250&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ct%3Dskippablelinear&correlator=\";}s:4:\"name\";s:4:\"ima3\";}}s:13:\"compatibility\";b:1;s:11:\"video_cloud\";a:2:{s:5:\"video\";N;s:10:\"policy_key\";s:144:\"BCpkADawqM0Z5JvQNM7nZ74t7QiN3zVbjQOYgFIOqtPh8FLYEiPXmUugNI0BTl5FkJZ6Q0QIkDMZrVDQ6qWRDxOf_O2t5ZHx13CZO62bcZ5Arwy_7Zt5gICeyI2RRs3AJVhctHRYiPQRqulk\";}s:6:\"player\";a:1:{s:8:\"template\";a:2:{s:4:\"name\";s:21:\"single-video-template\";s:7:\"version\";s:6:\"6.22.7\";}}}s:11:\"preview_url\";s:122:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/oI9Ys62fi/preview/embeds/default/master/index.html\";}}', '2018-09-10 06:48:07', '2018-09-10 06:48:07'),
('oI9Ys62fi', 'created_at', '2018-08-14T05:47:54.541Z', '2018-09-10 06:48:07', '2018-09-10 06:48:07'),
('oI9Ys62fi', 'url', 'http://players.brightcove.net/5814665417001/oI9Ys62fi_default/index.html', '2018-09-10 06:48:07', '2018-09-10 06:48:07'),
('oI9Ys62fi', 'embed_count', '1', '2018-09-10 06:48:07', '2018-09-10 06:48:07'),
('oI9Ys62fi', 'accountId', '5814665417001', '2018-09-10 06:48:07', '2018-09-10 06:48:07'),
('t96CU0JUI', 'id', 't96CU0JUI', '2018-09-10 06:48:08', '2018-09-10 06:48:08'),
('t96CU0JUI', 'name', 'Pre  / Mid / Post - On Load', '2018-09-10 06:48:08', '2018-09-10 06:48:08'),
('t96CU0JUI', 'description', '', '2018-09-10 06:48:08', '2018-09-10 06:48:08'),
('t96CU0JUI', 'branches', 'a:2:{s:6:\"master\";a:4:{s:19:\"template_updated_at\";s:24:\"2018-08-30T20:21:08.336Z\";s:10:\"updated_at\";s:24:\"2018-08-14T08:47:28.308Z\";s:13:\"configuration\";a:6:{s:7:\"plugins\";a:1:{i:0;a:2:{s:7:\"options\";a:7:{s:17:\"useMediaCuePoints\";b:0;s:9:\"vpaidMode\";s:7:\"ENABLED\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:11:\"requestMode\";s:6:\"onload\";s:12:\"hardTimeouts\";b:1;s:7:\"timeout\";i:4000;s:9:\"serverUrl\";s:282:\"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostpod&cmsid=496&vid=short_onecue&correlator=\";}s:4:\"name\";s:4:\"ima3\";}}s:13:\"compatibility\";b:1;s:11:\"video_cloud\";a:2:{s:5:\"video\";N;s:10:\"policy_key\";s:144:\"BCpkADawqM075RwoD8PAw8vGI9OAScJBoqwKjawxtb4RAy5X7WnPuCTEsbBdwe7kTj3nLLIfpTG8hJQoPMI42ceftbIFjbCG5myIwGupiEvM0ipr2TD8mTtu_lTVzqpZGxxO2D79r3ztImzr\";}s:6:\"player\";a:1:{s:8:\"template\";a:2:{s:4:\"name\";s:21:\"single-video-template\";s:7:\"version\";s:6:\"6.22.7\";}}s:7:\"scripts\";a:1:{i:0;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:11:\"stylesheets\";a:1:{i:0;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}}s:11:\"preview_url\";s:121:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/t96CU0JUI/master/embeds/default/master/index.html\";}s:7:\"preview\";a:4:{s:19:\"template_updated_at\";s:24:\"2018-08-30T20:20:58.256Z\";s:10:\"updated_at\";s:24:\"2018-08-14T08:47:29.071Z\";s:13:\"configuration\";a:6:{s:6:\"player\";a:1:{s:8:\"template\";a:2:{s:7:\"version\";s:6:\"6.22.7\";s:4:\"name\";s:21:\"single-video-template\";}}s:11:\"video_cloud\";a:2:{s:10:\"policy_key\";s:144:\"BCpkADawqM075RwoD8PAw8vGI9OAScJBoqwKjawxtb4RAy5X7WnPuCTEsbBdwe7kTj3nLLIfpTG8hJQoPMI42ceftbIFjbCG5myIwGupiEvM0ipr2TD8mTtu_lTVzqpZGxxO2D79r3ztImzr\";s:5:\"video\";N;}s:13:\"compatibility\";b:1;s:7:\"plugins\";a:1:{i:0;a:2:{s:7:\"options\";a:7:{s:9:\"serverUrl\";s:282:\"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostpod&cmsid=496&vid=short_onecue&correlator=\";s:7:\"timeout\";i:4000;s:12:\"hardTimeouts\";b:1;s:11:\"requestMode\";s:6:\"onload\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:9:\"vpaidMode\";s:7:\"ENABLED\";s:17:\"useMediaCuePoints\";b:0;}s:4:\"name\";s:4:\"ima3\";}}s:7:\"scripts\";a:1:{i:0;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:11:\"stylesheets\";a:1:{i:0;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}}s:11:\"preview_url\";s:122:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/t96CU0JUI/preview/embeds/default/master/index.html\";}}', '2018-09-10 06:48:08', '2018-09-10 06:48:08'),
('t96CU0JUI', 'created_at', '2018-08-14T08:47:08.055Z', '2018-09-10 06:48:08', '2018-09-10 06:48:08'),
('t96CU0JUI', 'url', 'http://players.brightcove.net/5814665417001/t96CU0JUI_default/index.html', '2018-09-10 06:48:08', '2018-09-10 06:48:08'),
('t96CU0JUI', 'embed_count', '1', '2018-09-10 06:48:08', '2018-09-10 06:48:08'),
('t96CU0JUI', 'accountId', '5814665417001', '2018-09-10 06:48:09', '2018-09-10 06:48:09'),
('tRMX2rkxce', 'id', 'tRMX2rkxce', '2018-09-10 06:48:09', '2018-09-10 06:48:09'),
('tRMX2rkxce', 'name', 'Post / Pre / Mid - On Cue Point', '2018-09-10 06:48:09', '2018-09-10 06:48:09'),
('tRMX2rkxce', 'description', '', '2018-09-10 06:48:09', '2018-09-10 06:48:09'),
('tRMX2rkxce', 'branches', 'a:2:{s:7:\"preview\";a:4:{s:13:\"configuration\";a:6:{s:6:\"player\";a:1:{s:8:\"template\";a:2:{s:7:\"version\";s:6:\"6.22.7\";s:4:\"name\";s:21:\"single-video-template\";}}s:11:\"video_cloud\";a:2:{s:10:\"policy_key\";s:144:\"BCpkADawqM01n2-_4nIxvBma2qyKBjwSAU34rAlTK1wYe52UYzXuR8vln0nuO6YUWxZizGAabxuidXtLi3tAtgFrJxLpfpGeUkgUx3cRpLLC_Hy2sPGov6oeiA1kxWnkxSDtEMMmAS19SIfU\";s:5:\"video\";N;}s:13:\"compatibility\";b:1;s:7:\"plugins\";a:1:{i:0;a:2:{s:7:\"options\";a:7:{s:9:\"serverUrl\";s:282:\"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostpod&cmsid=496&vid=short_onecue&correlator=\";s:7:\"timeout\";i:4000;s:12:\"hardTimeouts\";b:1;s:11:\"requestMode\";s:5:\"oncue\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:9:\"vpaidMode\";s:7:\"ENABLED\";s:17:\"useMediaCuePoints\";b:1;}s:4:\"name\";s:4:\"ima3\";}}s:7:\"scripts\";a:1:{i:0;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:11:\"stylesheets\";a:1:{i:0;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}}s:10:\"updated_at\";s:24:\"2018-08-14T08:46:43.560Z\";s:19:\"template_updated_at\";s:24:\"2018-08-30T20:20:58.256Z\";s:11:\"preview_url\";s:123:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/tRMX2rkxce/preview/embeds/default/master/index.html\";}s:6:\"master\";a:4:{s:13:\"configuration\";a:6:{s:6:\"player\";a:1:{s:8:\"template\";a:2:{s:7:\"version\";s:6:\"6.22.7\";s:4:\"name\";s:21:\"single-video-template\";}}s:11:\"video_cloud\";a:2:{s:10:\"policy_key\";s:144:\"BCpkADawqM01n2-_4nIxvBma2qyKBjwSAU34rAlTK1wYe52UYzXuR8vln0nuO6YUWxZizGAabxuidXtLi3tAtgFrJxLpfpGeUkgUx3cRpLLC_Hy2sPGov6oeiA1kxWnkxSDtEMMmAS19SIfU\";s:5:\"video\";N;}s:13:\"compatibility\";b:1;s:7:\"plugins\";a:1:{i:0;a:2:{s:7:\"options\";a:7:{s:9:\"serverUrl\";s:282:\"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostpod&cmsid=496&vid=short_onecue&correlator=\";s:7:\"timeout\";i:4000;s:12:\"hardTimeouts\";b:1;s:11:\"requestMode\";s:5:\"oncue\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:9:\"vpaidMode\";s:7:\"ENABLED\";s:17:\"useMediaCuePoints\";b:1;}s:4:\"name\";s:4:\"ima3\";}}s:7:\"scripts\";a:1:{i:0;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";}s:11:\"stylesheets\";a:1:{i:0;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";}}s:10:\"updated_at\";s:24:\"2018-08-14T08:46:42.466Z\";s:19:\"template_updated_at\";s:24:\"2018-08-30T20:21:08.336Z\";s:11:\"preview_url\";s:122:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/tRMX2rkxce/master/embeds/default/master/index.html\";}}', '2018-09-10 06:48:09', '2018-09-10 06:48:09'),
('tRMX2rkxce', 'created_at', '2018-08-14T08:40:44.979Z', '2018-09-10 06:48:10', '2018-09-10 06:48:10'),
('tRMX2rkxce', 'url', 'http://players.brightcove.net/5814665417001/tRMX2rkxce_default/index.html', '2018-09-10 06:48:10', '2018-09-10 06:48:10'),
('tRMX2rkxce', 'embed_count', '1', '2018-09-10 06:48:10', '2018-09-10 06:48:10'),
('tRMX2rkxce', 'accountId', '5814665417001', '2018-09-10 06:48:10', '2018-09-10 06:48:10'),
('default', 'id', 'default', '2018-10-04 02:19:33', '2018-10-04 02:19:33'),
('default', 'name', 'Default', '2018-10-04 02:19:33', '2018-10-04 02:19:33'),
('default', 'description', 'This is an instance of the Brightcove Default Player.  You can modify this or choose to create your own.', '2018-10-04 02:19:34', '2018-10-04 02:19:34'),
('default', 'branches', 'a:2:{s:7:\"preview\";a:4:{s:13:\"configuration\";a:13:{s:11:\"autoadvance\";N;s:20:\"studio_configuration\";a:1:{s:6:\"player\";a:4:{s:8:\"adjusted\";b:1;s:6:\"height\";i:500;s:5:\"width\";i:1000;s:10:\"responsive\";b:0;}}s:17:\"fullscreenControl\";b:1;s:8:\"autoplay\";b:0;s:7:\"preload\";s:8:\"metadata\";s:2:\"id\";s:7:\"default\";s:8:\"playlist\";b:1;s:11:\"stylesheets\";a:2:{i:0;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";i:1;s:60:\"//players.brightcove.net/videojs-social/3/videojs-social.css\";}s:7:\"scripts\";a:2:{i:0;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";i:1;s:63:\"//players.brightcove.net/videojs-social/3/videojs-social.min.js\";}s:7:\"plugins\";a:2:{i:0;a:2:{s:7:\"options\";a:8:{s:5:\"debug\";b:1;s:9:\"serverUrl\";s:76:\"https://solutions.brightcove.com/bcls/brightcove-player/vmap/simple-vast.xml\";s:7:\"timeout\";i:4000;s:12:\"hardTimeouts\";b:1;s:11:\"requestMode\";s:6:\"onload\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:9:\"vpaidMode\";s:7:\"ENABLED\";s:17:\"useMediaCuePoints\";b:0;}s:4:\"name\";s:4:\"ima3\";}i:1;a:2:{s:7:\"options\";a:6:{s:8:\"services\";a:6:{s:6:\"tumblr\";b:1;s:8:\"linkedin\";b:1;s:9:\"pinterest\";b:1;s:7:\"twitter\";b:1;s:6:\"google\";b:1;s:8:\"facebook\";b:1;}s:6:\"offset\";s:0:\"\";s:3:\"url\";s:0:\"\";s:11:\"description\";s:0:\"\";s:5:\"title\";s:0:\"\";s:11:\"deeplinking\";b:0;}s:4:\"name\";s:6:\"social\";}}s:13:\"compatibility\";b:1;s:11:\"video_cloud\";a:1:{s:10:\"policy_key\";s:144:\"BCpkADawqM1iixelIj-0MIQMwqT_Ao15-xjQCUPkR58CufdeDJ7f2D9KFiyEPQ8dUQpddNmxvezZeDDucgOuqancYnny_frTsUnRalHp0BrNaM5RJ9sxoMkqccTxWmpnNB3xs53GU28ZM0BD\";}s:6:\"player\";a:2:{s:8:\"inactive\";b:0;s:8:\"template\";a:4:{s:13:\"version_alias\";N;s:6:\"locked\";b:0;s:4:\"name\";s:21:\"single-video-template\";s:7:\"version\";s:6:\"6.24.1\";}}}s:10:\"updated_at\";s:24:\"2018-09-10T12:46:12.201Z\";s:19:\"template_updated_at\";s:24:\"2018-09-19T13:53:34.436Z\";s:11:\"preview_url\";s:120:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/default/preview/embeds/default/master/index.html\";}s:6:\"master\";a:4:{s:13:\"configuration\";a:13:{s:6:\"player\";a:2:{s:8:\"template\";a:4:{s:7:\"version\";s:6:\"6.24.1\";s:4:\"name\";s:21:\"single-video-template\";s:6:\"locked\";b:0;s:13:\"version_alias\";N;}s:8:\"inactive\";b:0;}s:11:\"video_cloud\";a:1:{s:10:\"policy_key\";s:144:\"BCpkADawqM1iixelIj-0MIQMwqT_Ao15-xjQCUPkR58CufdeDJ7f2D9KFiyEPQ8dUQpddNmxvezZeDDucgOuqancYnny_frTsUnRalHp0BrNaM5RJ9sxoMkqccTxWmpnNB3xs53GU28ZM0BD\";}s:13:\"compatibility\";b:1;s:7:\"plugins\";a:2:{i:0;a:2:{s:7:\"options\";a:8:{s:17:\"useMediaCuePoints\";b:0;s:9:\"vpaidMode\";s:7:\"ENABLED\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:11:\"requestMode\";s:6:\"onload\";s:12:\"hardTimeouts\";b:1;s:7:\"timeout\";i:4000;s:9:\"serverUrl\";s:76:\"https://solutions.brightcove.com/bcls/brightcove-player/vmap/simple-vast.xml\";s:5:\"debug\";b:1;}s:4:\"name\";s:4:\"ima3\";}i:1;a:2:{s:7:\"options\";a:6:{s:11:\"deeplinking\";b:0;s:5:\"title\";s:0:\"\";s:11:\"description\";s:0:\"\";s:3:\"url\";s:0:\"\";s:6:\"offset\";s:0:\"\";s:8:\"services\";a:6:{s:8:\"facebook\";b:1;s:6:\"google\";b:1;s:7:\"twitter\";b:1;s:9:\"pinterest\";b:1;s:8:\"linkedin\";b:1;s:6:\"tumblr\";b:1;}}s:4:\"name\";s:6:\"social\";}}s:7:\"scripts\";a:2:{i:0;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";i:1;s:63:\"//players.brightcove.net/videojs-social/3/videojs-social.min.js\";}s:11:\"stylesheets\";a:2:{i:0;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";i:1;s:60:\"//players.brightcove.net/videojs-social/3/videojs-social.css\";}s:8:\"playlist\";b:1;s:2:\"id\";s:7:\"default\";s:7:\"preload\";s:8:\"metadata\";s:8:\"autoplay\";b:0;s:17:\"fullscreenControl\";b:1;s:20:\"studio_configuration\";a:1:{s:6:\"player\";a:4:{s:10:\"responsive\";b:0;s:5:\"width\";i:1000;s:6:\"height\";i:500;s:8:\"adjusted\";b:1;}}s:11:\"autoadvance\";N;}s:10:\"updated_at\";s:24:\"2018-09-10T12:46:11.427Z\";s:19:\"template_updated_at\";s:24:\"2018-09-19T13:53:39.567Z\";s:11:\"preview_url\";s:119:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/default/master/embeds/default/master/index.html\";}}', '2018-10-04 02:19:34', '2018-10-04 02:19:34'),
('default', 'created_at', '2018-08-13T12:41:13.175Z', '2018-10-04 02:19:34', '2018-10-04 02:19:34'),
('default', 'url', 'http://players.brightcove.net/5814665417001/default_default/index.html', '2018-10-04 02:19:34', '2018-10-04 02:19:34'),
('default', 'embed_count', '1', '2018-10-04 02:19:34', '2018-10-04 02:19:34'),
('default', 'accountId', '5814665417001', '2018-10-04 02:19:34', '2018-10-04 02:19:34'),
('iGAicgqoE9', 'id', 'iGAicgqoE9', '2018-10-04 02:19:34', '2018-10-04 02:19:34'),
('iGAicgqoE9', 'name', 'Pre-Roll Ad - On Load - Without Skip', '2018-10-04 02:19:34', '2018-10-04 02:19:34'),
('iGAicgqoE9', 'description', 'Pre-Roll Ad - On Load - Without Skip', '2018-10-04 02:19:34', '2018-10-04 02:19:34');
INSERT INTO `mm_player_metas` (`player_id`, `meta_key`, `meta_value`, `created_at`, `updated_at`) VALUES
('iGAicgqoE9', 'branches', 'a:2:{s:6:\"master\";a:4:{s:19:\"template_updated_at\";s:24:\"2018-09-19T13:53:39.567Z\";s:10:\"updated_at\";s:24:\"2018-10-01T09:32:58.478Z\";s:13:\"configuration\";a:16:{s:4:\"skin\";N;s:4:\"dock\";b:0;s:3:\"css\";a:3:{s:13:\"progressColor\";s:7:\"#d52484\";s:15:\"controlBarColor\";s:19:\"rgba(0, 0, 0, 0.45)\";s:12:\"controlColor\";s:4:\"#fff\";}s:6:\"player\";a:2:{s:8:\"template\";a:4:{s:7:\"version\";s:6:\"6.24.1\";s:4:\"name\";s:21:\"single-video-template\";s:6:\"locked\";b:0;s:13:\"version_alias\";N;}s:8:\"inactive\";b:0;}s:11:\"video_cloud\";a:2:{s:10:\"policy_key\";s:144:\"BCpkADawqM2G8ohoqYCsuhgErbjXN5r3P-dHF1L76n5RIrHQMDL_8OT_YdWyoaek9iSnRCg_1W8KLy33_G69aD6qhKLJYEFedEHtO0UeE_mGzG9isd8yaW20aI_kzn-KVPyazm1S0mQbn9o6\";s:5:\"video\";N;}s:13:\"compatibility\";b:1;s:7:\"plugins\";a:4:{i:0;a:2:{s:7:\"options\";a:7:{s:9:\"serverUrl\";s:76:\"https://solutions.brightcove.com/bcls/brightcove-player/vmap/simple-vast.xml\";s:7:\"timeout\";i:4000;s:12:\"hardTimeouts\";b:1;s:11:\"requestMode\";s:6:\"onload\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:9:\"vpaidMode\";s:7:\"ENABLED\";s:17:\"useMediaCuePoints\";b:0;}s:4:\"name\";s:4:\"ima3\";}i:1;a:2:{s:7:\"options\";a:1:{s:19:\"useResolutionLabels\";b:1;}s:4:\"name\";s:11:\"qualityMenu\";}i:2;a:2:{s:7:\"options\";a:6:{s:11:\"deeplinking\";b:1;s:5:\"title\";s:0:\"\";s:11:\"description\";s:0:\"\";s:3:\"url\";s:0:\"\";s:6:\"offset\";s:0:\"\";s:8:\"services\";a:6:{s:8:\"facebook\";b:1;s:6:\"google\";b:1;s:7:\"twitter\";b:1;s:9:\"pinterest\";b:1;s:8:\"linkedin\";b:1;s:6:\"tumblr\";b:1;}}s:4:\"name\";s:6:\"social\";}i:3;a:2:{s:7:\"options\";a:7:{s:11:\"autoadvance\";i:0;s:10:\"nextButton\";b:1;s:13:\"nextEndscreen\";b:0;s:11:\"nextOverlay\";b:0;s:12:\"playOnSelect\";b:1;s:6:\"repeat\";b:0;s:7:\"shuffle\";b:0;}s:4:\"name\";s:12:\"bcPlaylistUi\";}}s:7:\"scripts\";a:4:{i:0;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";i:1;s:75:\"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.min.js\";i:2;s:63:\"//players.brightcove.net/videojs-social/3/videojs-social.min.js\";i:3;s:79:\"//players.brightcove.net/videojs-bc-playlist-ui/3/videojs-bc-playlist-ui.min.js\";}s:11:\"stylesheets\";a:4:{i:0;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";i:1;s:72:\"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.css\";i:2;s:60:\"//players.brightcove.net/videojs-social/3/videojs-social.css\";i:3;s:76:\"//players.brightcove.net/videojs-bc-playlist-ui/3/videojs-bc-playlist-ui.css\";}s:2:\"id\";s:10:\"iGAicgqoE9\";s:7:\"preload\";s:4:\"auto\";s:8:\"autoplay\";b:0;s:17:\"fullscreenControl\";b:1;s:20:\"studio_configuration\";a:1:{s:6:\"player\";a:4:{s:10:\"responsive\";b:1;s:5:\"width\";i:300;s:6:\"height\";i:150;s:8:\"adjusted\";b:1;}}s:11:\"autoadvance\";i:0;s:8:\"playlist\";b:1;}s:11:\"preview_url\";s:122:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/iGAicgqoE9/master/embeds/default/master/index.html\";}s:7:\"preview\";a:4:{s:19:\"template_updated_at\";s:24:\"2018-09-19T13:53:34.436Z\";s:10:\"updated_at\";s:24:\"2018-10-01T09:32:59.650Z\";s:13:\"configuration\";a:16:{s:8:\"playlist\";b:1;s:11:\"autoadvance\";i:0;s:20:\"studio_configuration\";a:1:{s:6:\"player\";a:4:{s:8:\"adjusted\";b:1;s:6:\"height\";i:150;s:5:\"width\";i:300;s:10:\"responsive\";b:1;}}s:17:\"fullscreenControl\";b:1;s:8:\"autoplay\";b:0;s:7:\"preload\";s:4:\"auto\";s:2:\"id\";s:10:\"iGAicgqoE9\";s:11:\"stylesheets\";a:4:{i:0;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";i:1;s:72:\"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.css\";i:2;s:60:\"//players.brightcove.net/videojs-social/3/videojs-social.css\";i:3;s:76:\"//players.brightcove.net/videojs-bc-playlist-ui/3/videojs-bc-playlist-ui.css\";}s:7:\"scripts\";a:4:{i:0;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";i:1;s:75:\"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.min.js\";i:2;s:63:\"//players.brightcove.net/videojs-social/3/videojs-social.min.js\";i:3;s:79:\"//players.brightcove.net/videojs-bc-playlist-ui/3/videojs-bc-playlist-ui.min.js\";}s:7:\"plugins\";a:4:{i:0;a:2:{s:7:\"options\";a:7:{s:17:\"useMediaCuePoints\";b:0;s:9:\"vpaidMode\";s:7:\"ENABLED\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:11:\"requestMode\";s:6:\"onload\";s:12:\"hardTimeouts\";b:1;s:7:\"timeout\";i:4000;s:9:\"serverUrl\";s:76:\"https://solutions.brightcove.com/bcls/brightcove-player/vmap/simple-vast.xml\";}s:4:\"name\";s:4:\"ima3\";}i:1;a:2:{s:7:\"options\";a:1:{s:19:\"useResolutionLabels\";b:1;}s:4:\"name\";s:11:\"qualityMenu\";}i:2;a:2:{s:7:\"options\";a:6:{s:8:\"services\";a:6:{s:6:\"tumblr\";b:1;s:8:\"linkedin\";b:1;s:9:\"pinterest\";b:1;s:7:\"twitter\";b:1;s:6:\"google\";b:1;s:8:\"facebook\";b:1;}s:6:\"offset\";s:0:\"\";s:3:\"url\";s:0:\"\";s:11:\"description\";s:0:\"\";s:5:\"title\";s:0:\"\";s:11:\"deeplinking\";b:1;}s:4:\"name\";s:6:\"social\";}i:3;a:2:{s:7:\"options\";a:7:{s:7:\"shuffle\";b:0;s:6:\"repeat\";b:0;s:12:\"playOnSelect\";b:1;s:11:\"nextOverlay\";b:0;s:13:\"nextEndscreen\";b:0;s:10:\"nextButton\";b:1;s:11:\"autoadvance\";i:0;}s:4:\"name\";s:12:\"bcPlaylistUi\";}}s:13:\"compatibility\";b:1;s:11:\"video_cloud\";a:2:{s:5:\"video\";N;s:10:\"policy_key\";s:144:\"BCpkADawqM2G8ohoqYCsuhgErbjXN5r3P-dHF1L76n5RIrHQMDL_8OT_YdWyoaek9iSnRCg_1W8KLy33_G69aD6qhKLJYEFedEHtO0UeE_mGzG9isd8yaW20aI_kzn-KVPyazm1S0mQbn9o6\";}s:6:\"player\";a:2:{s:8:\"inactive\";b:0;s:8:\"template\";a:4:{s:13:\"version_alias\";N;s:6:\"locked\";b:0;s:4:\"name\";s:21:\"single-video-template\";s:7:\"version\";s:6:\"6.24.1\";}}s:3:\"css\";a:3:{s:12:\"controlColor\";s:4:\"#fff\";s:15:\"controlBarColor\";s:19:\"rgba(0, 0, 0, 0.45)\";s:13:\"progressColor\";s:7:\"#d52484\";}s:4:\"dock\";b:0;s:4:\"skin\";N;}s:11:\"preview_url\";s:123:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/iGAicgqoE9/preview/embeds/default/master/index.html\";}}', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('iGAicgqoE9', 'created_at', '2018-08-14T06:02:58.385Z', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('iGAicgqoE9', 'url', 'http://players.brightcove.net/5814665417001/iGAicgqoE9_default/index.html', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('iGAicgqoE9', 'embed_count', '1', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('iGAicgqoE9', 'accountId', '5814665417001', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('k089Hf8le8', 'id', 'k089Hf8le8', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('k089Hf8le8', 'name', 'On Cue Point Ads 1', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('k089Hf8le8', 'description', '', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('k089Hf8le8', 'branches', 'a:2:{s:7:\"preview\";a:4:{s:13:\"configuration\";a:14:{s:11:\"autoadvance\";N;s:20:\"studio_configuration\";a:1:{s:6:\"player\";a:4:{s:8:\"adjusted\";b:1;s:6:\"height\";i:150;s:5:\"width\";i:300;s:10:\"responsive\";b:1;}}s:17:\"fullscreenControl\";b:1;s:8:\"autoplay\";b:0;s:7:\"preload\";s:8:\"metadata\";s:2:\"id\";s:10:\"k089Hf8le8\";s:11:\"stylesheets\";a:2:{i:0;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";i:1;s:68:\"https://players.brightcove.net/videojs-overlay/2/videojs-overlay.css\";}s:7:\"scripts\";a:2:{i:0;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";i:1;s:71:\"https://players.brightcove.net/videojs-overlay/2/videojs-overlay.min.js\";}s:7:\"plugins\";a:3:{i:0;a:2:{s:4:\"name\";s:7:\"overlay\";s:7:\"options\";a:1:{s:8:\"overlays\";a:1:{i:0;a:2:{s:5:\"align\";s:6:\"bottom\";s:5:\"start\";s:4:\"play\";}}}}i:1;a:2:{s:7:\"options\";a:7:{s:9:\"serverUrl\";s:76:\"https://solutions.brightcove.com/bcls/brightcove-player/vmap/simple-vast.xml\";s:7:\"timeout\";i:4000;s:12:\"hardTimeouts\";b:1;s:11:\"requestMode\";s:5:\"oncue\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:9:\"vpaidMode\";s:7:\"ENABLED\";s:17:\"useMediaCuePoints\";b:1;}s:4:\"name\";s:4:\"ima3\";}i:2;a:2:{s:4:\"name\";s:6:\"social\";s:7:\"options\";a:1:{s:8:\"services\";a:6:{s:8:\"facebook\";b:1;s:6:\"google\";b:1;s:7:\"twitter\";b:1;s:6:\"tumblr\";b:1;s:9:\"pinterest\";b:1;s:8:\"linkedin\";b:1;}}}}s:13:\"compatibility\";b:1;s:11:\"video_cloud\";a:2:{s:5:\"video\";N;s:10:\"policy_key\";s:144:\"BCpkADawqM3k-MPdWFHkl0q3hevB5udEkDacgFrSD68JYzOn3BbxMun7iGG8N7_fbFKqsJl5YTqMpZ6VMStQ5nvsNmQ0YnuJ9LDqgqr5itf99JcIBMKrNp1Ac7lXq9BwsqfQiqSpZlZTm7ZD\";}s:6:\"player\";a:2:{s:8:\"inactive\";b:0;s:8:\"template\";a:4:{s:13:\"version_alias\";N;s:6:\"locked\";b:0;s:4:\"name\";s:21:\"single-video-template\";s:7:\"version\";s:6:\"6.24.1\";}}s:3:\"css\";a:3:{s:12:\"controlColor\";s:4:\"#fff\";s:15:\"controlBarColor\";s:19:\"rgba(0, 0, 0, 0.45)\";s:13:\"progressColor\";s:7:\"#d52484\";}s:4:\"dock\";b:0;}s:10:\"updated_at\";s:24:\"2018-09-27T09:06:01.373Z\";s:19:\"template_updated_at\";s:24:\"2018-09-19T13:53:34.436Z\";s:11:\"preview_url\";s:123:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/k089Hf8le8/preview/embeds/default/master/index.html\";}s:6:\"master\";a:4:{s:13:\"configuration\";a:14:{s:4:\"dock\";b:0;s:3:\"css\";a:3:{s:13:\"progressColor\";s:7:\"#d52484\";s:15:\"controlBarColor\";s:19:\"rgba(0, 0, 0, 0.45)\";s:12:\"controlColor\";s:4:\"#fff\";}s:6:\"player\";a:2:{s:8:\"template\";a:4:{s:7:\"version\";s:6:\"6.24.1\";s:4:\"name\";s:21:\"single-video-template\";s:6:\"locked\";b:0;s:13:\"version_alias\";N;}s:8:\"inactive\";b:0;}s:11:\"video_cloud\";a:2:{s:10:\"policy_key\";s:144:\"BCpkADawqM3k-MPdWFHkl0q3hevB5udEkDacgFrSD68JYzOn3BbxMun7iGG8N7_fbFKqsJl5YTqMpZ6VMStQ5nvsNmQ0YnuJ9LDqgqr5itf99JcIBMKrNp1Ac7lXq9BwsqfQiqSpZlZTm7ZD\";s:5:\"video\";N;}s:13:\"compatibility\";b:1;s:7:\"plugins\";a:3:{i:0;a:2:{s:7:\"options\";a:1:{s:8:\"overlays\";a:1:{i:0;a:2:{s:5:\"start\";s:4:\"play\";s:5:\"align\";s:6:\"bottom\";}}}s:4:\"name\";s:7:\"overlay\";}i:1;a:2:{s:7:\"options\";a:7:{s:17:\"useMediaCuePoints\";b:1;s:9:\"vpaidMode\";s:7:\"ENABLED\";s:11:\"adTechOrder\";a:1:{i:0;s:5:\"html5\";}s:11:\"requestMode\";s:5:\"oncue\";s:12:\"hardTimeouts\";b:1;s:7:\"timeout\";i:4000;s:9:\"serverUrl\";s:76:\"https://solutions.brightcove.com/bcls/brightcove-player/vmap/simple-vast.xml\";}s:4:\"name\";s:4:\"ima3\";}i:2;a:2:{s:7:\"options\";a:1:{s:8:\"services\";a:6:{s:8:\"linkedin\";b:1;s:9:\"pinterest\";b:1;s:6:\"tumblr\";b:1;s:7:\"twitter\";b:1;s:6:\"google\";b:1;s:8:\"facebook\";b:1;}}s:4:\"name\";s:6:\"social\";}}s:7:\"scripts\";a:2:{i:0;s:59:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js\";i:1;s:71:\"https://players.brightcove.net/videojs-overlay/2/videojs-overlay.min.js\";}s:11:\"stylesheets\";a:2:{i:0;s:60:\"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css\";i:1;s:68:\"https://players.brightcove.net/videojs-overlay/2/videojs-overlay.css\";}s:2:\"id\";s:10:\"k089Hf8le8\";s:7:\"preload\";s:8:\"metadata\";s:8:\"autoplay\";b:0;s:17:\"fullscreenControl\";b:1;s:20:\"studio_configuration\";a:1:{s:6:\"player\";a:4:{s:10:\"responsive\";b:1;s:5:\"width\";i:300;s:6:\"height\";i:150;s:8:\"adjusted\";b:1;}}s:11:\"autoadvance\";N;}s:10:\"updated_at\";s:24:\"2018-09-27T09:06:00.374Z\";s:19:\"template_updated_at\";s:24:\"2018-09-19T13:53:39.568Z\";s:11:\"preview_url\";s:122:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/k089Hf8le8/master/embeds/default/master/index.html\";}}', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('k089Hf8le8', 'created_at', '2018-08-14T06:25:44.243Z', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('k089Hf8le8', 'url', 'http://players.brightcove.net/5814665417001/k089Hf8le8_default/index.html', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('k089Hf8le8', 'embed_count', '1', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('k089Hf8le8', 'accountId', '5814665417001', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('oNgLTdNCH', 'id', 'oNgLTdNCH', '2018-10-04 02:19:36', '2018-10-04 02:19:36'),
('oNgLTdNCH', 'name', '[Matt] Test Player', '2018-10-04 02:19:36', '2018-10-04 02:19:36'),
('oNgLTdNCH', 'description', '', '2018-10-04 02:19:36', '2018-10-04 02:19:36'),
('oNgLTdNCH', 'branches', 'a:2:{s:7:\"preview\";a:4:{s:13:\"configuration\";a:15:{s:7:\"plugins\";a:3:{i:0;a:2:{s:4:\"name\";s:6:\"social\";s:7:\"options\";a:7:{s:8:\"services\";a:6:{s:6:\"tumblr\";b:1;s:8:\"linkedin\";b:1;s:9:\"pinterest\";b:1;s:7:\"twitter\";b:1;s:6:\"google\";b:1;s:8:\"facebook\";b:1;}s:6:\"offset\";s:0:\"\";s:3:\"url\";s:0:\"\";s:11:\"description\";s:0:\"\";s:5:\"title\";s:0:\"\";s:11:\"removeEmbed\";b:1;s:11:\"deeplinking\";b:0;}}i:1;a:2:{s:7:\"options\";a:1:{s:19:\"useResolutionLabels\";b:1;}s:4:\"name\";s:11:\"qualityMenu\";}i:2;a:2:{s:7:\"options\";a:7:{s:11:\"autoadvance\";i:0;s:10:\"nextButton\";b:1;s:13:\"nextEndscreen\";b:0;s:11:\"nextOverlay\";b:0;s:12:\"playOnSelect\";b:1;s:6:\"repeat\";b:0;s:7:\"shuffle\";b:0;}s:4:\"name\";s:12:\"bcPlaylistUi\";}}s:13:\"compatibility\";b:1;s:11:\"video_cloud\";a:2:{s:5:\"video\";N;s:10:\"policy_key\";s:144:\"BCpkADawqM21OjL40eYRAumWO28Mldv3idXUDZSNXUtcpZmxTERgU416CalBouPam5ETDD1CRggSB58JFnxjVEe-M1sqc6mws_96qCp7Fh8juvTx1eywz-4TI4iVDxMGLkVk6lCcb-essvxQ\";}s:6:\"player\";a:2:{s:8:\"template\";a:4:{s:4:\"name\";s:21:\"single-video-template\";s:7:\"version\";s:6:\"6.24.1\";s:6:\"locked\";b:0;s:13:\"version_alias\";N;}s:8:\"inactive\";b:0;}s:7:\"scripts\";a:3:{i:0;s:75:\"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.min.js\";i:1;s:79:\"//players.brightcove.net/videojs-bc-playlist-ui/3/videojs-bc-playlist-ui.min.js\";i:2;s:63:\"//players.brightcove.net/videojs-social/3/videojs-social.min.js\";}s:11:\"stylesheets\";a:3:{i:0;s:72:\"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.css\";i:1;s:76:\"//players.brightcove.net/videojs-bc-playlist-ui/3/videojs-bc-playlist-ui.css\";i:2;s:49:\"http://webstandout.com.au/frontend/css/social.css\";}s:3:\"css\";a:3:{s:12:\"controlColor\";s:4:\"#fff\";s:15:\"controlBarColor\";s:19:\"rgba(0, 0, 0, 0.45)\";s:13:\"progressColor\";s:7:\"#d52484\";}s:4:\"dock\";b:1;s:2:\"id\";s:9:\"oNgLTdNCH\";s:7:\"preload\";s:8:\"metadata\";s:8:\"autoplay\";b:0;s:17:\"fullscreenControl\";b:1;s:20:\"studio_configuration\";a:1:{s:6:\"player\";a:4:{s:5:\"width\";i:1160;s:6:\"height\";i:653;s:8:\"adjusted\";b:1;s:10:\"responsive\";b:1;}}s:11:\"autoadvance\";i:0;s:8:\"playlist\";b:1;}s:10:\"updated_at\";s:24:\"2018-10-03T13:51:55.549Z\";s:19:\"template_updated_at\";s:24:\"2018-09-26T07:06:12.049Z\";s:11:\"preview_url\";s:122:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/oNgLTdNCH/preview/embeds/default/master/index.html\";}s:6:\"master\";a:4:{s:13:\"configuration\";a:15:{s:8:\"playlist\";b:1;s:11:\"autoadvance\";i:0;s:20:\"studio_configuration\";a:1:{s:6:\"player\";a:4:{s:10:\"responsive\";b:1;s:8:\"adjusted\";b:1;s:6:\"height\";i:653;s:5:\"width\";i:1160;}}s:17:\"fullscreenControl\";b:1;s:8:\"autoplay\";b:0;s:7:\"preload\";s:8:\"metadata\";s:2:\"id\";s:9:\"oNgLTdNCH\";s:4:\"dock\";b:1;s:3:\"css\";a:3:{s:13:\"progressColor\";s:7:\"#d52484\";s:15:\"controlBarColor\";s:19:\"rgba(0, 0, 0, 0.45)\";s:12:\"controlColor\";s:4:\"#fff\";}s:11:\"stylesheets\";a:3:{i:0;s:72:\"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.css\";i:1;s:76:\"//players.brightcove.net/videojs-bc-playlist-ui/3/videojs-bc-playlist-ui.css\";i:2;s:49:\"http://webstandout.com.au/frontend/css/social.css\";}s:7:\"scripts\";a:3:{i:0;s:75:\"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.min.js\";i:1;s:79:\"//players.brightcove.net/videojs-bc-playlist-ui/3/videojs-bc-playlist-ui.min.js\";i:2;s:63:\"//players.brightcove.net/videojs-social/3/videojs-social.min.js\";}s:6:\"player\";a:2:{s:8:\"inactive\";b:0;s:8:\"template\";a:4:{s:13:\"version_alias\";N;s:6:\"locked\";b:0;s:7:\"version\";s:6:\"6.24.1\";s:4:\"name\";s:21:\"single-video-template\";}}s:11:\"video_cloud\";a:2:{s:10:\"policy_key\";s:144:\"BCpkADawqM21OjL40eYRAumWO28Mldv3idXUDZSNXUtcpZmxTERgU416CalBouPam5ETDD1CRggSB58JFnxjVEe-M1sqc6mws_96qCp7Fh8juvTx1eywz-4TI4iVDxMGLkVk6lCcb-essvxQ\";s:5:\"video\";N;}s:13:\"compatibility\";b:1;s:7:\"plugins\";a:3:{i:0;a:2:{s:7:\"options\";a:7:{s:11:\"deeplinking\";b:0;s:11:\"removeEmbed\";b:1;s:5:\"title\";s:0:\"\";s:11:\"description\";s:0:\"\";s:3:\"url\";s:0:\"\";s:6:\"offset\";s:0:\"\";s:8:\"services\";a:6:{s:8:\"facebook\";b:1;s:6:\"google\";b:1;s:7:\"twitter\";b:1;s:9:\"pinterest\";b:1;s:8:\"linkedin\";b:1;s:6:\"tumblr\";b:1;}}s:4:\"name\";s:6:\"social\";}i:1;a:2:{s:7:\"options\";a:1:{s:19:\"useResolutionLabels\";b:1;}s:4:\"name\";s:11:\"qualityMenu\";}i:2;a:2:{s:7:\"options\";a:7:{s:7:\"shuffle\";b:0;s:6:\"repeat\";b:0;s:12:\"playOnSelect\";b:1;s:11:\"nextOverlay\";b:0;s:13:\"nextEndscreen\";b:0;s:10:\"nextButton\";b:1;s:11:\"autoadvance\";i:0;}s:4:\"name\";s:12:\"bcPlaylistUi\";}}}s:10:\"updated_at\";s:24:\"2018-10-03T13:51:54.669Z\";s:19:\"template_updated_at\";s:24:\"2018-09-26T07:06:12.058Z\";s:11:\"preview_url\";s:121:\"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/oNgLTdNCH/master/embeds/default/master/index.html\";}}', '2018-10-04 02:19:36', '2018-10-04 02:19:36'),
('oNgLTdNCH', 'created_at', '2018-09-26T07:06:12.049Z', '2018-10-04 02:19:36', '2018-10-04 02:19:36'),
('oNgLTdNCH', 'url', 'http://players.brightcove.net/5814665417001/oNgLTdNCH_default/index.html', '2018-10-04 02:19:36', '2018-10-04 02:19:36'),
('oNgLTdNCH', 'embed_count', '1', '2018-10-04 02:19:36', '2018-10-04 02:19:36'),
('oNgLTdNCH', 'accountId', '5814665417001', '2018-10-04 02:19:36', '2018-10-04 02:19:36');

-- --------------------------------------------------------

--
-- Table structure for table `mm_playlists`
--

CREATE TABLE `mm_playlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_playlists`
--

INSERT INTO `mm_playlists` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(5823927995001, 'Popular Uploads', 'popular-uploads', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(5823948613001, 'Shift Alt Cap', 'shift-alt-cap', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(5824129872001, 'Transparant ULIP', 'transparant-ulip', '2018-09-10 06:47:47', '2018-09-10 06:47:47'),
(5824129873001, 'Property Talks', 'property-talks', '2018-09-10 06:47:48', '2018-09-10 06:47:48');

-- --------------------------------------------------------

--
-- Table structure for table `mm_playlist_metas`
--

CREATE TABLE `mm_playlist_metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `playlist_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_playlist_metas`
--

INSERT INTO `mm_playlist_metas` (`id`, `playlist_id`, `meta_key`, `meta_value`, `created_at`, `updated_at`) VALUES
(1, 5824129872001, 'id', '5824129872001', '2018-09-10 06:47:47', '2018-09-10 06:47:47'),
(2, 5824129872001, 'account_id', '5814665417001', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(3, 5824129872001, 'created_at', '2018-08-20T11:33:27.729Z', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(4, 5824129872001, 'description', 'Transparant ULIP', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(5, 5824129872001, 'favorite', '1', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(6, 5824129872001, 'name', 'Transparant ULIP', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(7, 5824129872001, 'reference_id', 'Transparant-ULIP', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(8, 5824129872001, 'type', 'EXPLICIT', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(9, 5824129872001, 'updated_at', '2018-09-10T12:14:12.624Z', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(10, 5824129872001, 'video_ids', 'a:5:{i:0;s:13:\"5832976243001\";i:1;s:13:\"5832962384001\";i:2;s:13:\"5832974497001\";i:3;s:13:\"5832976578001\";i:4;s:13:\"5832970611001\";}', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(11, 5824129873001, 'id', '5824129873001', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(12, 5824129873001, 'account_id', '5814665417001', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(13, 5824129873001, 'created_at', '2018-08-20T12:27:05.194Z', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(14, 5824129873001, 'description', 'Property Talks', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(15, 5824129873001, 'favorite', '1', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(16, 5824129873001, 'name', 'Property Talks', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(17, 5824129873001, 'reference_id', 'Property-Talks', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(18, 5824129873001, 'type', 'EXPLICIT', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(19, 5824129873001, 'updated_at', '2018-09-10T12:13:43.560Z', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(20, 5824129873001, 'video_ids', 'a:5:{i:0;s:13:\"5832976243001\";i:1;s:13:\"5832962384001\";i:2;s:13:\"5832974497001\";i:3;s:13:\"5832976578001\";i:4;s:13:\"5832970611001\";}', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(21, 5823948613001, 'id', '5823948613001', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(22, 5823948613001, 'account_id', '5814665417001', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(23, 5823948613001, 'created_at', '2018-08-20T11:32:41.763Z', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(24, 5823948613001, 'description', 'Shift Alt Cap', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(25, 5823948613001, 'favorite', '1', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(26, 5823948613001, 'name', 'Shift Alt Cap', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(27, 5823948613001, 'reference_id', 'Shift-Alt-Cap', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(28, 5823948613001, 'type', 'EXPLICIT', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(29, 5823948613001, 'updated_at', '2018-09-10T11:34:40.318Z', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(30, 5823948613001, 'video_ids', 'a:0:{}', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(31, 5823927995001, 'id', '5823927995001', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(32, 5823927995001, 'account_id', '5814665417001', '2018-09-10 06:47:50', '2018-09-10 06:47:50'),
(33, 5823927995001, 'created_at', '2018-08-20T11:38:30.273Z', '2018-09-10 06:47:50', '2018-09-10 06:47:50'),
(34, 5823927995001, 'description', 'Popular Uploads', '2018-09-10 06:47:50', '2018-09-10 06:47:50'),
(35, 5823927995001, 'favorite', '1', '2018-09-10 06:47:50', '2018-09-10 06:47:50'),
(36, 5823927995001, 'name', 'Popular Uploads', '2018-09-10 06:47:50', '2018-09-10 06:47:50'),
(37, 5823927995001, 'reference_id', 'Popular-Uploads', '2018-09-10 06:47:50', '2018-09-10 06:47:50'),
(38, 5823927995001, 'type', 'ACTIVATED_NEWEST_TO_OLDEST', '2018-09-10 06:47:50', '2018-09-10 06:47:50'),
(39, 5823927995001, 'updated_at', '2018-08-20T11:38:55.567Z', '2018-09-10 06:47:50', '2018-09-10 06:47:50'),
(40, 5823927995001, 'limit', '100', '2018-09-10 06:47:50', '2018-09-10 06:47:50'),
(41, 5823927995001, 'search', 'tags:\"animals\",\"birds\"', '2018-09-10 06:47:50', '2018-09-10 06:47:50');

-- --------------------------------------------------------

--
-- Table structure for table `mm_reason_for_account_deactivations`
--

CREATE TABLE `mm_reason_for_account_deactivations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_reason_for_account_deactivations`
--

INSERT INTO `mm_reason_for_account_deactivations` (`id`, `name`, `order`, `created_at`, `updated_at`) VALUES
(1, 'I don\'t like this website anymore', 1, NULL, NULL),
(2, 'I found a better website', 1, NULL, NULL),
(4, 'By Mistake I signed Up', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mm_roles`
--

CREATE TABLE `mm_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_roles`
--

INSERT INTO `mm_roles` (`id`, `name`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin', '2018-08-26 13:00:00', '2018-08-26 13:00:00'),
(2, 'User', 'user', '2018-08-26 13:00:00', '2018-08-26 13:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `mm_role_permissions`
--

CREATE TABLE `mm_role_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mm_settings`
--

CREATE TABLE `mm_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `option_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autoload` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mm_speakers`
--

CREATE TABLE `mm_speakers` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bc_speaker_name` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_speakers`
--

INSERT INTO `mm_speakers` (`id`, `slug`, `avatar`, `bc_speaker_name`, `created_at`, `updated_at`) VALUES
(3, 'surya-bhatia', 'speaker/1537524700.png', '03-Surya-Bhatia', '2018-09-21 03:16:00', '2018-11-16 16:21:44'),
(4, 'vivek-law', 'speaker/1542353648.jpg', '01-Vivek-Law', '2018-09-21 03:28:49', '2018-11-16 16:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `mm_speaker_descriptions`
--

CREATE TABLE `mm_speaker_descriptions` (
  `speaker_id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biography` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_speaker_descriptions`
--

INSERT INTO `mm_speaker_descriptions` (`speaker_id`, `language_id`, `name`, `designation`, `short_description`, `description`, `biography`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(3, 3, 'Surya Bhatia', 'Promoter of Asset Managers & Co founder', 'Surya Bhatia is a writer, humorist, geek celebrity, former professional literary agent and', '<p>John Hodgman is a writer, humorist, geek celebrity, former professional literary agent and expert on all world knowledge. He was the bumbling PC in Apple&#39;s long-running &quot;I&#39;m a Mac; I&#39;m a PC&quot; ad campaign.&nbsp;John Hodgman is a writer, humorist, geek celebrity, former professional literary agent and expert on all world knowledge. He was the bumbling PC in Apple&#39;s long-running &quot;I&#39;m a Mac; I&#39;m a PC&quot; ad campaign.</p>', 'John Hodgman is a writer, humorist, geek celebrity, former professional literary agent and', 'asdf', 'asdf', 'adfasdf'),
(4, 3, 'Vivek Law', 'Founder, CEO & Editor-in-Chief', 'An award-winning journalist who has, in his career of more than 24 ', '<p>An award-winning journalist who has, in his career of more than 24 years, worked across the biggest print and television brands, in his latest avatar, the senior business journalist drives the video-first digital content platform for Indians seeking insight and financial advice on personal wealth.</p>\r\n\r\n<p>In his print career spanning a decade, he has worked with <strong>The Economic Times, Business Standard</strong>, <strong>The Financial Express and India Today</strong>.</p>\r\n\r\n<p>He has also served as Consumer Affairs Editor at CNBC TV18 and CNBC Awaaz, and Editor, Bloomberg TV India for 4 years, before moving to the India Today Group as Editor-Business Television. Shows he has anchored across these TV brands, in English and Hindi, include Uncovered, Pardafash, Pehredar, Smart Money, Money&#39;s Best Friend, Market Guru, Big Story, Courtroom, Fightback for Your Rights and Dhan Daulat.</p>\r\n\r\n<p>Vivek has served on the boards of <strong>FPSB</strong> and <strong>NBSA</strong>. He is also author of <strong>The Money Book</strong> (<strong>Rupa, 2016</strong>).</p>', 'Vivek Law is Founder, CEO & Editor-in-Chief, The MoneyMile, a digital  video platform to demystify money', 'Vivek Law', 'vivek law', NULL),
(3, 4, 'df', 'asdsf', 'asdf', '<p>adsf</p>', 'asdf', 'asddf', 'adsf', NULL),
(4, 4, 'df', 'asdsf', 'asdf', '<p>adsf</p>', 'asdf', 'asddf', 'adsf', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mm_speaker_socials`
--

CREATE TABLE `mm_speaker_socials` (
  `id` int(10) UNSIGNED NOT NULL,
  `speaker_id` int(10) UNSIGNED NOT NULL,
  `facebook` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_speaker_socials`
--

INSERT INTO `mm_speaker_socials` (`id`, `speaker_id`, `facebook`, `linkedin`, `google`, `twitter`, `created_at`, `updated_at`) VALUES
(1, 3, NULL, NULL, NULL, NULL, '2018-09-24 18:30:00', '2018-09-24 18:30:00'),
(2, 4, 'https://www.facebook.com/vivek.law.9', 'https://www.linkedin.com/in/vivek-law-618322ab/', NULL, 'https://www.twitter.com/VivekLaw', '2018-09-24 18:30:00', '2018-11-16 16:21:12'),
(3, 5, NULL, NULL, 'http://google.com', 'http://twitter.com', '2018-09-25 04:58:50', '2018-09-25 06:48:17');

-- --------------------------------------------------------

--
-- Table structure for table `mm_states`
--

CREATE TABLE `mm_states` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(51) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mm_states`
--

INSERT INTO `mm_states` (`id`, `name`, `description`) VALUES
(1, 'unverified', 'User has not verified its email id'),
(2, 'verified', 'User is active by the administrator'),
(3, 'deactivated', 'User has deactivated his own account'),
(4, 'blocked', 'Administrator blocked the user');

-- --------------------------------------------------------

--
-- Table structure for table `mm_subscriptions`
--

CREATE TABLE `mm_subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mm_tags`
--

CREATE TABLE `mm_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_tags`
--

INSERT INTO `mm_tags` (`id`, `tag`, `created_at`, `updated_at`) VALUES
(1, 'digitalpayments', '2018-09-10 06:47:57', '2018-09-10 06:47:57'),
(2, 'paywithpeace', '2018-09-10 06:47:57', '2018-09-10 06:47:57'),
(3, 'equitysahihai', '2018-09-10 06:47:57', '2018-09-10 06:47:57'),
(4, 'demonetization', '2018-09-10 06:47:57', '2018-09-10 06:47:57'),
(5, 'pushingdigitalpayments', '2018-09-10 06:47:57', '2018-09-10 06:47:57'),
(6, 'declinecardfrauds', '2018-09-10 06:47:57', '2018-09-10 06:47:57'),
(7, 'transparentulips', '2018-09-10 06:47:57', '2018-09-10 06:47:57');

-- --------------------------------------------------------

--
-- Table structure for table `mm_translations`
--

CREATE TABLE `mm_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_translations`
--

INSERT INTO `mm_translations` (`id`, `name`, `code`, `locale`, `image`, `order`, `status`, `created_at`, `updated_at`) VALUES
(3, 'English', 'en', 'en', 'image/en', 1, 1, '2018-09-12 07:48:41', '2018-09-13 07:42:03'),
(4, 'Hindi', 'hi', 'hi', 'image/hi', 2, 1, '2018-09-12 07:48:59', '2018-10-22 18:15:07');

-- --------------------------------------------------------

--
-- Table structure for table `mm_users`
--

CREATE TABLE `mm_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 2,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 1,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_users`
--

INSERT INTO `mm_users` (`id`, `role_id`, `name`, `email`, `mobile`, `avatar`, `state`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 1, 'Vipin Ganganiya', 'vipin.developer1@gmail.com', '9212376832', NULL, 2, '$2y$10$S.2DD09i5d5Nr92xwVfoGOZZ3JWUSVPPdO4q8oNmgj.9CnD9j5HFq', 'WpliN0dSojIuRmElW7d28MJFJT9WTH8bA8G6Wbh1JuaBt9xuxOc4Lml1W5W8', '2018-09-03 01:48:39', '2018-09-21 05:59:06'),
(9, 2, 'Vipin', 'vipin.yadav@gmail.com', '', NULL, 1, '$2y$10$dF5NnU/9RM9v6WygX2f2M.dC4T7h6NeTidnYLQPy6nQzziX/lCXsS', 'lrsOrNx156z56hIUR7gTVmnXHfQI3zuEb7sVao9OPSuzGc1t9OExfs64OXu3', '2018-09-10 01:37:12', '2018-09-10 01:37:12'),
(10, 2, 'Dean', 'dean@gmail.com', '', NULL, 2, '$2y$10$gynyOPhCX9z42FSfb2Xeb..jfrSioLQJIik3cFZtGIR99krX9a4aO', 'DLe5O36IKlUTAQI6K2vq001dRXJdHAassrg9L9jbL70hbYpbOQsfgTo0Zw9z', '2018-09-10 23:40:14', '2018-09-10 23:43:26'),
(11, 2, 'Vipin Kr', 'vipin.kumar@gmail.com', '', NULL, 2, '$2y$10$PRjiMjXzKQweKWN0muPkN.NH4MqSU3C.iaEE31uzs4ec28/GA3Zci', 'xcbTbmJ1YOHa6kotRjpMOYSmoqxWVTPuOdtZT02LlPA5C7WWtICvxbladYBu', '2018-09-11 01:51:17', '2018-09-11 01:51:34'),
(12, 2, 'vipin', 'vipin.y@iswebsun.com', '', NULL, 1, '$2y$10$RuarNHGAhMdhXOPB4fSDCe6oP5kJQmpuEqnYPvwMbwjUl1NWxLlfq', 'v7PVeaXoexB8XD6JYgkGgyMHsJ2voEeM8ZjpTZRX5joR6M68g1yyyI0ZpyZH', '2018-09-15 05:09:24', '2018-09-15 05:09:24'),
(21, 2, 'Vivek', 'vivek@gmail.com', '', NULL, 1, '$2y$10$1SgpeGRmZ1Yl/.NhTy5LiuH0wHRQIZC0gWQFVx2Mx7H.wNc4oRqhG', '2fNP8PywAHDeVAJWJjXN14nD30Laniciq0dUSxMqQ88ml4IcWZOn5vlSAcrx', '2018-10-01 02:10:45', '2018-10-01 02:10:45'),
(22, 2, 'vipin', 'vipin.y@iwebsun.com', '', NULL, 2, '$2y$10$eToRh2O.5f6YeUeCyYnUyuq4wVXhsYOtPW6lI7M3fGe9ltYgFlRQK', 'ec9QkWvFuixYN3ZrzB7SoyFVhPZeiyxnY0FQMBMxqO2ADw2VUpfyHoSrAGYs', '2018-10-09 01:08:22', '2018-10-09 01:08:22'),
(38, 2, 'vipin', 'vipin.developer@gmail.com', '', NULL, 1, '$2y$10$vTBXBVJ6DBxKekZ9.0r.XuXinbXdxXCl2anqlTX3AUJL.6oCJK6Gu', 'QNoFidn95tx6AqxOO6p2J3YosXShTQ1A4tu0oYMBRBqBjp7jgZoTBerEiSdN', '2018-10-15 14:18:06', '2018-10-15 14:18:06'),
(39, 2, 'Vipin Ganganiya', 'vipinyadav.yadav7@gmail.com', '', 'https://graph.facebook.com/v3.0/10206055324177061/picture?type=normal', 1, '$2y$10$k1Tr89iWlfF1fXeXnVsJDe3gylQwViJDBfAD.FmBLecQckKBHpzpi', 'PgFe3LsguZylutjOaQ2ztVYNvbdlVLvmBWEhVEOEOZmIGJ7Mg33ENeOAIhH8', '2018-10-27 15:43:38', '2018-10-27 15:43:38'),
(40, 2, 'Rishabh Agarwal', 'rishabhagarwalddn@gmail.com', '', 'https://lh3.googleusercontent.com/-Gz2dFDET_oY/AAAAAAAAAAI/AAAAAAAAAcE/I-6Ovk-kZws/photo.jpg?sz=50', 1, '$2y$10$rTnC6UySaoBpuScVYflitu6A1l1B4y2XzFDXaDuy48QbJwGxCe7pG', 'JCJ4RnZ9lzzzcudHOA1TACN1Ff1pVZlnFUt01bQCeJWdmQtgvvVGiqFvGs6W', '2018-10-27 16:20:27', '2018-10-27 16:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `mm_user_comments`
--

CREATE TABLE `mm_user_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comments` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_user_comments`
--

INSERT INTO `mm_user_comments` (`id`, `user_id`, `video_id`, `language_id`, `parent_id`, `comments`, `created_at`, `updated_at`) VALUES
(13, 22, 5832962384001, 3, 0, 'this is my first comment', '2018-09-18 01:41:33', '2018-09-18 01:41:33'),
(14, 22, 5832962384001, 3, 0, 'this is my second comment', '2018-09-18 01:41:46', '2018-09-18 01:41:46'),
(15, 22, 5832962384001, 3, 0, 'df adfadfadfadsf', '2018-09-18 02:14:10', '2018-09-18 02:14:10'),
(16, 22, 5832962384001, 3, 0, 'asd faeeeee', '2018-09-18 02:14:17', '2018-09-18 02:14:17'),
(17, 22, 5832962384001, 3, 0, 'dfadfadfa', '2018-09-18 03:19:30', '2018-09-18 03:19:30'),
(18, 22, 5832962384001, 3, 0, 'cccc   cxx', '2018-09-18 03:19:37', '2018-09-18 03:19:37'),
(19, 22, 5832962384001, 3, 18, 'bbbb', '2018-09-18 04:37:15', '2018-09-18 04:37:15'),
(20, 22, 5832962384001, 3, 16, 'aaaaa', '2018-09-18 04:45:34', '2018-09-18 04:45:34'),
(21, 10, 5832962384001, 3, 17, 'vipin yadav', '2018-09-18 06:49:24', '2018-09-18 06:49:24'),
(22, 10, 5832962384001, 3, 16, 'vvvv', '2018-09-18 06:49:37', '2018-09-18 06:49:37'),
(23, 10, 5832962384001, 3, 16, 'sdafasdfasdf', '2018-09-18 06:49:51', '2018-09-18 06:49:51'),
(24, 10, 5832962384001, 3, 16, 'done it;', '2018-09-18 07:22:04', '2018-09-18 07:22:04'),
(25, 22, 5832962384001, 3, 18, 'vvvssss', '2018-09-21 08:43:11', '2018-09-21 08:43:11'),
(26, 22, 5832962384001, 3, 18, 'ssdfsdf', '2018-09-21 08:47:05', '2018-09-21 08:47:05'),
(27, 22, 5832962384001, 3, 18, '12345', '2018-09-21 08:48:17', '2018-09-21 08:48:17'),
(28, 22, 5832962384001, 3, 0, 'sdfsd fsdfsdfsdfsdfsdfsdfsdf', '2018-10-04 03:12:18', '2018-10-04 03:12:18'),
(29, 22, 5832962384001, 3, 0, 'dfads fasdfasdfa sdf', '2018-10-04 03:12:39', '2018-10-04 03:12:39'),
(30, 22, 5832962384001, 3, 0, 'ads fasdfasdfa sdfasdf', '2018-10-04 03:12:44', '2018-10-04 03:12:44'),
(31, 22, 5832962384001, 3, 0, 'asdf asdfasdfasdfasdfasdfvvvvv', '2018-10-04 03:13:43', '2018-10-04 03:13:43'),
(32, 10, 5846306450001, 3, 0, 'nbkfnb kfgj', '2018-11-16 17:43:16', '2018-11-16 17:43:16'),
(33, 10, 5846306450001, 3, 32, 'cSDC', '2018-11-16 17:43:29', '2018-11-16 17:43:29'),
(34, 10, 5846306450001, 3, 33, 'ndtynydts', '2018-11-16 17:43:36', '2018-11-16 17:43:37'),
(35, 10, 5846306450001, 3, 33, 'ndtynydts', '2018-11-16 17:43:41', '2018-11-16 17:43:41'),
(36, 10, 5846306450001, 3, 33, 'b rstgsr', '2018-11-16 17:43:46', '2018-11-16 17:43:46'),
(37, 10, 5846306450001, 3, 33, 'b rstgsr', '2018-11-16 17:43:46', '2018-11-16 17:43:46'),
(38, 10, 5846306450001, 3, 33, 'b rstgsr', '2018-11-16 17:43:46', '2018-11-16 17:43:46'),
(39, 10, 5846306450001, 3, 33, 'b rstgsr', '2018-11-16 17:43:47', '2018-11-16 17:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `mm_user_metas`
--

CREATE TABLE `mm_user_metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_user_metas`
--

INSERT INTO `mm_user_metas` (`id`, `user_id`, `meta_key`, `meta_value`, `created_at`, `updated_at`) VALUES
(21, 9, 'login_id', 'bH4p0MCXZF60pIxlFfcrjABB7iL6RVni9G1gYdXh', '2018-09-10 01:37:12', '2018-09-10 01:37:12'),
(22, 9, 'login_with', 'Email', '2018-09-10 01:37:12', '2018-09-10 01:37:12'),
(23, 10, 'login_id', 'Bhw251seSSt3BqX7YF49OYRXKCSH87Bz2iipgIVk', '2018-09-10 23:40:14', '2018-09-10 23:40:14'),
(24, 10, 'login_with', 'Email', '2018-09-10 23:40:14', '2018-09-10 23:40:14'),
(25, 11, 'login_id', 'GSeYaSHh7ZwiLv5JbX8TTCASOxf7oQaWj3LsxMxx', '2018-09-11 01:51:17', '2018-09-11 01:51:17'),
(26, 11, 'login_with', 'Email', '2018-09-11 01:51:17', '2018-09-11 01:51:17'),
(27, 11, 'tag', 's:7:\"1, 5, 7\";', '2018-09-11 01:52:12', NULL),
(28, 11, 'age', '2', '2018-09-11 01:52:12', NULL),
(29, 11, 'n_notify', 'on', '2018-09-11 01:55:20', NULL),
(30, 11, 'v_notify', 'off', '2018-09-11 01:55:20', NULL),
(31, 12, 'login_id', 'BK93aj6YNLUtVekFOe9kEVG5UtOb2OQqNOt6kmZb', '2018-09-15 05:09:25', '2018-09-15 05:09:25'),
(32, 12, 'login_with', 'Email', '2018-09-15 05:09:25', '2018-09-15 05:09:25'),
(52, 21, 'login_id', 'dDAb1fehS4AiMfqoCQWtV91npqRecxsZ25Dg1qOT', '2018-10-01 02:10:45', '2018-10-01 02:10:45'),
(53, 21, 'login_with', 'Email', '2018-10-01 02:10:45', '2018-10-01 02:10:45'),
(54, 22, 'login_id', '28yWfbViv1yHulScY5RIIfzd0rv3latpvYnJ3ehv', '2018-10-09 01:08:22', '2018-10-09 01:08:22'),
(55, 22, 'login_with', 'Email', '2018-10-09 01:08:22', '2018-10-09 01:08:22'),
(56, 22, 'tag', 's:7:\"1, 5, 7\";', '2018-10-09 05:14:12', '2018-10-09 05:46:08'),
(57, 22, 'age', '6', '2018-10-09 05:14:12', '2018-10-09 05:46:08'),
(58, 9, 'flag_redirect', '0', '2018-10-09 18:30:00', '2018-10-09 18:30:00'),
(59, 10, 'flag_redirect', '1', NULL, '2018-10-12 13:29:03'),
(60, 11, 'flag_redirect', '0', NULL, NULL),
(61, 12, 'flag_redirect', '0', NULL, NULL),
(62, 22, 'flag_redirect', '1', '2018-10-09 18:30:00', '2018-10-10 06:23:00'),
(63, 10, 'tag', 's:1:\"3\";', '2018-10-12 17:51:14', '2018-10-12 17:51:48'),
(64, 10, 'age', '2', '2018-10-12 17:51:14', '2018-10-12 17:51:48'),
(110, 38, 'login_id', 'UsMnrLmPehWEpuuaJTPUpmexe4uyVjGf8PQmgOOW', '2018-10-15 14:18:06', '2018-10-15 14:18:06'),
(111, 38, 'login_with', 'Email', '2018-10-15 14:18:06', '2018-10-15 14:18:06'),
(112, 38, 'flag_redirect', '0', '2018-10-15 14:18:06', '2018-10-15 14:18:06'),
(113, 39, 'login_id', '10206055324177061', NULL, NULL),
(114, 39, 'login_with', 'Facebook', NULL, NULL),
(115, 39, 'flag_redirect', '1', NULL, NULL),
(116, 22, 'biography', 'test test again', '2018-10-27 15:46:08', '2018-10-27 15:46:50'),
(117, 22, 'designation', 'rest', '2018-10-27 15:46:12', '2018-11-17 18:59:29'),
(118, 40, 'login_id', '110656224111757229753', NULL, NULL),
(119, 40, 'login_with', 'Google', NULL, NULL),
(120, 40, 'flag_redirect', '1', NULL, NULL),
(121, 10, 'designation', 'yjdrx', '2018-11-16 16:19:54', '2018-11-16 16:20:18'),
(122, 10, 'biography', 'fbdbd', '2018-11-16 16:20:13', NULL),
(123, 22, 'n_notify', 'on', '2018-11-17 17:36:46', '2018-11-17 17:54:36'),
(124, 22, 'v_notify', 'on', '2018-11-17 17:37:13', '2018-11-17 17:54:36');

-- --------------------------------------------------------

--
-- Table structure for table `mm_user_password_resets`
--

CREATE TABLE `mm_user_password_resets` (
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mm_user_verifies`
--

CREATE TABLE `mm_user_verifies` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_user_verifies`
--

INSERT INTO `mm_user_verifies` (`user_id`, `token`, `created_at`, `updated_at`) VALUES
(9, 'kmib4MQNkbRaCVG3E3COK8m8P1sjTWLmSlzy3Utv', '2018-09-10 01:37:12', '2018-09-10 01:37:12'),
(10, 'ZmUjfMQ3hxTtRlXWV0jfaAEY5lliflNGhy4DenTV', '2018-09-10 23:40:14', '2018-09-10 23:40:14'),
(11, 'XvVvzW2CyhTzJYmkqiZQWVDMeNsz69AG0hHXDZYz', '2018-09-11 01:51:18', '2018-09-11 01:51:18'),
(12, '8tfZg12AHykwCy33uy5Y9aOPxDq9CGj14MHbihuk', '2018-09-15 05:09:25', '2018-09-15 05:09:25'),
(21, 'lkithffmRMXzBSlvW0YenWnV4lbVzU8oVqukUEMX', '2018-10-01 02:10:45', '2018-10-01 02:10:45'),
(22, 'fkiEvzrSaTNkb3RJ3chRzIV2IiH2U32U59bs5Z0s', '2018-10-09 01:08:22', '2018-10-09 01:08:22'),
(38, 'MqhOvq17Bt6zlBAjumPkCMMAth1RdARXkZFVFty3', '2018-10-15 14:18:06', '2018-10-15 14:18:06');

-- --------------------------------------------------------

--
-- Table structure for table `mm_user_wishlists`
--

CREATE TABLE `mm_user_wishlists` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_user_wishlists`
--

INSERT INTO `mm_user_wishlists` (`id`, `user_id`, `video_id`, `created_at`, `updated_at`) VALUES
(1, 7, 5832976578001, '2018-09-26 00:51:41', '2018-09-26 00:51:41'),
(2, 7, 5832976243001, '2018-09-26 05:58:04', '2018-09-26 05:58:04'),
(3, 7, 5832962384001, '2018-10-01 06:16:34', '2018-10-01 06:16:34'),
(4, 7, 5832962384001, '2018-10-09 00:44:22', '2018-10-09 00:44:22'),
(5, 7, 5832962384001, '2018-10-09 00:44:36', '2018-10-09 00:44:36'),
(6, 10, 5832962384001, '2018-10-12 17:44:49', '2018-10-12 17:44:49'),
(21, 10, 5832976243001, '2018-11-13 12:53:07', '2018-11-13 12:53:07'),
(22, 10, 5832976243001, '2018-11-13 12:53:12', '2018-11-13 12:53:12'),
(23, 22, 5832974497001, '2018-11-17 15:19:52', '2018-11-17 15:19:52');

-- --------------------------------------------------------

--
-- Table structure for table `mm_videos`
--

CREATE TABLE `mm_videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_videos`
--

INSERT INTO `mm_videos` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(5832962384001, 'Digital Payments Are Becoming The Norm | Pay With Peace', 'digital-payments-are-becoming-the-norm-pay-with-peace', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(5832970611001, 'Episode 5 of #TransparentULIPs – Convenience and Ease of Buying a ULIP Policy Online', 'episode-5-of-transparentulips-convenience-and-ease-of-buying-a-ulip-policy-online', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(5832974497001, 'The Government Is Committed To Digital Payments - Pay With Peace', 'the-government-is-committed-to-digital-payments-pay-with-peace', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(5832976243001, 'Buy Right, Sit Tight- Part 2 - Equity Sahi Hai', 'buy-right-sit-tight-part-2-equity-sahi-hai', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(5832976578001, 'Three Way Push To Decline Card Frauds in India | Pay With Peace', 'three-way-push-to-decline-card-frauds-in-india-pay-with-peace', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(5843727979001, 'Growth and Dividend Plans - Equity Sahi Hai', 'growth-and-dividend-plans-equity-sahi-hai', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(5843741501001, 'Equity Sahi Hai - An Investor Education Initiative', 'equity-sahi-hai-an-investor-education-initiative', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(5846306450001, 'Different Allocation Strategies - Nivesh Kar Befikar', 'different-allocation-strategies-nivesh-kar-befikar', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(5967336913001, 'MONEY CHEF Filter Coffee 26 DEC', 'money-chef-filter-coffee-26-dec', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(5967339853001, 'MONEY CHEF PIZZA 26 DEC', 'money-chef-pizza-26-dec', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(5967343792001, 'Money mile sting', 'money-mile-sting', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(5967343793001, 'MONEY CHEF THALI 09-10-17 NEW', 'money-chef-thali-09-10-17-new', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(5967343794001, 'MONEY CHEF SIP JUICE 09-10-17', 'money-chef-sip-juice-09-10-17', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(5967343795001, 'MONEY CHEF SANDWICH 09-10-17', 'money-chef-sandwich-09-10-17', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(5967343796001, 'MONEY CHEF BIRYANI 26 DEC', 'money-chef-biryani-26-dec', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(5967345194001, 'MONEY CHEF EGGS IN BASKET 26 DEC', 'money-chef-eggs-in-basket-26-dec', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(5967346403001, 'MONEY_CHEF_TIME_IN_MARKET_30-11-17.mp4', 'money-chef-time-in-market-30-11-17mp4', '2018-11-15 21:01:23', '2018-11-15 21:01:23');

-- --------------------------------------------------------

--
-- Table structure for table `mm_video_metas`
--

CREATE TABLE `mm_video_metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_video_metas`
--

INSERT INTO `mm_video_metas` (`id`, `video_id`, `meta_key`, `meta_value`, `created_at`, `updated_at`) VALUES
(871, 5967343793001, 'id', '5967343793001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(872, 5967343793001, 'account_id', '5814665417001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(873, 5967343793001, 'ad_keys', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(874, 5967343793001, 'clip_source_video_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(875, 5967343793001, 'complete', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(876, 5967343793001, 'created_at', '2018-11-15T12:40:30.127Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(877, 5967343793001, 'cue_points', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(878, 5967343793001, 'custom_fields', 'a:1:{s:9:\"speaker_1\";s:12:\"01-Vivek-Law\";}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(879, 5967343793001, 'delivery_type', 'dynamic_origin', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(880, 5967343793001, 'description', 'Investing is a tasty experience as well known business journalist Vivek Law tells you why your investing should like be a thali! In our special series Money Chef. Brought you to you by Kotak Mutual Fund on The Money Mile', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(881, 5967343793001, 'digital_master_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(882, 5967343793001, 'duration', '109440', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(883, 5967343793001, 'economics', 'AD_SUPPORTED', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(884, 5967343793001, 'folder_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(885, 5967343793001, 'geo', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(886, 5967343793001, 'has_digital_master', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(887, 5967343793001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/40d1f126-e6f1-4923-9574-9a5e573c58fd/main/1160x653/54s720ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/40d1f126-e6f1-4923-9574-9a5e573c58fd/main/1160x653/54s720ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/40d1f126-e6f1-4923-9574-9a5e573c58fd/main/248x140/54s720ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/40d1f126-e6f1-4923-9574-9a5e573c58fd/main/248x140/54s720ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(888, 5967343793001, 'link', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(889, 5967343793001, 'long_description', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(890, 5967343793001, 'name', 'MONEY CHEF THALI 09-10-17 NEW', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(891, 5967343793001, 'original_filename', 'MONEY_CHEF_THALI_30-11-17_.mp4', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(892, 5967343793001, 'projection', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(893, 5967343793001, 'published_at', '2018-11-15T12:40:30.127Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(894, 5967343793001, 'reference_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(895, 5967343793001, 'schedule', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(896, 5967343793001, 'sharing', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(897, 5967343793001, 'state', 'ACTIVE', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(898, 5967343793001, 'tags', 'a:10:{i:0;s:4:\"debt\";i:1;s:6:\"equity\";i:2;s:4:\"gold\";i:3;s:9:\"investing\";i:4;s:17:\"kotak mutual fund\";i:5;s:10:\"money chef\";i:6;s:11:\"mutual fund\";i:7;s:5:\"thali\";i:8;s:13:\"the moneymile\";i:9;s:9:\"vivek law\";}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(899, 5967343793001, 'text_tracks', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(900, 5967343793001, 'updated_at', '2018-11-15T12:50:59.760Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(901, 5967339853001, 'id', '5967339853001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(902, 5967339853001, 'account_id', '5814665417001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(903, 5967339853001, 'ad_keys', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(904, 5967339853001, 'clip_source_video_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(905, 5967339853001, 'complete', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(906, 5967339853001, 'created_at', '2018-11-15T12:40:36.895Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(907, 5967339853001, 'cue_points', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(908, 5967339853001, 'custom_fields', 'a:1:{s:9:\"speaker_1\";s:12:\"01-Vivek-Law\";}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(909, 5967339853001, 'delivery_type', 'dynamic_origin', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(910, 5967339853001, 'description', 'Struggling to keep up with the stock market? Listen to Vivek Law and invest in an equity mutual fund scheme and get your share just like a slice of pizza! #MoneyChef Returns brought to you by Kotak Mutual Fund', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(911, 5967339853001, 'digital_master_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(912, 5967339853001, 'duration', '122475', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(913, 5967339853001, 'economics', 'AD_SUPPORTED', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(914, 5967339853001, 'folder_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(915, 5967339853001, 'geo', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(916, 5967339853001, 'has_digital_master', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(917, 5967339853001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/5a5d6ab7-01b1-4db1-a34e-f6ff69a9b9e8/main/1160x653/1m1s237ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/5a5d6ab7-01b1-4db1-a34e-f6ff69a9b9e8/main/1160x653/1m1s237ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/5a5d6ab7-01b1-4db1-a34e-f6ff69a9b9e8/main/248x140/1m1s237ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/5a5d6ab7-01b1-4db1-a34e-f6ff69a9b9e8/main/248x140/1m1s237ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(918, 5967339853001, 'link', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(919, 5967339853001, 'long_description', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(920, 5967339853001, 'name', 'MONEY CHEF PIZZA 26 DEC', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(921, 5967339853001, 'original_filename', 'MONEY_CHEF_PIZZA_26_DEC._.mp4', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(922, 5967339853001, 'projection', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(923, 5967339853001, 'published_at', '2018-11-15T12:40:36.895Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(924, 5967339853001, 'reference_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(925, 5967339853001, 'schedule', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(926, 5967339853001, 'sharing', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(927, 5967339853001, 'state', 'ACTIVE', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(928, 5967339853001, 'tags', 'a:9:{i:0;s:9:\"investing\";i:1;s:17:\"kotak mutual fund\";i:2;s:10:\"money chef\";i:3;s:18:\"mutual fund scheme\";i:4;s:12:\"mutual funds\";i:5;s:12:\"stock market\";i:6;s:6:\"stocks\";i:7;s:13:\"the moneymile\";i:8;s:9:\"vivek law\";}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(929, 5967339853001, 'text_tracks', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(930, 5967339853001, 'updated_at', '2018-11-15T12:50:47.453Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(931, 5967336913001, 'id', '5967336913001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(932, 5967336913001, 'account_id', '5814665417001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(933, 5967336913001, 'ad_keys', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(934, 5967336913001, 'clip_source_video_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(935, 5967336913001, 'complete', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(936, 5967336913001, 'created_at', '2018-11-15T12:40:38.742Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(937, 5967336913001, 'cue_points', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(938, 5967336913001, 'custom_fields', 'a:1:{s:9:\"speaker_1\";s:12:\"01-Vivek-Law\";}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(939, 5967336913001, 'delivery_type', 'dynamic_origin', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(940, 5967336913001, 'description', 'Just like coffee, mutual funds are liquid and can be withdrawn with ease. So now getting in and out of the market is as simple as choosing between hot or cold coffee says Vivek Law on #MoneyChef Returns in association with Kotak Mutual Fund', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(941, 5967336913001, 'digital_master_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(942, 5967336913001, 'duration', '85163', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(943, 5967336913001, 'economics', 'AD_SUPPORTED', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(944, 5967336913001, 'folder_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(945, 5967336913001, 'geo', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(946, 5967336913001, 'has_digital_master', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(947, 5967336913001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/8195b0f7-f849-4cd0-9597-1d4187c08e44/main/1160x653/42s581ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/8195b0f7-f849-4cd0-9597-1d4187c08e44/main/1160x653/42s581ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/8195b0f7-f849-4cd0-9597-1d4187c08e44/main/248x140/42s581ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/8195b0f7-f849-4cd0-9597-1d4187c08e44/main/248x140/42s581ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(948, 5967336913001, 'link', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(949, 5967336913001, 'long_description', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(950, 5967336913001, 'name', 'MONEY CHEF Filter Coffee 26 DEC', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(951, 5967336913001, 'original_filename', 'MONEY_CHEF_Filter_Coffee_26_DEC_.mp4', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(952, 5967336913001, 'projection', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(953, 5967336913001, 'published_at', '2018-11-15T12:40:38.742Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(954, 5967336913001, 'reference_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(955, 5967336913001, 'schedule', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(956, 5967336913001, 'sharing', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(957, 5967336913001, 'state', 'ACTIVE', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(958, 5967336913001, 'tags', 'a:11:{i:0;s:6:\"coffee\";i:1;s:9:\"investing\";i:2;s:10:\"investment\";i:3;s:17:\"kotak mutual fund\";i:4;s:10:\"money chef\";i:5;s:16:\"money management\";i:6;s:11:\"mutual fund\";i:7;s:21:\"mutual funds in india\";i:8;s:16:\"personal finance\";i:9;s:13:\"the moneymile\";i:10;s:9:\"vivek law\";}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(959, 5967336913001, 'text_tracks', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(960, 5967336913001, 'updated_at', '2018-11-15T12:50:28.327Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(961, 5967346403001, 'id', '5967346403001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(962, 5967346403001, 'account_id', '5814665417001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(963, 5967346403001, 'ad_keys', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(964, 5967346403001, 'clip_source_video_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(965, 5967346403001, 'complete', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(966, 5967346403001, 'created_at', '2018-11-15T12:40:28.480Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(967, 5967346403001, 'cue_points', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(968, 5967346403001, 'custom_fields', 'a:1:{s:9:\"speaker_1\";s:12:\"01-Vivek-Law\";}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(969, 5967346403001, 'delivery_type', 'dynamic_origin', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(970, 5967346403001, 'description', 'Don\'t time your exit or entry into the market. Bake your investments like the perfect cake not when the markets are rising or falling says Vivek Law. In Association with Kotak Mutual Fund. #MoneyChef', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(971, 5967346403001, 'digital_master_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(972, 5967346403001, 'duration', '106432', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(973, 5967346403001, 'economics', 'AD_SUPPORTED', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(974, 5967346403001, 'folder_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(975, 5967346403001, 'geo', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(976, 5967346403001, 'has_digital_master', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(977, 5967346403001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/e2c36a9c-b9d2-4316-a4a8-89a818dcb81d/main/1160x653/53s216ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/e2c36a9c-b9d2-4316-a4a8-89a818dcb81d/main/1160x653/53s216ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/e2c36a9c-b9d2-4316-a4a8-89a818dcb81d/main/248x140/53s216ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/e2c36a9c-b9d2-4316-a4a8-89a818dcb81d/main/248x140/53s216ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(978, 5967346403001, 'link', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(979, 5967346403001, 'long_description', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(980, 5967346403001, 'name', 'MONEY_CHEF_TIME_IN_MARKET_30-11-17.mp4', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(981, 5967346403001, 'original_filename', 'MONEY_CHEF_TIME_IN_MARKET_30-11-17.mp4', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(982, 5967346403001, 'projection', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(983, 5967346403001, 'published_at', '2018-11-15T12:40:28.480Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(984, 5967346403001, 'reference_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(985, 5967346403001, 'schedule', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(986, 5967346403001, 'sharing', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(987, 5967346403001, 'state', 'ACTIVE', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(988, 5967346403001, 'tags', 'a:9:{i:0;s:9:\"investing\";i:1;s:10:\"investment\";i:2;s:11:\"investments\";i:3;s:17:\"kotak mutual fund\";i:4;s:10:\"money chef\";i:5;s:16:\"personal finance\";i:6;s:13:\"the moneymile\";i:7;s:26:\"timing of the stock market\";i:8;s:9:\"vivek law\";}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(989, 5967346403001, 'text_tracks', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(990, 5967346403001, 'updated_at', '2018-11-15T12:50:20.859Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(991, 5967345194001, 'id', '5967345194001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(992, 5967345194001, 'account_id', '5814665417001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(993, 5967345194001, 'ad_keys', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(994, 5967345194001, 'clip_source_video_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(995, 5967345194001, 'complete', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(996, 5967345194001, 'created_at', '2018-11-15T12:40:40.473Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(997, 5967345194001, 'cue_points', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(998, 5967345194001, 'custom_fields', 'a:1:{s:9:\"speaker_1\";s:12:\"01-Vivek-Law\";}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(999, 5967345194001, 'delivery_type', 'dynamic_origin', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1000, 5967345194001, 'description', 'Never put your eggs in one basket: A lesson from the kitchen that makes sense in the market too. Diversify your investments by investing in mutual funds!', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1001, 5967345194001, 'digital_master_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1002, 5967345194001, 'duration', '88469', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1003, 5967345194001, 'economics', 'AD_SUPPORTED', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1004, 5967345194001, 'folder_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1005, 5967345194001, 'geo', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1006, 5967345194001, 'has_digital_master', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1007, 5967345194001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/bcba9197-b30d-46eb-862d-131088b19d2f/main/1160x653/44s234ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/bcba9197-b30d-46eb-862d-131088b19d2f/main/1160x653/44s234ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/bcba9197-b30d-46eb-862d-131088b19d2f/main/248x140/44s234ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/bcba9197-b30d-46eb-862d-131088b19d2f/main/248x140/44s234ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1008, 5967345194001, 'link', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1009, 5967345194001, 'long_description', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1010, 5967345194001, 'name', 'MONEY CHEF EGGS IN BASKET 26 DEC', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1011, 5967345194001, 'original_filename', 'MONEY_CHEF_EGGS_IN_BASKET_26_DEC..mp4', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1012, 5967345194001, 'projection', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1013, 5967345194001, 'published_at', '2018-11-15T12:40:40.473Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1014, 5967345194001, 'reference_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1015, 5967345194001, 'schedule', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1016, 5967345194001, 'sharing', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1017, 5967345194001, 'state', 'ACTIVE', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1018, 5967345194001, 'tags', 'a:9:{i:0;s:13:\"asset classes\";i:1;s:21:\"diversify investments\";i:2;s:9:\"investing\";i:3;s:17:\"kotak mutual fund\";i:4;s:10:\"money chef\";i:5;s:16:\"money management\";i:6;s:16:\"personal finance\";i:7;s:13:\"the moneymile\";i:8;s:9:\"vivek law\";}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1019, 5967345194001, 'text_tracks', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1020, 5967345194001, 'updated_at', '2018-11-15T12:49:53.869Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1021, 5967343795001, 'id', '5967343795001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1022, 5967343795001, 'account_id', '5814665417001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1023, 5967343795001, 'ad_keys', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1024, 5967343795001, 'clip_source_video_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1025, 5967343795001, 'complete', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1026, 5967343795001, 'created_at', '2018-11-15T12:40:33.493Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1027, 5967343795001, 'cue_points', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1028, 5967343795001, 'custom_fields', 'a:1:{s:9:\"speaker_1\";s:12:\"01-Vivek-Law\";}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1029, 5967343795001, 'delivery_type', 'dynamic_origin', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1030, 5967343795001, 'description', 'Investments are like taste buds: everyone has different likes & different goals! Understand this investing recipe with Vivek Law & Kotak Mutual Fund on Money Chef', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1031, 5967343795001, 'digital_master_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1032, 5967343795001, 'duration', '95680', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1033, 5967343795001, 'economics', 'AD_SUPPORTED', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1034, 5967343795001, 'folder_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1035, 5967343795001, 'geo', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1036, 5967343795001, 'has_digital_master', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1037, 5967343795001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/d50d981d-db22-4c84-8162-fdc786ff6b85/main/1160x653/47s840ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/d50d981d-db22-4c84-8162-fdc786ff6b85/main/1160x653/47s840ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/d50d981d-db22-4c84-8162-fdc786ff6b85/main/248x140/47s840ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/d50d981d-db22-4c84-8162-fdc786ff6b85/main/248x140/47s840ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1038, 5967343795001, 'link', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1039, 5967343795001, 'long_description', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1040, 5967343795001, 'name', 'MONEY CHEF SANDWICH 09-10-17', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1041, 5967343795001, 'original_filename', 'MONEY_CHEF_SANDWICH_09-10-17.mp4', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1042, 5967343795001, 'projection', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1043, 5967343795001, 'published_at', '2018-11-15T12:40:33.493Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1044, 5967343795001, 'reference_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1045, 5967343795001, 'schedule', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1046, 5967343795001, 'sharing', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1047, 5967343795001, 'state', 'ACTIVE', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1048, 5967343795001, 'tags', 'a:8:{i:0;s:16:\"asset allocation\";i:1;s:9:\"investing\";i:2;s:17:\"kotak mutual fund\";i:3;s:10:\"money chef\";i:4;s:11:\"mutual fund\";i:5;s:21:\"mutual funds in india\";i:6;s:13:\"the moneymile\";i:7;s:9:\"vivek law\";}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1049, 5967343795001, 'text_tracks', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1050, 5967343795001, 'updated_at', '2018-11-15T12:49:44.577Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1051, 5967343796001, 'id', '5967343796001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1052, 5967343796001, 'account_id', '5814665417001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1053, 5967343796001, 'ad_keys', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1054, 5967343796001, 'clip_source_video_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1055, 5967343796001, 'complete', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1056, 5967343796001, 'created_at', '2018-11-15T12:40:35.267Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1057, 5967343796001, 'cue_points', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1058, 5967343796001, 'custom_fields', 'a:1:{s:9:\"speaker_1\";s:12:\"01-Vivek-Law\";}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1059, 5967343796001, 'delivery_type', 'dynamic_origin', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1060, 5967343796001, 'description', 'Just like biryani needs to be cooked for the right time, your equity investments need the power of compounding and time. Financial advice from Vivek Law in association with Kotak Mutual Fund as #MoneyChef Returns', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1061, 5967343796001, 'digital_master_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1062, 5967343796001, 'duration', '101995', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1063, 5967343796001, 'economics', 'AD_SUPPORTED', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1064, 5967343796001, 'folder_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1065, 5967343796001, 'geo', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1066, 5967343796001, 'has_digital_master', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1067, 5967343796001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/986727d0-a317-4624-8ec5-ec53f1339e11/main/1160x653/50s997ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/986727d0-a317-4624-8ec5-ec53f1339e11/main/1160x653/50s997ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/986727d0-a317-4624-8ec5-ec53f1339e11/main/248x140/50s997ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/986727d0-a317-4624-8ec5-ec53f1339e11/main/248x140/50s997ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1068, 5967343796001, 'link', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1069, 5967343796001, 'long_description', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1070, 5967343796001, 'name', 'MONEY CHEF BIRYANI 26 DEC', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1071, 5967343796001, 'original_filename', 'MONEY_CHEF_BIRYANI_26_DEC_.mp4', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1072, 5967343796001, 'projection', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1073, 5967343796001, 'published_at', '2018-11-15T12:40:35.267Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1074, 5967343796001, 'reference_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1075, 5967343796001, 'schedule', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1076, 5967343796001, 'sharing', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1077, 5967343796001, 'state', 'ACTIVE', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1078, 5967343796001, 'tags', 'a:10:{i:0;s:7:\"biryani\";i:1;s:9:\"investing\";i:2;s:17:\"kotak mutual fund\";i:3;s:10:\"money chef\";i:4;s:12:\"mutual funds\";i:5;s:21:\"mutual funds in india\";i:6;s:16:\"personal finance\";i:7;s:12:\"stock market\";i:8;s:13:\"the moneymile\";i:9;s:9:\"vivek law\";}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1079, 5967343796001, 'text_tracks', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1080, 5967343796001, 'updated_at', '2018-11-15T12:49:31.650Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1081, 5967343794001, 'id', '5967343794001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1082, 5967343794001, 'account_id', '5814665417001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1083, 5967343794001, 'ad_keys', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1084, 5967343794001, 'clip_source_video_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1085, 5967343794001, 'complete', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1086, 5967343794001, 'created_at', '2018-11-15T12:40:31.766Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1087, 5967343794001, 'cue_points', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1088, 5967343794001, 'custom_fields', 'a:1:{s:9:\"speaker_1\";s:12:\"01-Vivek-Law\";}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1089, 5967343794001, 'delivery_type', 'dynamic_origin', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1090, 5967343794001, 'description', 'Never rush your investments, just like you would never gulp a glass of juice. Investment advice from Vivek Law on the Money Chef in association with Kotak Mutual Fund', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1091, 5967343794001, 'digital_master_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1092, 5967343794001, 'duration', '102080', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1093, 5967343794001, 'economics', 'AD_SUPPORTED', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1094, 5967343794001, 'folder_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1095, 5967343794001, 'geo', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1096, 5967343794001, 'has_digital_master', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1097, 5967343794001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/b4840a40-4366-4ef4-9505-e7877db21ed9/main/1160x653/51s40ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/b4840a40-4366-4ef4-9505-e7877db21ed9/main/1160x653/51s40ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:144:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/b4840a40-4366-4ef4-9505-e7877db21ed9/main/248x140/51s40ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:144:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/b4840a40-4366-4ef4-9505-e7877db21ed9/main/248x140/51s40ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1098, 5967343794001, 'link', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1099, 5967343794001, 'long_description', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1100, 5967343794001, 'name', 'MONEY CHEF SIP JUICE 09-10-17', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1101, 5967343794001, 'original_filename', 'MONEY_CHEF_SIP_JUICE_09-10-17.mp4', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1102, 5967343794001, 'projection', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1103, 5967343794001, 'published_at', '2018-11-15T12:40:31.766Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1104, 5967343794001, 'reference_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1105, 5967343794001, 'schedule', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1106, 5967343794001, 'sharing', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1107, 5967343794001, 'state', 'ACTIVE', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1108, 5967343794001, 'tags', 'a:9:{i:0;s:9:\"investing\";i:1;s:11:\"investments\";i:2;s:17:\"kotak mutual fund\";i:3;s:10:\"money chef\";i:4;s:12:\"mutual funds\";i:5;s:3:\"sip\";i:6;s:20:\"the moneymile: juice\";i:7;s:17:\"timing the market\";i:8;s:9:\"vivek law\";}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1109, 5967343794001, 'text_tracks', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1110, 5967343794001, 'updated_at', '2018-11-15T12:49:07.293Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1111, 5967343792001, 'id', '5967343792001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1112, 5967343792001, 'account_id', '5814665417001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1113, 5967343792001, 'ad_keys', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1114, 5967343792001, 'clip_source_video_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1115, 5967343792001, 'complete', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1116, 5967343792001, 'created_at', '2018-11-15T12:40:26.746Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1117, 5967343792001, 'cue_points', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1118, 5967343792001, 'custom_fields', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1119, 5967343792001, 'delivery_type', 'dynamic_origin', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1120, 5967343792001, 'description', 'Kotak Mutual Fund presents the Money Chef with Vivek Law. Don\'t miss the investing lessons from the kitchen!', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1121, 5967343792001, 'digital_master_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1122, 5967343792001, 'duration', '9664', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1123, 5967343792001, 'economics', 'AD_SUPPORTED', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1124, 5967343792001, 'folder_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1125, 5967343792001, 'geo', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1126, 5967343792001, 'has_digital_master', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1127, 5967343792001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/9696dfaa-6de6-4e33-a6a6-6ff161827150/main/1160x653/4s832ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/9696dfaa-6de6-4e33-a6a6-6ff161827150/main/1160x653/4s832ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:144:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/9696dfaa-6de6-4e33-a6a6-6ff161827150/main/248x140/4s832ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:144:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/9696dfaa-6de6-4e33-a6a6-6ff161827150/main/248x140/4s832ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1128, 5967343792001, 'link', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1129, 5967343792001, 'long_description', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1130, 5967343792001, 'name', 'Money mile sting', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1131, 5967343792001, 'original_filename', 'Money_mile_sting.mp4', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1132, 5967343792001, 'projection', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1133, 5967343792001, 'published_at', '2018-11-15T12:40:26.746Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1134, 5967343792001, 'reference_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1135, 5967343792001, 'schedule', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1136, 5967343792001, 'sharing', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1137, 5967343792001, 'state', 'ACTIVE', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1138, 5967343792001, 'tags', 'a:5:{i:0;s:9:\"investing\";i:1;s:17:\"kotak mutual fund\";i:2;s:10:\"money chef\";i:3;s:13:\"the moneymile\";i:4;s:9:\"vivek law\";}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1139, 5967343792001, 'text_tracks', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1140, 5967343792001, 'updated_at', '2018-11-15T12:48:21.202Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1141, 5843727979001, 'id', '5843727979001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1142, 5843727979001, 'account_id', '5814665417001', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1143, 5843727979001, 'ad_keys', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1144, 5843727979001, 'clip_source_video_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1145, 5843727979001, 'complete', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1146, 5843727979001, 'created_at', '2018-10-03T10:47:11.320Z', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1147, 5843727979001, 'cue_points', 'a:0:{}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1148, 5843727979001, 'custom_fields', 'a:3:{s:9:\"speaker_3\";s:15:\"02-surya-bhatia\";s:9:\"speaker_2\";s:15:\"02-surya-bhatia\";s:9:\"speaker_1\";s:12:\"01-vivek-law\";}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1149, 5843727979001, 'delivery_type', 'dynamic_origin', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1150, 5843727979001, 'description', '#EquitySahiHai is your destination for learning all about investing in equity. Educate and empower yourself by watching the videos that bring you the biggest experts in the stock market and the world of mutual funds.', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1151, 5843727979001, 'digital_master_id', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1152, 5843727979001, 'duration', '133074', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1153, 5843727979001, 'economics', 'AD_SUPPORTED', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1154, 5843727979001, 'folder_id', '5b6159a00332280e6bd6f6be', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1155, 5843727979001, 'geo', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1156, 5843727979001, 'has_digital_master', '1', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1157, 5843727979001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/3b71a7b0-6984-4baf-b0ef-e6040327ae74/main/1160x653/1m6s537ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/3b71a7b0-6984-4baf-b0ef-e6040327ae74/main/1160x653/1m6s537ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/3b71a7b0-6984-4baf-b0ef-e6040327ae74/main/248x140/1m6s537ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/3b71a7b0-6984-4baf-b0ef-e6040327ae74/main/248x140/1m6s537ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1158, 5843727979001, 'link', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1159, 5843727979001, 'long_description', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1160, 5843727979001, 'name', 'Growth and Dividend Plans - Equity Sahi Hai', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1161, 5843727979001, 'original_filename', 'main-mezz-en-main.mp4', '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1162, 5843727979001, 'projection', NULL, '2018-11-15 21:01:23', '2018-11-15 21:01:23'),
(1163, 5843727979001, 'published_at', '2018-10-03T11:04:38.112Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1164, 5843727979001, 'reference_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1165, 5843727979001, 'schedule', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1166, 5843727979001, 'sharing', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1167, 5843727979001, 'state', 'ACTIVE', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1168, 5843727979001, 'tags', 'a:1:{i:0;s:13:\"equitysahihai\";}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1169, 5843727979001, 'text_tracks', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1170, 5843727979001, 'updated_at', '2018-11-12T08:26:21.953Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1171, 5846306450001, 'id', '5846306450001', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1172, 5846306450001, 'account_id', '5814665417001', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1173, 5846306450001, 'ad_keys', 'category=sports&live=true', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1174, 5846306450001, 'clip_source_video_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1175, 5846306450001, 'complete', '1', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1176, 5846306450001, 'created_at', '2018-10-09T10:06:01.534Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1177, 5846306450001, 'cue_points', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1178, 5846306450001, 'custom_fields', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1179, 5846306450001, 'delivery_type', 'dynamic_origin', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1180, 5846306450001, 'description', 'Manik Nangia, Marketing Director and Chief Digital Officer, Max Life Insurance, recommends investment strategies for different types of investors only on #NiveshKarBefikar', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1181, 5846306450001, 'digital_master_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1182, 5846306450001, 'duration', '157292', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1183, 5846306450001, 'economics', 'AD_SUPPORTED', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1184, 5846306450001, 'folder_id', '5b6159a00332280e6bd6f6be', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1185, 5846306450001, 'geo', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1186, 5846306450001, 'has_digital_master', '1', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1187, 5846306450001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:148:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/2d52ac63-035d-49c3-ac36-7886e18ecd55/main/1160x653/1m18s646ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:148:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/2d52ac63-035d-49c3-ac36-7886e18ecd55/main/1160x653/1m18s646ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/2d52ac63-035d-49c3-ac36-7886e18ecd55/main/248x140/1m18s646ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/2d52ac63-035d-49c3-ac36-7886e18ecd55/main/248x140/1m18s646ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1188, 5846306450001, 'link', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1189, 5846306450001, 'long_description', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1190, 5846306450001, 'name', 'Different Allocation Strategies - Nivesh Kar Befikar', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1191, 5846306450001, 'original_filename', 'Different Allocation Strategies - Nivesh Kar Befikar.mp4', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1192, 5846306450001, 'projection', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1193, 5846306450001, 'published_at', '2018-11-02T08:09:34.403Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1194, 5846306450001, 'reference_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1195, 5846306450001, 'schedule', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1196, 5846306450001, 'sharing', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1197, 5846306450001, 'state', 'ACTIVE', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1198, 5846306450001, 'tags', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1199, 5846306450001, 'text_tracks', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1200, 5846306450001, 'updated_at', '2018-11-08T09:35:35.514Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1201, 5843741501001, 'id', '5843741501001', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1202, 5843741501001, 'account_id', '5814665417001', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1203, 5843741501001, 'ad_keys', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1204, 5843741501001, 'clip_source_video_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1205, 5843741501001, 'complete', '1', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1206, 5843741501001, 'created_at', '2018-10-03T11:19:53.842Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1207, 5843741501001, 'cue_points', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1208, 5843741501001, 'custom_fields', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1209, 5843741501001, 'delivery_type', 'dynamic_origin', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1210, 5843741501001, 'description', '#EquitySahiHai is your destination for learning all about investing in equity. Educate and empower yourself by watching the videos that bring you the biggest experts in the stock market and the world of mutual funds.', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1211, 5843741501001, 'digital_master_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1212, 5843741501001, 'duration', '68034', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1213, 5843741501001, 'economics', 'AD_SUPPORTED', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1214, 5843741501001, 'folder_id', '5b6159a00332280e6bd6f6be', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1215, 5843741501001, 'geo', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1216, 5843741501001, 'has_digital_master', '1', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1217, 5843741501001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/a82328c3-0cd3-4847-8ee0-5b0f9522cc05/main/1160x653/34s17ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/a82328c3-0cd3-4847-8ee0-5b0f9522cc05/main/1160x653/34s17ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:144:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/a82328c3-0cd3-4847-8ee0-5b0f9522cc05/main/248x140/34s17ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:144:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/a82328c3-0cd3-4847-8ee0-5b0f9522cc05/main/248x140/34s17ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1218, 5843741501001, 'link', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1219, 5843741501001, 'long_description', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1220, 5843741501001, 'name', 'Equity Sahi Hai - An Investor Education Initiative', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1221, 5843741501001, 'original_filename', 'main-mezz-en-main.mp4', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1222, 5843741501001, 'projection', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1223, 5843741501001, 'published_at', '2018-10-03T11:21:10.462Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1224, 5843741501001, 'reference_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1225, 5843741501001, 'schedule', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1226, 5843741501001, 'sharing', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1227, 5843741501001, 'state', 'ACTIVE', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1228, 5843741501001, 'tags', 'a:1:{i:0;s:13:\"equitysahihai\";}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1229, 5843741501001, 'text_tracks', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1230, 5843741501001, 'updated_at', '2018-11-08T09:35:35.514Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1231, 5832970611001, 'id', '5832970611001', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1232, 5832970611001, 'account_id', '5814665417001', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1233, 5832970611001, 'ad_keys', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1234, 5832970611001, 'clip_source_video_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1235, 5832970611001, 'complete', '1', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1236, 5832970611001, 'created_at', '2018-09-10T11:48:32.850Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1237, 5832970611001, 'cue_points', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1238, 5832970611001, 'custom_fields', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1239, 5832970611001, 'delivery_type', 'dynamic_origin', '2018-11-15 21:01:24', '2018-11-15 21:01:24');
INSERT INTO `mm_video_metas` (`id`, `video_id`, `meta_key`, `meta_value`, `created_at`, `updated_at`) VALUES
(1240, 5832970611001, 'description', 'The MoneyMile’s Founder and CEO Vivek Law and the CEO of PolicyBazaar.com Mr. Yashish Dahiya discuss how easy and faster it is for someone to purchase a ulip plan online through e-KYC. ', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1241, 5832970611001, 'digital_master_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1242, 5832970611001, 'duration', '490452', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1243, 5832970611001, 'economics', 'AD_SUPPORTED', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1244, 5832970611001, 'folder_id', '5b6159a00332280e6bd6f6be', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1245, 5832970611001, 'geo', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1246, 5832970611001, 'has_digital_master', '1', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1247, 5832970611001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/69290f92-4409-4507-9f69-8388c5b51be3/main/1160x653/4m5s226ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/69290f92-4409-4507-9f69-8388c5b51be3/main/1160x653/4m5s226ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/69290f92-4409-4507-9f69-8388c5b51be3/main/248x140/4m5s226ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/69290f92-4409-4507-9f69-8388c5b51be3/main/248x140/4m5s226ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1248, 5832970611001, 'link', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1249, 5832970611001, 'long_description', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1250, 5832970611001, 'name', 'Episode 5 of #TransparentULIPs – Convenience and Ease of Buying a ULIP Policy Online', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1251, 5832970611001, 'original_filename', 'main-mezz-en-main.mp4', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1252, 5832970611001, 'projection', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1253, 5832970611001, 'published_at', '2018-09-10T11:52:37.958Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1254, 5832970611001, 'reference_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1255, 5832970611001, 'schedule', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1256, 5832970611001, 'sharing', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1257, 5832970611001, 'state', 'ACTIVE', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1258, 5832970611001, 'tags', 'a:1:{i:0;s:16:\"transparentulips\";}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1259, 5832970611001, 'text_tracks', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1260, 5832970611001, 'updated_at', '2018-11-08T09:35:35.513Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1261, 5832976243001, 'id', '5832976243001', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1262, 5832976243001, 'account_id', '5814665417001', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1263, 5832976243001, 'ad_keys', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1264, 5832976243001, 'clip_source_video_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1265, 5832976243001, 'complete', '1', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1266, 5832976243001, 'created_at', '2018-09-10T12:08:41.959Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1267, 5832976243001, 'cue_points', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1268, 5832976243001, 'custom_fields', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1269, 5832976243001, 'delivery_type', 'dynamic_origin', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1270, 5832976243001, 'description', 'Do investors make hasty decisions when markets are volatile? Aashish Somaiyaa, CEO, Motilal Oswal Asset Management, recommends holding on. Only on #EquitySahiHai.', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1271, 5832976243001, 'digital_master_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1272, 5832976243001, 'duration', '241604', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1273, 5832976243001, 'economics', 'AD_SUPPORTED', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1274, 5832976243001, 'folder_id', '5b6159a00332280e6bd6f6be', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1275, 5832976243001, 'geo', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1276, 5832976243001, 'has_digital_master', '1', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1277, 5832976243001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/73f7cd51-30c2-4af3-8562-50284d9fdde1/main/1160x653/2m802ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/73f7cd51-30c2-4af3-8562-50284d9fdde1/main/1160x653/2m802ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:144:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/73f7cd51-30c2-4af3-8562-50284d9fdde1/main/248x140/2m802ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:144:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/73f7cd51-30c2-4af3-8562-50284d9fdde1/main/248x140/2m802ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1278, 5832976243001, 'link', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1279, 5832976243001, 'long_description', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1280, 5832976243001, 'name', 'Buy Right, Sit Tight- Part 2 - Equity Sahi Hai', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1281, 5832976243001, 'original_filename', 'main-mezz-en-main.mp4', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1282, 5832976243001, 'projection', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1283, 5832976243001, 'published_at', '2018-09-10T12:09:24.502Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1284, 5832976243001, 'reference_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1285, 5832976243001, 'schedule', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1286, 5832976243001, 'sharing', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1287, 5832976243001, 'state', 'ACTIVE', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1288, 5832976243001, 'tags', 'a:1:{i:0;s:13:\"equitysahihai\";}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1289, 5832976243001, 'text_tracks', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1290, 5832976243001, 'updated_at', '2018-11-08T09:35:35.513Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1291, 5832974497001, 'id', '5832974497001', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1292, 5832974497001, 'account_id', '5814665417001', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1293, 5832974497001, 'ad_keys', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1294, 5832974497001, 'clip_source_video_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1295, 5832974497001, 'complete', '1', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1296, 5832974497001, 'created_at', '2018-09-10T12:06:45.420Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1297, 5832974497001, 'cue_points', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1298, 5832974497001, 'custom_fields', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1299, 5832974497001, 'delivery_type', 'dynamic_origin', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1300, 5832974497001, 'description', 'From the role of the government in pushing digital payments, to life after demonetization, Sudipta Roy of ICICI Bank & Bob Reany of Mastercard chat with Vivek Law on #PaywithPeace.', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1301, 5832974497001, 'digital_master_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1302, 5832974497001, 'duration', '350807', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1303, 5832974497001, 'economics', 'AD_SUPPORTED', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1304, 5832974497001, 'folder_id', '5b6159a00332280e6bd6f6be', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1305, 5832974497001, 'geo', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1306, 5832974497001, 'has_digital_master', '1', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1307, 5832974497001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:148:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/d40225cb-2464-4767-baf9-1ac19db2092d/main/1160x653/2m55s403ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:148:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/d40225cb-2464-4767-baf9-1ac19db2092d/main/1160x653/2m55s403ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/d40225cb-2464-4767-baf9-1ac19db2092d/main/248x140/2m55s403ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/d40225cb-2464-4767-baf9-1ac19db2092d/main/248x140/2m55s403ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1308, 5832974497001, 'link', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1309, 5832974497001, 'long_description', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1310, 5832974497001, 'name', 'The Government Is Committed To Digital Payments - Pay With Peace', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1311, 5832974497001, 'original_filename', 'main-mezz-en-main.mp4', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1312, 5832974497001, 'projection', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1313, 5832974497001, 'published_at', '2018-09-10T12:08:05.753Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1314, 5832974497001, 'reference_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1315, 5832974497001, 'schedule', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1316, 5832974497001, 'sharing', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1317, 5832974497001, 'state', 'ACTIVE', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1318, 5832974497001, 'tags', 'a:3:{i:0;s:14:\"demonetization\";i:1;s:12:\"paywithpeace\";i:2;s:22:\"pushingdigitalpayments\";}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1319, 5832974497001, 'text_tracks', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1320, 5832974497001, 'updated_at', '2018-11-08T09:35:35.513Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1321, 5832976578001, 'id', '5832976578001', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1322, 5832976578001, 'account_id', '5814665417001', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1323, 5832976578001, 'ad_keys', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1324, 5832976578001, 'clip_source_video_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1325, 5832976578001, 'complete', '1', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1326, 5832976578001, 'created_at', '2018-09-10T12:05:13.386Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1327, 5832976578001, 'cue_points', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1328, 5832976578001, 'custom_fields', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1329, 5832976578001, 'delivery_type', 'dynamic_origin', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1330, 5832976578001, 'description', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1331, 5832976578001, 'digital_master_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1332, 5832976578001, 'duration', '426156', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1333, 5832976578001, 'economics', 'AD_SUPPORTED', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1334, 5832976578001, 'folder_id', '5b6159a00332280e6bd6f6be', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1335, 5832976578001, 'geo', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1336, 5832976578001, 'has_digital_master', '1', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1337, 5832976578001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/192ed76e-2c34-4878-98e5-5375faa2638b/main/1160x653/3m33s78ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/192ed76e-2c34-4878-98e5-5375faa2638b/main/1160x653/3m33s78ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/192ed76e-2c34-4878-98e5-5375faa2638b/main/248x140/3m33s78ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/192ed76e-2c34-4878-98e5-5375faa2638b/main/248x140/3m33s78ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1338, 5832976578001, 'link', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1339, 5832976578001, 'long_description', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1340, 5832976578001, 'name', 'Three Way Push To Decline Card Frauds in India | Pay With Peace', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1341, 5832976578001, 'original_filename', 'main-mezz-en-main.mp4', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1342, 5832976578001, 'projection', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1343, 5832976578001, 'published_at', '2018-09-10T12:06:25.675Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1344, 5832976578001, 'reference_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1345, 5832976578001, 'schedule', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1346, 5832976578001, 'sharing', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1347, 5832976578001, 'state', 'ACTIVE', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1348, 5832976578001, 'tags', 'a:2:{i:0;s:17:\"declinecardfrauds\";i:1;s:12:\"paywithpeace\";}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1349, 5832976578001, 'text_tracks', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1350, 5832976578001, 'updated_at', '2018-11-08T09:35:35.513Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1351, 5832962384001, 'id', '5832962384001', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1352, 5832962384001, 'account_id', '5814665417001', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1353, 5832962384001, 'ad_keys', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1354, 5832962384001, 'clip_source_video_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1355, 5832962384001, 'complete', '1', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1356, 5832962384001, 'created_at', '2018-09-10T12:01:46.715Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1357, 5832962384001, 'cue_points', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1358, 5832962384001, 'custom_fields', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1359, 5832962384001, 'delivery_type', 'dynamic_origin', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1360, 5832962384001, 'description', 'There\'s a lot that is happening in the evolution from a cash to a cashless economy, here in India.', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1361, 5832962384001, 'digital_master_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1362, 5832962384001, 'duration', '1910236', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1363, 5832962384001, 'economics', 'AD_SUPPORTED', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1364, 5832962384001, 'folder_id', '5b6159a00332280e6bd6f6be', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1365, 5832962384001, 'geo', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1366, 5832962384001, 'has_digital_master', '1', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1367, 5832962384001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:149:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/79fd292a-8e61-4118-90ec-82a324a4d63e/main/1160x653/15m55s118ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:149:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/79fd292a-8e61-4118-90ec-82a324a4d63e/main/1160x653/15m55s118ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:148:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/79fd292a-8e61-4118-90ec-82a324a4d63e/main/248x140/15m55s118ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:148:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/79fd292a-8e61-4118-90ec-82a324a4d63e/main/248x140/15m55s118ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1368, 5832962384001, 'link', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1369, 5832962384001, 'long_description', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1370, 5832962384001, 'name', 'Digital Payments Are Becoming The Norm | Pay With Peace', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1371, 5832962384001, 'original_filename', 'main-mezz-en-main.mp4', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1372, 5832962384001, 'projection', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1373, 5832962384001, 'published_at', '2018-09-10T12:04:13.607Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1374, 5832962384001, 'reference_id', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1375, 5832962384001, 'schedule', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1376, 5832962384001, 'sharing', NULL, '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1377, 5832962384001, 'state', 'ACTIVE', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1378, 5832962384001, 'tags', 'a:2:{i:0;s:15:\"digitalpayments\";i:1;s:12:\"paywithpeace\";}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1379, 5832962384001, 'text_tracks', 'a:0:{}', '2018-11-15 21:01:24', '2018-11-15 21:01:24'),
(1380, 5832962384001, 'updated_at', '2018-11-08T09:35:35.513Z', '2018-11-15 21:01:24', '2018-11-15 21:01:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mm_age_groups`
--
ALTER TABLE `mm_age_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `age_groups_value_unique` (`value`);

--
-- Indexes for table `mm_home_advertisements`
--
ALTER TABLE `mm_home_advertisements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_advertisements_type_id_index` (`type_id`),
  ADD KEY `home_advertisements_width_index` (`width`),
  ADD KEY `home_advertisements_height_index` (`height`);

--
-- Indexes for table `mm_home_settings`
--
ALTER TABLE `mm_home_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mm_informations`
--
ALTER TABLE `mm_informations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mm_information_descriptions`
--
ALTER TABLE `mm_information_descriptions`
  ADD UNIQUE KEY `information_descriptions_title_unique` (`title`),
  ADD KEY `information_descriptions_information_id_index` (`information_id`),
  ADD KEY `information_descriptions_language_id_index` (`language_id`);

--
-- Indexes for table `mm_menus`
--
ALTER TABLE `mm_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menus_name_index` (`name`);

--
-- Indexes for table `mm_menu_items`
--
ALTER TABLE `mm_menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_index` (`menu_id`),
  ADD KEY `menu_items_title_index` (`title`),
  ADD KEY `menu_items_slug_index` (`slug`);

--
-- Indexes for table `mm_migrations`
--
ALTER TABLE `mm_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mm_permissions`
--
ALTER TABLE `mm_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mm_players`
--
ALTER TABLE `mm_players`
  ADD UNIQUE KEY `players_player_id_unique` (`player_id`),
  ADD UNIQUE KEY `players_name_unique` (`name`);

--
-- Indexes for table `mm_player_metas`
--
ALTER TABLE `mm_player_metas`
  ADD KEY `player_metas_player_id_index` (`player_id`),
  ADD KEY `player_metas_meta_key_index` (`meta_key`);

--
-- Indexes for table `mm_playlists`
--
ALTER TABLE `mm_playlists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `playlists_name_unique` (`name`),
  ADD UNIQUE KEY `playlists_slug_unique` (`slug`);

--
-- Indexes for table `mm_playlist_metas`
--
ALTER TABLE `mm_playlist_metas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `playlist_metas_playlist_id_index` (`playlist_id`),
  ADD KEY `playlist_metas_meta_key_index` (`meta_key`);

--
-- Indexes for table `mm_reason_for_account_deactivations`
--
ALTER TABLE `mm_reason_for_account_deactivations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reason_for_account_deactivations_name_unique` (`name`);

--
-- Indexes for table `mm_roles`
--
ALTER TABLE `mm_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_role_unique` (`role`);

--
-- Indexes for table `mm_role_permissions`
--
ALTER TABLE `mm_role_permissions`
  ADD KEY `role_permissions_permission_id_index` (`permission_id`),
  ADD KEY `role_permissions_role_id_index` (`role_id`);

--
-- Indexes for table `mm_settings`
--
ALTER TABLE `mm_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_option_name_unique` (`option_name`);

--
-- Indexes for table `mm_speakers`
--
ALTER TABLE `mm_speakers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `speakers_slug_unique` (`slug`);

--
-- Indexes for table `mm_speaker_descriptions`
--
ALTER TABLE `mm_speaker_descriptions`
  ADD KEY `speaker_descriptions_speaker_id_index` (`speaker_id`),
  ADD KEY `speaker_descriptions_language_id_index` (`language_id`);

--
-- Indexes for table `mm_speaker_socials`
--
ALTER TABLE `mm_speaker_socials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `speaker_socials_speaker_id_index` (`speaker_id`);

--
-- Indexes for table `mm_states`
--
ALTER TABLE `mm_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mm_subscriptions`
--
ALTER TABLE `mm_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_email_unique` (`email`);

--
-- Indexes for table `mm_tags`
--
ALTER TABLE `mm_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_tag_unique` (`tag`);

--
-- Indexes for table `mm_translations`
--
ALTER TABLE `mm_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_name_unique` (`name`),
  ADD UNIQUE KEY `translations_code_unique` (`code`),
  ADD UNIQUE KEY `translations_locale_unique` (`locale`);

--
-- Indexes for table `mm_users`
--
ALTER TABLE `mm_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_index` (`role_id`),
  ADD KEY `users_name_index` (`name`);

--
-- Indexes for table `mm_user_comments`
--
ALTER TABLE `mm_user_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_comments_user_id_index` (`user_id`),
  ADD KEY `user_comments_video_id_index` (`video_id`);

--
-- Indexes for table `mm_user_metas`
--
ALTER TABLE `mm_user_metas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_metas_user_id_index` (`user_id`);

--
-- Indexes for table `mm_user_password_resets`
--
ALTER TABLE `mm_user_password_resets`
  ADD KEY `user_password_resets_email_index` (`email`),
  ADD KEY `user_password_resets_token_index` (`token`);

--
-- Indexes for table `mm_user_verifies`
--
ALTER TABLE `mm_user_verifies`
  ADD KEY `user_verifies_user_id_index` (`user_id`),
  ADD KEY `user_verifies_token_index` (`token`);

--
-- Indexes for table `mm_user_wishlists`
--
ALTER TABLE `mm_user_wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_wishlists_user_id_index` (`user_id`),
  ADD KEY `user_wishlists_video_id_index` (`video_id`);

--
-- Indexes for table `mm_videos`
--
ALTER TABLE `mm_videos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `videos_name_unique` (`name`),
  ADD UNIQUE KEY `videos_slug_unique` (`slug`);

--
-- Indexes for table `mm_video_metas`
--
ALTER TABLE `mm_video_metas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_metas_video_id_index` (`video_id`),
  ADD KEY `video_metas_meta_key_index` (`meta_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mm_age_groups`
--
ALTER TABLE `mm_age_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mm_home_advertisements`
--
ALTER TABLE `mm_home_advertisements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `mm_home_settings`
--
ALTER TABLE `mm_home_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `mm_informations`
--
ALTER TABLE `mm_informations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mm_menus`
--
ALTER TABLE `mm_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `mm_menu_items`
--
ALTER TABLE `mm_menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `mm_migrations`
--
ALTER TABLE `mm_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `mm_permissions`
--
ALTER TABLE `mm_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mm_playlists`
--
ALTER TABLE `mm_playlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5824129873002;

--
-- AUTO_INCREMENT for table `mm_playlist_metas`
--
ALTER TABLE `mm_playlist_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `mm_reason_for_account_deactivations`
--
ALTER TABLE `mm_reason_for_account_deactivations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mm_roles`
--
ALTER TABLE `mm_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mm_settings`
--
ALTER TABLE `mm_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mm_speakers`
--
ALTER TABLE `mm_speakers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mm_speaker_socials`
--
ALTER TABLE `mm_speaker_socials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mm_states`
--
ALTER TABLE `mm_states`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mm_subscriptions`
--
ALTER TABLE `mm_subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mm_tags`
--
ALTER TABLE `mm_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mm_translations`
--
ALTER TABLE `mm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mm_users`
--
ALTER TABLE `mm_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `mm_user_comments`
--
ALTER TABLE `mm_user_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `mm_user_metas`
--
ALTER TABLE `mm_user_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `mm_user_wishlists`
--
ALTER TABLE `mm_user_wishlists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `mm_videos`
--
ALTER TABLE `mm_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5967346403002;

--
-- AUTO_INCREMENT for table `mm_video_metas`
--
ALTER TABLE `mm_video_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1381;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mm_information_descriptions`
--
ALTER TABLE `mm_information_descriptions`
  ADD CONSTRAINT `information_descriptions_information_id_foreign` FOREIGN KEY (`information_id`) REFERENCES `mm_informations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mm_menu_items`
--
ALTER TABLE `mm_menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `mm_menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mm_playlist_metas`
--
ALTER TABLE `mm_playlist_metas`
  ADD CONSTRAINT `playlist_metas_playlist_id_foreign` FOREIGN KEY (`playlist_id`) REFERENCES `mm_playlists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mm_speaker_descriptions`
--
ALTER TABLE `mm_speaker_descriptions`
  ADD CONSTRAINT `speaker_descriptions_speaker_id_foreign` FOREIGN KEY (`speaker_id`) REFERENCES `mm_speakers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mm_user_metas`
--
ALTER TABLE `mm_user_metas`
  ADD CONSTRAINT `user_metas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `mm_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mm_user_password_resets`
--
ALTER TABLE `mm_user_password_resets`
  ADD CONSTRAINT `user_password_resets_email_foreign` FOREIGN KEY (`email`) REFERENCES `mm_users` (`email`) ON DELETE CASCADE;

--
-- Constraints for table `mm_user_verifies`
--
ALTER TABLE `mm_user_verifies`
  ADD CONSTRAINT `user_verifies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `mm_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mm_video_metas`
--
ALTER TABLE `mm_video_metas`
  ADD CONSTRAINT `video_metas_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `mm_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
