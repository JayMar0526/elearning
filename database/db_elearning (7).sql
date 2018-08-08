-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 192.168.83.143
-- Generation Time: Aug 07, 2018 at 11:28 AM
-- Server version: 5.6.33-0ubuntu0.14.04.1
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_elearning`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('Administrator', '1', 1533372515),
('Student', '4', 1533462400),
('Teacher', '3', 1533372586);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('Administrator', 1, '', NULL, NULL, 1533372488, 1533372488),
('Student', 1, '', NULL, NULL, 1533461590, 1533461590),
('Teacher', 1, '', NULL, NULL, 1533372502, 1533372502);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cr_code`
--

CREATE TABLE IF NOT EXISTS `cr_code` (
`id` int(11) NOT NULL,
  `code` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cr_code`
--

INSERT INTO `cr_code` (`id`, `code`, `user_id`) VALUES
(1, 'maaasahan', 3),
(2, 'mabuti', 1),
(3, 'mapagkakatiwalaan', 1),
(4, 'malinis', 1),
(5, 'mahusay', 3);

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE IF NOT EXISTS `file` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `itemId` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `mime` varchar(255) NOT NULL,
  `is_main` tinyint(1) DEFAULT '0',
  `date_upload` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `file`
--

INSERT INTO `file` (`id`, `name`, `model`, `itemId`, `hash`, `size`, `type`, `mime`, `is_main`, `date_upload`, `sort`) VALUES
(11, 'L1', 'Lesson', 1, '7435d63038ed37a8bb25bd1cf613ce60', 159848, 'png', 'image/png', 0, 1533391567, 1),
(17, 'Picture1', 'Topic', 1, '8c9498c8679fcdacab7075c5c9622b34', 53231, 'png', 'image/png', 0, 1533432978, 1),
(18, 'Picture2', 'Topic', 3, '5ce6c30bc15bad9df674498516ddd437', 232788, 'png', 'image/png', 0, 1533433084, 1),
(19, 'Picture3', 'Topic', 8, '3800b04b3b7368cbd611509ea25d6d48', 16375, 'jpg', 'image/jpeg', 0, 1533433140, 1),
(20, 'Picture4', 'Topic', 9, '5abaaefec2195f60a09662d267a5f09c', 45418, 'png', 'image/png', 0, 1533433162, 1),
(23, 'Picture5', 'Topic', 4, '16dd489a5b50ae431743730a674b6aa8', 37065, 'png', 'image/png', 0, 1533451391, 1),
(24, 'Picture1', 'Topic', 16, 'ed40aad5faa904a0c34c1dd3d1634475', 6762, 'png', 'image/png', 0, 1533453594, 1),
(25, 'q1', 'Questions', 41, '19380868b8785b482c811702d1806fae', 7569, 'png', 'image/png', 0, 1533453672, 1),
(26, 'q2', 'Questions', 42, 'bac2dd4e41da6b0210903c0b1216b971', 10784, 'png', 'image/png', 0, 1533453753, 1),
(27, 'q3', 'Questions', 43, '174cef00c97c34cd029b57f02234f1d0', 1480, 'png', 'image/png', 0, 1533453816, 1),
(28, 'q4', 'Questions', 44, 'd934ea9162894e2ed2d3e9e2ca02bdf5', 5820, 'png', 'image/png', 0, 1533453844, 1),
(29, 'q5', 'Questions', 45, '66b70ffa179b2ec817201342c30f1cf2', 3025, 'png', 'image/png', 0, 1533453864, 1),
(30, 'q6', 'Questions', 46, '23eb33c40e9fbb939d21184a2ac54759', 4049, 'png', 'image/png', 0, 1533453928, 1),
(31, 'Picture2', 'Topic', 17, '6cfab866d57fa341a5a5beaf4630864a', 11079, 'gif', 'image/gif', 0, 1533454056, 1),
(32, 'r1', 'Questions', 47, '7362b4a74a67669b281715f347320f32', 102731, 'png', 'image/png', 0, 1533454141, 1),
(33, 'r2', 'Questions', 48, 'faf0cc03f09d3e30181495db14621c25', 121187, 'png', 'image/png', 0, 1533454219, 1),
(34, 'r3', 'Questions', 49, '7e3f09955d48acee3ee44c7b7e1a3e6a', 111332, 'png', 'image/png', 0, 1533454251, 1),
(35, 'r4', 'Questions', 50, 'a51f53f5d8ded48dc5a33957a5e0a759', 142008, 'png', 'image/png', 0, 1533454280, 1),
(36, 's1', 'Topic', 18, 'bbe89f7a1ec2263faeab0540a7475784', 29963, 'png', 'image/png', 0, 1533454430, 1),
(37, 's2', 'Topic', 19, '9e6e95e3c3660e6b69666e40feb665cb', 27407, 'png', 'image/png', 0, 1533454464, 1),
(38, 't1', 'Questions', 61, 'c63916a10c33b56f3af442ba09e6ab3d', 8392, 'jpg', 'image/jpeg', 0, 1533455848, 1),
(39, 't2', 'Questions', 62, '4494041788d1f3ec4f8705aa86b28f89', 8953, 'PNG', 'image/png', 0, 1533455875, 1),
(40, 't3', 'Questions', 63, 'ab3271592826d66c44c1723264496385', 8851, 'PNG', 'image/png', 0, 1533455898, 1),
(41, 't4', 'Questions', 64, '7e7d6825e190f422bdccf737b781a2aa', 8062, 'PNG', 'image/png', 0, 1533455914, 1),
(42, 't5', 'Questions', 65, 'cda5c39f54db93ed6ad5f10ae9fbffad', 8123, 'PNG', 'image/png', 0, 1533455929, 1),
(43, 't6', 'Questions', 66, 'c1cd6fd3961b4ae569e8dd71e2dc9859', 8250, 'PNG', 'image/png', 0, 1533455945, 1),
(44, 't7', 'Questions', 67, '980f235d66406bff265ded4411ddf531', 8592, 'PNG', 'image/png', 0, 1533455967, 1),
(45, 't8', 'Questions', 68, '25a9de05eaf7205d82106bcbfdb7da82', 8344, 'PNG', 'image/png', 0, 1533455997, 1),
(46, 't9', 'Questions', 69, '4d70e037155bbdbbdb04a7e54844dc4d', 8885, 'PNG', 'image/png', 0, 1533456018, 1),
(47, 'Capture', 'Topic', 25, 'e46421344cd5db7215fd05d5d720ec90', 67907, 'PNG', 'image/png', 0, 1533456530, 1),
(48, 'Picture3', 'Topic', 26, '025b9574c081265282c13981ab6a2528', 17930, 'png', 'image/png', 0, 1533456589, 1),
(49, 'lesson 57 - fractions', 'Lesson', 3, '670ad7c9569bfe9a1b7fec5e2738c7f3', 238838, 'png', 'image/png', 0, 1533472438, 1),
(50, 'lesson 56 - fractions', 'Lesson', 2, '4a47de5cd34a3a4aed7c913da210f1e2', 275211, 'png', 'image/png', 0, 1533472452, 1),
(51, 'lesson 58 - fractions', 'Lesson', 4, '2f2e1cceee908081bfcfc2146aebf04c', 209343, 'png', 'image/png', 0, 1533472519, 1),
(53, 'lesson 61 - arranging dissimilar fractions', 'Lesson', 6, 'efe930ae855def9dbd5874fca2859285', 301349, 'png', 'image/png', 0, 1533472653, 1),
(54, 'lesson 62 - equivalent fractions', 'Lesson', 7, 'c7a4b5e6cbd6710266dd6312ae301acc', 163062, 'png', 'image/png', 0, 1533472683, 1),
(55, 'lesson 63 - points, line etc', 'Lesson', 8, '908ebfa4443ff1509beadc504c5039cc', 160506, 'png', 'image/png', 0, 1533473571, 1),
(56, 'lesson 64 - line segment na magkapareho ang haba', 'Lesson', 9, '8c0cf2cf598e04eb4e2e8219c6933da0', 142532, 'png', 'image/png', 0, 1533473606, 1),
(57, 'lesson 65 - linyang perpendicular, parallel at intersecting', 'Lesson', 10, '55ba65e5ec62c8f09d7eaf64297baf57', 291971, 'png', 'image/png', 0, 1533473643, 1),
(58, 'lesson 66 - simitri', 'Lesson', 11, '667d356fdee8c806f1cd50c3d0b54a51', 327763, 'png', 'image/png', 0, 1533473680, 1),
(59, 'lesson 67 - linyang simitriko', 'Lesson', 12, '35917012c310a7061785b8b13ccf19ed', 439514, 'png', 'image/png', 0, 1533473713, 1),
(62, 'lesson 70 - term sa pattern', 'Lesson', 15, 'a9a1e38bc2c92cee2c41d4655b0696b1', 199185, 'png', 'image/png', 0, 1533474092, 1),
(63, 'lesson 71 - missing value', 'Lesson', 16, '6d878b3fc50e3b0cb7e8fb991699183d', 194401, 'png', 'image/png', 0, 1533474132, 1),
(64, 'lesson 68 - pagbuo ng hugis simitriko', 'Lesson', 13, 'd8ed3831b5303490cf5d450f343940b5', 148536, 'png', 'image/png', 0, 1533474153, 1),
(65, 'lesson 69 - tessellation', 'Lesson', 14, '4d97d9e91908872358d0f09d6b02512c', 341392, 'png', 'image/png', 0, 1533474174, 1),
(66, 'lesson 59 - visualizing dissimilar fractions', 'Lesson', 5, '68a0290e4607c4e76656b4aa478a7435', 207216, 'png', 'image/png', 0, 1533475211, 1),
(67, 'lesson 60 - comparing dissimilar fractions', 'Lesson', 17, '25eb5b6ab58c8cae4f595f3eb8128940', 314232, 'png', 'image/png', 0, 1533475289, 1),
(68, 'dp', 'Topic', 27, '50dd53b80e8cf4842ba0d496c6b3bb90', 41487, 'png', 'image/png', 0, 1533633457, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE IF NOT EXISTS `lessons` (
`id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `purpose` text COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `title`, `purpose`, `code`) VALUES
(1, 'Mga Bilang na Odd at Even', '<p><strong>Layunin:&nbsp;</strong><em>Natutukoy ang mga bilang na odd at even</em></p>', 'aralin55'),
(2, 'Fractions na Katumbas ng Isa at Higit sa Isang Buo', '<p><strong>Layunin</strong><strong>: </strong><em>Naipapakita</em><em> ang fractions </em><em>na</em> <em>katumbas</em><em> ng </em><em>isa</em><em> at </em><em>higit</em> <em>sa</em> <em>isang</em> <em>buo</em></p>', 'aralin56'),
(3, 'Pagbabasa at Pagsusulat ng Fraction ng Higit sa Isa', '', 'aralin57'),
(4, 'Pagpapakita ng Fraction Gamit ang Regions, Sets, at Numberlines', '', 'aralin58'),
(5, 'Pagpapakita (Visualizing) ng Dissimilar Fraction', '', 'aralin59'),
(6, 'Pagsusunod-sunod (Arrangin) ng Dissimilar Fractions', '', 'aralin61'),
(7, 'Magkatumbas (Equivalent) na Fractions', '', 'aralin62'),
(8, 'Mga Point, linya (Line), Line Segment, at Ray', '', 'aralin63'),
(9, 'Mga Line Segment na Magkapareho ang Haba', '', 'aralin64'),
(10, 'Mga Linyang Perpendicular, Parallel, at Interesting', '', 'aralin65'),
(11, 'Simitri sa Kapalgiiran at sa mga Disenyo', '', 'aralin66'),
(12, 'Linya ng Simitri sa mga Hugis na Simitriko', '', 'aralin67'),
(13, 'Pagbuo ng mga Hugis na Simitriko', '', 'aralin68'),
(14, 'Pagtetesellate ng mga Hugis', '', 'aralin69'),
(15, 'Pagtukoy sa Nawawalang Term sa Isang Pattern', '', 'aralin70'),
(16, 'Paghahanap ng Nawawalang Value sa Isang Pamilang na Pangungusap', '', 'aralin71'),
(17, 'Paghahambing (Comparing) ng Dissimilar Fractions', '', 'aralin60');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_category`
--

CREATE TABLE IF NOT EXISTS `lesson_category` (
`id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lesson_category`
--

INSERT INTO `lesson_category` (`id`, `title`) VALUES
(1, 'Panimula'),
(2, 'Alamin Natin'),
(3, 'Isagawa Natin'),
(4, 'Isapuso Natin'),
(5, 'Isabuhay Natin'),
(6, 'Subukin Natin'),
(7, 'Takdang Aralin');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1533208716),
('m130524_201442_init', 1533208719),
('m140209_132017_init', 1533210643),
('m140403_174025_create_account_table', 1533210645),
('m140504_113157_update_tables', 1533210649),
('m140504_130429_create_token_table', 1533210709),
('m140506_102106_rbac_init', 1533372399),
('m140830_171933_fix_ip_field', 1533210711),
('m140830_172703_change_account_table_name', 1533210711),
('m141222_110026_update_ip_field', 1533210712),
('m141222_135246_alter_username_length', 1533210713),
('m150127_040544_files', 1533381355),
('m150614_103145_update_social_account_table', 1533210716),
('m150623_212711_fix_username_notnull', 1533210717),
('m151218_234654_add_timezone_to_profile', 1533210717),
('m160929_103127_add_last_login_at_to_user_table', 1533210718),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1533372400);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`, `timezone`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
`id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ans` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `topic_id`, `title`, `ans`, `unit_id`) VALUES
(6, 1, '1', '12', 3),
(7, 1, '2', '13', 3),
(8, 1, '3', '15', 3),
(9, 1, '4', '17', 3),
(10, 1, '5', '20', 3),
(11, 2, '45 + 14 =', '22', 3),
(12, 2, '52 + 14 = ', '24', 3),
(13, 2, '31 + 52 =', '29', 3),
(14, 2, '12 + 10 =', '31', 3),
(15, 2, '25 + 31', '35', 3),
(16, 6, '1) 26', '37', 3),
(17, 6, '2) 18', '39', 3),
(18, 6, '3) 79', '40', 3),
(19, 6, '4) 15', '42', 3),
(20, 6, '5) 89', '44', 3),
(21, 6, '6) 101', '46', 3),
(22, 6, '7) 238', '49', 3),
(23, 6, '8) 454', '51', 3),
(24, 6, '9) 500', '53', 3),
(25, 6, '10) 873', '54', 3),
(26, 8, '1. Ako ay bilang na odd na mas maliit sa 80 pero mas malaki sa77?', '79', 1),
(27, 8, '2. Ako ay bilang na even na mas malaki sa 1 396 pero mas maliit sa 1 400?', '1398', 1),
(28, 8, '3. Ako ay bilang na odd na mas malaki sa 122 pero mas maliit sa 125?', '123', 1),
(29, 8, '4. Ako ay bilang na even na mas malaki sa 2 202 pero mas maliit sa 2 205?', '2204', 1),
(30, 8, '5. Ako ang pinakamalaking bilang na odd na mas maliit sa 600?', '599', 1),
(31, 9, '1.  Alin sa mga  sumusunod ang bilang na even?', '58', 3),
(32, 9, '2.  Alin sa mga  sumusunod ang bilang na odd?', '61', 3),
(33, 9, '3. Alin sa mga  sumusunod ang bilang na hindi even?', '64', 3),
(34, 9, '4. Alin sa mga  sumusunod ang bilang na hindi odd?', '70', 3),
(35, 9, '5. Alin sa mga  sumusunod ang bilang na odd?', '75', 3),
(36, 10, '1. 23', '76', 3),
(37, 10, '2. 91', '78', 3),
(38, 10, '3. 58', '81', 3),
(39, 10, '4. 70', '83', 3),
(40, 10, '5. 64', '85', 3),
(41, 16, '1', '2/4', 1),
(42, 16, '2', '2/5', 1),
(43, 16, '3', '1/3', 1),
(44, 16, '4', '1/4', 1),
(45, 16, '5', '5/8', 1),
(46, 16, '6', '2/3', 1),
(47, 17, '1', '1/3 1/5 2/5 3/5 1/4', 1),
(48, 17, '2', '1/5 1/3 1/2 1/4 2/4', 1),
(49, 17, '3', '1/2 4/5 1/3 1/5 2/3', 1),
(50, 17, '4', '1/2 1/3 1/5 4/3 1/2', 1),
(51, 20, '1. 12/12', '86', 3),
(52, 20, '2. 8/5', '89', 3),
(53, 20, '3. 18/13', '91', 3),
(54, 20, '4. 6/6', '92', 3),
(55, 20, '5. 9/6', '95', 3),
(56, 20, '6. 9/8', '97', 3),
(57, 20, '7. 9/9', '98', 3),
(58, 20, '8. 5/5', '100', 3),
(59, 20, '9. 8/7', '103', 3),
(60, 20, '10. 11/9', '105', 3),
(61, 23, '1.', '106', 3),
(62, 23, '2.', '109', 3),
(63, 23, '3. ', '111', 3),
(64, 23, '4.', '113', 3),
(65, 23, '5. ', '114', 3),
(66, 23, '6.', '117', 3),
(67, 23, '7.', '118', 3),
(68, 23, '8.', '121', 3),
(69, 23, '9.', '122', 3),
(70, 24, '1. Ako ay fraction na katumbas ng isang buo. Meron akong denominator na 5.', '124', 3),
(71, 24, '2. Ako ay fraction na nagpapakita ng 9 sa numerator at 8 sa denominator.', '128', 3),
(72, 24, '3. Ako ay fraction na katumbas ng isang buo. Meron akong numerator na 10.', '132', 3),
(73, 24, '4. Ako ay fraction na nagpapakita ng 7 sa denominator at 12 sa numerator.', '135', 3),
(74, 24, '5. Ako ay fraction na higit sa isang buo. Meron akong 6 sa numerator.', '137', 3);

-- --------------------------------------------------------

--
-- Table structure for table `question_choices`
--

CREATE TABLE IF NOT EXISTS `question_choices` (
`id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `choice` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `question_choices`
--

INSERT INTO `question_choices` (`id`, `question_id`, `choice`, `order`) VALUES
(11, 6, '7', NULL),
(12, 6, '9', NULL),
(13, 7, '19', NULL),
(14, 7, '15', NULL),
(15, 8, '85', NULL),
(16, 8, '74', NULL),
(17, 9, '123', NULL),
(18, 9, '113', NULL),
(19, 10, '2314', NULL),
(20, 10, '4312', NULL),
(21, 11, 'a. 58', NULL),
(22, 11, 'b. 59', NULL),
(23, 11, 'c. 60', NULL),
(24, 12, 'a. 75', NULL),
(25, 12, 'b. 74', NULL),
(26, 12, 'c. 73', NULL),
(27, 13, 'a. 81', NULL),
(28, 13, 'b. 82', NULL),
(29, 13, 'c. 83', NULL),
(30, 14, 'a. 32', NULL),
(31, 14, 'b. 22', NULL),
(32, 14, 'c. 12', NULL),
(33, 15, 'a. 60', NULL),
(34, 15, 'b. 58', NULL),
(35, 15, 'c. 56', NULL),
(36, 16, 'odd', NULL),
(37, 16, 'even', NULL),
(38, 17, 'odd', NULL),
(39, 17, 'even', NULL),
(40, 18, 'odd', NULL),
(41, 18, 'even', NULL),
(42, 19, 'odd', NULL),
(43, 19, 'even', NULL),
(44, 20, 'odd', NULL),
(45, 20, 'even', NULL),
(46, 21, 'odd', NULL),
(47, 21, 'even', NULL),
(48, 22, 'odd', NULL),
(49, 22, 'even', NULL),
(50, 23, 'odd', NULL),
(51, 23, 'even', NULL),
(52, 24, 'odd', NULL),
(53, 24, 'even', NULL),
(54, 25, 'odd', NULL),
(55, 25, 'even', NULL),
(56, 31, 'a. 23', NULL),
(57, 31, 'b. 35', NULL),
(58, 31, 'c. 38', NULL),
(59, 31, 'd. 51', NULL),
(60, 32, 'a. 82', NULL),
(61, 32, 'b. 71', NULL),
(62, 32, 'c. 60', NULL),
(63, 32, 'd. 94', NULL),
(64, 33, 'a. 33', NULL),
(65, 33, 'b. 92', NULL),
(66, 33, 'c. 48', NULL),
(67, 33, 'd. 22', NULL),
(68, 34, 'a. 11', NULL),
(69, 34, 'b. 77', NULL),
(70, 34, 'c. 68', NULL),
(71, 34, 'd. 53', NULL),
(72, 35, 'a. 44', NULL),
(73, 35, 'b. 76', NULL),
(74, 35, 'c. 58', NULL),
(75, 35, 'd. 27', NULL),
(76, 36, 'Odd', NULL),
(77, 36, 'Even', NULL),
(78, 37, 'Odd', NULL),
(79, 37, 'Even', NULL),
(80, 38, 'Odd', NULL),
(81, 38, 'Even', NULL),
(82, 39, 'Odd', NULL),
(83, 39, 'Even', NULL),
(84, 40, 'Odd', NULL),
(85, 40, 'Even', NULL),
(86, 51, 'isang buo', NULL),
(87, 51, 'higit sa isang buo', NULL),
(88, 52, 'isang buo', NULL),
(89, 52, 'higit sa isang buo', NULL),
(90, 53, 'isang buo', NULL),
(91, 53, 'higit sa isang buo', NULL),
(92, 54, 'isang buo', NULL),
(93, 54, 'higit sa isang buo', NULL),
(94, 55, 'isang buo', NULL),
(95, 55, 'higit sa isang buo', NULL),
(96, 56, 'isang buo', NULL),
(97, 56, 'higit sa isang buo', NULL),
(98, 57, 'isang buo', NULL),
(99, 57, 'higit sa isang buo', NULL),
(100, 58, 'isang buo', NULL),
(101, 58, 'higit sa isang buo', NULL),
(102, 59, 'isang buo', NULL),
(103, 59, 'higit sa isang buo', NULL),
(104, 60, 'isang buo', NULL),
(105, 60, 'higit sa isang buo', NULL),
(106, 61, 'FE=1', NULL),
(107, 61, 'FM>1', NULL),
(108, 62, 'FE=1', NULL),
(109, 62, 'FM>1', NULL),
(110, 63, 'FE=1', NULL),
(111, 63, 'FM>1', NULL),
(112, 64, 'FE=1', NULL),
(113, 64, 'FM>1', NULL),
(114, 65, 'FE=1', NULL),
(115, 65, 'FM>1', NULL),
(116, 66, 'FE=1', NULL),
(117, 66, 'FM>1', NULL),
(118, 67, 'FE=1', NULL),
(119, 67, 'FM>1', NULL),
(120, 68, 'FE=1', NULL),
(121, 68, 'FM>1', NULL),
(122, 69, 'FE=1', NULL),
(123, 69, 'FM>1', NULL),
(124, 70, 'a. 5/5', NULL),
(125, 70, 'b/ 6/5', NULL),
(126, 70, 'c. 5/6', NULL),
(127, 71, 'a. 8/9', NULL),
(128, 71, 'b. 9/8', NULL),
(129, 71, 'c. 9/9', NULL),
(130, 72, 'a. 1/10', NULL),
(131, 72, 'b. 10/1', NULL),
(132, 72, 'c. 10/10', NULL),
(133, 73, 'a. 12/7', NULL),
(134, 73, 'b. 7/7', NULL),
(135, 73, 'c. 7/12', NULL),
(136, 74, 'a. 5/6', NULL),
(137, 74, 'b. 6/4', NULL),
(138, 74, 'c. 6/6', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
`id` int(11) NOT NULL,
  `stud_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `date_taken` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_account`
--

CREATE TABLE IF NOT EXISTS `social_account` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
`id` int(11) NOT NULL,
  `ln` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `fn` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `mn` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `ln`, `fn`, `mn`, `cr_id`) VALUES
(1, 'Matias', 'Jay Mar', 'Mejia', 1),
(2, 'Aringo', 'Christine', 'Abarro', 1),
(3, 'Mateo', 'Kennedy', 'Bote', 1),
(4, 'Matias', 'Niel Francis', 'Cruz', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stud_answers`
--

CREATE TABLE IF NOT EXISTS `stud_answers` (
`id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE IF NOT EXISTS `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`user_id`, `code`, `created_at`, `type`) VALUES
(1, 'FGZez0gNxJYExFY69A4HhpEF_iw-Dr7q', 1533210815, 0);

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE IF NOT EXISTS `topic` (
`id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passing_grade` int(11) DEFAULT '0',
  `instruction` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`id`, `category_id`, `lesson_id`, `title`, `passing_grade`, `instruction`) VALUES
(1, 1, 1, 'Magsanay Tayo', 3, 'Panuto: Alin ang mas malaking bilang? I- click ang katabing bilog ng bilang na tamang sagot.'),
(2, 1, 1, 'Balik Aralan Natin', 3, 'Ibigay ang kabuuang bilang. I-click ang titik na tamang sagot.'),
(3, 1, 1, 'Maglaro Tayo', NULL, '"Putukin and Lobo"\r\n\r\nPanuto: \r\n1. Ipangkat ang klase sa 4. Bawat pangkat ay bibigyan ng 10 lobo na may lamang bilang sa loob na dapat putukin. \r\n2. Ang mga bilang sa loob ay ilalagay sa tsart ng bilang na maaaring hatiin sa dalawa at tsart ng bilang na hindi maaaring\r\nhatiin sa dalawa.\r\n3. Ang pangkat na maraming naputok at nailagay sa tamang tsart sa loob ng 3 minuto ang tatanghaling panalo.\r\n'),
(4, 2, 1, 'Ang SOLUSYON sa PROBLEMA?', NULL, 'Ang klase ni Gng. Santos ay sasali sa isang palatuntunan ng paaralan kung kaya’t pinapila niya ang kaniyang mag-aaral sa dalawang \r\nhanay. Kasama niya ang 24 na mag-aaral, kung papahanayin niya ang mga bata sa dalawang linya, lahat ba ay magkakaroon ng \r\nkapareha? Bakit? Paano kung ang bilang ng mag-aaral ay 23 lamang, lahat ba ng bata ay magkakaroon ng kapareha? Bakit?\r\n'),
(5, 2, 1, 'Basahin at unawain', NULL, '• Lahat ng mga bilang na even ay may kapares.\r\n• Lahat ng mga bilang na odd ay may isang walang kapares.\r\n\r\n• Ang mga bilang na even ay nagtatapos sa 0, 2, 4, 6 o 8.\r\n• Ang mga bilang na odd ay nagtatapos sa 1, 3, 5, 7, o 9.\r\n\r\nMaaaring nalaman kung Odd o Even ang bilang ng kabuuan.\r\nHalimbawa:\r\n✔ 2 + 6 =  8	Ang kabuuan ng dalawang even na bilang ay 		Even.\r\n✔ 5 + 9 = 14	Ang kabuuan ng dalawang odd na bilang ay 			Even.\r\n✔ 2 + 5 =  7	Ang kabuuan ng isang even at isang odd na bilang 		ay Odd.\r\n'),
(6, 3, 1, 'Odd or Even', 5, 'Panuto: Suriin ang bawat bilang kung ito ay odd o even.\r\n'),
(7, 4, 1, 'Tandaan mo ako!', NULL, '◘ Ano ang mga bilang na even?\r\n✔ Lahat ng mga bilang na even ay may kapares.\r\n✔ Ang mga bilang na even ay nagtatapos sa 0, 2, 4, 6 o 8.\r\n✔ Ang kabuuan ng dalawang even na bilang ay Even.\r\n✔ Ang kabuuan ng dalawang odd na bilang ay Even.\r\n\r\n◘ Ano ang mga bilang na odd?\r\n✔ Lahat ng mga bilang na odd ay may isang walang kapares.\r\n✔ Ang mga bilang na odd ay nagtatapos sa 1, 3, 5, 7, o 9.\r\n✔ Ang kabuuan ng isang even at isang odd na bilang ay Odd.\r\n'),
(8, 5, 1, 'Sino AKO?', 3, 'Ginabayang Gawain\r\nPanuto: Tukuyin ang bilang na isinasaad sa sumusunod na sitwasyon. Isulat ang tamang sagot sa patlang.\r\n'),
(9, 5, 1, 'Alin ang TAMA?', 3, 'Indibidwal na Gawain\r\nPanuto: I-Click ang button sa unahan ng titik ng tamang sagot.\r\n'),
(10, 6, 1, 'Piliing MABUTI!', 3, 'Panuto: Tukuyin kung ang bilang ay Odd o Even. Pindutin ang bilog ng napiling sagot.\r\n'),
(11, 7, 1, 'Magandang HALIMBAWA!', NULL, 'Panuto: Magbigay ng 10 halimbawa ng bilang na Odd at 10 halimbawa ng bilang na Even.\r\n'),
(16, 1, 2, 'Magsanay Tayo', 3, 'Panuto: Ibigay ang fraction. Pumili ng tamang sagot sa kahon'),
(17, 1, 2, 'Balik-Aralan Natin!', 2, 'MAGUNAHAN TAYO!\r\n\r\nPanuto: Paunahan sa pag-lalagay ng tamang fraction sa loob ng isang minute. Isulat ang sagot sa  papel.'),
(18, 2, 2, 'Tingnan ang mga hugis sa ibaba.', NULL, '• Sa ilang bahagi hinati-hati na may magkakaparehong laki ang hugis A? Hugis B? Hugis C?\r\n\r\n• Ano ang tawag sa sumusunod na fraction na 2/2, 4/4, 8/8?\r\n'),
(19, 2, 2, 'Tingnan ang number line sa ibaba.', NULL, '• Anong napapansin ninyo sa numerator? Sa denominator?\r\n\r\n• Ano ang tawag sa fraction na 3/2 at 4/3? \r\n'),
(20, 3, 2, 'Isagawa Natin!', 5, 'Panuto: Markarahan ang bilog na katabi ng fraction na nagpapakita ng katumbas ng isang buo sa pamamagitan ng pag-click sa bilog. Huwag markahan ang bilog na katabi ng fraction na nagpapakita ng higit sa isang buo.\r\n'),
(21, 4, 2, 'Ating alamin!', NULL, '• Ano ang mga fraction na katumbas ng isang buo? Sagot(Hide)\r\n✔ Ang fraction ay tinatawag na katumbas ng isang buo kapag ang numerator at denominator nito ay magkapareho. \r\n\r\n• Ano ang mga fraction na higit sa isang buo? Sagot(Hide)\r\n✔Ang fraction ay tinatawag na higit sa isang buo kapag ang numerator ay mas malaki kaysa denominator nito. \r\n'),
(22, 5, 2, 'Lumikha Tayo!', NULL, 'Ginabayang Gawain (Pangkatang Gawain)\r\n1. Pangkatin ang klase sa 4 na pangkat.\r\n2. Bawat pangkat ay pipili ng pinuno ng pangkat at bibigyan ng 10 metacards.\r\n3. Bawat pangkat ay kailangang gumuhit ng 5 fraction na nagpapakita ng katumbas ng isa at 5 fraction na nagpapakita ng fraction na higit sa isa sa metacards.\r\n'),
(23, 5, 2, 'Alin ang Tama', 5, 'Panuto: I-click ang FE=1 kung ang fraction ay katumbas ng isang buo at  FM>1 kung ang fraction ay higit sa isang buo.\r\n\r\n\r\nMAGSEARCH NG FRACTION . . . . .. . '),
(24, 6, 2, '', 3, 'Panuto: I-click ang letra na tamang sagot sa mga sumusunod na pahayag.'),
(25, 7, 2, '', NULL, 'Punan ang talahanayan ng mga Fraction na mula sa kariton. Isulat ang sagot sa papel.\r\n'),
(26, 7, 2, 'Sagot', NULL, 'Narito ang mga sagot.'),
(27, 7, 1, 'Sample', NULL, 'Isulati');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE IF NOT EXISTS `unit` (
`id` int(11) NOT NULL,
  `unit` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `unit`) VALUES
(1, 'Textbox'),
(2, 'Dropdown'),
(3, 'RadioButton');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `last_login_at` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `lastname`, `firstname`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `last_login_at`) VALUES
(1, 'Admin', 'Admin', 'admin', 'jmar.matias26@gmail.com', '$2y$10$aPvJA8LCa7Usqla.0Cdi..cV3Qsr8gNEgU97NSVVLuFNt6lwJRn8K', 'wmS8t4oKIBSFmGvy198hUyJbQc4aO3kZ', 123344, NULL, NULL, '::1', 1533210814, 1533356354, 0, 1533633179),
(3, 'Teacher', 'Teacher', 'teacher', 'teacher@mail.com', '$2y$10$VB9/TerWMnOtBYtwBeWhOeWPAfbqKypjesyqFr.pma4x4uABNCqk2', 'WTNrxLGhphOzQ9A8nbL0YoiTv_c5tEJv', 1533372550, NULL, NULL, '::1', 1533372550, 1533462118, 0, 1533480442),
(4, 'Student', 'Student', 'student', 'aa@mail.com', '$2y$10$2ctRLxxspWE7AOkdp1oxIuz0gfsMwywHrOVQJrz3hOwJ9eYv.RKT.', '78XZ-kmmsKCFXZy8SdgqtTfF5HoWqPFL', 1533461564, NULL, NULL, '::1', 1533461564, 1533462108, 0, 1533480413);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
 ADD PRIMARY KEY (`item_name`,`user_id`), ADD KEY `auth_assignment_user_id_idx` (`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
 ADD PRIMARY KEY (`name`), ADD KEY `rule_name` (`rule_name`), ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
 ADD PRIMARY KEY (`parent`,`child`), ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
 ADD PRIMARY KEY (`name`);

--
-- Indexes for table `cr_code`
--
ALTER TABLE `cr_code`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `code_UNIQUE` (`code`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
 ADD PRIMARY KEY (`id`), ADD KEY `file_model` (`model`), ADD KEY `file_item_id` (`itemId`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lesson_category`
--
ALTER TABLE `lesson_category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
 ADD PRIMARY KEY (`version`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
 ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
 ADD PRIMARY KEY (`id`), ADD KEY `topic_id` (`topic_id`), ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `question_choices`
--
ALTER TABLE `question_choices`
 ADD PRIMARY KEY (`id`), ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
 ADD PRIMARY KEY (`id`), ADD KEY `stud_id` (`stud_id`), ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `social_account`
--
ALTER TABLE `social_account`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `account_unique` (`provider`,`client_id`), ADD UNIQUE KEY `account_unique_code` (`code`), ADD KEY `fk_user_account` (`user_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
 ADD PRIMARY KEY (`id`), ADD KEY `cr_id` (`cr_id`);

--
-- Indexes for table `stud_answers`
--
ALTER TABLE `stud_answers`
 ADD PRIMARY KEY (`id`), ADD KEY `quiz_id` (`quiz_id`), ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
 ADD UNIQUE KEY `token_unique` (`user_id`,`code`,`type`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
 ADD PRIMARY KEY (`id`), ADD KEY `lesson_id` (`lesson_id`), ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_unique_username` (`username`), ADD UNIQUE KEY `user_unique_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cr_code`
--
ALTER TABLE `cr_code`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `lesson_category`
--
ALTER TABLE `lesson_category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT for table `question_choices`
--
ALTER TABLE `question_choices`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `social_account`
--
ALTER TABLE `social_account`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `stud_answers`
--
ALTER TABLE `stud_answers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question_choices`
--
ALTER TABLE `question_choices`
ADD CONSTRAINT `question_choices_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`stud_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `quiz_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `social_account`
--
ALTER TABLE `social_account`
ADD CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`cr_id`) REFERENCES `cr_code` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stud_answers`
--
ALTER TABLE `stud_answers`
ADD CONSTRAINT `stud_answers_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `stud_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `token`
--
ALTER TABLE `token`
ADD CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `topic`
--
ALTER TABLE `topic`
ADD CONSTRAINT `category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `lesson_category` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
