-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 08, 2019 at 04:02 PM
-- Server version: 5.7.24-0ubuntu0.16.04.1
-- PHP Version: 7.2.13-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `money_mile`
--

--
-- Dumping data for table `mm_users`
--

INSERT INTO `mm_users` (`id`, `role_id`, `name`, `email`, `mobile`, `avatar`, `state`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(23, 1, 'themoneymile', 'admin@themoneymile.com', '9212376832', NULL, 2, '$2y$10$S.2DD09i5d5Nr92xwVfoGOZZ3JWUSVPPdO4q8oNmgj.9CnD9j5HFq', 'TfLxmwqyhx4O16cAlk8WKnmHMtq6B60Z66M3pMiQexEZ3OyUQhUmepsaeUjl', '2018-09-03 01:48:39', '2018-09-21 05:59:06');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
