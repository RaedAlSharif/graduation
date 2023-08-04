-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: graduation
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointments` (
  `name` varchar(23) DEFAULT NULL,
  `surname` varchar(23) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `idDoctors` int(11) NOT NULL,
  PRIMARY KEY (`ID`,`idDoctors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES ('Raed','AlSharif',18,'raed__2001@hotmail.com','0505236378',0,'2023-06-27','18:30:00',1079,1),('Raed','AlSharif',18,'raed__2001@hotmail.com','0505236378',0,'2023-06-23','15:30:00',16281,1),('Raed','AlSharif',18,'raed__2001@hotmail.com','0505236378',0,'2023-06-28','18:30:00',58668,1);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctors` (
  `idDoctors` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `speciality` varchar(14) NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`idDoctors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Abdullah','Mohannad','abd@hotmail.com','Elder men','11223344'),(2,'Razan','Samer','Rzs@hotmail.com','Elder Women','11335577'),(3,'Samira','Talal','SamT@hotmail.com','Kids','22446688');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `idPatients` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(14) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `password` varchar(15) NOT NULL,
  `age` int(11) NOT NULL,
  `idDoctors` int(11) NOT NULL,
  PRIMARY KEY (`idPatients`),
  KEY `idDoctors` (`idDoctors`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`idDoctors`) REFERENCES `doctors` (`idDoctors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (28882,'Raed2','ASD','mmsh@gmail.com','0505782365','Male','Raed1234',33,1),(37303,'Mohannad','AlSharif','219SE2179@isik.edu.tr','0779514549','Female','Raed1234',18,2),(43230,'maty','asdf','219SE2045@isik.edu.tr','123123131','Male','Eaed1234',18,1),(44978,'Farah','AlSharif','raed-_-killer@hotmail.com','0543464886','Female','Raed1234',6,3),(64982,'Marboosh','Eren','eren@gmail.com','0505782363','Male','Raed1234',18,3),(94670,'Raed','AlSharif','raed__2001@hotmail.com','0505236378','Male','Raed1234',18,1);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `idDoctors` int(11) NOT NULL,
  `idPatients` int(11) NOT NULL,
  `Content` longtext NOT NULL,
  PRIMARY KEY (`idDoctors`,`idPatients`),
  KEY `idPatients` (`idPatients`),
  CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`idPatients`) REFERENCES `patients` (`idPatients`),
  CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`idDoctors`) REFERENCES `doctors` (`idDoctors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,28882,'asdf'),(1,43230,'123123123'),(1,94670,'SPECIALIHGHVJHD'),(3,44978,'ur fine');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserved`
--

DROP TABLE IF EXISTS `reserved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserved` (
  `idDoctors` int(11) NOT NULL,
  `Time` time NOT NULL,
  `Date` date NOT NULL,
  KEY `idDoctors` (`idDoctors`),
  CONSTRAINT `reserved_ibfk_1` FOREIGN KEY (`idDoctors`) REFERENCES `doctors` (`idDoctors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserved`
--

LOCK TABLES `reserved` WRITE;
/*!40000 ALTER TABLE `reserved` DISABLE KEYS */;
INSERT INTO `reserved` VALUES (1,'15:30:00','2023-06-23'),(1,'18:30:00','2023-06-28'),(3,'18:30:00','2023-06-20'),(3,'12:00:00','2023-06-24'),(1,'12:30:00','2023-06-30'),(1,'16:30:00','2023-06-17');
/*!40000 ALTER TABLE `reserved` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-18  8:26:00
