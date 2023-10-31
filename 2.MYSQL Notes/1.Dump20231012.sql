CREATE DATABASE  IF NOT EXISTS `trainingcenter` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `trainingcenter`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: trainingcenter
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contact_details`
--

DROP TABLE IF EXISTS `contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_details` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `ins_id` int DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(70) NOT NULL DEFAULT 'India',
  `street_address` varchar(200) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `cemail` varchar(100) DEFAULT NULL,
  `countrycode` int DEFAULT '91',
  `cmobile` mediumtext,
  `created_by` varchar(45) DEFAULT NULL,
  `created_dt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(45) DEFAULT NULL,
  `updated_dt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid`),
  KEY `ins_id` (`ins_id`),
  CONSTRAINT `contact_details_ibfk_1` FOREIGN KEY (`ins_id`) REFERENCES `institute` (`Ins_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_details`
--

LOCK TABLES `contact_details` WRITE;
/*!40000 ALTER TABLE `contact_details` DISABLE KEYS */;
INSERT INTO `contact_details` VALUES (1,1,'Pune','MH','India','ChandanNagar Kharadi','411048','contact@hematitecorp.com',91,'8999639478','Parag','2023-10-12 12:04:48',NULL,'2023-10-12 12:04:48'),(2,1,'Chennai','TN','India','OMR','600100','contactchennai@hematitecorp.com',91,'8999631478','Parag','2023-10-12 12:04:48',NULL,'2023-10-12 12:04:48'),(3,1,'Sambhaji Nagar','MH','India','Pratibha College Road','400058','contactaurangabad@hematitecorp.com',91,'9999639478','Parag','2023-10-12 12:04:48',NULL,'2023-10-12 12:04:48'),(4,2,'Pune','MH','India','ChandanNagar Kharadi','411084','iexcel@iexcel.com',91,'8499639478','Parag','2023-10-12 12:15:03',NULL,'2023-10-12 12:15:03'),(5,2,'Chennai','TN','India','Siruseri','600100','excelchennai@iexcel.com',91,'5999631478','Parag','2023-10-12 12:15:03',NULL,'2023-10-12 12:15:03'),(6,2,'Sambhaji Nagar','MH','India','Pratibha College Road','400058','excelabad@iexcel.com',91,'9999639478','Parag','2023-10-12 12:15:03',NULL,'2023-10-12 12:15:03');
/*!40000 ALTER TABLE `contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute`
--

DROP TABLE IF EXISTS `institute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute` (
  `Ins_id` int NOT NULL AUTO_INCREMENT,
  `Ins_name` varchar(100) NOT NULL,
  `Ins_RegNo` varchar(45) DEFAULT NULL,
  `Ins_Affiliated` char(1) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated_dt` datetime DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Ins_id`),
  UNIQUE KEY `Ins_name_UNIQUE` (`Ins_name`),
  UNIQUE KEY `Ins_RegNo_UNIQUE` (`Ins_RegNo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute`
--

LOCK TABLES `institute` WRITE;
/*!40000 ALTER TABLE `institute` DISABLE KEYS */;
INSERT INTO `institute` VALUES (1,'Hematite Infotech','CIN37373737H','Y','2023-10-12 10:31:40','root@localhost','2023-10-12 10:31:40',NULL),(2,'iExcel Community Foundation','IEX73737373','N','2023-10-12 00:00:00','Parag',NULL,NULL),(3,'ChangePond Learning Center','CHG8383833','N','2023-10-12 10:47:58','root@localhost',NULL,NULL),(4,'DREAMCATCHERS','DREA74839202','Y','2023-10-12 00:00:00','Parag',NULL,NULL),(5,'Excel Technologies','YEX83722822','Y','2023-10-12 10:52:03','SUSHANT',NULL,NULL);
/*!40000 ALTER TABLE `institute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer` (
  `tid` int NOT NULL,
  `tfname` varchar(20) NOT NULL,
  `tmname` varchar(20) DEFAULT NULL,
  `tlname` varchar(20) NOT NULL,
  `tdob` date NOT NULL,
  `tsalary` bigint NOT NULL,
  `trole` varchar(40) NOT NULL,
  `created_dt` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `updated_dt` datetime DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES (10,'Parag',NULL,'Joshi','1981-08-25',100000,'IT Program Director','2023-10-12 14:59:44','Parag',NULL,NULL),(11,'Prachi','Parag','Joshi','1981-08-07',200000,'Instructional Designer','2023-10-12 15:03:16','Parag',NULL,NULL),(12,'Manas',NULL,'Joshi','2001-07-15',50000,'Java Trainer','2023-10-12 15:03:16','Parag',NULL,NULL),(13,'Daesha','Parag','Joshi','2002-09-07',325000,'Web Development Trainer','2023-10-12 15:03:16','Parag',NULL,NULL),(14,'Kishore',NULL,'Kumar','1998-12-15',250000,'Cybersecurity Trainer','2023-10-12 15:03:16','Parag',NULL,NULL);
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-12 15:42:10
