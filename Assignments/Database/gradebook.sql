CREATE SCHEMA gradebook;
USE gradebook;

-- MySQL dump 10.16  Distrib 10.1.36-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: gradebook
-- ------------------------------------------------------
-- Server version	10.1.36-MariaDB

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
-- Table structure for table `entity_assignment`
--

DROP TABLE IF EXISTS `entity_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_assignment`
--

LOCK TABLES `entity_assignment` WRITE;
/*!40000 ALTER TABLE `entity_assignment` DISABLE KEYS */;
INSERT INTO `entity_assignment` VALUES (1,'JS Assignment 1'),(2,'JS Assignment 2'),(3,'JS Assignment 3'),(4,'JS Assignment 4'),(5,'JS Assignment 5'),(6,'JS Assignment 6'),(7,'CSS Assignment 1'),(8,'CSS Assignment 2'),(9,'JS Final'),(10,'Midterm'),(11,'Binomial Theorem'),(12,'Simple Vector'),(13,'RegexHelper'),(14,'Tip Calculator'),(15,'Database Discussion'),(16,'PHP Lab Review'),(17,'Curve Fit'),(18,'Project 1'),(19,'Survey Engine');
/*!40000 ALTER TABLE `entity_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_course`
--

DROP TABLE IF EXISTS `entity_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_course` (
  `course_code` int(11) NOT NULL,
  `course_name` varchar(30) NOT NULL,
  `course_number` varchar(6) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `dept` int(11) DEFAULT NULL,
  PRIMARY KEY (`course_code`),
  KEY `term` (`term`),
  KEY `dept` (`dept`),
  CONSTRAINT `entity_course_ibfk_1` FOREIGN KEY (`term`) REFERENCES `enum_term` (`id`),
  CONSTRAINT `entity_course_ibfk_2` FOREIGN KEY (`dept`) REFERENCES `enum_dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_course`
--

LOCK TABLES `entity_course` WRITE;
/*!40000 ALTER TABLE `entity_course` DISABLE KEYS */;
INSERT INTO `entity_course` VALUES (42377,'Javascript','14A',1,1),(42379,'C++ Data Structures','17C',1,1),(42417,'CSS','72B',1,1),(42514,'Java Advanced Objects','18B',1,1),(44085,'C++ Advanced Objects','17B',1,1);
/*!40000 ALTER TABLE `entity_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_instructor`
--

DROP TABLE IF EXISTS `entity_instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_instructor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_instructor`
--

LOCK TABLES `entity_instructor` WRITE;
/*!40000 ALTER TABLE `entity_instructor` DISABLE KEYS */;
INSERT INTO `entity_instructor` VALUES (1,'Mark','Lehr','mark.lehr@rcc.edu'),(2,'Scott','McLeod','scott.mcleod@rcc.edu'),(3,'Paul','Conrad','paul.conrad@rcc.edu');
/*!40000 ALTER TABLE `entity_instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_student`
--

DROP TABLE IF EXISTS `entity_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_student` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_student`
--

LOCK TABLES `entity_student` WRITE;
/*!40000 ALTER TABLE `entity_student` DISABLE KEYS */;
INSERT INTO `entity_student` VALUES (2733286,'Sebastian','Hall','shall38@student.rccd.edu');
/*!40000 ALTER TABLE `entity_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_dept`
--

DROP TABLE IF EXISTS `enum_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enum_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_dept`
--

LOCK TABLES `enum_dept` WRITE;
/*!40000 ALTER TABLE `enum_dept` DISABLE KEYS */;
INSERT INTO `enum_dept` VALUES (1,'CIS');
/*!40000 ALTER TABLE `enum_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enum_term`
--

DROP TABLE IF EXISTS `enum_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enum_term` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_term`
--

LOCK TABLES `enum_term` WRITE;
/*!40000 ALTER TABLE `enum_term` DISABLE KEYS */;
INSERT INTO `enum_term` VALUES (1,'Spring'),(2,'Summer'),(3,'Winter'),(4,'Fall');
/*!40000 ALTER TABLE `enum_term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_assignment_student`
--

DROP TABLE IF EXISTS `xref_assignment_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_assignment_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `xref_assignment_student_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `entity_assignment` (`id`),
  CONSTRAINT `xref_assignment_student_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `entity_student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_assignment_student`
--

LOCK TABLES `xref_assignment_student` WRITE;
/*!40000 ALTER TABLE `xref_assignment_student` DISABLE KEYS */;
INSERT INTO `xref_assignment_student` VALUES (1,1,2733286,NULL),(2,2,2733286,NULL),(3,3,2733286,NULL),(4,4,2733286,NULL),(5,5,2733286,NULL),(6,6,2733286,NULL),(7,7,2733286,NULL),(8,8,2733286,NULL),(9,9,2733286,NULL),(10,10,2733286,NULL),(11,11,2733286,NULL),(12,12,2733286,NULL),(13,13,2733286,NULL),(14,14,2733286,NULL),(15,15,2733286,NULL),(16,16,2733286,NULL),(17,17,2733286,NULL),(18,18,2733286,NULL),(19,19,2733286,NULL);
/*!40000 ALTER TABLE `xref_assignment_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_course_assignment`
--

DROP TABLE IF EXISTS `xref_course_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_course_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_code` (`course_code`),
  KEY `assignment_id` (`assignment_id`),
  CONSTRAINT `xref_course_assignment_ibfk_1` FOREIGN KEY (`course_code`) REFERENCES `entity_course` (`course_code`),
  CONSTRAINT `xref_course_assignment_ibfk_2` FOREIGN KEY (`assignment_id`) REFERENCES `entity_assignment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_course_assignment`
--

LOCK TABLES `xref_course_assignment` WRITE;
/*!40000 ALTER TABLE `xref_course_assignment` DISABLE KEYS */;
INSERT INTO `xref_course_assignment` VALUES (1,42377,1),(2,42377,2),(3,42377,3),(4,42377,4),(5,42377,5),(6,42377,6),(7,42417,7),(8,42417,8),(9,42377,9),(10,42379,10),(11,42379,11),(12,42379,12),(13,42514,13),(14,42514,14),(15,42514,15),(16,44085,16),(17,42379,17),(18,42379,18),(19,44085,19);
/*!40000 ALTER TABLE `xref_course_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xref_instructor_course`
--

DROP TABLE IF EXISTS `xref_instructor_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xref_instructor_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instructor_id` int(11) NOT NULL,
  `course_code` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_code` (`course_code`),
  KEY `instructor_id` (`instructor_id`),
  CONSTRAINT `xref_instructor_course_ibfk_2` FOREIGN KEY (`course_code`) REFERENCES `entity_course` (`course_code`),
  CONSTRAINT `xref_instructor_course_ibfk_3` FOREIGN KEY (`instructor_id`) REFERENCES `entity_instructor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_instructor_course`
--

LOCK TABLES `xref_instructor_course` WRITE;
/*!40000 ALTER TABLE `xref_instructor_course` DISABLE KEYS */;
INSERT INTO `xref_instructor_course` VALUES (1,1,44085),(2,1,44085),(3,2,42377),(4,2,42417),(5,3,42514);
/*!40000 ALTER TABLE `xref_instructor_course` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-06 21:55:45
