-- MySQL dump 10.16  Distrib 10.1.34-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: gradebook
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
-- Table structure for table `entity_assignment`
--

DROP TABLE IF EXISTS `entity_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_assignment`
--

LOCK TABLES `entity_assignment` WRITE;
/*!40000 ALTER TABLE `entity_assignment` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `entity_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_instructor`
--

DROP TABLE IF EXISTS `entity_instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_instructor` (
  `id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_instructor`
--

LOCK TABLES `entity_instructor` WRITE;
/*!40000 ALTER TABLE `entity_instructor` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_dept`
--

LOCK TABLES `enum_dept` WRITE;
/*!40000 ALTER TABLE `enum_dept` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enum_term`
--

LOCK TABLES `enum_term` WRITE;
/*!40000 ALTER TABLE `enum_term` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_assignment_student`
--

LOCK TABLES `xref_assignment_student` WRITE;
/*!40000 ALTER TABLE `xref_assignment_student` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_course_assignment`
--

LOCK TABLES `xref_course_assignment` WRITE;
/*!40000 ALTER TABLE `xref_course_assignment` DISABLE KEYS */;
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
  KEY `instructor_id` (`instructor_id`),
  KEY `course_code` (`course_code`),
  CONSTRAINT `xref_instructor_course_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `entity_instructor` (`id`),
  CONSTRAINT `xref_instructor_course_ibfk_2` FOREIGN KEY (`course_code`) REFERENCES `entity_course` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xref_instructor_course`
--

LOCK TABLES `xref_instructor_course` WRITE;
/*!40000 ALTER TABLE `xref_instructor_course` DISABLE KEYS */;
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

-- Dump completed on 2019-05-06 14:41:57
