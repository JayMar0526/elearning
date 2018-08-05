-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 192.168.83.143    Database: db_elearning
-- ------------------------------------------------------
-- Server version	5.6.33-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('Administrator','1',1533372515),('Teacher','3',1533372586);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('Administrator',1,'',NULL,NULL,1533372488,1533372488),('Teacher',1,'',NULL,NULL,1533372502,1533372502);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cr_code`
--

DROP TABLE IF EXISTS `cr_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cr_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cr_code`
--

LOCK TABLES `cr_code` WRITE;
/*!40000 ALTER TABLE `cr_code` DISABLE KEYS */;
INSERT INTO `cr_code` VALUES (1,'Maaasahan',3),(2,'Mabuti',1),(3,'Mapagkakatiwalaan',1),(4,'Malinis',1),(5,'Mahusay',3);
/*!40000 ALTER TABLE `cr_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `itemId` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `mime` varchar(255) NOT NULL,
  `is_main` tinyint(1) DEFAULT '0',
  `date_upload` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `file_model` (`model`),
  KEY `file_item_id` (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (11,'L1','Lesson',1,'7435d63038ed37a8bb25bd1cf613ce60',159848,'png','image/png',0,1533391567,1),(17,'Picture1','Topic',1,'8c9498c8679fcdacab7075c5c9622b34',53231,'png','image/png',0,1533432978,1),(18,'Picture2','Topic',3,'5ce6c30bc15bad9df674498516ddd437',232788,'png','image/png',0,1533433084,1),(19,'Picture3','Topic',8,'3800b04b3b7368cbd611509ea25d6d48',16375,'jpg','image/jpeg',0,1533433140,1),(20,'Picture4','Topic',9,'5abaaefec2195f60a09662d267a5f09c',45418,'png','image/png',0,1533433162,1),(21,'L2','Lesson',2,'e75a33b105b687626991e73e1570e15d',240178,'png','image/png',0,1533438566,1),(23,'Picture5','Topic',4,'16dd489a5b50ae431743730a674b6aa8',37065,'png','image/png',0,1533451391,1);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_category`
--

DROP TABLE IF EXISTS `lesson_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_category`
--

LOCK TABLES `lesson_category` WRITE;
/*!40000 ALTER TABLE `lesson_category` DISABLE KEYS */;
INSERT INTO `lesson_category` VALUES (1,'Panimula'),(2,'Alamin Natin'),(3,'Isagawa Natin'),(4,'Isapuso Natin'),(5,'Isabuhay Natin'),(6,'Subukin Natin'),(7,'Takdang Aralin');
/*!40000 ALTER TABLE `lesson_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `purpose` text COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (1,'Mga Bilang na Odd at Even','<p><strong>Layunin:&nbsp;</strong><em>Natutukoy ang mga bilang na odd at even</em></p>','oddeven'),(2,'Fractions','<p><strong>Layunin</strong><strong>: </strong><em>Naipapakita</em><em> ang fractions </em><em>na</em> <em>katumbas</em><em> ng </em><em>isa</em><em> at </em><em>higit</em> <em>sa</em> <em>isang</em> <em>buo</em></p>','fractions');
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1533208716),('m130524_201442_init',1533208719),('m140209_132017_init',1533210643),('m140403_174025_create_account_table',1533210645),('m140504_113157_update_tables',1533210649),('m140504_130429_create_token_table',1533210709),('m140506_102106_rbac_init',1533372399),('m140830_171933_fix_ip_field',1533210711),('m140830_172703_change_account_table_name',1533210711),('m141222_110026_update_ip_field',1533210712),('m141222_135246_alter_username_length',1533210713),('m150127_040544_files',1533381355),('m150614_103145_update_social_account_table',1533210716),('m150623_212711_fix_username_notnull',1533210717),('m151218_234654_add_timezone_to_profile',1533210717),('m160929_103127_add_last_login_at_to_user_table',1533210718),('m170907_052038_rbac_add_index_on_auth_assignment_user_id',1533372400);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_choices`
--

DROP TABLE IF EXISTS `question_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_choices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `choice` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `question_choices_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_choices`
--

LOCK TABLES `question_choices` WRITE;
/*!40000 ALTER TABLE `question_choices` DISABLE KEYS */;
INSERT INTO `question_choices` VALUES (11,6,'7',NULL),(12,6,'9',NULL),(13,7,'19',NULL),(14,7,'15',NULL),(15,8,'85',NULL),(16,8,'74',NULL),(17,9,'123',NULL),(18,9,'113',NULL),(19,10,'2314',NULL),(20,10,'4312',NULL),(21,11,'a. 58',NULL),(22,11,'b. 59',NULL),(23,11,'c. 60',NULL),(24,12,'a. 75',NULL),(25,12,'b. 74',NULL),(26,12,'c. 73',NULL),(27,13,'a. 81',NULL),(28,13,'b. 82',NULL),(29,13,'c. 83',NULL),(30,14,'a. 32',NULL),(31,14,'b. 22',NULL),(32,14,'c. 12',NULL),(33,15,'a. 60',NULL),(34,15,'b. 58',NULL),(35,15,'c. 56',NULL),(36,16,'odd',NULL),(37,16,'even',NULL),(38,17,'odd',NULL),(39,17,'even',NULL),(40,18,'odd',NULL),(41,18,'even',NULL),(42,19,'odd',NULL),(43,19,'even',NULL),(44,20,'odd',NULL),(45,20,'even',NULL),(46,21,'odd',NULL),(47,21,'even',NULL),(48,22,'odd',NULL),(49,22,'even',NULL),(50,23,'odd',NULL),(51,23,'even',NULL),(52,24,'odd',NULL),(53,24,'even',NULL),(54,25,'odd',NULL),(55,25,'even',NULL),(56,31,'a. 23',NULL),(57,31,'b. 35',NULL),(58,31,'c. 38',NULL),(59,31,'d. 51',NULL),(60,32,'a. 82',NULL),(61,32,'b. 71',NULL),(62,32,'c. 60',NULL),(63,32,'d. 94',NULL),(64,33,'a. 33',NULL),(65,33,'b. 92',NULL),(66,33,'c. 48',NULL),(67,33,'d. 22',NULL),(68,34,'a. 11',NULL),(69,34,'b. 77',NULL),(70,34,'c. 68',NULL),(71,34,'d. 53',NULL),(72,35,'a. 44',NULL),(73,35,'b. 76',NULL),(74,35,'c. 58',NULL),(75,35,'d. 27',NULL),(76,36,'Odd',NULL),(77,36,'Even',NULL),(78,37,'Odd',NULL),(79,37,'Even',NULL),(80,38,'Odd',NULL),(81,38,'Even',NULL),(82,39,'Odd',NULL),(83,39,'Even',NULL),(84,40,'Odd',NULL),(85,40,'Even',NULL);
/*!40000 ALTER TABLE `question_choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ans` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `unit_id` (`unit_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (6,1,'','12',3),(7,1,'','13',3),(8,1,'','15',3),(9,1,'','17',3),(10,1,'','20',3),(11,2,'45 + 14 =','22',3),(12,2,'52 + 14 = ','24',3),(13,2,'31 + 52 =','29',3),(14,2,'12 + 10 =','31',3),(15,2,'25 + 31','35',3),(16,6,'1) 26','37',3),(17,6,'2) 18','39',3),(18,6,'3) 79','40',3),(19,6,'4) 15','42',3),(20,6,'5) 89','44',3),(21,6,'6) 101','46',3),(22,6,'7) 238','49',3),(23,6,'8) 454','51',3),(24,6,'9) 500','53',3),(25,6,'10) 873','54',3),(26,8,'1. Ako ay bilang na odd na mas maliit sa 80 pero mas malaki sa77?','79',1),(27,8,'2. Ako ay bilang na even na mas malaki sa 1 396 pero mas maliit sa 1 400?','1398',1),(28,8,'3. Ako ay bilang na odd na mas malaki sa 122 pero mas maliit sa 125?','123',1),(29,8,'4. Ako ay bilang na even na mas malaki sa 2 202 pero mas maliit sa 2 205?','2204',1),(30,8,'5. Ako ang pinakamalaking bilang na odd na mas maliit sa 600?','599',1),(31,9,'1.  Alin sa mga  sumusunod ang bilang na even?','58',3),(32,9,'2.  Alin sa mga  sumusunod ang bilang na odd?','61',3),(33,9,'3. Alin sa mga  sumusunod ang bilang na hindi even?','64',3),(34,9,'4. Alin sa mga  sumusunod ang bilang na hindi odd?','70',3),(35,9,'5. Alin sa mga  sumusunod ang bilang na odd?','75',3),(36,10,'1. 23','76',3),(37,10,'2. 91','78',3),(38,10,'3. 58','81',3),(39,10,'4. 70','83',3),(40,10,'5. 64','85',3);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stud_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `date_taken` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stud_id` (`stud_id`),
  KEY `topic_id` (`topic_id`),
  CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`stud_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quiz_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_account`
--

DROP TABLE IF EXISTS `social_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  UNIQUE KEY `account_unique_code` (`code`),
  KEY `fk_user_account` (`user_id`),
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_account`
--

LOCK TABLES `social_account` WRITE;
/*!40000 ALTER TABLE `social_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_answers`
--

DROP TABLE IF EXISTS `stud_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `stud_answers_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stud_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_answers`
--

LOCK TABLES `stud_answers` WRITE;
/*!40000 ALTER TABLE `stud_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `stud_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ln` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `fn` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `mn` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cr_id` (`cr_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`cr_id`) REFERENCES `cr_code` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Matias','Jay Mar','Mejia',1),(2,'Aringo','Christine','Abarro',1),(3,'Mateo','Kennedy','Bote',1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`),
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,'FGZez0gNxJYExFY69A4HhpEF_iw-Dr7q',1533210815,0);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `passing_grade` int(11) DEFAULT '0',
  `instruction` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lesson_id` (`lesson_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `lesson_category` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,1,1,'Magsanay Tayo',3,'Panuto: Alin ang mas malaking bilang? I- click ang katabing bilog ng bilang na tamang sagot.'),(2,1,1,'Balik Aralan Natin',3,'Ibigay ang kabuuang bilang. I-click ang titik na tamang sagot.'),(3,1,1,'Maglaro Tayo',NULL,'\"Putukin and Lobo\"\r\n\r\nPanuto: \r\n1. Ipangkat ang klase sa 4. Bawat pangkat ay bibigyan ng 10 lobo na may lamang bilang sa loob na dapat putukin. \r\n2. Ang mga bilang sa loob ay ilalagay sa tsart ng bilang na maaaring hatiin sa dalawa at tsart ng bilang na hindi maaaring\r\nhatiin sa dalawa.\r\n3. Ang pangkat na maraming naputok at nailagay sa tamang tsart sa loob ng 3 minuto ang tatanghaling panalo.\r\n'),(4,2,1,'Ang SOLUSYON sa PROBLEMA?',NULL,'Ang klase ni Gng. Santos ay sasali sa isang palatuntunan ng paaralan kung kaya’t pinapila niya ang kaniyang mag-aaral sa dalawang \r\nhanay. Kasama niya ang 24 na mag-aaral, kung papahanayin niya ang mga bata sa dalawang linya, lahat ba ay magkakaroon ng \r\nkapareha? Bakit? Paano kung ang bilang ng mag-aaral ay 23 lamang, lahat ba ng bata ay magkakaroon ng kapareha? Bakit?\r\n'),(5,2,1,'Basahin at unawain',NULL,'• Lahat ng mga bilang na even ay may kapares.\r\n• Lahat ng mga bilang na odd ay may isang walang kapares.\r\n\r\n• Ang mga bilang na even ay nagtatapos sa 0, 2, 4, 6 o 8.\r\n• Ang mga bilang na odd ay nagtatapos sa 1, 3, 5, 7, o 9.\r\n\r\nMaaaring nalaman kung Odd o Even ang bilang ng kabuuan.\r\nHalimbawa:\r\n✔ 2 + 6 =  8	Ang kabuuan ng dalawang even na bilang ay 		Even.\r\n✔ 5 + 9 = 14	Ang kabuuan ng dalawang odd na bilang ay 			Even.\r\n✔ 2 + 5 =  7	Ang kabuuan ng isang even at isang odd na bilang 		ay Odd.\r\n'),(6,3,1,'Odd or Even',5,'Panuto: Suriin ang bawat bilang kung ito ay odd o even.\r\n'),(7,4,1,'Tandaan mo ako!',NULL,'◘ Ano ang mga bilang na even?\r\n✔ Lahat ng mga bilang na even ay may kapares.\r\n✔ Ang mga bilang na even ay nagtatapos sa 0, 2, 4, 6 o 8.\r\n✔ Ang kabuuan ng dalawang even na bilang ay Even.\r\n✔ Ang kabuuan ng dalawang odd na bilang ay Even.\r\n\r\n◘ Ano ang mga bilang na odd?\r\n✔ Lahat ng mga bilang na odd ay may isang walang kapares.\r\n✔ Ang mga bilang na odd ay nagtatapos sa 1, 3, 5, 7, o 9.\r\n✔ Ang kabuuan ng isang even at isang odd na bilang ay Odd.\r\n'),(8,5,1,'Sino AKO?',3,'Ginabayang Gawain\r\nPanuto: Tukuyin ang bilang na isinasaad sa sumusunod na sitwasyon. Isulat ang tamang sagot sa patlang.\r\n'),(9,5,1,'Alin ang TAMA?',3,'Indibidwal na Gawain\r\nPanuto: I-Click ang button sa unahan ng titik ng tamang sagot.\r\n'),(10,6,1,'Piliing MABUTI!',3,'Panuto: Tukuyin kung ang bilang ay Odd o Even. Pindutin ang bilog ng napiling sagot.\r\n'),(11,7,1,'Magandang HALIMBAWA!',NULL,'Panuto: Magbigay ng 10 halimbawa ng bilang na Odd at 10 halimbawa ng bilang na Even.\r\n'),(14,1,1,'sample',NULL,'sample'),(15,1,1,'sample',NULL,'sample');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'Textbox'),(2,'Dropdown'),(3,'RadioButton');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `last_login_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_username` (`username`),
  UNIQUE KEY `user_unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin','Admin','admin','jmar.matias26@gmail.com','$2y$10$aPvJA8LCa7Usqla.0Cdi..cV3Qsr8gNEgU97NSVVLuFNt6lwJRn8K','wmS8t4oKIBSFmGvy198hUyJbQc4aO3kZ',123344,NULL,NULL,'::1',1533210814,1533356354,0,1533373356),(3,'Teacher','Teacher','teacher','teacher@mail.com','$2y$10$zgaB3flvboQxy7rXqwUzG.1DCGKr5olywCsy15e1AHw9SmszMYXrW','WTNrxLGhphOzQ9A8nbL0YoiTv_c5tEJv',1533372550,NULL,NULL,'::1',1533372550,1533372550,0,1533429565);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-05 15:12:58
