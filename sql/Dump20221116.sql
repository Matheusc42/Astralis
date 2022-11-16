-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: astralis
-- ------------------------------------------------------
-- Server version	5.7.36

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
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `IdReg` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `RG` varchar(12) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `BirthDate` date DEFAULT NULL,
  `MobilePhone` varchar(16) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Mail` varchar(100) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `UF` varchar(2) DEFAULT NULL,
  `Position` varchar(100) NOT NULL,
  PRIMARY KEY (`IdReg`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Sueli Isabella Cecília Jesus','30.185.710-6','281.151.241-17','1955-06-29','(66) 98697-6328','(66) 2604-3016','sueli_jesus@cladm.com.br','Travessa Treze. 350','Rondonópolis','MT','Professor'),(2,'Levi Cauê Teixeira','49.009.900-2','990.410.449-22','1982-10-02','(66) 98697-6328','(66) 2604-3016','levi_caue_teixeira@termakui.com.br','Passagem X do Sul. 350','Macapá','AP','Secretario'),(3,'Felipe Alves da Silva','58.265.326-9','165.365.984-96','1999-08-11','(55) 9 8496-6934','(15) 8947-2986','kevinfilipegalvao@foz.com.br','Avenida Nila Jales n897','Natal','RN','Secretario'),(4,'Regina Helena Emilly Alves','27.831.817-4','866.227.996-10','1999-10-04','(86) 99872-1692','(86) 2930-7391','regina.helena.alves@fileno.com.br','Vila Nova 139','Teresina','PI','Direção'),(5,'Renan Breno Mateus Novaes','50.125.571-0','562.689.771-22','1990-04-12','(91) 99370-8317','(91) 2893-2930','renan_novaes@hardquality.com.br','Passagem Campestre n 313','Ananindeua','PA','Docente'),(6,'Stella Sebastiana Rayssa da Cunha','26.531.500-1','672.319.005-00','1983-05-19','(27) 99908-3176','(27) 2721-4872','stellasebastianadacunha@usa.com','Rua Felipe Raizer 259','Acioli','ES','Docente');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `IdReg` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdReg`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','GLOBAL_ADMIN'),(2,'root','root','GLOBAL_ADMIN');
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

-- Dump completed on 2022-11-16 18:15:51
