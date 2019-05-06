CREATE DATABASE  IF NOT EXISTS `book` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `book`;
-- MySQL dump 10.16  Distrib 10.1.34-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: book
-- ------------------------------------------------------
-- Server version	10.1.34-MariaDB

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
-- Table structure for table `entity_author`
--

DROP TABLE IF EXISTS `entity_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_author`
--

LOCK TABLES `entity_author` WRITE;
/*!40000 ALTER TABLE `entity_author` DISABLE KEYS */;
INSERT INTO `entity_author` VALUES (1,'Harvey','Deitel',NULL),(2,'Paul','Deitel',NULL),(3,'Thomas','Cormen',NULL),(4,'Charles','Leirson',NULL),(5,'Ronald','Rivest',NULL),(6,'Clifford','Stein',NULL),(7,'Denise','Woods',NULL),(8,'Lynn','Beighley',NULL),(9,'Michael','Morrison',NULL),(10,'Eric','Freeman',NULL),(11,'Elisabeth','Robson',NULL),(12,'Pavel','Strakhov',NULL),(13,'Witold','Wysota',NULL),(14,'Lorenz','Haas',NULL),(15,'David','McFarland',NULL),(16,'Nicolai','Josuttis',NULL);
/*!40000 ALTER TABLE `entity_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_book`
--

DROP TABLE IF EXISTS `entity_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_book` (
  `isbn` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `edition` int(10) DEFAULT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_book`
--

LOCK TABLES `entity_book` WRITE;
/*!40000 ALTER TABLE `entity_book` DISABLE KEYS */;
INSERT INTO `entity_book` VALUES ('978-0-13-380780-6','Java How To Program Early Objects',10),('978-0-262-53305-8','Intro to Algorithms',3),('978-0-321-62324-8','C++ Standard Library',2),('978-0-596-00630-3','Head First MySQL & PHP',1),('978-1-1335-2612-4','HTML5 And CSS',7),('978-1-449-34013-1','Head First Javascript',1),('978-1-491-91825-0','CSS the missing manual',4),('978-1-78839-999-9','Game Programming using QT5',2);
/*!40000 ALTER TABLE `entity_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_publisher`
--

DROP TABLE IF EXISTS `entity_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_publisher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` int(2) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_publisher`
--

LOCK TABLES `entity_publisher` WRITE;
/*!40000 ALTER TABLE `entity_publisher` DISABLE KEYS */;
INSERT INTO `entity_publisher` VALUES (1,'Addison-Wesley',NULL,NULL,NULL,NULL,NULL),(2,'O\'Reilly',NULL,NULL,NULL,NULL,NULL),(3,'Packt Publishing',NULL,NULL,NULL,NULL,NULL),(4,'Course Technology',NULL,NULL,NULL,NULL,NULL),(5,'Cengage Learning',NULL,NULL,NULL,NULL,NULL),(6,'MIT Press',NULL,NULL,NULL,NULL,NULL),(7,'Pearson',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `entity_publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_genre`
--

DROP TABLE IF EXISTS `enum_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enum_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_genre`
--

LOCK TABLES `enum_genre` WRITE;
/*!40000 ALTER TABLE `enum_genre` DISABLE KEYS */;
INSERT INTO `enum_genre` VALUES (1,'C++'),(2,'Java'),(3,'WebDev'),(4,'Math');
/*!40000 ALTER TABLE `enum_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_book_author`
--

DROP TABLE IF EXISTS `xref_book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_book_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_isbn` varchar(20) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_isbn` (`book_isbn`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `xref_book_author_ibfk_1` FOREIGN KEY (`book_isbn`) REFERENCES `entity_book` (`isbn`),
  CONSTRAINT `xref_book_author_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `entity_author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_book_author`
--

LOCK TABLES `xref_book_author` WRITE;
/*!40000 ALTER TABLE `xref_book_author` DISABLE KEYS */;
INSERT INTO `xref_book_author` VALUES (1,'978-0-13-380780-6',1),(2,'978-0-13-380780-6',2),(3,'978-0-262-53305-8',3),(4,'978-0-262-53305-8',4),(5,'978-0-262-53305-8',5),(6,'978-0-262-53305-8',6),(7,'978-0-321-62324-8',16),(8,'978-0-596-00630-3',8),(9,'978-0-596-00630-3',9),(10,'978-1-1335-2612-4',7),(11,'978-1-449-34013-1',10),(12,'978-1-449-34013-1',11),(13,'978-1-491-91825-0',15),(14,'978-1-78839-999-9',12),(15,'978-1-78839-999-9',13),(16,'978-1-78839-999-9',14);
/*!40000 ALTER TABLE `xref_book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_book_genre`
--

DROP TABLE IF EXISTS `xref_book_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_book_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_isbn` varchar(20) NOT NULL,
  `genre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_isbn` (`book_isbn`),
  CONSTRAINT `xref_book_genre_ibfk_1` FOREIGN KEY (`book_isbn`) REFERENCES `entity_book` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_book_genre`
--

LOCK TABLES `xref_book_genre` WRITE;
/*!40000 ALTER TABLE `xref_book_genre` DISABLE KEYS */;
INSERT INTO `xref_book_genre` VALUES (1,'978-0-13-380780-6','2'),(2,'978-0-262-53305-8','4'),(3,'978-0-321-62324-8','1'),(4,'978-0-596-00630-3','3'),(5,'978-1-1335-2612-4','3'),(6,'978-1-449-34013-1','3'),(7,'978-1-491-91825-0','3'),(8,'978-1-78839-999-9','1');
/*!40000 ALTER TABLE `xref_book_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_book_publisher`
--

DROP TABLE IF EXISTS `xref_book_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_book_publisher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_isbn` varchar(20) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_isbn` (`book_isbn`),
  KEY `publisher_id` (`publisher_id`),
  CONSTRAINT `xref_book_publisher_ibfk_1` FOREIGN KEY (`book_isbn`) REFERENCES `entity_book` (`isbn`),
  CONSTRAINT `xref_book_publisher_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `entity_publisher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_book_publisher`
--

LOCK TABLES `xref_book_publisher` WRITE;
/*!40000 ALTER TABLE `xref_book_publisher` DISABLE KEYS */;
INSERT INTO `xref_book_publisher` VALUES (1,'978-0-13-380780-6',7),(2,'978-0-262-53305-8',6),(3,'978-0-321-62324-8',1),(4,'978-0-596-00630-3',2),(5,'978-1-1335-2612-4',4),(6,'978-1-1335-2612-4',5),(7,'978-1-449-34013-1',2),(8,'978-1-491-91825-0',2),(9,'978-1-78839-999-9',3);
/*!40000 ALTER TABLE `xref_book_publisher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-06 13:11:09
