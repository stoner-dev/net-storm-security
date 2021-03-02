-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: nssdb
-- ------------------------------------------------------
-- Server version	5.1.53-community

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
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `iddevice` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  `macaddress` varchar(45) DEFAULT NULL,
  `os` varchar(45) DEFAULT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`iddevice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intensescaninfo`
--

DROP TABLE IF EXISTS `intensescaninfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intensescaninfo` (
  `idintensescaninfo` int(11) NOT NULL AUTO_INCREMENT,
  `is_intense` tinyint(1) NOT NULL,
  `device_type` varchar(45) DEFAULT NULL,
  `tcp_sequence_prediction` varchar(45) DEFAULT NULL,
  `timestamp` int(11) NOT NULL,
  `for_iddevice` int(11) NOT NULL,
  PRIMARY KEY (`idintensescaninfo`),
  KEY `fk_intensescaninfo_device1_idx` (`for_iddevice`),
  CONSTRAINT `fk_intensescaninfo_device1` FOREIGN KEY (`for_iddevice`) REFERENCES `device` (`iddevice`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intensescaninfo`
--

LOCK TABLES `intensescaninfo` WRITE;
/*!40000 ALTER TABLE `intensescaninfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `intensescaninfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipaddress`
--

DROP TABLE IF EXISTS `ipaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipaddress` (
  `idipaddress` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(45) NOT NULL,
  `timestamp` varchar(45) NOT NULL,
  `for_iddevice` int(11) NOT NULL,
  PRIMARY KEY (`idipaddress`),
  KEY `fk_ipaddress_device1_idx` (`for_iddevice`),
  CONSTRAINT `fk_ipaddress_device1` FOREIGN KEY (`for_iddevice`) REFERENCES `device` (`iddevice`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipaddress`
--

LOCK TABLES `ipaddress` WRITE;
/*!40000 ALTER TABLE `ipaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penetrationtest`
--

DROP TABLE IF EXISTS `penetrationtest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penetrationtest` (
  `idpenetrationtest` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `data` varchar(45) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `for_iddevice` int(11) NOT NULL,
  PRIMARY KEY (`idpenetrationtest`),
  KEY `fk_penetrationtest_device1_idx` (`for_iddevice`),
  CONSTRAINT `fk_penetrationtest_device1` FOREIGN KEY (`for_iddevice`) REFERENCES `device` (`iddevice`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penetrationtest`
--

LOCK TABLES `penetrationtest` WRITE;
/*!40000 ALTER TABLE `penetrationtest` DISABLE KEYS */;
/*!40000 ALTER TABLE `penetrationtest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ports`
--

DROP TABLE IF EXISTS `ports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ports` (
  `idport` int(11) NOT NULL AUTO_INCREMENT,
  `port` varchar(45) NOT NULL,
  `service` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `version` varchar(45) DEFAULT NULL,
  `timestamp` int(11) NOT NULL,
  `extended_port_info` varchar(45) DEFAULT NULL,
  `for_iddevice` int(11) NOT NULL,
  PRIMARY KEY (`idport`),
  KEY `fk_ports_device1_idx` (`for_iddevice`),
  CONSTRAINT `fk_ports_device1` FOREIGN KEY (`for_iddevice`) REFERENCES `device` (`iddevice`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ports`
--

LOCK TABLES `ports` WRITE;
/*!40000 ALTER TABLE `ports` DISABLE KEYS */;
/*!40000 ALTER TABLE `ports` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-02 10:35:33

