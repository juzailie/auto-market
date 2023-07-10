CREATE DATABASE  IF NOT EXISTS `automarket` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `automarket`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: automarket
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductId` char(36) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `ImagePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('24fd81f8-d58a-4bcc-9f35-dc6cd5641906','Mazda 3 MPS','The Mazdaspeed3 is a sport compact hatchback introduced for the 2007 model year by Mazdaspeed and produced until 2013. The Mazdaspeed3 is a performance-enhanced version of the 5-door Mazda3.','https://www.mekanika.com.my/wp-content/uploads/2018/09/mazda-3-mps-1.jpg'),('261e1685-cf26-494c-b17c-3546e65f5620','Renault Megane RS 250 Cup','The Renault Mégane Renault Sport (alternatively Renault Mégane RS) is a series of high-performance hatchback models based on the Renault Mégane, produced since 2004 by the high-performance subsidiary','https://paultan.org/static2.paultan.org/megane-rs-main1.jpg'),('a3c1880c-674c-4d18-8f91-5d3608a2c937','Volkswagen Golf GTI Mk6','The Volkswagen Golf Mk6 (codenamed Typ 5K) is a compact car, the sixth generation of the Volkswagen Golf and the successor to the Volkswagen Golf Mk5. It was unveiled at the Paris Motor Show in October 2008 for the 2009 model year. ','https://upload.wikimedia.org/wikipedia/commons/a/a2/VW_Golf_1.6_TDI_Style_%28VI%29_%E2%80%93_Frontansicht%2C_25._Februar_2012%2C_Ratingen.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variant`
--

DROP TABLE IF EXISTS `product_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variant` (
  `ProductVariantId` char(36) NOT NULL,
  `Info` varchar(45) DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  `ProductId` char(36) NOT NULL,
  PRIMARY KEY (`ProductVariantId`),
  KEY `fk_product_variant_product_idx` (`ProductId`),
  CONSTRAINT `fk_product_variant_product` FOREIGN KEY (`ProductId`) REFERENCES `product` (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variant`
--

LOCK TABLES `product_variant` WRITE;
/*!40000 ALTER TABLE `product_variant` DISABLE KEYS */;
INSERT INTO `product_variant` VALUES ('03e91478-5608-4132-a753-d494dafce00b','Full Spec',79800,'24fd81f8-d58a-4bcc-9f35-dc6cd5641906'),('356a5a9b-64bf-4de0-bc84-5395a1fdc9c4','Low Spec',69800,'24fd81f8-d58a-4bcc-9f35-dc6cd5641906'),('6e2571dd-4f2b-4697-82ec-420b51766a64','Full Spec',71800,'a3c1880c-674c-4d18-8f91-5d3608a2c937'),('7285f267-1b9f-4e15-9f5c-e25486f5f617','Low Spec',79800,'261e1685-cf26-494c-b17c-3546e65f5620'),('b5924d0b-9c98-416a-97d7-f2000eb6fb45','Low Spec',81800,'a3c1880c-674c-4d18-8f91-5d3608a2c937'),('fe90379a-73e7-4144-82f6-54e1c2bccb10','Full Spec',69800,'261e1685-cf26-494c-b17c-3546e65f5620');
/*!40000 ALTER TABLE `product_variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Shawn','password123','shwan@yahoo.com');
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

-- Dump completed on 2022-10-20 11:56:35
