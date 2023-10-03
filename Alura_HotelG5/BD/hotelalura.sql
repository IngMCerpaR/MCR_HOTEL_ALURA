CREATE DATABASE  IF NOT EXISTS `hotelalura` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hotelalura`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: hotelalura
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
-- Table structure for table `huespedes`
--

DROP TABLE IF EXISTS `huespedes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `huespedes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `nacionalidad` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `IdReserva` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IdReserva_idx` (`IdReserva`),
  CONSTRAINT `IdReserva` FOREIGN KEY (`IdReserva`) REFERENCES `reservas` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huespedes`
--

LOCK TABLES `huespedes` WRITE;
/*!40000 ALTER TABLE `huespedes` DISABLE KEYS */;
INSERT INTO `huespedes` VALUES (1,'Mayra','Cerpa ','1994-07-28','mexicano-mexicana','+13017299625',1),(2,'Alan','Moctezuma ','1994-04-15','filipino-filipina','5520375691',2),(3,'Martha','Cedillo Cardenas','1971-10-13','brasileño-brasileña','+26017289235',3),(5,'Alicia','Mercado Chavéz','1982-10-12','colombiano-colombiana','3012254789655',5);
/*!40000 ALTER TABLE `huespedes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilegios`
--

DROP TABLE IF EXISTS `privilegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privilegios` (
  `idprivilegio` int NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`idprivilegio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilegios`
--

LOCK TABLES `privilegios` WRITE;
/*!40000 ALTER TABLE `privilegios` DISABLE KEYS */;
/*!40000 ALTER TABLE `privilegios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `fecha_entrada` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `valor` varchar(20) NOT NULL,
  `formaPago` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,'2023-10-03','2023-10-07','$2000','Tarjeta de Crédito'),(2,'2023-10-03','2023-10-12','$4500','Dinero en efectivo'),(3,'2023-10-04','2023-10-06','$1000','Tarjeta de Débito'),(5,'2023-10-04','2023-10-06','$1000','Tarjeta de Crédito');
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idusuarios` int NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apelllidos` varchar(100) NOT NULL,
  `idprivilegios` int NOT NULL DEFAULT '0',
  `activo` float DEFAULT '1',
  PRIMARY KEY (`idusuarios`),
  KEY `idprivilegios_idx` (`idprivilegios`),
  CONSTRAINT `idprivilegios` FOREIGN KEY (`idprivilegios`) REFERENCES `privilegios` (`idprivilegio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-03  2:45:52
