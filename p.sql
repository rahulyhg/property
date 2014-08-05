-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: property
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.12.04.1

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
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `roll_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (2,'2','Udaipur');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversion_docs_logs`
--

DROP TABLE IF EXISTS `conversion_docs_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversion_docs_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` varchar(255) DEFAULT NULL,
  `property_type_id` varchar(255) DEFAULT NULL,
  `conversion_type_id` varchar(255) DEFAULT NULL,
  `conversiontype_document_id` varchar(255) DEFAULT NULL,
  `template` text,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversion_docs_logs`
--

LOCK TABLES `conversion_docs_logs` WRITE;
/*!40000 ALTER TABLE `conversion_docs_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversion_docs_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversion_docs_report`
--

DROP TABLE IF EXISTS `conversion_docs_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversion_docs_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(255) DEFAULT NULL,
  `conversiontype_document_id` int(255) DEFAULT NULL,
  `template` text,
  `created_at` date DEFAULT NULL,
  `property_logs_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversion_docs_report`
--

LOCK TABLES `conversion_docs_report` WRITE;
/*!40000 ALTER TABLE `conversion_docs_report` DISABLE KEYS */;
INSERT INTO `conversion_docs_report` VALUES (1,42,3,'{{hdo_converted_name}}\r\n{{hdo_converted_father_name}}\r\n{{hdo_converted_address}}\r\n\r\n\r\n','2014-08-04',NULL),(2,42,3,'{{hdo_converted_name}}\r\n{{hdo_converted_father_name}}\r\n{{hdo_converted_address}}\r\n\r\n\r\n','2014-08-04',NULL),(3,42,3,'{{hdo_converted_name}}\r\n{{hdo_converted_father_name}}\r\n{{hdo_converted_address}}\r\n\r\n\r\n','2014-08-04',NULL),(8,41,5,'{{name}}','2014-08-04',NULL),(9,43,3,'{{hdo_converted_name}}\r\n{{hdo_converted_father_name}}\r\n{{hdo_converted_address}}\r\n\r\n\r\n','2014-08-04',NULL),(10,41,5,'{{name}}','2014-08-04',NULL),(11,NULL,1,'Agent Father Name {{propertylog_agent_father_name}}\r\nparty father name Bharat','2014-08-04',83),(12,NULL,1,'Aavedak Khatedar ka nam {{hdo_name}}father name {{hdo_father_name}}address {{hdo_address}}','2014-08-04',83),(13,NULL,2,'{{hdo_converted_name}}\r\n{{hdo_converted_father_name}}\r\n{{hdo_converted_address}}\r\n\r\n\r\n','2014-08-05',89),(14,NULL,2,'{{hdo_converted_name}}\r\n{{hdo_converted_father_name}}\r\n{{hdo_converted_address}}\r\n\r\n\r\n','2014-08-05',89),(15,NULL,2,'{{hdo_converted_name}}\r\n{{hdo_converted_father_name}}\r\n{{hdo_converted_address}}\r\n\r\n\r\n','2014-08-05',89),(16,NULL,2,'{{hdo_converted_name}}\r\n{{hdo_converted_father_name}}\r\n{{hdo_converted_address}}\r\n\r\n\r\n','2014-08-05',89),(17,NULL,2,'{{hdo_converted_name}}\r\n{{hdo_converted_father_name}}\r\n{{hdo_converted_address}}\r\n\r\n\r\n','2014-08-05',89);
/*!40000 ALTER TABLE `conversion_docs_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversion_types`
--

DROP TABLE IF EXISTS `conversion_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversion_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversion_types`
--

LOCK TABLES `conversion_types` WRITE;
/*!40000 ALTER TABLE `conversion_types` DISABLE KEYS */;
INSERT INTO `conversion_types` VALUES (3,'Converted'),(4,'HDO'),(5,'HDO Converted'),(6,'Agriculture Registry');
/*!40000 ALTER TABLE `conversion_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversiontype_documents`
--

DROP TABLE IF EXISTS `conversiontype_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversiontype_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversion_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversiontype_documents`
--

LOCK TABLES `conversiontype_documents` WRITE;
/*!40000 ALTER TABLE `conversiontype_documents` DISABLE KEYS */;
INSERT INTO `conversiontype_documents` VALUES (1,4,'HDO','Aavedak Khatedar ka nam {{hdo_name}}father name {{hdo_father_name}}address {{hdo_address}}'),(2,3,'Converted','{{hdo_converted_name}}\r\n{{hdo_converted_father_name}}\r\n{{hdo_converted_address}}\r\n\r\n\r\n'),(3,5,'HDO Converted','{{name}}'),(4,3,'Converted21','{{name}}');
/*!40000 ALTER TABLE `conversiontype_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_types`
--

DROP TABLE IF EXISTS `document_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_types`
--

LOCK TABLES `document_types` WRITE;
/*!40000 ALTER TABLE `document_types` DISABLE KEYS */;
INSERT INTO `document_types` VALUES (3,'ID PROOF'),(4,'REGISTERY');
/*!40000 ALTER TABLE `document_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filestore_file`
--

DROP TABLE IF EXISTS `filestore_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filestore_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filestore_type_id` int(11) NOT NULL DEFAULT '0',
  `filestore_volume_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `original_filename` varchar(255) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `filenum` int(11) NOT NULL DEFAULT '0',
  `deleted` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filestore_file`
--

LOCK TABLES `filestore_file` WRITE;
/*!40000 ALTER TABLE `filestore_file` DISABLE KEYS */;
INSERT INTO `filestore_file` VALUES (1,1,1,'0/20140730133029_1_thumb-2.png','thumb_2.png',36690,0,''),(2,1,1,'0/20140730133028__2.png','2.png',820258,0,''),(3,1,1,'0/20140730133058_1_thumb-2.png','thumb_2.png',36690,0,''),(4,1,1,'0/20140730133058__2.png','2.png',820258,0,''),(5,1,1,'0/20140730134123_1_thumb-1.png','thumb_1.png',2938,0,''),(6,1,1,'0/20140730134123__1.png','1.png',69795,0,''),(7,1,1,'0/20140730143155_1_thumb-1.png','thumb_1.png',2938,0,''),(8,1,1,'0/20140730143155__1.png','1.png',69795,0,''),(9,1,1,'0/20140730143230_1_thumb-3d.png','thumb_3d.png',2117,0,''),(10,1,1,'0/20140730143230__3d.png','3d.png',82621,0,'');
/*!40000 ALTER TABLE `filestore_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filestore_image`
--

DROP TABLE IF EXISTS `filestore_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filestore_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `original_file_id` int(11) NOT NULL DEFAULT '0',
  `thumb_file_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filestore_image`
--

LOCK TABLES `filestore_image` WRITE;
/*!40000 ALTER TABLE `filestore_image` DISABLE KEYS */;
INSERT INTO `filestore_image` VALUES (1,NULL,2,1),(2,NULL,4,3),(3,NULL,6,5),(4,NULL,8,7),(5,NULL,10,9);
/*!40000 ALTER TABLE `filestore_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filestore_type`
--

DROP TABLE IF EXISTS `filestore_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filestore_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `mime_type` varchar(64) NOT NULL DEFAULT '',
  `extension` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filestore_type`
--

LOCK TABLES `filestore_type` WRITE;
/*!40000 ALTER TABLE `filestore_type` DISABLE KEYS */;
INSERT INTO `filestore_type` VALUES (1,'png','image/png','png'),(2,'jpeg','image/jpeg','jpeg'),(3,'gif','image/gif','gif');
/*!40000 ALTER TABLE `filestore_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filestore_volume`
--

DROP TABLE IF EXISTS `filestore_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filestore_volume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `dirname` varchar(255) NOT NULL DEFAULT '',
  `total_space` bigint(20) NOT NULL DEFAULT '0',
  `used_space` bigint(20) NOT NULL DEFAULT '0',
  `stored_files_cnt` int(11) NOT NULL DEFAULT '0',
  `enabled` enum('Y','N') DEFAULT 'Y',
  `last_filenum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filestore_volume`
--

LOCK TABLES `filestore_volume` WRITE;
/*!40000 ALTER TABLE `filestore_volume` DISABLE KEYS */;
INSERT INTO `filestore_volume` VALUES (1,'upload','upload',1000000000,0,10,'Y',NULL);
/*!40000 ALTER TABLE `filestore_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parties`
--

DROP TABLE IF EXISTS `parties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `is_agent` tinyint(1) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `address` text,
  `dob` date DEFAULT NULL,
  `ph_no` varchar(255) DEFAULT NULL,
  `pancard_no` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `agent_image_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parties`
--

LOCK TABLES `parties` WRITE;
/*!40000 ALTER TABLE `parties` DISABLE KEYS */;
INSERT INTO `parties` VALUES (3,'Jitendra Mali ',1,'Shyam Lal ji Mali','RK Circle Pula','1993-07-05','97830015650',876787,NULL,NULL),(4,'Chirag Singhvi',0,'Deepak ji Singhvi','428- Badgaon Udaipur','1994-06-04','8094777293',456765,NULL,NULL);
/*!40000 ALTER TABLE `parties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party_documents`
--

DROP TABLE IF EXISTS `party_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `party_id` varchar(255) DEFAULT NULL,
  `document_type_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image_id` varchar(255) DEFAULT NULL,
  `submitted_on` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party_documents`
--

LOCK TABLES `party_documents` WRITE;
/*!40000 ALTER TABLE `party_documents` DISABLE KEYS */;
INSERT INTO `party_documents` VALUES (1,'3','3','kjhkj','6','2014-07-30'),(2,'4','3','','8','2014-07-30');
/*!40000 ALTER TABLE `party_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_transaction`
--

DROP TABLE IF EXISTS `payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `party_id` int(11) DEFAULT NULL,
  `receipt_no` int(11) DEFAULT NULL,
  `amount` decimal(11,4) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `deal_type` varchar(255) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `rate` decimal(11,4) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `agent_tds_amount` decimal(11,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_transaction`
--

LOCK TABLES `payment_transaction` WRITE;
/*!40000 ALTER TABLE `payment_transaction` DISABLE KEYS */;
INSERT INTO `payment_transaction` VALUES (60,41,3,4,1,1200000.0000,'2014-07-29','Purchase','ToPay',12.0000,'Biga',NULL),(61,41,3,4,2,5000.0000,'2014-07-29','Purchase','AgentCommissionPurchase',12.0000,'Biga',NULL),(62,42,3,4,3,1200000.0000,'2014-07-30','Purchase','ToPay',12.0000,'Biga',240000.0000),(63,42,3,4,4,5000.0000,'2014-07-30','Purchase','AgentCommissionPurchase',12.0000,'Biga',1000.0000),(64,43,3,4,5,1000000.0000,'2014-07-30','Purchase','ToPay',12.0000,'Biga',100000.0000),(65,43,3,4,6,5000.0000,'2014-07-30','Purchase','AgentCommissionPurchase',12.0000,'Biga',100000.0000),(72,44,3,4,13,20000.0000,'2014-08-05','Purchase','ToPay',200000.0000,'Biga',2000.0000),(73,44,3,4,14,200.0000,'2014-08-05','Purchase','AgentCommissionPurchase',200000.0000,'Biga',2000.0000),(74,45,3,4,15,30000.0000,'2014-08-05','Purchase','ToPay',300000.0000,'Sqft',3000.0000),(75,45,3,4,16,3000.0000,'2014-08-05','Purchase','AgentCommissionPurchase',300000.0000,'Sqft',3000.0000),(76,45,3,4,17,203000.0000,'2014-08-05','Sales','ToReceive',9999999.9999,'Sqft',20300.0000),(77,45,3,4,18,2000.0000,'2014-08-05','Sales','AgentCommissionSale',9999999.9999,'Sqft',20300.0000),(78,44,3,4,19,2999.0000,'2014-08-05','Sales','ToReceive',567576.0000,'Sqft',299.9000),(79,44,3,4,20,2000.0000,'2014-08-05','Sales','AgentCommissionSale',567576.0000,'Sqft',299.9000);
/*!40000 ALTER TABLE `payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_paid`
--

DROP TABLE IF EXISTS `payments_paid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments_paid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_transaction_id` int(11) DEFAULT NULL,
  `amount` decimal(11,4) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `narration` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_paid`
--

LOCK TABLES `payments_paid` WRITE;
/*!40000 ALTER TABLE `payments_paid` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments_paid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plannings`
--

DROP TABLE IF EXISTS `plannings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plannings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tehsil_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `village_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plannings`
--

LOCK TABLES `plannings` WRITE;
/*!40000 ALTER TABLE `plannings` DISABLE KEYS */;
INSERT INTO `plannings` VALUES (3,2,'New Home Celebration Ploat',2,2,2);
/*!40000 ALTER TABLE `plannings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_type_id` int(11) DEFAULT NULL,
  `planning_id` int(11) DEFAULT NULL,
  `conversion_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_legal` tinyint(1) DEFAULT NULL,
  `is_registered` tinyint(1) DEFAULT NULL,
  `google_map_address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (44,3,3,3,'Property','Sold',1,0,NULL),(45,3,3,5,'HDO Converted Ploat','Sold',1,0,NULL);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_documents`
--

DROP TABLE IF EXISTS `property_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) DEFAULT NULL,
  `document_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_documents`
--

LOCK TABLES `property_documents` WRITE;
/*!40000 ALTER TABLE `property_documents` DISABLE KEYS */;
INSERT INTO `property_documents` VALUES (1,41,4,'Re',10);
/*!40000 ALTER TABLE `property_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_logs`
--

DROP TABLE IF EXISTS `property_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `party_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `amount` decimal(11,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_logs`
--

LOCK TABLES `property_logs` WRITE;
/*!40000 ALTER TABLE `property_logs` DISABLE KEYS */;
INSERT INTO `property_logs` VALUES (80,4,3,41,'Purchase','2014-07-29',1200000.0000),(81,4,3,42,'Purchase','2014-07-30',1200000.0000),(82,4,3,43,'Purchase','2014-07-30',1000000.0000),(83,4,3,42,'Sale','2014-08-04',20000.0000),(84,4,3,41,'Sale','2014-08-04',19999.0000),(85,4,3,43,'Sale','2014-08-04',123.0000),(86,4,3,44,'Purchase','2014-08-05',20000.0000),(87,4,3,45,'Purchase','2014-08-05',30000.0000),(88,4,3,45,'Sale','2014-08-05',203000.0000),(89,4,3,44,'Sale','2014-08-05',2999.0000);
/*!40000 ALTER TABLE `property_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_types`
--

DROP TABLE IF EXISTS `property_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_types`
--

LOCK TABLES `property_types` WRITE;
/*!40000 ALTER TABLE `property_types` DISABLE KEYS */;
INSERT INTO `property_types` VALUES (2,'Plot'),(3,'Agriculture');
/*!40000 ALTER TABLE `property_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (2,'Rajasthan');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tehsiles`
--

DROP TABLE IF EXISTS `tehsiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tehsiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tehsiles`
--

LOCK TABLES `tehsiles` WRITE;
/*!40000 ALTER TABLE `tehsiles` DISABLE KEYS */;
INSERT INTO `tehsiles` VALUES (2,2,'Girva');
/*!40000 ALTER TABLE `tehsiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `villages`
--

DROP TABLE IF EXISTS `villages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `villages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tehsil_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villages`
--

LOCK TABLES `villages` WRITE;
/*!40000 ALTER TABLE `villages` DISABLE KEYS */;
INSERT INTO `villages` VALUES (2,2,'Gogunda');
/*!40000 ALTER TABLE `villages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-05 13:46:39
