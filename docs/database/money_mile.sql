-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 27, 2018 at 05:14 PM
-- Server version: 5.7.24-0ubuntu0.16.04.1
-- PHP Version: 7.2.12-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `money_mile`
--

-- --------------------------------------------------------

--
-- Table structure for table `mm_age_groups`
--

CREATE TABLE `mm_age_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '0',
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
(15, 15, '/uploads/advertisement/bf50080b68123fbf030492253dc697ec.jpg', '', '', '2018-09-28 08:16:10', '2018-11-12 02:49:12'),
(16, 17, '/uploads/advertisement/8accc9d80468c71cd7ed3e3f0f4509a1.jpg', '', '', '2018-09-29 01:01:46', '2018-11-12 02:49:13'),
(17, 19, '/uploads/advertisement/1aec609c74b66fdbed5f93367ff09d84.jpg', '', '', '2018-09-29 01:01:47', '2018-11-12 02:49:13'),
(19, 21, '/uploads/advertisement/b74e08fe9c1b86d9697175a39134d636.jpg', '', '', '2018-09-29 01:16:50', '2018-11-12 02:49:13');

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
(15, 'ads', 'Advertisement', 1, 'inactive', '2018-09-28 03:29:59', '2018-11-12 02:49:12'),
(16, 'tag', 'RECOMMENDED VIDEOS', 2, 'active', '2018-09-28 03:30:00', '2018-11-12 02:49:13'),
(17, 'ads', 'Advertisement', 3, 'active', '2018-09-28 03:30:00', '2018-11-12 02:49:13'),
(18, 'trending', 'TRENDING VIDEOS', 4, 'active', '2018-09-28 03:30:57', '2018-11-12 02:49:13'),
(19, 'ads', 'Advertisement', 5, 'active', '2018-09-28 03:30:57', '2018-11-12 02:49:13'),
(20, 'popular', 'POPULAR VIDEOS', 6, 'active', '2018-09-28 04:02:39', '2018-11-12 02:49:13'),
(21, 'ads', 'Advertisement', 7, 'active', '2018-09-29 01:15:00', '2018-11-12 02:49:13'),
(22, 'portfolio', 'ABC', 8, 'active', '2018-09-29 09:24:07', '2018-11-12 02:49:13');

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
(8, '2018-09-14 03:50:21', '2018-11-21 03:22:58'),
(9, '2018-11-20 06:21:13', '2018-11-20 06:21:13'),
(10, '2018-11-21 02:43:49', '2018-11-21 02:45:24');

-- --------------------------------------------------------

--
-- Table structure for table `mm_information_descriptions`
--

CREATE TABLE `mm_information_descriptions` (
  `information_id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_information_descriptions`
--

INSERT INTO `mm_information_descriptions` (`information_id`, `language_id`, `title`, `short_description`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(10, 3, 'About Us', 'About Us', '<p>&lt;div class=&quot;col-sm-6&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&lt;iframe width=&quot;100%&quot; height=&quot;100%&quot; src=&quot;https://www.youtube.com/embed/9prd9nCNQXI?rel=0&quot; frameborder=&quot;0&quot; allow=&quot;autoplay; encrypted-media&quot; allowfullscreen&gt;&lt;/iframe&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&lt;div class=&quot;col-sm-1&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;div class=&quot;vl&quot;&gt; &lt;/div&gt;<br />\r\n&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&lt;/div&gt;</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&lt;div class=&quot;col-sm-5 about-right&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&lt;br&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&lt;div class=&quot;row&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&lt;div class=&quot;col-sm-4 text-center p-0&quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;img src=&quot;{{ asset( &#39;frontend/images/tmm-logo2.png&#39; ) }}&quot; class=&quot;tmm-profile-logo &quot;&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;div class=&quot;col-sm-8 text-center&quot;&gt;&lt;br&gt;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&lt;h3&gt;Money Mile&lt;/h3&gt; &nbsp; &nbsp;&nbsp;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;ul class=&quot;user-profile-social-ico&quot;&gt;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;li&gt; &lt;a href=&quot;&quot;&gt; &lt;i class=&quot;fab fa-facebook fa-2x&quot;&gt;&lt;/i&gt; &lt;/a&gt; &lt;/li&gt;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;li&gt; &lt;a href=&quot;&quot;&gt; &lt;i class=&quot;fab fa-linkedin fa-2x&quot;&gt;&lt;/i&gt; &lt;/a&gt; &lt;/li&gt;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;li&gt; &lt;a href=&quot;&quot;&gt; &lt;i class=&quot;fab fa-google fa-2x&quot;&gt;&lt;/i&gt; &lt;/a&gt; &lt;/li&gt;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;li&gt; &lt;a href=&quot;&quot;&gt; &lt;i class=&quot;fab fa-twitter-square fa-2x&quot;&gt;&lt;/i&gt; &lt;/a&gt; &lt;/li&gt;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;/ul&gt;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;/div&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&lt;/div&gt; &nbsp;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&lt;br&gt;&lt;br&gt;&lt;br&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&lt;h1&gt;Your Money&#39;s Best Friend&lt;/h1&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&lt;p&gt;India&rsquo;s premier money, investment and personal finance offering. Founded by veteran business journalists Vivek Law, Mitali Mukherjee, finance guru Surya Bhatia and content creator Sumit Sabharwal that cuts across digital, TV and other mediums.&lt;/p&gt;<br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&lt;/div&gt;</p>', 'About Us', 'About Us', 'About Us'),
(8, 3, 'Privacy Policy', 'Privacy Policy', '<h2><strong>Introduction</strong></h2>\r\n\r\n<p>The MoneyMile (we&rdquo; or &ldquo;us&rdquo;) values its visitors&rsquo; privacy. This privacy policy is effective Nov. 18; it summarizes what information we might collect from a registered user or other visitor (&ldquo;you&rdquo;), and what we will and will not do with it.</p>\r\n\r\n<p>Please note that this privacy policy does not govern the collection and use of information by companies that The MoneyMile does not control, nor by individuals not employed or managed by The MoneyMile. If you visit a Web site that we mention or link to, be sure to review its privacy policy before providing the site with information.</p>\r\n\r\n<h2><strong>What we do with your personally identifiable information </strong></h2>\r\n\r\n<p>It is always up to you whether to disclose personally identifiable information to us, although if you elect not to do so, we reserve the right not to register you as a user or provide you with any products or services. &ldquo;Personally identifiable information&rdquo; means information that can be used to identify you as an individual, such as, <strong>for example: </strong></p>\r\n\r\n<ul>\r\n	<li>your name, company, email address, phone number, billing address</li>\r\n	<li>your Company Name user ID and password credit card information</li>\r\n	<li>any account-preference information you provide us</li>\r\n	<li>your The MoneyMile domain name and IP address, indicating where your computer is located on the Internet</li>\r\n	<li>session data for your login session, so that our computer can &lsquo;talk&rsquo; to yours while you are logged in</li>\r\n</ul>\r\n\r\n<p>If you do provide personally identifiable information to us, either directly or through a reseller or other business partner, we will:</p>\r\n\r\n<ul>\r\n	<li>not sell or rent it to a third party without your permission &mdash; although unless you opt out (see below), we may use your contact information to provide you with information we believe you need to know or may find useful, such as (for example) news about our services and products and modifications to the Terms of Service;</li>\r\n	<li>take commercially reasonable precautions to protect the information from loss, misuse and unauthorized access, disclosure, alteration and destruction;</li>\r\n	<li>not use or disclose the information except:</li>\r\n	<li>as necessary to provide services or products you have ordered, such as (for example) by providing it to a carrier to deliver products you have ordered;</li>\r\n	<li>in other ways described in this privacy policy or to which you have otherwise consented;</li>\r\n	<li>in the aggregate with other information in such a way so that your identity cannot reasonably be determined (for example, statistical compilations);</li>\r\n	<li>as required by law, for example, in response to a subpoena or search warrant;</li>\r\n	<li>to outside auditors who have agreed to keep the information confidential;</li>\r\n	<li>as necessary to enforce the Terms of Service;</li>\r\n	<li>as necessary to protect the rights, safety, or property of The MoneyMile, its users, or others; this may include (for example) exchanging information with other organizations for fraud protection and/or risk reduction.</li>\r\n</ul>\r\n\r\n<h2><strong>Other information we collect </strong></h2>\r\n\r\n<p>We may collect other information that cannot be readily used to identify you, such as (for example) the domain name and IP address of your computer. We may use this information, individually or in the aggregate, for technical administration of our Web site(s); research and development; customer- and account administration; and to help us focus our marketing efforts more precisely.</p>\r\n\r\n<h2>Cookies</h2>\r\n\r\n<p>The MoneyMile uses &ldquo;cookies&rdquo; to store personal data on your computer. We may also link information stored on your computer in cookies with personal data about specific individuals stored on our servers. If you set up your Web browser (for example, Internet Explorer or Firefox) so that cookies are not allowed, you might not be able to use some or all of the features of our Web site(s).</p>\r\n\r\n<h2>External data storage sites</h2>\r\n\r\n<p>We may store your data on servers provided by third party hosting vendors with whom we have contracted.</p>\r\n\r\n<h2>Your privacy responsibilities</h2>\r\n\r\n<p>To help protect your privacy, be sure:</p>\r\n\r\n<ul>\r\n	<li>not to share your user ID or password with anyone else;</li>\r\n	<li>to log off the Company Name Web site when you are finished;</li>\r\n	<li>to take customary precautions to guard against &ldquo;malware&rdquo; (viruses, Trojan horses, bots, etc.), for example by installing and updating suitable anti-virus software.</li>\r\n</ul>\r\n\r\n<h2>Notice to European Union users</h2>\r\n\r\n<p>Company Name&lsquo;s operations are located primarily in the United States. If you provide information to us, the information will be transferred out of the European Union (EU) to the United States. By providing personal information to us, you are consenting to its storage and use as described herein.</p>\r\n\r\n<h2>Information collected from children</h2>\r\n\r\n<p>You must be at least 13 years old to use The MoneyMile Web site(s) and service(s). Company Name does not knowingly collect information from children under 13. (See the U.S. Children&rsquo;s Online Privacy Protection Act.)</p>\r\n\r\n<h2>Changes to this privacy policy</h2>\r\n\r\n<p>We reserve the right to change this privacy policy as we deem necessary or appropriate because of legal compliance requirements or changes in our business practices. If you have provided us with an email address, we will endeavor to notify you, by email to that address, of any material change to how we will use personally identifiable information.</p>\r\n\r\n<h2>Questions or comments?</h2>\r\n\r\n<p>If you have questions or comments about The MoneyMile privacy policy, send an email to <a href="http://support@themoneymile.com">support@themoneymile.com</a>, or contact us via any of the ways described in the About Us page at URL of company&#39;s website. Thank you for choosing Company Name!</p>', 'Privacy Policy', 'Privacy Policy', 'Privacy Policy'),
(8, 4, 'sd', 'asdsdf', '<p>sadfd asdf</p>', 'adsdsf', 'asdfd', 'adsf'),
(9, 3, 'Terms of Service', 'Terms of Service', '<h2>Conditions of Use</h2>\r\n\r\n<p><br />\r\nWe will provide their services to you, which are subject to the conditions stated below in this<br />\r\ndocument. Every time you visit this website, use its services or make a purchase, you accept<br />\r\nthe following conditions. This is why we urge you to read them carefully.</p>\r\n\r\n<h2><br />\r\nPrivacy Policy</h2>\r\n\r\n<p><br />\r\nBefore you continue using our website we advise you to read our privacy policy [link to privacy<br />\r\npolicy] regarding our user data collection. It will help you better understand our practices.<br />\r\nCopyright<br />\r\nContent published on this website (digital downloads, images, texts, graphics, logos) is the<br />\r\nproperty of [name] and/or its content creators and protected by international copyright laws. The<br />\r\nentire compilation of the content found on this website is the exclusive property of [name], with<br />\r\ncopyright authorship for this compilation by [name].</p>', 'Terms of Service', 'Terms of Service', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mm_information_metas`
--

CREATE TABLE `mm_information_metas` (
  `information_id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
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
(27, 'sdf', '2018-09-21 05:34:02', '2018-09-21 05:34:02');

-- --------------------------------------------------------

--
-- Table structure for table `mm_menu_items`
--

CREATE TABLE `mm_menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_class` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '0',
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
(14, 26, 0, 'Privacy Policy', 'privacy-policy', NULL, NULL, 15, '2018-09-20 06:37:01', '2018-11-21 05:57:21'),
(15, 26, 0, 'Terms of Service', 'terms-of-service', NULL, NULL, 16, '2018-09-20 06:37:52', '2018-11-21 05:57:15'),
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
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
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
('Ksc5sbbZq', 'branches', 'a:2:{s:7:"preview";a:4:{s:13:"configuration";a:8:{s:6:"player";a:1:{s:8:"template";a:2:{s:7:"version";s:6:"6.22.7";s:4:"name";s:21:"single-video-template";}}s:11:"video_cloud";a:2:{s:10:"policy_key";s:144:"BCpkADawqM2oSmt6f0PMEnLmHYUkqC4qfLov4TkCnXNKnZgkOH-s2Xhxu034OIr5HuKthLfh6JJRt61fFvsyssGfHhzYPK5A1wZVbNcLLt1z08brHd0v13ryJuZWO0q5NM4KyeLpTRAFXoeE";s:5:"video";N;}s:13:"compatibility";b:1;s:7:"plugins";a:1:{i:0;a:2:{s:7:"options";a:7:{s:9:"serverUrl";s:240:"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/single_ad_samples&ciu_szs=300x250&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ct%3Dlinear&correlator=";s:7:"timeout";i:4000;s:12:"hardTimeouts";b:1;s:11:"requestMode";s:5:"oncue";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:9:"vpaidMode";s:7:"ENABLED";s:17:"useMediaCuePoints";b:1;}s:4:"name";s:4:"ima3";}}s:7:"scripts";a:1:{i:0;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:11:"stylesheets";a:1:{i:0;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}s:2:"id";s:9:"Ksc5sbbZq";s:20:"studio_configuration";a:1:{s:12:"availability";a:2:{s:7:"domains";a:0:{}s:10:"policy_key";s:144:"BCpkADawqM2oSmt6f0PMEnLmHYUkqC4qfLov4TkCnXNKnZgkOH-s2Xhxu034OIr5HuKthLfh6JJRt61fFvsyssGfHhzYPK5A1wZVbNcLLt1z08brHd0v13ryJuZWO0q5NM4KyeLpTRAFXoeE";}}}s:10:"updated_at";s:24:"2018-08-14T08:23:13.008Z";s:19:"template_updated_at";s:24:"2018-08-30T20:20:58.256Z";s:11:"preview_url";s:122:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/Ksc5sbbZq/preview/embeds/default/master/index.html";}s:6:"master";a:4:{s:13:"configuration";a:8:{s:20:"studio_configuration";a:1:{s:12:"availability";a:2:{s:10:"policy_key";s:144:"BCpkADawqM2oSmt6f0PMEnLmHYUkqC4qfLov4TkCnXNKnZgkOH-s2Xhxu034OIr5HuKthLfh6JJRt61fFvsyssGfHhzYPK5A1wZVbNcLLt1z08brHd0v13ryJuZWO0q5NM4KyeLpTRAFXoeE";s:7:"domains";a:0:{}}}s:2:"id";s:9:"Ksc5sbbZq";s:11:"stylesheets";a:1:{i:0;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}s:7:"scripts";a:1:{i:0;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:7:"plugins";a:1:{i:0;a:2:{s:7:"options";a:7:{s:17:"useMediaCuePoints";b:1;s:9:"vpaidMode";s:7:"ENABLED";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:11:"requestMode";s:5:"oncue";s:12:"hardTimeouts";b:1;s:7:"timeout";i:4000;s:9:"serverUrl";s:240:"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/single_ad_samples&ciu_szs=300x250&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ct%3Dlinear&correlator=";}s:4:"name";s:4:"ima3";}}s:13:"compatibility";b:1;s:11:"video_cloud";a:2:{s:5:"video";N;s:10:"policy_key";s:144:"BCpkADawqM2oSmt6f0PMEnLmHYUkqC4qfLov4TkCnXNKnZgkOH-s2Xhxu034OIr5HuKthLfh6JJRt61fFvsyssGfHhzYPK5A1wZVbNcLLt1z08brHd0v13ryJuZWO0q5NM4KyeLpTRAFXoeE";}s:6:"player";a:1:{s:8:"template";a:2:{s:4:"name";s:21:"single-video-template";s:7:"version";s:6:"6.22.7";}}}s:10:"updated_at";s:24:"2018-08-14T08:23:11.932Z";s:19:"template_updated_at";s:24:"2018-08-30T20:21:08.336Z";s:11:"preview_url";s:121:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/Ksc5sbbZq/master/embeds/default/master/index.html";}}', '2018-09-07 04:39:46', '2018-09-07 04:39:46'),
('Ksc5sbbZq', 'created_at', '2018-08-14T07:53:03.778Z', '2018-09-07 04:39:46', '2018-09-07 04:39:46'),
('Ksc5sbbZq', 'url', 'http://players.brightcove.net/5814665417001/Ksc5sbbZq_default/index.html', '2018-09-07 04:39:46', '2018-09-07 04:39:46'),
('Ksc5sbbZq', 'embed_count', '1', '2018-09-07 04:39:46', '2018-09-07 04:39:46'),
('Ksc5sbbZq', 'accountId', '5814665417001', '2018-09-07 04:39:46', '2018-09-07 04:39:46'),
('oI9Ys62fi', 'id', 'oI9Ys62fi', '2018-09-07 04:39:48', '2018-09-07 04:39:48'),
('oI9Ys62fi', 'name', 'Pre-Roll Ad - On Load - Skip', '2018-09-07 04:39:48', '2018-09-07 04:39:48'),
('oI9Ys62fi', 'description', 'Pre-Roll Ad - On Load', '2018-09-07 04:39:48', '2018-09-07 04:39:48'),
('oI9Ys62fi', 'branches', 'a:2:{s:6:"master";a:4:{s:19:"template_updated_at";s:24:"2018-08-30T20:21:08.336Z";s:10:"updated_at";s:24:"2018-08-14T05:59:10.818Z";s:13:"configuration";a:9:{s:6:"player";a:1:{s:8:"template";a:2:{s:7:"version";s:6:"6.22.7";s:4:"name";s:21:"single-video-template";}}s:11:"video_cloud";a:2:{s:10:"policy_key";s:144:"BCpkADawqM0Z5JvQNM7nZ74t7QiN3zVbjQOYgFIOqtPh8FLYEiPXmUugNI0BTl5FkJZ6Q0QIkDMZrVDQ6qWRDxOf_O2t5ZHx13CZO62bcZ5Arwy_7Zt5gICeyI2RRs3AJVhctHRYiPQRqulk";s:5:"video";N;}s:13:"compatibility";b:1;s:7:"plugins";a:2:{i:0;a:2:{s:7:"options";a:7:{s:11:"deeplinking";b:0;s:5:"title";s:0:"";s:11:"description";s:0:"";s:3:"url";s:0:"";s:6:"offset";s:0:"";s:8:"services";a:6:{s:8:"facebook";b:1;s:6:"google";b:1;s:7:"twitter";b:1;s:9:"pinterest";b:1;s:8:"linkedin";b:1;s:6:"tumblr";b:1;}s:17:"displayAfterVideo";b:1;}s:4:"name";s:6:"social";}i:1;a:2:{s:7:"options";a:7:{s:9:"serverUrl";s:249:"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/single_ad_samples&ciu_szs=300x250&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ct%3Dskippablelinear&correlator=";s:7:"timeout";i:4000;s:12:"hardTimeouts";b:1;s:11:"requestMode";s:6:"onload";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:9:"vpaidMode";s:7:"ENABLED";s:17:"useMediaCuePoints";b:0;}s:4:"name";s:4:"ima3";}}s:7:"scripts";a:2:{i:0;s:63:"//players.brightcove.net/videojs-social/3/videojs-social.min.js";i:1;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:11:"stylesheets";a:2:{i:0;s:60:"//players.brightcove.net/videojs-social/3/videojs-social.css";i:1;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}s:3:"css";a:3:{s:12:"controlColor";s:4:"#fff";s:15:"controlBarColor";s:19:"rgba(0, 0, 0, 0.45)";s:13:"progressColor";s:7:"#d52484";}s:4:"skin";N;s:4:"dock";b:1;}s:11:"preview_url";s:121:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/oI9Ys62fi/master/embeds/default/master/index.html";}s:7:"preview";a:4:{s:19:"template_updated_at";s:24:"2018-08-30T20:20:58.256Z";s:10:"updated_at";s:24:"2018-08-14T05:59:11.842Z";s:13:"configuration";a:9:{s:4:"dock";b:1;s:4:"skin";N;s:3:"css";a:3:{s:13:"progressColor";s:7:"#d52484";s:15:"controlBarColor";s:19:"rgba(0, 0, 0, 0.45)";s:12:"controlColor";s:4:"#fff";}s:11:"stylesheets";a:2:{i:0;s:60:"//players.brightcove.net/videojs-social/3/videojs-social.css";i:1;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}s:7:"scripts";a:2:{i:0;s:63:"//players.brightcove.net/videojs-social/3/videojs-social.min.js";i:1;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:7:"plugins";a:2:{i:0;a:2:{s:7:"options";a:7:{s:17:"displayAfterVideo";b:1;s:8:"services";a:6:{s:6:"tumblr";b:1;s:8:"linkedin";b:1;s:9:"pinterest";b:1;s:7:"twitter";b:1;s:6:"google";b:1;s:8:"facebook";b:1;}s:6:"offset";s:0:"";s:3:"url";s:0:"";s:11:"description";s:0:"";s:5:"title";s:0:"";s:11:"deeplinking";b:0;}s:4:"name";s:6:"social";}i:1;a:2:{s:7:"options";a:7:{s:17:"useMediaCuePoints";b:0;s:9:"vpaidMode";s:7:"ENABLED";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:11:"requestMode";s:6:"onload";s:12:"hardTimeouts";b:1;s:7:"timeout";i:4000;s:9:"serverUrl";s:249:"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/single_ad_samples&ciu_szs=300x250&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ct%3Dskippablelinear&correlator=";}s:4:"name";s:4:"ima3";}}s:13:"compatibility";b:1;s:11:"video_cloud";a:2:{s:5:"video";N;s:10:"policy_key";s:144:"BCpkADawqM0Z5JvQNM7nZ74t7QiN3zVbjQOYgFIOqtPh8FLYEiPXmUugNI0BTl5FkJZ6Q0QIkDMZrVDQ6qWRDxOf_O2t5ZHx13CZO62bcZ5Arwy_7Zt5gICeyI2RRs3AJVhctHRYiPQRqulk";}s:6:"player";a:1:{s:8:"template";a:2:{s:4:"name";s:21:"single-video-template";s:7:"version";s:6:"6.22.7";}}}s:11:"preview_url";s:122:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/oI9Ys62fi/preview/embeds/default/master/index.html";}}', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('oI9Ys62fi', 'created_at', '2018-08-14T05:47:54.541Z', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('oI9Ys62fi', 'url', 'http://players.brightcove.net/5814665417001/oI9Ys62fi_default/index.html', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('oI9Ys62fi', 'embed_count', '1', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('oI9Ys62fi', 'accountId', '5814665417001', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('t96CU0JUI', 'id', 't96CU0JUI', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('t96CU0JUI', 'name', 'Pre  / Mid / Post - On Load', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('t96CU0JUI', 'description', '', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('t96CU0JUI', 'branches', 'a:2:{s:6:"master";a:4:{s:19:"template_updated_at";s:24:"2018-08-30T20:21:08.336Z";s:10:"updated_at";s:24:"2018-08-14T08:47:28.308Z";s:13:"configuration";a:6:{s:7:"plugins";a:1:{i:0;a:2:{s:7:"options";a:7:{s:17:"useMediaCuePoints";b:0;s:9:"vpaidMode";s:7:"ENABLED";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:11:"requestMode";s:6:"onload";s:12:"hardTimeouts";b:1;s:7:"timeout";i:4000;s:9:"serverUrl";s:282:"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostpod&cmsid=496&vid=short_onecue&correlator=";}s:4:"name";s:4:"ima3";}}s:13:"compatibility";b:1;s:11:"video_cloud";a:2:{s:5:"video";N;s:10:"policy_key";s:144:"BCpkADawqM075RwoD8PAw8vGI9OAScJBoqwKjawxtb4RAy5X7WnPuCTEsbBdwe7kTj3nLLIfpTG8hJQoPMI42ceftbIFjbCG5myIwGupiEvM0ipr2TD8mTtu_lTVzqpZGxxO2D79r3ztImzr";}s:6:"player";a:1:{s:8:"template";a:2:{s:4:"name";s:21:"single-video-template";s:7:"version";s:6:"6.22.7";}}s:7:"scripts";a:1:{i:0;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:11:"stylesheets";a:1:{i:0;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}}s:11:"preview_url";s:121:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/t96CU0JUI/master/embeds/default/master/index.html";}s:7:"preview";a:4:{s:19:"template_updated_at";s:24:"2018-08-30T20:20:58.256Z";s:10:"updated_at";s:24:"2018-08-14T08:47:29.071Z";s:13:"configuration";a:6:{s:6:"player";a:1:{s:8:"template";a:2:{s:7:"version";s:6:"6.22.7";s:4:"name";s:21:"single-video-template";}}s:11:"video_cloud";a:2:{s:10:"policy_key";s:144:"BCpkADawqM075RwoD8PAw8vGI9OAScJBoqwKjawxtb4RAy5X7WnPuCTEsbBdwe7kTj3nLLIfpTG8hJQoPMI42ceftbIFjbCG5myIwGupiEvM0ipr2TD8mTtu_lTVzqpZGxxO2D79r3ztImzr";s:5:"video";N;}s:13:"compatibility";b:1;s:7:"plugins";a:1:{i:0;a:2:{s:7:"options";a:7:{s:9:"serverUrl";s:282:"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostpod&cmsid=496&vid=short_onecue&correlator=";s:7:"timeout";i:4000;s:12:"hardTimeouts";b:1;s:11:"requestMode";s:6:"onload";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:9:"vpaidMode";s:7:"ENABLED";s:17:"useMediaCuePoints";b:0;}s:4:"name";s:4:"ima3";}}s:7:"scripts";a:1:{i:0;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:11:"stylesheets";a:1:{i:0;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}}s:11:"preview_url";s:122:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/t96CU0JUI/preview/embeds/default/master/index.html";}}', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('t96CU0JUI', 'created_at', '2018-08-14T08:47:08.055Z', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('t96CU0JUI', 'url', 'http://players.brightcove.net/5814665417001/t96CU0JUI_default/index.html', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('t96CU0JUI', 'embed_count', '1', '2018-09-07 04:39:49', '2018-09-07 04:39:49'),
('t96CU0JUI', 'accountId', '5814665417001', '2018-09-07 04:39:50', '2018-09-07 04:39:50'),
('tRMX2rkxce', 'id', 'tRMX2rkxce', '2018-09-07 04:39:50', '2018-09-07 04:39:50'),
('tRMX2rkxce', 'name', 'Post / Pre / Mid - On Cue Point', '2018-09-07 04:39:50', '2018-09-07 04:39:50'),
('tRMX2rkxce', 'description', '', '2018-09-07 04:39:50', '2018-09-07 04:39:50'),
('tRMX2rkxce', 'branches', 'a:2:{s:7:"preview";a:4:{s:13:"configuration";a:6:{s:6:"player";a:1:{s:8:"template";a:2:{s:7:"version";s:6:"6.22.7";s:4:"name";s:21:"single-video-template";}}s:11:"video_cloud";a:2:{s:10:"policy_key";s:144:"BCpkADawqM01n2-_4nIxvBma2qyKBjwSAU34rAlTK1wYe52UYzXuR8vln0nuO6YUWxZizGAabxuidXtLi3tAtgFrJxLpfpGeUkgUx3cRpLLC_Hy2sPGov6oeiA1kxWnkxSDtEMMmAS19SIfU";s:5:"video";N;}s:13:"compatibility";b:1;s:7:"plugins";a:1:{i:0;a:2:{s:7:"options";a:7:{s:9:"serverUrl";s:282:"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostpod&cmsid=496&vid=short_onecue&correlator=";s:7:"timeout";i:4000;s:12:"hardTimeouts";b:1;s:11:"requestMode";s:5:"oncue";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:9:"vpaidMode";s:7:"ENABLED";s:17:"useMediaCuePoints";b:1;}s:4:"name";s:4:"ima3";}}s:7:"scripts";a:1:{i:0;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:11:"stylesheets";a:1:{i:0;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}}s:10:"updated_at";s:24:"2018-08-14T08:46:43.560Z";s:19:"template_updated_at";s:24:"2018-08-30T20:20:58.256Z";s:11:"preview_url";s:123:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/tRMX2rkxce/preview/embeds/default/master/index.html";}s:6:"master";a:4:{s:13:"configuration";a:6:{s:6:"player";a:1:{s:8:"template";a:2:{s:7:"version";s:6:"6.22.7";s:4:"name";s:21:"single-video-template";}}s:11:"video_cloud";a:2:{s:10:"policy_key";s:144:"BCpkADawqM01n2-_4nIxvBma2qyKBjwSAU34rAlTK1wYe52UYzXuR8vln0nuO6YUWxZizGAabxuidXtLi3tAtgFrJxLpfpGeUkgUx3cRpLLC_Hy2sPGov6oeiA1kxWnkxSDtEMMmAS19SIfU";s:5:"video";N;}s:13:"compatibility";b:1;s:7:"plugins";a:1:{i:0;a:2:{s:7:"options";a:7:{s:9:"serverUrl";s:282:"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostpod&cmsid=496&vid=short_onecue&correlator=";s:7:"timeout";i:4000;s:12:"hardTimeouts";b:1;s:11:"requestMode";s:5:"oncue";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:9:"vpaidMode";s:7:"ENABLED";s:17:"useMediaCuePoints";b:1;}s:4:"name";s:4:"ima3";}}s:7:"scripts";a:1:{i:0;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:11:"stylesheets";a:1:{i:0;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}}s:10:"updated_at";s:24:"2018-08-14T08:46:42.466Z";s:19:"template_updated_at";s:24:"2018-08-30T20:21:08.336Z";s:11:"preview_url";s:122:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/tRMX2rkxce/master/embeds/default/master/index.html";}}', '2018-09-07 04:39:50', '2018-09-07 04:39:50'),
('tRMX2rkxce', 'created_at', '2018-08-14T08:40:44.979Z', '2018-09-07 04:39:50', '2018-09-07 04:39:50'),
('tRMX2rkxce', 'url', 'http://players.brightcove.net/5814665417001/tRMX2rkxce_default/index.html', '2018-09-07 04:39:50', '2018-09-07 04:39:50'),
('tRMX2rkxce', 'embed_count', '1', '2018-09-07 04:39:50', '2018-09-07 04:39:50'),
('tRMX2rkxce', 'accountId', '5814665417001', '2018-09-07 04:39:50', '2018-09-07 04:39:50'),
('2N7wx9DlN', 'id', '2N7wx9DlN', '2018-09-07 05:22:10', '2018-09-07 05:22:10'),
('2N7wx9DlN', 'name', 'Home Page Full page playe 1901', '2018-09-07 05:22:10', '2018-09-07 05:22:10'),
('2N7wx9DlN', 'description', 'Home Page Full page player', '2018-09-07 05:22:10', '2018-09-07 05:22:10'),
('2N7wx9DlN', 'branches', 'a:2:{s:7:"preview";a:4:{s:13:"configuration";a:13:{s:6:"player";a:2:{s:8:"template";a:4:{s:7:"version";s:6:"6.22.7";s:4:"name";s:21:"single-video-template";s:6:"locked";b:0;s:13:"version_alias";N;}s:8:"inactive";b:0;}s:11:"video_cloud";a:2:{s:10:"policy_key";s:144:"BCpkADawqM18vdrb6kOdPSItBdtNy_nRdlHq9ltCVVG0n6FniJauupbrfxZDJlTEtWOiuUQd_OAn6Fw0Uf7dN_6Nh2XcwkvXrC91dKWSFIyGstWD1QwaS3mKWtA4Uz1kCsyyJVDwh2yiujcY";s:5:"video";N;}s:13:"compatibility";b:1;s:2:"id";s:9:"2N7wx9DlN";s:7:"preload";s:8:"metadata";s:8:"autoplay";b:1;s:17:"fullscreenControl";b:1;s:20:"studio_configuration";a:1:{s:6:"player";a:4:{s:5:"width";i:4;s:6:"height";i:750;s:8:"adjusted";b:0;s:10:"responsive";b:0;}}s:11:"autoadvance";i:0;s:7:"plugins";a:2:{i:0;a:2:{s:7:"options";a:2:{s:19:"useResolutionLabels";b:0;s:23:"resolutionLabelBitrates";b:1;}s:4:"name";s:11:"qualityMenu";}i:1;a:2:{s:7:"options";a:7:{s:9:"serverUrl";s:14:"this is my url";s:7:"timeout";i:4000;s:12:"hardTimeouts";b:1;s:11:"requestMode";s:6:"onload";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:9:"vpaidMode";s:7:"ENABLED";s:17:"useMediaCuePoints";b:0;}s:4:"name";s:4:"ima3";}}s:7:"scripts";a:2:{i:0;s:75:"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.min.js";i:1;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:11:"stylesheets";a:2:{i:0;s:72:"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.css";i:1;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}s:8:"playlist";b:1;}s:10:"updated_at";s:24:"2018-09-07T10:47:29.154Z";s:19:"template_updated_at";s:24:"2018-08-30T20:20:58.256Z";s:11:"preview_url";s:122:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/2N7wx9DlN/preview/embeds/default/master/index.html";}s:6:"master";a:4:{s:13:"configuration";a:13:{s:8:"playlist";b:1;s:11:"stylesheets";a:2:{i:0;s:72:"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.css";i:1;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}s:7:"scripts";a:2:{i:0;s:75:"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.min.js";i:1;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:7:"plugins";a:2:{i:0;a:2:{s:7:"options";a:2:{s:23:"resolutionLabelBitrates";b:1;s:19:"useResolutionLabels";b:0;}s:4:"name";s:11:"qualityMenu";}i:1;a:2:{s:7:"options";a:7:{s:17:"useMediaCuePoints";b:0;s:9:"vpaidMode";s:7:"ENABLED";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:11:"requestMode";s:6:"onload";s:12:"hardTimeouts";b:1;s:7:"timeout";i:4000;s:9:"serverUrl";s:14:"this is my url";}s:4:"name";s:4:"ima3";}}s:11:"autoadvance";i:0;s:20:"studio_configuration";a:1:{s:6:"player";a:4:{s:10:"responsive";b:0;s:8:"adjusted";b:0;s:6:"height";i:750;s:5:"width";i:4;}}s:17:"fullscreenControl";b:1;s:8:"autoplay";b:1;s:7:"preload";s:8:"metadata";s:2:"id";s:9:"2N7wx9DlN";s:13:"compatibility";b:1;s:11:"video_cloud";a:2:{s:5:"video";N;s:10:"policy_key";s:144:"BCpkADawqM18vdrb6kOdPSItBdtNy_nRdlHq9ltCVVG0n6FniJauupbrfxZDJlTEtWOiuUQd_OAn6Fw0Uf7dN_6Nh2XcwkvXrC91dKWSFIyGstWD1QwaS3mKWtA4Uz1kCsyyJVDwh2yiujcY";}s:6:"player";a:2:{s:8:"inactive";b:0;s:8:"template";a:4:{s:13:"version_alias";N;s:6:"locked";b:0;s:4:"name";s:21:"single-video-template";s:7:"version";s:6:"6.22.7";}}}s:10:"updated_at";s:24:"2018-09-07T10:47:28.544Z";s:19:"template_updated_at";s:24:"2018-08-30T20:21:08.336Z";s:11:"preview_url";s:121:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/2N7wx9DlN/master/embeds/default/master/index.html";}}', '2018-09-07 05:22:10', '2018-09-07 05:22:10'),
('2N7wx9DlN', 'created_at', '2018-08-20T05:23:34.304Z', '2018-09-07 05:22:11', '2018-09-07 05:22:11'),
('2N7wx9DlN', 'url', 'http://players.brightcove.net/5814665417001/2N7wx9DlN_default/index.html', '2018-09-07 05:22:11', '2018-09-07 05:22:11'),
('2N7wx9DlN', 'embed_count', '1', '2018-09-07 05:22:11', '2018-09-07 05:22:11'),
('2N7wx9DlN', 'accountId', '5814665417001', '2018-09-07 05:22:11', '2018-09-07 05:22:11'),
('2N7wx9DlN', 'id', '2N7wx9DlN', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('2N7wx9DlN', 'name', 'Home Page Full page playe 1901', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('2N7wx9DlN', 'description', 'Home Page Full page player', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('2N7wx9DlN', 'branches', 'a:2:{s:7:"preview";a:4:{s:13:"configuration";a:13:{s:6:"player";a:2:{s:8:"template";a:4:{s:7:"version";s:6:"6.22.7";s:4:"name";s:21:"single-video-template";s:6:"locked";b:0;s:13:"version_alias";N;}s:8:"inactive";b:0;}s:11:"video_cloud";a:2:{s:10:"policy_key";s:144:"BCpkADawqM18vdrb6kOdPSItBdtNy_nRdlHq9ltCVVG0n6FniJauupbrfxZDJlTEtWOiuUQd_OAn6Fw0Uf7dN_6Nh2XcwkvXrC91dKWSFIyGstWD1QwaS3mKWtA4Uz1kCsyyJVDwh2yiujcY";s:5:"video";N;}s:13:"compatibility";b:1;s:2:"id";s:9:"2N7wx9DlN";s:7:"preload";s:8:"metadata";s:8:"autoplay";b:1;s:17:"fullscreenControl";b:1;s:20:"studio_configuration";a:1:{s:6:"player";a:4:{s:5:"width";i:4;s:6:"height";i:750;s:8:"adjusted";b:0;s:10:"responsive";b:0;}}s:11:"autoadvance";i:0;s:7:"plugins";a:2:{i:0;a:2:{s:7:"options";a:2:{s:19:"useResolutionLabels";b:0;s:23:"resolutionLabelBitrates";b:1;}s:4:"name";s:11:"qualityMenu";}i:1;a:2:{s:7:"options";a:7:{s:9:"serverUrl";s:14:"this is my url";s:7:"timeout";i:4000;s:12:"hardTimeouts";b:1;s:11:"requestMode";s:6:"onload";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:9:"vpaidMode";s:7:"ENABLED";s:17:"useMediaCuePoints";b:0;}s:4:"name";s:4:"ima3";}}s:7:"scripts";a:2:{i:0;s:75:"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.min.js";i:1;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:11:"stylesheets";a:2:{i:0;s:72:"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.css";i:1;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}s:8:"playlist";b:1;}s:10:"updated_at";s:24:"2018-09-07T10:47:29.154Z";s:19:"template_updated_at";s:24:"2018-08-30T20:20:58.256Z";s:11:"preview_url";s:122:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/2N7wx9DlN/preview/embeds/default/master/index.html";}s:6:"master";a:4:{s:13:"configuration";a:13:{s:8:"playlist";b:1;s:11:"stylesheets";a:2:{i:0;s:72:"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.css";i:1;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}s:7:"scripts";a:2:{i:0;s:75:"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.min.js";i:1;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:7:"plugins";a:2:{i:0;a:2:{s:7:"options";a:2:{s:23:"resolutionLabelBitrates";b:1;s:19:"useResolutionLabels";b:0;}s:4:"name";s:11:"qualityMenu";}i:1;a:2:{s:7:"options";a:7:{s:17:"useMediaCuePoints";b:0;s:9:"vpaidMode";s:7:"ENABLED";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:11:"requestMode";s:6:"onload";s:12:"hardTimeouts";b:1;s:7:"timeout";i:4000;s:9:"serverUrl";s:14:"this is my url";}s:4:"name";s:4:"ima3";}}s:11:"autoadvance";i:0;s:20:"studio_configuration";a:1:{s:6:"player";a:4:{s:10:"responsive";b:0;s:8:"adjusted";b:0;s:6:"height";i:750;s:5:"width";i:4;}}s:17:"fullscreenControl";b:1;s:8:"autoplay";b:1;s:7:"preload";s:8:"metadata";s:2:"id";s:9:"2N7wx9DlN";s:13:"compatibility";b:1;s:11:"video_cloud";a:2:{s:5:"video";N;s:10:"policy_key";s:144:"BCpkADawqM18vdrb6kOdPSItBdtNy_nRdlHq9ltCVVG0n6FniJauupbrfxZDJlTEtWOiuUQd_OAn6Fw0Uf7dN_6Nh2XcwkvXrC91dKWSFIyGstWD1QwaS3mKWtA4Uz1kCsyyJVDwh2yiujcY";}s:6:"player";a:2:{s:8:"inactive";b:0;s:8:"template";a:4:{s:13:"version_alias";N;s:6:"locked";b:0;s:4:"name";s:21:"single-video-template";s:7:"version";s:6:"6.22.7";}}}s:10:"updated_at";s:24:"2018-09-07T10:47:28.544Z";s:19:"template_updated_at";s:24:"2018-08-30T20:21:08.336Z";s:11:"preview_url";s:121:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/2N7wx9DlN/master/embeds/default/master/index.html";}}', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('2N7wx9DlN', 'created_at', '2018-08-20T05:23:34.304Z', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('2N7wx9DlN', 'url', 'http://players.brightcove.net/5814665417001/2N7wx9DlN_default/index.html', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('2N7wx9DlN', 'embed_count', '1', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('2N7wx9DlN', 'accountId', '5814665417001', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('Ksc5sbbZq', 'id', 'Ksc5sbbZq', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('Ksc5sbbZq', 'name', 'Mid Ad Post Ad  using Cue Points', '2018-09-10 06:48:03', '2018-09-10 06:48:03'),
('Ksc5sbbZq', 'description', 'Mid Ad Post Ad  using Cue Points', '2018-09-10 06:48:04', '2018-09-10 06:48:04'),
('Ksc5sbbZq', 'branches', 'a:2:{s:7:"preview";a:4:{s:13:"configuration";a:8:{s:6:"player";a:1:{s:8:"template";a:2:{s:7:"version";s:6:"6.22.7";s:4:"name";s:21:"single-video-template";}}s:11:"video_cloud";a:2:{s:10:"policy_key";s:144:"BCpkADawqM2oSmt6f0PMEnLmHYUkqC4qfLov4TkCnXNKnZgkOH-s2Xhxu034OIr5HuKthLfh6JJRt61fFvsyssGfHhzYPK5A1wZVbNcLLt1z08brHd0v13ryJuZWO0q5NM4KyeLpTRAFXoeE";s:5:"video";N;}s:13:"compatibility";b:1;s:7:"plugins";a:1:{i:0;a:2:{s:7:"options";a:7:{s:9:"serverUrl";s:240:"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/single_ad_samples&ciu_szs=300x250&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ct%3Dlinear&correlator=";s:7:"timeout";i:4000;s:12:"hardTimeouts";b:1;s:11:"requestMode";s:5:"oncue";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:9:"vpaidMode";s:7:"ENABLED";s:17:"useMediaCuePoints";b:1;}s:4:"name";s:4:"ima3";}}s:7:"scripts";a:1:{i:0;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:11:"stylesheets";a:1:{i:0;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}s:2:"id";s:9:"Ksc5sbbZq";s:20:"studio_configuration";a:1:{s:12:"availability";a:2:{s:7:"domains";a:0:{}s:10:"policy_key";s:144:"BCpkADawqM2oSmt6f0PMEnLmHYUkqC4qfLov4TkCnXNKnZgkOH-s2Xhxu034OIr5HuKthLfh6JJRt61fFvsyssGfHhzYPK5A1wZVbNcLLt1z08brHd0v13ryJuZWO0q5NM4KyeLpTRAFXoeE";}}}s:10:"updated_at";s:24:"2018-08-14T08:23:13.008Z";s:19:"template_updated_at";s:24:"2018-08-30T20:20:58.256Z";s:11:"preview_url";s:122:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/Ksc5sbbZq/preview/embeds/default/master/index.html";}s:6:"master";a:4:{s:13:"configuration";a:8:{s:20:"studio_configuration";a:1:{s:12:"availability";a:2:{s:10:"policy_key";s:144:"BCpkADawqM2oSmt6f0PMEnLmHYUkqC4qfLov4TkCnXNKnZgkOH-s2Xhxu034OIr5HuKthLfh6JJRt61fFvsyssGfHhzYPK5A1wZVbNcLLt1z08brHd0v13ryJuZWO0q5NM4KyeLpTRAFXoeE";s:7:"domains";a:0:{}}}s:2:"id";s:9:"Ksc5sbbZq";s:11:"stylesheets";a:1:{i:0;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}s:7:"scripts";a:1:{i:0;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:7:"plugins";a:1:{i:0;a:2:{s:7:"options";a:7:{s:17:"useMediaCuePoints";b:1;s:9:"vpaidMode";s:7:"ENABLED";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:11:"requestMode";s:5:"oncue";s:12:"hardTimeouts";b:1;s:7:"timeout";i:4000;s:9:"serverUrl";s:240:"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/single_ad_samples&ciu_szs=300x250&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ct%3Dlinear&correlator=";}s:4:"name";s:4:"ima3";}}s:13:"compatibility";b:1;s:11:"video_cloud";a:2:{s:5:"video";N;s:10:"policy_key";s:144:"BCpkADawqM2oSmt6f0PMEnLmHYUkqC4qfLov4TkCnXNKnZgkOH-s2Xhxu034OIr5HuKthLfh6JJRt61fFvsyssGfHhzYPK5A1wZVbNcLLt1z08brHd0v13ryJuZWO0q5NM4KyeLpTRAFXoeE";}s:6:"player";a:1:{s:8:"template";a:2:{s:4:"name";s:21:"single-video-template";s:7:"version";s:6:"6.22.7";}}}s:10:"updated_at";s:24:"2018-08-14T08:23:11.932Z";s:19:"template_updated_at";s:24:"2018-08-30T20:21:08.336Z";s:11:"preview_url";s:121:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/Ksc5sbbZq/master/embeds/default/master/index.html";}}', '2018-09-10 06:48:04', '2018-09-10 06:48:04'),
('Ksc5sbbZq', 'created_at', '2018-08-14T07:53:03.778Z', '2018-09-10 06:48:04', '2018-09-10 06:48:04'),
('Ksc5sbbZq', 'url', 'http://players.brightcove.net/5814665417001/Ksc5sbbZq_default/index.html', '2018-09-10 06:48:04', '2018-09-10 06:48:04'),
('Ksc5sbbZq', 'embed_count', '1', '2018-09-10 06:48:04', '2018-09-10 06:48:04'),
('Ksc5sbbZq', 'accountId', '5814665417001', '2018-09-10 06:48:04', '2018-09-10 06:48:04'),
('oI9Ys62fi', 'id', 'oI9Ys62fi', '2018-09-10 06:48:07', '2018-09-10 06:48:07'),
('oI9Ys62fi', 'name', 'Pre-Roll Ad - On Load - Skip', '2018-09-10 06:48:07', '2018-09-10 06:48:07'),
('oI9Ys62fi', 'description', 'Pre-Roll Ad - On Load', '2018-09-10 06:48:07', '2018-09-10 06:48:07'),
('oI9Ys62fi', 'branches', 'a:2:{s:6:"master";a:4:{s:19:"template_updated_at";s:24:"2018-08-30T20:21:08.336Z";s:10:"updated_at";s:24:"2018-08-14T05:59:10.818Z";s:13:"configuration";a:9:{s:6:"player";a:1:{s:8:"template";a:2:{s:7:"version";s:6:"6.22.7";s:4:"name";s:21:"single-video-template";}}s:11:"video_cloud";a:2:{s:10:"policy_key";s:144:"BCpkADawqM0Z5JvQNM7nZ74t7QiN3zVbjQOYgFIOqtPh8FLYEiPXmUugNI0BTl5FkJZ6Q0QIkDMZrVDQ6qWRDxOf_O2t5ZHx13CZO62bcZ5Arwy_7Zt5gICeyI2RRs3AJVhctHRYiPQRqulk";s:5:"video";N;}s:13:"compatibility";b:1;s:7:"plugins";a:2:{i:0;a:2:{s:7:"options";a:7:{s:11:"deeplinking";b:0;s:5:"title";s:0:"";s:11:"description";s:0:"";s:3:"url";s:0:"";s:6:"offset";s:0:"";s:8:"services";a:6:{s:8:"facebook";b:1;s:6:"google";b:1;s:7:"twitter";b:1;s:9:"pinterest";b:1;s:8:"linkedin";b:1;s:6:"tumblr";b:1;}s:17:"displayAfterVideo";b:1;}s:4:"name";s:6:"social";}i:1;a:2:{s:7:"options";a:7:{s:9:"serverUrl";s:249:"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/single_ad_samples&ciu_szs=300x250&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ct%3Dskippablelinear&correlator=";s:7:"timeout";i:4000;s:12:"hardTimeouts";b:1;s:11:"requestMode";s:6:"onload";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:9:"vpaidMode";s:7:"ENABLED";s:17:"useMediaCuePoints";b:0;}s:4:"name";s:4:"ima3";}}s:7:"scripts";a:2:{i:0;s:63:"//players.brightcove.net/videojs-social/3/videojs-social.min.js";i:1;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:11:"stylesheets";a:2:{i:0;s:60:"//players.brightcove.net/videojs-social/3/videojs-social.css";i:1;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}s:3:"css";a:3:{s:12:"controlColor";s:4:"#fff";s:15:"controlBarColor";s:19:"rgba(0, 0, 0, 0.45)";s:13:"progressColor";s:7:"#d52484";}s:4:"skin";N;s:4:"dock";b:1;}s:11:"preview_url";s:121:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/oI9Ys62fi/master/embeds/default/master/index.html";}s:7:"preview";a:4:{s:19:"template_updated_at";s:24:"2018-08-30T20:20:58.256Z";s:10:"updated_at";s:24:"2018-08-14T05:59:11.842Z";s:13:"configuration";a:9:{s:4:"dock";b:1;s:4:"skin";N;s:3:"css";a:3:{s:13:"progressColor";s:7:"#d52484";s:15:"controlBarColor";s:19:"rgba(0, 0, 0, 0.45)";s:12:"controlColor";s:4:"#fff";}s:11:"stylesheets";a:2:{i:0;s:60:"//players.brightcove.net/videojs-social/3/videojs-social.css";i:1;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}s:7:"scripts";a:2:{i:0;s:63:"//players.brightcove.net/videojs-social/3/videojs-social.min.js";i:1;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:7:"plugins";a:2:{i:0;a:2:{s:7:"options";a:7:{s:17:"displayAfterVideo";b:1;s:8:"services";a:6:{s:6:"tumblr";b:1;s:8:"linkedin";b:1;s:9:"pinterest";b:1;s:7:"twitter";b:1;s:6:"google";b:1;s:8:"facebook";b:1;}s:6:"offset";s:0:"";s:3:"url";s:0:"";s:11:"description";s:0:"";s:5:"title";s:0:"";s:11:"deeplinking";b:0;}s:4:"name";s:6:"social";}i:1;a:2:{s:7:"options";a:7:{s:17:"useMediaCuePoints";b:0;s:9:"vpaidMode";s:7:"ENABLED";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:11:"requestMode";s:6:"onload";s:12:"hardTimeouts";b:1;s:7:"timeout";i:4000;s:9:"serverUrl";s:249:"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/single_ad_samples&ciu_szs=300x250&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ct%3Dskippablelinear&correlator=";}s:4:"name";s:4:"ima3";}}s:13:"compatibility";b:1;s:11:"video_cloud";a:2:{s:5:"video";N;s:10:"policy_key";s:144:"BCpkADawqM0Z5JvQNM7nZ74t7QiN3zVbjQOYgFIOqtPh8FLYEiPXmUugNI0BTl5FkJZ6Q0QIkDMZrVDQ6qWRDxOf_O2t5ZHx13CZO62bcZ5Arwy_7Zt5gICeyI2RRs3AJVhctHRYiPQRqulk";}s:6:"player";a:1:{s:8:"template";a:2:{s:4:"name";s:21:"single-video-template";s:7:"version";s:6:"6.22.7";}}}s:11:"preview_url";s:122:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/oI9Ys62fi/preview/embeds/default/master/index.html";}}', '2018-09-10 06:48:07', '2018-09-10 06:48:07'),
('oI9Ys62fi', 'created_at', '2018-08-14T05:47:54.541Z', '2018-09-10 06:48:07', '2018-09-10 06:48:07'),
('oI9Ys62fi', 'url', 'http://players.brightcove.net/5814665417001/oI9Ys62fi_default/index.html', '2018-09-10 06:48:07', '2018-09-10 06:48:07'),
('oI9Ys62fi', 'embed_count', '1', '2018-09-10 06:48:07', '2018-09-10 06:48:07'),
('oI9Ys62fi', 'accountId', '5814665417001', '2018-09-10 06:48:07', '2018-09-10 06:48:07'),
('t96CU0JUI', 'id', 't96CU0JUI', '2018-09-10 06:48:08', '2018-09-10 06:48:08'),
('t96CU0JUI', 'name', 'Pre  / Mid / Post - On Load', '2018-09-10 06:48:08', '2018-09-10 06:48:08'),
('t96CU0JUI', 'description', '', '2018-09-10 06:48:08', '2018-09-10 06:48:08'),
('t96CU0JUI', 'branches', 'a:2:{s:6:"master";a:4:{s:19:"template_updated_at";s:24:"2018-08-30T20:21:08.336Z";s:10:"updated_at";s:24:"2018-08-14T08:47:28.308Z";s:13:"configuration";a:6:{s:7:"plugins";a:1:{i:0;a:2:{s:7:"options";a:7:{s:17:"useMediaCuePoints";b:0;s:9:"vpaidMode";s:7:"ENABLED";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:11:"requestMode";s:6:"onload";s:12:"hardTimeouts";b:1;s:7:"timeout";i:4000;s:9:"serverUrl";s:282:"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostpod&cmsid=496&vid=short_onecue&correlator=";}s:4:"name";s:4:"ima3";}}s:13:"compatibility";b:1;s:11:"video_cloud";a:2:{s:5:"video";N;s:10:"policy_key";s:144:"BCpkADawqM075RwoD8PAw8vGI9OAScJBoqwKjawxtb4RAy5X7WnPuCTEsbBdwe7kTj3nLLIfpTG8hJQoPMI42ceftbIFjbCG5myIwGupiEvM0ipr2TD8mTtu_lTVzqpZGxxO2D79r3ztImzr";}s:6:"player";a:1:{s:8:"template";a:2:{s:4:"name";s:21:"single-video-template";s:7:"version";s:6:"6.22.7";}}s:7:"scripts";a:1:{i:0;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:11:"stylesheets";a:1:{i:0;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}}s:11:"preview_url";s:121:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/t96CU0JUI/master/embeds/default/master/index.html";}s:7:"preview";a:4:{s:19:"template_updated_at";s:24:"2018-08-30T20:20:58.256Z";s:10:"updated_at";s:24:"2018-08-14T08:47:29.071Z";s:13:"configuration";a:6:{s:6:"player";a:1:{s:8:"template";a:2:{s:7:"version";s:6:"6.22.7";s:4:"name";s:21:"single-video-template";}}s:11:"video_cloud";a:2:{s:10:"policy_key";s:144:"BCpkADawqM075RwoD8PAw8vGI9OAScJBoqwKjawxtb4RAy5X7WnPuCTEsbBdwe7kTj3nLLIfpTG8hJQoPMI42ceftbIFjbCG5myIwGupiEvM0ipr2TD8mTtu_lTVzqpZGxxO2D79r3ztImzr";s:5:"video";N;}s:13:"compatibility";b:1;s:7:"plugins";a:1:{i:0;a:2:{s:7:"options";a:7:{s:9:"serverUrl";s:282:"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostpod&cmsid=496&vid=short_onecue&correlator=";s:7:"timeout";i:4000;s:12:"hardTimeouts";b:1;s:11:"requestMode";s:6:"onload";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:9:"vpaidMode";s:7:"ENABLED";s:17:"useMediaCuePoints";b:0;}s:4:"name";s:4:"ima3";}}s:7:"scripts";a:1:{i:0;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:11:"stylesheets";a:1:{i:0;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}}s:11:"preview_url";s:122:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/t96CU0JUI/preview/embeds/default/master/index.html";}}', '2018-09-10 06:48:08', '2018-09-10 06:48:08'),
('t96CU0JUI', 'created_at', '2018-08-14T08:47:08.055Z', '2018-09-10 06:48:08', '2018-09-10 06:48:08'),
('t96CU0JUI', 'url', 'http://players.brightcove.net/5814665417001/t96CU0JUI_default/index.html', '2018-09-10 06:48:08', '2018-09-10 06:48:08'),
('t96CU0JUI', 'embed_count', '1', '2018-09-10 06:48:08', '2018-09-10 06:48:08'),
('t96CU0JUI', 'accountId', '5814665417001', '2018-09-10 06:48:09', '2018-09-10 06:48:09'),
('tRMX2rkxce', 'id', 'tRMX2rkxce', '2018-09-10 06:48:09', '2018-09-10 06:48:09'),
('tRMX2rkxce', 'name', 'Post / Pre / Mid - On Cue Point', '2018-09-10 06:48:09', '2018-09-10 06:48:09'),
('tRMX2rkxce', 'description', '', '2018-09-10 06:48:09', '2018-09-10 06:48:09'),
('tRMX2rkxce', 'branches', 'a:2:{s:7:"preview";a:4:{s:13:"configuration";a:6:{s:6:"player";a:1:{s:8:"template";a:2:{s:7:"version";s:6:"6.22.7";s:4:"name";s:21:"single-video-template";}}s:11:"video_cloud";a:2:{s:10:"policy_key";s:144:"BCpkADawqM01n2-_4nIxvBma2qyKBjwSAU34rAlTK1wYe52UYzXuR8vln0nuO6YUWxZizGAabxuidXtLi3tAtgFrJxLpfpGeUkgUx3cRpLLC_Hy2sPGov6oeiA1kxWnkxSDtEMMmAS19SIfU";s:5:"video";N;}s:13:"compatibility";b:1;s:7:"plugins";a:1:{i:0;a:2:{s:7:"options";a:7:{s:9:"serverUrl";s:282:"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostpod&cmsid=496&vid=short_onecue&correlator=";s:7:"timeout";i:4000;s:12:"hardTimeouts";b:1;s:11:"requestMode";s:5:"oncue";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:9:"vpaidMode";s:7:"ENABLED";s:17:"useMediaCuePoints";b:1;}s:4:"name";s:4:"ima3";}}s:7:"scripts";a:1:{i:0;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:11:"stylesheets";a:1:{i:0;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}}s:10:"updated_at";s:24:"2018-08-14T08:46:43.560Z";s:19:"template_updated_at";s:24:"2018-08-30T20:20:58.256Z";s:11:"preview_url";s:123:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/tRMX2rkxce/preview/embeds/default/master/index.html";}s:6:"master";a:4:{s:13:"configuration";a:6:{s:6:"player";a:1:{s:8:"template";a:2:{s:7:"version";s:6:"6.22.7";s:4:"name";s:21:"single-video-template";}}s:11:"video_cloud";a:2:{s:10:"policy_key";s:144:"BCpkADawqM01n2-_4nIxvBma2qyKBjwSAU34rAlTK1wYe52UYzXuR8vln0nuO6YUWxZizGAabxuidXtLi3tAtgFrJxLpfpGeUkgUx3cRpLLC_Hy2sPGov6oeiA1kxWnkxSDtEMMmAS19SIfU";s:5:"video";N;}s:13:"compatibility";b:1;s:7:"plugins";a:1:{i:0;a:2:{s:7:"options";a:7:{s:9:"serverUrl";s:282:"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostpod&cmsid=496&vid=short_onecue&correlator=";s:7:"timeout";i:4000;s:12:"hardTimeouts";b:1;s:11:"requestMode";s:5:"oncue";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:9:"vpaidMode";s:7:"ENABLED";s:17:"useMediaCuePoints";b:1;}s:4:"name";s:4:"ima3";}}s:7:"scripts";a:1:{i:0;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";}s:11:"stylesheets";a:1:{i:0;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";}}s:10:"updated_at";s:24:"2018-08-14T08:46:42.466Z";s:19:"template_updated_at";s:24:"2018-08-30T20:21:08.336Z";s:11:"preview_url";s:122:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/tRMX2rkxce/master/embeds/default/master/index.html";}}', '2018-09-10 06:48:09', '2018-09-10 06:48:09'),
('tRMX2rkxce', 'created_at', '2018-08-14T08:40:44.979Z', '2018-09-10 06:48:10', '2018-09-10 06:48:10'),
('tRMX2rkxce', 'url', 'http://players.brightcove.net/5814665417001/tRMX2rkxce_default/index.html', '2018-09-10 06:48:10', '2018-09-10 06:48:10'),
('tRMX2rkxce', 'embed_count', '1', '2018-09-10 06:48:10', '2018-09-10 06:48:10'),
('tRMX2rkxce', 'accountId', '5814665417001', '2018-09-10 06:48:10', '2018-09-10 06:48:10'),
('default', 'id', 'default', '2018-10-04 02:19:33', '2018-10-04 02:19:33'),
('default', 'name', 'Default', '2018-10-04 02:19:33', '2018-10-04 02:19:33'),
('default', 'description', 'This is an instance of the Brightcove Default Player.  You can modify this or choose to create your own.', '2018-10-04 02:19:34', '2018-10-04 02:19:34'),
('default', 'branches', 'a:2:{s:7:"preview";a:4:{s:13:"configuration";a:13:{s:11:"autoadvance";N;s:20:"studio_configuration";a:1:{s:6:"player";a:4:{s:8:"adjusted";b:1;s:6:"height";i:500;s:5:"width";i:1000;s:10:"responsive";b:0;}}s:17:"fullscreenControl";b:1;s:8:"autoplay";b:0;s:7:"preload";s:8:"metadata";s:2:"id";s:7:"default";s:8:"playlist";b:1;s:11:"stylesheets";a:2:{i:0;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";i:1;s:60:"//players.brightcove.net/videojs-social/3/videojs-social.css";}s:7:"scripts";a:2:{i:0;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";i:1;s:63:"//players.brightcove.net/videojs-social/3/videojs-social.min.js";}s:7:"plugins";a:2:{i:0;a:2:{s:7:"options";a:8:{s:5:"debug";b:1;s:9:"serverUrl";s:76:"https://solutions.brightcove.com/bcls/brightcove-player/vmap/simple-vast.xml";s:7:"timeout";i:4000;s:12:"hardTimeouts";b:1;s:11:"requestMode";s:6:"onload";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:9:"vpaidMode";s:7:"ENABLED";s:17:"useMediaCuePoints";b:0;}s:4:"name";s:4:"ima3";}i:1;a:2:{s:7:"options";a:6:{s:8:"services";a:6:{s:6:"tumblr";b:1;s:8:"linkedin";b:1;s:9:"pinterest";b:1;s:7:"twitter";b:1;s:6:"google";b:1;s:8:"facebook";b:1;}s:6:"offset";s:0:"";s:3:"url";s:0:"";s:11:"description";s:0:"";s:5:"title";s:0:"";s:11:"deeplinking";b:0;}s:4:"name";s:6:"social";}}s:13:"compatibility";b:1;s:11:"video_cloud";a:1:{s:10:"policy_key";s:144:"BCpkADawqM1iixelIj-0MIQMwqT_Ao15-xjQCUPkR58CufdeDJ7f2D9KFiyEPQ8dUQpddNmxvezZeDDucgOuqancYnny_frTsUnRalHp0BrNaM5RJ9sxoMkqccTxWmpnNB3xs53GU28ZM0BD";}s:6:"player";a:2:{s:8:"inactive";b:0;s:8:"template";a:4:{s:13:"version_alias";N;s:6:"locked";b:0;s:4:"name";s:21:"single-video-template";s:7:"version";s:6:"6.24.1";}}}s:10:"updated_at";s:24:"2018-09-10T12:46:12.201Z";s:19:"template_updated_at";s:24:"2018-09-19T13:53:34.436Z";s:11:"preview_url";s:120:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/default/preview/embeds/default/master/index.html";}s:6:"master";a:4:{s:13:"configuration";a:13:{s:6:"player";a:2:{s:8:"template";a:4:{s:7:"version";s:6:"6.24.1";s:4:"name";s:21:"single-video-template";s:6:"locked";b:0;s:13:"version_alias";N;}s:8:"inactive";b:0;}s:11:"video_cloud";a:1:{s:10:"policy_key";s:144:"BCpkADawqM1iixelIj-0MIQMwqT_Ao15-xjQCUPkR58CufdeDJ7f2D9KFiyEPQ8dUQpddNmxvezZeDDucgOuqancYnny_frTsUnRalHp0BrNaM5RJ9sxoMkqccTxWmpnNB3xs53GU28ZM0BD";}s:13:"compatibility";b:1;s:7:"plugins";a:2:{i:0;a:2:{s:7:"options";a:8:{s:17:"useMediaCuePoints";b:0;s:9:"vpaidMode";s:7:"ENABLED";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:11:"requestMode";s:6:"onload";s:12:"hardTimeouts";b:1;s:7:"timeout";i:4000;s:9:"serverUrl";s:76:"https://solutions.brightcove.com/bcls/brightcove-player/vmap/simple-vast.xml";s:5:"debug";b:1;}s:4:"name";s:4:"ima3";}i:1;a:2:{s:7:"options";a:6:{s:11:"deeplinking";b:0;s:5:"title";s:0:"";s:11:"description";s:0:"";s:3:"url";s:0:"";s:6:"offset";s:0:"";s:8:"services";a:6:{s:8:"facebook";b:1;s:6:"google";b:1;s:7:"twitter";b:1;s:9:"pinterest";b:1;s:8:"linkedin";b:1;s:6:"tumblr";b:1;}}s:4:"name";s:6:"social";}}s:7:"scripts";a:2:{i:0;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";i:1;s:63:"//players.brightcove.net/videojs-social/3/videojs-social.min.js";}s:11:"stylesheets";a:2:{i:0;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";i:1;s:60:"//players.brightcove.net/videojs-social/3/videojs-social.css";}s:8:"playlist";b:1;s:2:"id";s:7:"default";s:7:"preload";s:8:"metadata";s:8:"autoplay";b:0;s:17:"fullscreenControl";b:1;s:20:"studio_configuration";a:1:{s:6:"player";a:4:{s:10:"responsive";b:0;s:5:"width";i:1000;s:6:"height";i:500;s:8:"adjusted";b:1;}}s:11:"autoadvance";N;}s:10:"updated_at";s:24:"2018-09-10T12:46:11.427Z";s:19:"template_updated_at";s:24:"2018-09-19T13:53:39.567Z";s:11:"preview_url";s:119:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/default/master/embeds/default/master/index.html";}}', '2018-10-04 02:19:34', '2018-10-04 02:19:34'),
('default', 'created_at', '2018-08-13T12:41:13.175Z', '2018-10-04 02:19:34', '2018-10-04 02:19:34'),
('default', 'url', 'http://players.brightcove.net/5814665417001/default_default/index.html', '2018-10-04 02:19:34', '2018-10-04 02:19:34'),
('default', 'embed_count', '1', '2018-10-04 02:19:34', '2018-10-04 02:19:34'),
('default', 'accountId', '5814665417001', '2018-10-04 02:19:34', '2018-10-04 02:19:34'),
('iGAicgqoE9', 'id', 'iGAicgqoE9', '2018-10-04 02:19:34', '2018-10-04 02:19:34'),
('iGAicgqoE9', 'name', 'Pre-Roll Ad - On Load - Without Skip', '2018-10-04 02:19:34', '2018-10-04 02:19:34'),
('iGAicgqoE9', 'description', 'Pre-Roll Ad - On Load - Without Skip', '2018-10-04 02:19:34', '2018-10-04 02:19:34');
INSERT INTO `mm_player_metas` (`player_id`, `meta_key`, `meta_value`, `created_at`, `updated_at`) VALUES
('iGAicgqoE9', 'branches', 'a:2:{s:6:"master";a:4:{s:19:"template_updated_at";s:24:"2018-09-19T13:53:39.567Z";s:10:"updated_at";s:24:"2018-10-01T09:32:58.478Z";s:13:"configuration";a:16:{s:4:"skin";N;s:4:"dock";b:0;s:3:"css";a:3:{s:13:"progressColor";s:7:"#d52484";s:15:"controlBarColor";s:19:"rgba(0, 0, 0, 0.45)";s:12:"controlColor";s:4:"#fff";}s:6:"player";a:2:{s:8:"template";a:4:{s:7:"version";s:6:"6.24.1";s:4:"name";s:21:"single-video-template";s:6:"locked";b:0;s:13:"version_alias";N;}s:8:"inactive";b:0;}s:11:"video_cloud";a:2:{s:10:"policy_key";s:144:"BCpkADawqM2G8ohoqYCsuhgErbjXN5r3P-dHF1L76n5RIrHQMDL_8OT_YdWyoaek9iSnRCg_1W8KLy33_G69aD6qhKLJYEFedEHtO0UeE_mGzG9isd8yaW20aI_kzn-KVPyazm1S0mQbn9o6";s:5:"video";N;}s:13:"compatibility";b:1;s:7:"plugins";a:4:{i:0;a:2:{s:7:"options";a:7:{s:9:"serverUrl";s:76:"https://solutions.brightcove.com/bcls/brightcove-player/vmap/simple-vast.xml";s:7:"timeout";i:4000;s:12:"hardTimeouts";b:1;s:11:"requestMode";s:6:"onload";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:9:"vpaidMode";s:7:"ENABLED";s:17:"useMediaCuePoints";b:0;}s:4:"name";s:4:"ima3";}i:1;a:2:{s:7:"options";a:1:{s:19:"useResolutionLabels";b:1;}s:4:"name";s:11:"qualityMenu";}i:2;a:2:{s:7:"options";a:6:{s:11:"deeplinking";b:1;s:5:"title";s:0:"";s:11:"description";s:0:"";s:3:"url";s:0:"";s:6:"offset";s:0:"";s:8:"services";a:6:{s:8:"facebook";b:1;s:6:"google";b:1;s:7:"twitter";b:1;s:9:"pinterest";b:1;s:8:"linkedin";b:1;s:6:"tumblr";b:1;}}s:4:"name";s:6:"social";}i:3;a:2:{s:7:"options";a:7:{s:11:"autoadvance";i:0;s:10:"nextButton";b:1;s:13:"nextEndscreen";b:0;s:11:"nextOverlay";b:0;s:12:"playOnSelect";b:1;s:6:"repeat";b:0;s:7:"shuffle";b:0;}s:4:"name";s:12:"bcPlaylistUi";}}s:7:"scripts";a:4:{i:0;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";i:1;s:75:"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.min.js";i:2;s:63:"//players.brightcove.net/videojs-social/3/videojs-social.min.js";i:3;s:79:"//players.brightcove.net/videojs-bc-playlist-ui/3/videojs-bc-playlist-ui.min.js";}s:11:"stylesheets";a:4:{i:0;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";i:1;s:72:"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.css";i:2;s:60:"//players.brightcove.net/videojs-social/3/videojs-social.css";i:3;s:76:"//players.brightcove.net/videojs-bc-playlist-ui/3/videojs-bc-playlist-ui.css";}s:2:"id";s:10:"iGAicgqoE9";s:7:"preload";s:4:"auto";s:8:"autoplay";b:0;s:17:"fullscreenControl";b:1;s:20:"studio_configuration";a:1:{s:6:"player";a:4:{s:10:"responsive";b:1;s:5:"width";i:300;s:6:"height";i:150;s:8:"adjusted";b:1;}}s:11:"autoadvance";i:0;s:8:"playlist";b:1;}s:11:"preview_url";s:122:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/iGAicgqoE9/master/embeds/default/master/index.html";}s:7:"preview";a:4:{s:19:"template_updated_at";s:24:"2018-09-19T13:53:34.436Z";s:10:"updated_at";s:24:"2018-10-01T09:32:59.650Z";s:13:"configuration";a:16:{s:8:"playlist";b:1;s:11:"autoadvance";i:0;s:20:"studio_configuration";a:1:{s:6:"player";a:4:{s:8:"adjusted";b:1;s:6:"height";i:150;s:5:"width";i:300;s:10:"responsive";b:1;}}s:17:"fullscreenControl";b:1;s:8:"autoplay";b:0;s:7:"preload";s:4:"auto";s:2:"id";s:10:"iGAicgqoE9";s:11:"stylesheets";a:4:{i:0;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";i:1;s:72:"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.css";i:2;s:60:"//players.brightcove.net/videojs-social/3/videojs-social.css";i:3;s:76:"//players.brightcove.net/videojs-bc-playlist-ui/3/videojs-bc-playlist-ui.css";}s:7:"scripts";a:4:{i:0;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";i:1;s:75:"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.min.js";i:2;s:63:"//players.brightcove.net/videojs-social/3/videojs-social.min.js";i:3;s:79:"//players.brightcove.net/videojs-bc-playlist-ui/3/videojs-bc-playlist-ui.min.js";}s:7:"plugins";a:4:{i:0;a:2:{s:7:"options";a:7:{s:17:"useMediaCuePoints";b:0;s:9:"vpaidMode";s:7:"ENABLED";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:11:"requestMode";s:6:"onload";s:12:"hardTimeouts";b:1;s:7:"timeout";i:4000;s:9:"serverUrl";s:76:"https://solutions.brightcove.com/bcls/brightcove-player/vmap/simple-vast.xml";}s:4:"name";s:4:"ima3";}i:1;a:2:{s:7:"options";a:1:{s:19:"useResolutionLabels";b:1;}s:4:"name";s:11:"qualityMenu";}i:2;a:2:{s:7:"options";a:6:{s:8:"services";a:6:{s:6:"tumblr";b:1;s:8:"linkedin";b:1;s:9:"pinterest";b:1;s:7:"twitter";b:1;s:6:"google";b:1;s:8:"facebook";b:1;}s:6:"offset";s:0:"";s:3:"url";s:0:"";s:11:"description";s:0:"";s:5:"title";s:0:"";s:11:"deeplinking";b:1;}s:4:"name";s:6:"social";}i:3;a:2:{s:7:"options";a:7:{s:7:"shuffle";b:0;s:6:"repeat";b:0;s:12:"playOnSelect";b:1;s:11:"nextOverlay";b:0;s:13:"nextEndscreen";b:0;s:10:"nextButton";b:1;s:11:"autoadvance";i:0;}s:4:"name";s:12:"bcPlaylistUi";}}s:13:"compatibility";b:1;s:11:"video_cloud";a:2:{s:5:"video";N;s:10:"policy_key";s:144:"BCpkADawqM2G8ohoqYCsuhgErbjXN5r3P-dHF1L76n5RIrHQMDL_8OT_YdWyoaek9iSnRCg_1W8KLy33_G69aD6qhKLJYEFedEHtO0UeE_mGzG9isd8yaW20aI_kzn-KVPyazm1S0mQbn9o6";}s:6:"player";a:2:{s:8:"inactive";b:0;s:8:"template";a:4:{s:13:"version_alias";N;s:6:"locked";b:0;s:4:"name";s:21:"single-video-template";s:7:"version";s:6:"6.24.1";}}s:3:"css";a:3:{s:12:"controlColor";s:4:"#fff";s:15:"controlBarColor";s:19:"rgba(0, 0, 0, 0.45)";s:13:"progressColor";s:7:"#d52484";}s:4:"dock";b:0;s:4:"skin";N;}s:11:"preview_url";s:123:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/iGAicgqoE9/preview/embeds/default/master/index.html";}}', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('iGAicgqoE9', 'created_at', '2018-08-14T06:02:58.385Z', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('iGAicgqoE9', 'url', 'http://players.brightcove.net/5814665417001/iGAicgqoE9_default/index.html', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('iGAicgqoE9', 'embed_count', '1', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('iGAicgqoE9', 'accountId', '5814665417001', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('k089Hf8le8', 'id', 'k089Hf8le8', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('k089Hf8le8', 'name', 'On Cue Point Ads 1', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('k089Hf8le8', 'description', '', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('k089Hf8le8', 'branches', 'a:2:{s:7:"preview";a:4:{s:13:"configuration";a:14:{s:11:"autoadvance";N;s:20:"studio_configuration";a:1:{s:6:"player";a:4:{s:8:"adjusted";b:1;s:6:"height";i:150;s:5:"width";i:300;s:10:"responsive";b:1;}}s:17:"fullscreenControl";b:1;s:8:"autoplay";b:0;s:7:"preload";s:8:"metadata";s:2:"id";s:10:"k089Hf8le8";s:11:"stylesheets";a:2:{i:0;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";i:1;s:68:"https://players.brightcove.net/videojs-overlay/2/videojs-overlay.css";}s:7:"scripts";a:2:{i:0;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";i:1;s:71:"https://players.brightcove.net/videojs-overlay/2/videojs-overlay.min.js";}s:7:"plugins";a:3:{i:0;a:2:{s:4:"name";s:7:"overlay";s:7:"options";a:1:{s:8:"overlays";a:1:{i:0;a:2:{s:5:"align";s:6:"bottom";s:5:"start";s:4:"play";}}}}i:1;a:2:{s:7:"options";a:7:{s:9:"serverUrl";s:76:"https://solutions.brightcove.com/bcls/brightcove-player/vmap/simple-vast.xml";s:7:"timeout";i:4000;s:12:"hardTimeouts";b:1;s:11:"requestMode";s:5:"oncue";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:9:"vpaidMode";s:7:"ENABLED";s:17:"useMediaCuePoints";b:1;}s:4:"name";s:4:"ima3";}i:2;a:2:{s:4:"name";s:6:"social";s:7:"options";a:1:{s:8:"services";a:6:{s:8:"facebook";b:1;s:6:"google";b:1;s:7:"twitter";b:1;s:6:"tumblr";b:1;s:9:"pinterest";b:1;s:8:"linkedin";b:1;}}}}s:13:"compatibility";b:1;s:11:"video_cloud";a:2:{s:5:"video";N;s:10:"policy_key";s:144:"BCpkADawqM3k-MPdWFHkl0q3hevB5udEkDacgFrSD68JYzOn3BbxMun7iGG8N7_fbFKqsJl5YTqMpZ6VMStQ5nvsNmQ0YnuJ9LDqgqr5itf99JcIBMKrNp1Ac7lXq9BwsqfQiqSpZlZTm7ZD";}s:6:"player";a:2:{s:8:"inactive";b:0;s:8:"template";a:4:{s:13:"version_alias";N;s:6:"locked";b:0;s:4:"name";s:21:"single-video-template";s:7:"version";s:6:"6.24.1";}}s:3:"css";a:3:{s:12:"controlColor";s:4:"#fff";s:15:"controlBarColor";s:19:"rgba(0, 0, 0, 0.45)";s:13:"progressColor";s:7:"#d52484";}s:4:"dock";b:0;}s:10:"updated_at";s:24:"2018-09-27T09:06:01.373Z";s:19:"template_updated_at";s:24:"2018-09-19T13:53:34.436Z";s:11:"preview_url";s:123:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/k089Hf8le8/preview/embeds/default/master/index.html";}s:6:"master";a:4:{s:13:"configuration";a:14:{s:4:"dock";b:0;s:3:"css";a:3:{s:13:"progressColor";s:7:"#d52484";s:15:"controlBarColor";s:19:"rgba(0, 0, 0, 0.45)";s:12:"controlColor";s:4:"#fff";}s:6:"player";a:2:{s:8:"template";a:4:{s:7:"version";s:6:"6.24.1";s:4:"name";s:21:"single-video-template";s:6:"locked";b:0;s:13:"version_alias";N;}s:8:"inactive";b:0;}s:11:"video_cloud";a:2:{s:10:"policy_key";s:144:"BCpkADawqM3k-MPdWFHkl0q3hevB5udEkDacgFrSD68JYzOn3BbxMun7iGG8N7_fbFKqsJl5YTqMpZ6VMStQ5nvsNmQ0YnuJ9LDqgqr5itf99JcIBMKrNp1Ac7lXq9BwsqfQiqSpZlZTm7ZD";s:5:"video";N;}s:13:"compatibility";b:1;s:7:"plugins";a:3:{i:0;a:2:{s:7:"options";a:1:{s:8:"overlays";a:1:{i:0;a:2:{s:5:"start";s:4:"play";s:5:"align";s:6:"bottom";}}}s:4:"name";s:7:"overlay";}i:1;a:2:{s:7:"options";a:7:{s:17:"useMediaCuePoints";b:1;s:9:"vpaidMode";s:7:"ENABLED";s:11:"adTechOrder";a:1:{i:0;s:5:"html5";}s:11:"requestMode";s:5:"oncue";s:12:"hardTimeouts";b:1;s:7:"timeout";i:4000;s:9:"serverUrl";s:76:"https://solutions.brightcove.com/bcls/brightcove-player/vmap/simple-vast.xml";}s:4:"name";s:4:"ima3";}i:2;a:2:{s:7:"options";a:1:{s:8:"services";a:6:{s:8:"linkedin";b:1;s:9:"pinterest";b:1;s:6:"tumblr";b:1;s:7:"twitter";b:1;s:6:"google";b:1;s:8:"facebook";b:1;}}s:4:"name";s:6:"social";}}s:7:"scripts";a:2:{i:0;s:59:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.js";i:1;s:71:"https://players.brightcove.net/videojs-overlay/2/videojs-overlay.min.js";}s:11:"stylesheets";a:2:{i:0;s:60:"//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css";i:1;s:68:"https://players.brightcove.net/videojs-overlay/2/videojs-overlay.css";}s:2:"id";s:10:"k089Hf8le8";s:7:"preload";s:8:"metadata";s:8:"autoplay";b:0;s:17:"fullscreenControl";b:1;s:20:"studio_configuration";a:1:{s:6:"player";a:4:{s:10:"responsive";b:1;s:5:"width";i:300;s:6:"height";i:150;s:8:"adjusted";b:1;}}s:11:"autoadvance";N;}s:10:"updated_at";s:24:"2018-09-27T09:06:00.374Z";s:19:"template_updated_at";s:24:"2018-09-19T13:53:39.568Z";s:11:"preview_url";s:122:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/k089Hf8le8/master/embeds/default/master/index.html";}}', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('k089Hf8le8', 'created_at', '2018-08-14T06:25:44.243Z', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('k089Hf8le8', 'url', 'http://players.brightcove.net/5814665417001/k089Hf8le8_default/index.html', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('k089Hf8le8', 'embed_count', '1', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('k089Hf8le8', 'accountId', '5814665417001', '2018-10-04 02:19:35', '2018-10-04 02:19:35'),
('oNgLTdNCH', 'id', 'oNgLTdNCH', '2018-10-04 02:19:36', '2018-10-04 02:19:36'),
('oNgLTdNCH', 'name', '[Matt] Test Player', '2018-10-04 02:19:36', '2018-10-04 02:19:36'),
('oNgLTdNCH', 'description', '', '2018-10-04 02:19:36', '2018-10-04 02:19:36'),
('oNgLTdNCH', 'branches', 'a:2:{s:7:"preview";a:4:{s:13:"configuration";a:15:{s:7:"plugins";a:3:{i:0;a:2:{s:4:"name";s:6:"social";s:7:"options";a:7:{s:8:"services";a:6:{s:6:"tumblr";b:1;s:8:"linkedin";b:1;s:9:"pinterest";b:1;s:7:"twitter";b:1;s:6:"google";b:1;s:8:"facebook";b:1;}s:6:"offset";s:0:"";s:3:"url";s:0:"";s:11:"description";s:0:"";s:5:"title";s:0:"";s:11:"removeEmbed";b:1;s:11:"deeplinking";b:0;}}i:1;a:2:{s:7:"options";a:1:{s:19:"useResolutionLabels";b:1;}s:4:"name";s:11:"qualityMenu";}i:2;a:2:{s:7:"options";a:7:{s:11:"autoadvance";i:0;s:10:"nextButton";b:1;s:13:"nextEndscreen";b:0;s:11:"nextOverlay";b:0;s:12:"playOnSelect";b:1;s:6:"repeat";b:0;s:7:"shuffle";b:0;}s:4:"name";s:12:"bcPlaylistUi";}}s:13:"compatibility";b:1;s:11:"video_cloud";a:2:{s:5:"video";N;s:10:"policy_key";s:144:"BCpkADawqM21OjL40eYRAumWO28Mldv3idXUDZSNXUtcpZmxTERgU416CalBouPam5ETDD1CRggSB58JFnxjVEe-M1sqc6mws_96qCp7Fh8juvTx1eywz-4TI4iVDxMGLkVk6lCcb-essvxQ";}s:6:"player";a:2:{s:8:"template";a:4:{s:4:"name";s:21:"single-video-template";s:7:"version";s:6:"6.24.1";s:6:"locked";b:0;s:13:"version_alias";N;}s:8:"inactive";b:0;}s:7:"scripts";a:3:{i:0;s:75:"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.min.js";i:1;s:79:"//players.brightcove.net/videojs-bc-playlist-ui/3/videojs-bc-playlist-ui.min.js";i:2;s:63:"//players.brightcove.net/videojs-social/3/videojs-social.min.js";}s:11:"stylesheets";a:3:{i:0;s:72:"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.css";i:1;s:76:"//players.brightcove.net/videojs-bc-playlist-ui/3/videojs-bc-playlist-ui.css";i:2;s:49:"http://webstandout.com.au/frontend/css/social.css";}s:3:"css";a:3:{s:12:"controlColor";s:4:"#fff";s:15:"controlBarColor";s:19:"rgba(0, 0, 0, 0.45)";s:13:"progressColor";s:7:"#d52484";}s:4:"dock";b:1;s:2:"id";s:9:"oNgLTdNCH";s:7:"preload";s:8:"metadata";s:8:"autoplay";b:0;s:17:"fullscreenControl";b:1;s:20:"studio_configuration";a:1:{s:6:"player";a:4:{s:5:"width";i:1160;s:6:"height";i:653;s:8:"adjusted";b:1;s:10:"responsive";b:1;}}s:11:"autoadvance";i:0;s:8:"playlist";b:1;}s:10:"updated_at";s:24:"2018-10-03T13:51:55.549Z";s:19:"template_updated_at";s:24:"2018-09-26T07:06:12.049Z";s:11:"preview_url";s:122:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/oNgLTdNCH/preview/embeds/default/master/index.html";}s:6:"master";a:4:{s:13:"configuration";a:15:{s:8:"playlist";b:1;s:11:"autoadvance";i:0;s:20:"studio_configuration";a:1:{s:6:"player";a:4:{s:10:"responsive";b:1;s:8:"adjusted";b:1;s:6:"height";i:653;s:5:"width";i:1160;}}s:17:"fullscreenControl";b:1;s:8:"autoplay";b:0;s:7:"preload";s:8:"metadata";s:2:"id";s:9:"oNgLTdNCH";s:4:"dock";b:1;s:3:"css";a:3:{s:13:"progressColor";s:7:"#d52484";s:15:"controlBarColor";s:19:"rgba(0, 0, 0, 0.45)";s:12:"controlColor";s:4:"#fff";}s:11:"stylesheets";a:3:{i:0;s:72:"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.css";i:1;s:76:"//players.brightcove.net/videojs-bc-playlist-ui/3/videojs-bc-playlist-ui.css";i:2;s:49:"http://webstandout.com.au/frontend/css/social.css";}s:7:"scripts";a:3:{i:0;s:75:"//players.brightcove.net/videojs-quality-menu/1/videojs-quality-menu.min.js";i:1;s:79:"//players.brightcove.net/videojs-bc-playlist-ui/3/videojs-bc-playlist-ui.min.js";i:2;s:63:"//players.brightcove.net/videojs-social/3/videojs-social.min.js";}s:6:"player";a:2:{s:8:"inactive";b:0;s:8:"template";a:4:{s:13:"version_alias";N;s:6:"locked";b:0;s:7:"version";s:6:"6.24.1";s:4:"name";s:21:"single-video-template";}}s:11:"video_cloud";a:2:{s:10:"policy_key";s:144:"BCpkADawqM21OjL40eYRAumWO28Mldv3idXUDZSNXUtcpZmxTERgU416CalBouPam5ETDD1CRggSB58JFnxjVEe-M1sqc6mws_96qCp7Fh8juvTx1eywz-4TI4iVDxMGLkVk6lCcb-essvxQ";s:5:"video";N;}s:13:"compatibility";b:1;s:7:"plugins";a:3:{i:0;a:2:{s:7:"options";a:7:{s:11:"deeplinking";b:0;s:11:"removeEmbed";b:1;s:5:"title";s:0:"";s:11:"description";s:0:"";s:3:"url";s:0:"";s:6:"offset";s:0:"";s:8:"services";a:6:{s:8:"facebook";b:1;s:6:"google";b:1;s:7:"twitter";b:1;s:9:"pinterest";b:1;s:8:"linkedin";b:1;s:6:"tumblr";b:1;}}s:4:"name";s:6:"social";}i:1;a:2:{s:7:"options";a:1:{s:19:"useResolutionLabels";b:1;}s:4:"name";s:11:"qualityMenu";}i:2;a:2:{s:7:"options";a:7:{s:7:"shuffle";b:0;s:6:"repeat";b:0;s:12:"playOnSelect";b:1;s:11:"nextOverlay";b:0;s:13:"nextEndscreen";b:0;s:10:"nextButton";b:1;s:11:"autoadvance";i:0;}s:4:"name";s:12:"bcPlaylistUi";}}}s:10:"updated_at";s:24:"2018-10-03T13:51:54.669Z";s:19:"template_updated_at";s:24:"2018-09-26T07:06:12.058Z";s:11:"preview_url";s:121:"http://preview-players.brightcove.net/v2/accounts/5814665417001/players/oNgLTdNCH/master/embeds/default/master/index.html";}}', '2018-10-04 02:19:36', '2018-10-04 02:19:36'),
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
(5824129873001, 'Property Talks', 'property-talks', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(5857190770001, 'SWP', 'swp', '2018-11-12 02:48:05', '2018-11-12 02:48:05'),
(5857193402001, 'Family Floater Policy', 'family-floater-policy', '2018-11-12 02:47:58', '2018-11-12 02:47:58'),
(5857193403001, 'Investor Expectations', 'investor-expectations', '2018-11-12 02:47:54', '2018-11-12 02:47:54'),
(5857193404001, 'Portfolio', 'portfolio', '2018-11-12 02:51:06', '2018-11-12 02:51:06'),
(5857197735001, 'Compunding', 'compunding', '2018-11-12 02:48:03', '2018-11-12 02:48:03'),
(5857274617001, 'Property', 'property', '2018-11-12 02:48:09', '2018-11-12 02:48:09'),
(5857311932001, 'Inflation', 'inflation', '2018-11-12 02:48:01', '2018-11-12 02:48:01'),
(5857351264001, 'Saving', 'saving', '2018-11-12 02:48:00', '2018-11-12 02:48:00'),
(5857351266001, 'Retirement', 'retirement', '2018-11-12 02:47:53', '2018-11-12 02:47:53'),
(5857351267001, 'Dividend Plans', 'dividend-plans', '2018-11-12 02:47:50', '2018-11-12 02:47:50'),
(5857393978001, 'STP', 'stp', '2018-11-12 02:48:06', '2018-11-12 02:48:06'),
(5857393979001, 'Financial Plan', 'financial-plan', '2018-11-12 02:48:04', '2018-11-12 02:48:04'),
(5857393981001, 'ULIPs', 'ulips', '2018-11-12 02:48:00', '2018-11-12 02:48:00'),
(5857393983001, 'Volatile Market', 'volatile-market', '2018-11-12 02:47:53', '2018-11-12 02:47:53'),
(5857399103001, 'PPF', 'ppf', '2018-11-12 02:48:07', '2018-11-12 02:48:07'),
(5857399104001, 'Stock Market', 'stock-market', '2018-11-12 02:47:52', '2018-11-12 02:47:52'),
(5857645389001, 'Group Cover', 'group-cover', '2018-11-12 02:47:57', '2018-11-12 02:47:57'),
(5857645390001, 'Term Cover', 'term-cover', '2018-11-12 02:47:56', '2018-11-12 02:47:56'),
(5857645391001, 'Top Up', 'top-up', '2018-11-12 02:47:55', '2018-11-12 02:47:55'),
(5857645392001, 'Critical Illness', 'critical-illness', '2018-11-12 02:47:54', '2018-11-12 02:47:54');

-- --------------------------------------------------------

--
-- Table structure for table `mm_playlist_metas`
--

CREATE TABLE `mm_playlist_metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `playlist_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
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
(10, 5824129872001, 'video_ids', 'a:5:{i:0;s:13:"5832976243001";i:1;s:13:"5832962384001";i:2;s:13:"5832974497001";i:3;s:13:"5832976578001";i:4;s:13:"5832970611001";}', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(11, 5824129873001, 'id', '5824129873001', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(12, 5824129873001, 'account_id', '5814665417001', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(13, 5824129873001, 'created_at', '2018-08-20T12:27:05.194Z', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(14, 5824129873001, 'description', 'Property Talks', '2018-09-10 06:47:48', '2018-09-10 06:47:48'),
(15, 5824129873001, 'favorite', '1', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(16, 5824129873001, 'name', 'Property Talks', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(17, 5824129873001, 'reference_id', 'Property-Talks', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(18, 5824129873001, 'type', 'EXPLICIT', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(19, 5824129873001, 'updated_at', '2018-09-10T12:13:43.560Z', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
(20, 5824129873001, 'video_ids', 'a:5:{i:0;s:13:"5832976243001";i:1;s:13:"5832962384001";i:2;s:13:"5832974497001";i:3;s:13:"5832976578001";i:4;s:13:"5832970611001";}', '2018-09-10 06:47:49', '2018-09-10 06:47:49'),
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
(41, 5823927995001, 'search', 'tags:"animals","birds"', '2018-09-10 06:47:50', '2018-09-10 06:47:50'),
(42, 5857351267001, 'id', '5857351267001', '2018-11-12 02:47:50', '2018-11-12 02:47:50'),
(43, 5857351267001, 'account_id', '5814665417001', '2018-11-12 02:47:50', '2018-11-12 02:47:50'),
(44, 5857351267001, 'created_at', '2018-11-05T06:59:29.639Z', '2018-11-12 02:47:50', '2018-11-12 02:47:50'),
(45, 5857351267001, 'updated_at', '2018-11-05T06:59:29.639Z', '2018-11-12 02:47:50', '2018-11-12 02:47:50'),
(46, 5857351267001, 'description', 'Dividend Plans', '2018-11-12 02:47:50', '2018-11-12 02:47:50'),
(47, 5857351267001, 'favorite', '1', '2018-11-12 02:47:51', '2018-11-12 02:47:51'),
(48, 5857351267001, 'name', 'Dividend Plans', '2018-11-12 02:47:51', '2018-11-12 02:47:51'),
(49, 5857351267001, 'reference_id', 'Dividend-Plans', '2018-11-12 02:47:51', '2018-11-12 02:47:51'),
(50, 5857351267001, 'type', 'EXPLICIT', '2018-11-12 02:47:51', '2018-11-12 02:47:51'),
(51, 5857351267001, 'video_ids', 'a:0:{}', '2018-11-12 02:47:51', '2018-11-12 02:47:51'),
(62, 5857399104001, 'id', '5857399104001', '2018-11-12 02:47:52', '2018-11-12 02:47:52'),
(63, 5857399104001, 'account_id', '5814665417001', '2018-11-12 02:47:52', '2018-11-12 02:47:52'),
(64, 5857399104001, 'created_at', '2018-11-05T06:58:13.458Z', '2018-11-12 02:47:52', '2018-11-12 02:47:52'),
(65, 5857399104001, 'updated_at', '2018-11-05T06:58:34.471Z', '2018-11-12 02:47:52', '2018-11-12 02:47:52'),
(66, 5857399104001, 'description', 'Stock Market', '2018-11-12 02:47:52', '2018-11-12 02:47:52'),
(67, 5857399104001, 'favorite', '0', '2018-11-12 02:47:52', '2018-11-12 02:47:52'),
(68, 5857399104001, 'name', 'Stock Market', '2018-11-12 02:47:52', '2018-11-12 02:47:52'),
(69, 5857399104001, 'reference_id', 'Stock-Market', '2018-11-12 02:47:52', '2018-11-12 02:47:52'),
(70, 5857399104001, 'type', 'EXPLICIT', '2018-11-12 02:47:52', '2018-11-12 02:47:52'),
(71, 5857399104001, 'video_ids', 'a:0:{}', '2018-11-12 02:47:52', '2018-11-12 02:47:52'),
(72, 5857351266001, 'id', '5857351266001', '2018-11-12 02:47:53', '2018-11-12 02:47:53'),
(73, 5857351266001, 'account_id', '5814665417001', '2018-11-12 02:47:53', '2018-11-12 02:47:53'),
(74, 5857351266001, 'created_at', '2018-11-05T06:58:04.521Z', '2018-11-12 02:47:53', '2018-11-12 02:47:53'),
(75, 5857351266001, 'updated_at', '2018-11-05T06:58:04.521Z', '2018-11-12 02:47:53', '2018-11-12 02:47:53'),
(76, 5857351266001, 'description', 'Retirement', '2018-11-12 02:47:53', '2018-11-12 02:47:53'),
(77, 5857351266001, 'favorite', '1', '2018-11-12 02:47:53', '2018-11-12 02:47:53'),
(78, 5857351266001, 'name', 'Retirement', '2018-11-12 02:47:53', '2018-11-12 02:47:53'),
(79, 5857351266001, 'reference_id', 'Retirement', '2018-11-12 02:47:53', '2018-11-12 02:47:53'),
(80, 5857351266001, 'type', 'EXPLICIT', '2018-11-12 02:47:53', '2018-11-12 02:47:53'),
(81, 5857351266001, 'video_ids', 'a:0:{}', '2018-11-12 02:47:53', '2018-11-12 02:47:53'),
(82, 5857393983001, 'id', '5857393983001', '2018-11-12 02:47:53', '2018-11-12 02:47:53'),
(83, 5857393983001, 'account_id', '5814665417001', '2018-11-12 02:47:53', '2018-11-12 02:47:53'),
(84, 5857393983001, 'created_at', '2018-11-05T06:57:46.064Z', '2018-11-12 02:47:53', '2018-11-12 02:47:53'),
(85, 5857393983001, 'updated_at', '2018-11-05T06:57:46.065Z', '2018-11-12 02:47:53', '2018-11-12 02:47:53'),
(86, 5857393983001, 'description', 'Volatile Market', '2018-11-12 02:47:53', '2018-11-12 02:47:53'),
(87, 5857393983001, 'favorite', '1', '2018-11-12 02:47:53', '2018-11-12 02:47:53'),
(88, 5857393983001, 'name', 'Volatile Market', '2018-11-12 02:47:54', '2018-11-12 02:47:54'),
(89, 5857393983001, 'reference_id', 'Volatile-Market', '2018-11-12 02:47:54', '2018-11-12 02:47:54'),
(90, 5857393983001, 'type', 'EXPLICIT', '2018-11-12 02:47:54', '2018-11-12 02:47:54'),
(91, 5857393983001, 'video_ids', 'a:0:{}', '2018-11-12 02:47:54', '2018-11-12 02:47:54'),
(92, 5857193403001, 'id', '5857193403001', '2018-11-12 02:47:54', '2018-11-12 02:47:54'),
(93, 5857193403001, 'account_id', '5814665417001', '2018-11-12 02:47:54', '2018-11-12 02:47:54'),
(94, 5857193403001, 'created_at', '2018-11-05T06:57:34.227Z', '2018-11-12 02:47:54', '2018-11-12 02:47:54'),
(95, 5857193403001, 'updated_at', '2018-11-05T06:57:34.227Z', '2018-11-12 02:47:54', '2018-11-12 02:47:54'),
(96, 5857193403001, 'description', 'Investor Expectations', '2018-11-12 02:47:54', '2018-11-12 02:47:54'),
(97, 5857193403001, 'favorite', '1', '2018-11-12 02:47:54', '2018-11-12 02:47:54'),
(98, 5857193403001, 'name', 'Investor Expectations', '2018-11-12 02:47:54', '2018-11-12 02:47:54'),
(99, 5857193403001, 'reference_id', 'Investor-Expectations', '2018-11-12 02:47:54', '2018-11-12 02:47:54'),
(100, 5857193403001, 'type', 'EXPLICIT', '2018-11-12 02:47:54', '2018-11-12 02:47:54'),
(101, 5857193403001, 'video_ids', 'a:0:{}', '2018-11-12 02:47:54', '2018-11-12 02:47:54'),
(102, 5857645392001, 'id', '5857645392001', '2018-11-12 02:47:55', '2018-11-12 02:47:55'),
(103, 5857645392001, 'account_id', '5814665417001', '2018-11-12 02:47:55', '2018-11-12 02:47:55'),
(104, 5857645392001, 'created_at', '2018-11-05T06:57:19.402Z', '2018-11-12 02:47:55', '2018-11-12 02:47:55'),
(105, 5857645392001, 'updated_at', '2018-11-05T06:57:19.402Z', '2018-11-12 02:47:55', '2018-11-12 02:47:55'),
(106, 5857645392001, 'description', 'Critical Illness', '2018-11-12 02:47:55', '2018-11-12 02:47:55'),
(107, 5857645392001, 'favorite', '1', '2018-11-12 02:47:55', '2018-11-12 02:47:55'),
(108, 5857645392001, 'name', 'Critical Illness', '2018-11-12 02:47:55', '2018-11-12 02:47:55'),
(109, 5857645392001, 'reference_id', 'Critical-Illness', '2018-11-12 02:47:55', '2018-11-12 02:47:55'),
(110, 5857645392001, 'type', 'EXPLICIT', '2018-11-12 02:47:55', '2018-11-12 02:47:55'),
(111, 5857645392001, 'video_ids', 'a:0:{}', '2018-11-12 02:47:55', '2018-11-12 02:47:55'),
(112, 5857645391001, 'id', '5857645391001', '2018-11-12 02:47:55', '2018-11-12 02:47:55'),
(113, 5857645391001, 'account_id', '5814665417001', '2018-11-12 02:47:55', '2018-11-12 02:47:55'),
(114, 5857645391001, 'created_at', '2018-11-05T06:57:05.764Z', '2018-11-12 02:47:55', '2018-11-12 02:47:55'),
(115, 5857645391001, 'updated_at', '2018-11-05T06:57:05.764Z', '2018-11-12 02:47:55', '2018-11-12 02:47:55'),
(116, 5857645391001, 'description', 'Top Up', '2018-11-12 02:47:55', '2018-11-12 02:47:55'),
(117, 5857645391001, 'favorite', '1', '2018-11-12 02:47:56', '2018-11-12 02:47:56'),
(118, 5857645391001, 'name', 'Top Up', '2018-11-12 02:47:56', '2018-11-12 02:47:56'),
(119, 5857645391001, 'reference_id', 'Top-Up', '2018-11-12 02:47:56', '2018-11-12 02:47:56'),
(120, 5857645391001, 'type', 'EXPLICIT', '2018-11-12 02:47:56', '2018-11-12 02:47:56'),
(121, 5857645391001, 'video_ids', 'a:0:{}', '2018-11-12 02:47:56', '2018-11-12 02:47:56'),
(122, 5857645390001, 'id', '5857645390001', '2018-11-12 02:47:56', '2018-11-12 02:47:56'),
(123, 5857645390001, 'account_id', '5814665417001', '2018-11-12 02:47:56', '2018-11-12 02:47:56'),
(124, 5857645390001, 'created_at', '2018-11-05T06:56:51.642Z', '2018-11-12 02:47:56', '2018-11-12 02:47:56'),
(125, 5857645390001, 'updated_at', '2018-11-05T06:56:51.642Z', '2018-11-12 02:47:56', '2018-11-12 02:47:56'),
(126, 5857645390001, 'description', 'Term Cover', '2018-11-12 02:47:56', '2018-11-12 02:47:56'),
(127, 5857645390001, 'favorite', '1', '2018-11-12 02:47:57', '2018-11-12 02:47:57'),
(128, 5857645390001, 'name', 'Term Cover', '2018-11-12 02:47:57', '2018-11-12 02:47:57'),
(129, 5857645390001, 'reference_id', 'Term-Cover', '2018-11-12 02:47:57', '2018-11-12 02:47:57'),
(130, 5857645390001, 'type', 'EXPLICIT', '2018-11-12 02:47:57', '2018-11-12 02:47:57'),
(131, 5857645390001, 'video_ids', 'a:0:{}', '2018-11-12 02:47:57', '2018-11-12 02:47:57'),
(132, 5857645389001, 'id', '5857645389001', '2018-11-12 02:47:57', '2018-11-12 02:47:57'),
(133, 5857645389001, 'account_id', '5814665417001', '2018-11-12 02:47:57', '2018-11-12 02:47:57'),
(134, 5857645389001, 'created_at', '2018-11-05T06:56:36.127Z', '2018-11-12 02:47:57', '2018-11-12 02:47:57'),
(135, 5857645389001, 'updated_at', '2018-11-05T06:56:36.128Z', '2018-11-12 02:47:57', '2018-11-12 02:47:57'),
(136, 5857645389001, 'description', 'Group Cover', '2018-11-12 02:47:57', '2018-11-12 02:47:57'),
(137, 5857645389001, 'favorite', '1', '2018-11-12 02:47:57', '2018-11-12 02:47:57'),
(138, 5857645389001, 'name', 'Group Cover', '2018-11-12 02:47:57', '2018-11-12 02:47:57'),
(139, 5857645389001, 'reference_id', 'Group-Cover', '2018-11-12 02:47:58', '2018-11-12 02:47:58'),
(140, 5857645389001, 'type', 'EXPLICIT', '2018-11-12 02:47:58', '2018-11-12 02:47:58'),
(141, 5857645389001, 'video_ids', 'a:0:{}', '2018-11-12 02:47:58', '2018-11-12 02:47:58'),
(142, 5857193402001, 'id', '5857193402001', '2018-11-12 02:47:58', '2018-11-12 02:47:58'),
(143, 5857193402001, 'account_id', '5814665417001', '2018-11-12 02:47:58', '2018-11-12 02:47:58'),
(144, 5857193402001, 'created_at', '2018-11-05T06:56:19.916Z', '2018-11-12 02:47:58', '2018-11-12 02:47:58'),
(145, 5857193402001, 'updated_at', '2018-11-05T06:56:19.917Z', '2018-11-12 02:47:58', '2018-11-12 02:47:58'),
(146, 5857193402001, 'description', 'Family Floater Policy', '2018-11-12 02:47:58', '2018-11-12 02:47:58'),
(147, 5857193402001, 'favorite', '1', '2018-11-12 02:47:58', '2018-11-12 02:47:58'),
(148, 5857193402001, 'name', 'Family Floater Policy', '2018-11-12 02:47:58', '2018-11-12 02:47:58'),
(149, 5857193402001, 'reference_id', 'Family-Floater-Policy', '2018-11-12 02:47:59', '2018-11-12 02:47:59'),
(150, 5857193402001, 'type', 'EXPLICIT', '2018-11-12 02:47:59', '2018-11-12 02:47:59'),
(151, 5857193402001, 'video_ids', 'a:0:{}', '2018-11-12 02:47:59', '2018-11-12 02:47:59'),
(152, 5857393981001, 'id', '5857393981001', '2018-11-12 02:48:00', '2018-11-12 02:48:00'),
(153, 5857393981001, 'account_id', '5814665417001', '2018-11-12 02:48:00', '2018-11-12 02:48:00'),
(154, 5857393981001, 'created_at', '2018-11-05T06:56:02.127Z', '2018-11-12 02:48:00', '2018-11-12 02:48:00'),
(155, 5857393981001, 'updated_at', '2018-11-05T06:56:02.127Z', '2018-11-12 02:48:00', '2018-11-12 02:48:00'),
(156, 5857393981001, 'description', 'ULIPs', '2018-11-12 02:48:00', '2018-11-12 02:48:00'),
(157, 5857393981001, 'favorite', '1', '2018-11-12 02:48:00', '2018-11-12 02:48:00'),
(158, 5857393981001, 'name', 'ULIPs', '2018-11-12 02:48:00', '2018-11-12 02:48:00'),
(159, 5857393981001, 'reference_id', 'ULIPs', '2018-11-12 02:48:00', '2018-11-12 02:48:00'),
(160, 5857393981001, 'type', 'EXPLICIT', '2018-11-12 02:48:00', '2018-11-12 02:48:00'),
(161, 5857393981001, 'video_ids', 'a:0:{}', '2018-11-12 02:48:00', '2018-11-12 02:48:00'),
(162, 5857351264001, 'id', '5857351264001', '2018-11-12 02:48:01', '2018-11-12 02:48:01'),
(163, 5857351264001, 'account_id', '5814665417001', '2018-11-12 02:48:01', '2018-11-12 02:48:01'),
(164, 5857351264001, 'created_at', '2018-11-05T06:55:51.557Z', '2018-11-12 02:48:01', '2018-11-12 02:48:01'),
(165, 5857351264001, 'updated_at', '2018-11-05T06:55:51.557Z', '2018-11-12 02:48:01', '2018-11-12 02:48:01'),
(166, 5857351264001, 'description', 'Saving', '2018-11-12 02:48:01', '2018-11-12 02:48:01'),
(167, 5857351264001, 'favorite', '1', '2018-11-12 02:48:01', '2018-11-12 02:48:01'),
(168, 5857351264001, 'name', 'Saving', '2018-11-12 02:48:01', '2018-11-12 02:48:01'),
(169, 5857351264001, 'reference_id', 'Saving', '2018-11-12 02:48:01', '2018-11-12 02:48:01'),
(170, 5857351264001, 'type', 'EXPLICIT', '2018-11-12 02:48:01', '2018-11-12 02:48:01'),
(171, 5857351264001, 'video_ids', 'a:0:{}', '2018-11-12 02:48:01', '2018-11-12 02:48:01'),
(172, 5857311932001, 'id', '5857311932001', '2018-11-12 02:48:01', '2018-11-12 02:48:01'),
(173, 5857311932001, 'account_id', '5814665417001', '2018-11-12 02:48:01', '2018-11-12 02:48:01'),
(174, 5857311932001, 'created_at', '2018-11-05T06:55:39.899Z', '2018-11-12 02:48:02', '2018-11-12 02:48:02'),
(175, 5857311932001, 'updated_at', '2018-11-05T06:55:39.899Z', '2018-11-12 02:48:02', '2018-11-12 02:48:02'),
(176, 5857311932001, 'description', 'Inflation', '2018-11-12 02:48:02', '2018-11-12 02:48:02'),
(177, 5857311932001, 'favorite', '1', '2018-11-12 02:48:02', '2018-11-12 02:48:02'),
(178, 5857311932001, 'name', 'Inflation', '2018-11-12 02:48:02', '2018-11-12 02:48:02'),
(179, 5857311932001, 'reference_id', 'Inflation', '2018-11-12 02:48:02', '2018-11-12 02:48:02'),
(180, 5857311932001, 'type', 'EXPLICIT', '2018-11-12 02:48:02', '2018-11-12 02:48:02'),
(181, 5857311932001, 'video_ids', 'a:0:{}', '2018-11-12 02:48:02', '2018-11-12 02:48:02'),
(182, 5857197735001, 'id', '5857197735001', '2018-11-12 02:48:03', '2018-11-12 02:48:03'),
(183, 5857197735001, 'account_id', '5814665417001', '2018-11-12 02:48:03', '2018-11-12 02:48:03'),
(184, 5857197735001, 'created_at', '2018-11-05T06:55:27.775Z', '2018-11-12 02:48:03', '2018-11-12 02:48:03'),
(185, 5857197735001, 'updated_at', '2018-11-05T06:55:27.775Z', '2018-11-12 02:48:03', '2018-11-12 02:48:03'),
(186, 5857197735001, 'description', 'Compunding', '2018-11-12 02:48:03', '2018-11-12 02:48:03'),
(187, 5857197735001, 'favorite', '1', '2018-11-12 02:48:03', '2018-11-12 02:48:03'),
(188, 5857197735001, 'name', 'Compunding', '2018-11-12 02:48:03', '2018-11-12 02:48:03'),
(189, 5857197735001, 'reference_id', 'Compunding', '2018-11-12 02:48:03', '2018-11-12 02:48:03'),
(190, 5857197735001, 'type', 'EXPLICIT', '2018-11-12 02:48:03', '2018-11-12 02:48:03'),
(191, 5857197735001, 'video_ids', 'a:0:{}', '2018-11-12 02:48:04', '2018-11-12 02:48:04'),
(192, 5857393979001, 'id', '5857393979001', '2018-11-12 02:48:04', '2018-11-12 02:48:04'),
(193, 5857393979001, 'account_id', '5814665417001', '2018-11-12 02:48:04', '2018-11-12 02:48:04'),
(194, 5857393979001, 'created_at', '2018-11-05T06:54:58.030Z', '2018-11-12 02:48:04', '2018-11-12 02:48:04'),
(195, 5857393979001, 'updated_at', '2018-11-05T06:54:58.030Z', '2018-11-12 02:48:04', '2018-11-12 02:48:04'),
(196, 5857393979001, 'description', 'Financial Plan', '2018-11-12 02:48:04', '2018-11-12 02:48:04'),
(197, 5857393979001, 'favorite', '1', '2018-11-12 02:48:04', '2018-11-12 02:48:04'),
(198, 5857393979001, 'name', 'Financial Plan', '2018-11-12 02:48:04', '2018-11-12 02:48:04'),
(199, 5857393979001, 'reference_id', 'Financial-Plan', '2018-11-12 02:48:04', '2018-11-12 02:48:04'),
(200, 5857393979001, 'type', 'EXPLICIT', '2018-11-12 02:48:04', '2018-11-12 02:48:04'),
(201, 5857393979001, 'video_ids', 'a:0:{}', '2018-11-12 02:48:05', '2018-11-12 02:48:05'),
(202, 5857190770001, 'id', '5857190770001', '2018-11-12 02:48:05', '2018-11-12 02:48:05'),
(203, 5857190770001, 'account_id', '5814665417001', '2018-11-12 02:48:05', '2018-11-12 02:48:05'),
(204, 5857190770001, 'created_at', '2018-11-05T06:53:13.189Z', '2018-11-12 02:48:05', '2018-11-12 02:48:05'),
(205, 5857190770001, 'updated_at', '2018-11-05T06:53:13.189Z', '2018-11-12 02:48:05', '2018-11-12 02:48:05'),
(206, 5857190770001, 'description', 'SWP', '2018-11-12 02:48:05', '2018-11-12 02:48:05'),
(207, 5857190770001, 'favorite', '1', '2018-11-12 02:48:06', '2018-11-12 02:48:06'),
(208, 5857190770001, 'name', 'SWP', '2018-11-12 02:48:06', '2018-11-12 02:48:06'),
(209, 5857190770001, 'reference_id', 'SWP', '2018-11-12 02:48:06', '2018-11-12 02:48:06'),
(210, 5857190770001, 'type', 'EXPLICIT', '2018-11-12 02:48:06', '2018-11-12 02:48:06'),
(211, 5857190770001, 'video_ids', 'a:0:{}', '2018-11-12 02:48:06', '2018-11-12 02:48:06'),
(212, 5857393978001, 'id', '5857393978001', '2018-11-12 02:48:06', '2018-11-12 02:48:06'),
(213, 5857393978001, 'account_id', '5814665417001', '2018-11-12 02:48:06', '2018-11-12 02:48:06'),
(214, 5857393978001, 'created_at', '2018-11-05T06:51:53.156Z', '2018-11-12 02:48:06', '2018-11-12 02:48:06'),
(215, 5857393978001, 'updated_at', '2018-11-05T06:51:53.156Z', '2018-11-12 02:48:06', '2018-11-12 02:48:06'),
(216, 5857393978001, 'description', 'STP', '2018-11-12 02:48:06', '2018-11-12 02:48:06'),
(217, 5857393978001, 'favorite', '1', '2018-11-12 02:48:07', '2018-11-12 02:48:07'),
(218, 5857393978001, 'name', 'STP', '2018-11-12 02:48:07', '2018-11-12 02:48:07'),
(219, 5857393978001, 'reference_id', 'STP', '2018-11-12 02:48:07', '2018-11-12 02:48:07'),
(220, 5857393978001, 'type', 'EXPLICIT', '2018-11-12 02:48:07', '2018-11-12 02:48:07'),
(221, 5857393978001, 'video_ids', 'a:0:{}', '2018-11-12 02:48:07', '2018-11-12 02:48:07'),
(222, 5857399103001, 'id', '5857399103001', '2018-11-12 02:48:07', '2018-11-12 02:48:07'),
(223, 5857399103001, 'account_id', '5814665417001', '2018-11-12 02:48:07', '2018-11-12 02:48:07'),
(224, 5857399103001, 'created_at', '2018-11-05T06:51:41.513Z', '2018-11-12 02:48:08', '2018-11-12 02:48:08'),
(225, 5857399103001, 'updated_at', '2018-11-05T06:51:41.513Z', '2018-11-12 02:48:08', '2018-11-12 02:48:08'),
(226, 5857399103001, 'description', 'PPF', '2018-11-12 02:48:08', '2018-11-12 02:48:08'),
(227, 5857399103001, 'favorite', '1', '2018-11-12 02:48:08', '2018-11-12 02:48:08'),
(228, 5857399103001, 'name', 'PPF', '2018-11-12 02:48:08', '2018-11-12 02:48:08'),
(229, 5857399103001, 'reference_id', 'PPF', '2018-11-12 02:48:08', '2018-11-12 02:48:08'),
(230, 5857399103001, 'type', 'EXPLICIT', '2018-11-12 02:48:08', '2018-11-12 02:48:08'),
(231, 5857399103001, 'video_ids', 'a:0:{}', '2018-11-12 02:48:08', '2018-11-12 02:48:08'),
(232, 5857274617001, 'id', '5857274617001', '2018-11-12 02:48:09', '2018-11-12 02:48:09'),
(233, 5857274617001, 'account_id', '5814665417001', '2018-11-12 02:48:09', '2018-11-12 02:48:09'),
(234, 5857274617001, 'created_at', '2018-11-05T06:51:31.159Z', '2018-11-12 02:48:09', '2018-11-12 02:48:09'),
(235, 5857274617001, 'updated_at', '2018-11-05T06:51:31.159Z', '2018-11-12 02:48:09', '2018-11-12 02:48:09'),
(236, 5857274617001, 'description', 'Property', '2018-11-12 02:48:09', '2018-11-12 02:48:09'),
(237, 5857274617001, 'favorite', '1', '2018-11-12 02:48:09', '2018-11-12 02:48:09'),
(238, 5857274617001, 'name', 'Property', '2018-11-12 02:48:09', '2018-11-12 02:48:09'),
(239, 5857274617001, 'reference_id', 'Property', '2018-11-12 02:48:09', '2018-11-12 02:48:09'),
(240, 5857274617001, 'type', 'EXPLICIT', '2018-11-12 02:48:09', '2018-11-12 02:48:09'),
(241, 5857274617001, 'video_ids', 'a:0:{}', '2018-11-12 02:48:09', '2018-11-12 02:48:09'),
(242, 5857193404001, 'id', '5857193404001', '2018-11-12 02:51:06', '2018-11-12 02:51:06'),
(243, 5857193404001, 'account_id', '5814665417001', '2018-11-12 02:51:06', '2018-11-12 02:51:06'),
(244, 5857193404001, 'created_at', '2018-11-05T06:59:18.369Z', '2018-11-12 02:51:06', '2018-11-12 02:51:06'),
(245, 5857193404001, 'updated_at', '2018-11-12T08:20:43.330Z', '2018-11-12 02:51:06', '2018-11-12 02:51:06'),
(246, 5857193404001, 'description', 'Portfolio', '2018-11-12 02:51:06', '2018-11-12 02:51:06'),
(247, 5857193404001, 'favorite', '1', '2018-11-12 02:51:06', '2018-11-12 02:51:06'),
(248, 5857193404001, 'name', 'Portfolio', '2018-11-12 02:51:06', '2018-11-12 02:51:06'),
(249, 5857193404001, 'reference_id', 'Portfolio', '2018-11-12 02:51:06', '2018-11-12 02:51:06'),
(250, 5857193404001, 'type', 'EXPLICIT', '2018-11-12 02:51:06', '2018-11-12 02:51:06'),
(251, 5857193404001, 'video_ids', 'a:1:{i:0;s:13:"5843727979001";}', '2018-11-12 02:51:06', '2018-11-12 02:51:06');

-- --------------------------------------------------------

--
-- Table structure for table `mm_reason_for_account_deactivations`
--

CREATE TABLE `mm_reason_for_account_deactivations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '0',
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
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_roles`
--

INSERT INTO `mm_roles` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Super Administrator', 'A Super Administrator, having each n every power.', 1, NULL, NULL),
(2, 'Administrator', 'An Administrator, .', 1, NULL, NULL),
(3, 'Editor', 'Editor.', 1, NULL, NULL),
(4, 'Author', 'Author.', 1, NULL, NULL),
(5, 'Contributor', 'Contributor.', 1, NULL, NULL),
(6, 'Subscriber', 'Subscriber', 1, NULL, NULL);

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
  `option_value` longtext COLLATE utf8mb4_unicode_ci,
  `autoload` tinyint(1) NOT NULL DEFAULT '0'
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
(3, 'surya-bhatia', 'speaker/1537524700.png', '03-Surya-Bhatia', '2018-09-21 03:16:00', '2018-11-16 02:51:30'),
(4, 'vivek-law', 'speaker/1542353648.jpg', '01-Vivek-Law', '2018-09-21 03:28:49', '2018-11-16 02:34:54');

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
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `biography` longtext COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_speaker_descriptions`
--

INSERT INTO `mm_speaker_descriptions` (`speaker_id`, `language_id`, `name`, `designation`, `short_description`, `description`, `biography`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(3, 3, 'Surya Bhatia', 'Promoter of Asset Managers & Co founder', 'Surya Bhatia is a Chartered Accountant qualified in May’98. During his two year stint in a CA firm', '<p>Surya Bhatia is a Chartered Accountant qualified in May&rsquo;98. During his two year stint in a CA firm where he worked in the capacity as a partner, he developed a passion for personal finance and started developing experience and expertise in the same.</p>\r\n\r\n<p>Along with pursuing his passion for personal finance he started doing CFP (Certified Financial Planner) when launched in India, he did his CFP via the challenge status. In the year 2003, he started his own wealth boutique firm &ldquo;Asset Managers&rdquo; &ndash; a financial advisory concern advising on money management principles and over the last 15 years, he has been helping individuals and Small &amp; Medium Enterprise (SME) to create, manage and grow their assets. He has also been spreading financial awareness by doing TV shows more popularly &ldquo;Let&rsquo;s talk Money&rdquo; on NDTV Profit, &ldquo;Dhan Daulat&rdquo; on Aaj Tak, &ldquo;Money&rsquo;s Best Friend&rdquo; on India Today TV, &ldquo;Smart Money&rdquo; on Bloomberg and contributing towards financial literacy through workshops for corporates,</p>\r\n\r\n<p>Financial Planning Board and via print media by writing articles and columns and is currently writing a weekly column for HT-MINT. And with the advent of social media as a platform, through their new venture @ Money Mile, he is spreading financial literacy via face book, Youtube.</p>', 'Promoter of Asset Managers & Co founder @ Money Mile', 'Surya Bhatia', 'Surya Bhatia', 'Surya Bhatia'),
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
(2, 4, 'https://www.facebook.com/vivek.law.9', 'https://www.linkedin.com/in/vivek-law-618322ab/', NULL, 'https://www.twitter.com/VivekLaw', '2018-09-24 18:30:00', '2018-11-16 02:34:54'),
(3, 5, NULL, NULL, 'http://google.com', 'http://twitter.com', '2018-09-25 04:58:50', '2018-09-25 06:48:17');

-- --------------------------------------------------------

--
-- Table structure for table `mm_states`
--

CREATE TABLE `mm_states` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(51) NOT NULL DEFAULT '',
  `description` text
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
  `status` tinyint(1) NOT NULL DEFAULT '1',
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
(7, 'transparentulips', '2018-09-10 06:47:57', '2018-09-10 06:47:57'),
(8, 'niveshkarbefikar', '2018-11-01 05:14:05', '2018-11-01 05:14:05');

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
  `order` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_translations`
--

INSERT INTO `mm_translations` (`id`, `name`, `code`, `locale`, `image`, `order`, `status`, `created_at`, `updated_at`) VALUES
(3, 'English', 'en', 'en', 'image/en', 1, 1, '2018-09-12 07:48:41', '2018-09-13 07:42:03'),
(4, 'Hindi', 'hi', 'hi', 'image/hi', 2, 0, '2018-09-12 07:48:59', '2018-09-22 02:53:43');

-- --------------------------------------------------------

--
-- Table structure for table `mm_users`
--

CREATE TABLE `mm_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '2',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '1',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_users`
--

INSERT INTO `mm_users` (`id`, `role_id`, `name`, `email`, `mobile`, `avatar`, `state`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 2, 'Vipin Ganganiya', 'vipin.developer@gmail.com', '9212376832', NULL, 2, '$2y$10$S.2DD09i5d5Nr92xwVfoGOZZ3JWUSVPPdO4q8oNmgj.9CnD9j5HFq', 'sNkF35mifjGWRjDptrKKXFSudWjWgU08yWTsnK3jTSnU0dZJVb5QXTiYQ8fq', '2018-09-03 01:48:39', '2018-09-21 05:59:06'),
(9, 6, 'Vipin', 'vipin.yadav@gmail.com', '', NULL, 1, '$2y$10$dF5NnU/9RM9v6WygX2f2M.dC4T7h6NeTidnYLQPy6nQzziX/lCXsS', 'lrsOrNx156z56hIUR7gTVmnXHfQI3zuEb7sVao9OPSuzGc1t9OExfs64OXu3', '2018-09-10 01:37:12', '2018-09-10 01:37:12'),
(10, 6, 'Dean', 'dean@gmail.com', '', NULL, 2, '$2y$10$gynyOPhCX9z42FSfb2Xeb..jfrSioLQJIik3cFZtGIR99krX9a4aO', 'jO35VvDwuAVu6hDbGJxuL6bDaGlRAPiwIOPRIHsrH4Lf2lDI10QnspDjhZuT', '2018-09-10 23:40:14', '2018-09-10 23:43:26'),
(11, 6, 'Vipin Kr', 'vipin.kumar@gmail.com', '', NULL, 2, '$2y$10$PRjiMjXzKQweKWN0muPkN.NH4MqSU3C.iaEE31uzs4ec28/GA3Zci', 'xcbTbmJ1YOHa6kotRjpMOYSmoqxWVTPuOdtZT02LlPA5C7WWtICvxbladYBu', '2018-09-11 01:51:17', '2018-09-11 01:51:34'),
(21, 6, 'Vivek', 'vivek@gmail.com', '', NULL, 1, '$2y$10$1SgpeGRmZ1Yl/.NhTy5LiuH0wHRQIZC0gWQFVx2Mx7H.wNc4oRqhG', '2fNP8PywAHDeVAJWJjXN14nD30Laniciq0dUSxMqQ88ml4IcWZOn5vlSAcrx', '2018-10-01 02:10:45', '2018-10-01 02:10:45'),
(22, 6, 'vipin', 'vipin.y@iwebsun.com', '', 'user/pic/1539339268.png', 2, '$2y$10$eToRh2O.5f6YeUeCyYnUyuq4wVXhsYOtPW6lI7M3fGe9ltYgFlRQK', 'nSSKaYqDtBXbxSOcUDL3O1d6DoggdciJNJsyQF1w3h3FcRVkR6zvL1ImShEv', '2018-10-09 01:08:22', '2018-11-14 07:16:19'),
(23, 1, 'themoneymile', 'themoneymile@gmail.com', '9212376832', NULL, 2, '$2y$10$S.2DD09i5d5Nr92xwVfoGOZZ3JWUSVPPdO4q8oNmgj.9CnD9j5HFq', 'TfLxmwqyhx4O16cAlk8WKnmHMtq6B60Z66M3pMiQexEZ3OyUQhUmepsaeUjl', '2018-09-03 01:48:39', '2018-09-21 05:59:06');

-- --------------------------------------------------------

--
-- Table structure for table `mm_user_comments`
--

CREATE TABLE `mm_user_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8mb4_unicode_ci,
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
(32, 22, 5832974497001, 3, 0, 'asdfadsf', '2018-11-17 05:32:49', '2018-11-17 05:32:49'),
(33, 22, 5832974497001, 3, 32, 'jhkjhkjk', '2018-11-17 05:32:55', '2018-11-17 05:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `mm_user_metas`
--

CREATE TABLE `mm_user_metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
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
(27, 11, 'tag', 's:7:"1, 5, 7";', '2018-09-11 01:52:12', NULL),
(28, 11, 'age', '2', '2018-09-11 01:52:12', NULL),
(29, 11, 'n_notify', 'on', '2018-09-11 01:55:20', NULL),
(30, 11, 'v_notify', 'off', '2018-09-11 01:55:20', NULL),
(52, 21, 'login_id', 'dDAb1fehS4AiMfqoCQWtV91npqRecxsZ25Dg1qOT', '2018-10-01 02:10:45', '2018-10-01 02:10:45'),
(53, 21, 'login_with', 'Email', '2018-10-01 02:10:45', '2018-10-01 02:10:45'),
(54, 22, 'login_id', '28yWfbViv1yHulScY5RIIfzd0rv3latpvYnJ3ehv', '2018-10-09 01:08:22', '2018-10-09 01:08:22'),
(55, 22, 'login_with', 'Email', '2018-10-09 01:08:22', '2018-10-09 01:08:22'),
(56, 22, 'tag', 's:7:"1, 5, 7";', '2018-10-09 05:14:12', '2018-10-09 05:46:08'),
(57, 22, 'age', '6', '2018-10-09 05:14:12', '2018-10-09 05:46:08'),
(58, 9, 'flag_redirect', '0', '2018-10-09 18:30:00', '2018-10-09 18:30:00'),
(59, 10, 'flag_redirect', '1', NULL, '2018-10-11 01:58:10'),
(60, 11, 'flag_redirect', '0', NULL, NULL),
(62, 22, 'flag_redirect', '1', '2018-10-09 18:30:00', '2018-10-10 06:23:00'),
(64, 10, 'age', '3', '2018-10-11 01:58:33', '2018-10-11 02:18:04'),
(66, 22, 'biography', 'this is my data. dsf asdfadsf', '2018-10-12 06:52:29', '2018-11-17 05:13:18'),
(67, 22, 'designation', 'PHP Developer', '2018-10-12 06:55:09', '2018-11-17 05:23:16'),
(68, 22, 'n_notify', 'on', '2018-11-14 02:08:45', '2018-11-17 04:40:26'),
(69, 22, 'v_notify', 'on', '2018-11-14 02:08:45', '2018-11-17 04:40:27'),
(70, 22, 'account_deactivate', '1', '2018-11-14 07:16:19', NULL),
(71, 22, 'deactivate_reason', '4', '2018-11-14 07:16:19', NULL);

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
(21, 'lkithffmRMXzBSlvW0YenWnV4lbVzU8oVqukUEMX', '2018-10-01 02:10:45', '2018-10-01 02:10:45'),
(22, 'fkiEvzrSaTNkb3RJ3chRzIV2IiH2U32U59bs5Z0s', '2018-10-09 01:08:22', '2018-10-09 01:08:22');

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
(50, 22, 5832962384001, '2018-11-05 05:44:34', '2018-11-05 05:44:34'),
(51, 22, 5832976243001, '2018-11-13 03:32:44', '2018-11-13 03:32:44'),
(56, 22, 5832974497001, '2018-11-13 03:39:53', '2018-11-13 03:39:53');

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
(5970330164001, 'Ashish Highlight 6- 1109', 'ashish-highlight-6-1109', '2018-11-27 05:04:03', '2018-11-27 05:04:03'),
(5970330165001, 'Ashish Highlight 9- 1109', 'ashish-highlight-9-1109', '2018-11-27 05:04:00', '2018-11-27 05:04:00');

-- --------------------------------------------------------

--
-- Table structure for table `mm_video_metas`
--

CREATE TABLE `mm_video_metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mm_video_metas`
--

INSERT INTO `mm_video_metas` (`id`, `video_id`, `meta_key`, `meta_value`, `created_at`, `updated_at`) VALUES
(1741, 5970330165001, 'id', '5970330165001', '2018-11-27 05:04:00', '2018-11-27 05:04:00'),
(1742, 5970330165001, 'account_id', '5814665417001', '2018-11-27 05:04:01', '2018-11-27 05:04:01'),
(1743, 5970330165001, 'ad_keys', NULL, '2018-11-27 05:04:01', '2018-11-27 05:04:01'),
(1744, 5970330165001, 'clip_source_video_id', NULL, '2018-11-27 05:04:01', '2018-11-27 05:04:01'),
(1745, 5970330165001, 'complete', '1', '2018-11-27 05:04:01', '2018-11-27 05:04:01'),
(1746, 5970330165001, 'created_at', '2018-11-22T07:31:49.695Z', '2018-11-27 05:04:01', '2018-11-27 05:04:01'),
(1747, 5970330165001, 'cue_points', 'a:0:{}', '2018-11-27 05:04:01', '2018-11-27 05:04:01'),
(1748, 5970330165001, 'custom_fields', 'a:2:{s:9:"speaker_1";s:12:"01-Vivek-Law";s:9:"speaker_2";s:19:"07-Aashish-Somaiyaa";}', '2018-11-27 05:04:01', '2018-11-27 05:04:01'),
(1749, 5970330165001, 'delivery_type', 'dynamic_origin', '2018-11-27 05:04:02', '2018-11-27 05:04:02'),
(1750, 5970330165001, 'description', 'Investors are not sure if they should remain in Dividend plans or switch to Growth plans. Aashish Somaiyaa of Motilal Oswal Asset Management has some advice on the matter. Only on #EquitySahiHai. A special with Motilal Oswal Asset Management. Click', '2018-11-27 05:04:02', '2018-11-27 05:04:02'),
(1751, 5970330165001, 'digital_master_id', NULL, '2018-11-27 05:04:02', '2018-11-27 05:04:02'),
(1752, 5970330165001, 'duration', '253995', '2018-11-27 05:04:02', '2018-11-27 05:04:02'),
(1753, 5970330165001, 'economics', 'AD_SUPPORTED', '2018-11-27 05:04:02', '2018-11-27 05:04:02'),
(1754, 5970330165001, 'folder_id', '5bdfe38abda6bb0ce8e60d8c', '2018-11-27 05:04:02', '2018-11-27 05:04:02'),
(1755, 5970330165001, 'geo', NULL, '2018-11-27 05:04:02', '2018-11-27 05:04:02'),
(1756, 5970330165001, 'has_digital_master', '1', '2018-11-27 05:04:02', '2018-11-27 05:04:02'),
(1757, 5970330165001, 'images', 'a:2:{s:6:"poster";a:2:{s:3:"src";s:147:"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/63d03e64-ac97-4459-aa26-0737283ca7fb/main/1160x653/2m6s997ms/match/image.jpg";s:7:"sources";a:1:{i:0;a:3:{s:3:"src";s:147:"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/63d03e64-ac97-4459-aa26-0737283ca7fb/main/1160x653/2m6s997ms/match/image.jpg";s:6:"height";i:653;s:5:"width";i:1160;}}}s:9:"thumbnail";a:2:{s:3:"src";s:146:"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/63d03e64-ac97-4459-aa26-0737283ca7fb/main/248x140/2m6s997ms/match/image.jpg";s:7:"sources";a:1:{i:0;a:3:{s:3:"src";s:146:"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/63d03e64-ac97-4459-aa26-0737283ca7fb/main/248x140/2m6s997ms/match/image.jpg";s:6:"height";i:140;s:5:"width";i:248;}}}}', '2018-11-27 05:04:02', '2018-11-27 05:04:02'),
(1758, 5970330165001, 'link', NULL, '2018-11-27 05:04:02', '2018-11-27 05:04:02'),
(1759, 5970330165001, 'long_description', NULL, '2018-11-27 05:04:02', '2018-11-27 05:04:02'),
(1760, 5970330165001, 'name', 'Ashish Highlight 9- 1109', '2018-11-27 05:04:02', '2018-11-27 05:04:02'),
(1761, 5970330165001, 'original_filename', 'Ashish_Highlight_9-_1109.mp4', '2018-11-27 05:04:02', '2018-11-27 05:04:02'),
(1762, 5970330165001, 'projection', NULL, '2018-11-27 05:04:02', '2018-11-27 05:04:02'),
(1763, 5970330165001, 'published_at', '2018-11-22T07:31:49.695Z', '2018-11-27 05:04:03', '2018-11-27 05:04:03'),
(1764, 5970330165001, 'reference_id', 'Ashish Highlight 9- 1109', '2018-11-27 05:04:03', '2018-11-27 05:04:03'),
(1765, 5970330165001, 'schedule', NULL, '2018-11-27 05:04:03', '2018-11-27 05:04:03'),
(1766, 5970330165001, 'sharing', NULL, '2018-11-27 05:04:03', '2018-11-27 05:04:03'),
(1767, 5970330165001, 'state', 'ACTIVE', '2018-11-27 05:04:03', '2018-11-27 05:04:03'),
(1768, 5970330165001, 'tags', 'a:6:{i:0;s:16:"aashish somaiyaa";i:1;s:8:"dividend";i:2;s:15:"equity sahi hai";i:3;s:6:"growth";i:4;s:30:"motilal oswal asset management";i:5;s:13:"the moneymile";}', '2018-11-27 05:04:03', '2018-11-27 05:04:03'),
(1769, 5970330165001, 'text_tracks', 'a:0:{}', '2018-11-27 05:04:03', '2018-11-27 05:04:03'),
(1770, 5970330165001, 'updated_at', '2018-11-26T09:01:59.778Z', '2018-11-27 05:04:03', '2018-11-27 05:04:03'),
(1771, 5970330164001, 'id', '5970330164001', '2018-11-27 05:04:03', '2018-11-27 05:04:03'),
(1772, 5970330164001, 'account_id', '5814665417001', '2018-11-27 05:04:03', '2018-11-27 05:04:03'),
(1773, 5970330164001, 'ad_keys', NULL, '2018-11-27 05:04:03', '2018-11-27 05:04:03'),
(1774, 5970330164001, 'clip_source_video_id', NULL, '2018-11-27 05:04:03', '2018-11-27 05:04:03'),
(1775, 5970330164001, 'complete', '1', '2018-11-27 05:04:03', '2018-11-27 05:04:03'),
(1776, 5970330164001, 'created_at', '2018-11-22T07:31:47.935Z', '2018-11-27 05:04:03', '2018-11-27 05:04:03'),
(1777, 5970330164001, 'cue_points', 'a:0:{}', '2018-11-27 05:04:04', '2018-11-27 05:04:04'),
(1778, 5970330164001, 'custom_fields', 'a:2:{s:9:"speaker_1";s:12:"01-Vivek-Law";s:9:"speaker_2";s:19:"07-Aashish-Somaiyaa";}', '2018-11-27 05:04:04', '2018-11-27 05:04:04'),
(1779, 5970330164001, 'delivery_type', 'dynamic_origin', '2018-11-27 05:04:04', '2018-11-27 05:04:04'),
(1780, 5970330164001, 'description', 'The power of patience works both ways. What does that mean? Find out now on #EquitySahiHai in association with Motilal Oswal Asset Management. A special with Motilal Oswal Asset Management. Click https://bit.ly/2wo1hba for more.', '2018-11-27 05:04:04', '2018-11-27 05:04:04'),
(1781, 5970330164001, 'digital_master_id', NULL, '2018-11-27 05:04:04', '2018-11-27 05:04:04'),
(1782, 5970330164001, 'duration', '178667', '2018-11-27 05:04:04', '2018-11-27 05:04:04'),
(1783, 5970330164001, 'economics', 'AD_SUPPORTED', '2018-11-27 05:04:04', '2018-11-27 05:04:04'),
(1784, 5970330164001, 'folder_id', '5bf7c8497e881b4b81ed06e6', '2018-11-27 05:04:04', '2018-11-27 05:04:04'),
(1785, 5970330164001, 'geo', NULL, '2018-11-27 05:04:04', '2018-11-27 05:04:04'),
(1786, 5970330164001, 'has_digital_master', '1', '2018-11-27 05:04:04', '2018-11-27 05:04:04'),
(1787, 5970330164001, 'images', 'a:2:{s:6:"poster";a:2:{s:3:"src";s:148:"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/aeb32b67-2efb-4c64-83fd-aa7734b1bdbf/main/1160x653/1m29s333ms/match/image.jpg";s:7:"sources";a:1:{i:0;a:3:{s:3:"src";s:148:"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/aeb32b67-2efb-4c64-83fd-aa7734b1bdbf/main/1160x653/1m29s333ms/match/image.jpg";s:6:"height";i:653;s:5:"width";i:1160;}}}s:9:"thumbnail";a:2:{s:3:"src";s:147:"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/aeb32b67-2efb-4c64-83fd-aa7734b1bdbf/main/248x140/1m29s333ms/match/image.jpg";s:7:"sources";a:1:{i:0;a:3:{s:3:"src";s:147:"https://cf-images.ap-southeast-1.prod.boltdns.net/v1/jit/5814665417001/aeb32b67-2efb-4c64-83fd-aa7734b1bdbf/main/248x140/1m29s333ms/match/image.jpg";s:6:"height";i:140;s:5:"width";i:248;}}}}', '2018-11-27 05:04:04', '2018-11-27 05:04:04'),
(1788, 5970330164001, 'link', NULL, '2018-11-27 05:04:04', '2018-11-27 05:04:04'),
(1789, 5970330164001, 'long_description', NULL, '2018-11-27 05:04:04', '2018-11-27 05:04:04'),
(1790, 5970330164001, 'name', 'Ashish Highlight 6- 1109', '2018-11-27 05:04:05', '2018-11-27 05:04:05'),
(1791, 5970330164001, 'original_filename', 'Ashish_Highlight_6-_1109.mp4', '2018-11-27 05:04:05', '2018-11-27 05:04:05'),
(1792, 5970330164001, 'projection', NULL, '2018-11-27 05:04:05', '2018-11-27 05:04:05'),
(1793, 5970330164001, 'published_at', '2018-11-22T07:31:47.935Z', '2018-11-27 05:04:05', '2018-11-27 05:04:05'),
(1794, 5970330164001, 'reference_id', 'Ashish Highlight 6- 1109', '2018-11-27 05:04:05', '2018-11-27 05:04:05'),
(1795, 5970330164001, 'schedule', NULL, '2018-11-27 05:04:05', '2018-11-27 05:04:05'),
(1796, 5970330164001, 'sharing', NULL, '2018-11-27 05:04:05', '2018-11-27 05:04:05'),
(1797, 5970330164001, 'state', 'ACTIVE', '2018-11-27 05:04:05', '2018-11-27 05:04:05'),
(1798, 5970330164001, 'tags', 'a:5:{i:0;s:15:"equity sahi hai";i:1;s:9:"investing";i:2;s:30:"motilal oswal asset management";i:3;s:13:"the moneymile";i:4;s:9:"vivek law";}', '2018-11-27 05:04:05', '2018-11-27 05:04:05'),
(1799, 5970330164001, 'text_tracks', 'a:0:{}', '2018-11-27 05:04:05', '2018-11-27 05:04:05'),
(1800, 5970330164001, 'updated_at', '2018-11-22T07:41:29.353Z', '2018-11-27 05:04:06', '2018-11-27 05:04:06');

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `mm_menus`
--
ALTER TABLE `mm_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5857645392002;
--
-- AUTO_INCREMENT for table `mm_playlist_metas`
--
ALTER TABLE `mm_playlist_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;
--
-- AUTO_INCREMENT for table `mm_reason_for_account_deactivations`
--
ALTER TABLE `mm_reason_for_account_deactivations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mm_roles`
--
ALTER TABLE `mm_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `mm_translations`
--
ALTER TABLE `mm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mm_users`
--
ALTER TABLE `mm_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `mm_user_comments`
--
ALTER TABLE `mm_user_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `mm_user_metas`
--
ALTER TABLE `mm_user_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `mm_user_wishlists`
--
ALTER TABLE `mm_user_wishlists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `mm_videos`
--
ALTER TABLE `mm_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5970330165002;
--
-- AUTO_INCREMENT for table `mm_video_metas`
--
ALTER TABLE `mm_video_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1801;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
