-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 14, 2018 at 02:01 AM
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
(3, 'surya-bhatia', 'speaker/1537524700.png', '02-surya-bhatia', '2018-09-21 03:16:00', '2018-09-25 06:08:08'),
(4, 'vivek-law', 'speaker/1537524720.png', '01-vivek-law', '2018-09-21 03:28:49', '2018-09-25 06:07:21');

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
(3, 3, 'Surya Bhatia', 'Expert', 'Surya Bhatia is a writer, humorist, geek celebrity, former professional literary agent and', '<p>John Hodgman is a writer, humorist, geek celebrity, former professional literary agent and expert on all world knowledge. He was the bumbling PC in Apple&#39;s long-running &quot;I&#39;m a Mac; I&#39;m a PC&quot; ad campaign.&nbsp;John Hodgman is a writer, humorist, geek celebrity, former professional literary agent and expert on all world knowledge. He was the bumbling PC in Apple&#39;s long-running &quot;I&#39;m a Mac; I&#39;m a PC&quot; ad campaign.</p>', 'John Hodgman is a writer, humorist, geek celebrity, former professional literary agent and', 'asdf', 'asdf', 'adfasdf'),
(4, 3, 'Vivek Law', 'Founder at The Money Mile', 'assf', '<p>Founder, CEO &amp; Editor-in-Chief The MoneyMile. Author of The Money Book.&nbsp;Founder, CEO &amp; Editor-in-Chief The MoneyMile. Author of The Money Book.&nbsp;Founder, CEO &amp; Editor-in-Chief The MoneyMile. Author of The Money Book.&nbsp;Founder, CEO &amp; Editor-in-Chief The MoneyMile. Author of The Money Book.&nbsp;Founder, CEO &amp; Editor-in-Chief The MoneyMile. Author of The Money Book.&nbsp;Founder, CEO &amp; Editor-in-Chief The MoneyMile. Author of The Money Book.&nbsp;Founder, CEO &amp; Editor-in-Chief The MoneyMile. Author of The Money Book.</p>', 'Founder, CEO & Editor-in-Chief The MoneyMile. Author of The Money Book.', 'Vivek Law', 'vivek law', NULL),
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
(2, 4, 'http://facebook.com', 'http://linkedin.com', NULL, NULL, '2018-09-24 18:30:00', '2018-09-25 06:07:21'),
(3, 5, NULL, NULL, 'http://google.com', 'http://twitter.com', '2018-09-25 04:58:50', '2018-09-25 06:48:17');

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
(10, 2, 'Dean', 'dean@gmail.com', '', NULL, 2, '$2y$10$gynyOPhCX9z42FSfb2Xeb..jfrSioLQJIik3cFZtGIR99krX9a4aO', 'Eiuf1wzU2Fax06MIeE4tA8eyMcrYy7dg6YdEBc04J0HfecDW19wWWGy48iWk', '2018-09-10 23:40:14', '2018-09-10 23:43:26'),
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
(31, 22, 5832962384001, 3, 0, 'asdf asdfasdfasdfasdfasdfvvvvv', '2018-10-04 03:13:43', '2018-10-04 03:13:43');

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
(117, 22, 'designation', 'rest', '2018-10-27 15:46:12', NULL),
(118, 40, 'login_id', '110656224111757229753', NULL, NULL),
(119, 40, 'login_with', 'Google', NULL, NULL),
(120, 40, 'flag_redirect', '1', NULL, NULL);

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
(22, 10, 5832976243001, '2018-11-13 12:53:12', '2018-11-13 12:53:12');

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
(5832962384001, 'Digital Payments Are Becoming The Norm | Pay With Peace', 'digital-payments-are-becoming-the-norm-pay-with-peace', '2018-10-05 01:08:41', '2018-10-05 01:08:41'),
(5832970611001, 'Episode 5 of #TransparentULIPs – Convenience and Ease of Buying a ULIP Policy Online', 'episode-5-of-transparentulips-convenience-and-ease-of-buying-a-ulip-policy-online', '2018-10-05 01:08:43', '2018-10-05 01:08:43'),
(5832974497001, 'The Government Is Committed To Digital Payments - Pay With Peace', 'the-government-is-committed-to-digital-payments-pay-with-peace', '2018-10-05 01:08:45', '2018-10-05 01:08:45'),
(5832976243001, 'Buy Right, Sit Tight- Part 2 - Equity Sahi Hai', 'buy-right-sit-tight-part-2-equity-sahi-hai', '2018-10-05 01:08:53', '2018-10-05 01:08:53'),
(5832976578001, 'Three Way Push To Decline Card Frauds in India | Pay With Peace', 'three-way-push-to-decline-card-frauds-in-india-pay-with-peace', '2018-10-05 01:08:47', '2018-10-05 01:08:47'),
(5843727979001, 'Growth and Dividend Plans - Equity Sahi Hai', 'growth-and-dividend-plans-equity-sahi-hai', '2018-10-04 02:19:03', '2018-10-04 02:19:03'),
(5843741501001, 'Equity Sahi Hai - An Investor Education Initiative', 'equity-sahi-hai-an-investor-education-initiative', '2018-10-05 01:08:50', '2018-10-05 01:08:50'),
(5846306450001, 'Different Allocation Strategies - Nivesh Kar Befikar', 'different-allocation-strategies-nivesh-kar-befikar', '2018-10-09 04:38:07', '2018-10-09 04:38:07');

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
(511, 5843727979001, 'id', '5843727979001', '2018-10-04 02:19:03', '2018-10-04 02:19:03'),
(512, 5843727979001, 'account_id', '5814665417001', '2018-10-04 02:19:03', '2018-10-04 02:19:03'),
(513, 5843727979001, 'ad_keys', NULL, '2018-10-04 02:19:03', '2018-10-04 02:19:03'),
(514, 5843727979001, 'clip_source_video_id', NULL, '2018-10-04 02:19:03', '2018-10-04 02:19:03'),
(515, 5843727979001, 'complete', '1', '2018-10-04 02:19:03', '2018-10-04 02:19:03'),
(516, 5843727979001, 'created_at', '2018-10-03T10:47:11.320Z', '2018-10-04 02:19:03', '2018-10-04 02:19:03'),
(517, 5843727979001, 'cue_points', 'a:0:{}', '2018-10-04 02:19:03', '2018-10-04 02:19:03'),
(518, 5843727979001, 'custom_fields', 'a:2:{s:9:\"speaker_2\";s:12:\"01-vivek-law\";s:8:\"speaker1\";s:19:\"03-mitali-mukherjee\";}', '2018-10-04 02:19:03', '2018-10-04 02:19:03'),
(519, 5843727979001, 'delivery_type', 'dynamic_origin', '2018-10-04 02:19:03', '2018-10-04 02:19:03'),
(520, 5843727979001, 'description', '#EquitySahiHai is your destination for learning all about investing in equity. Educate and empower yourself by watching the videos that bring you the biggest experts in the stock market and the world of mutual funds.', '2018-10-04 02:19:03', '2018-10-04 02:19:03'),
(521, 5843727979001, 'digital_master_id', NULL, '2018-10-04 02:19:04', '2018-10-04 02:19:04'),
(522, 5843727979001, 'duration', '133074', '2018-10-04 02:19:04', '2018-10-04 02:19:04'),
(523, 5843727979001, 'economics', 'AD_SUPPORTED', '2018-10-04 02:19:04', '2018-10-04 02:19:04'),
(524, 5843727979001, 'folder_id', '5b6159a00332280e6bd6f6be', '2018-10-04 02:19:04', '2018-10-04 02:19:04'),
(525, 5843727979001, 'geo', NULL, '2018-10-04 02:19:04', '2018-10-04 02:19:04'),
(526, 5843727979001, 'has_digital_master', '1', '2018-10-04 02:19:04', '2018-10-04 02:19:04'),
(527, 5843727979001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/3b71a7b0-6984-4baf-b0ef-e6040327ae74/main/1160x653/1m6s537ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/3b71a7b0-6984-4baf-b0ef-e6040327ae74/main/1160x653/1m6s537ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/3b71a7b0-6984-4baf-b0ef-e6040327ae74/main/248x140/1m6s537ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/3b71a7b0-6984-4baf-b0ef-e6040327ae74/main/248x140/1m6s537ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-10-04 02:19:04', '2018-10-04 02:19:04'),
(528, 5843727979001, 'link', NULL, '2018-10-04 02:19:04', '2018-10-04 02:19:04'),
(529, 5843727979001, 'long_description', NULL, '2018-10-04 02:19:04', '2018-10-04 02:19:04'),
(530, 5843727979001, 'name', 'Growth and Dividend Plans - Equity Sahi Hai', '2018-10-04 02:19:04', '2018-10-04 02:19:04'),
(531, 5843727979001, 'original_filename', 'main-mezz-en-main.mp4', '2018-10-04 02:19:04', '2018-10-04 02:19:04'),
(532, 5843727979001, 'projection', NULL, '2018-10-04 02:19:04', '2018-10-04 02:19:04'),
(533, 5843727979001, 'published_at', '2018-10-03T11:04:38.112Z', '2018-10-04 02:19:04', '2018-10-04 02:19:04'),
(534, 5843727979001, 'reference_id', NULL, '2018-10-04 02:19:04', '2018-10-04 02:19:04'),
(535, 5843727979001, 'schedule', NULL, '2018-10-04 02:19:05', '2018-10-04 02:19:05'),
(536, 5843727979001, 'sharing', NULL, '2018-10-04 02:19:05', '2018-10-04 02:19:05'),
(537, 5843727979001, 'state', 'ACTIVE', '2018-10-04 02:19:05', '2018-10-04 02:19:05'),
(538, 5843727979001, 'tags', 'a:1:{i:0;s:13:\"equitysahihai\";}', '2018-10-04 02:19:05', '2018-10-04 02:19:05'),
(539, 5843727979001, 'text_tracks', 'a:0:{}', '2018-10-04 02:19:05', '2018-10-04 02:19:05'),
(540, 5843727979001, 'updated_at', '2018-10-03T11:51:35.306Z', '2018-10-04 02:19:05', '2018-10-04 02:19:05'),
(661, 5832962384001, 'id', '5832962384001', '2018-10-05 01:08:41', '2018-10-05 01:08:41'),
(662, 5832962384001, 'account_id', '5814665417001', '2018-10-05 01:08:41', '2018-10-05 01:08:41'),
(663, 5832962384001, 'ad_keys', NULL, '2018-10-05 01:08:41', '2018-10-05 01:08:41'),
(664, 5832962384001, 'clip_source_video_id', NULL, '2018-10-05 01:08:41', '2018-10-05 01:08:41'),
(665, 5832962384001, 'complete', '1', '2018-10-05 01:08:41', '2018-10-05 01:08:41'),
(666, 5832962384001, 'created_at', '2018-09-10T12:01:46.715Z', '2018-10-05 01:08:41', '2018-10-05 01:08:41'),
(667, 5832962384001, 'cue_points', 'a:0:{}', '2018-10-05 01:08:41', '2018-10-05 01:08:41'),
(668, 5832962384001, 'custom_fields', 'a:2:{s:8:\"speaker1\";s:15:\"02-surya-bhatia\";s:9:\"speaker_2\";s:12:\"01-vivek-law\";}', '2018-10-05 01:08:41', '2018-10-05 01:08:41'),
(669, 5832962384001, 'delivery_type', 'dynamic_origin', '2018-10-05 01:08:41', '2018-10-05 01:08:41'),
(670, 5832962384001, 'description', 'There\'s a lot that is happening in the evolution from a cash to a cashless economy, here in India.', '2018-10-05 01:08:41', '2018-10-05 01:08:41'),
(671, 5832962384001, 'digital_master_id', NULL, '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(672, 5832962384001, 'duration', '1910236', '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(673, 5832962384001, 'economics', 'AD_SUPPORTED', '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(674, 5832962384001, 'folder_id', '5b6159a00332280e6bd6f6be', '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(675, 5832962384001, 'geo', NULL, '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(676, 5832962384001, 'has_digital_master', '1', '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(677, 5832962384001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:149:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/79fd292a-8e61-4118-90ec-82a324a4d63e/main/1160x653/15m55s118ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:149:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/79fd292a-8e61-4118-90ec-82a324a4d63e/main/1160x653/15m55s118ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:148:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/79fd292a-8e61-4118-90ec-82a324a4d63e/main/248x140/15m55s118ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:148:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/79fd292a-8e61-4118-90ec-82a324a4d63e/main/248x140/15m55s118ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(678, 5832962384001, 'link', NULL, '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(679, 5832962384001, 'long_description', NULL, '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(680, 5832962384001, 'name', 'Digital Payments Are Becoming The Norm | Pay With Peace', '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(681, 5832962384001, 'original_filename', 'main-mezz-en-main.mp4', '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(682, 5832962384001, 'projection', NULL, '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(683, 5832962384001, 'published_at', '2018-09-10T12:04:13.607Z', '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(684, 5832962384001, 'reference_id', NULL, '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(685, 5832962384001, 'schedule', NULL, '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(686, 5832962384001, 'sharing', NULL, '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(687, 5832962384001, 'state', 'ACTIVE', '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(688, 5832962384001, 'tags', 'a:2:{i:0;s:15:\"digitalpayments\";i:1;s:12:\"paywithpeace\";}', '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(689, 5832962384001, 'text_tracks', 'a:0:{}', '2018-10-05 01:08:42', '2018-10-05 01:08:42'),
(690, 5832962384001, 'updated_at', '2018-10-04T08:23:06.836Z', '2018-10-05 01:08:43', '2018-10-05 01:08:43'),
(691, 5832970611001, 'id', '5832970611001', '2018-10-05 01:08:43', '2018-10-05 01:08:43'),
(692, 5832970611001, 'account_id', '5814665417001', '2018-10-05 01:08:43', '2018-10-05 01:08:43'),
(693, 5832970611001, 'ad_keys', NULL, '2018-10-05 01:08:43', '2018-10-05 01:08:43'),
(694, 5832970611001, 'clip_source_video_id', NULL, '2018-10-05 01:08:43', '2018-10-05 01:08:43'),
(695, 5832970611001, 'complete', '1', '2018-10-05 01:08:43', '2018-10-05 01:08:43'),
(696, 5832970611001, 'created_at', '2018-09-10T11:48:32.850Z', '2018-10-05 01:08:43', '2018-10-05 01:08:43'),
(697, 5832970611001, 'cue_points', 'a:0:{}', '2018-10-05 01:08:43', '2018-10-05 01:08:43'),
(698, 5832970611001, 'custom_fields', 'a:2:{s:8:\"speaker1\";s:19:\"03-mitali-mukherjee\";s:9:\"speaker_2\";s:12:\"01-vivek-law\";}', '2018-10-05 01:08:43', '2018-10-05 01:08:43'),
(699, 5832970611001, 'delivery_type', 'dynamic_origin', '2018-10-05 01:08:43', '2018-10-05 01:08:43'),
(700, 5832970611001, 'description', 'The MoneyMile’s Founder and CEO Vivek Law and the CEO of PolicyBazaar.com Mr. Yashish Dahiya discuss how easy and faster it is for someone to purchase a ulip plan online through e-KYC. ', '2018-10-05 01:08:43', '2018-10-05 01:08:43'),
(701, 5832970611001, 'digital_master_id', NULL, '2018-10-05 01:08:43', '2018-10-05 01:08:43'),
(702, 5832970611001, 'duration', '490452', '2018-10-05 01:08:43', '2018-10-05 01:08:43'),
(703, 5832970611001, 'economics', 'AD_SUPPORTED', '2018-10-05 01:08:43', '2018-10-05 01:08:43'),
(704, 5832970611001, 'folder_id', '5b6159a00332280e6bd6f6be', '2018-10-05 01:08:44', '2018-10-05 01:08:44'),
(705, 5832970611001, 'geo', NULL, '2018-10-05 01:08:44', '2018-10-05 01:08:44'),
(706, 5832970611001, 'has_digital_master', '1', '2018-10-05 01:08:44', '2018-10-05 01:08:44'),
(707, 5832970611001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/69290f92-4409-4507-9f69-8388c5b51be3/main/1160x653/4m5s226ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/69290f92-4409-4507-9f69-8388c5b51be3/main/1160x653/4m5s226ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/69290f92-4409-4507-9f69-8388c5b51be3/main/248x140/4m5s226ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/69290f92-4409-4507-9f69-8388c5b51be3/main/248x140/4m5s226ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-10-05 01:08:44', '2018-10-05 01:08:44'),
(708, 5832970611001, 'link', NULL, '2018-10-05 01:08:44', '2018-10-05 01:08:44'),
(709, 5832970611001, 'long_description', NULL, '2018-10-05 01:08:44', '2018-10-05 01:08:44'),
(710, 5832970611001, 'name', 'Episode 5 of #TransparentULIPs – Convenience and Ease of Buying a ULIP Policy Online', '2018-10-05 01:08:44', '2018-10-05 01:08:44'),
(711, 5832970611001, 'original_filename', 'main-mezz-en-main.mp4', '2018-10-05 01:08:44', '2018-10-05 01:08:44'),
(712, 5832970611001, 'projection', NULL, '2018-10-05 01:08:44', '2018-10-05 01:08:44'),
(713, 5832970611001, 'published_at', '2018-09-10T11:52:37.958Z', '2018-10-05 01:08:44', '2018-10-05 01:08:44'),
(714, 5832970611001, 'reference_id', NULL, '2018-10-05 01:08:44', '2018-10-05 01:08:44'),
(715, 5832970611001, 'schedule', NULL, '2018-10-05 01:08:44', '2018-10-05 01:08:44'),
(716, 5832970611001, 'sharing', NULL, '2018-10-05 01:08:44', '2018-10-05 01:08:44'),
(717, 5832970611001, 'state', 'ACTIVE', '2018-10-05 01:08:44', '2018-10-05 01:08:44'),
(718, 5832970611001, 'tags', 'a:1:{i:0;s:16:\"transparentulips\";}', '2018-10-05 01:08:44', '2018-10-05 01:08:44'),
(719, 5832970611001, 'text_tracks', 'a:0:{}', '2018-10-05 01:08:45', '2018-10-05 01:08:45'),
(720, 5832970611001, 'updated_at', '2018-10-04T08:16:43.930Z', '2018-10-05 01:08:45', '2018-10-05 01:08:45'),
(721, 5832974497001, 'id', '5832974497001', '2018-10-05 01:08:45', '2018-10-05 01:08:45'),
(722, 5832974497001, 'account_id', '5814665417001', '2018-10-05 01:08:45', '2018-10-05 01:08:45'),
(723, 5832974497001, 'ad_keys', NULL, '2018-10-05 01:08:45', '2018-10-05 01:08:45'),
(724, 5832974497001, 'clip_source_video_id', NULL, '2018-10-05 01:08:45', '2018-10-05 01:08:45'),
(725, 5832974497001, 'complete', '1', '2018-10-05 01:08:45', '2018-10-05 01:08:45'),
(726, 5832974497001, 'created_at', '2018-09-10T12:06:45.420Z', '2018-10-05 01:08:45', '2018-10-05 01:08:45'),
(727, 5832974497001, 'cue_points', 'a:0:{}', '2018-10-05 01:08:46', '2018-10-05 01:08:46'),
(728, 5832974497001, 'custom_fields', 'a:2:{s:8:\"speaker1\";s:19:\"03-mitali-mukherjee\";s:9:\"speaker_2\";s:12:\"01-vivek-law\";}', '2018-10-05 01:08:46', '2018-10-05 01:08:46'),
(729, 5832974497001, 'delivery_type', 'dynamic_origin', '2018-10-05 01:08:46', '2018-10-05 01:08:46'),
(730, 5832974497001, 'description', 'From the role of the government in pushing digital payments, to life after demonetization, Sudipta Roy of ICICI Bank & Bob Reany of Mastercard chat with Vivek Law on #PaywithPeace.', '2018-10-05 01:08:46', '2018-10-05 01:08:46'),
(731, 5832974497001, 'digital_master_id', NULL, '2018-10-05 01:08:46', '2018-10-05 01:08:46'),
(732, 5832974497001, 'duration', '350807', '2018-10-05 01:08:46', '2018-10-05 01:08:46'),
(733, 5832974497001, 'economics', 'AD_SUPPORTED', '2018-10-05 01:08:46', '2018-10-05 01:08:46'),
(734, 5832974497001, 'folder_id', '5b6159a00332280e6bd6f6be', '2018-10-05 01:08:46', '2018-10-05 01:08:46'),
(735, 5832974497001, 'geo', NULL, '2018-10-05 01:08:46', '2018-10-05 01:08:46'),
(736, 5832974497001, 'has_digital_master', '1', '2018-10-05 01:08:46', '2018-10-05 01:08:46'),
(737, 5832974497001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:148:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/d40225cb-2464-4767-baf9-1ac19db2092d/main/1160x653/2m55s403ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:148:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/d40225cb-2464-4767-baf9-1ac19db2092d/main/1160x653/2m55s403ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/d40225cb-2464-4767-baf9-1ac19db2092d/main/248x140/2m55s403ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/d40225cb-2464-4767-baf9-1ac19db2092d/main/248x140/2m55s403ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-10-05 01:08:46', '2018-10-05 01:08:46'),
(738, 5832974497001, 'link', NULL, '2018-10-05 01:08:46', '2018-10-05 01:08:46'),
(739, 5832974497001, 'long_description', NULL, '2018-10-05 01:08:46', '2018-10-05 01:08:46'),
(740, 5832974497001, 'name', 'The Government Is Committed To Digital Payments - Pay With Peace', '2018-10-05 01:08:47', '2018-10-05 01:08:47'),
(741, 5832974497001, 'original_filename', 'main-mezz-en-main.mp4', '2018-10-05 01:08:47', '2018-10-05 01:08:47'),
(742, 5832974497001, 'projection', NULL, '2018-10-05 01:08:47', '2018-10-05 01:08:47'),
(743, 5832974497001, 'published_at', '2018-09-10T12:08:05.753Z', '2018-10-05 01:08:47', '2018-10-05 01:08:47'),
(744, 5832974497001, 'reference_id', NULL, '2018-10-05 01:08:47', '2018-10-05 01:08:47'),
(745, 5832974497001, 'schedule', NULL, '2018-10-05 01:08:47', '2018-10-05 01:08:47'),
(746, 5832974497001, 'sharing', NULL, '2018-10-05 01:08:47', '2018-10-05 01:08:47'),
(747, 5832974497001, 'state', 'ACTIVE', '2018-10-05 01:08:47', '2018-10-05 01:08:47'),
(748, 5832974497001, 'tags', 'a:3:{i:0;s:14:\"demonetization\";i:1;s:12:\"paywithpeace\";i:2;s:22:\"pushingdigitalpayments\";}', '2018-10-05 01:08:47', '2018-10-05 01:08:47'),
(749, 5832974497001, 'text_tracks', 'a:0:{}', '2018-10-05 01:08:47', '2018-10-05 01:08:47'),
(750, 5832974497001, 'updated_at', '2018-10-04T08:15:20.450Z', '2018-10-05 01:08:47', '2018-10-05 01:08:47'),
(751, 5832976578001, 'id', '5832976578001', '2018-10-05 01:08:47', '2018-10-05 01:08:47'),
(752, 5832976578001, 'account_id', '5814665417001', '2018-10-05 01:08:47', '2018-10-05 01:08:47'),
(753, 5832976578001, 'ad_keys', NULL, '2018-10-05 01:08:47', '2018-10-05 01:08:47'),
(754, 5832976578001, 'clip_source_video_id', NULL, '2018-10-05 01:08:48', '2018-10-05 01:08:48'),
(755, 5832976578001, 'complete', '1', '2018-10-05 01:08:48', '2018-10-05 01:08:48'),
(756, 5832976578001, 'created_at', '2018-09-10T12:05:13.386Z', '2018-10-05 01:08:48', '2018-10-05 01:08:48'),
(757, 5832976578001, 'cue_points', 'a:0:{}', '2018-10-05 01:08:48', '2018-10-05 01:08:48'),
(758, 5832976578001, 'custom_fields', 'a:2:{s:9:\"speaker_2\";s:12:\"01-vivek-law\";s:8:\"speaker1\";s:19:\"03-mitali-mukherjee\";}', '2018-10-05 01:08:48', '2018-10-05 01:08:48'),
(759, 5832976578001, 'delivery_type', 'dynamic_origin', '2018-10-05 01:08:48', '2018-10-05 01:08:48'),
(760, 5832976578001, 'description', NULL, '2018-10-05 01:08:48', '2018-10-05 01:08:48'),
(761, 5832976578001, 'digital_master_id', NULL, '2018-10-05 01:08:48', '2018-10-05 01:08:48'),
(762, 5832976578001, 'duration', '426156', '2018-10-05 01:08:48', '2018-10-05 01:08:48'),
(763, 5832976578001, 'economics', 'AD_SUPPORTED', '2018-10-05 01:08:48', '2018-10-05 01:08:48'),
(764, 5832976578001, 'folder_id', '5b6159a00332280e6bd6f6be', '2018-10-05 01:08:49', '2018-10-05 01:08:49'),
(765, 5832976578001, 'geo', NULL, '2018-10-05 01:08:49', '2018-10-05 01:08:49'),
(766, 5832976578001, 'has_digital_master', '1', '2018-10-05 01:08:49', '2018-10-05 01:08:49'),
(767, 5832976578001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/192ed76e-2c34-4878-98e5-5375faa2638b/main/1160x653/3m33s78ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/192ed76e-2c34-4878-98e5-5375faa2638b/main/1160x653/3m33s78ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/192ed76e-2c34-4878-98e5-5375faa2638b/main/248x140/3m33s78ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:146:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/192ed76e-2c34-4878-98e5-5375faa2638b/main/248x140/3m33s78ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-10-05 01:08:49', '2018-10-05 01:08:49'),
(768, 5832976578001, 'link', NULL, '2018-10-05 01:08:49', '2018-10-05 01:08:49'),
(769, 5832976578001, 'long_description', NULL, '2018-10-05 01:08:49', '2018-10-05 01:08:49'),
(770, 5832976578001, 'name', 'Three Way Push To Decline Card Frauds in India | Pay With Peace', '2018-10-05 01:08:49', '2018-10-05 01:08:49'),
(771, 5832976578001, 'original_filename', 'main-mezz-en-main.mp4', '2018-10-05 01:08:49', '2018-10-05 01:08:49'),
(772, 5832976578001, 'projection', NULL, '2018-10-05 01:08:49', '2018-10-05 01:08:49'),
(773, 5832976578001, 'published_at', '2018-09-10T12:06:25.675Z', '2018-10-05 01:08:49', '2018-10-05 01:08:49'),
(774, 5832976578001, 'reference_id', NULL, '2018-10-05 01:08:49', '2018-10-05 01:08:49'),
(775, 5832976578001, 'schedule', NULL, '2018-10-05 01:08:49', '2018-10-05 01:08:49'),
(776, 5832976578001, 'sharing', NULL, '2018-10-05 01:08:50', '2018-10-05 01:08:50'),
(777, 5832976578001, 'state', 'ACTIVE', '2018-10-05 01:08:50', '2018-10-05 01:08:50'),
(778, 5832976578001, 'tags', 'a:2:{i:0;s:17:\"declinecardfrauds\";i:1;s:12:\"paywithpeace\";}', '2018-10-05 01:08:50', '2018-10-05 01:08:50'),
(779, 5832976578001, 'text_tracks', 'a:0:{}', '2018-10-05 01:08:50', '2018-10-05 01:08:50'),
(780, 5832976578001, 'updated_at', '2018-10-04T08:13:56.805Z', '2018-10-05 01:08:50', '2018-10-05 01:08:50'),
(781, 5843741501001, 'id', '5843741501001', '2018-10-05 01:08:50', '2018-10-05 01:08:50'),
(782, 5843741501001, 'account_id', '5814665417001', '2018-10-05 01:08:50', '2018-10-05 01:08:50'),
(783, 5843741501001, 'ad_keys', NULL, '2018-10-05 01:08:50', '2018-10-05 01:08:50'),
(784, 5843741501001, 'clip_source_video_id', NULL, '2018-10-05 01:08:50', '2018-10-05 01:08:50'),
(785, 5843741501001, 'complete', '1', '2018-10-05 01:08:51', '2018-10-05 01:08:51'),
(786, 5843741501001, 'created_at', '2018-10-03T11:19:53.842Z', '2018-10-05 01:08:51', '2018-10-05 01:08:51'),
(787, 5843741501001, 'cue_points', 'a:0:{}', '2018-10-05 01:08:51', '2018-10-05 01:08:51'),
(788, 5843741501001, 'custom_fields', 'a:2:{s:9:\"speaker_2\";s:12:\"01-vivek-law\";s:8:\"speaker1\";s:15:\"02-surya-bhatia\";}', '2018-10-05 01:08:51', '2018-10-05 01:08:51'),
(789, 5843741501001, 'delivery_type', 'dynamic_origin', '2018-10-05 01:08:51', '2018-10-05 01:08:51'),
(790, 5843741501001, 'description', '#EquitySahiHai is your destination for learning all about investing in equity. Educate and empower yourself by watching the videos that bring you the biggest experts in the stock market and the world of mutual funds.', '2018-10-05 01:08:51', '2018-10-05 01:08:51'),
(791, 5843741501001, 'digital_master_id', NULL, '2018-10-05 01:08:51', '2018-10-05 01:08:51'),
(792, 5843741501001, 'duration', '68034', '2018-10-05 01:08:51', '2018-10-05 01:08:51'),
(793, 5843741501001, 'economics', 'AD_SUPPORTED', '2018-10-05 01:08:51', '2018-10-05 01:08:51'),
(794, 5843741501001, 'folder_id', '5b6159a00332280e6bd6f6be', '2018-10-05 01:08:51', '2018-10-05 01:08:51'),
(795, 5843741501001, 'geo', NULL, '2018-10-05 01:08:52', '2018-10-05 01:08:52'),
(796, 5843741501001, 'has_digital_master', '1', '2018-10-05 01:08:52', '2018-10-05 01:08:52'),
(797, 5843741501001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/a82328c3-0cd3-4847-8ee0-5b0f9522cc05/main/1160x653/34s17ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/a82328c3-0cd3-4847-8ee0-5b0f9522cc05/main/1160x653/34s17ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:144:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/a82328c3-0cd3-4847-8ee0-5b0f9522cc05/main/248x140/34s17ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:144:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/a82328c3-0cd3-4847-8ee0-5b0f9522cc05/main/248x140/34s17ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-10-05 01:08:52', '2018-10-05 01:08:52'),
(798, 5843741501001, 'link', NULL, '2018-10-05 01:08:52', '2018-10-05 01:08:52'),
(799, 5843741501001, 'long_description', NULL, '2018-10-05 01:08:52', '2018-10-05 01:08:52'),
(800, 5843741501001, 'name', 'Equity Sahi Hai - An Investor Education Initiative', '2018-10-05 01:08:52', '2018-10-05 01:08:52'),
(801, 5843741501001, 'original_filename', 'main-mezz-en-main.mp4', '2018-10-05 01:08:52', '2018-10-05 01:08:52'),
(802, 5843741501001, 'projection', NULL, '2018-10-05 01:08:52', '2018-10-05 01:08:52'),
(803, 5843741501001, 'published_at', '2018-10-03T11:21:10.462Z', '2018-10-05 01:08:52', '2018-10-05 01:08:52'),
(804, 5843741501001, 'reference_id', NULL, '2018-10-05 01:08:53', '2018-10-05 01:08:53'),
(805, 5843741501001, 'schedule', NULL, '2018-10-05 01:08:53', '2018-10-05 01:08:53'),
(806, 5843741501001, 'sharing', NULL, '2018-10-05 01:08:53', '2018-10-05 01:08:53'),
(807, 5843741501001, 'state', 'ACTIVE', '2018-10-05 01:08:53', '2018-10-05 01:08:53'),
(808, 5843741501001, 'tags', 'a:1:{i:0;s:13:\"equitysahihai\";}', '2018-10-05 01:08:53', '2018-10-05 01:08:53'),
(809, 5843741501001, 'text_tracks', 'a:0:{}', '2018-10-05 01:08:53', '2018-10-05 01:08:53'),
(810, 5843741501001, 'updated_at', '2018-10-04T08:13:50.901Z', '2018-10-05 01:08:53', '2018-10-05 01:08:53'),
(811, 5832976243001, 'id', '5832976243001', '2018-10-05 01:08:53', '2018-10-05 01:08:53'),
(812, 5832976243001, 'account_id', '5814665417001', '2018-10-05 01:08:54', '2018-10-05 01:08:54'),
(813, 5832976243001, 'ad_keys', NULL, '2018-10-05 01:08:54', '2018-10-05 01:08:54'),
(814, 5832976243001, 'clip_source_video_id', NULL, '2018-10-05 01:08:54', '2018-10-05 01:08:54'),
(815, 5832976243001, 'complete', '1', '2018-10-05 01:08:54', '2018-10-05 01:08:54'),
(816, 5832976243001, 'created_at', '2018-09-10T12:08:41.959Z', '2018-10-05 01:08:54', '2018-10-05 01:08:54'),
(817, 5832976243001, 'cue_points', 'a:0:{}', '2018-10-05 01:08:54', '2018-10-05 01:08:54'),
(818, 5832976243001, 'custom_fields', 'a:2:{s:8:\"speaker1\";s:15:\"02-surya-bhatia\";s:9:\"speaker_2\";s:12:\"01-vivek-law\";}', '2018-10-05 01:08:54', '2018-10-05 01:08:54'),
(819, 5832976243001, 'delivery_type', 'dynamic_origin', '2018-10-05 01:08:54', '2018-10-05 01:08:54'),
(820, 5832976243001, 'description', 'Do investors make hasty decisions when markets are volatile? Aashish Somaiyaa, CEO, Motilal Oswal Asset Management, recommends holding on. Only on #EquitySahiHai.', '2018-10-05 01:08:54', '2018-10-05 01:08:54'),
(821, 5832976243001, 'digital_master_id', NULL, '2018-10-05 01:08:54', '2018-10-05 01:08:54'),
(822, 5832976243001, 'duration', '241604', '2018-10-05 01:08:55', '2018-10-05 01:08:55'),
(823, 5832976243001, 'economics', 'AD_SUPPORTED', '2018-10-05 01:08:55', '2018-10-05 01:08:55'),
(824, 5832976243001, 'folder_id', '5b6159a00332280e6bd6f6be', '2018-10-05 01:08:55', '2018-10-05 01:08:55'),
(825, 5832976243001, 'geo', NULL, '2018-10-05 01:08:55', '2018-10-05 01:08:55'),
(826, 5832976243001, 'has_digital_master', '1', '2018-10-05 01:08:55', '2018-10-05 01:08:55'),
(827, 5832976243001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/73f7cd51-30c2-4af3-8562-50284d9fdde1/main/1160x653/2m802ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:145:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/73f7cd51-30c2-4af3-8562-50284d9fdde1/main/1160x653/2m802ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:144:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/73f7cd51-30c2-4af3-8562-50284d9fdde1/main/248x140/2m802ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:144:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/73f7cd51-30c2-4af3-8562-50284d9fdde1/main/248x140/2m802ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-10-05 01:08:55', '2018-10-05 01:08:55'),
(828, 5832976243001, 'link', NULL, '2018-10-05 01:08:55', '2018-10-05 01:08:55'),
(829, 5832976243001, 'long_description', NULL, '2018-10-05 01:08:55', '2018-10-05 01:08:55'),
(830, 5832976243001, 'name', 'Buy Right, Sit Tight- Part 2 - Equity Sahi Hai', '2018-10-05 01:08:56', '2018-10-05 01:08:56'),
(831, 5832976243001, 'original_filename', 'main-mezz-en-main.mp4', '2018-10-05 01:08:56', '2018-10-05 01:08:56'),
(832, 5832976243001, 'projection', NULL, '2018-10-05 01:08:56', '2018-10-05 01:08:56'),
(833, 5832976243001, 'published_at', '2018-09-10T12:09:24.502Z', '2018-10-05 01:08:56', '2018-10-05 01:08:56'),
(834, 5832976243001, 'reference_id', NULL, '2018-10-05 01:08:56', '2018-10-05 01:08:56'),
(835, 5832976243001, 'schedule', NULL, '2018-10-05 01:08:56', '2018-10-05 01:08:56'),
(836, 5832976243001, 'sharing', NULL, '2018-10-05 01:08:56', '2018-10-05 01:08:56'),
(837, 5832976243001, 'state', 'ACTIVE', '2018-10-05 01:08:56', '2018-10-05 01:08:56'),
(838, 5832976243001, 'tags', 'a:1:{i:0;s:13:\"equitysahihai\";}', '2018-10-05 01:08:56', '2018-10-05 01:08:56'),
(839, 5832976243001, 'text_tracks', 'a:0:{}', '2018-10-05 01:08:56', '2018-10-05 01:08:56'),
(840, 5832976243001, 'updated_at', '2018-10-04T08:13:23.726Z', '2018-10-05 01:08:56', '2018-10-05 01:08:56'),
(841, 5846306450001, 'id', '5846306450001', '2018-10-09 04:38:07', '2018-10-09 04:38:07'),
(842, 5846306450001, 'account_id', '5814665417001', '2018-10-09 04:38:07', '2018-10-09 04:38:07'),
(843, 5846306450001, 'ad_keys', NULL, '2018-10-09 04:38:07', '2018-10-09 04:38:07'),
(844, 5846306450001, 'clip_source_video_id', NULL, '2018-10-09 04:38:07', '2018-10-09 04:38:07'),
(845, 5846306450001, 'complete', '1', '2018-10-09 04:38:07', '2018-10-09 04:38:07'),
(846, 5846306450001, 'created_at', '2018-10-09T10:06:01.534Z', '2018-10-09 04:38:08', '2018-10-09 04:38:08'),
(847, 5846306450001, 'cue_points', 'a:0:{}', '2018-10-09 04:38:08', '2018-10-09 04:38:08'),
(848, 5846306450001, 'custom_fields', 'a:2:{s:8:\"speaker1\";s:12:\"01-vivek-law\";s:9:\"speaker_2\";s:12:\"01-vivek-law\";}', '2018-10-09 04:38:08', '2018-10-09 04:38:08'),
(849, 5846306450001, 'delivery_type', 'dynamic_origin', '2018-10-09 04:38:08', '2018-10-09 04:38:08'),
(850, 5846306450001, 'description', 'Manik Nangia, Marketing Director and Chief Digital Officer, Max Life Insurance, recommends investment strategies for different types of investors only on #NiveshKarBefikar', '2018-10-09 04:38:08', '2018-10-09 04:38:08'),
(851, 5846306450001, 'digital_master_id', NULL, '2018-10-09 04:38:08', '2018-10-09 04:38:08'),
(852, 5846306450001, 'duration', '157292', '2018-10-09 04:38:08', '2018-10-09 04:38:08'),
(853, 5846306450001, 'economics', 'AD_SUPPORTED', '2018-10-09 04:38:08', '2018-10-09 04:38:08'),
(854, 5846306450001, 'folder_id', '5b6159a00332280e6bd6f6be', '2018-10-09 04:38:08', '2018-10-09 04:38:08'),
(855, 5846306450001, 'geo', NULL, '2018-10-09 04:38:08', '2018-10-09 04:38:08'),
(856, 5846306450001, 'has_digital_master', '1', '2018-10-09 04:38:08', '2018-10-09 04:38:08'),
(857, 5846306450001, 'images', 'a:2:{s:6:\"poster\";a:2:{s:3:\"src\";s:148:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/2d52ac63-035d-49c3-ac36-7886e18ecd55/main/1160x653/1m18s646ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:148:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/2d52ac63-035d-49c3-ac36-7886e18ecd55/main/1160x653/1m18s646ms/match/image.jpg\";s:6:\"height\";i:653;s:5:\"width\";i:1160;}}}s:9:\"thumbnail\";a:2:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/2d52ac63-035d-49c3-ac36-7886e18ecd55/main/248x140/1m18s646ms/match/image.jpg\";s:7:\"sources\";a:1:{i:0;a:3:{s:3:\"src\";s:147:\"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/2d52ac63-035d-49c3-ac36-7886e18ecd55/main/248x140/1m18s646ms/match/image.jpg\";s:6:\"height\";i:140;s:5:\"width\";i:248;}}}}', '2018-10-09 04:38:08', '2018-10-09 04:38:08'),
(858, 5846306450001, 'link', NULL, '2018-10-09 04:38:08', '2018-10-09 04:38:08'),
(859, 5846306450001, 'long_description', NULL, '2018-10-09 04:38:08', '2018-10-09 04:38:08'),
(860, 5846306450001, 'name', 'Different Allocation Strategies - Nivesh Kar Befikar', '2018-10-09 04:38:09', '2018-10-09 04:38:09'),
(861, 5846306450001, 'original_filename', 'Different Allocation Strategies - Nivesh Kar Befikar.mp4', '2018-10-09 04:38:09', '2018-10-09 04:38:09'),
(862, 5846306450001, 'projection', NULL, '2018-10-09 04:38:09', '2018-10-09 04:38:09'),
(863, 5846306450001, 'published_at', '2018-10-09T10:07:08.726Z', '2018-10-09 04:38:09', '2018-10-09 04:38:09'),
(864, 5846306450001, 'reference_id', NULL, '2018-10-09 04:38:09', '2018-10-09 04:38:09'),
(865, 5846306450001, 'schedule', NULL, '2018-10-09 04:38:09', '2018-10-09 04:38:09'),
(866, 5846306450001, 'sharing', NULL, '2018-10-09 04:38:09', '2018-10-09 04:38:09'),
(867, 5846306450001, 'state', 'ACTIVE', '2018-10-09 04:38:09', '2018-10-09 04:38:09'),
(868, 5846306450001, 'tags', 'a:1:{i:0;s:16:\"niveshkarbefikar\";}', '2018-10-09 04:38:10', '2018-10-09 04:38:10'),
(869, 5846306450001, 'text_tracks', 'a:0:{}', '2018-10-09 04:38:10', '2018-10-09 04:38:10'),
(870, 5846306450001, 'updated_at', '2018-10-09T10:07:39.472Z', '2018-10-09 04:38:10', '2018-10-09 04:38:10');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `mm_user_metas`
--
ALTER TABLE `mm_user_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `mm_user_wishlists`
--
ALTER TABLE `mm_user_wishlists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `mm_videos`
--
ALTER TABLE `mm_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5846306450002;

--
-- AUTO_INCREMENT for table `mm_video_metas`
--
ALTER TABLE `mm_video_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=871;

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
