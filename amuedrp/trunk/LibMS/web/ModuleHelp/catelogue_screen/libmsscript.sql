-- MySQL dump 10.11
--
-- Host: localhost    Database: libms
-- ------------------------------------------------------
-- Server version	5.0.77

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
-- Table structure for table `accession_register`
--

DROP TABLE IF EXISTS `accession_register`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `accession_register` (
  `library_id` varchar(20) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `biblio_id` int(11) default NULL,
  `accession_no` varchar(40) default NULL,
  `record_no` int(11) NOT NULL default '0',
  `volume_no` varchar(5) default NULL,
  `location` varchar(200) default NULL,
  `shelving_location` varchar(200) default NULL,
  `index_no` varchar(20) default NULL,
  `no_of_pages` varchar(20) default NULL,
  `physical_width` varchar(20) default NULL,
  `bind_type` varchar(20) default NULL,
  `physical_form` varchar(200) default NULL,
  `physical_description` varchar(200) default NULL,
  `colour` varchar(20) default NULL,
  `date_acquired` varchar(20) default NULL,
  PRIMARY KEY  (`library_id`,`record_no`,`sublibrary_id`),
  KEY `biblio_id` (`biblio_id`,`library_id`,`sublibrary_id`),
  CONSTRAINT `accession_register_ibfk_1` FOREIGN KEY (`biblio_id`, `library_id`, `sublibrary_id`) REFERENCES `bibliographic_details` (`biblio_id`, `library_id`, `sublibrary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `accession_register`
--

LOCK TABLES `accession_register` WRITE;
/*!40000 ALTER TABLE `accession_register` DISABLE KEYS */;
INSERT INTO `accession_register` VALUES ('jmi','jmi',1,'HI1',1,'2','RM','3rd stack','I-XI','200','5.4 inch','hard',NULL,NULL,NULL,'2011-09-13'),('jmi','jmi',1,'HI2',2,'2','RM','3rd stack','I-XI','200','5.4 inch','hard',NULL,NULL,NULL,'2011-09-13'),('jmi','jmi',2,'3',3,'1','RM','','i-xii','150','8.4 inch','hard',NULL,NULL,NULL,'2011-09-13'),('jmi','jmi',2,'4',4,'1','RM','','i-xii','150','8.4 inch','hard',NULL,NULL,NULL,'2011-09-13'),('jmi','jmi',3,'HI5',5,'2','RM','2nd reck','i-xi','200','5.4 inch','hard',NULL,NULL,NULL,'2011-09-13'),('jmi','jmi',3,'HI6',6,'2','RM','2nd reck','i-xi','200','5.4 inch','hard',NULL,NULL,NULL,'2011-09-13');
/*!40000 ALTER TABLE `accession_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acq_approval`
--

DROP TABLE IF EXISTS `acq_approval`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `acq_approval` (
  `approval_item_id` int(11) NOT NULL default '0',
  `library_id` varchar(20) NOT NULL default '',
  `sub_library_id` varchar(20) NOT NULL default '',
  `control_no` int(11) default NULL,
  `approval_no` varchar(20) default NULL,
  `no_of_copies` int(11) default NULL,
  `status` varchar(50) default NULL,
  `order_no` varchar(20) default NULL,
  PRIMARY KEY  (`library_id`,`sub_library_id`,`approval_item_id`),
  KEY `library_id` (`library_id`,`sub_library_id`,`approval_no`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `acq_approval`
--

LOCK TABLES `acq_approval` WRITE;
/*!40000 ALTER TABLE `acq_approval` DISABLE KEYS */;
INSERT INTO `acq_approval` VALUES (1,'jmi','jmi',1,'2',10,'pending',NULL),(2,'jmi','jmi',1,'2',5,'pending',NULL),(3,'jmi','jmi',2,'44',2,'pending',NULL);
/*!40000 ALTER TABLE `acq_approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acq_approval_header`
--

DROP TABLE IF EXISTS `acq_approval_header`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `acq_approval_header` (
  `approval_no` varchar(20) NOT NULL default '',
  `vendor_id` varchar(50) default NULL,
  `approved_by` varchar(50) default NULL,
  `approval_date` varchar(20) default NULL,
  `library_id` varchar(20) NOT NULL default '',
  `sub_library_id` varchar(20) NOT NULL default '',
  `acq_mode` varchar(20) default NULL,
  `recommended_by` varchar(20) default NULL,
  PRIMARY KEY  (`library_id`,`sub_library_id`,`approval_no`),
  KEY `library_id` (`library_id`,`sub_library_id`,`vendor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `acq_approval_header`
--

LOCK TABLES `acq_approval_header` WRITE;
/*!40000 ALTER TABLE `acq_approval_header` DISABLE KEYS */;
INSERT INTO `acq_approval_header` VALUES ('2','tmh','','2011-07-05','jmi','jmi','Approved',''),('78','tmh','kk','2011-09-13','jmi','jmi','Approved','kk'),('79','tmh','yy','2011-09-13','jmi','jmi','Approved','rr'),('80','tmh','yy','2011-09-13','jmi','jmi','Approved','uiu'),('67','tmh','uu','2011-09-13','jmi','jmi','Approved','uu'),('100','tmh','sunil kumar','2011-09-13','jmi','jmi','Approved','sunil kumar'),('101','tmh','sunil kr','2011-09-13','jmi','jmi','Approved','sunil kr'),('500','tmh','sunil','2011-09-13','jmi','jmi','Approved','sunil'),('50','tmh','sunil kr','2011-09-13','jmi','jmi','Approved','sunil kr'),('8','tmh','kedar','2011-09-13','jmi','jmi','Approved','kedar'),('5','tmh','k','2011-09-13','jmi','jmi','Approved','k'),('52','tmh','e','2011-09-13','jmi','jmi','Approved','e'),('44','tmh','g','2011-09-14','jmi','jmi','Approved','g');
/*!40000 ALTER TABLE `acq_approval_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acq_bibliography`
--

DROP TABLE IF EXISTS `acq_bibliography`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `acq_bibliography` (
  `title_id` int(11) NOT NULL default '0',
  `doc_type` varchar(50) default NULL,
  `title` varchar(100) default NULL,
  `publisher_name` varchar(100) default NULL,
  `author` varchar(100) default NULL,
  `lcc_no` varchar(20) default NULL,
  `series` varchar(20) default NULL,
  `library_id` varchar(20) NOT NULL default '',
  `sub_library_id` varchar(20) NOT NULL default '',
  `sub_author` varchar(50) default NULL,
  `publishing_yr` varchar(20) default NULL,
  `publishing_place` varchar(20) default NULL,
  `edition` varchar(100) default NULL,
  `isbn` varchar(20) default NULL,
  `volume_no` varchar(13) default NULL,
  `sub_author0` varchar(100) default NULL,
  `sub_author1` varchar(100) default NULL,
  `sub_author2` varchar(100) default NULL,
  PRIMARY KEY  (`library_id`,`sub_library_id`,`title_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `acq_bibliography`
--

LOCK TABLES `acq_bibliography` WRITE;
/*!40000 ALTER TABLE `acq_bibliography` DISABLE KEYS */;
INSERT INTO `acq_bibliography` VALUES (1,'Book','computer network','','kanitkar','',NULL,'jmi','jmi','','','','','','','','',''),(2,'Book','c++','','R. Raman','',NULL,'jmi','jmi','','','','','','','','','');
/*!40000 ALTER TABLE `acq_bibliography` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acq_bibliography_details`
--

DROP TABLE IF EXISTS `acq_bibliography_details`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `acq_bibliography_details` (
  `control_no` int(11) NOT NULL default '0',
  `title_id` int(11) default NULL,
  `no_of_copies` int(11) default NULL,
  `volume` varchar(50) default NULL,
  `subject` varchar(50) default NULL,
  `unit_price` int(11) default NULL,
  `currency` varchar(20) default NULL,
  `primary_budget` varchar(50) default NULL,
  `requested_by` varchar(50) default NULL,
  `requested_date` varchar(20) default NULL,
  `acq_mode` varchar(20) default NULL,
  `status` varchar(20) default NULL,
  `library_id` varchar(20) NOT NULL default '',
  `sub_library_id` varchar(20) NOT NULL default '',
  `vendor` varchar(100) default NULL,
  `author` varchar(100) default NULL,
  `no_of_volume` varchar(50) default NULL,
  PRIMARY KEY  (`library_id`,`sub_library_id`,`control_no`),
  KEY `library_id` (`library_id`,`sub_library_id`,`title_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `acq_bibliography_details`
--

LOCK TABLES `acq_bibliography_details` WRITE;
/*!40000 ALTER TABLE `acq_bibliography_details` DISABLE KEYS */;
INSERT INTO `acq_bibliography_details` VALUES (1,1,0,NULL,NULL,1,'INR','Cv',NULL,NULL,'Approved','Fully Approved','jmi','jmi','tmh',NULL,NULL),(2,1,0,NULL,NULL,1,'INR','Cv',NULL,NULL,'Approved','Fully Approved','jmi','jmi','tmh',NULL,NULL),(3,1,1,'',NULL,1,'CUP','Cv','','2011-07-05','Firm Order','','jmi','jmi','tmh',NULL,NULL),(4,2,10,NULL,NULL,150,'INR','Cv',NULL,NULL,'On Approval','','jmi','jmi','tmh',NULL,NULL),(5,2,50,'',NULL,10,'INR','Cv','sunil kumar','2011-09-13','Firm Order',NULL,'jmi','jmi','tmh',NULL,NULL),(6,2,20,'2',NULL,1,'INR','Cv','sunil','2011-09-13','On Approval','','jmi','jmi',NULL,NULL,NULL);
/*!40000 ALTER TABLE `acq_bibliography_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acq_budget`
--

DROP TABLE IF EXISTS `acq_budget`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `acq_budget` (
  `budgethead_id` varchar(10) NOT NULL,
  `budgethead_name` varchar(20) default NULL,
  `library_id` varchar(20) NOT NULL,
  `budget_desc` varchar(2000) default NULL,
  PRIMARY KEY  (`library_id`,`budgethead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `acq_budget`
--

LOCK TABLES `acq_budget` WRITE;
/*!40000 ALTER TABLE `acq_budget` DISABLE KEYS */;
INSERT INTO `acq_budget` VALUES ('Cv','Central Budget','jmi','');
/*!40000 ALTER TABLE `acq_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acq_budget_allocation`
--

DROP TABLE IF EXISTS `acq_budget_allocation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `acq_budget_allocation` (
  `transaction_id` int(11) NOT NULL default '0',
  `budgethead_id` varchar(10) NOT NULL,
  `library_id` varchar(20) NOT NULL,
  `opening_balance` varchar(50) default NULL,
  `recieved_amount` varchar(50) default NULL,
  `total_amount` varchar(20) default NULL,
  `financial_yr1` varchar(20) default NULL,
  `financial_yr2` varchar(20) default NULL,
  `remarks` varchar(20) default NULL,
  `reqdate` varchar(10) default NULL,
  PRIMARY KEY  (`library_id`,`transaction_id`),
  KEY `budgethead_id` (`budgethead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `acq_budget_allocation`
--

LOCK TABLES `acq_budget_allocation` WRITE;
/*!40000 ALTER TABLE `acq_budget_allocation` DISABLE KEYS */;
INSERT INTO `acq_budget_allocation` VALUES (1,'Cv','jmi','0','50000','50000','2011',NULL,'','2011-07-05');
/*!40000 ALTER TABLE `acq_budget_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acq_budget_transaction`
--

DROP TABLE IF EXISTS `acq_budget_transaction`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `acq_budget_transaction` (
  `transaction_id` int(11) NOT NULL,
  `library_id` varchar(20) NOT NULL,
  `acq_budget_head_id` varchar(20) default NULL,
  `control_no` varchar(20) default NULL,
  `amount` double default NULL,
  `transaction_date` varchar(20) default NULL,
  PRIMARY KEY  (`transaction_id`,`library_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `acq_budget_transaction`
--

LOCK TABLES `acq_budget_transaction` WRITE;
/*!40000 ALTER TABLE `acq_budget_transaction` DISABLE KEYS */;
INSERT INTO `acq_budget_transaction` VALUES (1,'jmi','Cv','1',10,'2011-07-05'),(2,'jmi','Cv','2',2,'2011-07-05'),(3,'jmi','Cv','3',10,'2011-07-05'),(4,'jmi','Cv','4',1500,'2011-09-13'),(5,'jmi','Cv','5',500,'2011-09-13'),(6,'jmi','Cv','6',20,'2011-09-13');
/*!40000 ALTER TABLE `acq_budget_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acq_currency`
--

DROP TABLE IF EXISTS `acq_currency`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `acq_currency` (
  `conversion_id` int(11) NOT NULL,
  `library_id` varchar(20) NOT NULL,
  `source_currency` varchar(20) default NULL,
  `target_currency` varchar(20) default NULL,
  `conversion_rate` float default NULL,
  `system_date` varchar(10) default NULL,
  PRIMARY KEY  (`conversion_id`,`library_id`),
  KEY `library_id` (`library_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `acq_currency`
--

LOCK TABLES `acq_currency` WRITE;
/*!40000 ALTER TABLE `acq_currency` DISABLE KEYS */;
INSERT INTO `acq_currency` VALUES (1,'jmi','CUP','INR',10,'2011-07-05');
/*!40000 ALTER TABLE `acq_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acq_final_demand_list`
--

DROP TABLE IF EXISTS `acq_final_demand_list`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `acq_final_demand_list` (
  `control_no` varchar(10) NOT NULL,
  `library_id` varchar(20) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `list_id` varchar(18) default NULL,
  `isbn` varchar(18) default NULL,
  `title` varchar(100) default NULL,
  `subtitle` varchar(100) default NULL,
  `author` varchar(200) default NULL,
  `price` varchar(20) default NULL,
  `total_amount` varchar(20) default NULL,
  `volume` varchar(3) default NULL,
  `edition` varchar(5) default NULL,
  `publisher_id` varchar(20) default NULL,
  `bind_id` varchar(40) default NULL,
  PRIMARY KEY  (`control_no`,`library_id`,`sublibrary_id`),
  KEY `library_id` (`library_id`),
  CONSTRAINT `acq_final_demand_list_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `acq_final_demand_list`
--

LOCK TABLES `acq_final_demand_list` WRITE;
/*!40000 ALTER TABLE `acq_final_demand_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `acq_final_demand_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acq_order1`
--

DROP TABLE IF EXISTS `acq_order1`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `acq_order1` (
  `order_item_id` varchar(10) NOT NULL default '',
  `library_id` varchar(20) NOT NULL default '',
  `sub_library_id` varchar(20) NOT NULL default '',
  `order_no` varchar(20) NOT NULL default '',
  `control_no` int(11) default NULL,
  `approval_item_id` int(11) default NULL,
  `recieving_status` varchar(20) default NULL,
  `recieving_date` varchar(10) default NULL,
  PRIMARY KEY  (`library_id`,`sub_library_id`,`order_no`,`order_item_id`),
  CONSTRAINT `acq_order1_ibfk_1` FOREIGN KEY (`library_id`, `sub_library_id`, `order_no`) REFERENCES `acq_order_header` (`library_id`, `sub_library_id`, `order_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `acq_order1`
--

LOCK TABLES `acq_order1` WRITE;
/*!40000 ALTER TABLE `acq_order1` DISABLE KEYS */;
/*!40000 ALTER TABLE `acq_order1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acq_order_header`
--

DROP TABLE IF EXISTS `acq_order_header`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `acq_order_header` (
  `order_no` varchar(20) NOT NULL default '',
  `library_id` varchar(20) NOT NULL default '',
  `sub_library_id` varchar(20) NOT NULL default '',
  `vendor_id` varchar(50) default NULL,
  `discount` varchar(20) default NULL,
  `order_date` varchar(20) default NULL,
  `due_date` varchar(20) default NULL,
  `order_status` varchar(10) default NULL,
  `cancel_reason` varchar(20) default NULL,
  `deliviery_date` varchar(10) default NULL,
  `ship_contact_name` varchar(100) default NULL,
  `ship_company_name` varchar(500) default NULL,
  `ship_address` varchar(500) default NULL,
  `ship_pin` varchar(8) default NULL,
  `ship_fax` varchar(16) default NULL,
  `ship_email` varchar(100) default NULL,
  `ship_cost` varchar(10) default NULL,
  `other_cost` varchar(10) default NULL,
  `tax_rate` varchar(10) default NULL,
  `tax_amount` varchar(10) default NULL,
  `grand_total` varchar(15) default NULL,
  `shipping_method` varchar(100) default NULL,
  `shipping_terms` varchar(500) default NULL,
  `comments` varchar(500) default NULL,
  PRIMARY KEY  (`library_id`,`sub_library_id`,`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `acq_order_header`
--

LOCK TABLES `acq_order_header` WRITE;
/*!40000 ALTER TABLE `acq_order_header` DISABLE KEYS */;
INSERT INTO `acq_order_header` VALUES ('200','jmi','jmi','tmh','0','2011-09-13','2011-09-30','Placed',NULL,NULL,'','','','','','','0','0','0','0','0','','','');
/*!40000 ALTER TABLE `acq_order_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acq_privilege`
--

DROP TABLE IF EXISTS `acq_privilege`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `acq_privilege` (
  `library_id` varchar(20) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `staff_id` varchar(100) NOT NULL,
  `acq_101` varchar(5) default 'true',
  `acq_102` varchar(5) default 'true',
  `acq_103` varchar(5) default 'true',
  `acq_104` varchar(5) default 'true',
  `acq_105` varchar(5) default 'true',
  `acq_106` varchar(5) default 'true',
  `acq_107` varchar(5) default 'true',
  `acq_108` varchar(5) default 'true',
  `acq_109` varchar(5) default 'true',
  `acq_110` varchar(5) default 'true',
  `acq_111` varchar(5) default 'true',
  `acq_112` varchar(5) default 'true',
  `acq_113` varchar(5) default 'true',
  `acq_114` varchar(5) default 'true',
  `acq_115` varchar(5) default 'true',
  `acq_116` varchar(5) default 'true',
  `acq_117` varchar(5) default 'true',
  `acq_118` varchar(5) default 'true',
  `acq_119` varchar(5) default 'true',
  `acq_120` varchar(5) default 'true',
  `acq_121` varchar(5) default 'true',
  `acq_122` varchar(5) default 'true',
  `acq_123` varchar(5) default 'true',
  `acq_124` varchar(5) default 'true',
  `acq_125` varchar(5) default 'true',
  `acq_126` varchar(5) default 'true',
  `acq_127` varchar(5) default 'true',
  `acq_128` varchar(5) default 'true',
  `acq_129` varchar(5) default 'true',
  `acq_130` varchar(5) default 'true',
  `acq_131` varchar(5) default 'true',
  `acq_132` varchar(5) default 'true',
  `acq_133` varchar(5) default 'true',
  `acq_134` varchar(5) default 'true',
  `acq_135` varchar(5) default 'true',
  `acq_136` varchar(5) default 'true',
  `acq_137` varchar(5) default 'true',
  `acq_138` varchar(5) default 'true',
  `acq_139` varchar(5) default 'true',
  `acq_140` varchar(5) default 'true',
  `acq_141` varchar(5) default 'true',
  `acq_142` varchar(5) default 'true',
  `acq_143` varchar(5) default 'true',
  `acq_144` varchar(5) default 'true',
  `acq_145` varchar(5) default 'true',
  `acq_146` varchar(5) default 'true',
  `acq_147` varchar(5) default 'true',
  `acq_148` varchar(5) default 'true',
  `acq_149` varchar(5) default 'true',
  `acq_150` varchar(5) default 'true',
  `acq_151` varchar(5) default 'true',
  `acq_152` varchar(5) default 'true',
  `acq_153` varchar(5) default 'true',
  `acq_154` varchar(5) default 'true',
  `acq_155` varchar(5) default 'true',
  `acq_156` varchar(5) default 'true',
  `acq_157` varchar(5) default 'true',
  `acq_158` varchar(5) default 'true',
  `acq_159` varchar(5) default 'true',
  `acq_160` varchar(5) default 'true',
  `acq_161` varchar(5) default 'true',
  `acq_162` varchar(5) default 'true',
  `acq_163` varchar(5) default 'true',
  `acq_164` varchar(5) default 'true',
  `acq_165` varchar(5) default 'true',
  `acq_166` varchar(5) default 'true',
  `acq_167` varchar(5) default 'true',
  `acq_168` varchar(5) default 'true',
  `acq_169` varchar(5) default 'true',
  `acq_170` varchar(5) default 'true',
  `acq_171` varchar(5) default 'true',
  `acq_172` varchar(5) default 'true',
  `acq_173` varchar(5) default 'true',
  `acq_174` varchar(5) default 'true',
  `acq_175` varchar(5) default 'true',
  `acq_176` varchar(5) default 'true',
  `acq_177` varchar(5) default 'true',
  `acq_178` varchar(5) default 'true',
  `acq_179` varchar(5) default 'true',
  `acq_180` varchar(5) default 'true',
  `acq_181` varchar(5) default 'true',
  `acq_182` varchar(5) default 'true',
  `acq_183` varchar(5) default 'true',
  `acq_184` varchar(5) default 'true',
  `acq_185` varchar(5) default 'true',
  `acq_186` varchar(5) default 'true',
  `acq_187` varchar(5) default 'true',
  `acq_188` varchar(5) default 'true',
  `acq_189` varchar(5) default 'true',
  `acq_190` varchar(5) default 'true',
  `acq_191` varchar(5) default 'true',
  `acq_192` varchar(5) default 'true',
  `acq_193` varchar(5) default 'true',
  `acq_194` varchar(5) default 'true',
  `acq_195` varchar(5) default 'true',
  `acq_196` varchar(5) default 'true',
  `acq_197` varchar(5) default 'true',
  `acq_198` varchar(5) default 'true',
  `acq_199` varchar(5) default 'true',
  PRIMARY KEY  (`staff_id`,`library_id`),
  CONSTRAINT `login_ibfk_5` FOREIGN KEY (`staff_id`, `library_id`) REFERENCES `staff_detail` (`staff_id`, `library_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `acq_privilege`
--

LOCK TABLES `acq_privilege` WRITE;
/*!40000 ALTER TABLE `acq_privilege` DISABLE KEYS */;
INSERT INTO `acq_privilege` VALUES ('amu','amu','111','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('bbzhcet','bbzhcet','111','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true'),('dei','dei','111','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('jmi','jmi','111','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('yy','yy','111','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','false','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','false','false','false','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true'),('amu','csamu','222','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true'),('jmi','cs','6666','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true'),('amu','amu','admin.amu','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('avlin','avlin','admin.avlin','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('bbzhcet','bbzhcet','admin.bbzhcet','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('dei','dei','admin.dei','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('iitk','iitk','admin.iitk','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('iu','iu','admin.iu','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('jmi','jmi','admin.jmi','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('rvce','rvce','admin.rvce','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('scc','scc','admin.scc','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('tt','tt','admin.tt','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('yy','yy','admin.yy','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false');
/*!40000 ALTER TABLE `acq_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acq_recieving_details`
--

DROP TABLE IF EXISTS `acq_recieving_details`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `acq_recieving_details` (
  `recieving_item_id` int(11) NOT NULL default '0',
  `library_id` varchar(20) NOT NULL default '',
  `sub_library_id` varchar(20) NOT NULL default '',
  `recieving_no` varchar(20) NOT NULL default '',
  `title_id` int(11) default NULL,
  `unit_price` varchar(10) default NULL,
  `recieved_copies` int(11) default NULL,
  `pending_copies` int(11) default NULL,
  `approval_type` varchar(20) default NULL,
  `control_no` int(11) default NULL,
  PRIMARY KEY  (`library_id`,`sub_library_id`,`recieving_no`,`recieving_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `acq_recieving_details`
--

LOCK TABLES `acq_recieving_details` WRITE;
/*!40000 ALTER TABLE `acq_recieving_details` DISABLE KEYS */;
INSERT INTO `acq_recieving_details` VALUES (1,'jmi','jmi','200',NULL,NULL,5,NULL,NULL,4),(2,'jmi','jmi','200',NULL,NULL,3,NULL,NULL,6),(3,'jmi','jmi','201',NULL,NULL,5,NULL,NULL,4),(4,'jmi','jmi','201',NULL,NULL,5,NULL,NULL,5),(5,'jmi','jmi','201',NULL,NULL,3,NULL,NULL,6),(6,'jmi','jmi','202',2,NULL,4,NULL,NULL,6),(7,'jmi','jmi','202',2,NULL,3,NULL,NULL,5),(8,'jmi','jmi','301',2,NULL,5,NULL,NULL,7),(9,'jmi','jmi','301',2,NULL,20,NULL,NULL,9),(10,'jmi','jmi','301',2,NULL,7,NULL,NULL,8),(11,'jmi','jmi','302',NULL,NULL,20,NULL,NULL,9),(12,'jmi','jmi','302',1,NULL,8,NULL,NULL,8),(13,'jmi','jmi','302',2,NULL,5,NULL,NULL,7);
/*!40000 ALTER TABLE `acq_recieving_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acq_recieving_header`
--

DROP TABLE IF EXISTS `acq_recieving_header`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `acq_recieving_header` (
  `library_id` varchar(20) NOT NULL default '',
  `sub_library_id` varchar(20) NOT NULL default '',
  `recieving_no` varchar(20) NOT NULL default '',
  `vendor_id` varchar(20) default NULL,
  `order_no` varchar(20) default NULL,
  `recieved_date` varchar(20) default NULL,
  `recieved_by` varchar(20) default NULL,
  PRIMARY KEY  (`library_id`,`sub_library_id`,`recieving_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `acq_recieving_header`
--

LOCK TABLES `acq_recieving_header` WRITE;
/*!40000 ALTER TABLE `acq_recieving_header` DISABLE KEYS */;
INSERT INTO `acq_recieving_header` VALUES ('jmi','jmi','200','bpb','200','2011-08-08','kedar'),('jmi','jmi','201','bpb','200','2011-08-08',''),('jmi','jmi','202','bpb','200','2011-08-08',''),('jmi','jmi','301','TMH','201','2011-08-08','kedar'),('jmi','jmi','302','TMH','201','2011-08-08','');
/*!40000 ALTER TABLE `acq_recieving_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acq_vendor`
--

DROP TABLE IF EXISTS `acq_vendor`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `acq_vendor` (
  `vendor_id` varchar(50) NOT NULL default '',
  `library_id` varchar(20) NOT NULL default '',
  `address` varchar(50) default NULL,
  `city` varchar(10) default NULL,
  `state` varchar(20) default NULL,
  `country` varchar(20) default NULL,
  `pin` varchar(10) default NULL,
  `phone` varchar(10) default NULL,
  `fax` varchar(10) default NULL,
  `email` varchar(100) default NULL,
  `entry_date` varchar(20) default NULL,
  `sub_library_id` varchar(20) NOT NULL default '',
  `vendor` varchar(100) default NULL,
  `contact_person` varchar(50) default NULL,
  `vendor_currency` varchar(50) default NULL,
  PRIMARY KEY  (`library_id`,`sub_library_id`,`vendor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `acq_vendor`
--

LOCK TABLES `acq_vendor` WRITE;
/*!40000 ALTER TABLE `acq_vendor` DISABLE KEYS */;
INSERT INTO `acq_vendor` VALUES ('tmh','jmi','','','','','','64399','','kedar_muz@rediffmail.com',NULL,'jmi','Tata Mcgrawhill Ltd','Asif','INR');
/*!40000 ALTER TABLE `acq_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_registration`
--

DROP TABLE IF EXISTS `admin_registration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `admin_registration` (
  `registration_id` int(11) NOT NULL auto_increment,
  `institute_name` varchar(100) default NULL,
  `abbreviated_name` varchar(20) default NULL,
  `Institute_address` varchar(100) default NULL,
  `city` varchar(40) default NULL,
  `state` varchar(50) default NULL,
  `Country` varchar(30) default NULL,
  `pin` varchar(20) default NULL,
  `land_line_no` varchar(20) default NULL,
  `mobile_no` varchar(20) default NULL,
  `domain` varchar(20) default NULL,
  `login_id` varchar(20) default NULL,
  `type_of_institute` varchar(20) default NULL,
  `website` varchar(50) default NULL,
  `admin_fname` varchar(50) default NULL,
  `admin_lname` varchar(50) default NULL,
  `admin_designation` varchar(50) default NULL,
  `admin_email` varchar(100) default NULL,
  `admin_password` varchar(200) default NULL,
  `status` varchar(20) default NULL,
  `library_id` varchar(50) default NULL,
  `library_name` varchar(500) default NULL,
  `courtesy` varchar(10) default NULL,
  `gender` varchar(10) default NULL,
  `staff_id` varchar(100) default NULL,
  `working_status` varchar(50) NOT NULL default 'OK',
  `insti_logo` longblob,
  PRIMARY KEY  (`registration_id`),
  UNIQUE KEY `login_id` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `admin_registration`
--

LOCK TABLES `admin_registration` WRITE;
/*!40000 ALTER TABLE `admin_registration` DISABLE KEYS */;
INSERT INTO `admin_registration` VALUES (1,'Aligarh Muslim University','AMU','AMU, Aligarh','Aligarh','U.P.','India','202002','','9319098461',NULL,'aasim','govt','http://www.amu.ac.in','Aasim','Zafar','Administrator','aasimzafar@gmail.com','3f6ea67e781aa476e8638df6d5877447','Registered','amu','Maulana Azad Library1','Dr','male',NULL,'OK',NULL),(2,'IIT Kanpur','IITK','IIT Kanpur','Kanpur','U.P.','India','','','9223432451',NULL,'ynsingh','govt','http://www.iitk.ac.in','Yatindra Nath','Singh','','ynsingh69@gmail.com','8a9b1c308adbdefe4c47d62bf861f49d','Registered','iitk','IITK Library','Prof.','male',NULL,'OK',NULL),(3,'Dayal Bagh Educational Institute','DEI','Dayalbagh, Agra','Agra','U.P.','India','202002','','09927400888',NULL,'prem','semi_govt','www.dei.ac.in','Prem Sewak','Sudhish','Administrator','prem@gmail.com','f0c17eb77a937d973f1625f0441d02b6','Registered','dei','Dayalbagh Central Library','Mr.','male',NULL,'OK',NULL),(4,'Jamia Millia Islamia','','Jamia Nagar','New Delhi','Delhi1','India1','11','','098100',NULL,'azim','govt','','muzaffar','azim','','kedar9002@gmail.com',NULL,'Registered','jmi','Dr. Zakir Hussain Library','Select','male','admin.jmi','OK',NULL),(5,'Shivaji Science College','SCC','Amravati','Amravati','Maharashtra','India','','','09422155049',NULL,'murtaza','govt','','Murtaza','Ali','Administrator','murtaza@gmail.com','129e3011b32e8c12fd23475e3106ff6b','Registered','scc','Shivaji Library','','male','admin.scc','OK',NULL),(6,'R.V.College of ENgineering','R.V.C.E','Mysore Road, 8th Mile','bengaluru','Karnataka','India','560059','6717 8020','9901945674',NULL,'renukaprasadb','self_financed','http://www.rvce.edu.in','subramanya','kn','director admin','renukaprasadb@gmail.com','46eed70681a9a156462ae05b29a6914e','Registered','rvce','rvce-library','','male','admin.rvce','OK',NULL),(7,'AVINASHILINGAM DEEMED UNIVERSITY FOR WOMEN','','FACULTY OF ENGINEERING','Coimbatore','TmailNadu','India','-641 108','','9842057738',NULL,'auengg','self_financed','www.auengg.com','avi','admin','administrator','admin@auengg.com','0192023a7bbd73250516f069df18b500','Registered','avlin','avilib','','male','admin.avlin','OK',NULL),(8,'Book Bank','ZHCET','AMU','Aligarh','Uttar Pradesh','India','202002','0','9412509849',NULL,'bbzhcet','govt','','Asif fareed','Siddiqui','Assistant Librarian','asiffareedsiddiqui@yahoo.com','7e0deb8853363a84629ba98fbaa29c55','Registered','bbzhcet','Book Bank, ZHCET','Mr.','male','admin.bbzhcet','OK',NULL),(9,'hgfgh','fghfgh','fghfghfgh','fghfg','hfghfg','gfhfg','fghfg','','56754745',NULL,'kk','','','kk','kk','','kedar9002@gmail.com',NULL,'Registered','tt','ghfgjhfg','','male','admin.tt','OK',NULL),(10,'i','i','i','i','i','i','i','hdfh','645645',NULL,'u','','','i','i','hgdh','kedar9002@gmail.com',NULL,'Registered','iu','fhdfh','i','male','admin.iu','OK',NULL),(11,'k','h','jh','kh','khk','kkh','kk','kj','64564564',NULL,'k','','','k','kjkh','kk','kedar9002@gmail.com',NULL,'Registered','yy','fhdfh','hk','male','admin.yy','OK',NULL);
/*!40000 ALTER TABLE `admin_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_currency`
--

DROP TABLE IF EXISTS `base_currency`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `base_currency` (
  `library_id` varchar(20) NOT NULL,
  `base_currency_symbol` varchar(20) NOT NULL default '',
  `Formal_Name` varchar(20) default NULL,
  `direction` varchar(3) default NULL,
  PRIMARY KEY  (`base_currency_symbol`,`library_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `base_currency`
--

LOCK TABLES `base_currency` WRITE;
/*!40000 ALTER TABLE `base_currency` DISABLE KEYS */;
INSERT INTO `base_currency` VALUES ('jmi','INR','indian rupee','a');
/*!40000 ALTER TABLE `base_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblio`
--

DROP TABLE IF EXISTS `biblio`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `biblio` (
  `library_id` varchar(20) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `bib_id` int(11) NOT NULL default '0',
  `marctag` varchar(20) NOT NULL,
  `indicator1` char(1) default NULL,
  `indicator2` char(1) default NULL,
  `$a` varchar(300) default NULL,
  `$b` varchar(100) default NULL,
  `$c` varchar(100) default NULL,
  `$d` varchar(100) default NULL,
  `$e` varchar(100) default NULL,
  `$f` varchar(100) default NULL,
  `$g` varchar(100) default NULL,
  `$h` varchar(100) default NULL,
  `$i` varchar(100) default NULL,
  `$j` varchar(100) default NULL,
  `$k` varchar(100) default NULL,
  `$l` varchar(100) default NULL,
  `$m` varchar(100) default NULL,
  `$n` varchar(100) default NULL,
  `$o` varchar(100) default NULL,
  `$p` varchar(100) default NULL,
  `$q` varchar(100) default NULL,
  `$r` varchar(100) default NULL,
  `$s` varchar(100) default NULL,
  `$t` varchar(100) default NULL,
  `$u` varchar(100) default NULL,
  `$v` varchar(100) default NULL,
  `$w` varchar(100) default NULL,
  `$x` varchar(100) default NULL,
  `$y` varchar(100) default NULL,
  `$z` varchar(100) default NULL,
  `$0` varchar(100) default NULL,
  `$1` varchar(100) default NULL,
  `$2` varchar(100) default NULL,
  `$3` varchar(100) default NULL,
  `$4` varchar(100) default NULL,
  `$5` varchar(100) default NULL,
  `$6` varchar(100) default NULL,
  `$7` varchar(100) default NULL,
  `$8` varchar(100) default NULL,
  `$9` varchar(100) default NULL,
  PRIMARY KEY  (`library_id`,`bib_id`,`marctag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `biblio`
--

LOCK TABLES `biblio` WRITE;
/*!40000 ALTER TABLE `biblio` DISABLE KEYS */;
INSERT INTO `biblio` VALUES ('jmi','jmi',1,'010',NULL,NULL,'   99065414 ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'020',NULL,NULL,'0764575244',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'035',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'(DLC)   99065414'),('jmi','jmi',1,'040',NULL,NULL,'DLC',NULL,'DLC','DLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'042',NULL,NULL,'pcc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'050','0','0','QA76.73.C153','W326 1999',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'082','0','0','005.13/3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'21',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'100','1',NULL,'Walnum, Clayton.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'245','1','0','C++ master reference /',NULL,'Clayton Walnum.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'260',NULL,NULL,'Foster City, CA :','Idg Books Worldwide, Inc.,','1999.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'300',NULL,NULL,'xiii, 1517 p. :','ill. ;','25 cm. +',NULL,'1 computer optical disc (4 3/4 in.)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'650',NULL,'0','C++ (Computer program language)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'906',NULL,NULL,'7','cbc','orignew','2','opcn','19','y-gencatlg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'922',NULL,NULL,'ad',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'925','0',NULL,'Acquire','2 shelf copies',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'policy default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'955',NULL,NULL,'pn10/e-pcn 07-14-99; jf03 ibc 03-08-00; jf00 03-09-00; jf09 (desc) 6-9-2000 ; jf11 to sl 6-12-00; jf25 2 copies to Dewey 06-14-00; aa07 06-20-00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `biblio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblio_temp`
--

DROP TABLE IF EXISTS `biblio_temp`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `biblio_temp` (
  `library_id` varchar(20) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `bib_id` int(11) NOT NULL default '0',
  `marctag` varchar(20) NOT NULL,
  `indicator1` char(1) default NULL,
  `indicator2` char(1) default NULL,
  `$a` varchar(300) default NULL,
  `$b` varchar(100) default NULL,
  `$c` varchar(100) default NULL,
  `$d` varchar(100) default NULL,
  `$e` varchar(100) default NULL,
  `$f` varchar(100) default NULL,
  `$g` varchar(100) default NULL,
  `$h` varchar(100) default NULL,
  `$i` varchar(100) default NULL,
  `$j` varchar(100) default NULL,
  `$k` varchar(100) default NULL,
  `$l` varchar(100) default NULL,
  `$m` varchar(100) default NULL,
  `$n` varchar(100) default NULL,
  `$o` varchar(100) default NULL,
  `$p` varchar(100) default NULL,
  `$q` varchar(100) default NULL,
  `$r` varchar(100) default NULL,
  `$s` varchar(100) default NULL,
  `$t` varchar(100) default NULL,
  `$u` varchar(100) default NULL,
  `$v` varchar(100) default NULL,
  `$w` varchar(100) default NULL,
  `$x` varchar(100) default NULL,
  `$y` varchar(100) default NULL,
  `$z` varchar(100) default NULL,
  `$0` varchar(100) default NULL,
  `$1` varchar(100) default NULL,
  `$2` varchar(100) default NULL,
  `$3` varchar(100) default NULL,
  `$4` varchar(100) default NULL,
  `$5` varchar(100) default NULL,
  `$6` varchar(100) default NULL,
  `$7` varchar(100) default NULL,
  `$8` varchar(100) default NULL,
  `$9` varchar(100) default NULL,
  PRIMARY KEY  (`bib_id`,`library_id`,`marctag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `biblio_temp`
--

LOCK TABLES `biblio_temp` WRITE;
/*!40000 ALTER TABLE `biblio_temp` DISABLE KEYS */;
INSERT INTO `biblio_temp` VALUES ('jmi','jmi',1,'010',NULL,NULL,'   99065414 ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'020',NULL,NULL,'0764575244',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'035',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'040',NULL,NULL,'DLC',NULL,'DLC','DLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'042',NULL,NULL,'pcc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'050','0','0','QA76.73.C153','W326 1999',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'082','0','0','005.13/3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'100','1',NULL,'Walnum, Clayton.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'245','1','0','C++ master reference /',NULL,'Clayton Walnum.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'260',NULL,NULL,'Foster City, CA :','Idg Books Worldwide, Inc.,','1999.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'300',NULL,NULL,'xiii, 1517 p. :','ill. ;','25 cm. +',NULL,'1 computer optical disc (4 3/4 in.)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'650',NULL,'0','C++ (Computer program language)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'906',NULL,NULL,'7','cbc','orignew','2','opcn','19','y-gencatlg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'922',NULL,NULL,'ad',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'925','0',NULL,'Acquire','2 shelf copies',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'policy default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi',1,'955',NULL,NULL,'pn10/e-pcn 07-14-99; jf03 ibc 03-08-00; jf00 03-09-00; jf09 (desc) 6-9-2000 ; jf11 to sl 6-12-00; jf25 2 copies to Dewey 06-14-00; aa07 06-20-00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `biblio_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bibliographic_details`
--

DROP TABLE IF EXISTS `bibliographic_details`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `bibliographic_details` (
  `biblio_id` int(11) NOT NULL default '0',
  `library_id` varchar(20) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `document_type` varchar(20) default NULL,
  `book_type` varchar(20) default NULL,
  `accession_type` varchar(20) default NULL,
  `title` varchar(200) default NULL,
  `subtitle` varchar(200) default NULL,
  `alt_title` varchar(200) default NULL,
  `statement_responsibility` varchar(200) default NULL,
  `main_entry` varchar(200) default NULL,
  `added_entry` varchar(200) default NULL,
  `added_entry1` varchar(200) default NULL,
  `added_entry2` varchar(200) default NULL,
  `added_entry3` varchar(200) default NULL,
  `publisher_name` varchar(200) default NULL,
  `publication_place` varchar(200) default NULL,
  `publishing_year` varchar(20) default NULL,
  `call_no` varchar(30) default NULL,
  `parts_no` int(11) default NULL,
  `subject` varchar(200) default NULL,
  `entry_language` varchar(200) default NULL,
  `isbn10` varchar(20) default NULL,
  `isbn13` varchar(20) default NULL,
  `LCC_no` varchar(30) default NULL,
  `edition` varchar(20) default NULL,
  `no_of_copies` int(11) default NULL,
  `author_name` varchar(200) default NULL,
  `guide_name` varchar(200) default NULL,
  `university_faculty` varchar(200) default NULL,
  `degree` varchar(200) default NULL,
  `submitted_on` varchar(20) default NULL,
  `acceptance_year` varchar(20) default NULL,
  `collation1` varchar(20) default NULL,
  `notes` varchar(2000) default NULL,
  `abstract` varchar(2000) default NULL,
  `address` varchar(200) default NULL,
  `state1` varchar(100) default NULL,
  `country` varchar(100) default NULL,
  `email` varchar(200) default NULL,
  `frmr_frq` varchar(20) default NULL,
  `frq_date` varchar(20) default NULL,
  `issn` varchar(20) default NULL,
  `volume_location` varchar(20) default NULL,
  `production_year` int(11) default NULL,
  `source1` varchar(20) default NULL,
  `duration` varchar(20) default NULL,
  `series` varchar(1000) default NULL,
  `type_of_disc` varchar(20) default NULL,
  `file_type` varchar(20) default NULL,
  `date_acquired` varchar(20) default NULL,
  PRIMARY KEY  (`biblio_id`,`library_id`,`sublibrary_id`),
  KEY `library_id` (`library_id`),
  CONSTRAINT `bibliographic_details_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `bibliographic_details`
--

LOCK TABLES `bibliographic_details` WRITE;
/*!40000 ALTER TABLE `bibliographic_details` DISABLE KEYS */;
INSERT INTO `bibliographic_details` VALUES (1,'jmi','jmi','Book','ref',NULL,'complete ref java','','','kedar kumar','kedar kumar','','','','','','','','100',NULL,'','HI','z100','','','',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2011-09-13'),(2,'jmi','jmi','Book','ref',NULL,'Java Bible','','','Asif Iqubal','asif iqubal','','','','','TMH','','2000','200',NULL,'','',NULL,'','','',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2011-09-13'),(3,'jmi','jmi','Book','txt',NULL,'prem chand','','','prem chand','prem chand','','','','','','','','300',NULL,'','HI',NULL,'','','',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2011-09-13');
/*!40000 ALTER TABLE `bibliographic_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bibliographic_details_lang`
--

DROP TABLE IF EXISTS `bibliographic_details_lang`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `bibliographic_details_lang` (
  `biblio_id` int(11) NOT NULL default '0',
  `library_id` varchar(20) character set latin1 NOT NULL,
  `sublibrary_id` varchar(20) collate utf8_bin NOT NULL,
  `document_type` varchar(20) collate utf8_bin default NULL,
  `book_type` varchar(20) collate utf8_bin default NULL,
  `accession_type` varchar(20) collate utf8_bin default NULL,
  `date_acquired` varchar(20) collate utf8_bin default NULL,
  `title` varchar(200) collate utf8_bin default NULL,
  `subtitle` varchar(200) collate utf8_bin default NULL,
  `alt_title` varchar(200) collate utf8_bin default NULL,
  `statement_responsibility` varchar(200) collate utf8_bin default NULL,
  `main_entry` varchar(200) collate utf8_bin default NULL,
  `added_entry` varchar(200) collate utf8_bin default NULL,
  `added_entry1` varchar(200) collate utf8_bin default NULL,
  `added_entry2` varchar(200) collate utf8_bin default NULL,
  `added_entry3` varchar(200) collate utf8_bin default NULL,
  `publisher_name` varchar(200) collate utf8_bin default NULL,
  `publication_place` varchar(200) collate utf8_bin default NULL,
  `publishing_year` varchar(200) collate utf8_bin default NULL,
  `call_no` varchar(30) collate utf8_bin default NULL,
  `parts_no` int(11) default NULL,
  `subject` varchar(200) collate utf8_bin default NULL,
  `entry_language` varchar(200) collate utf8_bin default NULL,
  `isbn10` varchar(20) collate utf8_bin default NULL,
  `isbn13` varchar(20) collate utf8_bin default NULL,
  `LCC_no` varchar(30) collate utf8_bin default NULL,
  `edition` varchar(20) collate utf8_bin default NULL,
  `no_of_copies` int(11) default NULL,
  `author_name` varchar(200) collate utf8_bin default NULL,
  `guide_name` varchar(200) collate utf8_bin default NULL,
  `university_faculty` varchar(200) collate utf8_bin default NULL,
  `degree` varchar(200) collate utf8_bin default NULL,
  `submitted_on` varchar(20) collate utf8_bin default NULL,
  `acceptance_year` varchar(20) collate utf8_bin default NULL,
  `collation1` varchar(20) collate utf8_bin default NULL,
  `notes` varchar(2000) collate utf8_bin default NULL,
  `abstract` varchar(2000) collate utf8_bin default NULL,
  `address` varchar(200) collate utf8_bin default NULL,
  `state1` varchar(100) collate utf8_bin default NULL,
  `country` varchar(100) collate utf8_bin default NULL,
  `email` varchar(200) collate utf8_bin default NULL,
  `frmr_frq` varchar(20) collate utf8_bin default NULL,
  `frq_date` varchar(20) collate utf8_bin default NULL,
  `issn` varchar(20) collate utf8_bin default NULL,
  `volume_location` varchar(20) collate utf8_bin default NULL,
  `production_year` int(11) default NULL,
  `source1` varchar(20) collate utf8_bin default NULL,
  `duration` varchar(20) collate utf8_bin default NULL,
  `series` varchar(1000) collate utf8_bin default NULL,
  `type_of_disc` varchar(20) collate utf8_bin default NULL,
  `file_type` varchar(20) collate utf8_bin default NULL,
  PRIMARY KEY  (`biblio_id`,`library_id`,`sublibrary_id`),
  KEY `library_id` (`library_id`),
  CONSTRAINT `bibliographic_details_lang_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `bibliographic_details_lang`
--

LOCK TABLES `bibliographic_details_lang` WRITE;
/*!40000 ALTER TABLE `bibliographic_details_lang` DISABLE KEYS */;
INSERT INTO `bibliographic_details_lang` VALUES (1,'jmi','jmi','Book','ref',NULL,'2011-09-13','कोम्प्लेते  रेफ  जावा ','','','केदार कुमार ','केदार कुमार ','','','','','','','','100',NULL,'','HI','z100','','','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL),(3,'jmi','jmi','Book','txt',NULL,'2011-09-13','प्रेम  चाँद ','','','','प्रेम  चाँद ','','','','','','','','300',NULL,'','HI',NULL,'','','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL);
/*!40000 ALTER TABLE `bibliographic_details_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_category`
--

DROP TABLE IF EXISTS `book_category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `book_category` (
  `library_id` varchar(20) NOT NULL,
  `book_type` varchar(20) NOT NULL,
  `Detail` varchar(20) default NULL,
  `fine` float default NULL,
  `IssueDaysLimit` int(11) default NULL,
  `emptype_id` varchar(20) NOT NULL default '',
  `sub_emptype_id` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`book_type`,`library_id`,`emptype_id`,`sub_emptype_id`),
  KEY `library_id` (`library_id`,`emptype_id`,`sub_emptype_id`),
  CONSTRAINT `book_category_ibfk_1` FOREIGN KEY (`library_id`, `emptype_id`, `sub_emptype_id`) REFERENCES `sub_employee_type` (`library_id`, `emptype_id`, `sub_emptype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `book_category`
--

LOCK TABLES `book_category` WRITE;
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
INSERT INTO `book_category` VALUES ('dei','t','',1.5,5,'st','pg'),('iitk','t','',0,10,'t','prof'),('bbzhcet','TB','',0.5,15,'s','PG'),('jmi','txt','',2,2,'s','pg'),('jmi','txt','',1.5,2,'s','ug'),('scc','txt','',1.5,10,'s','ug');
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_privilege`
--

DROP TABLE IF EXISTS `cat_privilege`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cat_privilege` (
  `library_id` varchar(20) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `staff_id` varchar(100) NOT NULL,
  `cat_201` varchar(5) default 'true',
  `cat_202` varchar(5) default 'true',
  `cat_203` varchar(5) default 'true',
  `cat_204` varchar(5) default 'true',
  `cat_205` varchar(5) default 'true',
  `cat_206` varchar(5) default 'true',
  `cat_207` varchar(5) default 'true',
  `cat_208` varchar(5) default 'true',
  `cat_209` varchar(5) default 'true',
  `cat_210` varchar(5) default 'true',
  `cat_211` varchar(5) default 'true',
  `cat_212` varchar(5) default 'true',
  `cat_213` varchar(5) default 'true',
  `cat_214` varchar(5) default 'true',
  `cat_215` varchar(5) default 'true',
  `cat_216` varchar(5) default 'true',
  `cat_217` varchar(5) default 'true',
  `cat_218` varchar(5) default 'true',
  `cat_219` varchar(5) default 'true',
  `cat_220` varchar(5) default 'true',
  `cat_221` varchar(5) default 'true',
  `cat_222` varchar(5) default 'true',
  `cat_223` varchar(5) default 'true',
  `cat_224` varchar(5) default 'true',
  `cat_225` varchar(5) default 'true',
  `cat_226` varchar(5) default 'true',
  `cat_227` varchar(5) default 'true',
  `cat_228` varchar(5) default 'true',
  `cat_229` varchar(5) default 'true',
  `cat_230` varchar(5) default 'true',
  `cat_231` varchar(5) default 'true',
  `cat_232` varchar(5) default 'true',
  `cat_233` varchar(5) default 'true',
  `cat_234` varchar(5) default 'true',
  `cat_235` varchar(5) default 'true',
  `cat_236` varchar(5) default 'true',
  `cat_237` varchar(5) default 'true',
  `cat_238` varchar(5) default 'true',
  `cat_239` varchar(5) default 'true',
  `cat_240` varchar(5) default 'true',
  `cat_241` varchar(5) default 'true',
  `cat_242` varchar(5) default 'true',
  `cat_243` varchar(5) default 'true',
  `cat_244` varchar(5) default 'true',
  `cat_245` varchar(5) default 'true',
  `cat_246` varchar(5) default 'true',
  `cat_247` varchar(5) default 'true',
  `cat_248` varchar(5) default 'true',
  `cat_249` varchar(5) default 'true',
  `cat_250` varchar(5) default 'true',
  `cat_251` varchar(5) default 'true',
  `cat_252` varchar(5) default 'true',
  `cat_253` varchar(5) default 'true',
  `cat_254` varchar(5) default 'true',
  `cat_255` varchar(5) default 'true',
  `cat_256` varchar(5) default 'true',
  `cat_257` varchar(5) default 'true',
  `cat_258` varchar(5) default 'true',
  `cat_259` varchar(5) default 'true',
  `cat_260` varchar(5) default 'true',
  `cat_261` varchar(5) default 'true',
  `cat_262` varchar(5) default 'true',
  `cat_263` varchar(5) default 'true',
  `cat_264` varchar(5) default 'true',
  `cat_265` varchar(5) default 'true',
  `cat_266` varchar(5) default 'true',
  `cat_267` varchar(5) default 'true',
  `cat_268` varchar(5) default 'true',
  `cat_269` varchar(5) default 'true',
  `cat_270` varchar(5) default 'true',
  `cat_271` varchar(5) default 'true',
  `cat_272` varchar(5) default 'true',
  `cat_273` varchar(5) default 'true',
  `cat_274` varchar(5) default 'true',
  `cat_275` varchar(5) default 'true',
  `cat_276` varchar(5) default 'true',
  `cat_277` varchar(5) default 'true',
  `cat_278` varchar(5) default 'true',
  `cat_279` varchar(5) default 'true',
  `cat_280` varchar(5) default 'true',
  `cat_281` varchar(5) default 'true',
  `cat_282` varchar(5) default 'true',
  `cat_283` varchar(5) default 'true',
  `cat_284` varchar(5) default 'true',
  `cat_285` varchar(5) default 'true',
  `cat_286` varchar(5) default 'true',
  `cat_287` varchar(5) default 'true',
  `cat_288` varchar(5) default 'true',
  `cat_289` varchar(5) default 'true',
  `cat_290` varchar(5) default 'true',
  `cat_291` varchar(5) default 'true',
  `cat_292` varchar(5) default 'true',
  `cat_293` varchar(5) default 'true',
  `cat_294` varchar(5) default 'true',
  `cat_295` varchar(5) default 'true',
  `cat_296` varchar(5) default 'true',
  `cat_297` varchar(5) default 'true',
  `cat_298` varchar(5) default 'true',
  `cat_299` varchar(5) default 'true',
  PRIMARY KEY  (`staff_id`,`library_id`),
  CONSTRAINT `login_ibfk_11` FOREIGN KEY (`staff_id`, `library_id`) REFERENCES `staff_detail` (`staff_id`, `library_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cat_privilege`
--

LOCK TABLES `cat_privilege` WRITE;
/*!40000 ALTER TABLE `cat_privilege` DISABLE KEYS */;
INSERT INTO `cat_privilege` VALUES ('amu','amu','111','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('bbzhcet','bbzhcet','111','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true'),('dei','dei','111','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('jmi','jmi','111','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('yy','yy','111','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true'),('amu','csamu','222','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('jmi','cs','222','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('jmi','cs','6666','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true'),('amu','amu','admin.amu','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('avlin','avlin','admin.avlin','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('bbzhcet','bbzhcet','admin.bbzhcet','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('dei','dei','admin.dei','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('iitk','iitk','admin.iitk','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('iu','iu','admin.iu','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('jmi','jmi','admin.jmi','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('rvce','rvce','admin.rvce','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('scc','scc','admin.scc','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('tt','tt','admin.tt','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('yy','yy','admin.yy','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false');
/*!40000 ALTER TABLE `cat_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cir_checkin`
--

DROP TABLE IF EXISTS `cir_checkin`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cir_checkin` (
  `library_id` varchar(20) NOT NULL,
  `checkin_id` varchar(10) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `member_id` varchar(100) default NULL,
  `returning_date` varchar(15) default NULL,
  `document_id` varchar(10) default NULL,
  `checkout_id` int(11) default NULL,
  `damaged_status` varchar(20) default NULL,
  `loss_status` varchar(20) default NULL,
  `reason` varchar(100) default NULL,
  PRIMARY KEY  (`checkin_id`,`library_id`,`sublibrary_id`),
  KEY `checkout_id` (`checkout_id`,`library_id`,`sublibrary_id`),
  CONSTRAINT `cir_checkin_ibfk_1` FOREIGN KEY (`checkout_id`, `library_id`, `sublibrary_id`) REFERENCES `cir_checkout` (`checkout_id`, `library_id`, `sublibrary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cir_checkin`
--

LOCK TABLES `cir_checkin` WRITE;
/*!40000 ALTER TABLE `cir_checkin` DISABLE KEYS */;
INSERT INTO `cir_checkin` VALUES ('jmi','1','jmi','111','2011-07-02','1',NULL,'No','No',''),('jmi','2','jmi','111','2011-07-02','1',NULL,'No','No',''),('jmi','3','jmi','111','2011-07-02','1',NULL,'No','No','');
/*!40000 ALTER TABLE `cir_checkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cir_checkout`
--

DROP TABLE IF EXISTS `cir_checkout`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cir_checkout` (
  `library_id` varchar(20) NOT NULL,
  `memid` varchar(70) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `checkout_id` int(11) NOT NULL,
  `issue_date` varchar(50) default NULL,
  `due_date` varchar(50) default NULL,
  `document_id` varchar(25) NOT NULL,
  `status` varchar(20) default NULL,
  PRIMARY KEY  (`checkout_id`,`library_id`,`sublibrary_id`),
  KEY `library_id` (`library_id`),
  CONSTRAINT `cir_checkout_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cir_checkout`
--

LOCK TABLES `cir_checkout` WRITE;
/*!40000 ALTER TABLE `cir_checkout` DISABLE KEYS */;
INSERT INTO `cir_checkout` VALUES ('jmi','111','jmi',1,'2011-07-02','2011-07-04','1','returned'),('jmi','111','jmi',2,'2011-07-02','2011-07-04','1','returned'),('jmi','111','jmi',3,'2011-07-02','2011-07-04','1','returned'),('jmi','111','jmi',4,'2011-07-05','2011-07-07','1','issued');
/*!40000 ALTER TABLE `cir_checkout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cir_member_account`
--

DROP TABLE IF EXISTS `cir_member_account`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cir_member_account` (
  `library_id` varchar(20) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `memid` varchar(70) NOT NULL,
  `no_of_issueable_book` varchar(10) default NULL,
  `current_issued_book` varchar(10) default NULL,
  `total_issued_book` varchar(10) default NULL,
  `fine` varchar(10) default NULL,
  `no_of_chkout` varchar(10) default NULL,
  `reservation_made` varchar(10) default NULL,
  `lastchkoutdate` varchar(15) default NULL,
  `status` char(100) default NULL,
  `password` varchar(50) default NULL,
  `card_id` varchar(20) default NULL,
  `req_date` varchar(15) default NULL,
  `expiry_date` varchar(15) default NULL,
  `mem_type` varchar(20) default NULL,
  `sub_member_type` varchar(25) default NULL,
  `desg` varchar(100) default NULL,
  `office` varchar(100) default NULL,
  `faculty_id` varchar(20) default NULL,
  `dept_id` varchar(20) default NULL,
  `course_id` varchar(20) default NULL,
  `semester` varchar(10) default NULL,
  `ApprovedBy` varchar(50) default NULL,
  `remark` varchar(1000) default NULL,
  PRIMARY KEY  (`library_id`,`sublibrary_id`,`memid`),
  KEY `library_id` (`library_id`,`memid`),
  CONSTRAINT `cir_member_account_ibfk_1` FOREIGN KEY (`library_id`, `memid`) REFERENCES `cir_member_detail` (`library_id`, `memId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cir_member_account`
--

LOCK TABLES `cir_member_account` WRITE;
/*!40000 ALTER TABLE `cir_member_account` DISABLE KEYS */;
INSERT INTO `cir_member_account` VALUES ('jmi','jmi','111','7','1','4','0.0','0','0','2011-07-05','Active','9bf5e118c4e830a0b0fc40a6aaf69ee5','111','2011-07-06','2011-07-29','s','pg','',NULL,'Select','Select',NULL,'',NULL,'ee'),('jmi','jmi','222','7','0','0','0','0','0','','Blocked','f676043e8394d5f175babfdd852bc1fa','222','2011-09-01','2011-09-30','s','pg','',NULL,'Select','Select',NULL,'',NULL,'ww');
/*!40000 ALTER TABLE `cir_member_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cir_member_detail`
--

DROP TABLE IF EXISTS `cir_member_detail`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cir_member_detail` (
  `library_id` varchar(20) NOT NULL,
  `memId` varchar(70) NOT NULL,
  `fname` varchar(50) default NULL,
  `mname` varchar(40) default NULL,
  `lname` varchar(40) default NULL,
  `address1` varchar(200) default NULL,
  `address2` varchar(200) default NULL,
  `city1` varchar(50) default NULL,
  `state1` varchar(50) default NULL,
  `pin1` varchar(15) default NULL,
  `country1` varchar(60) default NULL,
  `city2` varchar(50) default NULL,
  `state2` varchar(50) default NULL,
  `pin2` varchar(15) default NULL,
  `country2` varchar(60) default NULL,
  `email` varchar(100) default NULL,
  `fax` varchar(100) default NULL,
  `phone1` varchar(15) default NULL,
  `phone2` varchar(15) default NULL,
  `location` varchar(70) default NULL,
  `image` longblob,
  `CreatedBy` varchar(50) default NULL,
  PRIMARY KEY  (`library_id`,`memId`),
  CONSTRAINT `cir_member_detail_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cir_member_detail`
--

LOCK TABLES `cir_member_detail` WRITE;
/*!40000 ALTER TABLE `cir_member_detail` DISABLE KEYS */;
INSERT INTO `cir_member_detail` VALUES ('jmi','111','kedar','','kumar','adm','','aligrah','UP',NULL,'India','','',NULL,'','kedar9002@gmail.com','','53463463','',NULL,'����\0JFIF\0,,\0\0��	LPhotoshop 3.0\08BIM�\nResolution\0\0\0\0,\0\0\0\0,\0\0\0\08BIM\rFX Global Lighting Angle\0\0\0\0\0\0\0x8BIMFX Global Altitude\0\0\0\0\0\0\08BIM�Print Flags\0\0\0	\0\0\0\0\0\0\0\0\08BIM\nCopyright Flag\0\0\0\0\0\08BIM\'Japanese Print Flags\0\0\0\0\n\0\0\0\0\0\0\0\08BIM�Color Halftone Settings\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0���\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIM�Color Transfer Settings\0\0\0p\0\0�����������������������\0\0\0\0�����������������������\0\0\0\0�����������������������\0\0\0\0�����������������������\0\08BIMGuides\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\rURL overrides\0\0\0\0\0\0\08BIM\ZSlices\0\0\0\0u\0\0\0\0\0\0\0\0\0\0\0\0\0X\0\0 \0\0\0\n\0U\0n\0t\0i\0t\0l\0e\0d\0-\01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\08BIMICC Untagged Flag\0\0\0\08BIMLayer ID Generator Base\0\0\0\0\0\08BIMNew Windows Thumbnail\0\0�\0\0\0\0\0\0p\0\0\0T\0\0P\0\0n@\0\0�\0\0����\0JFIF\0\0H\0H\0\0��\0Adobe\0d�\0\0\0��\0�\0			\n\r\r\r��\0\0T\0p\"\0��\0\0��?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r��C%�S���cs5���&D�TdE£t6�U�e���u��F\'���������������Vfv��������7GWgw��������\05\0!1AQaq\"2����B#�R��3$b�r��CScs4�%���&5��D�T�dEU6te����u��F���������������Vfv��������\'7GWgw�������\0\0\0?\0�_�7���H�T����+~�r��wo}��%��0�o	oK�	����@�	��<B���h\'ߓ{�_��|��oG�\n��ݽ����N�T�$^���˻{�N�Lr{�GyO����x�-�y����P�\n^�^�W�_���E��?�O�����O������-h�y�?����J��`����hn˴�o�S����^�ut�T���������72��C�#�����WS�K�Y��?���?*(ˤ����\ni�GE�%�nz�z�Pv}\r����]\n����8���F�^���z�>���[<��\"�R?XzX�����#��~�?�\'�T�����/Qc��������\0��y�7c[��\0�qDr��^j9��ѻ�)z��\\���I��\Z>�R�fvM�N����\0Eu���e�,̢��mc����Uk:�#4f�O�D�sۻ��R܏����3�c������8��#���Xa�6O\0���1�>������=V�I\Zs��j����n������?�����ao�oV��͵��?q�\0Ȫ���n�X�	��\n�yL^Jp��)�@<��W���������KpI\\/���	M+=�0�c��n<��F@�2\r��Õ_�>4A�X�O=�����nX9p��\r�_�>�Sq�JP�+�!�T�����ۓ`��U_qH�,���s�`� ���!SH;�G��ڈ�6����)�Z{¦<�LA�DIi�s�\'��nN�����$�������j����>��*B��T/���{�h %�)�t�\0�E3��\'�O��F�L����R����R�C�&��)��\nSA�Aݹ�)���K��It-g��}V*H������B�I;�cN��I]]��y�Ly,$�.�}<S�NC��J��I��8BIM!\ZVersion compatibility info\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \06\0.\00\0\0\0\08BIMJPEG Quality\0\0\0\0\0\0\0\0\0��\0Adobe\0d�\0\0\0��\0�\0			\n\r\r\r��\0X \"\0��\0\02��?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r��C%�S���cs5���&D�TdE£t6�U�e���u��F\'���������������Vfv��������7GWgw��������\05\0!1AQaq\"2����B#�R��3$b�r��CScs4�%���&5��D�T�dEU6te����u��F���������������Vfv��������\'7GWgw�������\0\0\0?\0��JTw۾�-58��R�!<�J�e)J��)R��JR�)J�&Z�*2��J�e)J��(R���*2��J�e)JiJRM���FR��L�%JR�[)JTe)J�l�)Q��*U���4��mt�4�)R��JiM)JT�%�$Ҕ��])L�RU���FR��\\L��Ҕ�J��)Q���q2��e)J�l�)Q���$�FR��l��JRU���FS��^R�JRU���FR��l�2iI[)JTRIV�R�JRU���4��l�)L���])QJRU���FR��l�Q��yJSJR��t�FS�J�ҕO)&�JSJR��t�4�)*ה�4�����)�1w=Ѥq2��	�<\r�� ��K��8G����[[r����A�4JÇ.\'�#��2��HO)J���-ڦ��&r��JR�[-�nQ�ҕ+���BR��\\L�)P��*W9JT%)J���\0���yJJ�% T�жS�R�?�NR�Z�g�%)�)��Z�weJR�[)JTyJ~�V�v�nPJtJ�l�%�D9HR�ZM�r}�!��$	J�i7%�Bt��*U�ܖ�	��)R����A)=��[=�nP��)R�$��uJP�q$ܖ��)Rx��[�&R�\0S)R����($e*W=�nP��Z�J�,�%��C%$�\\I7%��5I*WI�-�s��$�\\E&�!��\'�+��Kr�%*WM�-�s���Uēr}�%�x���K�\\I�� �Kr\\*�M�6�-�n��q����ۡ.��ނ��\n��n	o;��8��%4���8Aސwt�Sƛz[�wy��.�\n��oKr�r�\n��n	nA�Jm�\0�R�G\Z}�nA�R�R�O\Zm�n���	o)p��>���\r�6�4K�\\m��n��O��®4����q)%4���vx�@�$!�9x&�X)z��L\'�W�z͕q ��ʎ�ޛO��4�.�ŧ�U����Bq	PWg�7����C��POg�%�J��<�J��qKr���\0YJ�l�<�	��*M��ʄ�?ܕ*��i�UH��V��#䔔�V̔�FR	R����)�D���F��k���Ғ�4?Q�nzT�!�$��<(o	���R��vs߲S���R�8)R��IM�w���*W9JT7�|Ҥ�3_�\\�nO)R��)�CpH�\nU����4��6��O�	�k�T�e)O�Gth�pJ�kΩh�!-Е*�O�\'�\0G�<��V˲S���\Z�\n�e:��$�)	R��iQ$�N�J�R�	H8rR�[)KE�)?$�V�M;�*2<SL%J�r��n	�k�4�dJE��3�T�dN��\ni�J�l�i��)\n%\"{�R�[9��4��J�l�)�SJT�e)�	������@��Jt�EV�RQ����Ipt��J|yJ�ȥ�T�	�S/���/�%�Ӧ�k�IK�>I�R))y�I4�\'�T��)�ҚuIL�M��&�R��He%4�N�D�$���S�������~�vQJO�J��R��e/�*S)JyQ�Ӳ@�!Id?ܖ�3��rT�s����J;��4�V�DJ_�F~��vJ�l��*2��J�l���d&�R�2�)΅Fږ�R�2�����r�%�&<��wRܕ)��	��\nU����H	�p��W�ƥ�JP�	�Z�o$�D�Q��K��R)*��$�i)*�>!?oʙ/�YJR�/�))}��vQ��\0�$�\'��y	�|���I���$�\0rDꖿ�AVW=Ғ��	vӺJ��w	��Jd��U�����0J5IV�q�Rܣ)~D�VY�[�g�t�VWܐv�TyO��J������8)�J�e}��M�n�ۺJ����Kq���\0YI:�yKqM�(KDj���E:T�W��M��$�O�*���%�6��J�g���R�*>2���B�e���H?UȔ�T�\"�r[�T5�iR��n G�C攝R��a-�!����)R��ȟI�ҕ+�\')	�C����_�F����*��9�\nW9�D�>�0���}�\Z�J�e:��Q�a)��[):�g⇻���J�l��D:�J�l�r��ʄ����%J�s��S���p��R����*0�*U��������O�T�e>ic�\0�\Z�J�D��O��@ �e!\"tM�mRM����ReF|uJu�*U����*S��\ZU��Ӫ��JR�[2Rݪ����D�V�J[��F{�0�*�Oޖ�TIM)R���K��?�*U���N�?zS��+�����&�H�%?�W\\u��H���_��y��H��L����_r��-tIV�R�����RU��)K����$�IK��KD�Ot���-�����Jt�&�j���R얟4�R��)����)\\��ɟ$�yx��y��%�wIK����%#䒕:�)HL�%Z�S�\'�G��L��V�R���)O�*�L$�u���m4�4���\"ם��\0�7�T���k�S�7ĥ>%Z�\0�M)�J�l�)wQ��\ZE����t�k�Zw�2S��k��)Jd�(�-Zr4�Ja)웈��&��������%Z�M�)�\0zJ��Q䘒���]%?4�ܒ�.�8���J�I~T�%0��^�4��IV�%��6�4����J@����/�bS�IZ)/�R��;$��O1��iJg���\\���uO>HR�y�S�&��%I�S�@��Jؕ*ג�M����J^e$�=R%%*RJt�.�I���)$��%=�%�J\\�2S$`|�R�ǁI6�$��\0�R���K�%?���)��)�W�u�>i&J|B򔟂iI%.RM>	�R�N��Ҕ����Dĥ�ܕ)y�4�2S�Je3��<�̥\'��K��>���IL��%��O�T�R�i!)J�������K�⒗<r��)IIK���o/�1))���HM)�IK��\0bZ}�T�*Jd�TyN%%/)N�3iI	R�BS��4�<S\"Sw��R&Q�/?�I6��ײJ_�R����7��I]?>i��JRR�\0�\"G	�-��A��%���R�IJI/���EK���׺i�#��)S=�	�i�e%2�	��SO���Z���ؚe%/=���i����S-S&��%2�Ґ�)IJ� |$JJT�]��y�))pRM�I)��JC�4JRS))�R��RR�d�IK��\0bS��$����]S�%Z�N�J)ХZ�R��vI6��)�1J{B*e:h�SJH*ג���/�%/����HEK�M2�t��%/0�TSJT�e&�M)J\n������DӢG�-\nqm�iM�Jܕ*�I�4�	���R���?z�t�4�V��*:���\0\"T�^R�M=ҝ9J�k�����J�R��QJuJ�l��Q�	ХZ�Tg��N��Z�~I�ܣ!/$�l��7	�IV�K�?rm#D�$Z�&M<\'��)\\%��H���D�Ǻ`tJ|U���K�)�J�\0�	wM)������d��K.<��i�JR���tߕ7�2)j5M&R�>()t�$���}ɼ�K䂗KO�iI%/�$��+�%)v���S)�L����IJ��7	�%+���nR�%(��:iK�%.�ZG�4�����iO%%)1��)�D��/�t�%)#�o/�IJ��|�����mR��:JY(K���)_4ݓ��򄔭>����IJK�$��FRR�����	x���O�]�\"n�)EK�I2H)rԤ�gT�R�N���A(�t�$���\"�Z �JD����\0**���	�&@��r\nҧ�%M:���<�%I��R���?�J^|�SJy�Z��:iJt�%/)�y%��$�e�{��)IK��JS	%}BI�Ґ�����Fe?<$�_��)���J��S��җ(*�Jx�M?�S�%[$�e)�ҥZ�S�o�$�k�?�R��H��)wM)Od�k�JS%��/2�4��슗��L�:���)&rI*ט�����������~8QK��EL�	O��_��^BR�p�Ie�L���<�:��R��L~��+��%�]�IK���IK�I7ǲ\\p��������JRR�%\"OܘD%?rJ_�����o�K����(�\0������iM>z$��O�Z�)���\nJ]\"S|��)t�&�$���\'D��#��\n_��K��Ԧ����� �$��I��T��|H	�%/�0I/ʒ���M)N�)]��d�%.�t�iA�%/��)M)�$�D�R�RIK�I4��%[���N�)��\0�j���)�=�t�\n�{�S�n����\'��i�)J��ԥ=�t)\\I��#MP�O)R���y���E24�\"�s�wޣ��\'J�e�y��	oe\r.Е\'����ۏ��D\'*E��t�N	�D9JR����#�}ǹB�ĖRP�R���}�*;�:��9J�l�k����>���*��)����)����?r\\��/	R���M)�6\"R���6��JE2iIK�N��J_�G�ɒS$����w�IK��a1pIV��O�n7@N\'�*U�Nt�D��\n�S���i�I%Z򔦐;���*e�S�0:%�\nJ���Kυ�$����Q��$�R�5�$�e)J�R�%��J���%J�I�/4��Je>Ô��\0�����L��U��M��)�%/�I�I.�:%))���M���꒙HM)��S)*ב�$Ҕ�*_O�K��i�Hj��L��.�)t�s�K�%*O���/�	)y����IM:r���H��IK̥�4��$�ĥ)�Z��U� �)�)�*S������_�M�\n֧�dx�/$�\"ؒ-���Q�)J��\'��t��%2MƉ%�d��K����.�\0�%/	y&�\'�%+��%��6�$���/�ZǊR��▁7~I�R�I��<PR�BRA�L>:��%2��ԦTJt���)�$�������)$�]$��)쒔�_�y$�[�[ʌ�}���,��[�Sp�&�9\'^R�tJ~�V�~D�4��Jt�%/�$��I)t�M�I)_4�|S%Χ�IV��~i&	)y�iO�$����*d�$�䥸�JRU�\'���)�)$�^O~�x�\"<��%Yg!\"~�@�R�j�\'�\"H`��>�ġJ�d��\0P���[�T�g�Z�n>)��T�g�J)N��8��P��\'�)(Rm\'. !�O��+��)(�\'��[)��IQ�Jq�$��M?z]��%):d��J_�J|>���IK̄�E�J]4�ׄ�)D��\"%))y��!�����J\\����)�>i(���%/<%\"4��|�����S$�����\'�ǟ���$�GT�)~�)Ji���:���	�AJܒ�������/!)�NTt�\'��J�R��@��8J���?zi��HIK�)���\\���$�x���H��JR�R��~)�tɼ�S.�\0P�.�)y�Hx&��K�J_R���B_�%.�o�G�IK�ܞTg�H�����_��2y�$��H%t�O�?�J]6�y�R�:�i���R�)�\Z��J].SOܘ�)�����R��IK�D�L�2���;��7�R���M�)�ޞuI+�]�QN�����P�IKϊZ&��R�]�$��\0ޗ�M\'��%/)�|�Rऔ�M�%/��SwN���iK��))R��Zp�RR��I�?�i�S=�R��C��_�6Rn)C�O��[.�&|��~IR���S�<(n�Rݧ�J�l��4��_�V��)�Ji��*S)�JZ|JJe)Jm;��䒙L&�Ҝ~(�S��\\��t��S)JtQO?�\n����Jn�9�^|Sw�l<������RR鵔���RR�%:&)$��N�%��%/�C�L�)%yzu���@��K����ҒW<�4M?�S⊙�I����yIF{�*R�O�~�&��)?�IK�Ps��K�AvI�5�vE��JGr#�Ru�v��d�yN��Q��vEcNS�٪��nN��8�g�L� $r�?6UbIM��/l+��S�tG�N�wf���W���)��gs\nl�<8���ސ��.�<G�}�1�|�lĂ{�?ޔ�����������w�Rm�4h�e5l�ӌ��6g�pPY�[��4@�F�G�inX輤��;����D�P�/)�?ښu�-!%.���\rD���IJ�4���2I%y���I\"{���N����u�$���\0ry����%�J��|�>!)JJT���H|RIK�J)ҥ*t���|�R򔨂x�-AIK�$|���d��:�䗂\\���K�����$t�r�����R{$�T>	�&IK��K�R���R������⛔�	Lj����K��%+�)H�JV�&N�R�\04�~��IV�����^钥[4��J��c���)QM��	HU,�5����t�\\�\0�=�������n��%e��2A��f��ǐ�F�x#��%�/���Β�R\'�o�q~tH�5)�MRӾ�!pSw��A�0��(��x)�\'��&�)��!z��!8��8OeXI�KEc��\'i�)Rm>���i��\\z\nW	�÷0�)翂JRS�)�{����K�7�)h\nWt��(�X;�; \0#܈�=a7�3�\Z5?%]׾ h|P��I��)������ϷQ�rx!�R�� �E���D��H�ލ!yH�����)R��AM�K�%(\'LR���\\�{%���%�����v���|R���T���\"?Ҕ��I�4�)�IL����n��]�S-�� g���$�)#n��;�ȣ,�p��U��R���\"D7��[�1�*s+;��p	��]��7@\'���u���h��w�\r�OmO��\"o��O�� �q�2�]k��S̤�O�SK�S����	�ғ	!$/�1)v��)%yM!!�^�%+��/ȩ��x@CvmcF�S�$z#�wmIJUC�#���(�4�B#�#�=۳�����i=��۟�9Kڒ��wD�\Z��]:G�E�7<]�j^�\r�=����ig.����n2�O�4��Ԡ�=�=�}���`���T�}ݒܝ�G�8�iٷ\"vHgZ9\rU�J]���ǲ8�ݼ�����<��\"��ᮋ2e?�i����u���:���la�sGb��9��@��jr�!�L��H!���=���\0]S)r��yM���@��S4��\0fU0x�P~ubv|�\'K�8�v։y�\n����k5��;:����}��@RY�:�d�	}��L�jaf^���1pL|�Y�ϼ�o�	ֽ�����uD`�SJ9GQ�T��t�U]�@ϱ�z�������Zrřw���=�	$�uQ�ҤaKI%��#�4��2���Te<�J���.x&	�̋�;����7�t4���9�q�1v�$̠��R�e.�V�O�H�0��R�\n�S��#���IK�\0���R������L������\Z��;&�_^�-Tې8wϸU�\0*Z��6[n����3�gDyK���Ck��I��y\'UO�KD���%��-��#J_��yQݬƅ6�uJ�˿�I�%�$��K����.�%S)�$-	�	��_���rA)>	$�wJ|�9\'�VN�D�I�<��n9�%�S�T����꘥�%(h��ޔ��)IK�9�O�)O%%.��)�J~��Rڀ�B�N��%/\'��&ӘJBJQ>(�\\�i��r	��sb\'���$�/c���Q<�\n�.l�K�sH�$Ë��>qʡ������:�=����0�oowܤ,��_��۝�G��G����h�8|�Avc@����R���!�T��˴�|u����B\'�/�x��쏊\\h�?�I\ZC2�L_��Q��L�%��ײE�E?�J4�D�Ly�/�	���%.�G�� A\Zk撕:�ܑ�\Z�m���\0��!���[�޹��*=��RUNs���Z\\��@�]�M������8BI���\0XJc�������aی�8jgg��û����ʩ�/����DdT\\@:�07,��d�?F�����%��Iw��G�U:���[[݀BgU�1�;h��߈�,�>:�Ę�D}���Ӷz��[��K��4CoS��v�\0��,�{��KڏeS�^un�6���4f^Ǎ�:?ςc˲�l~��yH�\n�t����ٟ�U��ӣ�X��}��JLȱ���2^�)��%�ޤ�\0M��|��z��3&x�T]o$��\0��D�n�̷�����˧Q��!�B*��\'C�Y�	��&][Ƈ^#�!EL�$�&<�#	)S✨�o�S۲Jd��1 \0I�\\�۱�n�J��\0���?�M!3�\"R]<���_��R��L�#┕�%:%Hf)O(c�Jt�B�����R	nB����N��E���J�̸yL^�B{%)R�n% IS�iK�y3����)��R�����)�?rsʌ��)y	�j3�!�J��IKw��FRP�2����R�3�R�\nIx�Jf��D�Ja%/>	��H��)��Ĩ�_�)R�I�yL7R��K�JQi|R��)�%+XJ{�Ҕ�R���<��T\'�[�IR��6�9P$�JR�2�R�~��)R�o�Q%/���F�����%/:&�(�S�$�p��|�\'���o1���H��&)�\0]QR���%/ʘ�JV�%)|;vEJ�{Y���B�+�5m ��Ä��\'O�T�7�m�H0�����.�=�@�>H��o����L4w�L��i\r�`�������;Oޙ�=�\'�@��O��SN��,,�$�G�Q�.�_ ��(��N4�����cN�2���D骇%�\"�È�b��)�\0y\"�	����M4�Ja/JB\0��1)~T���SɄ��<�N 4��8h�-bA�&$�y&�S�t��RR�~)k�:O���*a9#�M����*g�	����F�I�S1k�5�˞�΄�s <$��y�7t�0~EX����%��g�g��B ��q����������[icx>z*2&{w������&Q��m�X?r>d*�{�d�*�\'�T��־��4���{��KO,��:�JRR�ܣ:�>~iR��R��R�3��wQJ|R�2��(�)%JeǙ씨Κ%)R�)��S�T�G� ڣ>ip�)��!E.{�Je>)L(��$�uH�2�T�RR>I��JuI+�yQI*C\"�!Fa<���8�JG)�4�>)R�\'�	���d�L�$=ڤ]�R�$��4�)�T��&���tiL��x=�AJ|8J��\"{�Q���Je�\\e<���)�FS�RR�)��6�~	Ʃ)_��8	�O4�PR��������)J��R�tM(��b|�|�Q/kH����)��2����fu`X�`1=�!_���\0}�[��7��ָ�k�C��l�η-�6����O�s�Y:5�c�i��ٲڍf%�B��nE�\0l\n��!1s�.=�O4��.}B��Ir�{�A:0@J�.?*4�Q$�u��)�)w�1(�y:�M�)��Z�pI0$�r�% �IK�~��M>\Z^=�%/:%�\0ӺR\'˺\n^#���{\'i)ny��-\nn�\0�J_���&\'B\Z�BJV�}�8$}�ѐ�{v�������҉�M�ܒ�t	j8��w!<v�EK�����D��Κr��JS��KN|tM\"�Je��D���!�SI���D�4������k�|S!��bt�߷�4���:�	)n�! �I����)�׸bSO	Χ�2�Yy�$ߑ ~r����dҒJ])M)JJ]<��Q�JRS$��FS�J^RM����/��R��I)�_�J�����.Й%2�IJTg�e����0T��R�T��TV��\"���d�M�	N).�>(V�QI�A15�z�Iihw2I��Y{�v��������C�\'x%�6�:���F�2|\n���SH�zp�S�C�\\l��a�~	��,��ah��f�i�S\r O�G�=��z���lxB3z�9�0ن��ڐ���U���U<�Ll!����c�i���y����ԉ ��%yWT���=��0z�e�_Q�\02u�J�ΥK��$j|\ni�+LHn�6u:_f� H��eT��L��.�S$����|��>�l�HR�-:$~������e)�*S)JTe R�2�����$�)��Te)СJfL&�|�b�)���v�{� x�l˪�u ��%��|�-�W[� ���\0h�X{&aV��>Gi&>&S�>����sn���V��s�o\r���s�փ�Dʢ|��@\\\'8�ĞI�昘?�N���2���#�KM���%o���J~�)s)��ʓ�����IK�:�&�4�T���RR��j�=�R\'_.�%pg�%ο��0�D$�u�ɤ�\0��Bg�7��	��>�rR�IJ�\Zr��3�!0wd�H�$��<$��S\0f{��;�\'o�ij\\��7��S~t�!A�) L����yO���S�� �Q��\"\"Sn��L���HW2�{%<wL��QR���2�;q�;�ۧ��@�=�J�H�;�&D�\Z�쒗�tO��4��3I�IL����i��xJa1��%3hJDG=�A��BpOt��\0�дN��_���!���ye�)M���JJe)JnSp\"Je)(��:���u~�v�R�����:��3�m��T	�\0z`�>(Ғo)��;6���\'B�>�[����e��iG�\"%�*.�4K�\0�b���>�� >�Is�$���c��\\�|U��=�	tr|VIq$��H�n�����\Z[���+3/���t�g���N�h.�?4�}�Zq�N��I+n���*\']�I��f[bL�e{\'.0���g_5&���D�����Q�%*H��x��)���R\Z��E�L��M��!1�IL�jߒyO�	�̦�)*��A�ȝ�qԙPF��}�������TZ�n���qq>\n���R�Pt��_8K����rj{Z�D<���~H<�N�`O⁈A���V32\Zӵ����n�{lq\Z��7���V��D�9JD�x��YW�#c6��ș��hc�e���{���\n�K��.�\'�4=�uЗ	Ӊ	�2��]ήE�-�][A$��|�l����4��F�]c��~�(��H������ߤ�O9�Z#w���\\�	�ݿ$���p�U6,�}�\'�i�W�2u���-\0�Y9�G�M\"<�IQ�;�w�L^ i�b���.O���Oy��p��\0].:�AL�@��1 �5�b�(��#���C�BEܤ�S���.���:�	%}6ςA��Q��;F�i)S�hLJG��n�%/�%!�	�$�[��\n;�B���rA2�W�	GޛD��%2\n �v�RS.`��2��D��߿))]��BF>i�`���⒗$�\'�y�|<��IK�By��E�~	ǊJT�u��M�]R�\'��J^L���\'��.:���)��2�w�DD�JJ\\<��n�P�d���\Zr�y\Z(k����y$�[��)<�O�@肩��!>�.��)��J���1�HM%#@��u/,��	I�TI\rL9�m`��rT����8KyC�k�\r��������@w�\"�SbIJJ��B�w>�;����\"��?�����G�4�{\0���gP�����5�(/ȵ�9�$��H�v��K[%�%UT��x@ѧ�f9�̙�GHK�p���R����=¬ܛ[ :\'C�TꛙEp\0.K϶x3���q�)\r$����%��\0I%)����Nx�)�):��� x$H�M�&�JQ)�tL5�1����R#I�ҍ5��(s=��}�\r�0%%,y)JR>E\"I�IK���RS�$�i?��&u	t$�O	p8�.~���B��KI���gT�����r�2xM)NN���Ф8I4k��DL��S�A� ��\'i��%/�S�� d��2����/q���(�Q�y�rJV�d�;���;(��ܑ�))!���dޡ纄�)H#���K�Jm���|�	�K ��O �P���RP%%S=AN wP��1>i)$�o�Q�%=�$�DLA����}���))�S�H����M?��$s��-��h��u��)�t�N|�Jbe%(�	\0�HLA����D�r����Z��4�8��&�G	��RR�#	��O\Zr����&�	��JJY�A쟶�$�ȏ4����9:|Tt�?&<RR�:<�Mܔ��%.��`yL4�$��x$�G!9���FJrxIJ\"|���������IJ��D��xNx1�%+����\"|;&\'�IK��w��\"|�Ĥ���RSǏ�D}�)RR%��S���\0j��䒟��\r���CN�;��UF���Iӷ���K��D;��(<�l[�e�j@w���\\�wj�2���h$�&	�}%\r��1<�)�M.e)�0Bv�C))S%.��R�% 5iO�SO�Je#�i�☘�%?w�JW�\"yLJG�$�ɘK�~	$��A�\ZӬ$RJ�v�Z�xO=������\0�\"G�#��%.<�)G~�x�H�JJQ�%2c�o?�BJdx����M��%2�e u�$�a?|�R�� L$8�S�%2�I0���ҁ⒗�)L|�M\"蒔I����1�vJRS)?����������Kw\0��!q�~)���\0��	)��;L;�L&I?�R&�7r�?rJ\\�1��\0h�\0�4��J\\q�)�q���ȥ:�xIJ�K��u2�uIJ$\r;zD�|$���^I)���5M0$��h|���k�	�B`t>=�\"JJ^F��o����R�x�*^c_ݣ�)����btIK�Zj|�{\'���1�D�\0�-F�)h%~�N�����\"�D�}SN�r%4��\'�I�y���R��]�	OޘvIL�o���S�I\n��	�ޔ�	%^)N�i�O	)��R�?��FOt��x%��&��R�|�p~0�{���K�M<\'Dx$�O�)䥺JS%*d�RM%9!%(�P�|S->\\|��>(%x4�}ɵ%!��IO���1��4x(������y�_A�G�昑�LO��S Bb<<Sk��\"D$���8H��	)r|S&\Z�D���JxLtH��wHĀ�iIK��SO)�BJe:&�K��)x�|9O�<�3��|w���	�IK���~*2uO�RR��yJ}ҚN�z$�d8M�̤��#�%2JS\Z&4꒩��#�|�J~tIJ$Bn�)����������a:�{��$��%��`Gt�rJT��:��\Z�t��R��=��M��JH\\B~��DAR�lq	)sϊq�P�5N%2� F��#��[�����$��p:;ȧ��5�M��JQ�O�������\0�%/�)D���S��J^>▚}�{�@�d��%.b\'�M�ΰ�ձ�1䒕����ғ?Ǐ4��������`t)%p|�4��~tEK�����JmA������R����R�H�>��/�#�R#XL㯂J\\HK�&HRR����H	4�N�%+�9 j��&<��R��S;�0G�%/��0H�J\\|�R�	�|\nC��r��%\"I�0?�JRR��LyK�J^`%)��GܒT�)$`�B�k	i	��򦔔����*$�2PR���&\n ��O&JT�4�&�i�tT�\0���$�JtLI��/�ǟ�I:�:�>)\ra%.tK^S8�\"R����S��$�q�C�?�{$O	&��	r%4�AJL��J$��=�L��~��\'_�1��w����8�� {%:$�O~���(�4JBJ^}߉KBuH&\Z��D��<|Sv�À�B~Ҙ�:JY�>)I2R�<�=�nRJ��J5��\'~T�?zHd9�����S�IJ�>I��&߲GH))t�u)N��Ԥ�|�SOn��%.\'�I���⑎�)]�JS��$8��)p��Hp�vIL�u�J`xL��))�H%<���nh?(J¨��~IB�َ�T����{&0F�����,ls�	�k׉��Y���;�@���Bv�l��ژ̟$�?4�`��������d�!G^|�鮩)CI	�BG3�IJ<��>^)�H�!$ǊJT�)h�Q�o.�)~�!�1���\\\0RR�;�\0���<�F��J^<�S��QR�� ̦�\nF#�%(x���S���?�@��H�S.ɹ?��)!N���d�9	%C�BG��vM����K�d�)%A!���K�J4�IKI�O�.Ħ������䔆�r��)]�ҝ?t�O�EJ�%�%�y��2���.���%-ܧ�L$��撗����KS�ZF�$����]SR=��M\n�}4��!>��Hj%%(� �uH�	�RR��H�%7�O=�J��4���`��w$%<&�\r쒔L$Op���K��IJ�S�LR�c��?��G�i%R�i)����ㄇ	vL�4����R�ZIKY���$(A\Z�u���\'O�$��^ɵ�)�	\nJ\\���\Z#撔;%�HH�䔮�\0��a�J		)CP���\r�2Gt�Ʉħ��)\Z���:k���0p#�P7\r#�D,$RL�lo�	� ��]<i�@˲���w ��u3��Bbޘ��˺W�ačS1�bv�.�D���I��%&�}uI�g�;�|�A���I r�� s��M�/a�p��?���Q�:����	�L�K�a��B�\ZB��88��BKLF�l<����\\	���I�\r�2�u��,�t��>\n;ۧ�� �����<�B|�N�%��|F�)���%6�C��h|yQu���!i)�_�\n#A�A�]����	󔸓�R��yLllJt�T��?zV���,6��(���\nV�\0��4<y\'$H3��*��y2V���)��J]��xJ�bS��C�\"ވ\\I���K����B�9)��BI)E)�.�=�2M:�L<RS.ڦ�r@�.{��)%�%,tiO�6��I%y��N�k���RR���0:\'<	)G���������#_��g�$Oޔ�����H�ѣ�8#�H����W&��Β�w]c���N4\0&N��IK;�����#���)o4��1H𒗔��4��NH�����O	�JT��	�T@�>IƇ���@���R��\"$�k%8���F��K�$����)�M:j��J\\$�>I�쐀u\'M;��L�;$�DƩLQBs$ϗ)\"�)��<(ɀ��>i)}$�d���9���t��@�LyO����;x)�Ot�6�S\"C!;IQ!`h �,�\'�- ���)nn�2��$�b��T8�p&��\n����Lk�>�,�� A*$��D۠☙h�(.��BM\0�5�SI\r��J���v��)���5H��>_�%.� x�\r`�8Qv���Iׄ��i��5 y��4{G���9:�I%~�0B��>I�\nHe<�&�A�<� ����)w:�)��*#X\'��?���������@����%RV��>�M��@�@�\0�ϊV��1y �bO�� ~hڸi��\n$k���N����$)���p���)~p�IKr�I��G�\\k��\0�><���:��`@�$��R�k!H�n��M�#�Nx1�d��>I�! \"F���2~��`��\0��C H�~\n^�چ����<�Q+l�� �tA�\'�;��V��(KM�{�0��m�O�SH�a#��6�pS��YN�HT&)�]�J�	��B�8))��@�/��R�����Sw�#撕:�H��䒗����	�e ����N�ĤGdچ�t=�S���N���1p��������pT?Ԥ4JtN;$�� �x�=�Dr��)\rw2��\n\nd|�fS����R�HΑ�DB*_i�ɠ\'�>i�T��<BE4��Dx��L��AJB`��A�J`$�����F�\'0�B*Z\n@p%6��o:���5��\"c��� H=�$�T��	�$y�DA���7((j�i��J}�\r>!�|BD��Jr������i&G\n2{|Sx�wN-H�颁�̏�\nd��[�B��\0��I��ࣻA�����7�Ip�\Z��?q\Z蘓���GX��J�D�?�H�\"TA�k�y�yvI4�#Ȅ����.��D�����Z;�ǁR &�$�4̂��\'�N>�#�7x�9IL^f��䓄�;\'����������)�\'䒙-1�Hj�����ǁ��RI<)�C��R�O�%�AKB\Z� ��@\0y��Уܧ\'II4���\0��&|�Ĥ�4�>I���Q\"\ZGt�ۢJ�[�#b���	��I�R�A ���R�D�)A��S~t�`�0tmY�$�d�A<%2e0�I��(��3�J{�)�1�* �g�)$Ǌ`xIT�a���S;�����*�h\'�8 �<5\n�JH��Z�>jNA5�0 �S��%$\"Z#�Tx�┘$j\"b{p��v� �9�f8��L��3�����JKp��Ah��H\Zꍭ��!|�����`���p�ӏ��䣿�I���+EC�S�;&/�=��J�Es�-Sod��5�%i�% � �:J�=Ѵ-o� #�$@Kt�R���d����� $����w�d�O�{�q�~H �{����䘃�m6ֹ��42�Ú�)T��!M�9�I��5�f�:~P��v��I��������p��$�o��������捄Qe���Q.���\0���	��)J{$��j����y���Jd�&TĒ��\0x����m��\0R��p)#�����4ƾ)G=�N�%.u�����c\0�`���ɢ\'�Q5�3��P�I��腮%.�uL���\'�M\0��\0�����	�.w:Dxj��P���\'��Jh���`u�L\\e�Ȟ�zpy�P<y�:BJ�Z��&�\'�AɧV�$�_M<�LN��.��ܔ�JSĦ��RR�H�)�Q�9�$��:����Ө	�:v)%C�O��(��%S\"I?�����R)\"��Ʃ&{�\0ґ>�撗�ALL~	�]�3���J_�g]O� �Ox	����$�LBZj��I��T	��y�&o#����JW�)v���Ñ撗Br�1�G	!%/:|�oq4@����u>Z\'�n���@��	-�xEK�=�M\0˔F���1��I�1	�Hi	�a��x�I�\\����!L��$����G���@�O&O�D�YШ��G2� ��8h��y�Ha1�Ä�H)*�8�|SDw�M<�&g�$R�}$�HH�������p�H?RU.�h#�82c�	�JD�	!w�r{(�ǚB`��K̀�t(�\rz�k�Ғ����<��ⓠ��3�1�%2H����8�O.TD��I\0/���:��	����\'_�%(��\n[��{��!D�!%RAa�>:\'!�F�zq��@H^�cRuKx�p�\0x$L�⍣�?���3�a.�Rw\'�)��\0�G1q��<�#�\0x��������pD(w�\Z�GPE$���\"��~D�C?P�O�G�t�����G왶�!y�зi	LH썔p���\0�\\\"OWH�#�c���V��liK���@�=�n�|�*�\r�sd��#p1�\n���S����%�U�θ�8�G�:	�T1��Td�~(YH�K�\"x:&�c���\'D����IO�Ǖ�;�)&�L��Ǆ�IJ���H�]GÄ��Ц?K�t��$��	�)c�7��O�D�	��JP2\nn��i�Rp�$��d��(�R�wH}\"�\Zh�0Ԑ�̧b}�%s�%�x��Q\Z	IJ�t���>i)rtH̏�d�>%.Ӥ�Jo��Nt����_��LN�$�\"eҔ�M:�$R����9�L��vHs�Hʗr�T�\"d�L&g��%/:���\'�|��I�4�)w�\rru��L�RE.@Me9:��	���<Ʉ���~s���|F���S̀|4))fF�$L�fS	k�~]#䒕����:|�R�A�%+Rw�Ju�\n ���!��Eä�T�\0��&S� �T��D�yLD8G&�qS�ڶ[��u?�F#���HXȐ��~	Πx�����Ib\n}�)D\r� <RV�����o~�C9�x��HӺ^	*����s?wo���*@�ޒ��pH��Py��3�	\"��Q2R\'�L�li���4V�w�H�	䔠n��\"b\nJPѦ�p�	�X<&��:$����A쟝t�G\Z$�������Τ�$�O�GQ�]%��.���@�LfOÔ��1��$��w�Hy�k�O~�a$S!��Jt�DȀ|ӂ%%S):y��*�|�\'��L���k�:ǀJ�S>>I�\0�d:�\Z����	���i%�$m�HLN�E.�:��vH�g�D�ǒB	EJ2[)�2�#�8#� ����;�NtLuo�)T�O�P�]�)G�;$�>)v)D���\'TǏ�Z�))@�JI7��	)wvN���I�h���l�H�&2D�i쒩s��.�����iԤ�Js��#D�BJW��grq�D�?���E7�K��o)\re3>�HGd���RLyIL�p�9L�RR��%>�\0��3�R%=�)����ؤ%#�c��%.\'�\\����J\\&ܒ��{��5�Hr�|{���$���ܜ�N�wR��ID-!I�;U)!�%*D��8���븕&�L�RQ_p������m)���$�1.��@>I��S\0%%.����:k�S��G	@#�IJ�\0�Ǆ�\0#��N~A$2\r�9!\'yr9LӤ�a;uϔ���R�4* I\'�e \0ߺ6��Oo�D�e0L|�& ��/�t�D��� ܛ�J�s�Q �v���V�p�ĥ��;�	�D�$�ݬ�u�u/�P�#�$�ϙ��Q\'˔�Ф�%,I�!;�B���n�$�S\0��I�\0���A�Hg>?��|8NI\"\Z$�Ď{r�y�=�B����IT�\0���^A�\"�B�K�]�����4�3O���Ò��)�F���G���\"!%,�B\\~	D�H��R��y��<����f�=�S\"`��`R@�R�H��.�~in�Lm?����\"��j�w\"|�Y��8��%�:5�\'D���&���t��>�^�)n�|�+E2䦎c� }���DOtT�$��v�O�n��L�)A.ЊU��	pd&3��IK�H��%0|�\nP����Ή��(�Qq�?(%ru	�|��>(�~җ�t�G�L��gt$�{/:����<jRB�!��7�J\\��7t�2��!G�9�L8�%�S�a�pR�S���3e#��WUwI7�/��RR��@~�$��=<RRǒ�i�GRS�I+��\'&\'�����M���\nS�IK���<����RQ|ӞTeK�BJ\\~i��	���%2�S��o$����Pw㔁�(#_$��<)Ip��S\r�8NѬ����GB@Mp����.����p���#�&IK]�x��x?RS.<�	ˡ� KOp\n����$.\"~��-v�Y�\n}���NO��(�[\0jDy)	uIVXcT��^����Q��qӷ���$G�J�M:\'h�!E���L�[�w�lA�SrJwX<We?V�]�GP!)����:�$��!0�c��R<�S\'ܛo=:p��J�I4\Z��Q�bIi\n0H�$����Ƅ���;�2�`.��dO�L�c�M\"o�(T��	�uj��.�\0���y���Bg	#�]z���&n��xJ�ߺJ�薳�uO��\r �$���*C��K��\rR��y�4��M:BruIK5��Nt��i���IT˰�Ā?*nI	ƾԐ�L�S�k�P]{$O�$�B�wH?���&�!��J���%Fu�C���Si���ƙi�\\{F�x���QB��ܗ�O�\"Ao� }�$��\Z��C�D���I*�4�!����$$������?8�J��L��4�<�U21<&��:�IG�?��#�I�JIX�Ȑ�Na4�RR����I�����)4h��p`\"��58�.��$���\090�-w���)~jbtO�y���\'��{J���&A))�ԧ<&\0�ԛ��$�쟘�M�IJ�R���I�����ҥ�TBy�B�����J\\�))q�S@�Nxw��{@�IK4�T��;(�蒙����4�)ήڒ)r>�2��(��IJ8JIĦ\'��߄���+�/�;��h�Lħk��IU�F\r��YLci�C�S8�\nnZ��$WVoi#���&	x	�fH0[#�HI)v�|�ԃ��yP$���yJ ��A(v�uM\0��@<�O��E+f�$h�	tvL[<$�{��1�����);�Ȯ�t�-�ߜBwD���4HyN����%/��� g�	���撙$�S�D�Ri�����SpG`����$Ġ�������o��]���H�(��S����7�\0�G��\'�$�\r��G�R?D�EEgp�N�����WEN�4��R�O�K������viw3�	�o��uO2e.Ğ醩%����8�݆�&dy�xI�\'�0v����&<ϒJ��*F$(�)\re%�D\'�9Q\Z�ҝBJ�_E��O�ᢉ\'��Hr<�AY�Q�N	\Z&���8O�䒋)����B���M�~�),�&>!D>IH#�J�L�)�Ȅ��%7�$�ɼ4�9<��>I�\"�:H��:�)3������䆲�&��I+���7d�T���H�S�IK>jC��JM�)$��\0\'�TJH�D�	;HLt%2��G�R(�uIA����@��Ro $���)M�O=�B��S��$�POu��\"R?J�Q.!%.8��2�$�����Nѧ�M�g�\"����~l�)%2��I\n���S�G�b ��\'R��5�#�I����n�9�~��xr�	D��;I�R�J����%Z���f����IJ<��)���N��ș�9H	�t	��������l>�T�ߡ�(��r�{�JH�F[-��������]ӑNgD��6�|��\n&	i)\'N))�$7��cv���>)\"�k�s�b4�O*,:�S�5\Z��J�Y�3ⓤ���&���O*$I�B*����;��<���1�\Z����T�Ĩ�j��\nJ곆���\'�1�\'�%+�R\Z�;[��xLDIO����$�2�O�H�x���b>�)�$�ޜ���ɑ	\'�\'�P�T���n�yIP7|Bwi	���m�$��!0�� ��1>�IL�:&H��iLR�)�	$�g����$�SS��DP�����)O��m	)f�ҥ�TX \')(�2G�������\'�>�RQXG�uT�RQXvNgp���-&RS)����R�H�/��)	LL�%/:���%G��	��JdӢmЙ�_�N�Z���>)N�Ǐ�r=��$�\\:���Qwr�O╢��:&����u�QR��M�S��⊗\Z��~Jc��HXRf�e(���|�J�P�B�t�xIAww�	��)yIݓ�����7�)0\n}�0��:�:����1쒗E&$�x\0(�S\"�M��NN�hR�Q�H���m{j���JX�&�g�&oة�?�%��4���B��R@\\���	:#O�%$���M�S��\n#�����)�ɓ�P�u���NRЙ	�RR�5�O	�R����LОS� ���T�=�bw�&|�IJ��}�H.�$5!$輘R.�<Tx��\'Ȥ�N ��I��\'�����78I2l�A��3ZH�[���Ǒ�II�wb�ݺ����L�k�NRQ\Z$��)hN��A��%���)���~E3�fG\n#�k��~	+e�3�Pw?)��@��B�Ɖ�t��\'��O��z2_%�?$�uH�$�����N{����-�sʹQ`#�R�|��))gwO��%�t��%:��8�<��&8Ȕ�tIJi�J��\'�;{&	%�:y��&�$D8|B���2�	)S��9�3��\'jJ쯒q�QN\'T��y�\"xH�C%.�T�7�4t\'�c�B����29R��J*>	h\'τ�ڢO�$�@��>P�$;	L?���L�I�H>j.���,�N43�up���)(�ߤS��r�椢ǲ���Q�*Dv�%��?����i��%%te!;O��;C槤���L��wh�`�T��<�We�D�\0z�O�\ns�ĕK��n��*c��HL�Lڨ����~)F���\r�� c�6�\"��)���Ѭ��H�	)p�5\"F�\0\'�h��gp	�#��I��s�C04�����c�������h�h�RR�Jg�4��\0L�u��%uP�0RiH��IK�wǔ�{x��������r��)�$��\rAjDk��7t�k�pGm\Z�r�Ä�%-�{&#@|ә\0y�@!%+���B��\Zy$8Ig)��R\ZO�!�RI[��?��h<�쒕Y��ޓ~��\'��H�TN�\Zx�ə�);��JSF��N���\n3�I]��ϚFt������>�1\"���)��x$�ùKp�&�������[�3�N	�4�	�f|�H H�)�tR3\Zw�\0��Ot� j�)N��׺g:��r7D\rB�d���N�R���\'4 �TZ�E ��\0����䝧��g7R@�M�O��m7�r`|Rp���D$�4��/��r��))i�x�ja |���A[�(H�>I8Hӷd�ًF�xS0H*2x�9��)`��\"��\0�J*sx):��D��%*\0)x&���%3��� |RR���\'s~���>	)iSς�p�ߠJAE_��#�K����4�HԨ�Ro�2�������!\'d�t��#�.�訁=�� �;�?K�JtIL;��L��B<��@���V<\'�\'\r@�$4�J赚4wI�h�3�\0s���%�]K��OI��8	�<�Jdk��?#E�pe,>��O:Jg���Hj��@�ԉ�(�@�*P`�JbҜ�\'�@i>|\'��H$��>!&�L�������;��rS\"<T\\�t��JV�dOd���a�ʝ�ǒ6�:a!��O�{��tQj\'D�q����ܑ&5�Jc��S\ru�JJ\\>I�����J���)ȟ�QwaF!(!.\0Nu�nHO�ɀ;��.�%/$H�)���\'lIT�\'���~	4�}R�R�\0�I��$̔Ѭ�WE䨴�f�qN>��������S:ǂ��_zJ��L\'2F��)(2�H�ԇ))M����)���`��<�ZOt��	7褥\0`ە/��D{G*_��H,1�R�j�\0�L�)$�>�NA�y&�$��RB�\r9�`�;��}�mH:�H+8���rt�\0I1�\'~�IJ$�7k��ބ���!6�IUiA@��#�I��I�������\\�u�u�r`��H�$x���YѶB`L�pG	����@\"G�DJq�m)67�J�N�9Q����$�Hv�;yQ�\Z<�(�����H�\'��I\'���H�):$&�I�Gdǔ�@��~))C�>��4�@��IE���C�\'p������\\�4πG�CPRi��J�[*L\0�T5J�Q;}X�Ske�ǒ�o4BF�4��T�Ou#�g� t����c�3&5��Z*�zr�UtdD��wJ}�4�O��i��\0rHY݈Rk�P���$���t�y��|�/�	)�w����)�Ҙq�I]�f��ܙ���L\rt�uP�jo�(n��������Rl��3����{��o\Z}�:�b��p�UtYڑ�*�?�(���*#��$�Q�pA!#��Gt����3��g�J(\\L$�	���#�yܒ��i�J��y�H�!%3a�J�v�4@H�A�����?*���$j�����A���:��1�)Zi[ww�\'Ô�&%(0QB����I(�4S�\r�p$x\'���yI�L���11	���Uj�\0�t������%/g�G��HM<~D��x�RiM�Dw�&�Q�@{�$���Jy?ܒ��	���I�{HJ8IJ�a3��O��H�Jd����H���A.B�2�풒�#?/u=�<Ӵ��Q�q쒇Uv#�;@B`uKPc�RS&�H�\0��}ȓO)� k�%2g�H��(���>I*�TOޞJCP����$�4���Ǐ���0��k�%x���|�\'\ZT[3�w��]���):ʋd��8!$?���_��S�cq�L����hx,�)�2��L�wBJd��0П�A�<;��%u\\\ru?�LgzpcNR|~	+���Jf��\0�t�t`D�x�LyNH�RWe�\"4L�\nA�%�~h��Q�$9I�~	�;��@L�[�NґПRB����4�-	���=�꒻,��9��FtRhݬ�I\\��@������R��Z��>�[	��		�T��	�a$��(%��Q\0�S�A\'��	E<��m�<�q���S$w#����)��Rp@�\'�%[���>����J��R��S����<��E�0@�:	zx��c�J]�<y�9uL���N���vK��,�i\'�<\Z��G�E��uWFn�|8L�	HT��I,dT\\���G�Oo�ʊ��t��\"4O G���X�K��4��(e�5 =���%Z�@K�3�Pcࣿ��Vȓ\0�D׹JH��S�JX�L\'�0��JM\ZL�撔?\"w\\?G�NI��K&�d���GrD������C��s(�jJN:��Z+VG�(IFF�M=�J���L�>\nN�d��x1�L`A�B~D�Q�DT7���u�)F�wLRC!�T&e }�s�$����9�&3�}SIwp�$����)TN�+�k�C�%�	pJIP�����)k���ILH-���s�6���\0�)(�x��jOb�۠�*S��%tы5R<�4��%;���A�i�\'!�Hs�	%C�8Hi�;��vH���H����>GT�\0�D����y�4�;&#PXI������wb��\0��:�%.�g�%�|G�K]�}ɚ��S����s�<�g	�Ʉˡh)�FR�&�����%w_v�$�*.\Z�$��R��j��\nCB\'�D��RP�M��\Z��6�Ш8�$����EB>��9NAQ\'�B�@��0�✝<�WU���{��蝢5=�B�O�gH&8	I#�$�%)�I)��*-���)`�T��;&\">	7S$��#��\0�t*m#�ײH#E�xvQ�\'��rA	��E�;��0�>i��;f�	\\���4���O�Iײ���%@���)�L&�H�&�D��f	M��:�1� ���m<�QGu� ��Nd�q��i%�i�葐�){��q��������Nt)�#^݊I]��S��N[����BH\Z�o��8�ܕ)��E�L��ٗ�|҈13<�F����))��H��4�����)pJgN�{\'����5���)i�5�YRt��0�\rOf�抺���CN\ZT]�܁H�ȝ\'ò�o�?:q	������5��D���8I,���x�)���H�Њ;1�Nt�9d\0F�O�AL�kL��L\'�\Z9O`л�EX�l�NϢJh�|S�BJ;$1�\0y����&�#��d�\0$�\r)�;\'�\'t�{J*�E5�9�F�Fu�>�&ޒ�`7��ڑ�M_����C�)�MRi)puNҘ�\Zk�J+�Ny�k-���T���O�0�IڰاG�H��9��L�\no��I,�m���0>�Ri�$V��t>i��Z�I5���	���L~��&������\'\Z�a!���y�8�Q��5Ju���*��\'�!�\'�]�R�7�q�	���t%%te:�~	����Ǒ��3�	!���H�|�gXYI.���s�)K�}��I���`j��BI+����J�?��J.Ï�y��|BI)�D��A=ƫ!$T�!��*h�!d$��vv��3yX�$���Ȅ�@=�2I)�n�)�o%��I.�>�*��i��I#�@ػ;@��S�X�\"�i�]�)V�~b���ZvGwL\0\rV:I%�i��\"D���V*I#�����p*Ih�uvɃ��p���E�t����i\\��S�M\ZH�[��p�����EG`����I������C�;��I%;d�H��H{J�I;G�����Itv�3U!��Xi$�l���I�Y��Ivv��i�L��F�b����|\rJ}6���I;mh\'�B5��X� W��󪑈�HX�$���9c$�T]��\'q_��]�v��\n[e�r��I=;�{|�\n�I�n���Y�	$z ����?�$w�s�\"-��G�HA�+\r$����5�1HXI\"�wY��J�I%;��u���I%�����@�I!ވ\n#�8Xi$����)�`�XI$����R`��j�RI]�=�	7Q�RI]>��ut�	��a���W}��ޢ�|�I+��È�\n�I$;�C��T΋�I%��G��J�I$���','jmi'),('jmi','222','kedar','','kumar','adm','','aligrah','UP',NULL,'India','','',NULL,'','kedar9002@gmail.com','','53463463','',NULL,'����\0JFIF\0\0`\0`\0\0��\rPhotoshop 3.0\08BIM�\nResolution\0\0\0\0\0`\0\0\0\0\0`\0\0\0\08BIM\rFX Global Lighting Angle\0\0\0\0\0\0\0x8BIMFX Global Altitude\0\0\0\0\0\0\08BIM�Print Flags\0\0\0	\0\0\0\0\0\0\0\0\08BIM\nCopyright Flag\0\0\0\0\0\08BIM\'Japanese Print Flags\0\0\0\0\n\0\0\0\0\0\0\0\08BIM�Color Halftone Settings\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0���\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIM�Color Transfer Settings\0\0\0p\0\0�����������������������\0\0\0\0�����������������������\0\0\0\0�����������������������\0\0\0\0�����������������������\0\08BIMGuides\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\rURL overrides\0\0\0\0\0\0\08BIM\ZSlices\0\0\0\0u\0\0\0\0\0\0\0\0\0\0\0\0\0X\0\0 \0\0\0\n\0U\0n\0t\0i\0t\0l\0e\0d\0-\02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\08BIMICC Untagged Flag\0\0\0\08BIMLayer ID Generator Base\0\0\0\0\0\08BIMNew Windows Thumbnail\0\0	o\0\0\0\0\0\0p\0\0\0T\0\0P\0\0n@\0\0	S\0\0����\0JFIF\0\0H\0H\0\0��\0Adobe\0d�\0\0\0��\0�\0			\n\r\r\r��\0\0T\0p\"\0��\0\0��?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r��C%�S���cs5���&D�TdE£t6�U�e���u��F\'���������������Vfv��������7GWgw��������\05\0!1AQaq\"2����B#�R��3$b�r��CScs4�%���&5��D�T�dEU6te����u��F���������������Vfv��������\'7GWgw�������\0\0\0?\0�ej�l�1��\\�<�c���1�+B`���E����pW��ʬ��9�m;I����;��������.�f�1��5�߂F�Q��1⥵%�\Zޖ�F��ꜵ%Ph��S\n����H�\0�\Z8�mlh[Z�cUK[)�LY\"���U�bб���N�j��У�]�e�%�tz�������!��I#h<ο�[�|�9X,{\\������5R/Xqlo��Z�_XNNSK�m6�Y�1�k/�>��g�Z����xxc��i�>_��Z��q[�[�������S*�O��eN,{xp즏\rG@��<f�o���w�B+j6:\Z5\"u��Γ��~��>�D���NեM�\ru�{���tђBUa��Zu��=�����i �Ǹ5����ñ�!�uTeu��B�I�5Ў�V�����DQثX��\0�B~��i�-����5[��V�t�6����5V����w����g]\"\0#��?�O��}?N;n���&{����l���k<�T������R���k�\\��gI-]-y-� ���G�u\rˠ���\Z��,9�Gc����PعT�eb�mW~����\"D��6��k_�u7�_[���Й��j��in=��$���L\r������̖1�e�A�?KE.I!��t1�A\ZQ��zwfQSl`�5�兇�bw~����L����kk2�\rDz��w��#�����Dlk����}��l��;�R}U^,k�u�u[��G9�k?7�1Q�����V)z@&�7�?ˁlܒ�G9����0Ȃ�~g���fMv���S8F��\0%��M�����meہ\"Ax�G}�n�ҿ��V���1�D6גF�$@��~r����׻?��|����EM�s�%����g\\_ƾAf`�[��^����;�=��o��$�\"hY����\no/�^y��ϗ�w�W�(x�2H������fq�79��WQˬ@yp��u|����?ڪT�=D>=�8�0{p��\0t�\r�a�2�{�=�o r����Q^����L<��3G�<��f?�O��/Xl��5�#�@%�\Z�,�� \0ƿ�YS\Z�3.?�֠��Շ$e��䲑�G��\0�c��His\'�cQ�\0�%���g���D�VE����� g@�k?5y�\0����C:���\0ſg�zړ>�u�A�%ׁ��C��ZY�\0M3����o�֬>1���,r�ꉗ�Qz�\\�^Hv�u����?���Ma�k.�>K�����j�w��}�0�\0H��:��k�%�tmV1���-��g�����:�\'���fc�ݸ\r�N�-�?���<��#��}����8\0ݩ��Q?!�/��]�҂�Y�/�?�c�=�x�Z2�/����Ӱ�Mg���7��\0<�}c��p�u�\'�8�����x��/�c�0Q��<	��*��㆟������ ����_�~��r�n_�\0?�����⏍��u�\r{�0Q��\r{���\0e		p�����a�����a��`�g�1��%�>���6;�\0$�]�ѹ۞t1��\0�nP���%�5�M�D�?kU@rqW�?���\0\'���������tΘ���Ǽ��\0`����qV�v�q�U˻e\\���O���!˃C(�B(���G~i�\08��\n%��^�(���\0����~��\08�L_�?�B�yӿ��<�∾�~�����������>�g���%������w�i^\n���I���o��ߣ�Gǝ�t�Ly�Ԓ���ܿ��ꏩ���n��1�����O�.ۿ|���?�\\�J���o�Cc��m���\0]���x1*��7�b?9b$�Cg3���Ϳ�~�ӎ���$���\0/��3\Z(�%��,R��\08BIM!\ZVersion compatibility info\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \06\0.\00\0\0\0\08BIMJPEG Quality\0\0\0\0\0\0\0\0\0��\0Adobe\0d\0\0\0\0��\0�\0\n\n\n\n\n\r\n\n\r\"\"��\0X \0��\0\0d���\0\0\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\0s\0!1AQa\"q�2���B#�R��3b�$r��%C4S���cs�5D\'���6Tdt���&�	\n��EF��V�U(\Z�������eu��������fv��������7GWgw��������8HXhx��������)9IYiy��������*:JZjz��������\0m\0!1AQa\"q��2������#BRbr�3$4C��S%�c��s�5�D�T�	\n&6E\Z\'dtU7��()��󄔤�����eu��������FVfv��������GWgw��������8HXhx��������9IYiy��������*:JZjz����������\0\0\0?\0�|�:ݻt?����Wt߶l/zB�<qd���Zإ��o�;*�^��Kj(OlUx�z���!�mӦ�S]��g\nB��Z�>8/����*)�Mpj�7�F�T���/�H�s��\nKj;�N�U�{x퀥�����⫀?wlJ��\0k�\\F�p%�{S�CT��7N#�]N��\'l6������sC�b02^*(+_�]N���Z\"����!�lGa�u��\0t����m��a�\\AP�q���q\0֣j�\r��\0����:W�����\n}���D쭎�׷�^��K���]6�1V�oC�c�B����0���z����ȥw�������K�\rw��n��j\n��֘9�v�����v�{\Z�i�P���;chXT���ú�{\r����h6������aC_�B�;���\0X�d���a���()��\n��\n��i�#�A���\rq���#�\roS�6�66#�c��o����w\Z\n\r���&�۩:xV����j\n�����T��LwCt�O\Z��-q~��`%i�Z\nv�:m���������?��kn��\0?%J��߫���\'$��\0��\0�\0*Z ������Ǯ*�H��lB��x\rώ\ZASm���9�%a�]p��^�wl%����~,V�*+�{���xchZ{�x\\7�\n��P�P�ъ�_����;|�+T��)i���\0T����w�X�}��b��ЊP�?�gS�u\r6�\0?��~���⭁��LU��N�ݶ)p�0*���$����i�*��\\JW�n�)�p%wm��b���W����;b�x=�C���\0H^+JP�0٪��ZW���U~�\0�#L��w�6�.zҿ�\"\'}�z�aB῎)p�ڵ-W\0:�!-ӭ�=���E>��@_~���A�1%i�\nҝzaV��O���{����}����\n\Z�8��oJw�����oS���Z����WPS�����4E��>a��wq���i���jS�	\n�+��0��B+ӷ�-КB�۠�p%�çJd�1����V���FlPn���\"����jcJ�v�Pq>il\r���4�\r�Z��S��ڴE�p*�:�_�$�R�~���6�����­���\Z#�v����)���i�>_,��b]�~=��m�v<���z{�m򯇶E47=(|G��֛�~���`��(6���q	��ߦ�8[�zS������>�U��������Z ��^���(zn|p��u�ʽ��Z5#�ݾ+\Z�bUev���8y1-S���߁H���aCT����X��ӽ<k�;c�\rR�x�x튵C�W\n�MO|z�Y�������-\"���i��6��Hh����_�->�\0]��ZG_�p��\0�z��P��l*��LM��8�[�{�P��|��}�qE- �\\\n�\0�ъ���l��:�����ס�[��׶4��44­�é�l\n�n7=<p�v��\0=��\n�*F�{�Kj7�@`+�����k�����w�G������������~�di����ۮ6�*���d÷�d����Ȗap�6�:�Y7��ڞ�Aڽz}8�l��{b��={����o¸�[��\0��. Q�rAZo�iZ�������*�}�6\'�ĕ^�\r����\\2]Б�t��.�7�^�� \n��(q�?����Zx�OՅi�R����V��\0�\r��{`�K�}�<=��\rR��_�1�.��u5�p�i�+Q�J�*�	�����V���$��������C��0uV�ݾ7in��O�z��%����LU�R��4�\nn:b6V�����-�����;�����kt�x���-���5UƇ�L,Vڴ�O��\n�<p�w�\0v*�o_�}񵦩Z����|�߽v\'\0ث�F�k���åi���7OǦE+�H��U�q@}�Zh�\'��iq��!�1K[�NۜPV��v8�i=ȭ�lB\n�N��|y!a���$6Bړ�(q����ݻt\ZU��s_�0+D�$)�O����i�^��b����8��w�߅H�)��h[�o���OPz��:��5�+�\Z߯�*�b��m��\\h?�ӊ�����\\Ui���8X�k���ҋ�5��t�A�[�G���4ة��{b�خ�M�V![V)]�_���W�݅-���a��[��U��N������	]CPh	���o��vHTQ���l���OM�#0�����\03�AT\Zu=��O�����Yk���;�-�����;�*�Pi�ծ%!�����`�6+�m�4��|p$4���(\\v>����[J\Zu��aV鷾\\ؕ]]���E���0�Hh���b���j���S\n\n�8�T��b�����m�0�\Z\"�O��]J��W�8\r�\0]0n��v$P���ң�=�rV���8J��0��qCt~�1(��J��eN�z���ӥ>���īb����2lvޕ�~�Һ��?v*�6}؅h��5�;�­��J��������\0��\0=��i�?��d���Gˮ!�j��;S�*�6�I�[�Um;��8\0:A�v�Z�M�i�w造P�\0���l�M���1Z]�Z�ci��#�;x�WR�\\��z�=+MP���B�A�~�6���i����bVJ���q�Z�y���Ů��\0?�P���Հ��$�}�4����,4���i��ϖI�XG݂���/�vĭ5����n�8��;�߾!m>��G4,#����\r!�����}��.ߧ���ڭ�n���E-�Ew�8�hh�zw�q�+θ��<M)�5�^�?�ӌS��f������\0�5��%\\F�1*�p+t;�8R�C��b���o��R���}�+`~@�����\0:�R�;u�J����\0�®u���X/]��������Yi��￿A���E4��>����t� Y�AB7�J��!�U��Ĕ�t$m�t9���5�=���*w���[��\0=��*�\0�N�cv�\0~C(-{��dB���>y;C�M)ۯӑK`m���U�0%��.�vۦ��v�-��\ZR�JҔ��������[C�R��q�+dx��\rR���o���<w=)�\r�\'��C�V�w��K���\\F*��5��\Z\0|��ī��V�Q^��p%��jv���հ<;���K_1��b��j|0Z���t<0�iSpRz��`�۹�u�- ��@8ڴ�a���\ZN�$Ů#��|Z ���p���zҧ�Wq���������Q���aH4;��;n�ޣ�����qJ���\0���V���-i�B<{��\0\n�6�\rq��Wm�����i���?�bV�Ǿ6�h�iЏ�b�ABg!�v���­P��{�kN�6����)X���v�$�ZkPG�m�\n��jx}8X�=<O���\r\Z�+\r@����B�O��M�߶(+OAZ1bZ+M��0�o��]�&�@���d-`kOG5h���(Z|O��P���bB\Z o���P�����iBz�PV������ԍ^�3w��_���;�SK�N�o㊷�퍥�	����+�|B[鄤.���6��p��O	u>G��\0����?���Qֻ��V��������)\\)_�bYQ�)��JB�Om��X`VS]�{�m�����М�T^÷]���]ƻ���#i�����\0[�|h+N��!�;�נ��-��W�늶\0$�{�y�T�ޝ0���}?~4��@�L!�G����y%x{JW�~�K]?�*�ա��aC��1	n��4�\r�����j�t�q�\n�؏�0�Aj���8��GC��\\zu��J���O���A�����B�lE6���H-���t��O�L����_�L!Z����M�����W�`z{튻k��\0��\n��;�;{��KU=O_�\\AE5ē^ö��W�P����([M�?!��%ާ��n�� o��JF����+MR�W��p�:������&��n���;�u=)��)�\0Soo�\nӈs��w�����\\P�+�ت�O\\m(}�)�l�!o���b������S��O�֚�zv�`�6\0�8�U�zW����\0k%H[�;���\Zb�������p:}ie:S���IZ�r{��P��������8��N�*��{����)Ӯ4��+�}�QK7�Ū���kM�ӵ?�\n���(Zÿ�4�����|P�\0�Ս�|�2��6~x�W�ceW��$�N�~���%lm���\n��u�i���+�+�v´�:��2)���l��܎�V����,�v��N �p44�LR�+P7����2\n�k�Ĳ\n�J{�UR��2%�VN������Y�7�0rJ�=��}�%�<|*���o�V��q��P���4�#�N4�XP���2Hp�nء�m�)\\+P<z|�҅�۾�\"��>c��}�h��p���AZb�xT�u;�B��G�1\nZ �o�kzli֔���V�Ӧ\ZC���wQ���8-.���V��\0]�8}�\n�\r�킒�֞����}}��K��zm�-ҟ�\ZC��U��l=:����Iw�����΃�`O^��a�XAޞ#-#��)�(h��6����(p�\0?�ӄ+U���C�`�[Ƃ���\\7Hl/^#�р�W�O\\BKt���$�\\Gz�߾�-[=w�}��m���]�P{����� P�w�!im)Zlk��\ZAX�Z������\\��i;|���1AZA�:T�p���o\Z\r���!o~�#����$��M�ZF�nq�Pѭ~u���_mo��\\,V7O�p���sZ₴�\0\\(Y���bŢk_U���<����Z@�w\n�]O�z�R�v�w�KD��ʘ�#��\Z�q*�z���\n\Z�o�S]G��-#��֎���Nٔ��L(�n+O��aV��*�>�߷݅-����\n[��z㲮��T��O�)l�ڸUp�*W\\+�zS�n�c�z���i���QA��b��?�TZ��l����\\K UV��*���dU>;W�;�\n�:��\\�b�ө=;��D�ڧJ�װ��ƒ���V�x\\�>;m��R�ol!\rP\Z�m�Z=)�w8�)��M��4�q��{aB�7��\\=����ۿl�\rkC�d��,	l�1�;����������). �CD�o�\n�\n���7j�����sW\ZI�E>X�u=��\0wV��_L>�uz�\n)~��[۠���]N�~�\0�$����LRء�؄;�M��Jv�_U�Q^�����iZ�O��1V����B���8�J����h��G\\6�k~�8��S�LP���Uv��m�\\>��?V��׿��獦�#j���$�Dnw߷���o�s��Cev;��+MOo���зzq||1(Xԭk��X�j�\'s��bJ\Z?�z�9+ꆺ���%i��>4�\0?�,aS^��J������N �*{�ҿ/�Bߗ���7H+H���Ⅶ���#-���abV��1Ak�������h[���zaZu\rO��`V�M���0+T�2H������4I�<1+~g������CT��,P��=�R���\0^4G�݊����/�׎��n:�K��}��t7N�;�+K��]�6�\0olo��Ӷ�§��n�W�˶�c�={{a��ԥEw?�)v�܁��Z^\0���i�­�zmLJ[��t��\0T�?	\\(:O�l*��)^�zl~[ᴪ�ڧ��r¢Ҵ���ْ�����\"[��k���\"�Qh6�=�%�ׯ�*�:��qV�=z��aWW�P��߯�|(h��?�W\Z��_�5w��U������JWt���#�犵Ɣ�Km��o�|����A>�\"�|�N�kn���%j�P7��\'em��؏Ƕ%]B+�W犵�卫�O��8U�<~g劶+�炕�J�;��Z�G��v�n��| !���ڸ����p�h���U�:��KD1��%G����[ק^��p��7���%\r�����!o�m^��h�ԧ�Zp�(��@h0��6�78������V�;�ҵOm�!]�u��{�\04�ܜ�����O��P��ZW$���M�=;�2V���lk�1��j־26��ۦ�[�)�t�\0=��E5Rzu��\n\n�׾�𐅄�lJ\Z ����I�, ��8�oa�����g5LZ�hi��TŪ^��L-P���ĕh����%ѦZۍ�(Z}���SG~�Ք-�4�,���ߊ\Z��ߥpZ)�����V%Z�Ӷ(-�ۮ*�\0�Ў�	�:ẃ �|-��A�E8�)��\r�k�c���^~��l\r���4�x�\0��m@�V����H\\>��\0M7O}��ø\'������鍥wJS��ձ���V�?G��%�|{~8�}\0���M.^��]��7ՐV����rf��N��)\n��\"Y�e;m�d������;\\P��Uԯm���v����U����v6�\"�>g\n�W~�|U����\\:�9��N�q�8������a�1V���o���\n�o�Ƹ�p���؍�ݿϮ*�$b�\"�IV���Z�=1V�={x��v��J�����m��*�`V�Q��vէ㊺��N*ѯ~�jc����Z=iZ�)hӶh��ᄪ��������a�q%.4SZP�(h���낒�)�78X�(�}�\0���Kt��8���{�K�)�Ew����m]Ƃ��u;~8-Z�ۮU�r|F��ƐV\Z���$\n\n�������b���	�qk��\0>��\n��SM�ಅ�޴�V��}>���Tmߠ�%k��˿��a>hXjk��\04��#�1B��o�8�)km�v�>��b���ޝ���1V�J�q�;�k�4�qU����Z��v�J�ǾV��~�P��ر+h�P↾���k_l(X}�ŋGlU�P��S�я���ˀzbө5�q�&%D=�	���lUcu\"�߱�q$W\0d�-��0�`}8[ri��\0kl��aU�­�ՠ`	^*=���ǒ�\n��x`	lS��O��J�\r������1J�(�1��ڍ�:�*����>�\0�L��Fǿ��t�/����C ��iM�$3\n�k�S�,��&�w�[��*�=�!��U�n��[t�Z�����#���u��V��{��%W��lPW/M��|�Z���g�[�Olj���q���7�*��ǪZ�\0?|U�x�Wm�j���%Z��­���6�ճ��t�]�qW\n�{`�[�\0>��������Zb����WSol\nС��ǚV�}�ڴiҕ�{b�u��1W~\'��b�m�aC�{J����	u�t�%�N���2)j��7�\0=��W�t�qV����������\0�([���|,V��m��d��+ڀt�b��O���	E-�����ѩ4�FKv+��+�գM�>^v�+i��j�Ui=�S�з~�J�L,V�JӨ��aC_����Z\Z#on��T��C���G���\\�ѯ�ⅻ>�-�c���;b�[�m�^X�m6���4TS����Ҟٍ�i�z�CT�(�����튴~�i�ҏr\0��e��A\r�Z��b�}2H��U�56����4����`rAbJ5H;��f��\r��qW��Ru޿v4��\'�0�VֿwlUp���ۍ��b�����W�)���~X������0�\r�|�暧Sǩ�P��?F�J�ڛ	\\��I���)=)���ؑOo��+)=:���*!���+d�+��P��Om]J�G�u>�i[�\01���q�8�u>�\0�­P���W�q��7?�/��ţ\\)\rn=GZ�tǶ\'eo��8�J�E}�1W�8y%�\Z�\0UƟF*�T��h��~�BZ\0\n���a[öV�O���#oIK{\n�CT�LJ�q*�O��؄��m��y+�S\"�S}�V�~��Z�߆=�ը��킔�ALz+U�������­�a_\r�\Z`Wo���8�U��\n���Fàĥ���@?�*��ߧ�)ZF��\r��:�������݊\Z?�\\mio\Z�o��E4M��¥mjz��뇫���q�`+KM���ҋN��X�;v����M��ߊ�ރs�IMMGLmZ��ӧn��m���}�M1�-4��\0wj,V���+KH>؄�\r6;�QKh+�l4�Ѓ^�S)�zS\r��N��(Z�l\n��Z↩����u���!��?N+O�ӏڤ���^��c���;�� �(�$\0�U�;䩋M6��KKVݫ�Q1�:��NH2*�����So�퍫{���[o�ڶA����mW}����-���,V�����M7O�s9�T�?\Z�O��S�%l�K��?�B�KǊ�B�F4jv�O�o���,�l�[�h�����z��Y.{���\0�sO��+`��}���!p�Ѷ�-�U�ON���d���m��aU{m�B����y�*����z�B�;{}87V�ߦ:�k߮�R���rV�\Z���Z�A���)p�|������K�C�����7��B�	#Ǹ�Ĕ��R���\r�n*p� 5����R�ҝpڵC����q��ca�=��.��Z?<6��=�*?~<�ۍ��\0����WS\Zb@Vǉ��\n��6�V��Z~��S�q�_�늵Jo�}qKF�Q�V�z�U���q�u>��Z���+t۾*�;��cj����hq�lH	��v��|��?(Zz����BVu7�@Ai�6�X�a��q�4E+�eZG�O�1R��5)��(h�O��\n�ڽ<1�h�?~,V���钤-\'a���-=?�s��X@5��#�Z��_������w���bJi�E~.��Zh�Wzu��i�qB�?��J\Z#c���U��=������h��@�]�V�P>�+z��m\ro���KH���6��h���=p+]����+Opv�~�m��\r��_����JB���0�\Z�8��\"�C��F[����\0TH��-���S����M�����8B�;v����\'��+t>�x`K`��|KM�+�mϷ�ƒ�����\r�\r����]^�m��j␞�vқ��YyA0��6n?f��<�e�G��ic�K��P┮�-?\"Z�v[�<�ORY��=7ˈ\07�����}��֝�d��R���M\Z�g�7@q ��u���^\n���Z)�����1(�W��b\rH=����`�ڵ5�+э=��\0L��<+��%X��?���0��n��UF%�t����p޸��;)q��S�KG�i�l�����V�0*��sQ�1��]NƟv%��ݰ�KAG�za$��S�;�t�S}�������]�q�*�\r��*�b�\Zv�|:aC_�1	[C��;������~���V�A�pZO�Ƕ �G��)u����|~x�D�ӡ��m.���8��nF\0��V�;�\n��=�VpoՂ�ç�ݏEn���b��|>�\\z�ew�Ӷh�c��qKT��U�s�+늭؏�!\r�=<Fh����1�-4��|�ڕ����^$��m���i�?��Z`R���^�Ab��{�HZ@���\r�A:��J�F�����G��1U��{�Hzצ,Za��G��\rPt����Z���\n��O�\r��>��Z�m��h���X�@�w�Z����i\rS��޸=ʴ�߇Nء���U���׶!��\"�%� ���73q\'�<I�ň�Os׮l#���(��:d�ۧ�X����~�6�����w�Z�V����K�����[�*ب�=���ҵ����\\�;����EF)Ο��#{�e\Ze���7&�J6�\r;�5�9�ח!���5�*6�s�()3�j�}�⿴߳�C�^� ���\"O���D�rL_��j��[<�)̌l\Z�\'�2�yo	`Ie܍����PK�c	��w��z�a\ZX>���?��34�}Y��#����N7��̞m��ӿ�δ�ip����b����K��Oo�\"i�VFF+)>��\"�ڧo�����L*�Պ��q®#m��U�����ճ��>�6���lR�:}8���\0��`��\0>�+HZEO�����%p�,ZۯS�1KF��=>x��WגU�a��\"�w�*�(:Tu�K{���a䆅Gm�\0R߿\\P��m�qW��J�W����<v�V�����\r*�J{`K�w��kj|�b������]M�m��V�?��\ZU�;`(o��\0�u?�|p���īDo�pwo늭?����\"��FJ�i��=񵦿X�ժ\n\n�^�i��C����n��j����a�+O���9+�-c�pk�`CDP�\0�1B�ס�?<�B���)�b������\"��Ew#߾M8�=�Lmie6�m���o]�Z�>8�|k�b�pw�qB�T���Z���qޕ5���U���Ӷ��θ�\Z��qZk�H�{|�h�]��϶*���{`+6��P�����\0��\rop�IZ���+�Ajz�X�prȵϚ�\Z��2v�C���N��i�!ݿ�|*����u)שژ9+��;~8��>_�bi[���\0�m-��گD�����8	��4��tBb��[y0��U#{���6�����\n���廋�Q���_��9�d� �>.�xWgv\'��I\n���V��}T���~/� ;���}I����F�$���@I5#�^_��e\\����2M���.$�J��N�RaV͆8��m��r����x�лn��S�0�6\0���T�S���B�@G_\"�z�o��HWS_��J���}p1+�M����0���������Z���b�~]0%´�t���m�Ԫ/��|y0.;���chZA��a�m��a[����];n:⮧�x���t�\0kvWP�ኴ@���+]�v��Xm-��֞����9�����m\\�1�߷�0h�߿q�]��LR�M�x�\0���\'�mCF�=��\ZK[LU÷�|U��*k��z��[�Z����n����\"��޻\'`����ߍ��O`M0q��@OS�P������V�;�m�*���\0��\ZKG��X�iۥz�8��Џ�Z;�ۧхN�����H���n�H��cH-|~�!�S��OJָ�)�\r��,kt�}���a�>H���Gù=�_����i4�C���\Z#r~_�AZE=�k� V��ۮ[N���\0o\n\Z8�]>]�U�}�:��hh���1Zk��3����M���C��]�S�=Ue)A���./O�Oq��\"�����,K���ō5N��J��B�`)�E8�\n)�oOն*��c�j��?Ǿ4��i���K�m�B����6�p\"�.��~�qj	���e#j������e�ko�d6�B,��(��T�ۇ�9�(�q��zG�kW����P��\"�r<q��M��d~���Tq��Ĩ�gbzr��/���6AJ,�R���4xN�?d������vq��Ul���2�\'(T`��]���W�$�Q��O���=�ծD�S-ҡ�t��\0���d2�[%�ǡ�ݖ�\\䃰ĥuw�;S�*���7��dTס�r)\n�����%U=\\�AVZֿ�p�.���	Cj{�{��PӦ��۹�j�l0�\r�Px���J�<6�����$�+��_��b�4��<,���t�in�\"P�\\T5�Q���1	u(0�j�=~����o�ں�wLmZ���.��N�ڸt��{cj�n@�\\\n��P㸯�㊴�]��u;�C������5�Z#�p�5��낕�t�*�o�]O��Jm�`�6>{b������-�t�_�\nZ�\0=�\n���X|;�aK[���8)+	~�R�S����PW��\nV��}�6�\r��jk�x��m���[O��A[AJ��<A9h�SӸɢ��oa�6�h�]�{׾(q�)��$���v�:m����=G�CG�������qV����F+w$v�ī��\'zw«}�����~�IWSom\rS�o��*���b�����}�R��t�ġ�O��CGÿn��ӹ���\0Ah�����W��(��R�_�ރ)�����H@7��&�R�+�ۊbB�72���E�FE(�t��0�\\�\rF6�,&��\\6ŵ �~�=�H+���H�[&�>��m[\0�N��.Zx���QK�ۚ~������LJ����M\0��R�c��4A�H�F���N1�0�h���{t���y(#�>ߵ�e^ۣ-��a0��@��8S�S��1o�A�#F��vm�տVlC�%�g� h|{�d�k3(�+�F%^H�}�Pz���oǞ�O9����=�����q�;x��\\\r:����cj��*�zm�t��i�j\n�K%ej��\n��z��1+�N���FWWm�æn����EO���*�����Ӎ��7���*���\0LP��}��Z˘{��,��q����J@�qZ���n�݇�������[ާ�;�F�{\0��\Z��aK�ʃ;o\r�w�l���ӷS�}0���m�X�v���_��N�\0< �Z�\0>�8���>�hu4�qV��튻u\r7����Wm�PbX�M�������[��{u�Z���\0�� �D\n��`J�i��SD}8R�r?��7JѧO��Z���[��ژ�i��+��\n9��w���8�\Z�|�\0�(Zk׿C��m��$����\0=�k��.�{����XƂ���AZ}�vߨ�d- {\nw�8}�k��V�}���J�t�i����h֝)Pi�I5�7�����ZkQ�k�4Eh{\n��5��㍭4w޵8�G�t���H��\Z����hh�~G�+w=���д�Sm�\nA��d����)��kA!�(�K�m��u�\rH�_��k�+S{*F8��m�\\�ɺ%�e2@Mz\r�� \\I@ī%�p|,;䘂��G�j*z�l6�q~ƴܝ���T��u�*�)^�#W\0>���(\Z������኷��W��Zu�H��R�0iQ���\Z�A�%��v\0�O���8�܁�l�Ve��c�z�zU��͌�`��C\n�uXGR���G��]�ҙ �j�\r�>�J�Gg+�\n�(\n@��c����o���]]�z�|պ�܁ׯLV�A��������K ���׾��QH����W�WWm�(q�$B���G�c����\n�<|0lP}��P�=N��yڕ��3��$����W>��p�r-���U����@�;,�o�&����.�w�J���A�V�w�K`�)���v�\0)�q�V�k]��v�\0O���t��l��EA��cih��\nB���%�6��z�\0�0)hR��*�=�|i\r�B�ju�(j��,R�+��1[u(*MGc�U���$-$����d������I��\r��N�Hh���ծ�v�>XE��Z����Z��qZv�LP�۸���hZI����!�T�+�Ӷ�h߈�#kKZ�=���.�ZjN�����m{�~���c�~m���N؀��߯ӁZ=~�->>ء�a�v���?������0%i	�ab��W�ڞ?,\r�p����V�Pj�|�k�bKi]�\\4������(/��{Y�Z}=�R$��*��I�����q6�$\n�27����L�&�f�i��F��Y�\'BS<l6\"���BVvH�����-� �lLW������|�Qӭ=�6.��E	�ġSsׯ���*RH�:�ڟ���VG+H����\'�ĠW�6yDH9J[��5��sgH-F�*���`�wP+ǯѐ����$@h��\"�=�Y\"-�9[��;�Њ�sOj䩉��V�237����u�Ō��l�\nW&Z�^�6	��\0N\0��me�Goc�{���0�W0O�\\�s4YN����D��[��(a����\\�w�\"b8��-�D���܀!O��|@fF<�]���*�R9����5����\"�V���9�[��g���E�\0�Be�e1����_�[@���L�\n�â����*�w�c���m����T>��.=7�p����������m\\N��\0\\mZ۶�኶��kJ�ç_�*{b�#M���ú�����*�k�	�a� %rE*�:W*�M�qN{;���)P:�&ܘ�jf7^4�>{�Hg��_��ih\nu��~m+H�zw��_�l��Cm\r���Ǫ�\Zo�Z\'�l �uk��t��wlUmw�����:a���5Hǒ�<O�WUn���W~?��l~?~(lOU��\0o�턫���\0Li���b���n�o�����a퍲wlUi>p���O���=Fk���«O�፭-?�|m\r�rA[@>XB���q��`��l@\0��{��Zh�\0���U����\r��i�V\ZW��\0C��~xICDS��\0��h�Ws�L(���7�ء�_^�cj��^���P��$���4�V����\Z\0�犵M��������o|U�U��w������M\r~����:\Z|�aR�~���X���0�j�v{~\ZsF���T	�6D���p�o�W�C�^�&>&�v�aT���3\"�d��pH�J�`����X��v�\r�0�tA�`*��5�i�+N l	��\r��\"ևbF��ڡ�G!����dr�6����\0+\'l\"\r�p<���b�*��W��\0c��\r���U��f~e݋3T��ˢ(Pp�I6T�=�r~��[�m�k�?�!<���w�5��\\Ju��U�nRS�s��\'#�[\rE�O�*A�CS���%\Z�%+˹��y�r���aL% E�(\Z�Ӱ�>Y{�Jqi�l���\n�\\M�n�BS�r���&A;�\0551��n�CP��5#���l��p6���-;j6��$<�e>�	�UB>_�$t�\n��5k�+P~��C[����om��q��ѧ�v�j٠ߦv�+��qV����k�Uq���0\Z�2��0�*�>�b��l�l(�r���|��C]��;�E�bRb�߮�h�1�V\r��o�����R��Z2�Ez��lM�hi��Tn�윰I�Ի�]�2A��Z`%.�?N[cǯ�1Wq��sx��h\r�K�������\ZnӏD�=\rv퍥����$���\0�(n��V�>�6���;\n��Aқ�P]�*�*}�->=�n����\\<�iM����l�_��]�ޘ:*�\Z������`R�����.5�ZSXv���}8�U�և}�(-lE:��$<��:u�kM�T�|^>-4ׁ��B����B�>X�i�qS�{�h[AR<F�5�A��aR�_Ƹ�k�(M�´����6�\\KF�m���Mu=w>?}qi�N����?�$���֚��*k��U�R���o�д�:�\0��iiz�v�ZⅤ����ii�j֝G|P��?�(������?��3ൠ?<��im�Zҹ!��d��\0=�Xj��V\"�|�\0�T�Q��F<4���d,W�����!C�\ne�LLV��w�^L��t㷵iL6Ɩ2�𝇎R�������὘����~�ZcIt��1�\0z��ml��{;\'��T�\Z��ᮭ)�Pv�����S\\�aH�����KjMp�Z�y\r�eЭ|O�4���5:V��V׵�u܎�ۑ��e�Й�����;�\'��\Zx�� ;7^��!>�L�6���P�GBd���A����\r2��K���T�I�����\0l���dS���w)Uw��!\n�N�\0�U�D�����p�hw����o�:�����\nu�ö��LP��-�k��;��\0=�!i��xoO�2\\�Cm��B �e��4�Pf4#��%Ѵ\"M=�\\�0Ri�sI�� EA����5�q�6�ol���\n���↏���+�R�\n�l!V�\0��%����v���pڸ��a��K`}���!p�k��Al}4�(l֞�\'hv�N�\0ۀ��n��V$!oo�b,\'�HZz�?N�-;a�\nCGq\\R���Z��v�\n��M�>�U����1MO���a�\r�v� ��\r�K�c�u���=�-=��:aCF�=�cHXk^�?vCT���8��ƿO�b��~��шCD\nS��v����}�\0*{b�����*7��N>$l�����O�u��h���{൦�\nO���J\Z\"����kM���6�\Z���#��kKH\0�5>�$->�,V֔��q䅤��\0Nhk�\r�V���_��0��z����Cԍ��GE�i4�z����\'E��h+Z�4�M�.��� 2���d�%E��ZPw5�	A\n,���NL��j:��L��ڟҸ�R\ZZ(e�����@����w�\0k$�(�P�2��H8yE�S$�mv��z�=:�-�U(\n����cjE\n�\r&4����!���\nh����p�;��8\ZmZ��\\*�1���J�\\�rF���E��d\'����=CP���|�Q=�gS(�-\\U%R>��9U� y#�~yląD�&fJ�C��@&\'��<��,Z�| �`��\0�:�;�V�Ǫ\\�o�\ncaZw�x�+T���q��֞��Z|�*�hEA؜�\rr���jj;|�H��=�ޛ�V�$�*{�\0���L6���AXhI�o�g\r��\r�q%m��Ss�7��Z�T�_|6ɰ>�\0�w��T-���-Tt~6�Zk��ֿ<R�iӨ���\\+Zv�_|!����⫅{���dmuv�lZ���.���኶zm��%V1#IM)��Z+��J��#Z\'���6�Lm+O���V�����%j��ڴM:v�\r�-߽z`)\\?�q�;u��~���߉CD���XP��G�\rV���b��>�:b����q<�ѧ��)[N���\r��M�E4@�|([_o��uw���Um+�t�x-i�қ�O݊�$���5،4Ĭa�\rגA}�>�-\"�����S�$�_�Z���E?����S0�曮4���|J��LQ�e)�s�bZ�ߎH��&�~YZ�-�O)���| �5�����e���\'�SO��J%K���OP0�\ZY��j12b#I]�D�=:�\'�J%��^��N7|ڈ��`\n�l$�R�B�(�j��rUͺ8�l�\"ъ��48Ak��\"?���a�i]��bC[�o�\r��N��(�}��\\QN����֜<1H�ߧӍ�/�Œ�SR��\"�	�g�q��ѣS���)0`ɵ}���:��5�VcAȉ�	���V�kjW�k����X��Ib;d�B�N�I��_�F�j�w�\n]P\r:B��ƣ|i�)Z`�6�CN7���V��卤�a�Qzn{�dH��8�UI�����=G����E�}cE-ҝ2\0�*4��X9�~�\'g&$R���#��Y[~�<X\Z��O|���ƥ(E��=6��dN���RX�0�m���wc1{.����SC�a\\w\"@���ϯѶLƪ�#)ZO�1d�#���kKMG��ҷ��|m-��턫U����a�lw�G����\rG]�.�����R٨�(h����+\r{a��c�,�D╧\nV���0ZZ��}Ua�O�lBZ\'s��%hﷶ���v�{�*�w=��Z��{o��Z�{S�\n��)���b���h1B�iSԎ�퍫F�;\Z��mw�;��aCT�j�mL*\Z��Ol�������֚$�\'���,;�\0V�+Mw���\0otS��6��qCD�_���H�N���������XN����\Z��=�Z~{J\Zޛ���V��?�4C��*������`C��)^��0^��p!p4���x���ۭ=�R�>��\0�(h׶!V52A�[@>c�a	Z�|񴅬��r[���9V��0�Rҋ&��_�Ymd)H\Z���\0mi}�*EH;��صN;%��P@�u�8�-*EF�IX�P��~Yں7t`��\'�=wȝ�D�l#.`[��a\\)ycA�*��y�1�Y+�LT�P\rz�l��u�a�iI��֙&�����.���P��+M~��p4����B�	�%�^6#|YLd�Ȓ�@\"�s�iҹT��L�O���),��Lz��	�v\\�@�˃����}�N���L>��+�{d��[�ޘ��\0?�!rA+��0!^��`!�AU�J�\0���\Za,�r5zm�����~���?.��#���i�	Q�����ȱɰ�f��@��q�����H���2�n�\'�ř�C��dLm��%j_}�r�\\���g�X���lA]�ܘQo�`;\"C�3�di	A@iJ���@ݻ�ID����|>88�<�j�P�\0���\\N憢�F�	��-�j�����\r��8P��x�l\r�7����c��M�\0\n�+n���\\)�v�eZv�q�+	��ad��N�m-7���-$�b����l)h�:a��4�U�߿O�U��loulS�S��h>x�Z\'z�����pڴOZ��o�$--������!i�j>u�j��5�zS|AZu+����h��q;*���\Z=\0���X|[}��`C��4����*CF����ZZA�����*�~�ْb�����㍡��)�}1憩���\n\Z��s��h��=6�ZkZ�[���\r\n��P�|�=pZ��M��=��SҘ���\\��-և|m��=1Vȯ����8C+Zz\r�������2hҔ�k�1�N���	Qt���[f����o~�N4�m�#�\0W�>�6�\\�JH��s�H5$�����d �ς	l�I�qq��屘!���@�ۦ�mxm]�kZ0��e|ہ��O�%	C�4�|3\"%��;���v�S��\r��4)�a�*O_��w(���>�Jӻ{}�ڮn)�+�|\r�DE�w��i� K|gcl�µ�ۮQ�t��\0)��>p\0a�E�H�xm��\nm�֑��}P}9�@����D�N,�H��~����5����^�GӇ܊v�0wj����Xx��ؑ�,FD�)5A>=��a����D��\n���o��7EX]Ƶ�U<O� nS8�ћ;�d���H�F܆��!8�%)iYܐ(Iڙ}9�4���~�r�ݜy���Pw�\Z\r�4�����!�X�GOP,���G|}�e�e�0�*v�d�sٵ��O/�~/z�C�� �\'�B�ޞ�`;��)7z� Y����ɭ�����[|P���pZ���7�\"����=���_�CD����\n@Xz��c� ��O��œ���N�ڭ\'�n��X�˩\"����������ӿL	ZMz��V�}�zaV�޻�c�����߷�V�һ�s�b��Ӹ��uZM7&�֘P�������B���\0�|PЯNé�C�$|mi���������\\@C_GO(j���\\\n�����\n����b�k�~�V�kN����(Sܟ�+�\"֑�_��aj���;���ZEE|*�ǧL<��ƞ;`������#$�����V����гڝ�Z��o��0���=�f�����X���J���ġխw������\r֟م[�,ex{a�Soǯ�d�z��-v\"��1	XEw�\0�S16��0���O����R���v;P�u��W��rQ�\0)5<wޞ5��-�\0�ڌ@$\nւ��Rk��@(�Q��[$���w�Gjx�d>��Oᖇ_\'t�#�Li\r\Z�<%]Cץ:�8�;o����R�F6��V�u��Ң���\0kY��mBO����r�ilH��*��\Z�LꜬq��)��e���G ���c�Ti ���S;(t�r	�T��k�����?�\0�5����r���ӫO���G��\Z;���u���*�����-2\r>�T:���Qd�v8�&*������v�\0Z謑�^�H�R��^��gdL�VŶ�5��[Le��@E�D�s��&�o��p�Bwb7#�{bCZnUڥi�lDh\'�!T�\Z�L�@������zǼ�#�jdhL�(�JM\"�4ڸxY��H}B)�q�&;6¤��v�2�;@qv�����V�A�ڸR��$��q�4��\03���Mw�rV�/�OB\\i������=1eK\r<h<>,!���,A�-7�~Xmii\"��� ����J�-\'��0*��l6��~��1C�={�BZ�R��]+���۾CU���U��=�\0��o��«v\0~�P�ԯ]��U���n��ꮭ{n{����q��\0=��д��~�>�l������Z�>\0�U���chk��1\n��q��x׿ߏ��߷c��QKZ�>�FCG��������n�\0,(j���6�N���ޘ�_oojab�6�(<0[]�tP�P�U�*�C޻������\Z�0��\0��O�9����4�)GL6Vڧ_�\r�ۧ�ᄔ;���*��\n]�c�[�n��hu?�V�-@~���H����5��;~� �i;m�b�X�8�NkF��r6�V��2)�Jd�g�o�\'�W�(*å9�	�r@ؤr�I�VZa I*<��W&\Z-e{��P7�ˈ�>>y$n)BE��qg�o��l)�J������m!�O፩��]���M6O���O�`*��L[\0V���v�\0:dK~4��#�5^�۞�3!!�2�<�KA����Ƨǻev\\)j7��8)��?��rO�`���q���R�l�fhvm��\n\Z��p!���SuN(�h�������-�)r=�D\'�N��xbB�H�ı-�A�]���aeJ�wT\Z�10�]ˀMMp�)��\n�5�,��\0nG��k=׎8���]�ژ�_4��4��`�i־�II�����7&��8�I�@pcı����ҟ\0G G]�D�_E;���݆�L��.v��\n���#����@\n��$n7,beܬ,gU��S`sG��-6=p�a�+Krof@S{���Ĕ-$}�R�b�i\'�|���l�J�ۑ��ʔ��B�ׅ�ӱ��-V����\0:b�\n|�om[��@����V��k�Z?/�\0*��턔oN���]�}��x��\ZP��ӎ߆���Wv=7���Ч߰Ǫ�}����▶=z��\rm��A��i�����R��R��aZ���c�!�T����X�^>?F\0U��S��-4��q�|m{\n\r��j�Q�!mA��1b��\r�;b�kQ��+Uڧ��b������Z�>4�i��k��p?�Su����C��^���a�h�:�.zu��r;choa��Z=i�!�M��\\�V�~�n�k(���a�d\n�4��\\)X{��J��J����s����pGI��\n��t49O�<P6�Ԕ�h�Z�]��O�����_JX�Sޠ���!MV����b�&븯�|!�EM���FI���}�X���t�R�w�Sk�Uv�Հ�DZ�����ZL\Z��{�*���-�	މ2G8��j6w�04����̣��_�,%��:և����S��R���$�ñex��噘��v(K���\0L�dB��S�!�_���r��ZӼ=�b��6��ӦD��H\"����J� 6�\0F6ؽ\Z���lH_�nj2,iū�	Zj�߷� ��AC^�)��GUz\n��l]_�����4m׿�`�!�S���{W�D��X{S	��0��\"��]�\"v�(���N�ت����}�{�r�*`3��.-�U!-]�/��6�LV�|�ȡd2�����豜�6��4e1�(�*v\0���\\fO?�*�1���iF���8���2�%D��H.m8cj٠ �|�M�\r�A��\0�ȓ^�m�-���)h����ik�aH�vd�\'�N)�߾>�W�S�\n)uH�}��U����Z�y+V�T���h|���눤6H7���uMz���*�\"������­R��ӊ����獫]E>�Z4#�?<mZf�:��b��S����$�Jv��V�cۮ>�4~��n��[��X��z�B�>>=qbV�>��b���«H=k����I��R�\n��~��T�{�Zq��|V����LSM�5�\01�4�\0��\\�k��w/�(��G��(\\n���zUu\r*N�`\\t��Wj�\n���_|BV���cij�m�%o�%\\@#��\0B� �\0k\r�L� �֟��I�J\0ǈ��{`1��*�] _N�?QI�Q��+�>�2ǽ���SN�O$ȣ��8��o��\0\n\'��~�k��7�L�8҉�TX���4�[Z���5�_���uH�8U�߾+M�;u�L�w��\0�!M� *�\0W�D�=���Z�Q��{t�[�rڠ�x��ȑa��Ek|\r��f���(�A;��9�(�*l����QM#I���\n�|�� �\"�ċ�%�����W�k=U�=�_��`�i�C�Zv�?*��Ӯ\'un�6�P��\0<P��S�\0� Ӛ��z�`H[ZP�������ȧr�vĭ.�#�¸�t|^EI	����$��V�{�an�$F�v�*7ۖQ�\\Q)�pT%���}>%��sЏ�_g���S7~�<�&T���Ŀ�k��]��+��[�`��oN���Lr��l�֑\n�T�&����+�7����S�bA\r��j���ܰ�e�&�Z~`u�S�1���4j�GWYVP��֝>���Kj��J�шى��Rq䈂��\0x�W�7�d�M�\\�7�\\���\0oPr�F��8�r�����e�ȥ��Olod\"e6¨+�<i�m@�.id���mC��x�Ȯ\nz�杇�cm�z~m!L����cL�i;О��$��,�ۡ��\n������a��[Ƶ�ծD�]�LT7�����xIE-\'�?~(uv=�׾*��v��ҵ]��W����h6���x�~��V��z�����`�XJ�{u�!V��0����\0fI��prV�*}�<}�ڸ��*�@ۯ�(Z)�I5v�ȫ]�\r�}�p����<<0����S�DZ���i�~/�����D\Z`�R�ҿ��Zq����i�Q�����i���|q*�\0��W�P�&��5�w��_����C�Fr,%��hN���]C^�b��F,I^)N�xdm�T���[���� �\Zx�▍zӧS���{a%-������ZT�MґN��gjt�^�Ad����6�񊩌����r��\'�/���3p�����!��^�\r��-|�w�f�n�J�i�@2v���n�b�\Z�S�t���E8n6=q�@*��=�^E�B	�*{��6��ak\'o~��[Y�-A���,A^�\nS��C1%E�ּN�o�2$3(�z� ������r&\r�6�rܳ�QǠ=�L��a,��gg���S��c�5�O��\0�ʥ���At�5\'c�Z�V�m�QM+++�e5S�a�`�p��$u8�Oʫ����N�e��B)\'�m��9\0InOU[kإ�F��X�7���Ǌ��b ]���}�:d��1S�p�t�����4«�$7����D�%���0Z\ng4rKl�i>Bf��O�cgg$	l?��z�T�td��faF�b��!�7\\(�7�$��4=/��,�P��\"�X��*���	\'���N�i1<+/��\"ȇ�0�=+���e�X����Ҹ\"(��GJשɍ�㏊;��5Ծ�ʄ�s���J���	�~���q�&���H���Z�Lb�U��H$�o�c�%Ŕ����RY������2xv\r����O]�~yc��i@;��R�}�׍�UU��1뷾BB��hi�u$0�w�2\rА<�����#��,����M4�!��5佰7��,�(�n��P屦3�kK����I^�|0�ֲ�Q�ÑܚV����T�K˵n^�?=���P�F�����n��\n<l?϶E��e#�A��+J�V@4��X�)����1\"���۟�N�Olz�����?�6��\"�����V�;w�հ}�C��W\n���V�Sf�҃$���8P��{x��֜z�M�lU����\\�6�lP�aB�N�#�+K߆\ZCD��<0�ܪj>���Rk���i��G�M:���\0N+Mu���Zk���-q������q��qZ[M�V(��o��/��dj�Kx���Y�2}D�Sb���������ꧏ������.1;��~�d��e������H�U=z�)h��XR�+��ƕ�8U��U߯	W}�U�1W�)w��LUc%E|:� �2�H���������\n���=2��֭\"�c�1��˩�t�\0c�b%�x��d��֞�n��h��w�};�>ز�h�\0�1E8x���P���Q�n�;ֿNV[�$c��\"��$�>����`A �C���\\)ho}��b�0��l��v��Œ�FH��Ī�+7О��Klc�kʀ֕���X�!0����2�К�dv؞�Dw�����S��v\\�`@W�S@U9$����*{d(ߓ7\'�����	\r��X0+Pk��dT����$,�\0ޔ鹭j9W������3_O>v��~ �~�o���FD8��p\"U��B�Ҥ\Z�.��ʅ��Q�H���K@�?1Te\n>��,���\Z\"���Z�F7�(�{m�*2.4�H�@��ul��`�È\r�ܰ�.VFc�!�Q�D\\X̩�>K�2mɈ��/u)����A�7�����\0��p��Yw=*}�d9r��D�$P\\�����`���}e(E�䢜Q�u��b\Z��YJ�c�D�Չ�\0|G/bl���\Z�%��.�m�-��7�==�6X�\'�(NB�(q�!�\nC�ѓ�������Rvz��*>y	�L��AjXҧq˨�O\'\ZS%M�G��x��}� �b$H5N6��$�w�Z����K�;�������҄��Yw�Y9/��9�� R�߮F1 �Dil�C�z{��@\rS*-V$��&\Z��{���G^I]��ON��E(�j�2��5̼k]�U��M:�.,I�E�|(ltߧՈC����8\Zԝ�]Oj�\n�ޟ������ |�R�2R�ӶH����\0?!��C����$4O~��x�@J��89%�i4����HcM\ZPm�U��Z�?��P�}���P�x�jv�>I[Rvw�kK�i�}�)�q]��.�h߁4��m�S�0Zi�ҝ|~X�4O~���1�j�B�J��޸ڭ\"�;퍠��kv��P��4��,�h�i��zq��Q����>2G��Ɂ;rU�7��0�W�+�k�V���-�Ǧ���\n]^��j�~���u*�Ǹ=qW���F�S�o���qW�U3M:�i��$�eĭ?��d��EJ�9��E�9�tcMl�0!�B)�̱![9|7�\n�.R����ҹt%A��N����:d�~\nwa�!Vֻ��\\X�*>��.S���,¢�����d[b�I+AZ��+1rc%�\0U2���O��\'Jq� ��2�N=~��JË,tT�=;�_\n�\Z���[0���Pң`<�q�\"�!K�u\rF	\"�����8��@C��Z�\'1ɕ�t#N��x��W%�ޞ �\r��z��څ]���\0��#m��e(����w���	�34�	[�\Z�}��Q4���p/����Jr���y\ȑ���Bh��f�s�H\n������G�O,p�C�b~&�*�n.Hm1���!�7�S�����wq$7�#�/c����^^�,� �-6#o�@��IJ�N���L�ܜ���Mr�I�`�R��\02�0)�,jz�ɝR!eRM@8i1�Z�!���`M�M\"s�so�P���)R�U�:��:uW�-�F\'�4+^��\r�����\0B�ԓ�f�zW�\r�T7C��GV���}��(N�1Kd7�ۛ�O��-7�6���wD�{*-�2�r�\r��l���\\�<|0�F�䃿E�ފ��Ws�\Z-��;���N7a�ӧLΉ\ry�n�x�F�T`�zpw*�dv���!���H;��*EֿNN�HhT��P3M�A!�����9^P)�Ld�Y�6eڝ+\\� ��\Z]g�����?NL�4��Z�K��q�6���\0��ڶF���j�\Z�����\n��o_�\r�T�����&�2X����X�J���Zq�?��]^��ڴw�����(h����U�E�EZ5�n�$5Ƥ_������w�\0=��w\Zn�\"�qv��\r�4T���\0�6��\Z����i��E�����\'l6��\Z��chh�x�O�S`~0Zi�L<~��.q���\0=�ڐ�\0��D[�R:�9���E�WD���\\�[Q*���d�0^o|m\r�퍢���j���L6��mi��N�$��i�+�D!�T�*���j�W[q��P�NwC��Ė�ۡ�<��V�|1	E$�5\0Jz���R`Ih07���M�W��5	�l���\n!.�,qI��܏��|[;��A&�$V��\0�32$8�bB�>y7�)����Ɯ+Q�b�k��ŐT�J���^��di�Im\"�1�;���+��90��Ӊ�`k�jဠ�!���H\n�6��\rp���\nFG�mH����2��K@��=�T��iО��B\\���Uz��l�3U\0��}��26��`֤�=��JP�R�Yd�h�\0�\r��F�L�[�Z��fG;���=�mû_�i	�L\'ژ�Ld6	M�����Xa�s����;	QZ,�+J�W����!1M\Z������N��P����!M8�,\ZH\\P��^�h.�4ǯ�A�HR?���3lt���a^��d6Ol(a+��u��W(���f�h�neY�&��^������c$�7y?a����-��J\0ZJ�~��-�4��V�/�S���~N ���*��v�>�\rÓJ,v�����ҸY;�SU4ȭ)����AN���L�))�f@�Z�kL�&ܾ�C�#�{{�P!�1$�6VW���\Z}�o��2��ш���WpC/��z�(@��:�gY*�>C,�A��S �6�N�>�8S4��*8�v#��4�vfhsC}a,�H�W�=���<T��E�.fQ�4��	�!2O�#H�Fݕ�\Z���i�L��z�0h���vέ\ryx��^L�G@2ȋA�@��Z1���æ���G2�D)!YI��l/鱘m��5��mP2w���N����_��;���b�3\Z�����b����n�����\0i­���\rZ��\0�\020%u:�t��i�4�?<mW�:[m�~�QM�?�M.\0���\n�T�����@>[N�-i�ۚҸ��ӷJ�a&֜����`M.�N�ciǥi�ޝ�d�@�\'\r��Ѫ�Sc�r�\r.�?ۅ�/��J�a�6��o��\0?Հ�R�u��1����p��W�QN�v�Zlv����)p5�hv���Z�b����\r+�ӊ���.=Ͼ*�����[]=��R�m\r`v=0&�*K�H��0���K�i��fC����!3ݱ�7z{F���Rj���e��&�����{e�N?�B�)kC�Y�T�{�\\��߾@��\Z|�d�]�CO�!*mMw?q���Q��=?�瑲�!a�j�0X�V�z��$T���kp\"�<P��r}�a]IaP}�ߐr�lw4r�[\0VJ��-��w�d�Z@�*�Vm����6��6�x0��n�=2x�	-�Hܨ��7��lvo�! ��K�\\��\0�t�L�\"�����mp�)��I�}�#td��5޲�*��Wqң炶c���:Υ����\0�-�+��6�k�A?�R$����m~��$�-�LL	\'�i��+1q狉1[��mD<��\nڜC��\"��$��z� T�+\r1�� ��^��d�rЊ�e�K�Gw�������T0٩�&\"�D\r�1%iI�`+����L�>��\"߹�I�z�.$�z����R�\\�9,`��v8K0�x�)ň�\'z� ���)?<�ܠ_Ɉv5���l�(���#3H����!��\0�J��\\�<�L\"�e�4m$�\Z������ q�%$g�\0+A]�M�5\'����Kf\"4�k�cB�@O�=�&#��ٴ�&}�Pw�)�e�� ����O�Щ��s$n��p��R�.��*�z�琌(�9,!I�/r+�l�uƿ������A?p8XH҃�ƀ��\ZY-i��2H����\0~y\\����P��@M(z�=r�-i4��f��\n��´���7��_�V�+QQS�>X���z�`�Ң�kS�dx����m�kM��5���p]�\0��Sav�\'ӊ�k���4�	$���\n)��:o��֜A�mih{؄5C�Ju��n�O��`%i�\0o��SMu\0�\0��.�խ;��OӅV֠������O��횀�7]�\\m\\���|�c�)��\n�qߧC�aR�$>�0l)r��|�Z]ʧ����T�\0y����p�)��\\E���b�~�J��~��+��*�~�m\r�3�-ߠ��\nZ��?�d�Z&��0�im}����jv+޻��$Z\ZkU�����|;q�Y�t2p�A��MƧ�ƞ=v��)��N3�%��h�*H\"���s.����@;S�˃�CA��R��Y8��p��\r�+n�<{��0\0�\'4�;b�kc�\\(�Ss��v=ǭ|{����}�$\"�H�á�[�ڱ�z��!�ED>\ZwIo��Lk�O�d�!<A�zR�M5��[@��!E	�i��0�(j%GP2��}�rQm�xN�p����̐vv��q�`(p����W�<���ϑ�D���#�$�`7#+;8�bT���5�.Ԩn؉3�PJ���`-�6s��㈘c��I��	5\0w��&\r�d���o�����������Y\\�<d}����H3�\n䛥�%�XX���ӂpʈ*���3�/¬�U;�A��T�t*%+�	G��o��v}�3���rQf�H�����l6\0�;�T�4v�2�J�q&&�/��?M���^���Xϩ��}W��0�\\�-ҿ��y��i��KE�ǭw�=�0VoRc�V�|;�`�h1��vPI�0���〒�%�@�\09��m��f\"2(�Z�Y���W�f2��N���<|rP�0�{)��(\0��v	��V��P���̘ɦP��\n��㘮@��8rSiE65�J����ǹ��L8�$�$��ak%tmI���i�L����U�vz�1h�n߈aĂ�=��0�Š������zv-4�hiZo�<Iۉ3@k�r;6\0#����+�[[�n$��ӧM�V�L(j�5�qV���®���ڔ�\01���5�1Zoz\n��ii�#�c�֚4�z�mi��{o�*�iJ�ثD��x\n����-�z�GC���N�T�f��6���)p�?mW�+S�dN�K�V��aM\nR���6��\"��^�<X���E6��H\\+�}�,(��~}�\0�!�*\r�\0mi���;aC���pa�Q㍭7S�Zk|\n�����p�]w덥�S���\n\\X��LQM�6���Z`)�M #����2 ,b���XKr�Q��\rɮ[m�\0��������8ґ���j+���뀲\r1 �|:aAk��tv[[�F�m���i�����02�ը�g�m��lU�pI�qH�6�\0:�, �١?��f\n�c�־��T��r�9D-@�F���DFv�O�H)֛t���Jױ��(�u��ٵ]NEt��r+�.����ƍ��(�B)N�̋v$�T�\n��@+Nd�0�7�G�X\n�k#�I=��r&t���gceub�G`�|�r�͖\'�M��}#�5��{�\Z�7a ��H�O\Z)�H�,���)�Yc�\Z�{��si1$��4o�zR>Yl�	[�fC��H��?!W���2ޘ���2��7��	ل�:�zm�!X[pƕ�Gl�q��v|`��_<�V�2r%C�!Eʄc!nYK\0xSm��5�S�1�7%�+���Xp)�($��������`rGm��ɔz��L�@����ɪ�$ǀ�\'|ˎ0p�I�g*SC�	�kӑe_�=~C���&1����1��Hi�GƠ��t�n#ە������QAP��!RE��z�a29�R�N\r4�AZ\r�NLd!�9l�Hn��aC�s:�r\0RHI \r�q�\0�JMĪ��n�	4�q��٢�O�ҸD��\\u�A���a��!����P���h���d��W�r���9�cD_$ܫr>�>4ʃ�C���{u�J@UO�%�\r��_�d�\\�)\\M6�*�\'��a䮭�1W��<q\n�O�*�O�~���R��*� on�U��\0����<*����\Z��7�Z>��b��׭VJ�~���ء��j>�(ZǨn�~(��F���r7}�_���P�xu��r����u��%�����%Wo�l(o��.ح7^�=q\'t:����q�����Jb��n���M�S��V���6�]�z�n�uk��7�����WWoՏ$��~����\\�j{�´��v��1��A�V��WeIm�Eh�o���J�`��B�Ją&�<r�L9`�-CO�+_Q�����yI�Q�XH��������(l���aZh\n�n�����Ѝ�6˅ā��aV�*���\\�7~)��\"kޛ`H\r�OM�t�Ĥ/_�0�jGO��-�Z&�ܜ�n�61�N�Im\n����PS[+�H\n�+w=2�H8�2�-�e���O��QLH���m�Y@+˗_�	\ZsL\0������s���m��DȗI��\Z��ȷ``eV�v鑑لņEl��\Z�&��U�S�.�Yod�ſ�H���\r�<U>���I�bVp=\Z7�@P���!D;6��˳�%����A���-���E���;v�C%9�]O{��a\'��ޙ��������X�\rG�O��\n��\"|jx����\"I�ڭ�E	�j��1�����_0<e�e)5��BX-�x#.^���)/8���@�8-#\0�A	o5���_�F��e���G�Y%�?T���S�z������.9$z����ĝ��=)�XG�n,b1��LoR+���2��ݬLL���\0=�&$�beޘE{l���u��^�T�Xך1I��0=�Q�~���H#�\rh=�،J<����`6�A�ʽ�L$��/�$j�H6+S^�r �������5|Cۦea���\nRH�k��2kg��棿�Ft�I��N��\0\06JFNX��U�Ө��k`1\\����Б���G����1�b�1�䉇N��(�e����ͅک{F�T�����$\r����lM�\r�A�W�Q��W�����)�[�C��ݽ������B\\���ZZ��ij�q�Z���ui���V�:t?�!I��­B�C�������ӥ0�Z\\\Z%\r��������k�!��^ݎi�Gl7݆�K��}�*�>pS�v�֝S㿾pc��h�(z��iD�A��d�:4���V��\n�bXp�mV�vZ�;��������7f�\'M�S��O#@>�\0�����V���<�>Z�}oP�Z�xJ8�d�t`~Y\r�cliܶ�R�[u��SUN����)k��L���\r�Go�A-<J�=�H-,�h��m�+d\n����Y�\ZAud�SJ~���\'��B�w:{��*Es�^�9N�a�t�+��9O��7x#��U��p>!��^�%\06P���q���қ���\\	�o߿�6�����\'\n|�)\\<G|���0����zv��B&&��ڹ\\�B2\0�_�m��1�dv1�-�$jq>�1I���#�Yl�g2��Z6E�� S����VzP�a�$��4��F{�y\0v�[\0)�a�[���(�#J�<�<Ӌ\r�d�B@���r�N�ڡ!Q(�f�E��(s��b-ƌfw�����©!��9a-����]�j���v�XAd=��*=���n��$e�4c��	�@	�|�!c�QQ�኱\r�YQ��Hi�EX��0<r��|{T����3}E\r��p�8�vS�\'��4�eA��\"w��:��s.7�����45%��呟z�j&\'SR(�10����rV�e�����Sޝ;�9=J`FM� �!I�:�Z�Q�m�b�e�5e��Bw헜m�\nI��4t@i���c۾X�)6�f\0u܊�JA%R�)U��A�MW#(��H��O��ZK���v9��-��e�*Ɯ��A�~�o�J�Y[��\n+Wa�Ιd0�m��;%Ҙ��jA����d��\ZFbMjO]�\0�Y,�����j%�9�s�gf�����\"���H�3�n�DK�����Y�J�Ga�Y��0���\"=_���t�<,��9�k^�xB)���jq䕢�m��=��r߮�V����ȥwj��\n[��^��:����wb���K���0�E���u������ክ-�z��R�I4�z�u�Ū�A�{�aj����*�On�G�Xi��?<(Yʿ��h��z�U��v=��=���A��	S����}!�\n��.�p�!	�F����A��-V$���\0f]qb�1I2���2�:�D�?/�)L�LW��j��b�n��S�2|a�H(�d�Z(_���1 /ѳ~;d�`Àw�t�Q_���w��+�������X��k�s�~�FX��-�\r��x�ǌ2�(�c<F�c�k���#��n�˨딐��\n�0o�>��Y�*U��-�u�o�N�q=k�\n�U��]�v�ۥ;��+����*�q?������u�`g\r�V������e�n�����)ޝ��%pe\r�KC!n|r�L�R=^Hl��\n�>��	[\r�Ipm����u��X�1�\"PL8�\\�8�V͂{�\0f$�l����M4����Ĩ]P��a����������誢�+�\"K`��������\0H��2�d�b$�-\Z��Ní6�GQ��?ę�Z�e�������k�\\���\'��!o���ay�9�\n�F�׷Ò	ٻs���(]�G�I0��f��r�w2�I��ނ�y�4<O|Ŕ�>|�F��[�.��O�$)1�\rRem�T�\0�A�.���\0p�q56����L�ڟNٕ6��@\0���4���Kyɩ�A=|@�rp��q(���x��Z�<Gb�2������\\8��O�@\0� \"6A��H P���܈�S[�`PǸ�r\\+��4�<BН���,�S� ��{�B��TP����LR��\Z��3bZ��bp9��x�	u�wP\Z��6��-��f�����]�xe�!{}������\'\0*����[l\"	���f�U�(ѕ�M(k��1�D��&�P聺��uU��^�����c�D����pqIXX�����t�۫��0��Rhrz�m�;��ۨaS����;jٹ&,i�`~G$\"\ZS��S\r+|����cIn�q=�8�=�6��v�L��V�զ)[P~���­r�H���ʇ��%�CA�+�>�U�G�Z��!Zf?OO�\0U���6�y!����*������KA�N�P�!_F\ZV���رX_����n�O���9V��\n�mO�\n��	�旛�-��!���oo�7O���^>�u<~��*���v=��^x��1����r4��넔S`���Wt�������\n\Z⇪��[-�k���v�ژ�.h=��)�������Zp#�]Zm�aV��C�_���QS�\0Z[@A��,�JxAM�v۾*g	��PG\Z�n��wS\"R빚�ے��M��#���.ؓ�qS�F�/�6�dC����hi+5�z��5������pMO���ݩ���}�dc�M�aU\0��-�\"#����ҾFVY#��� ��F]���ݑ�!T(pc_s�kf�.AO�}�QL�A��OL$�K�<p��q�kF���v�!IO|$�VZ!9���\r��#;br�u��t�*Yko+;��)ֆ�;3ix��V���c�4(���IN�\'�0xf<�h�g�D��Y4�)�[hc�-c���\0X�@Ȇ���;K$���%ח�f�il%׭O5>+�J9H;��ӌ� c��P^�Zu`T�L)�/Ňme(��kcK`}`ٔ��B�\\�;8�\0��CS�Qs�k/����	V�H��c�*4�`J|?�v�;�ڞ\n�6?�#��+`����$��C�z� \rZ�Wp2󗣱���h��\"M���Ff�����	*�;u�dŽF�MrL]P\r=���!%NIH;},�\rr4���\\�E;�7�r1u@\"N�w=��|��6ݴ��� G|�:��s�����s(8R+j�5��儱F�++z��@w�2�/z���#E]���Ʃ�[A��w�\01��RR$����KD�����$��\0kM�cM� S����(�@U��O�W�Xst�t^�ҫ�ӱ�@�-�\nd�/&���6�n�w�6�ip�֧*����+��J�����J�o\ZӶ*�-���C�W��ƕ�]�)^��[k�����tƕܫ�o�\\Oj��$Ui;|_�\0V�~;S犆��s��a�Z���Jo��Ҵƽ)��!abw=Ol@cm\'���@AZI�]�4Z��߅I�����ah��:Ӧ!��\0(iJo�}�����I>�\0v*�>����c׾*����LU��C��\0\n�+���MN����n�����ѿ|i[����z]��$�\\P��\r��\'\n]�1K�$!����\\m��*�o}��R��ߎK��U���\0��|�b����lG��ƭ*S��!.*�\"(ʊCuIQA�f|%��;�6����X\Z��C���i�T������zT�:t8�iu> {~�DW/��\0?ဖ`*��-�^?�=wʋhD�jA�<r	L�#�����b��\\\\ҏ\"���G9��`\\�.�@Q[,ܖ��\r+N����	�h��Fg��QSN��i��-��Ku_I��oZnDÊ����*T!*Nđ���&(2�\"K���_�\'m��<�T��|,�es�=<|;cV���u��?��r�S��Bq��F��s���^���Dh����$�@6� 2${�K�P>��-vr�S��f@��{��i x�&bA_o�3نXѴ���0c����(v�H�`��:�#G\'v�\0|�$����z�Q�*+Ҧ�O��FE��\"7���ۆf\n����d���ԩ=���f�n�1�w���p��V��2�AKFۙ��O\\<t�Z&H�?�h@�z�r�Wa�T��8Ք�S��K%eJ�n�Y�^ٙ�h���\nק_�[A��)�n+��K�x�P��ՂQ�(e1_s*IFU�bNF!�$ķB����і�A��:u%mt�\r�m����*zW���1\n��yTu��D��¹�#�f�?0\Z(ʎAt�C\r�GE$t.Y�_l���&�\ZU	M�M.���kKKxn{�U�B)�\r!�U�마�\ZE���#[a����ƕ���߯�Ӏ+���\0��0�\'oUūA���▋S}���gu~��Z�>}w��Ǧ4�s��톑k9����(k�*���\0\\Uo-��\n-o1��ڸ��\n�|��lK\\���C��\04����|1AZ�:�<4����-\r\\ӗ��p�׿]�{���ȫe�kOl(uM?�����\r����ҷ���@�w�]S��l(n��{bU��w��J�8P�\'�b����0V�N�݊�ʿ�S`�8��JA�[�;T��ث�۷|\\O\\mi����aCu��aV�uȐ���ڸ��^KǶK R��nJ}�)Ol�����R�v�fU����ӿL�)�;xS���m<-����pZx[�Ӹ�l�Wq>�\0<�Ez��r$�DF����m9����9?�\"�טs�g.ID�[�-�`�4���锑{�\nq�<RE��yl}8��u���*9b ��:hOs�YPk�!�\0{,ޱ(����5����\\�|,��:S��a_u�[sj���H�x�\r:Ugn6�z\ZJ���2<��H����\\m}CJ���|!v�K��?��o�K�c��|l��P���q��hW�N���Cr�yw�#��<w�2ɭ�cR�L_毹�����F����8�?��z�Q�)�G�i�ĥŤ�>ҭ(Tw�\0[*��N\'.�]�y\"���b�\0ѐ�%}8�%�b�}��ő��`#?����\Z��+,V��ӛ�;����\"d{،�;F_���)�&V*�&�t��㖶��\r���R.3J�\"������Fs$�f�2n!\Z�W�\02�cʛ���9�:k&*Pv\nծ�,3��-��kuT^�R����r<C^����m\Z�3FI�\"��e��Yb��M��:��*�����\"�\r>�{�$�R��\0�JW��D�i�m������s��l�Ų\Z��L�65�\\�TN�\\z��R{{a��vI*wV���j�#�q�%��;�[��?�d�\Z[)��r`��ƟF8��Ws���((�>�������l�8\\��YD�g\n��vT3��!�ј*�ڟ�28��2dbC���S9��\r��	���UGsN��U܉��\0�\n�{�T��kӧӆ��pO��d��<d�TW�h���\"��x{aJ��S�v۠�Xb�T����_����_-�Nk�6��:b�-Z\n�Ƙ�w/�8�E�S]�Aj��J�-C��>}��\Z.+OǨ�V���p��$W�A�!izt=zaCL{����ckI؁���6�j\nW��\Z[[����آ�\r�]��Ġ���߲0����)\rQ�~��}-p>��R�/|n����b���A퍡�i�zm����=��䴸�|i�\r�4�~�ʝ~�i��\0o��{�8V���4�ש�\r�\0�Z�zv�V���8����[��+N�����N���^8V�^���A�{!��LV���>�6����j�B�@G=����PSi������-�r6,�aA���m�2q�|��\Zl���%�T�Oj\r�<r��6��Wz����&<c��ѱS�����9t��]��x�����W�����׉��0�HaPyn�Fc���&H�v�Q6=qi�ֽ�>���*	o#Z��SK���,j{�Q�K��x�m��\r�!|RJz,��)Đ���do�7��\0U���K��7N�G�f9�x����]~��)\"���8�˖;3���f�x����>Q�#4�4�+]9����Ĺݹ�\06Bs����~���*�ɖ8�]��޵�?�\";�`6&���/�]h\n/�J�R��mn�����0$�.{q߈���ٯ$I�%�G�1ؒ�$5p�5����3�N�F���Ѩ\\�rI>Jwsa1Yx<�����cd��璁?�n�?�$U\\�wjft7ymn$^ ���A�W	�����ѳ0�5@#��|��LF1hE�f�8ש��ˎ]�@�o�\r�A�P�޾�F�;16R����\Z���GL˄(12��#��ƻ\Ze��e�a\"�d�R�\0���$.X٘\0*zӮ$�(�ӌ�	َ�c�\\�=y���Ā6ڣ��i�۹\nS�aE^��������CM��9w=�{����CN]�YT�s ��ʕ�9�J�r7�L+}U��R;R�.��Oٯ���H%h\'�a�{aC���Z������7]�ī�\n�a��=������-��W�*����8���^�������!Z-��~�(h�z}>QkIs����/����Z�� ��a�<Mr��$����G���[\\�o�4����ߧ�\ZA+y~i�������ZX��\n��$���|��j_Kn�u������L	o��\ZU��z~���)�*�]<;`W���*վU�\"�o�4�����)�.��8�V�������~�HZl0���w*�L\0-:���U���|QN\r��逕��W�®\'u|7�cJ��N�0n�\n����]���tW��Ɩ��8�:�x��W{֛�*Ц������b�n��\r���`�V�Xi[�~9�^#JP�݆D�z12-����J��+$��A�<�\'�mp�U�-�#��둻`d�HbZ�7�r$��2y+G�� @�5ˌ�F��!�p���\'�F�	�4[��\'V@:��_��(���s�IV��\\�6���g�@�]��8�ɩ�j���^S��s]�^�O)����\01FMNb\0��KO�(�I�r�ն:x����sr���.�mO|eI�8��z�����Z\0�Zd�[p�r�����k�>5�rѐ9�<Q�q��I�\Z7��~��Osa��.2�s��v�ZL�T����t�A�\"Vt$r���|��`�ؠ&���\0�F��0�Ɏ0�+��r�i���.Ԩ\0��@)J�\ZD���\\���M��T���%�߮�`�f�B���F}M�\nxedp�\0��FH`A��L˄��q���BJ�{�\" n��٧�Ո`kመ!�k[a#�kN��#<��ꎊ�b�\n���f9���(*o��\0K��/��\0Ɖ�6J�.�A�zf\\aAƞN����u�!�0	��D�e��k�-Q���11c3\"��V��(%���׮H �����s�k-m��*�#�t�ъJ�����}�(��֛��*�=��\0iZ��»b��JcKk���%H������-is�<:צ6�s��aA+9wp�\\H�\\i�[��G�����ْckKP\\Qmr;���(��Tb���p��-Ӹ�-��l:�\0����[߾(��Ԏ��ï�j����O��m����`J���1�����\0k�~���q�������b���q*�!�׮*� E\n�@��b�o�v�����m�\\Jӫ���%l6+N��a�o��i��N\rS�������`(�T�i\\Os����ZuM)�Zp?v*�-�i��+N�ш�Z\'��u��w�S��:����;�W|�5oj�|�����7J��ǆ6��pZ��t7�Ӷ(\\:�æ��{�������<���N&H\\6��1B�\n��Cxx��O�\ZC`��>�����R.+��k֭㑐hɋ�U9�Y\n����r^��\0�p�@�)�N����^��#	�e����f�76���\Z+7Za2g�UR��\"���ME�\'|�!�2�k�¼@(��\\����A\n��I<M�[���_V����> ^0�Kr��Q��ev�\"�����2�K�}. M?gwkPT�� \n�,��J)��\n\r�͉+^�[���ö29!�o\05��e\"�^�5�^��/�A+U����S	�T�jpҥ���x�aQT[��\n�A�FD..�G��jv��آC�I|�$�\0��fL�Aǆ+(���ua��2��͔�߅>A�?�JS�k��8�@{� �!agSFޟ���]�0�|F��1��|HjS~���mi�E6\'����F��M��-,kJ|=�L(%k8�F�a�Z�{ӿl 1%i��}�i�?���<KyP�A��/���N\ZGE��;�cmW���R-�{�8V��^�F\ZcmW�4�V���h���\r\"֖��(��\n|�Qn���X�5Q�cH�j�6�8���\0�Ջ����ki������0+jۑ�\ZKa���#I^��k�&���ؐ�W�7�~g�\nm󧏅24���~�4��׾����bU��<1*�`w�־:%�^�v�������[�߶o����6آ��+�LV��jc]�M�;`!�qV���+M��ӹ\r�ߦ!�;b�����Zo���Q���!Z��i���x��KN�w���uO����)�G\\mi�i�!���J�=��m�����\n��Z)p��Ju����_]�pR��AM�V,[���pŊ��c��6��n��ժ���a��M2Xk�)\rr lv��rM,%����eK	���d$*()�Ǫ���@R��}�Hy�)�t���A�c 97��C R9\0Q�K�2�~�?i�A�$2w)��4#���\\��,I+��v)c����\0�d<Ь�F�i6�s&<\'�eHIer~�S�.�Z�OE	㖂\ZH. 5\nk�q��b {�8�\n)�1\'�s�O�m!%ޣ� �Z,Xt}�a�@�͑A\r�>(+R�\Z��2\03%H�O\\���\0�>��$��r]�\'����ҷ����)���#1%�\'�\ZL�FRz��|0��Ͻ�;(��޸o�J\r	i�c���rK�H���_�F`�V��\0kA-�bk��4�������uH�!�q��0��t�����3�����u�#��g�톑��.�i�E�_��<n�>�X�5˷~�Pd�m�S\ZG�bǍo,4�\'r=>�i�\\�1G�։���澟F����M��]���������a�k��6�&���	��m���ܺ�@�=�������\"���Ɠm���q}�={u�Iw�R7��U���S�%�~�;�V������<6�J�1۷~�*հ�񤻟�Ӎ!p~�z१r߭pV��/�p+����\r-7˵q+M��pRӹ���V����/~��)����[�MqZuE+��k��:��q!]����Ǣ�`�0rC`�SB�����P���Ƞ������)x�s�ؕ@Mp�p�8\n\n�_m�`ak���l)�N�N\0Qm0���ͤ�7�E;�v�V\Z�\0C��f�q��B>xC ���p�ʖ�!��p�ZI�%a#��ɢrJ��n��������KI���iVr�_�%I�T!+I�ӷl*�]����\0ۄ���H낖��5w�+^�>��8xi\ngpi�m�6�����x��bB�6�{�2a�Eaj�=�l	[�C�5�� i��$�_�翆$�-�zaA+Ka�6�-���i��O��\0�e�������*k����C��|gz��Li|`�T�ƒr8�}�<m���\n<F��Ƙ�--���8�����Q�4ǉ܍:��G\\�m�c��l4�\'rģ����8��O놐d��~���ׇ�v�k��;p4��Sk���v�[:}��x���_l�w-��g��v����M��)���mŷ;���lm�?�{�����G�ǅ[�Б���2EO�Ͼ4�\rS���&�\rᆖ���ps[o����}q��bM��`���+�4��}�:�վU�\r��R�[�Z{�J��j)�ƒ�.ݾ�Ws��|iiw=�����s�\0o\ZZl7l��a�x�H��~���\ZZur%\r�Q��-8���[�2(l6��V����Hl��H\\\n��ȡp�r(\\�-Ƿ|��Un�vF�E��U�ݑ�U{�#l	VT�o�6�J�:�ch��O��8�jR\nT��EE����Sn�;d��fپ�Y�������dـ���LE�-,7�%Ig.�@M5ΟO��\r2�����%I����$-4�7�߄���ӆ������\"�L�\'å0ҭmJ�!Z�k�4�k����4�p��w8W�kH�ۮ�h��)4�ǿ��\0k2X�}�!��I���vɀ�)�2o�|��Q�Zd���Ƙ����0�5����G���kK��4��܎ر�h�O��Lx��?v4��܅qc��]}��&�p��w.�24�2[����ˉ�_zv�t���)�A#����]�,:S2�� �����KU��k�;��j�l1.���Ѕ��֝��o�n���o���1M���L�n����[o���\Zem���p-��\'lim����\Zd�,\"��4�[�_��&����-�Σ��|�Jb�p}�im�[\Z}?,	l�8�w?����I\\a�0�|�Z}-��s��)-��\ZW�~��9���cIl6�\0�0R��킕�]뷾���{���\0h�U�g��iw<i�T���ܻ���r�炑M�ȭ6�݁�?�|i���\0�\"QK����6�E�6F���~���,UT�ူ*�\\�U�׶F��QH�#m$��_�|��Q���|=�S5�q���Ξ0[AC:䭸�N��HТ�&���Ol�`\nE��L`)�7�ɆB+�!t���.��t���\04ʖ�o���Z2x��L<*�����Ui����\0v<*V@ؐ>g�d��&@,i{w�Ɉ�2Y�nj>�\",8�f���xQ�Mzݶ�pp/�4�*��$\"��X�﹩�\0�SZe�Z��B-g\"֘�c�\Z`r,2w��d�j�֗\'�\Zk3[���L��>�,�S�5�5Q׶4[�,8�N���1%�Ӿq5��U��\n-��{�j��bė�[�n�~��6��ڽ�e��w��x�]�m���~��\\i��v��_��E�_��mmF(�W�T����6ڲ=��~�:S�e����n֌�����\0�0VV���Mr�w1����;�r,�w�6�]��V۩�6�qK|�Z�Z傖�v�m܍=�M���;������1�۪G���n�;�a[l0�6Ȧ����1M�Pk�-��rF\nen������m��}\nm��$����E���O�Ɠk�T��a�Ӏ��v��[ju\'�;�HM�\Z��ӉKu�\0k#J���w���kd�\Z����J��|~���\ZW��p>;ثu��ȡ��o�ȫ`��PWW�\nW��(����B��週���t�(+��\0���%Y7 ��ZʺW Z���I>�Z$Q��A��nNår.4��K�5T.�E\"������T� �(d�l�\0ҭ�\\��C�Ԡ�Z��F��2k��\07�ʜ�Ƃ�� $ף����6m�œ��B[Y��&�B���<;�bM�2��IFKi�	����6��F�@��T��\0���n��U$5�\"�$6rE�aFT~`���dKdO����~�,��l)�1Z��Ya��-���c�f�Z�4j���X������{ҦOC�_\Z����AZ1N[���8H%��]���o��$A�6AZ�>;����5\'����dKL��S�N�\'M\\T杏oo|DX�1Q�SA�\\�c��/�\r0�k�N\ZGl��)L֖�&�{�M�b�ɪ�a`K�o�Z��(%�֣�q:��cLIw-��h���A.�\0:b�Z��b�v(%�����,��`C����C��6��b��|1C��WV�<w��L*K_<Uğ�(k?���8�r;��1S�\r1,�9Gx�xo�bn\\ˎ���Lr���7���\0Fë� J�<Xn>���v�{^\'i����J+��w땘��1j!1�d���d[����Sm���[k�QV!GJ�A����<.���1&��?�4�0z����灲�u�{�b�po�������\ZM�\\�o�����M�^��۫֝16�_������0R�|��8��0RmŻ��a�m�G����|�=����]<0��\r��\nH-���$��N�8M�λ��#I�ܩ��>�i-���\0:म\r��HU��@>�-7ʵ�o\Z�`��5(Ed�zP\Z��\\��)tq��C�#�r���/����U?�,���G]�����l����줍��p��\0����?�����1N0�w޴w�K�2�`{sA76[)n�w$���������ٮn��\0Fzv������[����\0�o�al�����?����-��l�\0ح>r\0|6{���?ɿ�k=����4V:ݍ��1�$�fǬ��l�C���uE�����-z|�c����M2�y�Q��%�n��tR���\Z#�L�S)�g�Dھ�=L�R�z��_>8�Z�hf?�(�\0S���\ndf�I���D8�<�3&�aa�]�\Z^2���j�V�(H�b6q�N<��6���nk̉��D���z|r���_�������r��Z\0��\\���9�b�r���GL����8#mwlG��\r�d���2�\0N�b��&��1��t��8��0���v��Y�rC��ïÓh�<_���0�~%5pG��)�<n�ز��a�@R�F�e�Z�\r���j2b�q#ez��֕I�g?T�t6`an`x�\0�F ٴ�K�w��8��CL��Ri�\ZYG�Iזۊt��(Z�@:��d�i0���;i1[N�$Y�DbćS|6�ѧ~��ݍ��\r|�V���������\Zk\n)�ch���bCX��&�P�B)������\nU��5���b�����������Z�?��H��QmW��m�X������������V�K�W~�V��o��߮�\Zm�?����\"�x���O�\"`��B^�Oҷ~#�-�ʙ����=̳�)\Z���예�L���7\"�������\r*%��j�0�Nt5#�������\r�������&��;qq]xկ9W��JPS��ڹ��?�UY�i��T`8�t{g ;�ITkKM�#ƍ�����:������(�á�����8��j��Y���#�G�-��\\���\05x�l�yz����q����/��-�-���Z��\r�m\Z�5|p�A<F��M7�:`�-�Q�P�\0L��5 �<A�$6��yS��\ZH��Z\Zt>)���~���88�x��;�Rm�{���x�>�|�[�:t��L�w1�F4�m_���� Bml�P���0v��@�L2�!�\\�h|�l�U�nU��9p�H�]F^��QȀ���e����w?�M�GO���s��i�ܥ�<��ܟ�9x��T�%�R�̓M����V늻up+��.銺������uqWW�Wv*�V݊������D[���0h&d�j�mۉ�+�(˘r��sb�e/��ſ���\\��Fi_�-�SЏ�.�o�G�U�0k\Z|���P��(�+����&���`�#bQ��rz&�V��U�I�R�q�	ɖ��0�)������7vS��]�Y���1�/���U��\07`���8<	��L;OO.S�����ebz ����!/�P���V�;܌�w�ښ��Ğ奁�T�c��-��M���a{)�Rz�&�)�BI~�-G��F>�U���>�İ_���q�j���\0^���яm���\09�{\rX�����z��p��e�W����4���q��y��,�7G�b3�\\��UX��V,m��=�5�qE��N%��[U��\r�b�u�,]�����v(u@���0%����U�[����qE��}�$4N[D�\0��\ZE���5�W[������R����*�⮮*�U��]��up��+���+���\\R���]\\U�튶��S�W	\Z� ����d��d����\0���4?� a�ˇh爡%ߥ/ߝ�Z�-�ʙ�\0���w�k������E��l���\0H��;���#���|8��%�y��.�){���=̿�u�ljנ��\r|@�!�ځ�_�W.�z����+��8��p*�/�[�5y���px1e�����T�S�n�0�P~����]��?�$3�9%�f=I�&8���x��b�qCu�]��v)uqWb��v*�Sn�]��v*�Uث���uqWb���]\\V�\\R�⮮(uq[j���\Z����M�r2���b6�z���e(\"��.�g\"A�W_�egK���9��~��ꫬ�~�/��\r����U�U���#�N�ɇl@�C�y�-��i�9���W��qt��N�2�.�[,����j�rn\r�N(�u�m��\rW�aC�*�D�,q�q�(�*�x✀#���0�Hs�/7�ӡǄ��d{�ѼZP)��\\<,N�tM���ǅ���s���c͞澶O�:�W}e�|!�-��\r2��^�cH�ˌ��)�Z3�li��Z�ψ�H9˽sゔ�.���a�x�o�n��/�fli1Zes�\r19\\��\"�O�(�W[�q[j�V�_V��-�����ث�WaW`K��]��v*�*�\n�U�P�	v*�U�(v�v*�Uث�Wb������Wb���]�����uqWb��]��ov*���.��[�-b���Z�]��v*�U��]��v*�P���⮮*�U�*�\n�U��]\\U�Dw¶�H{�.%���8R�K������ث�WWv*�(uqK�Wb�b��*�b1M���m���v*�Uث������X��_|U�®��b��\\Nv*�⮮(������Uث�+�WaWb���®�]�]�]�]�]�]�]�-�Wb�`V�W`WaW`WaWb��]�*�\n�U�U�ث�V�V�Kx��Wb��]\\U�Uث�W~��Wb��]��v*�Uث�Wb�b�®���v*�U�P�R�\n�P�o�6�Sk��)��1M���v*�U�kv*�Uث�Wb��]\\P���]��j����Z�qCa�H-�8��{⮮+n�*�qWTb�����P�l\n�*�ov*�U�Uث�W`WaW`Wb�®��b�b��.��®���®���]��v*�Uث�Wb�®�]�[�.�]��v*�*�\n�Uثx����Z�]���*�U�Uث��[�Z�]��\n��Z­↰+xU�Uث�Wb��]���Sk��6�*�R�U�qC��m�Uث�Wb��]����v*�Պ�N(k�vvv*�U�U�������\n����ءث�Wb��]��v*�U�U�ثx����V�+x��WaWb�`C�K��]\\P�-�V�V�WaWb��]�]�v*�U�qV�Wb�b��]��v*�b��]��v*�*�U�Uث�Wb��]�\Z�[�\\)v(kv*��Wb��v*����]���8��Wb����m��+n�k\\V�X��ۃ����m6��8����\n�\\�ӊ�a��s�¶�=��[o��+n�1[k�k�*�X�ۨ�-o���7\\V�\\U���\\*�*�\0���>���~�xr)����O�.�;җ��8�_\n}�w�)����6t������l/�>�;ћ��8��S�l������ca�\0�\'z2�\0#}��O��w�/���K�N���F�������J_�o��O�M�R�\0#}��O�N�e�F��6�O��w�7�7ݏG�>�;ї��8���3�l������x��3�l������l/�?���+����_͓^����q���3�l��K���l/�?��ޔ���q��<)�\06_�]�KӁ��6t������l/�>�;ӓ��q�����JO�o��a>����ޜ���q��<9�Iޜ��~㍅���\'zr�\0!��6ßt������l/�.�7�����8�_}�w�\'���˺N���?v6×t����Oׂ݆]�o��\0)���pK��/��^���S��	�w�S�ck�{��\0������q�ci�=���?v^	w;��\0)����r�|�Oݍ��r?��O�N���Oݍ��S7�S�l#�d�NO�?q���S7�S�l/�>��w�S�l/�.��w��?v6×t�һ��\0)��������S�l/�.��w�S�ca|9wK�+�?�_]�w�S�ca����\0)��6�O���\0J�M�\0����_\n]��\0Jצ�\0�~�l#×t�ҷ��\0����_]�w�?v6�˺Mpo�ׂ]���\0�~�mx%�\'p�8��K����\0)��Z�K�N��\0�~�6��������ax%�]��_]�w�\'��pK�N���S�ci���\'zo������r9?���_]�w�\'��k�˺N���Oݍ��.�;ӓ�O�q����\'zR!��6����NA��8��r�~���~�l/�.�5�I���8��r)?���G�.��NO�o��a|9wIޜ��~㍧×t��I������˸�ғ��q��r9?����<9wIޔ��~㍧×t��I���m�kҗ�ݍ��]ſJ_�?q���˹ޔ���q���˸�җ��8�8%�ץ/��^	w�9?�����K�ޔ���q�ׂ]�ޜ���q�ׂ]�zR!�����s�9?�����K�ޜ��~�mx%�]�����ck�.�zR!���p�zr)��+�{�������xOs�ҁ�8�թ�0����^��Uvǈ���H�M�\"�V��~<E#\\-�k�Ӷ6S�D.�\r�GӾ)���b߯����ů�E����e]�X�>g|A@�}V����[/-�Z\n�ú<8�[B75��n�[��5?>��v^]�hh:�\\w^�ߡ\0�����-<1w�����|wH�]�xO���+��ǹބ��LwO]�A���-E�J\ZҔ�|1�z\\c��cH�hH�Ji6�٠�ژ�����[D(~  �S�)]��\n8�ڛ���(�{��Ǆ/���8��q��Mq^�m�\n8�Q|xQ~N�-�i�\nhw;�S�`�M��)Шǅ4;�z)Zq)��A�*���#����ܬ���(+�l�\r�#����\0u��\\��6�r!`��p_}��5^ �����25�l���ZxPv��[w���\Z��9�[oЋ`Q~�涻Ћ���66�T���cI�zoD]�\0Ɨ�ބ`��V֘##���\ZM���}�S�6�*��\r�zIӊ���[hƽJ��DBڙ�j~^�`�M��*OE�4rȀĩ4)��m���T��҄\n��l��Y\r�~�����c�F�]�4��N���+\Z4ڣ�M��\ZͩM�~g,��m^�\Z7ZQv�4�o�����M�p�Ƃ7wPq\0\"�ҋ��K\\Tm�mq_\0\Z7w�O�4�{��f4�\\T��\0E�S�_|h\"�|Gݍ-�q�Yj��0R,�Ta��Z�M�\0h#wkN�.��[���\n�T>;x��u�A\'��?0{�ڧ���A�T�8�]����Ƃ7k��8���\Z{w��Ď�\0��A�CN�aF����7k���h#v����Z��آ���s���8E�Ӂ��P�����.��+�o�=�`߽��ւ�9;ա���W�z�\ri��*�>�qn�|��eĒ����l�Z�>\Z/N��hH�8��	�P2�AN���N\0*H\0��m7S�kL	��U\'���i���\ZlծM�:w�ߊ�N�W�0[*�MH�昦��qcC�J��a��cn�����%h6�(;�o�����	Pv��8wa�e@���񴘷D���lk፦�N��J�\"�!o\Z��v���޴�� \r�����:�R�t?��G�h\r�O\r��k�9;����ൠ�ENö6����;���lHk�O��p�)�O~�-Hh�[>����ٽ����\0��G���*\\����%;7R2ت��hFE�&2J�Z��2�wn�&&����uʤ2�]�}�A-e~���LHh���WW�6��}���-�\\7�@���<1�J\Z���d�Z�\0\n�0ZV��0��cO�rlÅzv�B�j{a[�I�X�V�>y0�)1ڽk�EJ\ZF�yu=<i�ҍw�l�Y��\"�����[�Q���\0LT,n�t����ԯ��L4�z�|�I[Z|���\07�xU��O��;z��(j���qCU�����N�Z�UN,-���(p\"���8�wWo�-�ֿ��\\{�1b���R�׋�#�b���4�ኵQ�m�5���ZS\n��\0�+�9�\r��{��|�\0����v,��\0\\W��k�;�Ɯi����V��8����k\r�����)��!��i�퍱��Ԁ\njw�5�G��nv ���B�#S�m�\\���PO_j��4\Z\0\0��N���L��G�����G��\Ztq�׈�xx�wX\n�T~��=����۹���1c�o\n�����y�P#�R�V�vl��R�$\n�w� �7q�rO݁#�١�I��!m�D��ƀ`�V��1?*��l��MX��w���Z���P��]��ၘ�[���\'%L8��*jEmӵq^ y5E`-���ĄX�m��܊�������\n\Z5aLxTL-�F�j��ݏ\nD��z���Ԝ\",e=�e�����-�J��:�����]j6���#6���t���_h-Z֧�\Zc��MA���?<iL��ژ��x�5�қbwP[���`$���&�.�R��HH�𤝺�,�{o�ߏA��Pe�kdL-����&�\n&5Z����veh����P[kJׄCkE7S��&4��55��Guo~�	ȡ�����|i\\I=^�\rR�H5Ҵ\r@�^�)V1&� �Z�5Ɋ�`�*v�\n�\r��~������㒭���n�=NN(bM*���̀ڔ�P��\n\n�\'\'�Ku*�>�k�l�2���o����$-���Sゔ,j�%��ɆRb�l*rA��k�\r%m��|,����w���2�4��\Z\\-T�O,H[J�v�4�wۧ�� }���{��¶���q�uMvڽ�%�O��i�||F(uwۦ(%�Mi��\Z@پկ��������xD�\0����φ(�-V���.����4�C[�u��6�\Z�(=��_��*��cl)��{t®�S�T4�G4N�>�(�j��ꃰF*�p\"��Ղ*���0m���\n��}�´$�\'��VV��l(��O���S|���{S���̅$Ӡ��Lx��uۋnONG�#����$\r�v~��!a������	$t�>Y\Zl٦����x�za�ǫ��V�S�G�\r�w\0��-2�p ��N��xX�Y�uK��c�S\"m��(��N��4��������Ӧ5lx��\09�$���!v=pS0wq=1\0���8���r���Ҕ����I&��xv�6D�JS#�Ĩ��뒶�������B��\r0QH���ڑJs x^�8�޷�#q��{��A�\\�Ez\n���D��D4Y� �H���bI洶� t�ěq_� �5⢛ҽND�\rT���n~�(�k�����C6��C����k�u��V�kA�z�R\r�Ӷ���5�}����+o�6:u;���!#Ǯ�	d#���Oq^�7m\0/E4�A����<�\"\rl��Z�����#(�eF��L�\r��A$x~�(Ӑ\n%Uh;���㔒RW� ҟo�\"C���H��Ӈ�յc�\Z^���0p��<��x�![�+� �j+�@\0�4�{Ќ�w!�H\nW�pEB�~[qbz�\n��YS��?ߠ\'\Z���[\n�=(0�)uG�Ƿ��­G$+�N�%Dt@w%ڬ)^���J�Π���QS�[}Q�e�׉�O�]��79p��ĉ*o$d���V�1�,��S$\0\0�:�PWx�j�f$\Zx�4T^XFރ��Vbrp��Tr�G.�m�LE��{��&�u=	�L	��*h9\'Sj�~�%\"�Aؓ_�Ƙ�ۏqM�Qdf:��A�����A;-%OL4Èw�Ijd���ZH��b�ɪ���Ă���؎�����ƐfڐkC�0�=��˶4�-�W�����u���Ew�N����-s��LAս���`uh�4Ė�v�^�@�ui��5Ɠ�q\'�p�������l���_�\Za)����H^.�$�L�\rڻ�B��=O 1������[0�-ԟ�*U�\nRof��0���ƞ8I��\ZQ��ցՒ���u$��OadnW]������k�4�{S�m<��S��4�I���g�@�F��~�B���I��\"}ˉV\"��ӥ)L�e��\0YË\0h���v=~�MiԚ�W��&�����6Yz���iLi&T�8���5?�\r$+�]�:Go�@���԰rT��J�5����}.��\n�w�����LE��Ƥ�E@��W5�EpC�F�rTC1.c��w+��T�gc�z[�N�� o\\𻑴���楸���2\"�Ry�PI�č�[�m�$�h�!���6\r��H�qT��5{�؝����!��V��@$ӡ뇣Q$˚|=����\0g,�81#��}��\'�\n��z�#�H��>dȯiM���d[A�nV���D�S�1;\Z.z֝��K�a�����|vYX��}F�V�\ng�+�N�=��HX���;�N\Za��i�|ﹳQA�|A�̬�͂�\n��S�4�3\\�<v�߭zW\ZG�mGBۂ7�z����>��Vf���|?�V\"���z��z��\0��&�G0ܫG##�u㷎@�bd9X2)rT����#Gg&�i$vp��(�I���0lov�EF�T��r\'c�\0q�������?\r*Н�Э�{\\�2�UJ�К\n�9BIm���S�	>G�5Ɓ�M�,�c�0��~�9U�Ef.���&4*��T��)U��(k�� nԌ�P�;��\r� �nĄ�$[r����e�ƿ��D��*�UW�#ߔ�5�r���6�-��̦��=���R(3r���2�f�/:�m�B%��`��2�,A��RͿ�W�,X��\0L�ҫ\0]�Z�^�1	N$������ Ҡm�\0������#���|�0�k&�7�R\"�\'��>�^���!����d\\���~�٩�+����}~�=r`��$�b�9.F��O\\h\"R��%����|,	�<�#p6ƙ	W0��6;W�LX��oM�7��ޗTlSW�k�e5�0�����I�k�\n&4�N�S��d�A�F\'��C�q���6Wm��S�]_�}�Q\"[�֕����OV�·My�������ي\Z�W�_��D\n�O,8�i\\��z� cH=�П큝ӃJE?h\Za��B�q�(\Z���m��i�l�I�����\Zc�aۍ�w�ڧ\">/��<�����;�h�P>x�룋l68B$J�[���;1����\n�Ь���<q�`7Ua�����b�@�PO���8����rG��6K[�M��b�H�����h|	f1��G�_�WEj�;` �M�b#pZ7-;xR�� K��7ShąC_���%ᖿ��[�G\r�.;���N5��3��wĊu��Ӑ�ɨ���&�H����Ć��i��K05��a�D�%�WR]�8�QOw�\n-�@�R���vU��O!���-d���P�\0z�H��t��a��Nw���͵I>��~A�\\\n���Z\r�\\�?�m�q 1��0�ym����G�RO]�$[�4Ce�$4dW�ژ\0ffI�[�ԧ@>ѧ��ƙ��{�����T\0Pt>�h5JS;��p��>\0Ƶ�1!��{��J-Z���A�S�;�.�ަ��C�\0��d�\0�I�Yi֕8�C!�a²OS��)�\rk�4��iG�ۇ�Á�u�ҁ���Ϩ���W�r�܏S_2v��>�W�]�����wG��uI4~�t�1%ux�_��\n��26�S{О���L��-�:r#�i<?�T�`k�NE�����֠���,�͢�)ӽ\0?��$\r�s:��+^�\r��醚�Q�ܨ�;����@w��;m�҆�\0�VC�-:n7�x�ߗ�z�mQ�����Pد���u+��\0��Kl@;*r (�B��\nu�`�-�\0��Zݭ��\rշR>��LK�7b��GX��}�EF�\0�L��.nM��Z�}����p�\"T����PMNƴ�,�(���Ѵf5Y^#�#�����Gtd�b��\\�`Rgo�i����r�����6nmm-\r:v�0�C�;?L�����2�S�`v�e27ʹ/��?|F�,O�B3��w\n~� !���B��w�F^���6�m�a�I�֟H�,��X�{����HE<F���	љ��i-b*Hv\n64�>�e��ɏ�ٶ%8z�W���eߒL6�#���V�m��?�6d�iiA(I,��Ϡ��\\���p��Ö�P7�Y¾�|~%E��N#����������S����=��\0H�Q,��G!�\"�~���\r1J]C�����~ۑ��	+�3./��^?f�A�߆\nS8�\0NN`z,d���~�#މ�)p�hW��<=�w\'a��a#m\rO��k�ܘl7�N�|G�+�\'wv�OLP��4���w���o�݁$wI�h�)��ٍ�l���û_��-jF���Z.\0�n�A���\"�	��qg��x�H3#�`�s��+h���6=w��r\Z�z�n��^���r���A��[5\"������	�p��긒6\n=�}�\'~T�f=�\'��Z�>C�|���i�����c.��JT���+B�q��o����z�Oʘڀ�P�\0A�������Ɠ�\n�\'��\Zk3��@zt�S2��r�5�5�v�B�5P:��8)��ͮ��x�\n/��\0��b���x���,\rs��(߉��4�c��Ѐ*~��bA��ްG�����΂� �\"�bF���>\',���o����Gs�1��S�E*�;m�pp�n�!�ajƠ�N�ϦH��	qn\Z1�#Ue��V6Ds��&���E{���d,x�?���zt��[D�E�\0B�A&���z��\"��id4!�0��LLZ㒶<r�\0=�y+EC���\';��(Z/ <��\0��06�\0b�1!|`w>X�g�2?�ix#T����pU�ơ-���z�Qž/�������[�Tq?dl(k���>�°�~��O�#Yy�\0���(5�(+_���]\0��J��n��� X�k�z�\n;���\r��#��ӑf$��H,�ʮ�G#\Z\Z�t\'\'��0��\0:�^jvCˠĐ���8��$��w5���{\"2�0?閂k��_�$�$GO�냕=(v�2�LK�&��+D��#���4�xZ�_�.R�w����#�w��\0L���OB?�\r��\"9n�7&�O\r���yIyj�C���2Z�*7��vŘ��-J�����v�AZ)ڃ�L6��Z��RO�1@�8����M<	4��_ʠQ����;6�W^����,�l����(������K(¹z��g���=�=22ަ��u�ڢ�EZ���ԀS�8�n�B6o�?�]\Z*�R�8���yoڦFR5��,Dn�����J(5�Ktx߈�\0�e�B;������HK3��\01d��\"q��+�\Z`�,Ƶ�Gˋe�|-��Ĉ2��ٗm�W)\"����? s���2������$\rԤ��<˙*?��\0���\0E1��TbԨ?yM������Ū9��%�jн���Y|*�Y\\���n�Ĺ*�[��ƽ�ʣ����H��ܹPt*jk�$P�p�\'.ۚ\n��/�;��,�uQ{��AT2�����QɌ&�h�� ���%��f嘕\0�w�#	\\\rq�c\'s��nmKRȬO�ߊ���T��O9D�?��Mi�Wgu;|���_�bg��⒗5,\n�<GO�,�q�H��\r��7ُv�?�\n��Q\Z7hx3ToM��q1G�F�2�I$�jA�i���$�)R֝�cP��c�h�IG���.U ��bp���2R�� ��r�\0㙑���Bgaĩ�5���3K��L�\r_r:�(��pm�F��ȶ�9�Rh�G���\Z�,�\\!�\0�\Z��8�(�y��P��&�\r���@��r���̣r��Q�v�YWm�Ol��*Epo_p0[(��l�n)�|	��HjW������p���w��8��p�k��е��\"����l#���M��lV�A;��*��h#�lj�����W��eѺHG^\'�fG��\0Ek4�t��|4ǊAg)	�a�1ه�5��8ѩ�6{T�n@�N��7�%�g�\n�>C	��<�N3��Li(�b@ƕ5�ƙ����������^#���lN!�Ѣ�aN�⃳�ԪN���+9�\\O� H�|+��\nS���rS��p���w74�\r ̹���7��\0JF�������^�X�������VS/����~�{I�f�\'��s�>�8=)���\nk-�#�����d�G{Dr�x��\0N�.�Cp��\0$�\0d)�� _�O�I��|H8�܀�l%9�}?���b��x�~����4�8�\0�n�W�eZv&���ݴ���l:�ũ��q��8�<_�ǖ����ۧN�Nk��.B_�[BiPh<O�u�\n%}v�Mхަ��45�xM� ���Y�,)ʕ�qJ�1�m�\\Q��ܒ�@*j@�F�}0\0Ye�6w����7�\Z摘K����\0�T�<��y�m�)���5��1/!Ʊ���`wɂ�!Gn?�5� �\Z��/�DZi��R(7��\"  �\'h��fz���\"��\rD���M�\Z�O�5�O{dDO�]ūFz��6:10�;ˉ�W��ڬH�I�	���I�J�}�@��G%Q�h��(=���\\�V��\r?��\0o\r5JF��mI�ޛTa*$F��q��S��2�#�8(,�{���h����]����{�f��cZ���`(���y�m|1�%�45 �ȶ�94Bu�ֽ;�\"ܩB��֘Qq��M4��Z& �4�#����/�*�9| :J���j��$4%W��k�L�í�N�j!]�Ɨ��qY|m\"��6�h��\0�m��rm�wc��:#�GPN(�\0g�:���9�#yp�KD��X�N����o��G��\\q��X���n��b�2�@)����Nda�jF�k`O��:�r��>T�xP��:X��X�2h��W!s��鑆3�\nv��\'�l��+�o�nJ��5�Շ�d�F*Mz���瘒PkHgݘ���|��bN\0�<~��Fe�ࠒ)ߖYd7A\0,(h�v4�B�0���*$�NU�C6��)O�d����\ryg_��\0�k�ZC�쮭��зѵr�7�����R@�q��-Z�9Rk��ʉ?�q%�k�T��J�bS�7\\e-�g�$ݎ�V��㷨���Āل�d&ĸ4*�^�r+������,�0�|_�)�#��7Z�\0�`�L�F���r�G+#$T�Q�\0ɉ�a��\0k[���\'bp�>י$cN%|)� |d�\09o6���IV�\nֵ����$��kZl?��$�!��H�Ƭ��5ɀ�<��8�`�~�`�\"�V@OX��i�\0z�Z�V\0��G�l�GV�!���{a,A��P7 �\ZI�{\\ֆ�+�vƐg6w �ڇ��L�������\'cͲ({�ޘiM�$~���ͭ����߿Z��!�ju���m͢T�����\0S�V¿*�a�+Yd-P��� �1��ק\'����1���s����o�6�d�%����&3=W*��p�!��\0�`��l�m�Rh��w(k�8�{Щ����{�O�j�w�(빕���s����1�cI���\"�����~ W�CQ��o�=�ぐ����k_�\n��6�bw�qb	�ֲoZ�6�Qj����+E�����οd,	=������A1m��|�ާ���ƣ&=�4�<�8;ф/\'���]�6odx8��O��H�\0�({s��L�0�7��b���*q=���@�1�����;��i�VYc��ُ\Z%j{m��2�h��Z\"�הq����=c��B�c	\\<EN\r�x��:�����g�8��?�}.\\o���ug�q��#��\r�A\0����d6h��R��j�׶��	H��*z�P�\Z�ք��d8G{��d����ҁ<zT�l�6 �t�\\�e�}��\01���r�\0r�OR�S�밦L�qs2N�V����\0\"R��Ԩ�T{�?4���\'\Z�u����\0N 2�-Â���c�TՂ퐁���H*}��͂3�s)�(�ry�)YG��e:��\'aҦ�\'���(�<�Ҧ�2�wߦ��$U��2噩@6?\"10g\rEmM1��Ǿ \"yi�5=\0J#]Kj�ח_M���{��\r	߾�.姐��\0���L�R�6\0���\'�Ű��oM�x=�5�A�넔G{j6�omF.�ð�A��-�ҭ������Ґ��A�����h��bT����i�%Hr�ź��	�X�%U��\0O^C�d7otcĩ��<�����D�a�2�j;kG�������\0p����鰓�����+VNu�q��N<������į��toiHTp�&��c�H�<݌8@��+�.N^&��n���~,��mG�D,�! ^A�\"�j(�>9O�yz���%#�*b�J��M�c	8��q01���#+�Q��&��(i�y�+O�䣫�@��&$y�\"�rıE�E��\n��J�RQ�O���-v!:��\Z�c_4+F��PĤ���.�5�o�UE�c��f=	��ӶU+\'n�����&�2V��\n���G�?�H���N�BrF�@x��FJ�5��ăj	H4�}�\0^eN��%�+ӇJ�v#���FM��72�j��Oj^F��L:�4�f�nOڠ�A��H�ԦA-�[��=��Lrq�d�<M�p	f,���I\r���̖�=���G�VAiM����w�_�&i��!ș��\0w-�i��Uk���l@\'l����,��*�s��	y�\0�l�SJ\nN�W�����`ݝD8�n?Sb>���EW�4�e�aq�~������[�A�\Zu��s�0�=��^�-� 5�\0���_&�z�PW��f~��7��z�\nIּ��v���K#U��	�<vEʶXe�iU�9*\rg,�0�J�:�����l/ZR����!�����p`�M�N�+a(����8�Ō��)48����L�N�[�l4Ì�a���I���_0�U�M�p[!ܻ��\0-~X7fD{�-�jW�0�&�:��lIH�i�>�ŉ�c\0�a!�XTt�?<�]R�PӧӁ�S����<k�����Ñ\'�ĕ������H�s��\'���hW��4$\Zr#�h�>$O���ƽ6�K���\0�ȽdJ�4?�r4\\��\'��u�V$(\r;u�4��\r��)ʣ�c4F���s ى��1��ˎ;�YiSO�+\r&$/<M�|Ae! (�?􍣵6`ZP\r��{�pz�[�\0bY�\r��4z\Z���\Za���9�����8Y�9W�����D�\rc9�������[�Xw���P+׮�F�mrp8w,c����Kʂ�M��됺��`����na��.ڮ�Y<<1o�u��Q��&cǟf2���&^	#i�tq0�S�o�`2e��h�֫�����Ĳ�|�}_�RdS@A\'ǶL����}^\"MW�\"�0@��w��Q���\"��h�\\\Zu��Z�L�hŋ�ixT��rB�y�q;*S�R��E���:6J�z�M26�@��\\[��q��)��ꠥk_\0+�\'�\r�V�Q���I��F]�:�m��xH<��P��{�J�M�/OR�|#`���\r�{�F�}Ͼ\ne�[�E��#ɺ �ͱM��%�@�H���m�N@`2-��U�\Z�Ud$�����?W�&�8�X*AU\"�<v�L�-�S�\0Kkx�$8^�T\r��\0#%��\Z.,�ye���b�N@<���\\\n��ۖD�\r����x�\0��kh��Y	x��啌���x�q�Y~)@,ĠW��\'C���ԍ�� �����m8��\nk8I6e%I�)K+��c=>u9����풏_Rώ���������=�>Q��ԥ�\"��7���\0�p�vD�\r�f�f����1?F�x��ĖY�c��>%A��P!\0�ڵ�x��z��y�x-��T3\ZS���N$��c�������eX��A#1�������ZR�C(?g}�VN2�\'�(I��@��Z�Z�2#1�Ş)u��,kƄo(>������\"���J���]�\0�	c��>�Z3T����r6m�\05ӓ�A�m�� ��V4ʝ	P��-3������V`z������,���6���B+�m�����,�#\Z�iڻ�\0hw5�~����M\0���f�w��^�a��D�Q�.jS��;��;��#�I�W޽\\/�f#傒\'�x�$Vj?*\\i\"@�j��Zd[�-cCJ��⦃@�\\( 4i_��4�w:��i��n��\ZCߡi���+H!z�|�Z���m���I=�(IƘ��5�$U\"���Ɗ�I�M0S3�t\\ҽ<k�v;��@>�Q��(|-,�J���4:7���2w8IQN$��2v��_oli��U���\Z@�l���b���÷�E�����������h���F$:�V�>x�؀Ak�~�Q]]�u�h�_�RJ�c�I�v\'������x䅆\\���@����*��\0���8u�jsn�S.Y+]���i�r�~?����U޻�M?V���D�G\n:\r���eg��Y�Ry�P䭨��\0����ʻ2�<NG��GQ�DwZ��Hİ��<_��ȌǓ}�����(\'s��\r��׎�A�t���Yʧr���L|K�o�,VV�Rj?WӐ\"��sӳ�*�W�OՄ��$�얐B�ԃ��#~���h�����\0L�L�����uYE\rN��\n�2��Ĩ��J���>��D\'����O��a,��\n��������z֫���n�~\Z���������R��g	W\"�s�O�M�\0V<)�Bʃ����&@���qb\rMi��dJ�K�\r�+�rK��D��{li��a��m�z�G� �(���ڮ�Ђ:�������Xhة���-�b ��]�\nw�Cg�=�S��KU;�׈)�bk����#LPI���jnz�I#�z�tZ��,� y9y��S��-p>��L,c#վ�����A�Jѱ6��uf8�j�>��1�2W�qZU��\n�Ċ�\Z�hm�SQ�ۑ�h�����p�0��\"�\'��Z�eMv^@�\0���a�c�I�\0��R�x�N5�U�*3� ���@��HQL��d\r��k�=~��d;l��T��Q�FSJ�~�1�ͲEI忏����Y��L�2K �D�\\�V�U����[.�+�i�|������<J2���_��.Fx��\0��Ǟ���r7�bW�Z���8�*��\0v��EIi�7�Q�\0\r���������p	\rƽ]�㌱��So�T�`8��5���*m�y�j\0��ʻ}�-ǖ#zjɈ�sSu��T����=r�D��#n:K�Uw`\rv���0�r9�[�)+�DP�Z\\��H���#u�wnUj����K?3��A��\n�>Yh����$:,g��Spi��h&��r�\0��2�\Zq�m�<�Y�zv�Ȁ{��,@�)	р!}�v԰����l¼��|MVK���n��[$��r8���c�Q-L:��bn������,F|r�\\(w\Z�\r03���5;u�5lO5�Su Ӱ�cԳ�<��4ǌ5p+����`O;������JB���Ƙ�}��a`\0+Hr	>=qR\0o��^$��W��j�X��)�\Zc�Y�Ke��o�%?)7�v$0,i��.�M�@�O�?�\nS�w8\0ہ��X�\\P��O\nb ��Q�vk���z1����\r��C�T\0>�4��Kdq�G\nt��Jci�&��O�f ���p2���\n%K	��k�跑M���0�bI�\r*O�q��u-�_z}8҉��,2��?H��Ii�)J��ƚ�@Z�M�o���6$�Q_��)\"m��/�/�g��?h�ߊx��Vz���2:.2��#��?���GbX}�A�c�]�U��jN��;$J}\\���c�z�\\I)�#vc��j����L\0��1Ьu�m��� CT�1���y}#�P���Sl[��#S凎�$i���k\r��osQ���~D��S0�\rx�bw�y!0�-4�1E�����j�dc�]�5E����X���dj�D��_�U]����\Zr#����\0��\\�~��J}�#���M��X��\\�6����\0�i��Ri�]N\"+�-t�AѾ#]�FJ�P�	n�H9QT0�RG�Ɛ2��G����I�B����g�;���\\~�|\0E5d��m8����]����$��<�W�l2\"E���\r�|W�EG]�`�ջ�V�|;�� 02�SV$�Go��ӏ٣�Ĩnۏ| uD�.Љ���dV#��-*z�Aڄ��k8�r�h�\"$=\"M�{����I��#�w T�����Euj��}�ȷnCB�i����Xl��hN)�\'�j�H�ᦸ�ʗsZ�\\�j��Ojc�/Q�b���:v��\Z�����uo�}9. ������b�^�㑓v/��:�\0u�v�9|�,/1j~�c�����Yoo������2߿\Z~#\"DdN�r<?���qfd:����Y#>8g#f^���_R&�p>T~�.>��O��Q˩!�)Z���i��g�,c8��^E_߲��MO�r���z[�Q�F0U7�\\H�tZ�\0+�c����\0�<����(��?�dG��j���m�/\0�IU~XI�:�e��K�U�1U۸ʆ�W�?����OB8E`XѺ|X��G�d�1��H�Qiu:�M���~�>g��xr�Տ�/�yUZ���e^)<��m��¨��T/�M�$��P����N;\n�~9|$OF���xR�\'w\'���ڤ������S�1���e�3\';\'�I��ݖJ\'��Ǟ$ќ�l�NܻefR�rcwf��$r�Ԧ�|��9?��X�<v�9%yW}��&%&�`�V?�)(`R<I59&�\Z��sR���ڸ8�#�!%��S&�_��r�0\\	�Cq-���=���h�\0� (��\0��j�R��]�������j�����2[��D��u�둲�#����>�.m�*H�炛�>��S��71�p��۠�Kvw\r���C����Pv��e���#��$�F�4�F`��%k���\0�,�\'iE��Lv��qܟ|,H�u�hM�%�B����sLl$c�z�Yz�~ym��6�\Z����������΃�L��W.��\'`��Tb�r��I��@y���;�!i����p�¥ܹA?�C�و���q���b2\r;0\n0�,\')Ah���(p��L���N�G�1���\"�_�c�s���8X��E��7+A��l|?&��OZb=�>Cbq�/D���m��%q������T������E�2��k��U\n�\\���^F܈���I.����D���\\M\0�֔����D�_�8m��O��\0~\0Y�U�����g\r�ǄW(�H���}���N#bg\rSAǰ?�n<*s_.K	r*xPV�.�rL���U�@qB2_�)^��\0b��؆�ƕ��#oW��2���2m�#�\0St��*{o��\r3�3�\0I�#��\0�� �:pŮ�\"�{�p�D���xZyP���IŬD_<j�G��}���*8 z�eC�R������P��\0�,(A�\n�\Z��[�q�\n�>xV��S��ur\0���i���&����w���:¾H@��O�ַ����{_����\0��V�}-w�M� ��9 L�K���Im_��l�Yt\r���P`�?)���]��r@��yo�v�Ⴥ��@��P~\'\'ژ�� s���*����&4�Dd9�V�{�&Q�e��J�i�z���B -<��_�3���H6�j�	e�:�u�ƙ�Ѱ��ӾJ����#Ň�L�\r��?�\\�U�A��\\���8�TCj�l=�L�8�$�BB�R��O��01oc=��8DTP\Z���~�x�|\"?���\Z��)�(O����p��ר���0��V7`?e�rQ�^Ie��QC6�s-a\0���� :���e�W�q�m6eZʪ����3ə�H��c�dU-�8���4���	f���-�)#^{�G\0=)D�1�(�w8�APIr�R�s����1m�I �v5&��u9l#{\\\Z咺M+��G�n��\r��0��ḳ�%�ƋqT�\nҲ���6+Ba0v*�����u��*2���pD�SY$ZqݏN��ጲ�\'���,	&5]�o�\0\Z�,�V���DmgՅ9�\n��7�ӓ�A��z?͊�)>���-6�d�������詯\"�q�>��ݏ�A�l���K@ai��]Ǹ��䭁�kҠҤ��#���}����<-g=�k9�\ri܊e��q�\"�M)Q�I��?±�v�8��Bc��	���0�k�r5�F�/ƽzS@G�3�ҽVU�L{��!�8�~���o�6����:P�X��[CZ���D�)�������%Ŝ\0��\ng�.��I+B�3\\h2�r�[j.!M�:��q�΋�ܓO|	�uo�^�|����T|�2%���q�<N4���@A��$jh����SY�5��-����i���_�\\# }�|�F���`6\'��6��A�����-��*�q�w-�,��{�6c��q>�qQJ�ǈ�X�+�\rR��)�~U�i1w��߅4�I�>x�%�5�^��e�w��\0�_l6��滐����;��\05qM��T銓O��猨(O^Ԯc[���i�l�+���~TS��j�V �ޖ�C�I�]�\0VW��-�G��+��r̍��\0bҼ����&\0k�I˙���6�3�}���3�g���\Z^m��M=�\'n�e����b�۲��߫�J$2M��(hI�G��%��^R�܊����%���V�^���y>�2ǣfcP݃���+`5�C�\\xYx��\n�i\rk��q�0�cH�<���_�RD?����a�\0x���D%|ַ2)�^�b=ȕ��j�{�֧\r�����^e\0m�:V�qȒ�!�)kEà����D�����k�\"��$�p�)�\\�\0�-d�9c�6��7C���l��z)���\\-|d�j\Z4:5qJ�\\2l�������>��bG�\Z�:n=�\\->!�XQ��2�a���bd~�����{W|x�0�n�c�t�Ř?Ľz�|U�-��}V���D��uN�Z�y.�|GM�8��4�J��=�\0^(��ɶ�H%S���	�M�ҋ����ƃ8O4�8�s{�{c�2���\n�\Z�З��88���V7+ѯ9T��;?Vb���\nDq2��V���F����\0�	6��Q��=\n���d	:S�C�U�M\"\nhj���\0�d����0���\0��������A��RA<��6�E���V*�1�9ĮGR������b�\"&.<r�\0=�KB��C��2賑����u�YS�W�6ɌC����?��T�S�l��N���\0]de��e�5�<��ү��ݥ�)�3����9\\�@��ɾ�6|L�_-ԉ?5c>o�K`�0Eש�yxeW�[$Ѹ��S]��!\Z�$n$�(H2*�\"���o�q�e�\"<.��M@~/N����%����b��xT�G��s\\#D�.qx��>�z�#*0\'��50�ĩ�z�܊�#\"F�.>ENH�P�����J9i���%�i�H�2�&������^�j���mR���\\�5<H>\'���q笯�Ҙ�\'m�+��%�\\o\Z�8���R�}=0n�3�i(Ơ־�l��/�M�xS���Pz��\r��O5��NT��P@0�#Ƙl0qw7�M�N4�>E�+ڟMp��kJ\0v>\"��%��	�NG��w�~�τ���>�DQ]��|ˉ���x���w�O�qb|1I\'�.�iQA��\n�=�#�8���I#��K���_�h�7�0�K}d�A��E�T�-q������V�����\"�ͯ��~;���7\Zի�) t.RzR������5o3҃�\Zbg��&�P=�Ƙ��ܘ���PmMQ�p>�y qP���э�	��L��1�\'�Zk�a���E�h:.�\Z!H�\n�Q@��1bG{�����4v����/ኯ�.��G���1���ܨڿ-�`ݲ�D��v9-ڌq����DC�}$`$��!�8�-B��be\"9p�\0�pi55�����\"f���\r>*SۮFۣբ�\n2B�K���l����&G�W*��=m���Ի������\0[vX�A�Q�k��y\0�igb\Z�j�LL\rH;/������)����5Q�d�a8��i��۾`b6��8�*�S�@��-��b2]Ǩ \'���l�?.�P,E:��8��EirƤV����]\Z�BM�0f<����ǈ�Z��9�����*�<kHJ\Z!\\���6PZ���儒��?�[uE4�る18Gc�k��z�ᐧ J��rP:��� \\��=?$5FwѲ�GZS\Z�)�K�m҇煀�lЍ�L�A��z�G�%�x�*{Gz�)�+��.����Z�Y�,Y$���xC�&�xj�j��0p�����AxhMK�)��6�	c�))4�֞��p?�\Z=�N\\}2IY%\n$f;����|5\0�x��)\0�`F@���ǒ�3��#��;҂���e|d9�KiCIQ�~�V\0}8��l����\0�/�tb��ۑ��G5�g�]d��z�\ZO�v��0�b�&���v��?���\'c���5��O��X�Q�\0u�o�`��H�>ϾR��\0f�.�qA����\0Pe���6n̕z���K�Z�:���%-@�j��r�8���W�4r|�$~9G�}%k0����I��������K�*��FXY]�W�=�w�W,�Iw4���܉d��/�!��^���D�u\r���1��C�߉�DJ_�e(C���V��KB���J�bs���K��k�$F�{ӵ�˱�>��$�wpO���r�L���\\�8�epi��f4��Ĵ���ɉ�=nfUظ��IYF�\nOLyr=iL��h�(K�V|\0\0G�&>yT$�P)��a�@�)+F١�aL&ˍ��\n���;u�߹YS^�&�iNFQ԰�d�.,��8N�(Y�4�(���8\'��d�\r���^�6��Ȑߏ �Ȟ�2-�\"��Z���\n�o�[�����a���uE�\'�nk}BU�*k9O|]��v\'|h�bF��z�>�V���SQ����_�q�p�@��������\Zw�iiD=(q��[�Wr>Y+k�����U�|K�ɢ��p�&¨�\nbV ���`lt[�;�ㅁ �E=7���C�D/M��(uw}��+^M�����z�;�\0h��!a�zV�xZ�p߫���\'����hcK�;�敭F,n=��_��l������Q���(4�?�*4�w����\0ݶY\0PH幯Q��w��5���M�e^�W����V��ֻSǾK���g�xI���<�����(�S�S9�BV,hK��1�f\'�ȸדS�MVȁߑ�?���`��z�zՃ$kZ�z�\r˒*#���oRK�����9��V+,����2F�6�����\0L������-�r����т�.9�e�b�Z�{i��	���j�\"F��އ#M� ���+�NM;\r���k��YImy\n\0~y&�D�q)���7���[�p)P��$�Q���¼/@���%�11��0o�2;��7+CjoO4KX�\"j����?���-���z���}1E�R�y�.��\Zj�c����`rL\"\"zIR�{���[�1ӽ4=~�<E{� =z����BM�=�`����2���T��|�T\Z�\\�����r#�S#����Y��\\�	�\Z%!�]3��P�\0�0��?Ĭm��א=�##a������q�+@}��6ז1W��+��m�G+�M������K���j��h6�c�\0!��zzU#v��_�Q�*�w9�I�庻\\�)�J��O|��:�f1�T��.۰��2G-?��yz��x�\rKx�rC�ش�Zfk�UG��m�^���ro|NTeQ�V��Kr\n�;~������2�����ܟ���d� 9��K��Td�K|P�#����n6\\�������Z��oto�r��tr��1u��\\���w?��h���O�)��?������R���(�K�I��d8���1���\0N�m�r��P����x��ƞgs8_�Q+k8�p��-?��NS�.\\p�\0:\\Jj���&\0���v��V5��T�S��A�e��o�\\I��<y�Z2Ѥ��xT�./�prh�9N\\H�c(Z+\Z��NU:���P���Xé/Żd��j�72S���j�$�,q�N���N ��Y�l̽����%�9��$��4��L���������K���N���jg�E8vPr�6���B��qc��<�LD��TZ�j���+i8�|�1W�݆�Q��K�+�J��_m���H��׫���{ׁ^����t`\\Uz�S��A��EI�1���R#��~J�8�t7��\0:��w%��)\"q]ʝ���L����8Y+KӾ�\0,4��prF�{�!�gm��|\r�^n���X��j�~�S~]�~�h�-�~�G�F\r��A��k�\'�=\\H����+`�.��O�\Z(��[��h1�7�k	�;v�0�`x�,-=z���A��mz��@�A>,�%���G�\r1��V�i�`gD����O��Z4�m���ro��zb˄STOlwP\"�݊����C��',NULL);
/*!40000 ALTER TABLE `cir_member_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cir_opac_request`
--

DROP TABLE IF EXISTS `cir_opac_request`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cir_opac_request` (
  `rid` int(11) NOT NULL,
  `library_id` varchar(20) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `memid` varchar(70) NOT NULL,
  `memname` varchar(100) NOT NULL,
  `accession_no` varchar(70) NOT NULL,
  `document_id` int(11) default NULL,
  `call_no` varchar(30) NOT NULL,
  `title` varchar(200) NOT NULL,
  `author` varchar(200) NOT NULL,
  `status` varchar(50) default NULL,
  PRIMARY KEY  (`library_id`,`sublibrary_id`,`rid`),
  KEY `library_id` (`library_id`,`sublibrary_id`,`memid`),
  KEY `cir_opac_request_ibfk_1` (`library_id`,`memid`),
  CONSTRAINT `cir_opac_request_ibfk_1` FOREIGN KEY (`library_id`, `memid`) REFERENCES `cir_member_detail` (`library_id`, `memId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cir_opac_request`
--

LOCK TABLES `cir_opac_request` WRITE;
/*!40000 ALTER TABLE `cir_opac_request` DISABLE KEYS */;
INSERT INTO `cir_opac_request` VALUES (1,'jmi','jmi','111','kedar  kumar','1',1,'123','computer graphics','hearn and baker','processed');
/*!40000 ALTER TABLE `cir_opac_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cir_privilege`
--

DROP TABLE IF EXISTS `cir_privilege`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cir_privilege` (
  `library_id` varchar(20) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `staff_id` varchar(100) NOT NULL,
  `cir_301` varchar(5) default 'true',
  `cir_302` varchar(5) default 'true',
  `cir_303` varchar(5) default 'true',
  `cir_304` varchar(5) default 'true',
  `cir_305` varchar(5) default 'true',
  `cir_306` varchar(5) default 'true',
  `cir_307` varchar(5) default 'true',
  `cir_308` varchar(5) default 'true',
  `cir_309` varchar(5) default 'true',
  `cir_310` varchar(5) default 'true',
  `cir_311` varchar(5) default 'true',
  `cir_312` varchar(5) default 'true',
  `cir_313` varchar(5) default 'true',
  `cir_314` varchar(5) default 'true',
  `cir_315` varchar(5) default 'true',
  `cir_316` varchar(5) default 'true',
  `cir_317` varchar(5) default 'true',
  `cir_318` varchar(5) default 'true',
  `cir_319` varchar(5) default 'true',
  `cir_320` varchar(5) default 'true',
  `cir_321` varchar(5) default 'true',
  `cir_322` varchar(5) default 'true',
  `cir_323` varchar(5) default 'true',
  `cir_324` varchar(5) default 'true',
  `cir_325` varchar(5) default 'true',
  `cir_326` varchar(5) default 'true',
  `cir_327` varchar(5) default 'true',
  `cir_328` varchar(5) default 'true',
  `cir_329` varchar(5) default 'true',
  `cir_330` varchar(5) default 'true',
  `cir_331` varchar(5) default 'true',
  `cir_332` varchar(5) default 'true',
  `cir_333` varchar(5) default 'true',
  `cir_334` varchar(5) default 'true',
  `cir_335` varchar(5) default 'true',
  `cir_336` varchar(5) default 'true',
  `cir_337` varchar(5) default 'true',
  `cir_338` varchar(5) default 'true',
  `cir_339` varchar(5) default 'true',
  `cir_340` varchar(5) default 'true',
  `cir_341` varchar(5) default 'true',
  `cir_342` varchar(5) default 'true',
  `cir_343` varchar(5) default 'true',
  `cir_344` varchar(5) default 'true',
  `cir_345` varchar(5) default 'true',
  `cir_346` varchar(5) default 'true',
  `cir_347` varchar(5) default 'true',
  `cir_348` varchar(5) default 'true',
  `cir_349` varchar(5) default 'true',
  `cir_350` varchar(5) default 'true',
  `cir_351` varchar(5) default 'true',
  `cir_352` varchar(5) default 'true',
  `cir_353` varchar(5) default 'true',
  `cir_354` varchar(5) default 'true',
  `cir_355` varchar(5) default 'true',
  `cir_356` varchar(5) default 'true',
  `cir_357` varchar(5) default 'true',
  `cir_358` varchar(5) default 'true',
  `cir_359` varchar(5) default 'true',
  `cir_360` varchar(5) default 'true',
  `cir_361` varchar(5) default 'true',
  `cir_362` varchar(5) default 'true',
  `cir_363` varchar(5) default 'true',
  `cir_364` varchar(5) default 'true',
  `cir_365` varchar(5) default 'true',
  `cir_366` varchar(5) default 'true',
  `cir_367` varchar(5) default 'true',
  `cir_368` varchar(5) default 'true',
  `cir_369` varchar(5) default 'true',
  `cir_370` varchar(5) default 'true',
  `cir_371` varchar(5) default 'true',
  `cir_372` varchar(5) default 'true',
  `cir_373` varchar(5) default 'true',
  `cir_374` varchar(5) default 'true',
  `cir_375` varchar(5) default 'true',
  `cir_376` varchar(5) default 'true',
  `cir_377` varchar(5) default 'true',
  `cir_378` varchar(5) default 'true',
  `cir_379` varchar(5) default 'true',
  `cir_380` varchar(5) default 'true',
  `cir_381` varchar(5) default 'true',
  `cir_382` varchar(5) default 'true',
  `cir_383` varchar(5) default 'true',
  `cir_384` varchar(5) default 'true',
  `cir_385` varchar(5) default 'true',
  `cir_386` varchar(5) default 'true',
  `cir_387` varchar(5) default 'true',
  `cir_388` varchar(5) default 'true',
  `cir_389` varchar(5) default 'true',
  `cir_390` varchar(5) default 'true',
  `cir_391` varchar(5) default 'true',
  `cir_392` varchar(5) default 'true',
  `cir_393` varchar(5) default 'true',
  `cir_394` varchar(5) default 'true',
  `cir_395` varchar(5) default 'true',
  `cir_396` varchar(5) default 'true',
  `cir_397` varchar(5) default 'true',
  `cir_398` varchar(5) default 'true',
  `cir_399` varchar(5) default 'true',
  PRIMARY KEY  (`staff_id`,`library_id`),
  CONSTRAINT `login_ibfk_9` FOREIGN KEY (`staff_id`, `library_id`) REFERENCES `staff_detail` (`staff_id`, `library_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cir_privilege`
--

LOCK TABLES `cir_privilege` WRITE;
/*!40000 ALTER TABLE `cir_privilege` DISABLE KEYS */;
INSERT INTO `cir_privilege` VALUES ('amu','amu','111','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('bbzhcet','bbzhcet','111','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','true','true','true','true','true','true','false','false','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true'),('dei','dei','111','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('jmi','jmi','111','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('yy','yy','111','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true'),('amu','csamu','222','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('jmi','cs','6666','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true'),('amu','amu','admin.amu','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('avlin','avlin','admin.avlin','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('bbzhcet','bbzhcet','admin.bbzhcet','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('dei','dei','admin.dei','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('iitk','iitk','admin.iitk','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('iu','iu','admin.iu','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('jmi','jmi','admin.jmi','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('rvce','rvce','admin.rvce','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('scc','scc','admin.scc','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('tt','tt','admin.tt','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('yy','yy','admin.yy','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false');
/*!40000 ALTER TABLE `cir_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cir_requestfrom_opac`
--

DROP TABLE IF EXISTS `cir_requestfrom_opac`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cir_requestfrom_opac` (
  `registration_id` int(11) NOT NULL auto_increment,
  `library_id` varchar(50) NOT NULL,
  `memId` varchar(70) NOT NULL,
  `sub_member_type` varchar(25) default NULL,
  `fname` varchar(50) default NULL,
  `mname` varchar(40) default NULL,
  `lname` varchar(40) default NULL,
  `address1` varchar(200) default NULL,
  `address2` varchar(200) default NULL,
  `city1` varchar(50) default NULL,
  `state1` varchar(50) default NULL,
  `pin1` varchar(15) default NULL,
  `country1` varchar(60) default NULL,
  `city2` varchar(50) default NULL,
  `state2` varchar(50) default NULL,
  `pin2` varchar(15) default NULL,
  `country2` varchar(60) default NULL,
  `email` varchar(100) default NULL,
  `fax` varchar(100) default NULL,
  `phone1` varchar(15) default NULL,
  `phone2` varchar(15) default NULL,
  `mem_group` varchar(20) default NULL,
  `alt_group` varchar(20) default NULL,
  `access_level` varchar(20) default NULL,
  `supervisior` varchar(20) default NULL,
  `manager` varchar(20) default NULL,
  `remainder` varchar(20) default NULL,
  `location` varchar(70) default NULL,
  `mem_type` varchar(20) default NULL,
  `requestdate` varchar(15) default NULL,
  `faculty_id` varchar(20) default NULL,
  `dept_id` varchar(20) default NULL,
  `rollno` varchar(40) default NULL,
  `category` varchar(20) default NULL,
  `course` varchar(20) default NULL,
  `status` varchar(10) default NULL,
  `password` varchar(15) default NULL,
  `reg_date` varchar(20) default NULL,
  `exp_date` varchar(20) default NULL,
  `image` longblob,
  `Course_Year` varchar(10) default NULL,
  `semester` varchar(10) default NULL,
  `office` varchar(100) default NULL,
  `desg` varchar(100) default NULL,
  `sublibrary_id` varchar(20) default NULL,
  PRIMARY KEY  (`registration_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cir_requestfrom_opac`
--

LOCK TABLES `cir_requestfrom_opac` WRITE;
/*!40000 ALTER TABLE `cir_requestfrom_opac` DISABLE KEYS */;
INSERT INTO `cir_requestfrom_opac` VALUES (8,'jmi','222','pg','kedar','','kumar','adm','','aligrah','UP',NULL,'India','','',NULL,'','kedar9002@gmail.com','','53463463','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s','2011-7-2','arts','his',NULL,NULL,'','Approved',NULL,NULL,NULL,'����\0JFIF\0\0`\0`\0\0��JPhotoshop 3.0\08BIM�\nResolution\0\0\0\0\0`\0\0\0\0\0`\0\0\0\08BIM\rFX Global Lighting Angle\0\0\0\0\0\0\0x8BIMFX Global Altitude\0\0\0\0\0\0\08BIM�Print Flags\0\0\0	\0\0\0\0\0\0\0\0\08BIM\nCopyright Flag\0\0\0\0\0\08BIM\'Japanese Print Flags\0\0\0\0\n\0\0\0\0\0\0\0\08BIM�Color Halftone Settings\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0���\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIM�Color Transfer Settings\0\0\0p\0\0�����������������������\0\0\0\0�����������������������\0\0\0\0�����������������������\0\0\0\0�����������������������\0\08BIMGuides\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\rURL overrides\0\0\0\0\0\0\08BIM\ZSlices\0\0\0\0u\0\0\0\0\0\0\0\0\0\0\0\0\0X\0\0 \0\0\0\n\0U\0n\0t\0i\0t\0l\0e\0d\0-\01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\08BIMICC Untagged Flag\0\0\0\08BIMLayer ID Generator Base\0\0\0\0\0\08BIMNew Windows Thumbnail\0\0�\0\0\0\0\0\0p\0\0\0T\0\0P\0\0n@\0\0�\0\0����\0JFIF\0\0H\0H\0\0��\0Adobe\0d�\0\0\0��\0�\0			\n\r\r\r��\0\0T\0p\"\0��\0\0��?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r��C%�S���cs5���&D�TdE£t6�U�e���u��F\'���������������Vfv��������7GWgw��������\05\0!1AQaq\"2����B#�R��3$b�r��CScs4�%���&5��D�T�dEU6te����u��F���������������Vfv��������\'7GWgw�������\0\0\0?\0���Ećjc��$�7ϟ��\0�T�;q�I�cR?yM�7o�S �u��!#���2t>����<;��O�� �Ɠ$�ۺ!���l�\06јMe{X^,\0�8��xe�֞j�\ZS�{�O�L�@���6�d	i�1���s	��L\0~�m�<�_�3$�`tM����\0���t1?G��[v�@��>r������;�)o;�g�~�!I�\\4�_�Q	�0Ii�)щ�	5E9�� ���ʉ�����n�\'cl|��u׍�\"a�!�\0��>�TH�>�V��F^������	$�c^fS�\rk���t\'��5<4�9B���E6?�W����c��p�Ĕ���0\r�L;���QH�\r�3�\'�<��7��q\0�C��1+~���r�����4�����\0�]���~IH��b��\\<f;!ZY��qi��I��j���	\0��)��\0�\'�@:O;��c����\"c�{��\0d:x�>�^����D�A�o�R4AB��N=q- wi:��$�r�h����\'����\\	t��	n�J��m�i���~�{�����:Ւ�@v��{��T��\0�\'�D��\0�X6����Q�]2�����Q�-m�4���n��d�\Z���n�;ih.�e���ڙ̶{Z�`5�S�R4��`!���Oގ���*�uX�����6 4�Ȱ�uM<����q�\\�f��CR{!�N��O��Kځ�:�]7P�/��5�S���uS\n�׸�a�/���}�Ϥ�oV��>�U��{�umm�\0}��.��5�\0�7���=$��S�X�t8�k���wG���:���[�\0F�\\���!�ʭ�{v��eE�c�pw�����[�ţY	�e�4�_6��t���_T��ft繛ߊ�.\r���g��>7���\0���G�v�m�s�.ґU~�{I\r�\\�����\0Ϧ�OT��۬�����V%��~a�_���ֳz�X�α�9/��]�.&����ٷ��o��Z��q �XI$���S�e�묶��[\\8�7��S���m��\0H�Ы6}K�5c��}���k\'��`�e��Z�lU��v��pk��u�Ó�3��.�|쬋�Z�E �4\r �]!��>��~�0��GMWM9��R�qu�挊�\r���=�o��7?���7�e�Qc������W��:\ZM�c��~s?F�FNEz6�.�\ZO�R�}E��;ݵ��o��?�v�\0�����3��-�V:�lc�(����Zd����S���lD���U��4;�\rT���}E�c�{^�Oyh\r#]t{�׆�\0aX�ɦ��<~�s��w�o>�l��\0��8�����X���In=E������[�k��{zOT~Q¯̛>��v��9[������n�T>�Ѷ�/k�$�q�{�nC�\0�M���l=�l?5����(�u;��\'4<^G�ި܆��I���bZC<9����.�cY`q�@1\0An��\0������s\Z,�&ͯsL�25k��w#ۙ�s�k�ڝ��xs����w�f�s�2�+D�P1����fuU�e�H��0�F����O��icl��m�7��x2}G9��c7�k/�]�-$�:���5V��eov��������=���P�ӿ�i~�S7-������^�������?�QvinMT�������d�o���{���Ŕ���Ѯ�cux3�5�ƹ�/\\��;F=�֑�>��;�}��qo�:ӯ�ڲ.}��[�n�;��n;������ߖ�X�l�H0O潻�I����ZK���\"$|����R\\�%�n�<���t@%�ɶ���L\0�\'{&\0w��v��}& �X��[�EV��#���nY���x�N�D���G-ɍ��D�Cl�8�ݱ�\0R����=����Z��H.�P��n�-d��r�ou�h�f��]��縷n���v.g�\0	��~����ַ��?/�H�&�Υ�ma߼mpp ��7k[��\0\'ث�m�� ׹Š̒[�[��P��2|KH׏�֟�اNQxs\rs妄����o�5!\nx�v�sƵ��5��;]ܵߚ�}���q-��@3����\0�VM�����b �~��FnK^e���;�#�~��Q���.����]vƸ����P[ �S�jyPq%��(�Z�2A��>\n�[5�BG>I�qsN����\\�\"��m�}73y1F�Hl~s}�b��,,���\Zk���J��M@5�!�N�?�����RBC^#���ڷHl$�$����i�b�\\;uwj��󽳵���㲃�����O)�.�-��3o���Q��y%�2O-\"`�\rt�9\0�փ��A���H�` �=�o�C�J.y;O�;��\01Gm�q>·�T����=�Z�n�&\0p����={�Q�6�@{H�4�&b?��K�@3�|t�꽅����%��x�\0��Ef���/L{�ռn��x����V��qi.:�[��Ɯ�o�3��۞��������K����<>���o�Zt����vn���c��w,�����?G������8�ջ��~��c��~՚�wQ���莇m�q�[�}=��;��6{�m�q\r�����y����_(���}V�s���ّ�~8��\0�C��9$�l<�#�p��	��n��LxJ�I�}��gb;�������ߦ������l��#w-���\0%b$��-��\0�l��o��n�P��߬����z?c�x�B��O�]�>ke���8BIM!\ZVersion compatibility info\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \06\0.\00\0\0\0\08BIMJPEG Quality\0\0\0\0\0\0\0\0\0\0��\0Adobe\0d�\0\0\0��\0�\0\r��\0X \"\0��\0\02��?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r��C%�S���cs5���&D�TdE£t6�U�e���u��F\'���������������Vfv��������7GWgw��������\05\0!1AQaq\"2����B#�R��3$b�r��CScs4�%���&5��D�T�dEU6te����u��F���������������Vfv��������\'7GWgw�������\0\0\0?\0�m��6�\'w�L^bA#�0��K��i3��\0\"��Hp�ĕ�I\Z��@/A�+����AI�%�	�<TZa�q��G�b����À8��\0��\095��K�I#Ħ\r�9���^!=mm��&%0\ri ��&\"z����d��9�	��O�L�q-�xBݸ�0G��\'a�RfG�v�O}V��\'�ѩ�?4���.��2A��\09+��V髇j�u� �?�����	*G=����P�k�H<9w��f�>\n��#��t�\0�BF�I o}�p�y�i�j�	�;�2�?u�����\\�\0�O��N���\\��A��~�����{�o��I������F��hZ4��/q��p��\0W�\0�E��z��;{|{�=���q-ם�7&lF�u��L�v��A��?����ԭz��an�\'H:�`�\0i�\\�D�\0� Lj�$���jp}��]@=�]�Gd��LN�&�A����ɩq�h׺w�Z�LF�9�� �ˉ\0Q ��=����>�����[�闝�8�?�o�Rn����>�?ըn���D\r��p����N��&��_��$��߼��?t���>I0�d�p�1��\0����=����րz���K��\Z$�����{ú	ԁ1�\0k˷hCxi)��F�a����J��(h-7�H�C�I�O��Ik�$�%C�0Z�F���L6�4o0$Βy��t���ǨӰ�\"5:���ݸVD�؟�����\\8D�ۜ\\L��j����(���$�u.��\"4�\0��L@ ��¶	�\'H���dnl�$@!�XĴ�[��v���e�y,i�x>@~c�[\Zݯ0�j���G硱���y$���4*�	p$��ΰ���IxӍu\"%��Gv��\0Kv��CH�Ŗ�2I�d�\'�*[�v��u&L �����\0��\0iL3sv�8.4�RW�\n���p-tç@�Z��դ�Kg�%���i���\0���a��ӯ�	?\nH+1� ���\'� �-�{}P��:�\0���*n�	�Ν����	֙9΍5uCk̇I��������Lɑ��)����i���O䠭Ĵ�O��:��z��!�9�Q�\0R��k�I㶪$�p&50[Ɖ�Op�n-$:@�C��J��W!�9\Z�!�8��K���j��4�#�����G�F���������@���3�\0��\0͖Ȇ��QH���G�C�����ID�k��L��P� ˶��9�\0�S�7v�����o�43����t��n��2��G��$�\'p��w����L�l�\Z�=�\0;��E�{��@�S�,s�}�\"�������~��?����p.���:Jm��]Z&%ϓ?Dϊw8��Q���6I���Rk6���\'���^����Ŗm����i���O��H�2�\r�	�F�~�0v�B?ײk�������$N�L��ɝI�\0����1K�o\'lm�@��\Z�Ϲ�`\'��ۓ�\Z�Z]Á%>�Hs_�����H%�L}!:��Ѿ�is\\�y�ڡ^�K��\0\'�H4��@���(���,�8���k_��î�)�a��x)�ϧ��h�w[��5�p�Dq-�\"#���H�� ��*�&����v���� \0��\0�$\Z�%�1���oh����}&��� ?\"\0\'�\'��A ?�����o������\0_塱�i!�?]�F�?��q����U��c�sls�I\";I��(�\'v��pG������*6m�Hp�9��ji��A7��7z��H-��)nv�;�4L�Q2.�	�_� �h/�\Z�ׄ�\0��œ]�[d=�IkF�Ο��$�c�3r�75�s��ƭ<G��Qy�KK�����=o�GJe�Šn-��):�\ZCɗp{���uS�\0�Shk�h�>�����]����\'���C�\\C{��HWL��A�����3v㮤k���BH j��$�#^�oy������=՞~L\'��e���\0\"�fAa���y�*�q�&(l?\0B��\0�F1\0y�D��\r��̝\n#\\�u~������\r-�̝	*,$��L��B��dF�-�v�R��\r}&���[��@ײ�$��6`�bRҴ7���~I+s��`k�p�f|P���-oэN����>Dj%��?��:y\"�d�c}<eD���$��B�ߚlI�?�N%�#YM{&qjWV���`i ��#��4: \r�m1\r0]��K �u�xJ%D+��I?��|y��2d��@r`p���#El�\0���˚	l�	\0?��k@H\'B@JN3y�����\0YF�S۹�Gh�hއ��Z��$m�r����\Z4:��5��5|}-\Z%#�up���������Ų��\'H����i�9$���Ԑ$@<Bv���t7����!��N�;��ǀ9�OL��t�����cq���V�% ]$<{-��{�q=�(�i�ȑ!!���\\��)~͠{�z�R���ݨ�Ocw�6[���f�u�����2���c��ؓ�����R5b�B�U��D�J!%�I:�<��$�@\0�)���O�j|4�@O}�bͤ6d�N��}�mb���Wr���3�����h\0�I2�4�ֈ�z��k��Gr8�����@������L�{`5��\0��F���W� im���d��@?G��%�h=�|`��kkapI�����u�o�*h��=ƒ?��In�-<�����\\�1�О��ܧ��O�G�M(�OA�ڛo��0?�����i�?��@�������J�!�6=��\'�=������\\�ց�b�L��q�\Z�s��<;ha{F���&kKN�\rs��~(��A�v���w9p���s7N���;�[Zv\0��O�U�[� ���`ƺ��҆��-n�y���TI\0��\0�Y��VK�[���<����w<��Ob��1ӿ���\Z�ړs.>��q�j�I�Hh�r��H�N��m��pH=�\0u�d$�(l[ ���~��M[�i\'F���-^�>����w�S�F�6j���/�e�l�\r$A/�����0��N��?��&������p����H��Z�ӡ\'o�	#P�t��!3e�.h��\0�R��n�#����V�t>	�?�-*$�ꮚt^�9��S�l�	�\\�!�Ӭ~t*R�|@\0�\n{[�tF�=]�5�0x�Y>�:?����d�����\0�>b?��{�k;�S����,�\08�����\0t�<�e�4%;[��HA1�B�JMV��F�L���g�xCq6\0���A=�HS{�`sd��,M�@6��Ԑ>�9+��k��|?����7��{��@�\0L&4�(hAO���5`�	���?���\"\\Dcli�QL����$Z� u�N:-2U�n\ZΚ��`ȯ� Ɯ��*\r$3�j�V3�~���o�\r�>C��n0 �t�Jv�\ru������ų��/\0PC��h���!B��lWo�fM�Ƭ\'�Ƿ��$��fd 2������!��lh����M] �ֽ�$˴�x\Z���3㯚0��� �1������If�\05Z,��t��k�\"��A0I��恼��p<�d87ǐ8�F$tD�af�;��E�H����\0U�qq:;�:(1�\\�$��M7ap�dXא&|t%H\01�O�,\Z��x�uF���G!܂�H����E�kG$�4Qs���ԉ�rRo�	�hݸ���] �4���d�Z��n ��@ײ�{� 64c���Z�=��N��\\�A�I�@丈ܪ�e�i s��B���#�d�$&�6f\ZC��\0wj�`p\\F�x\Z J��&R�0C��7�\\�먏����P 1��u�{��`aswO	hX��\0[�%\n�\n�\r{���x�&�G��T\ZKXA��r�����;Q\0j�Ң7�7PA:~�>Hd\0	A�����r#	N��\r��e��\r\Z\0<�)M�;�1��\Z�ُ��nݵ�\0�����D}����BC���!ctqQ�ZZ��N���?wrV�\r 8���Z$A��44�2O(�i_�Q�ת�k�;��B%lm`\\��׏��M�kZK�^!�@�=��\0��c�w�l�]���$i6�v�� ���\"�ww��\n���`L\0x	OQuj�f5��y�7�)�xȝ|Bh�q�ƒ7���Ho#a>���o4\"H�\rm���2�v���6�0���C�\rS��lō.�?K�?�J#]�a��Xq�R\"\\�wn����+I�ӹ��x�@\0m�-�OdM��z�#�*-\ro����\"�ڮ�\0��w��\05���58�A��տI-�ai� �!�A�����V����iHY\'[�\Z\0*��-&t&{(��pq5�~!9=��KxIϓ���G��:�W�U�\rkk���;ugii�S<�̍H����%��4\0���@����	��O[bO�����-�n��	{Cgx1�\Z����]<����堸��`?F`�8�i\'o-�D ����\0��\0�����o\0w�<��m���������8�4kL���;�w�`� h��h��O)z�-\0�<~h���{��Y��jI�����\'�Г��o�$����&R�ԆC�ww�?�����h��GVܺ�Mu�ꦖ���-��T���\'��ʛli��\0n�O�g�?��}-�v���˜�H���!��3�r��[d6\0\"D��)��W�\n���!��\Z�\0i�B%䖂6�\"`~Oj0�.x����!e�@��t����Lw��vVI!�kbL\'!�0v�D�>i�c,����9B�o����]5ۚ�ɡ�l2�Ӻ!a\rx�<��\0Ƞ��c�3%�hd�{�?������\n�<nS\Zj�d0�AI�>I����[���I�Ǒ ӘN�O��GO%1Ā� 7C�)�8j�@��&T�&DF������\rE�$$�h#�-i�;@����L����hsN�#P�ˬ��$�?�Rk�-\"XL�đ�ۿ53�c��\r\n�Y��\\�$���]\0�ݷB[�~kv�44O��Y�I�-�@sg��\0��o^�#�F[�$�p�����>�\0�WG�II�K~����&��w\0	3\Z���h�Vbͮk��t�$�w�tv� �N��	��5h�����0v�:�\0�ݹ..�����!����O�/j�a�4k:�?�R�<h� )�Z�4ӱJ��V�*�ת\"kl#sG J�6��A�$�#��su�j�\\�7P1�QP����=�3\Z�c?�Tu;��@����\"!�6��l���~rE�&I�4�\"l�V��8��&��� �硒	v���h5-���	�7��Z^\\�7��!)^���U\nԲ�\Z=9�:�\r\Z�\r7pҟ�	�ѐA䙐��Z	��>��\0ΐ�>E���Hk������\0A\Zv?�\'˄�&$:G�r����t	\"� V�8�� w��\r���y��*���=��;9;���A�ڈ֗����`�A�jv6�G�wy����dl����U�3l|\n\"��u�\Z��6�^%��)��Ȗ�����g��.g�\Zh�\\�i�\Z�� 5&��U�;����<�����t8�3�\nv�&}�	&#�_E\r�tH���I�T�꛱�G��1�Gp8�L��!���P�k���g\'����v��I:��?��f��V�-dz��$���)H2\0�fG��g��� L��~r#�_.�$k��\Z��}����x1c��>���h�P�x,ο�;��C��w@�k�5ΰ�ӓ�:Y6Ga�~�� nvH�m�{�\0����:���}�	�x&>���(���]uݑ\0N�\0v�4K�i&	h=�	�K���IQs>���<%f�l�U��G:)�4�?��j{w�ѷ���h3v�P��\\C7D����|�w�\r\'����eڂd8���{x璤u������kb\0���RN�ƻA:8w��Mc�HnѠ�\'js�g��4�ږ�;g��w��z�ei/�x��\0�(3����ѓ?��J\\�mn�9:�)�m�-s�|�o\Z��\0�K_!���\0��O�kK����dƥ82Z@��O�ڋ���,�N����!�^@�\'Y>#������Zk�7��������v��i�o�^û�{2?���{���3��4F��N��ip!�ݩ-i����ϩ�;��#]g��Ғ\\�-�<g�H���6�����ev66�i�xr�m���C����- \Z);լj7�Qco���f?�Oy�kE�h����]�2��qH���D\r-�\Zx\'�$Ǝ�a���j G�w�D�\'Q��I��Ctj.��{�P\0PE�fw/\0}�|9R.���Tŭi�Ot��(\"{�D�����~�x\'�J%��ۀ��:�\0eF�O��gS��3����� �\'@|�\0F�k�� ?ġ����{��@�.$�����ԍZ�Z�H�\Z��*t��(�B���L��8|�A(U�*W���߶<���2H �����5�g�?vTnА�7y�o�#�����ذ�V5����i�>:)��Ȟd��nPh��7���i\Z�����6�λ����-q.\0A�#�\\q��n�6���uX����$���9�����\"\'�>)��I ������<d��>J{I ���r`O��N壑��T�l8D���\n�{I ��v��M4�F��vn\0�i�gE=�o����C����ܢ9�-�?t���D�ӢH�U�sɓ�x)4��h?�:��N�i*l�%�%+:~*����v��tI�R�hsc�J��$�d���만�I�)��w��ָ�<P���i�{)\0�}ΐ;j����~��8G�HQ�F���h|���}���ߺGk�\\��A���(�X�H�P�VvO�{����\0��\0�J �ܨ��@��t\rD��v4���oѐN��Dk���$��d��0��6��5G�#]B,�7c[�$���E5���6�`|>�g���L�y�R[�Ë���Kc��� N�$���n�8��k��5�\05\"�ynԗh?�� �_�>���)��KH�������N���\Z!�hB�e��؎$�*!�l�h?G�\"Y[]	��\0�M�]?DzW_^�������R�G��8�����:��3��H\0��#K���4z�?��\'���\01Dh\rn݂G.w��	�t����T�l�ړ�A�u�Q\Z3qs����CLHJr�V��{\nMe����;� �#w�U��>��$3�uR$�X+��5��\0i\n��F�3�069���jdx�п �����p��F�.����\0&�e���8��O��>�x\r��\0�RfѮ�t�Kè<^�Z�#V��T�,Ƿ������0;�G�T��[�(�5�B;\\ٝ	��-ݧ�������,�T\Z�u-$H���L�ݮT��[�o!�j�I\r��\0�iL��\'��!������u�\n���<���Si߸A��qs���g�MQ�\ZO�����\n\"�1�\ZI\"xN^Y�q:�:��\\�O�?ʥg�u�����Um}Y�qP��X�D�`jc_��\"\Zu:jL����C�\Z��-�0��κ�TB�1���j�`�y&9����8I=�\0��4���]�_M��ݭp�\r	��!�k�p� ��d�:$N���9�o�JGC�T7A�t5���mv�ǟ�I�/գV$�	�& �5i�3N��v�L�Hl:\0I�\09=ms@p[��(V��ݵ�q3�js����X�$� ~n��v\'�_4��Y.�:�g�P|���F� ��V\"y��?5N��-���?w�p���v,lkEF�\r�F����\n���F��)\\L�$hOt�n�\Z�C��\'�n�0õ��:�\0i7�k��l�$���Xa6�5ݴ�\07jO���I�\0�����\r{\r�0�����\n5���\02L?��ѳ�9�\'���4\rN�l�L&��������l���@DIChn�I��)��\r�5����?s����|�j�v����8���b�Y3>�A�\0b��dKI�*N � �A�\0�$I�n������j�잶Ɏv�1��hQy�����N�w`�� �s��O����]�N��)ڑCZF���{_�n�\0�)��%�}!�*R4���JrA�2X8\Z \"5)$�{`IݷN;)6 �G��\0%F����F����?d��wpBj�U\r�g��w1!>Ӱ�i�	���j�yd4��;�0=�N�AW�Z`��C��ߏ��e��D�i�i!�k�S��H>����7_��\0|�?\n�D�K��&��`m�� p��$����5��\r;��u�\Z�M\\J���X���d��H<ԋ��ܑa�G/GnГZ\Z=�S�%�t��hڠT�n�!X\"I&x�L7�|ӂ��?N�v[�v.c�X��\0�9M���E�k���<�\0�Hmy�43Sx�:&�\Z�c�\'�\'\0O�\Z�2yR|��D��#I�lw�N�rg�A���ǐ�ֳi<�|S��t�4H\Z�*:�a0y�0$��מg846gx�82�t�u�A�o�,��t �u��}v�\\��iQk��2ӫ|G���\r�<9��nΟ2�ى!��F�|S7p�=��\0ȧ\r{Z�xg�IVeÀCL`!�t%]<\0t��#F�ο�&��u3\Z���Q�\0�O`��A�g�葪�p��j4�\0���hC��t��\0�P2v��6ZV�.�a���s��@\0I�� �I{�&��p�{ �Z�qԓ�	8���A�#Y�=��o\\!9���fdv:Zm�D�d�A�tRk^+-$�1\">�g=�h��3��>�Lv��[P4;�S17<G����T���\r���;6�ƽ�\0�����p�\r��H�A��� n���c�?(�MS{�Ûߴ�\0�}A��|�׿��\Z�0@wc���sP�+Ƣ����2��9-���Ec\\�{�C���!���n��jG���d:�z/�J���@k����R�G���yx#�\r<x���<�L4��C�Ǹv�t�բo��֨�zk/���PHD ��L�~?�����5���iL��S������I&�ح��\Zb<<��Mo�;踘�-���:��	ᅛ�������\Z�\'y�-�L�\0�T.~�kZ\0��$՗z�f�x�F>�;\0F�hc�6�\0�\\t=ъ��۾^	K�X�[�	�\09�)48&[�A���?k��;��H���ҫ�V^�\Z�����Q][koҙ���I��#R��9�͂�S�cW�K,�tC��h��7��X�J�I<�f9����q���2<Z�͐{�O}�0�\0\r�a��\0U���1�$%\Z�ēv��@0���\0L�p�4��	��X`p9�)�ւ�KD���G��4G~��L��@mqn�`�{�\Z�Z����t��T����x�ڄV5���hv���d�ǧ��J`l��[�����\noc>����q� ��\n�D����`D���2egDV��$�w�<|��=�s��\0�LG��״�O��ja�U��N�z0$��v����G����$��f�X�?7�\Z��H 7����A��)vV�:`�F��F��Kb5��܈��4��3��1�Q1�M��u���d�9�ə�H5�K�V�E熴\0����n�_��{]c�A��ED���$���S�uv�|���p5�gM�2@��%�)R��;v���ڟ�)��4���~��K���a��I�����$��\0���ٞ>�׿}ɞ��8�4�lh�^����g����\'j�Pﲜ��lh�\Z�Ss������)�bcI�5D��kô���Ԇď�w\0��i�;H��`��H�����݃w\'���]�L	 ��-B�]��H��`�/�	�-\0�L\r��8�1��R7��P�-ds�r�<����]�y-��d�;@�զޕ�����&B#��K\\��3�����8�L���5�&u\Z�S@#C���P��,�ik�h�<y�\0Y��#�B7G���Q1>����{��Q��\Z�\0��\Z5C�����_m�4���Ų@�N�1��n��:�h;��z���ҽGT�\0�[�R$����D��\0��g��oi�d�El���A���/�\'A}�?M�葸�u�\0��}i���<pT\\�^ {c����U��1�Уy�ο�����S9�Y�	Rl��2�.�\\v^��h��;�J.�bI\Z�\0�j�pG\'X�J�����%ܻ]#�ȝ��Ww��Oo����yQ$�Zk\r��7��%����M��ɗ��]ZWu��,$;k��V�K��pt������g��e�kEGk�\"x��-��J�\05́k��DkZ^v��;�G�����C@4�ұ���#��:E��[+��CN��0�r���A�\'\r@~JA�K���p��KcmJ���ӵЭ�񤙔��k��C�*.�`s�T�*��p�c��M������r!@4n2H��dN��\Z�yt\0ؓϚ\Z�Lg��U3���=�$8��eC3e�\"�&��wJ,\0&����ZKd˸�<\"5��y>\'O�ZQ��$�s��>�Д�m�.��S����\"��dwN��}���ZAy<N��U6���A��C]y����\0�RM�s��\0�#�R�\Zh;�d�x�B� �a��~�6�@�K��\rp���?�DuU�:��*-h2I�ۺa���\\�04��c�tq*�����·�\09C�G�<&Ȋ�H\Z��{�4��\'���-�@-w��\0�\'s�j�!��D�Q(�9���?�4D��u�$�|��9�L��y&-�Rc�W�4�㲁��\'A��\0RF�AU3^��t���y&{��\'Yi$���H4I�kt��\0�D5���!�3��R�U`1m%�>u�����!�`4��w)��:;��\0�X~�h%�j��?�~zi�@��;L���un�;�k�3�\'��\"Td<}-\"gN��\'��\ZA��{��\0¬��>D��m�@#�?��U�n��� s��:��$�<\0>I\n�@}�5��uF��>w�\Z���]-x�?��`�lf�/\Z��7&`�n?Dh�OeP��h2֞`�����$����佖�\\ߢL8ߓ�n ���=�\r	�$\rd���B��:��Z�V;^40x�?�L�cO��i\Z��u�I�p�<p<�l�/�:S7n:���$��\'@Y��\0T��n&F�����5����b�Z2�q�ţ_�|P�֒5 x��r��u$y!�K\'{����8�Ս�V���m�x2[\Z?���G�fG�N�-Ѡ4�?���Ìk�x��}WԠ�zh�0�Q�}ێ���l�N�xh�S�8}�J��\0���)�q�4���Rs���X\\4	P�Yc��n�g����ƀrU�ØwiP\r��~�(�W�H\'^�s\r��t�J\0 <9���ϕ6�7K]��A<I��K���KO����u�~�ᦝ�9�6\0i����p�j4��\"u�_�Z�e���)o���H�l	���	\'�]B�֮�7�8�\0����p���~��0]&C��?%�l�A�e@~#R�.\r�s��B�L��A<\"��7�q��U\r��\\��Aǚ|�M<�h�u�\\�ײ�N�bx	΃�*�;$��ʌc�*%���v@�I�\'�f6)JZ��> �[�����nP��D��G�5 ��OA�L�#K�Ql\\�m�;� �|�ݏ`t�8�~���$vM�7�.���f�0N�8�J������ݸ��	�����R	\0��ưq��;wJ7����^�J��J���=ÿ	���}�ǅo�� �F�\'k��c��%g_�+M���4\0>�������\Z=���Lli�F��Qn�#�Od�+�~��Rh^A\'��=����U�ۤ�):F�~T�J� ��@?H�*Oy�;̬����gQ�\0R�y-�@��)k]�Tu�Z.��h����75�Ĉ\"9J�4�\\O����\0$���	��dzw�u�^��:@p\'����ޙ jp{G�TIk>�}�� �G�l0	�	)�u��:���S�L�nhi���P��Z!��-��`��:�š\n���Ƽ�V�i���Kא^�\0�b?uO�$ô�\n�xG��뮟�E���oH�ۧi����V�ۇ�M�\0G�\'P�+�D\\$��=�J}�#�Ԕ[ ɍt������������q����q�s�{�&G>i\n6�@l�[�AlH�/S����Z0�ؓ�����#^C��\"t���Zg_$Vs۴�SƇ�ֿ�T�_��Z�9�s�� 7��K�yi܍sX\0����S� ���6�sF���\0�w�CR�#������ZIG���&9�s*�\Z�\\A�x!��F�4�	hE5�Cb��ׂ#��)6I�qE�+KD�v��Gyi�B<�Ց�Dq�A\'�kc^���9��ou�A�BJ�?�4�1�b��ꗚ�.��^E�φ�5��9��A��� u3�����U�|hZ�~�d��Ds�����J�KA-:ǲ��\Z��H�u+�� �|Ax��A��D\0d�9��������P�]$Q�:\rJ��R7}��B#RD	��C\Z�\Z{��Bb�i&t<\"0�̆�� %<k߉iӵ-����8%KX�9s��Qۄ``yv	�ת�iц���a�ʓ�>��=!������Q�N�pwu^�`!�Z��?D�wJ2���tM1���*ΐ�`\0�\'�Sc�����=����R��Z��c�H-�#q����Sk������wR@���D�>�6��=��t����n�Q�\Z]�H�#�57��G�����RԀ:%c�hq\Z��IYh\r׺�d��=���(����۲y����$�$4hx���Snv��	��#N>�P���t��\"\0]-��v��\r��)��ix,p���i�_��G�ak�e���۲4�C�����@��|�����-7p;���o��ұ�׺6s�O쩖\r��-T����D4 � �-��v�D�2|P�}�~�G�n�Q˃@�v���Te|=�\r�BC4ԙ����7�h��ˌ�������Ƃv�<Ω�\r��v����\Z���I���;j���b�(��	ᧂ���\Z4mr�D8O�Lm �ې�X�{�H��v�=�iQ����#^͟��vý���(��;p\0�S-�<k��!d�I��H�\0{�4D�S9��x<�%X/:��x��ޖ�\r�� �|�L��{�{@�@��֛#��զ��<����H�~@�,�Od�B92?tZ��alm�(0�����̏�;���������X�:��L����rT���Q��F��޶�@�5���r��I~Ѡ�8���	i��-�ΆG%	�\ncCp�{��vs���Ek�{@�V@�:����1k�h�;�T��q�h�L͛��+����Elu� �{=]��gTV�c{���{��X��O���@��&5�9�N�\0t��l�L�5�!�A&5�;tE��K\"@%�|�č\\F�x��$����[�H�n��@�|=A�\rB����t<��$9�{B�$oQ�\n�K�mp����f���T(/c���r��Hz�����E\r�g�|�ӣ]\rВxqG򜙌7\0Z`Σ��`���cI1�}�GencZ4�ӄx��H2��Dj�i�\rF��E�	w<�D��}$K\Zw4�;��Za.;`k�\0�N1���Z������\0�O$���*�!�<�*�yr��*R^�@��H(�i���]YQ��\0�\r�s]a��|4�B��{6�:}����Q��5���y.#���w\'/�#����	왱$��8\'A)��\ZUꊻ�A-��p��X�m��y�\0�ڢ]��=�k�(md��%#-GT�S�hp`�����YCs��L�bS�׏�7��\'�Z�`@����#TI?��\0�n�p#���Rk��ƿ�L�$�����]�^�I�����:�ҏm�n$� �Dx �kk:H�\\O�!��s�\0�@�Qs��\0<���SW�٭�N�9���NIghtĸw��x�i�_��c+dj��h\'��;��\nM�\0{|<П$�ƺx�H�k�@\Z�0]�4ԧ��%��\ZG�V�\r�ݼ	���6kN�;���d=1�\r?�?t��.@u�v�{I쉴N�]w��a2DB���@�f2�{��A	��A@���\0~St�Ӵ�4N���C��-L%ػ4�#]�u@����H�#H�x��x��;�\\�1��H��	гs�\Zi<(��Hh�y�ͬ�K�����b�$��F�2���$Jg��n���_?�R\0���r���J�PwѐP;$n��$�8����\"@��K����Ys`F��`	ܮ����uv�S�\n�L�E%��2�sN��N�cT]鲉��\r���]�e���OB���\Z\\Oq�\0R�8ؽG��\0ƶ\'�O��B����\'Q��\0\r;��g�O\"��4� lGʝ@\'��$n2����S��{�v��YmS\'��&��qϊ��UV���w�L �&\Zx�J!ii�$���\Z�\'^�D�]���P�Ybk�W#�2L�{�>H�����GW�[�D�t%@����u���@�yV	�Zx!���J!1�`��\0�r��:#�I���N��H\0�i�<$#��\']c�@��N{��r������;�֚h���\"H\r��1����h\Z���~���:���$��Qv�L���iڈI&G��iA\Z�#�G�п���]�C\r;��<A:;��Eߚ��\Z�4{`�`H@O��v�����V�i���(���{�\Zd�]-����\'4G��8����\r�x�*%���<��!�I\Z�Hk-�؄1f�A��E6C����{(z%��t54��+[Z}I`��D�c[��tH#S�]���:$����>���L\0޿2�U�����X��6\rg�������Pk�ŀI��R{�\0q�[��盶60Ď�#k��:k�v�N���#�Dxu�^�42I��~�	�\0Ȥ�	\0j��D�F�h�\ZH���0\n#�\\�O:HCkCO�M#Q�p��#� ��m!�D�}ڄ�cK�<$A;\ZP n��w��Ӏ������Q�P8��K k=�N�E��FѴ� �>�1~����\'i�S,hn��o4�=6M���%��<J%Nx�f��B�_�Iᇎ��I���!��Jv�K���d�H�vBuy-��h����\0�(��Yn$�G��Q���t\n��7Q�E��N�r�x$s��J.��\Z�M)4�\'Gvײ�����uY�DOkC�lhd&mn.!�r��I�������0<|S(Z�4�%�F��$���{ctxԦe{Y��O�K��+�R�g���V�V��t�̈́F��B\0:B���4\'��BZ��U���G]B\r�^>	��\\�Z�a��\0�j�6����}�TUcM��&gUi���O�̓]��W<7@���Ch#Q���pt��8�4<q�RZ-\"ٽ�\rc�|I�O���#�A@O(v��@����Tw�u������Jt;�f{ɝc����\r\rTE���	-\Z3Y{L�{a��l3�Nwru|�1k�P�F��%�s�ƚO��?A�k�K3ո�{��(X��ʎX���]~n%���>�t<��sX���F����&]�o����d��Q�/�\Z�\0Ux�&��H`�\Z�q�5�ě[^Aq\0�CfSY�V=�����#X�s�mp�ߒ�;\\b��}K��`�\'��32�y��V��$�=�uN��KCA$�\\F����F\"�b�w�7<4D��0��Zv�?�G����s�`�����1�Y3�@FTO]����,�����_R���O�*m�Cy�A�I��rʔD���[�ݩDk��#PaY`�ˣ�\'C���\Z�a}V�x4��b�h@N\0�#㪵�ݯ�B�9i�ҙ�T/���0wa&y�\"5�f�۷t2�����\nCM�R;]x IP����\0T��H2G�r�)�z��ы,`m3���\\�~(ohݠ\0vH?�HЪ��2`/��;Jp�P��\0�:�/䧴����GJ�kt��;�@���H�� Ǐ�A�;`��;ItĐ<5J�����\\{�Q���{��\r^�H�Gh\0����$Rt ��Zv�:�cB��\\$ h�\"O;O#��<����HF���.t\0�\'��uH=����jvnk��� �q@ �?�D�:�\\`�eX\r�\n��cs���v�\0�`4�KD��\"��Y�:���;X���Շ	��^=6���	DqW�\09 �#�������	��n��2�ѯ ޘ�^�Dq!.!�N�\\\'�B�\rA�wL���sO}Z�y\0|ɅX�\'B�%�+uQHc�.�yS��͠��$׈�ѯq�G�,�C0<xN_:��B$���y��K�T�1���8�n�/7w>\'���LwQ����W�h��4�E���Rh�D�T��sI�!:��~��߅�\'|�E-�6����`n��D���\0r��@ql�ǒ��k���=�\"4;R8�<��\'i-��Vz/5��;�P{L����/#OH\nC��H����Ӫ��dCA�;����!D�����S���\n3-�y��G��lw-��v��\\�\0��n=�	\0���Ss����ժ>+uQVt�v	9�\'O�[\\A�\0�Xw��H�����(��C>�p��N��;D�d����Ky<e\Z4z����#Rt�e���*nw�n��\"�s�1�\rU�s�ߛ)v�$���y���L��!�;s?����wb���t�5��;^PZ�:\r(���h����_���wF�\r�\'�H�DwDZ��T<T�A?0N�ۂ���\n\\<�ƃ����jOb�x\r=��{Ku���W�A�a�L��P���\'�3�\ZO�\'��G��#���ƀ;��a�ptQ�7\r�yDiyh\r��z��4:}�5�ѯt�v�AӺp� ����Xn��~�Q�\Z1� ��\r�����=�kt&8��l%䙍9({���ן���\r�|1��/ꢹŒ\Z�\r�Pԋ�\'c[�[��H���i;�q�Jeۧ�߇u48���\'^�h�A�}����_�w��\0$�n�\Z!��J���tw�`�k�/������)��[F����zL{H:4ϴx���3h�w\'S�[�\0��B�67BG��R-6��c^��7��bOt����k���&��EM�\Zu<��%6��\'�wE���%�8���� ���I�m��`ָ��;wSxi8�D��F�G\\*|��5	V��Q\r�͂DxrP�S�e�q=ы�$�;�g8�i��	� ���[�\Z@�TC��A��D�\0�y�\'��΢D���R �@#����`�rIwq3�vO^�ޞ�D�1⎵���]��\r\\�k}F���#�潎���\"5��\\�c�~?�� �C��j���}T���<��(w�]�ƺO\nL{���\Zi���$�8��(�\Z}�l�v����$i���\0���ۡ��Ʋ���<���t�2|�4ړVA�4K�8q��k� �[#���P�y���GHg��2�����h�k�3�T���!��w!D�u��6���Jhku>�u�L��Z�⼘���Ŭ�S�\ZH�P�`{Cb~HE���i��\rO2��6��8�`D�qn�#X�	�:=���^�`x�O�\0\"fG~�H.��\Z�	��YE�4�$~w3�\0��(�6TdV$�����i��4�e	�\0\"v�O(�[�\0\r\0��B$E$P����F����\0\0��*A�Ppg1%�Yd�U푤OA����)-];LV�f`�@��$WTo;��~D����\\� �u�ʝ���G�f���O���<[_Ӊu���\\�2Z�-�4��\09�4�LI�Rn=E��;�T�TϢ$�{������P��+\Z^ٞ<�\'ur7\r��R�ǃ�{�]↲���$�p�%��{�P[Ps�$Ǉ\Z�F�Ǘ���2�Y�������h��79�t�/�	̀� ���䡧Dcppi^��A���L�lq:����t\'�\Z$*��ݭ��\0������\0o�)ä�!��Sp���4:Y��5��]݈#}��˼\0d���04$�$��1�����V��d?ଷkI0������HcuW�R�4������iF. h` 88Y.x���Q�6E��]X:����\Zk�\0L�I�ߝ��|�x��#�.\0ɰl�qI�k.3���T;��ƃ��k����\"$N��E=��~���I�������q�\'��J7�\0$�th�F�:2\"���\Z*?�ߖƉ��f�i�	�4<����l��]����8h�\nw<�Jø\r�	�a���]ﾬ�x�̡�\\�I�9;�����A1������[�LB��Y������\0���@v����\0�r\rM�`\0�ЍO?�E�o晔�w+��ǂ#N�O�st�);�jJp|t�(��,�;��	�ʜ��F�tQ:��|��8h���\0���쭭w� �Mas6��4��N�=�u�yN�0N�@-}:��uJ\r��(n ����\0��]�\Z�FRZ���9s��\0�x����In��Q�l�]�4���\nzD�C�\\$�J��w�iH�{� �R,�?�����u���ѝdcR;Y�o*�o����Fk�v���і����88���@B{^ZIF���k� G}R-F���\ZH�U��y������&;�\n�;{{����6��v�\"\0x �J�y�O�\'eL���ƈ��t��Xc�@%�|��(�J� (0�\\u�<��T\\�07v��=��${��\0I0�p���D�O@��m��\Z�\\�$���X}�sL:G�R��8��\Z�S/Z7k�K���~�=�\n/���>	�t�M�B� �\0�O��fa�h���B[�����D/Stb;���\'��E�v����K�\0��v�I��M��I������\rh���&�N�^Gn����]ߺy�������V���y���M��$4�uI���n�-�@ۤi�����pp�=P�	�H����H���d�4@�\0�e��w�cB�mZ�|��0���?�\'�^�`0G���@�V�5�U�M�D���ߡ�K��3�A\0{��P\Z=�u<��q&�J�cqwa:������B�.\"G�A��+��g���$k\n�!��G��,�8\'����8A ǒi\"]@):UF�N��2�t�9��ޣ�AD�2��\0U�7H<ƀ���&Z�v2���2��e��@��K�@0L��m��գ��\0�����Zm0~���ֻO�������w�\0�����͞5�F�h��{�t8Q~����T�Z%�:�&4p���K��k���7�x��^_���\ZwV\Z�ˀ#�9��Qgf��L&p^���\0CS>�4q�����h\r\'BF��=����Q.2�E�6{�qp0u�)�5��\"�L��(���$����^����\rD�?��N�k�	=�t��A��~*U�n���0ž���œ�� �Y���qq�gI4S/2?\"�֓����V� ���1�-%����(\0ֈ^T����w\n=SL��P�lv$x\r$)�K�� �X�\03�N�5�؁z���\rn`g�D�Ѐ;�\0\\N��5� �����M����$hA�O�rG���-�G�\'�\\�]R#]�ʎ�/�$\'�\n���j@\'�3�7���w���1��BM$\0���为R�k\ZG�����A�<�υ`׹�N��{�I��af�%�W�b]�E���̢���U{\\�e@ Y,��ƢH�&k���%E�{d\0K{o����2R ���1~�A�<��,\0�\'��M��PH=���ɀ�gX���wjI �\'���F�h�xQ\r\0A���N�\ZHp��k��O$e�:�I�rP�d�g�����=r5.��l\Z4(��~i2kBm\r%����CDO.�R�\Z}ӯ�A�̔h�E��ZKH&In����o=ςg�׈�UT�u\Z�xK�u�ZU�a`ys������(z�y���VUn�O�鹮��׊d���^�� ��&>ip���<d)6��|8��R!�{�7����!��$q�tU�}�\ZəV����vU���m.��d�-|:�Ѵ\0�/�p�,Sl�\"Jk%�M�~��%Ke�t;����{xi�\0t���&�;�q矏e�u��Rh.;tʐ���N\\T @�\\�e>�����Xͺ��cq�B��c�ô\'XS9�>�?ٴh�1���\\=��/t��|uQ\r��K�]�\'\"�:�P�փ�~�ʾ��.��\0�ƺ\\\\\\th�{�\\Z@�#�Qp0G���<;�Tz�.����\"���?K�m����v�DԦDV���Ѥ�#�}�:�>�RgN�)\n�k6�����XXw4�5o%�}�.���Zө�롭$��%�ޚ�����\"9��K�����\0paL�byO��(y3��|���L7wi�\0Δ�N���D��	��!#�C&���v��h��LL\0�Rq���h;�ϲ�@����YH�\r�aK�n�gc�Np��$�\nq�\rÿ�`�e�)@6�c��]���B�ccw�\'�(��x�\'��VY�h�k��c����2G>c��\'��p �4?ͷa$�Gn��CAc�N����\\Ҡtp�=J�^�7\0��\r�k�i�5#�$\0�$�b�>u�X�,4��@\ZOdv����$�s��Ht�\0�?�$~�i�M��}d���\0$��\\�K�����J�`\0��O���ű�Zn7b��1�G*G��	���wYPb5����� ��(mu���f����4�\ra@�Lu�Ǆ����\Z�������\0\0���J�Vڦk��wLEfZ\0q\Z�um3������Z�D��>JBkB�x3���Op*�ph$w<��ѹǟ&��\0�I���u.Yd�������Mn��^fI0D��;\\����<�	���!\0�ͦx����R\0������=�\"}�k��uHE6ĸ0�]\Z{t�/TO����\0%7�ǿ���`l��\r��#{D(��U�@[�x�Qs��\'�e1c\ZHi�|9P{H\Z8�S�4��|��Rm��O\Zk�ca��x�9`��M╮�K���$	����ȓ�[�ے���v��rQ�l�\0�<�?����T�LN�=�^e��Z5��״8��Ϗ�K���t\Z�;|}+�G\r+s���t�HB�c��<���k���*�$	���+��q��`$˝�%;�_;ƿw��1 �����w��K�e���O\ZL|�����f@:���I��IA���\'&)�j���R-&\n	_t��\'t����mD��\nU�0t�D]�i��s��i?�����$D�>��ȇ�i%�^t��P��6�w�d�z�@�˱�:���L)3On�@c-h�A*{�:|>_���RH�H㤃>e�\0�b�\'��6�@�ejv��i� }�}�\0�۲y?Hjxׄ�tM.�����Qd8��t��#�xE�F�Dj��).\ZΉK��RQ\'C��c\0������타���\'���}#<�*2w���b[/#�I�6gC>Z쨽�&A\Z�\0r����~,� ָ7��hGk���<�j�8A��qc�iv���;��t5Hf`\r���gZA\'�4!{�\0:?zQXַh<��9RN�j�\0ݓ�xF�4X�tLl\0\r~��M��H��ufI\n3ʌ��)��\0Y@����\0�9y�a@I�\'�;�)Z�v�u=�S��pP���C�$���	(�8\r$p���L\0P�K`�Ot�=�!:�K\ZZ�Iqk�x�85����H8��|���9�7�x�x�:�N�kYW�hc�[����\\���6ƻ�����d�{(�\'^ԼLP��]�P9S���$����e�&O��L�w�@\"z�&+��m�I$I����Bw4̸r{ ���l�.������$�&e=. �:�l��|<>	�� 7��dB��<���d��v�j��N߁�Vmn�\0w%#c��DDkr�+菙k��k��(��v�␰���H�z��\n�d����v�F�!>�jF��c��˧Dv�#}�5�@1\0Μ��(�� ��!E�p�;��81��P% %���#Q�@���wd7��]����d�kH�	�D�R��H�L)4�\Z���]#R��Qv9̗��I\"I�Q\ZR���F\Z�\0���D\nt��@��٪UP�g`-\rZ	U�6��<��\05Y\0�l|������	J 6ac+���4l�R�\\�\05�!U�$�D��aA��hQ\\�4\0��H��Q�ŭ?�x\nOkY�8�D\'�\rd���\"�_G\0I�#��n�1���w8����Y���K��\0]�CUKE:��\'�?��̢:�\06A�;�#��\'��KEެ.!�#v�u�MIh\'�<��[65�{5#Y�P��M{�?�?꿲��\r�.�Tŕ������ea������sڛphn��k�^w�d����H���E�Q���7q��L�k�q�;)�K��jgT[k����:��5�]Ű(X�a&5�0����q��֖�\r���W5���1	D���D�md�4�N���Đ`��9�`�\"\'E\0���<|��=����5����4�����-��Uw����xx�lk�El��N�~����%�Efwv�\0R�SLCG����\'07WǷ}5v�R�Z[�ws�\0�B4�����S���j]�;ʉ��aB���9���v����S.$�$��n�w|5\Z�\0)6F�G���d�{�hqv��t\\�o��l\r�G��1�����(A���	\n��\r�4��b5!l1ϴ3��l���]3 �̠�:\\��x���OҗF]��n�O�\n���n�Τ��챻|�\n`�4t��i4�?���%e���tPDG���$vRs��@��N�����$k�o�Z��ґ]UP�4�i��TL8�#���s��ΛOu�Ǉ��0~��\0��c�\r�ͮhn�	���\0�؟���K�\Z��N���Ё�\'n/�65ݗ����ء�.�;�7y`�}�=�JD@敒��0���\nU���-\Z��[l�O�]a8F�z�:4��;�08��$�V6�^��J�M��ٻ��\0:CPh�\n�XLY\\�p�;n��\'����}V��<���EDIl���$�\n��^a�N�ޣA��8�;��;��O�쥍C,32���#��̞�%S�]H��NO�\0��VK��\r;B���\0��~*^����\Z�.\r$\r\'R���Jw���[3�������|�\0\"e֗���ir��@\Zi���\\��O����Z��#�dLq�e0�]�{�P<u)	j���5�J@U;�\0N�A�\04����>ƚ-���ռӴ��%�n���B����\0�k��-�A$Τ��D�U�\0��JCDB�\ZH��I��&�q=Ӓ�����h�Ϳ��B1�&���d��x=�a��;���I��I`�8u�����o���_����[$i�Fx�O\08Au���Ji�� �E��k�8t�x�QO��x���P�ׂ�t���O��~���	�p���B\'F>��B�)icK���Ui���+nq��G�����n\0�	hk�y������\'�+�ݾ�5���%��H�\r���w��Dv�%a�AprX�is��΀r�n�9�S�}D�4���{;�0�<��A��\"5��A��?JO��hj�e���:�vOe���q\r�=��}���u��]�U��4<����F��<��+&6�\" �V��-����e���3�n��I��� �eL9�s�]x�Lux?���ξ��mh�N�2$k�U74�\0L�>jhk�\\un�C���~?��\Z]��*v6���$�Rh����R�k�Sю�<\'Wc��0�fJ{��$�*$�\0i ��)x~Jf\0h��t����G�;^�Ȟ;��`.����Q�D�m��C�!���Z$`j$���83۸L�\0�x�;�~��q:x+-��no~��c��xhN�h;���Z�F���\0��A�E��\\��g�3�_�S6o�c�!Wayq-�n��φns`�(����td@��.	�C�H<�!0g��0	�G�6���Ψ��h�@c��53�+��NbSk%�ʢ�$ws��R76���F�����@$��ѩ���+��������f��!�2y*)@��A <d����㠂�^���r5���NkctÏ>�U�y\'�@��$}_1mV���@����6?5;�hv�k\"P�O�_�j?7O����\"8���3�1���:�\'ٹ�O/��h.kF��:����A\rL��u�\0>5�K��������I+~�m:�W�\0�\"P@sD��j�\0�10�Q:QQ\Z�JCv����Ɗv��<4\Z	��Nѣd�κ��v�� �!�0���\0��)�1��������n�	y\Z��X�	I���.�;���1����T=�;��xR��C}��)�����wo�\".���u�1���x�\0�R�M����;��Q���F��m���`cx�L���_O��3١0�5%;e�5��`�Bk��鸐[���\0�\"�sD4mn����I���)�A ]��\0W$n ���5�=��{��@U	�a$:�&J�w]\Z=�㨇�l>��cRa��x,���v�\Z��Ĉ�_��R��F�QI\Z�wN��0��\0T�[dH2%�(Rִ��$:e�(���Ɏ�4��tlu�o����I�//� jG�IH������C���N�R�4%[���였;���4�;h��H$��h@��^�#R%)ˀ;F����a��R,kL�IUE�톷�Q�>Ǎ�\0��ԣ!�_\"���9.t<����;6VݲK�:�J��8�Y�-��`/>��5`_��b�5�%n���t���l:k,Ԇ�\0�|�Y��>k�l�Y��@i�� ���ؕkc���W,xq�7G�2�\"|SAc#a�sG���\'to>�b �v����i�\\��N>��D:(�U��4l�{OS�i㐂܃�5��聡VT/Zl�Ȟ�ʨ�5���|;iI���d��7y�>a#Ga���V���<��\0��e�]d\r?����\0�<{r�]5�N��|�\"�����j�\\�I�U7~�� D�,0捞3ʉ��\0�o?����m^̜��>�y�M�\n�.2o5:�q`��.=�#�F��VF�\\Ɩ�v�N�j{�5פ��\0&�k��t@���BT��$D%�	�#�Op{=�	Bk,y��\rTdѠ5d\Z�%�x$��	��@�Q��ַk^K��Rm.\0j;�Q�]��[i��4$ߓo`�����T��I�%���d\'9���\0��#B}]��^��%��1�?�%&��3��S���$�O&�R!���w�8��F��.\0v*$@\"$�v�Sh\ZxvHY\Z���t+l�s74�/<�C}E�n���\0$�ok�<�Z��<k��\"o�=�}��6��\'VI��$��C\Z\Z=�s�\"M��q5�\\PK�$AwRm,a�8��f5Ē�\']?�Q	kLm��#w��gf��ƤA�DZ�CI�o���X2\0:ϊ}�:\0f5^?98D�A6����ة5���\Z�i�:��0a�Z�:��;��t��?���OϏ��f���|C��H\ZwD�-�L�t2�ڷ�@��3�H?=���@J���U��M�84����*�qs�����R�cn��o5Du�a���ܢ��v(�KZ�tfӳpo�\'Y�����h�5&P\ZF�Y;�ׄJ���8L�\0�<K贇���_\ry$˧M4�SY��Ӕύ�8���pkI\"|�ٽ{9գ\'�Ƴ�~(E᧙<���<uBum& ���}+����|TC����r��N���q?H��r���s��M<U{�	7[vZ��K`4���}�V\r�2u�P�c�[���� F��]��CfF���R$�3Κ�hO�hG����*�i��y7�vM�ϴJ0s6Di-Ug��i��8�ƿ���^�F��f8���\0x����\0h�«��4�`u:��!��ȟ�N��!%�6���>\n�չ��$~���5I�q�3z��pI�F��$+eЎ��h�����U���t���7pbO���r���Kv��+\"\"�*�\'�1��\0*>����l���\Z�O��/�\\]AWt��L�|<�m�\Z�O#E��\Z�;׵��\r1��$dh�� j�d	:���.����&4��H�	Q-C�����R$\r?���\"\0,��\Z]�	EkƐ�h�\0j�*;[�Edv\'S�9`-\r����: �j��A ��s��$��%;\\	�a�n�D5\r�����`h����c�_�і�5�i�$���%���%Ѹ#������v����Ou,�N�M$�#Ke������N ��J.w��Oqʆ��L�N��Czs���4=�@KOښFLj�\'��R�l�7O\Z�Z��h����R���*�-�L�)k��k9�Od<�1�:�<�F�[$C����湻6�������>DpևM�����3]�cN��mч��yPc�v��7\r��%ғDu\\T7ǹ��7tmq��(-27F�E�&t	ѡ��gvd2�hдv�*��շR$>:�n�Mt��\0m������jl���]���Dp��jU���N�������v����É�;��YE	H���H&�-��MGq09�?�����q�����4]c����?��d�i��shq\'��^�7�	z�\'m�ڈ�$q�M߾�k,s�cDw#���Pȓz}��\0(��_؍A�ª�O};|�qk������\rI���Qd6~,�v��{b4OI{l�s�f��\0\0�m���	\0���t Izxz�R��k��V��]�52R�.-��\rH׏����Ka�_��z`h�g��@��ŭ�Lq�`#�\n�pZ7o;G�%m5X��\rß��pe����ݞ.˧!*�K���c]���l;�{v2����Ďd��8o��#�l��\Z5�w���L�\r��fTߏX�1� ���5Sc��3��\0�� _�D��Y~���\0i\"�:�$\rUǑ\0��T_k\ZKZ4�S$F�j�$��W@3V�dm2��m����\'���݁�@/�Q�����s����M@������5�<t���;tF���(��7��\Z��B��a������ө�۴�� v:��a�&�\\$@��ah��Q=&ǿo���v��:Obt!1��O�t�Tk��F2�;���5Ck���4�*U��7�������u�V����%��R�Ѹ��;#mk�-�ҘQp��az�Aⴂ*�I� N����F����a3I?A��;!{��4K��Wo��&G>�x�k���E0�9��q��\0�M@�\"� Վ�D��5�7wG#kt ǆ�^�� j����|�N!�����ԑ扺��#���\0�Ppi�s#�)�P�����Q���>�c)�\'&\'�w��3�� Ge�0�~~H��Z	qy:�ÿ�J++t�>��d�Dh�u?�D-���� t��N����(ǨI�)������c]yR��\0~!97;pj�#�!���ѯމ��]�tBxw\0�5��6*��X�p���-&&g��\Z��\0�!�akdÇ���� �Wqkb\0��\"���`8y�ܣH\0z`|y�\0��7�A��|{���˾08\nvmw��������S�	�%Z�WD�������gㆼ4i��I�{O�<R�7j5���w�\"�6SP��̡�!���\r��6�.y$l<���GN����k�����.���u<B�	�٭:�h�c]�6���4�UB��Ƌ_c��\r�fN/k���A-��#��P��H��ܨ1�q��n ��.�)�;�s�h.o�G�Je�ht��P.p��9M�]���(�j��w��F�$}\"��$�&�D�D������xꑳ��\n�k7{����)�`l��x�4a�{����zb_��;�KP}Z{Z׵���kX�\Z�w�ݳ����ܕ�lHxkK�<�Oa�&U�����_ �6=@~����oӯ��T�k�Z����f��c�Zb{*ւ�?$�j��8Lj&���M�ce�6�A����_B㽦�0K�i$	��ځ�A=\n�M�b����I1���y���w��KK&Hn�����ևn�˄�?/����5}��X� �:	0�Ц�V�t��i�z��\Zd������@�b4��)�@�\n�@#R��=�Ӑ�݅�Ј�M�����DG��\08A\nta.�����$�\"oq0ui���sb\"8��	�p\Zj`Ʃ�i�n�������o\'�\n�m�U���g��\n�,~��8���(�!�{�\n���dn|Kd�����x�.ho~߂�elo�p8c�:}�p艔\'q;�4R\n	w�f�3�;�\0���(�����O\"P�V��N���\0i�r�$�/\\4=������|�Qkp{f5�O\nt�k���?�|��f�q���&�����d���	/�������G��6Gx�ED��>�h���z�#�I�Qs��e�{�B�m��n���\n+�-F�eN V�V6�{@�IT��C��4#��*Ѯ��A���i��o��᯴s䌢H��*�\0���-,�M�{��wh�b	���s�����(8<>*2�����!�5o��P�<\'��I.��q��\'QYk�I>c�*\'n�\r��@*�8�0��\'R||�����e�A\0�O]�8��\'�FU/P](�ѵ�R�\Z��eF�Xy-$�Ą=�uQ�(�~�w��|g�)����XA���0�#�O�\n���^\Z�\09�L�H<�F~��\0� \\��þ��mږI��oJ�{��ꚭ���Xݤǵ�\r��i��#����n�t����ͮq6~%Ĩ����^{�#�el\0�\0O�5M��v�\Z�N�7A���*�3K+ݺG�4��D��Q���#o��?`hh\0�����U��1>��\'i;I�4?r�L��:����uه��\Z��@\Z̨��$��d�n~�.\'�Pnvɩ��9=����)�\"JZ-;\\����#�0��D���j�F������e���jI�K�=��!E\0�ˌ�\'���0�4�c�O�����A�y���i\0�Bp\0u�x��zh��8��85�>�@�\'5��	��0P�K�@��w���SOԑ[�����#YU���y2�zv����UDF�j<��=Y1ֵѝmqt4I�Z�Ht���&�>�|=���\"�$������Q��D���In������؏����hP�7��He�,Kl����h:���\Z�w���L��G�����i\Zr�I��\0>I��[ j��ʃ�?G��9��;�Ɗn��m&8j��T��:4����|x@��q�dA����\0hēq�%+HEe�d�w���$�&{�7��`y��6D�\'�W�U�rK]�k�\'�$��\'�\n۶L@�.��\\�Yif�A�F�\0k��BkKk�\Z�{�\'�ƶ�ڟ5a���l�w[w�p�	�\\B���\\}�?uI��ts�c��߁��z~�;�\08�?�Ho�D��]��a.�#��\\C�3��$O��P}��b	��`���[N��L�|Jxۣ���+�I&8�M�I�l�����!�<x���\0��@sˎ�Q��t#e=$[ �bv�Ƃr?�lJ�ti�vV��d��|~�0�N�]�io�L����D�x��Deoq:�7�A�E�N�3&�#AQ\Z��\\�������i��E+���:��&Pw��Lv$*�?��c,.�A�\'O��+����X����q��U�F�	�{k�����G��\0ȱf�1m��%����c�We��=�C������X�H]Ή�Qm\Z��\"KJ��D���e/l�L�diLMu�N�b{�\0���ƃ����#�A���\Z��A�#�E?���L�d���Y[�8�i1���O������yO�{(x�p��;#v��i��r�Ϡ��6�:!��}�[�\0V���n�v����I�n�}%f9�6�XL����<�K�U�@qn�Io���Z\\\0�ܯI������Yk��1� ���e>���p���3!�;�a$;h.����[������8�Z%��恵����R�gG��[�s��v�ai�ϵ��\0������D*X*�5X\Z��\\,���ѹޟ��[Fi-u[l5�]�}���ҳ�����?��7D6[#�a��Siw�\\�kŎ��l��w�^�\0�h}?�����>\rD��Ak�eoo�1hUC)mM�k��[\0�!۪��c������h;=�f��uU���{n�z��CH����Z���Q`��\r}Ĵ��n�o���?�)^ͭ	|8CƦ�����[Mm���t���0mf��\0V���͏�U�H&��\0<�pg�ͯQ\"u��&�����~�8�	\Zϻ�nw��~�\0��\r�W>��=�)��9�%�m�v͟C�z��k;��^��at0C�`-��}�(���Vp�pu�{偭Y���؜�����L^��E~��\"�E[��!�������=�M�~�Ahku:C]?Os7m��\0��.6,n�d�\0q��g��z-��a��]����ߚ�#\"h�W\0�,�͸9�Ɩ�][C\\���n����\0�T3:k[�i�5+{��tkG����]\\�X|�nh ��3r�W�϶��%���o{��� o���r0o���.\rv�K����~��#�I81��s���^�md�9ս�C�9���K�[?3��tCU\"�Um0�]��z�f���Z��5\n���Xg�͇	��]�c�Tl�Cu\'N���K\Z=�k�28�n�J�m�q�%�]�x+<@�\Z���1���{|{5B����9݁�ߢ�x�;o<5�J}h���I�Q��cK��{��{e��O*uK��7HЏ�c�a�t��\0� \\Y���	\'�?�N��%�>��7����|eV�}I��$n�G��~J�?I����zl-�f>����(�l����\n\Z���Q�����Tv�id��6��3���#���~���.^�� ?���C�DZ���hi����I�+��u۩�a~��a��?G���Ui��nEN5=��k;_��{}/��b�:w�n����i\ru.hc�1�������5i���AԼG��w���\Zv̑����Z�[��yѼ\rJ�l��g�s�9Lvֶ�ǽճ�-�c����::s��`���ct?N��O�����=���W3�ւ��\\��A?����s.\r-�:A��}��V1\Z\0��Ȗ�F���5���C5��uwa���G�}=���\0�9	Z ʰ���ɏ�j3XI�\'^�p���sC)d5�\\H�_˱�g�b��\n�X��}ہ!ޟ�}7\'�\r��o�OW�f=�ix��a� �\0[�7+��T�Q�as��t���5�\0����j��X�H��Iݹ�Ȕ-�f?�ҶX�.\'l4\r�w��أ�N t�/�(���k�`hx\09�.vz�����?F�C�q��Z,�}-}�{=�\0���o�t�[�v���!�O��Y�����%��q��q��X;�~k�����\0	����A��5��܇���=3Z�`ƴ��w�\\�75�6���#�6wH��ε%�;�u�m{��z�+M��Ŷ5�zLe�s��G9�^�{��|J�n�	k�n�as_f������A3vu�(h�4�8	�|9jka�.iF�\r~ks���I��i�ˬ.��\r�k\\����\01`�P}9���S�M�V��d\rHX�{�w	�8��V���H�F����\n����V�5��jk\Z�Ꝥ���)j+Ǣ�� DL\'T\\`C�?�v��GJE�F�h�9���4���5�\0�������c�EDCw6Z���?����\05���_�H��݉q��������sO�V��\ri\0I-`���m[�xT�i�7�ہ�w8���c�i�%^���W��2�k�A�Q��������\0��\0��\0��F�(1&��4Uc�c^H����������o�湄�09��_����������k7�����ۿ�~�Y��i;���El�If����\'ҷ�}�?G�3P\n��)�:�d~��6\Z���{m��=��U2:}��s�5m�s�X=�����E�mE����>�l\"������o~Fʟ��\ZG\ni�=�&KZ���>������>+ܮ��5mO��ik��m&}���/������#�~��頻a�vSZ�䍠{�ٹ�u��Y��	\nh�m4c�wՓ�U%�Q�\Z��d��5�,yt��}��I�9i>>�r�\"}�H�?���q����\\>���,$�@�%]��\0_���B{�����?��^5�\Z�\Z/�8tfl�S>=�U,���1��[j/��ٝt� �N���D�d�[��/��`��p#�@\"fG����Ď2u�I�x���\rp�̝4�R1;��.��F����s4�li�t��k��i��l��_� �j�x�$�*nhh�Aor?�.�b\Z�>:���\'̤��*���oW�tKs\0<��&�ƃ�2O��m���N�8DD�I\n$\r\0j�����t\'�(tp�5��#Z/��Z#^ �CǴ�pܞ#��Zeы\Z�潰�F��\01D,n�c�<�$���kKN�#O�ڦ��4o`9N\0j��ն\\��Z;wR�{�h\r{x��y�$+�L���SK��j��\n��Nƻ���uo ��ܘ��jc{�\Z�\'Ǣ�84	k�5�;����ʯ���i#��J^3^+8E�,��y�c�I�m$�?�̡���.�#��^��#�L�up��C��\03���[@�o:�h�+{N�jL;]4F���>_�J�D�l�ٶ�q;O`uSǖ�`9��.8�8O&QF�� �=����JA\'�)\"$��B}u�gh²]�P`�Dv�J�.�H������Ou���O���D��\0	}��g�����v�V���Umq0��h��l�j}�l�ƀ��%��;sۼ�S����nt�ii�$�\n��h;�\0�u�(�G�Ń���������cd���+5��k�鵯$������W�j�:=�N���P����$*�|Q�O�-J�j@h��r���&��[]sHs�Z��H��[���ǰ��H-�h��ID�������jӨ�#��־�3�|�4�^�U��\"KF�_�Fƻ�d��<�f:\r�.&o����\Z�wr9�\n�\0�u��$c�3��!���O>�9ۈ�t%X�@۸x��ƍ�4�s�\0q)X[��.��$]?�����o��>������}���e��\0��C����&�\0��ӳ�1��v\Z��l������7�؃��m{`��.l��v����jad��f#A5�Viqk�[[4\"I�ٻ79U�����Uy�����C��V:���\0�(�e�=�2\Z�<�����jΡY��ZmkA-1�}�ͧ�(�\"�w?�:���g��\0m�Z�������������8��`#��u-ۯ���\0I��D��m�Mo.\Z����=�����t2=����\0�?w����2�\0n��v\n��k$�kƤ7W�=�~�T7��X�;��n�@��nǱqm�̗��KC�����ߜ�����@q{��v��o����l���\\S�C�����.�!�۵��lܠ[�]��k��\\C���{X=�o���\\M�4G�Ee�MOuNq.s�s\Z���r�E:\"����vY]��ɱ�\0�T�m��WO��q��e�^I�����o~��[M@��d���M��\0+߹�օn%��\r��k�t���\0�\'HP@+USq�k�q��� ~��}�o��ߕ��[���[g&?��\0��|���`�TG�;Y��G����}�tRӍif�c}��;�������13��>I����n���@ԉ`I��I)��\Z�=�A#���n�-F�}��Cjo�s�\r�f���?Mp�9��k�ۆ��?b�M��k�]����[a0�pH��3�\ZVu	��x�{���#U⦱�a�S��s���?�{�<����?�����m��\0R[��h��I$ oOqe��\0e`����?I�w�P��Q%�h �����kO�J,��\nka5�\0�\rl\r�O�}<�6���-�5�	t���\'�궃�ވ�Cj&\\H���v�~����\0�k5�)���[	.t�Dn�3�޺7dA�Z��$:�9�ME��E��ZH>�I�7�i��<�Kݤ:=��\'��\0��(y��\rw�=��߹�}뭮�������xee�i������W0h�~=o�����Hqk��T���9�\"$\0���;���Y����5���j�ck%�e{Dџ���_��X�Lɫu�[Q�}�>��Zǽ����i3!�{\\����7:\0����\0�}4��,�z������4۷ݷ�?�ջ��̡�Z�n{�A�I%�����o���;Z�,��\r�������=�����ϣiL\r���P���\Z��WZn�����#p���E��nKItWY���\0������Uا����骧��a��k�s��Z�Y��+:�\0R��s�eŤX��H����~����uoF;Z�y��!�5�Ӻ��k�����d�\rj鬶��c��Z	���=��\"���0X�;l��D}�s��\0�?F��U\0�\"?][e[X��`��ݥ��m�\"A���9�[������Dw�W�=0��ԃ����L��dn�Z�.���;Ek#����T�����o��*�p�c����8��)bGB����=����\0�:]���Ϡ�읎���\00Ƿf�M�\rٹ�v�v���\0=���\ZX� \Z�$���N��i��u�!�����dKe��\0]�K�+���=Ŧ\Z���^��\0s��\0F�qK�e��J��?w�}?}��-����铻�׻�}/b�<�4ْ1����qh��Y77�� �h����\0��A?M�l�\0F������TX�@s�#O�����1�{w�0\0���������\0q4\r5D��M��%���#� �{[�zv~g�}/B�Ѱ�\Z倴H���[�Qk������\r�v�����P~s[t�7D0�D�Z�; �+p�\Z/��r��m����o����\0�T��+ك�}��p{����kl��O��P��Zg�d�g��5�}�y{rls	&8|\0F���QZ֊4��9X��E@<���5��W��o��-�hb����&o��\\�Lq��\\��\0A�����N>]Mf��p;��g��{۳��]���	̮���\'MYm���F�tEY�;�Y_ٽ:�m-sSß�ڽ��o����\0�JU�̜�ӑ]>�!�#����\0Q��V���ZC�r��ki-��pt�\0+��u�Mv���0��k�3��齏J����*���e�nk}�%���;���\Z1]~��)���b>�_�����F��gŶ��F�/��F茶���RƼ�Hs�M��dA����][��v=xU��F�[C���}���1_�����6{�[��~�@l8�\r�t51,�m�����\ZX	�\0�{�ps�O��h��;w�k}��Q)ٖ�=7Y`i��H��\0\'k=�+ ���U�qi}�5�{�{���~����5ޫ�\r��\r������\0�v d;,4��F@��5��{��c�KN�\0v�}��R	p37��]�~��C�^�����\0M���}��\\+���J��Ʊ������t����@�q8���L`i,��]����\0��mi�7�4�,���d{w5�ӎRx��o\rGK��}*��\r����[�����HYcV-sCXG���9�<zm�X�r�􋼹����Ü4k�-��nc}���\02���Ev�>��Ɨ�R��uRc��&�zm������\"M�1�t��nl�Ը9��\0���1�Y�N�p�݄ͯ��Q�x�>��U��U���j��w�l��+{�\Z�\0:��\09���	�\rzt-s%����`��#�rփ�K��[M�7R�yi��d;s@%�������\0��0\r/��Ais�����g���\0\n��(����z9�\rt���ߏ�h�K-��֗�Z#Y(mh�s�iq1u�w�~����{2�?�D�!�i���֏��~�����^��tCGJ�uB�Zژ�Aô��4w��\0�ln���!\0>K^t���\0�ض�Eoe���M͍�����l�����\0��5k�����v��\0�g�|�h�����3�P�C����G6G��g�O��􊛰lu��3�s[�$\0d�\08��\0�].=;��]��׏lm�m},o�,�\0��\"�쥵ˀ\0��@�}ձ���o��\0H���-���}Oun\Z�\rp���Z�>+_���X��1��a�e����?7��Yy5�j�`Zo���*A>�f=��KC{��^�:��4�	U��.0�\'C�Y��\'\"�*h.���\Z#��{��r��\0��G��\0�\"���\\A�NRc�W���a������h���\r��`n@��c`8}�{~�����:%���\r����}n���������շ�ʙ�\0\\Qf�D\0W㆖^i�:���\r��-�G��������t�rZ������s;���ۛ�����HzvL��k��~��a���{6�\0����c�Zo\r�F�\\CC��Iߡ��Pq�2p��s��f�;v���^=M��[�g�/��V�m/,��{-����4n�M���~b�MS�5X��7Ah/���C���S?�1�7��d�*6���vWS��\0{�����k�+������5�-$�0c�ݛ~��v�����lQ�ݢC��^�讖��sˬkl�bK�qs�f�\0W�,�lY�y�p��Ã�5{��l`��~����:�h跄n,8-s_ 7��4��[��a���\0x��\0I�/�4�0�d� i��5I�o�1�<��������$tV\Z7@�HRfC�>����!��}�@�Q���Z8 j����U�=�����\0Oq0�ݹ��|\"$e@V�8%��#_�ڵ�z6-�=����c�>��K��W�nv��N\Z����9��Ա��W4[�(!Ӹ{y5�3��X�����{} �c\\��w4���?��k\r�w��徫��`��w�s+�{g-�4]�Mw�	� ��\0�Rqi�G�T��6���v��+%��e��u�����ꃙ�k����D9�2d���U�tD�h���Y.�<ba�l���+c�.uoe�!���f���o��%a��,c�[a,t;��=���\0�1�A]f5Y�m5��+x`sl���~�c?}G9t�/�/�~�\r,~����=�07�gwg�m������V�)�Z]W�����n��o���{1������� �;�z�}�ES9!��->�EՊ� ~��\\���\0���ޚ\0�5I\Zlչ�m����������s�������\0�R�\r��v=�xӰN�����}4JYO�Y\0c���������B{�ͱ��A�C��@��k��[o����(�����\r�S�sK,��������_��2�\0�\Z˃�4���<+ړ�\Z7���>Jx�K\'m،zW��[��h������?EX�����\0�t�UT\'|��\0\r!��9=m����|D�L����[�Qڟ���22����kw=ᛠx{�{jĳ;s�汖��k�p;w=���o�vO������i��s���\0�jC��kÍ��}�tI/-k*����5�؈�0M��ԫu&��8=�h�ݛG�w���Oz>k�=:������?�?I浙>��xi�i�����妪�e��5�5Ę�A���ٹ>���^�c�YU�\0�!�A>������\0��p�����,xy�0�ַw�=���\0���6�=��K����\\\0v�mo�o�ޯ\Z��%�{L<흮cyXПO������ی��$�v�Ͼ�j(�\'i6�RA.h�\'��I߳w�ho�y��v��8�\0\Z5�k?��R�8T�m��oi�:��G�}b7�R�ūз{�Ռo��\r�?���\'+\Z�SCj����k7��{]�O�֛�VC^�߽�{�D��7>��g� 招Ey56�-6�`����=?M�\0�N���=PE���\0h�5��\\����w��+u[�`�8\Z�n�I�~��qV�E�\\Z�lw�,�Iw��?�@˺�Kf�Iq:����g�Ζ]�{E$o\0��%�\r��;�(ȴ1յ�u��,kwI����{\Z��I������<��c��D�rp�/��/��\Zog��>潌���@�F�\0�P��+6��o��n��+�6�s�ޫT�r��`�<����c�{��c��l���d�i}/ >\Z}X�{�o��W���\0h���\'i:Ww���u��z�?�4�d���v����ڜ���k	\r�I��g�\Z�u���H�8�����6+K�Z��e�d4��w�������W��Ik|����K�#��U�&�,[�����@�2=���5a�z�M�m۱�$|�\re��<F��6�t��,��\n0�[m����Æ�������\0J�If��Z�������5Zly0�64�Z�l8��\0���\"���sí��h��w����}/�Ep��a5��Z\Z���,\'sw>?ִÐK�m���Ͼ��5�� �����o�����V���\\�H6������fߢ�ޟ�F��ٍ���%��\Z\rYk�?1N���he��\"=�:���\0�(�de��\0\n8�u��3s����[��m{�1Ӻn�Xi�Ӱ�H�d�s+�\0��~bW���둸,p�\\?�������\0����۪mp���1i����*@]�B����\\mv�L;ٴ~뾋_b������*m&��������͗Y�}��:oa�\r�� -��v�mN�o���(���Zj��C�p~�[��g��o�T-��N5���:eα�.���~���\rU}v��	�ƭl�ͿI?(��ͭ4���\\�\0d}?eM�=U����\r5	ѿO��lF\"u�uQ#`ʚY},s\ZG��d	�Oҟ�ڶ��Q}CFհX��l�S�UPeŖ��\\�7��&+0�k��g���o.��1� ��Z���#ݷo�\"5>��Pt��W���������~���X�ny���m;I��|\Z�pc�������R�m�WTj���\0s����z~���1S6[u�����	�c������Tz�w�q8�O�*��q�fM��3c��K�s}��[����[���y�k_T9�[.����O��z��*��ȷ���m�¹n������i��]�{\\�4����lo��v~c�g3���Qu�\\�[�D��I��4��;w��i�p��$�?��G�d�j��-!Ĺ�cl/��N��&�{�@iA������(�t�����=�� ��o�o���\'����m$���7��D��\"��}$�wi������>��P>��V�\ZtA �v��{���%�\n+�&�kZ�\0\0$��{�9�ER�p�7a\r�8ō\Z���ݵ׺����x��w�w�����n��7������\0\Z�V6]��;pp���֤l!���׷ph�n����l�]Ps_�@%��Iq�^���Q�n}�kX��O�\0����D�V�k\'ٽ�ג�믷n��M_�1�=�sC��kt}]���ߘ�1mu?�l0ه{v��lb�Mk���{��=1�o�@�w� �L\r���088��N�����_)�������Ѭ��w����a���\Z��q�{v��yՌz��Z��\Z4����/��m0hi;�U�������\Z~��o���Dȷ�X��;IlD\0�n��A~c�l�k��!���Ϥ�z�S�$~���m>���{Y��$A%A��,uY�Ӽn���m�}�m[G���~���Z�h0>�/U�f�k�h�Ǻ^	:@>�\0�=� d�e�5���͍��-�9��~�<#K�*�6�m��9�hs\\=��Z=�vݍmV\"T��Z�.k�l>�h5��ښج���s�\r�A��{+��;\"�k`�`��I�7o�Q���_Yp�ji�C���6�\0�jn��z����$ϸ���c6�{����\Z\0kZI��]��Qg�����W\Z8����M0��Q-���Q-�h����7��ս=e�-���1�t�\0;�\0r�ǝ��=��\r|�nn��S\r���MºCE`=ۧn����\0Wb4F��M�Sd��N�w��\\ֿ�)���C�:�kݭkv��\0Ws��	����O2>����V\'������\"�?P����\0M��4�����Z�H��{�\0�g�V�(��s*v�^m����~ַmu�c���\0ѫy��ƒ	��7q\r�~��g��ږ�����0d����-�\0���(���t��M;_[���k�is���ϱޣ�:>N+#\'m�Y�^��^�n�����W�k����l�n������\0+���H���4Ѭ?�#��sm{���a�ht{7�����U�;���\0ճ%��}Q��73���V,8ZX�\'�N��s�ޫ��lqc����M��ވ�I��y����մF��I����\0Kb��Y�s���lAşM�CؘR)!��Ե헇j�}���6�A�ipi,�pi�L�n�ߞ��\n�Y���=�V[�i�6�>�N?}��Ia�����w��q�\0��\0���ڪ��;m��F�,�����46	���лo�����\0��N�k7�0ZI`\rkH\Zm\0�\0�����:�\n�M���T}�7Yt�\08�S�+�\0Ej�]���;�p$�-�~k����m��2Za��\Z�?�,`s��,��pD�n{��̷�u���/|ze�5���k���[��T\0k<O�}��ܦ�,��v�|F���Y���b�;{63f�ݣ�~��TvN������Z�\r���h���;髍�ͼL��h;@ ����(cYUu5�ݹ���$nvƹI�<W��k	�H�?��ԵR\"�]�\0�ҞH�m���Ye�{�cIt7qp���u���f�g)�-e�s��Զ7s?��^���k�pc=�[��������Ω��T�1��7\"Ɠ�\r�m����e^��DN����/.�[���������{�zj��̋6c��\ZK�c��ݹָne{=���\0=�׏]���o���w?�v�\0�������>ʰ����\\L>��g�=G~������Y���\n}E��,�A���B�9v���n`Y^- mk����sjs���*���z��gJm���fF����L�u�_�B98t�T�o�9����R�hp㓱���ko��O��_VE�6�h�*���L�����]��\0��\0�ec�;���ϱ�2��ZFѾֿo���?�֖N{q�Vf�cm��G�Oеާ�*�\0E�42d$�k�*1\05G��5+�q{-sI���C+���g�$��K�ﮐ7b�!�/�A#�͕��o�w�-m9��۵����I��hv8U��h�Ho������T-���m|�Ƈ��H��e�}�{�y�:��]�����\0�іVZF4nݖ-W��s�t\Zǵ��R��6�D��A���\0�!�Fʠ�X��*�N�\\�ܗ��ۘ�\0�o�5�d�q��w2��{����2���\0���f��e�h`%���Ͽ��\0_�*Yx-9/��zP�6y�:��\07���\0���MR��ǯ�ZÜø�9��=�[�����L��*���$�F������lg�\n���N;1��1��c[\'v�c�K�n�v��$����䵸�@\"Z@s67�u���\0�V\"I1��\0��1��GNc1���4���v�S����{P��\\�l!�s�X��K���%���5j�l�1�@p��\\�\Z�9�>���b6g�q���c�ƴ��l�����V�;�M�]\\�E�<0��-�p������6?Lpi}/�K���ƄO��u�=��0M�]x���/t�폡�Ϥ��X�\'=��.p���%�`�������c���JHJ�\Z_̶B�=6p��k����F�5�����\n����swV��\"���m�ֵ�Dm���,\0�M�՝����������Mlc���d�c,�Fݻ��Is=\'�ؤ��p��,�nm�L�ۨH�s���~��q��`�\0`6xs��\0UI�5��,0&�y�no�w�>\'mw�i?�ѴǰX��K�-�G�%��k���n��u��4��3Y|=��=?��\0af䚨$Wd���A ��>ױ7!�-�	����\0\\���K��_���v@�Ѯ������\ZZ�J��8�N�kw���Zx2�\Z�\r����������۩e�a��+.0�Zӳo���Y���Q���k�K�+������yC#9it �\r��VY��P�>���Gv�z���z\Z\Z�F��.��9���e%�y�~��m���?7�7Q\"j�L���z�\0�o.ۺ���U�!	P�WZ�$q�Fϯ��w�\rT��������\07^����\0m]���/�A�n�h>���%�}t�Snv:�.����~��\r��e�)�qn3 �7Ya11M̫�o�)x�(�5l����[��ӽ���?L�7���\0{�U���\Z��嶃\"��[��ߴ�����^�k�Q��K��&�ËG�}�������5�U��xkq�C�Ac�&�4l>�ho��=���\0D�\"�v�H4��Y��=,Zǰ���N���s�;�����\\2Z�=���i{dK��s}���W����85���Z�\\���j�ݎ�r�y������kZwYO�����\0�E �P+�kH�vs)%����[%Š�����\Z��c��\\Ӱ?�[n�m؄���~��+^Z�I;_cjc�]��m��\0�����2�%��`>���v�̷j}ހRڤ�P֖��/-w�}M�h!��g��m�����z�ǒ�G��I����ݻ��((��5�H\0�с���Q�P���.ɩ⫧k	�M�v���t�U�320�%�kL\r���v!U�a��@��\0����s,��q%�@�-N��\0Y&V�n\0;�����H\n\0-%+rl�P�#B�A�,ܐs���t3�}�օ]ϙ�2� ~�o��v� r����Xُ�m;��.q?�����j՗���;��k���]�ڰ1)�y�\\8��d1�y���5��R��zd�4���t��Ǩe��ѐ���:�Hk�C�p\0����ʥ�dWci����%����	�ʮ���vѫŚDǶ�}7�G��r�v�S�i۬t�}�����!GUf�]wA�9�Uk�k/}�2*�Z=�mn��\0��o7�1�9M�#l�d{}G[��3s�,f\n�7���������\Z����ޒ��ȴ��������hn��t�\0��6�\08��H�\0��j�\Z�ٻX�\n��v�s�w�*\0������\\_�~k}ߟ�g�d�ƇV}J� ��?�����ֵ̦�Yh����pk#ck���{�\0Ѧ��0Sa�~U.c��k�������z-���1W���^꫱��Ǵ�ZF��7g��uo�Ʈ����\0n�Ǉc�{m�F�b�&e�\"6U$T��\0��mnߡ�;���Q��\r9����KZ����;���W�v�%��C[���ր��u���V�S���.����ml�sÚ�k[��jc�ak���渋(��;黍���� �Qm��nm{t�X`-%��g���iW˿-ח�[X���p��k�l�y��l�پ���U�̳��\0�8[W��l�9۝{v���J��\Z/s��:I\0�L�۲�[������O�J��w�,z�{�����l��\'k���\0�-�s[Y��u�-�5�s�߷�������k��\r6p�:@��/R�6T�b&�M�gd��ʹ�h+���\0���L��BGd�\Z�K��kH������\0�Pu�}@� 6 }�s�\0=��]}n�_���\\�At���~�����՗x��-sbC\0~��ϡ�\0m�Z%#魶����ik�>��V�O�����N��=��6hK�7���ES9Vd�klf��ߥ�s��He�cZ��m6r4w�M�-���6�ֻ}l\Z8�.���6��?���I-e\rۼZ���w�ܞ��T����;K��	�z���i������\'i�O�����1�����\\����@���{�U�u�����Ct��n��ц(�@�A���.�l��)��{�$�N������k[em�mUN�<���\0���@s��\r-�\r�����U�M\'��\0�h���m���Z`5�\Z�������n[�Z��\rx�����\0��m��\ZAs nF����u��%�q�kt����\nG!����%�It�kJx&�j�0Wv׆��\"��s�nhsÉ{u�i�ޟ��\0�A�V��cx\Z��G��J=��\n��q��\r�X�vϣ�&���Ql1��&`I�c[�����]�F̚�]H$\r��d=Ն�l����\0	1\0�>��\0��\'�އvFK�1�^ }��R������Sg��z�k6�����ڽ8�\0���wn5���6\\v������TXƺ���0��fO��\0��\0���ֵ�\0	 \0#����\0rUj�n�����H��n��[�C_�\r�S��pub`�g�<m��g�A�>�lh�ɟ����Z��;w��[H,���}�C�\r �-1�����nqݷ�4{]����\'�b&Hm��w�D\r�\'�6�����`�ݍ��.��Nֽ�����\0&k��#�m�!��#y&_s�������뱬sd�0d	�k��g�b�r���n%�:lGЯ߷ނ��!��:�2>������R���}����Z��q4�?��Z %��\Z����1\"=��\0H�rͶ�A���UF��;v�I����M����M��N��\0�{���D�Um���2��kd�7\r�w�{?�R��f���I�F����\n�muNd�O�8L�\0(V��U;�+s��5�f\0��M�{}D\0!I������Z!�6~���A��� A�g�v�.���W��ma\"	i�����?ҭ��^�6o׶\\�m���v\"4;)aa;\\�N��y��\Z�\\q˅�9�x�?P�d ��cߺ�j	p߸\0������1�3��o7hf0q4յ�\Z\0?K�����7�+��kI�N�-�����7Mՙ�\0����Of��=�۳�� I�\0Voz�:���:_S�f�t��v�\0����}B,kC�\0F�7�ߟ���d��+�\Z�������]_�k��mv�g�\'����j��35n��b�]ys�w���	�������S����+�d�s��l�H�-c������C@��ܟ��p�n �*iCg�����!ۛ�n��V���OҾ�M!����W��a�1�g��� H�ҍ���k]��p�v���\0���g���l�����[����k����D\0�~����\\�%fc���h��������+:ґ^��\"ָ9���x�~��\0:������6�[^\r�X��}?���\0�E�w��^�۠�uq���n���h��c�9�cHh�^��?I���\0��D�\Z��ȩs\\�V^�\ZZ������6�_���YH`�q��H��~��\0���*�͢�+l�e�K��-�o�\0=�A��0�\0�[;G�1�o�6ŧk!�6n�n�t�H������?xv�Z	�����S��i�Zd�w���\"��\Z�٩?�H&����\0�b�ÛSZ�zr%�H?���*/�9�u\r\Z�\r~��y�Y�\0Ӱ�����v�ph�F����7���M�	o���IIڪ��-as�����>��*a��֐�	Cݧ�� 7!��{f	,kg菥��ro	M����5�n{\0\0]����/R�R���6��k������3�a��&d��\0g�՗8���5.�G�O��n�\0�#ò�3��]{]鱾�L\r����\0�oC�}\\�4\0ڬs��I���~n�?o���!��f���3&}���o�����\\XZ��\'M�������\Z���l���7a���py\r�mlo�7��2ː��������ѹ�p\\[n��ߡ�?Q]s��}�iaq�cWo��_�\0\\�E���������=RY���������\0��\0�K�u6i��9ƱS�|��X������w����p�jm����}���\0�;>�qٔ��=�/pg�G�nߤԪ̣ո�����%�o�?}�����SE���k�)��A:���~�0长��Z+�c��%��f����\0�L며���>�\'c$��%�n��O�D�m.��I�=�:lv����p�.���X���p!�k]=��Y��$���3����s�����)g��?��U�Z�I�L�>�}�w�ܫՋsoY}�a���n͞��܏u��?�5��V�LZ��A0\\Z�4���>��͹d�������=�������n3������\0s�].-�n��\Z�Y^Aտ��=�l���S��G��ت�;�\r��M��M⢚��ҳ�}m��\Z˃���v�?;{_���\0F�����7a�\ZX� ;���ݗ6��uV�rk�P�U���t�,��[�����oZ�uK�;I� 6��Y�c[}ow�o���W\'*���g���ֲ]w�r7k�����w��zh�y�e��R6X�\0{�6!۫�}�\0h��\"��ͥ�^@m�GHs��,��=�����P�0�lsdN���o����Ѧ�DD��[L�9�WiT�9��-y��z.o���6,���9��S�\"�^����2?�Z��_��eϐ�s�L�����S�Cǻ��܆\r��f�?>��Y���\Zp�Z],l�A��h�2���4Aѹ�\r�\0���\0뉝c��,�\Z紑^����~b�Ԏi��s�@&���X=��\'���YeŖ�wz���.\'S�m����\0����%Կ�:�s�uA���a�1���n�9����M���eE�d�֗L1�?G�=�\0��d9��[m��@i�����-[~\r��K��?A�n-#���?7��D���$]�V!w��繎ue�c�����IT���~���]e�3�������6˿�����(��7k�� �W�&.��\"�ʬcKC^�K�������]�N��ϴ�a4�6^w6���_����9�g_��E���H-kG����}��0�������~���\0E�ba��5�\0c��olo�ͮc�o�tޅ�j�J��=Oe��	.\'o�}{T]mL�����\"K�ϵ��V��N@����3Z�%�]���=���U��V$4ѹ�3�\0���ПZ�@C�-�l\rL��(f�_f�8�e��3�^�\\�k��#�u�$��?��E\0÷4\0Ѡ<i��f�lͭ!���I��\0EZc��<2u���@���֒\"�����g�캶S�n�n�x���k~�LD����s��{�a�C?FC��ksYW�5N��Rͮ~�!�\Z���ݶ���=jF;a�8���x`���TֻwѲ����<��wYf8¥兠YS�4#��Ss�{�\0���(�qJ�4\Z��I�s7�����+��(�M��3i�%�	�~��^�?���iuOp��H����}�ج����SZ�\0�a۴f�z�� ;9�g,c�c\\^=3SI2;�=����c��Mͬz�D��%۫���[f���\nY�E,��������w����_�U�\"�s�	�m�\rCyKG��U���\0r�p�z�W��*�X����\\�!���\0ѵ�I�~;��/�H%��w��ݟEM��z�\\����f��{�������A\r-�ڬl��;����{�\0�ޟ��Z�Po��q���v	�K����Rs,�.sO��XXO$�i�n�bV1���m��-�Y\rO������o��qh�o��G������\Z\'Q�L���vE�C�|�\r���o�6]=7�]snc=VW&���ߛm�]��Qy�d�����ݞ�?�+�WXȪ�[�04�=�X��/S�+6#@�Ig����n��Nw���;X��\0����U�:�Y��>�qf=�ݷ�\0&���}Z�˭�c8�\0F����5� �X����6�?�g�����kű������2H�Q������=?�ujQ��1�9�J���lm~����\0�=b\Z�Gy%�uc�I�q���Ozz)��9��;��f���w6��{�����@$�Hu��$��4���w��=�������M�Ն����h3����?ݵYɮ��w2�[�ctﱻ����\0��k��G^(u��H!�|��\0�~�h4��5��\086��-\r=��e_e`�!���8mk���2�~~Ϡ��6�ۛ�\Z����\0���\'�&�;mԗ�>��&?��c�18�H��������{����u����w�zcI��ᵸ>I3�����L��|�\\1������\Z�K���\0k��o�4�s�E������v��ͯ�>�����h$�R�r���n�v��~��~����=�kC����\'C�g��׏@��㰵�q�*��N�\01Vqm�]k��cAh�#����M��F��\rW�9��иk��ڭ;!�c4-`�N�����Pt� �n��\0�?�Q�\00�N�cH���)�6����:�h���<��pق\ZO�k����c�x�!�i\'���\'k�	�hs\'���n����tn����դ���Ŭ\r�\'po��]�c�-��X��\07�]�����A]�e�5�����Kdm1������}5������M�e�kZ��a�5��-��z�۟��/Ս;]�-n�5�\0�ެ�lq/2�A�q5��M����ߘ��K<�ْ����&A���~�bt�T��fKkg�u�7<�-1�{���mّ`J��	3����w�e�z����clIw�������k�T�[�������E��o�~�p����V�\'�:�����~��I��{�C�����?��>5V>���;��k?5J�\Z�V�	\0hO�����G@T�܆�li&�C���~���\Zڞ�}wT�^�\03���h����Y��\0n�8�=�~�}�{���N�.1.U����uy���o�P9\"�[\rs�& �?���!=�uU͍�d�H��\0�Pu��\0Ov�\0@2c����*U�G����7����\0��Ea�6��5\0\0L�-k?��*��U�g|�����/�����p�6��v�\"��\0��4�v��/{�.���ww��S����3��XA���F���{���� �[�%�Z׃�8�>�w�W��ŕls��Zי;\\����M��E�K[y;����Cc�G�~sv�؞������ā�m���6*�[@�pcCKwV֒}�?�=ߟZ��6��z�lp��.;75��_c���	\\t�\\�@��uA�sv�iq?���}�̭�Ȫ沯k[��l}?M�\0��\0�k9�!�;	��\\-��~�n��g���ͫ�P���`��	/3 ����/��*m�;%%uն�^�I���.��}?��c��S�h\r��ti��{�\0;ڳ���m�E�wZ�����Iާ��9s+f�Y�m��=���M:�T���6�ln�Y{���?1���r�����S�\\�}�=������b��e�n2a��\'���f��B~F���	w�n�}��~�:��ڭ�,s�ZL�I��v�s��\r���1��Yp��v���U����[*���`��ٶ�u����E��s 5��@���>�������B�XeZڜ����t������kX�Z�M���a&�4	��_E��Ǫ�s���I���ϱF��9Զ�Z>�[ܸ���h�\0��@��\r�_KO��ֵ��`h�s��>���u��s�l�Ϫ�}6����׵�v�~��α��!��	J#��7}=�H\r�Tw\0�Ӡ��=��\0�G�*�Ucm��/t�tk����[�i$��I��S7ߵ��\"-�n)v�<���v�5��ܥ��h69�W�ݨd��_�s?���j���8W��i�=��������peW@�\r �h=M��}�U�װ\\]UOv�[$��Ml�\0��,Ǭ�s����x�~g��}�\0�N�}�i�x����T}�k����w=�&t��ݧ�n��ރk�[��Op�g\0���O��Q�]�����W\r�v�������YS}����\r�c�7e��~��me�Bu���Wb��c�u2�	 ���?�<��N�q\r�j��?6��D��l����<<�������������u62`�;\\��}��/��J��:i�N��dA?G��\0�j;.6\0��2�������3��:i����;u��Y�4\n����O�O�\0�i��;lk���2Z��?��|{l��wM��&[o�=�*��=�ȵ�,6��-k~��鲿�q��1�s�ˤI��A\"�{]���\0��NK���!�h�����}O��7Um,�q�O�E���n�J����c��˃Ȃ��}?�q#Ҕ��c��T��L}��6~�%���/�9�v�։.p�#�*l��cmyah�����?qH�������\Z3Oѵ�vl��{Ҫ����q뱤X��ӵ���V�,�����D:D?F�w�6�k�\r�p��c����T�i��nv�Y�SY��c���m!��AՅv5��9�l��`xzޫ}�O�c��Q�}�yh��FÏ���z�U1�������\Zn��������v�Cv�:�?�k�\0q�ԇ]��4����4�q��;��mz�ù�����������{�;=WW������_����OM�c�*c����0=�~k����;*��Ӫ2l���s�I�������F�!�z{�\\��g����c����2����8�@t��\0����븖��klpkI��Z�\0�oZ�֫q����v��{����\0�ϳ�\re/@��yW߸Z�\0\r.���cs�`�P��\0��)�ٹ����w�ޣ���\r[ɧ�Ω�\\#�@2Ϣ�}P�������[}Wk[����X�]��t�yЍ}���Da\"��͕\rHݽ��u�n�c��=�����Γ,w�;~��/�oN�MŴ�n�h�\Z>�}��{��m�ȸ:���c	li�}e��ܥ�&�������\r������<�Vk\\Y!��?Ovݵ��{}��cës}2Lj�{�Y�)�MN����� %�M]v=�c@.-�ћ[�uh�4@�$�nqs@�\0�{61����l����42@�>����䎽���m?j�Xqy�\\H������\ZN6@�����k���`hwoQ����1�ǵ��h�ݫo���\0�Vi{�k.��g�uq�{�6�����\nD����õ�O��5�%��(�:�\Z�������c����ٶ�b��!�m�iN���~��g����_0N����󷣡��\"������ֻi�_�ڤ��R��p�@�3����������$��������Q��X#i�6���L;���B@Z�֗�9�h����Sos���\0������ik�q\r�(�?���w��4\Z4%?e�����ä�o��B��OU�!��US�Z\r�ps[��������\0�,���&F�v���o���p/yvK-b��\r����������z��{�%�ݹ���v9���Q�h,���������nN�Nm���4���s���?�?��\0���g�����kH�!�d{��/��c>��\r�l�c��n�c��1�����ء�\0u���h�La�Ͷ�ga\"��~��s�\0�U,v�d^j��{�`��t��7�����\"�����c���$�n�;�?b��3�c\r�?�-��Dn�G���_��)�B�5#�dQ�y%��\Z^��.���[S��z>�v[����i?\r�T�>�ƴZ�Iu��^G��X�O�eՐ\rWce�m�o�c>�5�o��]�~���\0��pF+��1����ۧ�����\0H�$�l��هH���K�������1�܀ܪXֹ������w�2��\0��7\\s�cŦǍ�yv�o�ޛ�mos}M�Se�� �0�����z�\n�U��gSs@}�{���KZc�3���MIk�o��\r#k̴���v��ޢ�),�6�;[-<~v���\0Z�\r-~�c��k�~㙻��|���m���B��\"gM����\0ъ���6P_�$�������A�6�ckk�u�X�gw��o�G�=\rӹ�ĉ ����f�\0���\0b�ڒ�_Ai96]��ai�>��~w臭|<r,e��CC�q\rs\\9��nO�Pi{^��c��\'ݺ��l��� �\r�D�����^Q�OE��9��\Z�����Þ���+��Ӑ+��6�~��ӹ������68��,��U�&�3@	�m�˩���5�S\\5���v��E���g�H�AꞚ:M�ln4�[=�p2!��sY�\0��}��	.l��\\����_��\0��lM�ee�p�A�����7�(��6N8�9,��6���,?��9��i�Q���Ǫ�N�k���nߺ6����_�C�ak���{\0�O��|�V-cEE�Ņ�6�4>��=��cjc\0���v\'��~��n��߱#���=�\\�M��K��G��ۿH��\0�!/G9�d��{�s�3���g�e�Cg�E�1iy����\0�?�k6{���\Z��]me��Aa�������\Z�\0j+���7/�߻kK\\H��ݞ��W�������2���� 9��gk���V����m\rk]�ƴ>�n�\0G깪�s_P�ᬭ����Q����ڑҼ�ݠ��/���n��k[�g�ؑik�i����7�حW��٬�2\"���=�{��\n�ʀqź\r~�iw�ԑ�ij�N���U����cZ��]́�^�7ݵA�=�\"7m?�h�p�؋c�sh����0H �7��>��I�i���A�V�v�+.iiu79�o�{?&�����Ǳ��k��_���?f��H��/��ikI2v����S��F�<�L�9�n��6Y�F�z{��L���p?�Z�koc�Z�5�{$o�>���!��Zt�-���\0m���P�lŸ�0}\"6�G�n=���2נV�R����I�Xt?�?먋>,���[��-���v+���9�F����\0aSc�Ŷncx:����\0]X {��D8�~���~�f��N�\nWX�\0T�6�\'�qn�;[k��ZbZu!������X�I�$�f=���ۿ=�dL��Hi$4\Z��z%�6����ݮh0A��ϣ�SŴV\r\0�4>���U>�\0���¶��fؙԝ�|��ӶXI~�Oy�O�%7��}��th\Z��%[��cI\r$CL:cn�?2�\n,g���u1\Z�����PvX	kbdk�*o��k[��\"D�<aJ�%�>@\0:5��}j�V9�����&CH��;r�]���61�v�u����R:�#����M��t�sl�\0�D~}�:�\0��;@���}��J--�phѿHx�}5�^��R4kH���0�Z���K���Ůn���r3��-������\\�}k�[?��\n�p\r\0�8	�^�O�}W�N8}��9�H4�HO���ڙ�+����y�2�K��w�?����\0=�ZUKki�4<85���\r�΅�p�)�v��Y���-�=+\\��J�6�.ee��4K��]��4�)��l���HB]�ͫ�@q����Z��7������c��[��9;��澗�Y�576���5�;Z$:e���a��?}Y9O{\\K�4���~�����\Z���S&�Zֺ�M��a{�$���ݧ��\0�P2\\�� ���I;v�����\0�fS�VYX�<���\r�M�����9M�zV��� �	oі=�F�tS7W���Z\"68=���l����Ej��W��k�;��οE���*,�翼�����w��\0_M�2��[��e�;w1����n�a�9.ph����d�};���1J�Yk�Z\Z�K�� ���>��qxm�W4��iۿ�k�V��|I�w��h��?�_�4Ж�,5��i�Dߤ�e\r���\0�Mm�5ޠ���e��l����*ۉ����m:.�?�hN�\"��I/;6�\r}�K����O�E��h\"�-hl�!��kv�v��qR�Ʒc���CF�[��?=$�X� �78Ǻ=�1�����\\��\'G<D��v5>!i-�\0^��c�@3��������\\�������\0!��b˰���,��Lƻo�Q�]O,e��wAh���r����A�V� }{��\0)W����W��d�s��5۾�桷1���<9�y�\0:�{>�����{�d�l|P��Km�>K�-m��5ĎG�76��H���f疵�p�4��7;b���!��淏�ϳ���Be��7�Ah�?{k�;�c ����i��]%�q!�:�o���\0N��6ǝ����u���oп��^�S�f+lk�v	k���oE��b���\Z�p`\nÆ�Wk��[�\0��\\���xu����@�������� ���LK��Ͽ{����q.�m���50\0�f��w3��)Rnf=V][��k\\ ƾ�~�7���D4��6\\��]t��	h��T2YVm7C��>X@�{\ZgۻٹM��I�XL�\Z��V��Jh�-/\0�[���35V��}��$hn���_ut�w�n��g��1�PA���al2K����C�\r�m��@qq���c���\0�uy��\rlm��&s�S��Qc�z�k�<��[h�lK[t~j6NC#�s�x�XHm�ͿO�	�7�@��c����{��2��s;�\Zv�3�?�{\Z��\05�D��\'M���1��]���	\0ǽ�������ƺ�\r;�hkf+n��˱J�\\�u���?��1�\0��^C,�n��9�Z	��������_p����4$��:���S�8���~��t;��?}ߞ��^_d4X��SbG�n�\0��\0��3Cr\r��0�cA;��n������S���st�q�5��<��\0F��\\̆� ��8��p���;vz��ɀ\"?�����:f�k���MD���ٹ�X;4s���\0��Z��5f��VG\Z������;��A�����PI�����[Ԯ�^�7h�I-��J�L��׸Hl�Ǽi�?��[\\���^��a�o����5��M�zs\"��I�ͅz���puL��kd=����\0�����\0JD\0�-��C��P���9�{�tKv8����/���I�w�\0ؒ�����#59��s�ѧk�������g��{�-����&�벤�a�u9.|q�q����\06���T�Y\rk���n�mw�2`;l�.t�����-X����z��zntC\\\\ZC?5ޕ~� L�V��Okw~r���H�.�¶O$hC�������S_�7o&\0yn�?3f�o�\02ic]��fe;��w�j>ʽ\'~g�6�\")1ݱ���5�TX�Im�v�����ُ�\0�z�i{��ށc�kl�2�s��k��g�5��+7S��m.տ�V�v;�\0K�/���(ظu���=;+YS6��m�2(f��7��\0��\0�����(���\0kE-���a��Ƽ~�s>��\0R�?�bƻ�=2C���A2�m������3n>+�����id5�v�����g��Y}G�綂�}�5���R���ڔ	��EHk��vָV�j9<G�ژw��{@�l�?�����4V�X�������,���Xw�������&3*c��98�Ƌ�����\Z,��o�\0��S�����-���؝6�k����cA�߷���w\"�&�֜�����\rk��f2�C�3��:�{12ٸ�y��KHkk���%���K��,�>�쥄\r�e��^�����ba�+�����O��MLÌv<����p��nr�>\r�7m�\r��l �Uk�_�۹\"�-��K��zo2������Uo�Yo������#�@?ͽ�ߙ�-�]�+}c��k�{.��5�׼�_��{����-l��ُ�{���[�>��1�9��u���My�&�\Z�\\ֆSh;Zk\'�{�3��C+?)��5��\r\0\nZ\"�=�~��ݻ��\0��\0�JR����(13s2��\0�T׶�#+J�`�I������\0�*�����-i���Gw����h���=��[\\�d���Q����P��)����|�����w�~bQ�4|@�.WF��{�]�Z�����8<M��]�z��s��w�+,\Z�{x�{��b���Q�ensy�asH�f�Z\\_pun��\\G ��w�6�\0��\"͋B[�v��Y��.��s��jsO��2L��F��̝��+�ZM\r$�v�ֲ6�@�V��m`!��7��\0O���S&dS��O������?I��_�\"������c\\�6��\0���}ߟ�X�����w���59!�X���{Z{6~��S��\0��ܟ��:��_gs�}2\Z�g���g��.���s��v�O��~��Pƶ����\Z����8���w���W�*��+�q��&��ۻ����b\\^�Mh��nKhyx�ps	k��=ަ��\0��ՌzK��O��s�-sZ}��>�o�@ű����{�������6�.s�H�-�������z��zi�ؐ�V�{v�k���h4;�m��lb�vA��͡�����Y��o���)�ۭc��!�����ߣ�\0J��b=�PƸ���͖��0=���\'���i^�-:��}�u���M����Ϗ����?�����Qw�\Zݺ9��=�M�Y����\0����\0���˪4��kC��K\Z����\0H�d�\0G������?�=\Z��(��m������C�=�pE�\0F���\0�b&9��u�P.��c�t�����\0���\0�*�=���K�������no���y��U�7L�Z��?��4U��E�������`��n�ߢ��Z#*�)��Y�������7e���o�-�\0��Ѕ��en�kj-w����H��emo��?��\0�(������߶�	�ѿ��͉��J��h�c�c�e�\r{��������g���ͪ�\'{��6�KXw\0\0�����vW��i��s��tAn�Qί�[-�\0���c=�G��l�IsH�����;��O\Zi��n�v�k��wh2��V���[a�[���.�m�������j�S6�9���C��䩷1���s��H>�Ω�N��\no\"��/mQ}gnCX�}\r����?�F���:�ۤ���s����������}���X@s�2\Z��=g�=��~��*�_����������k�.�k���t�\"���\Z���ck��s��\r�\"#�Zfc��\r��9�C\\��~��������u����`��[�~���W��\n��֐i.����\0�����\0z�=TB��gY%�.\\`5��o�Mȍ�	h�D@���M��X/��tD8�����7��@h:���AK���r_.��kd�y{{nkS\Z� �	�È���U_�D�w9�Y�駱��XC��7Il�\'�\\�#��¨8=���\r���{��\0����ױ�=�.\'���MB�Q0�k�d� ���)��ci}��:�\"[>��w�N��l�ݵ�����k��1�\0��T����k!������N�/.kk��qaZ�n���A�Mu��K@s��\\��M��s�i�Q\\�7�}����U��Å��������c��S�@a��=����C���_��S��6{Ya�}�4DmW�n9�ȂZ@�;O�c��{�N��� ��Y�����#�_�����GG�l������aHol��k[f;��bbk>�����/a/h2a���\0;��\0-N��uU�M��K%�f�Ѿ�����O�=U�벋�u��-Ԉ\r�~����Q�$�잦b��2���!��C���X?�߻�{��4��񀮇:�ݣ_a|����A�_Q�+��59��F�����\0;�X�������tn�Gﶷm�z$��c�V�˭�c�ֆ=��\0�c��9���W0S�m�y�α��{[��\'�Vɥ�.q�k�k}F�6�Y��Xڿ�z��A�ұ���ڿ5�0���!�?T�S�x���{\"Zʘӫ��_S!�\Z�����kȬ׽�9�v���g�]��\"������0���4�۱����\0��\Z�^�d0I1��Ce����\0��\0\\B���a%5�I-&״H<I��6�{??��)��wG�enX������g�mHR�	smq}�V�!��:�����ʖk�\r�CZ@!�5�7{��\"\0?��u�+���\Z̽�]�}\n��kw9�@���{Ë���0}��o�5���Ouu�\\^��^�m��w�?�~zYe���ͮ��kba�ݿ��]��\0�Уt�m;:��L�\\��=�C�����P��;�����\'�m�ǻ�V�5�Y���X�h }o���Cb�o�K$\0�t�?�?��5� ���s�2�M5/����W�����Ys�i>���g����2oݑ{�����=����My\" nZ�3��ФZ�@%�7�d5���}#a`;A�[��u!ߚ��,o����=�m��K����w	$ny��<��o�f�������d��Il�%�\Z]����ͯ�ֺ��{x&v��Chx��{��Go夦������5��Q�r�\Z�:ݥ�K�$�����sn捻����\\\0������n��߱2�k�̆�8�sH;�7���s��E-��v�Ud��c�t#����;�أ��lqm�\Z��ii:�Ω��\0	�\0��:�ַӭ�C\\�\0��U�C�Vn4�1��Ǹ�py�.��M �ڑ��j�eo��^�?s,��te��\0m��\Z���}�5���7������s�sm�s�5������ƹ��mh��.�u�X}�tn{�F�o��jhKf�y���Iv�lj���5��~�z��nK�pea�\0ݤ�ߙ�ej���v6�i%����Kԯ�\Z�����6�ise�$���͟Cf��K�Wt��e~�`��	wӖ�׿��\0A7�*6��-\r\0�;o���g��`��<��5�t�Cw[s��,�B�Km{���06���l���\0���P�W����[�;R�N�����W�R�{�Qa#p�^�v��o��\0��:�Ȯ�Ѳ���7G�W��6Qs�\rd�����w��o�\0��>*EI��+��c}��:���O� ��G����t�w7����H�l�\n�����\0������=���j��y>����B~��� 5?N��6q�W����5������kѫ�1�~��t,a�#�mV=�G��mV��mMs}�\ru2}�.o�bg�o������#��3n��q;R����~5�������i`%��c[��eZ���=��I�kN��[y�vA����~��n�w��#�cj£���D� zյ�mN\0\0$��������W�\"CX���sAxo�;�1���[r\\��5;����7K D� �5�Cӌ�0���yo�r��Z�ª��:�K���\Z�\0�\Z�?5���ʱ`B�\'sZ�Z���_�e��[��cd8�[��V�;\Z�d�O�x`\Z���m��{���*>�?=�������Ic�����6�:�_����U�]��\0	x싮�YۑU��٦��!Ň��������l�$��\0 �2�:�C���qk_m�ִ�z��g��\0n,�h4�f��0u����k�N��T�]иT��9�|��^�|������k��[�nu����\0�#��2�eUV��խO��\r�w���\Z�Wﱌhj64o�}=�CcQ�ֈ�9����.,�8k\r�~ߠ��g�Z[f��͡��^��\'��v����������ql�˃)o���	5����5��c�����D/M�4c�}�A��O���s�o�}/�z^��V&����Lzm���>�Kq2���-�� ��:���j{���\0qG����Ƨ�6����W������ͿCٳ�bVV}uY[n�?B�ˌKmv~뿚�����㹶㵶VY�[w4�>�;�����k���6 �>��q ����7��7�U[�,<8?�6�[�}��ޅ/���\r��sbG�^�������W�Hz[F�w=�8�?G^�\0w�n���?��ֲ��\nFEM�LY[�A���u�\0I�����]<�I����¿M��ʝ\"\\I� ���S\"��6������YC\\�ӫ���g�J���!�4��E,0�usAe����3�EY�}���m����մ����Z�\Z�=��v��N�E��rX�����7�}���{�q3)n~;�[Mlx�����\r����K�?���m~���\r��\"]��]��5��}��Vߑ海��9��p$n��-���mGǭ�����i�+����EOm�n��Li�֙�;�#���!�|��-l8;������Y��d0�7:�~y \0؟��}�Ͳ�2��c~��.o����e��_�\r4-�cَ*ȹ�c���4\r�����Y�Ԯ���zJ����^��-a�ZG���?��w�Z�kj��8{_��:�w�s���/�6�Z}̇oۣ٨��\0���\0�ҝ�n��z�f���ё�b�À��F�?���63��p�8�K�#�Kc��ȹwb߿�^���w�������z��B��S]���}�\r�~|!�$I:]~���WFE���3V�����ߤ�-��%&��Z@k��O������e�׷��s?}���g��������\0���Ԝ [ğ.����Ak}}\0#ݽŵ�\0�lY��{��\0�l>�{~����)��C�\0hi\0���9�}�~�ϼ�mu۷������w�o�%�O���^A{42D|QG��2��o�3�s�7 ��E0H\0���_�D]�{��(�\n��Én�S���]���?���\0�[�:�=�ݶͭ��\\�`�g�;⽛?C���l8�i�@�%�K{[[�?��[8�sv���ps�6��l���C��\0�Q����ԛ���XYS�@C_c��9�J���V�/B�V�_�>��ܴ�ݹ���]�����mOvÎ����\nk���\0�?�\" .��2F�0�۵������Ϧ��\rwe>��*�3��?��r{ی������ 5�[�v����z�>��\0�;|�@{����\0���}����x�ɏ��L�\0�% 4���l�����nc�y����� �����V����k�s}���7�ˁ����q����g����o5\0Ia�\0a�\'�{�\0��]\n���ʹֹ�1�R�\'_s֍�l�\0�G[j���6ip��o�s�Ыs�\Z֝�~���>�o�B32�e\Z��`kH�Ĺ�_��sn���\0���QV��e��G�͸��t�\"�5��o}A�`nk�:�����ޛ9��a��P9��<���}�,��\0��\"�վ�6�Z&�V����p}�R��q2F���1�}��J�����\'��@���\0�O�4�[͕_S=/ud5��]�s�=6����\0�����i>���e�٣G�&����6��9��[�lhִ�&}����\0	���N�tOǠ���:����o��+��p�M��q���w��q�?D�}6����1�s_�,3���w��Mc�80�3I��3�����;T���f̟MUX=1L׼3�	��\0�Vqi}��ѧ�f�>�-�G\Z�k���~�\0��@��7�KC�6�\'��^��\0뿣�\0F�/�K�醒��� �����6��\0��!gN�\r[�,���}Mi�l�XZ�������Z��Mז��,l�~�����5ߣ��\0W����q쾲�KhcL�U��o�c6����C�d5��5�j��.�YG�۽�\0�F�QG\"4\\�\"j� [g�,qmr^I��{=&UO�*V���9�d�ØW-qm��$,,�C��}�^ȳ�o��+Y����Y�k�������\0�)bVU���\Z�&hֲ\\C��L��>��~r�%���>��\Z����5ڃ\rg~7{v�\0%�a�h--c�\\x��\0jA�5}��:�K]��o��+�o�0=a�?��?���fC�^C��u�,i����w�]h	w�$6q@���������s��3ql�c\rb��nk�0D��[g���oإ��w�v�U���lm����\0�i��ckN�~�cZ�]��Y���_�D��Z*�Ia�c���\Z����O�;>�KZ�ӣ��=\n��u��(��]��`�[����od�_c���-]0��2��T|��Vl���hw-w�Ş�=�����ޙ~�[H;�\r}:wYc=����]�m�{Yk����X�.���3�\"g�_�����c���$���y��[������U�mϩ��W�a-%�kl{Z�So���\nx����s�%���x~ͻ�̦nejWَ���1�-�;K}����Y�Exo�u��+x�D~���ë�������\0��\0�Q�C6��또]\'C���?�w)X�;����������{[�=/Ѩ2��C��� =����O��V���z|{Z�� ��ٵ������>��[���v�����}7�Z�h������\0A�����~���(vic6=��,�;V��۹��F��A^Ȳ�Z^����\r��G���q�[�)u�Ƣ�K�X�KK�Ü$��6��{چݵawͶ��kc�G�P�0�+�KI����KO��\0n�Aew:���8480	|8�}v�ϯ��iQ�Hnkd��.?�N��=�,r�Z�qeN��d;s���T��}�vdCm�����	�O��U��\0�z�VV�k�+tl�^7��c�\0�$o�P�w_SZE�-cI���:?�b�[���w�6l?�@���~w��כG�]v����k}�{=6-Vu���e.�\0����wko�c���t�q�c}&v�!�8�v���J�����\Z\\I���C�Hs~������H���T/�sD�6���k�F�0�n��Hf�~��������ͯcXvd�]���\0Am��蘁��`�i��\\��n,\Z���9��w��}����Z�H�-d�S����P�����7i3��3�<����5��&�7X���x��3�^��	�\0�\'\Z=P����\r�;�ö��?���0�m٩��#��n��0�gS��CݹA���h\"��3�Ww�v��c�������������\0�sZ`}�����z�=u�-�\Z0��}G*�7u���\Z�[�sI�u�\0�g�dɕ�&���CZ	h0\\w��>7�֬ZM/Ҳ!�����Q����K1���I�9��9�\Z���W[k���I|�k��n�ԫ�����!����/%���	,w��Ƿ��e̿����k\ri�$������7n�\0�j.e�Ļf�`ݱ�X��]�>��ϧ�\0[�;^�]._\\��	���Qo���\0�+M~�=x�.�\\�e�{�gnߢ�~w��\0��ݷYn�}������lkv��z�A�)��8�Hv�փ?��7;�\0>!c6��m�������N�Y_����D�4PD�+S�@s�K�Z��~˿s�\rF����uw�����?����h�̼�{^�k�:9��o�=������/���ڟ[5����sŞ�E޽��׻>�[�����c��sO�*��,��[/hl�\'n�I��V��i\Z�f�_>���O�w�b5��{��۟�����n�=��zlj^J�C�n�2�6<�s���6��{�W�zG�\"	��1\'��Q���z�v4Z��\r��@��{���P�/����������Q�_j��������H��+����{�/�����N�S[�=��|�;�g�ǡ��x�\\�e��Z�%�6�֣Fk�y�vƸ�K@.pw���ul���Y�\0[�V�%�\r{* �H-cq��\0I��7:����N�\r���[��e���;�3��9hW[j�É� ��f���k\\	�a�����MO�e��L��y��֘�L<����l�屬�����F��jf�7���#f��<�����+�mNs�Ԇ��������Ug��±.\'p������g5��ʘú�4�kXd��>��\0o��c�^\n��n�s�]Xk�x�i�q�1��N�����TÝ�����g\Z�5�8�9��F�}��Y����Y�ՀIs�4�ƻ�����H��g��N�X,hw ����\0��9�Yi��M�>��6�k�����6�nk൥Ѵ�t������2MO?�g2G�F�v����/CҪ�i�Q�:�@$��\0��\0��1��j��+r�h}���?h\"\'o�;[�Og�W�\0��oYmmulw��}+6�`�������y�K�?j���-�N��>���ׯ�7Q\"HiҀanQ5��`��pkos�2G���?I�Ue��Yo�ƍk�Ѝ��g����JӬ�{qlc�#o�N����;����\\������ee�d�&[�7{�����]ѱ�:�j�b[�l��)��_n�v�km�i�6��uCi��w�eV�鲟���eM����8�8�n�H��g�=��\0��/u:���l�ޛkw���~��\0����L ׂ�E���\r}��Z籄���\Z�n�?���#�R���m%�0����\0y�H��9�+\r��p-l�7;{���hi��9��4y�[������(����\0I`%������5�V�?jg��\0\\�m\r�d[KK*|I�����nݿ�U�GzO;Z����?Ң�z������ۈv��o��b���=�Xd����9�����[sj��S��qq�^@�=�����ŵ�	�\\�a�o��\"Wc]���\\Eu�h����cV	؀�t�ُ�^YF���{t:����\0�� \Z>�MwV���������~���\0��ٍF�d�C���l���[�7g��C\'н�}1S��*`\'ѳi�\0���?�J�~����k�ND���7\0\\����>�����bl��o�PH���S9����ۉ�ǻ�󚘺��X�hp�\rׄ�	��.�>�F��t���\r��x���;�6�;]��\\�u��d4�G�m@�̨Zkk7PGq��y��;~��O�%��8�1����)�V��\0���ٳ���ӵ������h|���\0��e;�\0�b̷���\\�5���Z\rmmq���9�k�I��ۿ܁x�;ҡ۬y�\\	������7eU��n�Sݴ\r�������3�q�[��������@;����;{N���7���ule�I7��#kX]�����xZ�f���[����mӫ\\���g���kF�ћ�s\\��[K���\\��Ҳk�&��3��ؐ`�=����_�H����Yw�~��X��hU�	��w���\r���1�8��}gn����ǲ�}j���(������	.x;[�ѷѩ��9�KĂ��Ǹ�Y�����������l��v���E�ۻ������)��������ճ�}�f��}z���^���-��f�~��\0K�UZ����me�;I���^��ͭuf@ݴ�ˈ��o� گFm�k!���}�C����+A��ƶ㸇8���x\'���?� Oxݰ���j�21l ��]-�E`88���f�����\0�h�Ax�V�\\l��KLO��[�b�M�\0m%�k����-���7�\0!Uv=Š�m6����;�ѷe��:i�[[�V�װO��Y;~��nJ�\Z��tv)��}�b�,�K�絽��A�����ߦ�J웨������\0k�\\�<0�X�41��\0����gcV�v[e�Hi,-} F�]���]%���ji����n2K@ko}չ�����C�L����u��R�u.7��Zڵd�w�[���\0�_�ڞM�\0�\\=�3ժI#�mݹ�g�z��\"N�\\k���42��\\�W\Z�9�����U��t9�e�kC�5c�\Z�;���}&7�:��2W�jp�m�\Z�F����ϡ�UȰ���7��1\08�=-������V׹�zn֑�}�o�*�̜�>\0�O�`���i>��@��؞.��5lj{0��/hs�%���g����U��\0!�\0�V�>l������=�8n-��V����z�-Ǳ��ױĶvÚ������1�WrK0*k��b�Cl.�\Z�������L7ŧP�l�0����Y]�1��i��Y��{�OЪNvN��kl��A���}Ng��_�jݠ尒},��\r&N��\r��j����Q���w���Ctݸ��ߤ���j(�-so\ru~����ws�m{����ƿ�Y\0-h:��ss]��.�r*��l��6Ip�	?����a�\Zr?Gcv�<}9�Zݖ��58ۡ���x��\0F�TR��\Z6N�g󿪏]?j�=�Aw����wl���6�_я��#`�W���8��*�~�^���c�#_{���T2I{�Z\0L��?g�e��$;�e���G<���w�c?���4!e�{^,��k@��~�lGn�\'�6:�sH!�Ѐ~����\0�l��i}�\r�k6���qq�u��:�;��I���?��H���o�Ψ:�#s������i�����#��^�\Z��f�p�?��ΰ�\\�/������R6tT��	��&;�c��]�ݏcv��6It�w������*�ɲ�����k�p�\0��SYe����4�����o�jPlT�)������!��o����B��EW2�6��ql�ҏ�[�>�[P��ִ�6���ng��g�,O��^ƾ�鼻m�}����o��L��{��@�YK���H�H�\0;j-��Ap�M���7z��\0��6�]g������d}�����~��\n�.�j���\'�~�}�A�_Ϭ�Z��\Zփ:8�=��\0����k��C����y����\0��)�����)����N�{���g��%[�P+��k-��:�~�����=D�aKz�4;�`�n\rhq�o��?�=V)�ݒ��1��n֓m��L7w�޳��eze�P��}�������c�Wg�2Z\ZƘ������\"��Rv���`\r?�X���\0�B8�Ŷ�ʋ�hw��o��\0��\0����%�3ԗ��\0�ƽ�F�!��Ѿ�\"[@�}M���Xd��i��n���\r7F��jw�,��\"���v�\0���+���\04I���h?1����۳��7:�k`n���IԴ}��Ԇ�5v���\";��>}�E;+ik30	c�3ڜ�M�ݥ���W�\0&�O��\Z�8�j4 �w�w�kӎ�b\r�ā��������a%�ΞO�������#i�:_��\0�Q{���su.���ﲗ��[��k��d�>�o�5�x~�h�c�5��@pd�trN�s\\ף�{�]ݺ�\r<7��\0A��͖�\Z�8�<���e���0\0^���!���y�i��n�E����l��]�����?���P�nkX��� �	?��f���[�P��eՐ�����\0k?�k���^���e��v�-��ޛ�Ys6~z�}yt=���w���K��ݟOj�D�p�Ք<;vMm�;��	����ұ��\"%A����5��l����_W����\0����UQ�%�?nǴ5�H��4��e�-[Eu9�q�y���ù���Z����5��k�#n�-c6�^�ooӳ�n�=���i�g�ᱵQ��v���E��\0�g��`����\\�3S��7nk��ҷ����\"�U�:��i���gB�}��~���m�M��_�ip�-;���A����7{?�X�Saʺʫ�x�֗\r�t9����������!�P�Dzn�v\'����l�k~���6��q�\\��_��\0�\r���~���Զ��3f.5ϠdE�����������bk-�C[��ָ���q�\0��~�����uu��C�\\7���߷�������]�ԗ�\'W�kG�j�\0����*��ۙ���q�{��;��[hc��*U���Hk_���Ȃ#��S�\0��]�@��o�����k6��ϣ�;v���[j\"�3s���麷��?E^��;��s1=f47����wK����s�����Հ�;��f׍I��6�\0�I����	eR\\���]�M��M��\"��4[�T�d	w�z���R�U��\r�[^���_����/�X2��������oMHv�浤E�A�?y����X�l\Zm`�o�gK{��{��h�?����p\"ݿD���~n֡\r�}��H�_���`X݅��0I�2�q�C��cD�#�Юݚ�7�; n\Z�æ=���� �� ���>����s��\"\ZH��rc�I�5��?�\'��C`��`�V�{%�Awm��k�/��<:Z\0��\rG��y+��֘\0L�N����릝�C_a\ri���\'������.�1v?��klʃ�jH����^��~�����{�An�@l,t4m��V����m�a�zLmr�~�\Z~��%�l{K��L4�E��7�s=��.�	+��7�iVwnӑ��UnHk�!����k_�ޯU�hy��������l��{�ާ�7������c�\Z���8D~{��3k�2��A�Ŵվ��ч0N�nw����\'lo�����c쵾�~��7CD\'�U��R�/p����\0	����L���m\"��1�-���A�mvz����\"ǋ�|�` 4H�֥R�\"��ڰ�YM͸�C����\07^���^���6�\0�\\��md@��@��;�lj�s�������%̜z��=�&6�H��v��ZU���>��P�T��@\'�[~�oG���m�\\x;Ah?I�s����G����`�\Z�q���Uqu��<�\Z�\"�H1ͳg�\n�bt�Z��j\r�A�f?��{��E���n�^}65������o��2:�׏P9�`���0wmw?Gڤ[��հ�[+` �#��:>����bC��:�5�y/��BC\\x �e��!�Y`qv�=�o�\n�~S-c�H��t}7=0s�MncZ���F��r`�K_��-\r���n��W\\��1�~����\0�B5���.siiq-�Ik\Zϥ�DfW��]61����͍��-������i����Ǉ��n����;7\'�z�$P���P��c\Z�}?{N�p�~���\0��6\0�&>\Z�}?)�TAuNд�1���dA�6�[:����v����J>F)��UU]��XAv���]Wz���,�$ː�p#c�[�K^��s5��Q}�q{F��Ϸr�U�cj�;,\r�p�����Z�����*����X㵒L�?{v��Mkq�\\5�,i�KL�������L���w�R�*�b�1�乜�x��v%�m����s���\r�=oo�l���b�O鏦�C�p�Lw�+Xy��T��+l�v�č��;-�����,�Z��Ff��k[}�^F�@��������8V,��Ǵ�~��sɪ�U-h��:�w���V�V�6Ǘ�����\'��\nAX�mVKDo�$���VwZ�=�{kx��H&#��s���\0�\Z7q:�\'��qr�=�q1;4�/�?O�9�/can游��K��C~�b&]��M�!-�l8��W���Ϡ�vE���>�8��:�n����g]{ۿYp�3$�ݿ�&��OD%��K�IԘ:��`�:��������9&�>��pd��O�\',�o���9�\Z������G]�$6	�a���a�:t�ܞ�����\0J��q;]\Z�浻}�\0�C��\"\0���\0�P�,q,�qt����N#��W�~��e\'\"����>���X�Y���G�jx9a��\ZÏc�{n\r�}l\rw�[��?�\0�6�h��æ����g����g���\Z3���x��־��\Z��,m�o�(�B�]f���Sj��w��Z\0�\0�7}_G���,ܯ�7��p>���~w�ފl�*��]]���E�{�s7������{=Ms)�\r��_cY���Q�h��ͭ���cn���ڤ��ˀ�⚞����&�V7�?�H���1���.��6?���f>�\r��6P��\"?���6!>E\0/�c�[��ulp���O��\0:����?^�.�9������1��#������\0I�V��k�.n�N�p�O��k,�>��52���ئ��ݰ=ů���:��ɰ���p�*���7d1��[Ysw}\Z��_����v�v:Ǳ��T�����A��z,sH�����m�p��L{YNA��!�l�^��1�\0��9t�]{3*�?p�`�V�_������\0�)�%�������k{��絴����Xǉ��-\\�4X���o��׳�jA��]eb׻e~�c�_K�����\0>���\0늭9� �\Z�H\rw�ϩ����	%F�i��鱬�Htw\0�\0-�g�6*�8�`t����>���~b�&��1�Z��n�7o��֔�^2\rmq�iC��������������P����`�����ۿ�P�k�4��D��xt�_��q��0R��\06؍��ߤ�F��m��X=�+�J��T�W�=��40�!���8����z&\rs�@&4�������\0�S�-f汄:���9>����E����\0`y��F�~����)�amu���:O��{�\\�N��� ��u�\\j���x\Z?_�e��q]�]^��ԭ塮?�S�rjm%����k���k7�C6a.ԇ\r��H��!-�H���+Ikl�\ZY�`����_���ZL�5�R*n�M��P���O�{�\0�\\ܧ1��k\\6��`��	��W���Ec�/̩���ֵ����w�w��?��\0�L��ѩ�CZ��A�{��\r���s�e��:�.��xi ��ok7����z�l���ǰ>���o�L����\0�(�f<1����[�%�������ꂧ��1�n��xa�{��O���\0�Cg��j���nA?��M�I.���̼5��g��{��[>�2\\�����tn�\0��zQQn}�%����8��ڏoЭ������K�n��d4��������j7YX��Ӊ�:4����U��ٸ6�7��\r�]��mW�Pۜ��{�Ph�Q�}=����\\�:�fo�����۽�~����:Z}6n��z%�����>�K�G�:��w��x�Uc�`x��nw���v��Q����?����4X���C��iч�nU����9��wo�}�-���k����]��B�U��iu{+~�A��h\0�[�����~���<������&�[\"�ޔZK�ml�&����{�\0��нwc��%�4��\"gU�Sj~��a�5�f��;�\'h�m0�ƃ��~�ߣ��;�X�\0^�5��\Z��~{ ���ukc�[k�h��%�v���Գҥ�Z���C�g]����*���X�So�$���m��\0�+��ũ���u�m�hg���\0����\'���T��Y`��jN�`G��I�n49������G���W�S��fE�:��o.��Y����\\�Y��-3��v���[�kQ�֑Mֲ�o��Ik�渒	?�(���^�\0�u�UuyR��X�]�\ri��}�a�ؖ-�ͨ�����4d�w�����\0��\0j�}混��3\r��G�T��o�������\0���xٵn^-A�d0�p\rqi��/�g���\0\"ķP\Z���ct�[�w�&�2�,�\0���Y����}��ퟦ�w�{~�����C7���p�?I�P�U��]�w;OS�4n�F�l{����g=Դ���<�L�v��#��\0���TY!�h>��l7�{���b�w�[��Ȃ �#�ݹ��4QSYmc~�;�c�c������ܚ�m�fꈯs^$��J�������ْns����w3���}�`Y���o��]g��k��5Y�����\0����ۮǾ�lm��-s��|ǫc6���w[UU;Ԯ��	\r��K�z�>���;��\0�Bv[��X��֐M�\ZƓ��+w�b����.�]�k�?K�m�b�6����.ci�ۛ�a�L��s����\0��AvC/�\n�yl��;�?����ղ����k�����ͺǿo��i�(�O�`��5�2=����s?=8n��uU��a.�ݴ�t��m�6�}�q�6��i�H:����o��\0��칅��h{i�+��>�k*F����-��i�%�;��~�}?��(ȵ��������ݏs��͊�����[ �4#�<����1՟�=���������K��:����B�����,#hu�D�{?��E�q���=�{w�!��k��-�u����S5�`���\Z��h^�ݪ��c`|�?{���4���4�@���.�8!1{@��\'��S�Z��=���ط�\\׵+�ݠ��<�1���p1��v�swo����Ӻ��Q\r`y.�_�)Vlma����w��6Q�ps6�.?�H��SUw�X�N���(�l$�\r�p�^����>\n�Lδ=����>��	Ǳ��}L�\0�T�f�l���4�N\0{�;s�%�k\Z�~�c�����q�]�l�6�2��3�][��	\'����?G�\0	zM��fc.t�������kX�j�ma�������zX���P�\"G^��]+,���\Z?�sÃ�}���]_�QW{�xd�c���y�^�(��j^��Xa��}�Tki�\\�v̐�d\r6�R�mV��5� �ف��������zbIpl8��5�\0K��L��.��mޫ�hl`-#Y�?�����3`�w8�L�a�ߔ]\"�h#k��7���Ue�4���@A��S���Ym���2\'I\ri�\0o�!>\"(m�Q��Z���Il�t��jЦ�6N�5�%�����f��V�N+�V+}[I-��F�ߺ�=Q��=�%��M#�w7�.f��E�w��&<�%�5ޘ��]0�\'��Cѳr�vK���Q���k�>�=��}��d�]i���]?{���UKE�t�\0�o\rs�?;�}?���{p��y�s^��C��֖�g?ɳ�?��5�U0����\"H�~��V��2-��k�e���7�f����{v�d�����{�)=��#���NCK���C�i�[@�68�\\��t�������o�ѭHl��Kr�e��wL���=Q!q�ht-�=\'�û����������� ��?q���8i�$�5�\0����GђN���T��7YՅ���a58A3\"AC��ݡ����9��Z�p ���?��]6c�+�Q����ο���$�	�:�sK�ti��I��\Z��խ%��Bv�a>�\0�>h�c�Q�B��?�(nVħ�K\\���9���(8��,���S��5a����׀ɏ�NMaǂ@�;��ڜ�-h���I?EM�B_�D��H{���\Zt�����_g����H0cH܇T��%u1�����/��\n��C�c��6�܏�Mg��� ;i��_�s{�q����]���)cQ�U�\n��������[�ʱ��ykX�×�1����~��~���]Nk��ԬIpiG�&��E�=ԐYe�%�45��Ͷ��9�\0�lHQH��!��K�WF<C�`�m���Ѳq��SP��n��]�{wm�o��t�~=)u4�=�X\"ݿ���lc���qk�ֺI�q2~���\0�-�I�H�~���7����Y����}/�û���f����8\Z�\0d����o���b�jI��xݠ���(�؁����t�Ht�o��K�b,l�MuL0��g�\\w49��-�O�w�5lc�qkY��Y�cc����\0�\0��\rb��S�i��!����C��M�o����s���?��H~J-�M�I�����F���k����Ӟ^�ƘsA���߾�C���ΒAi��\0���z���\"I?��\0�Fa������;	 }\r�vY�A��-q9�ϲI#�}������a��\\`����w��1@\nlxt\Zm�c����Z������xn{�5\Z���;S�\r���\'6��]u�K�0��Y��~�g�{C��{��k����Cn�&�5��}�s�h\\7��w��\0�,M$�-���{ߓS��$���~��6�YMu�ӹ�I� 49���sݹ\"�	#��K73����ߵ��\0H�6�S��04m$s�77��\0��v������h��=ֶH��7?h�~j�Fq�p4���\'���w�}=����_�{�&v��f����9��i��>�� ��\0as��\r��@���\r\r\Z>K�0\'�\n6\r֒���6v�\Z�hF�\'��e�$�Q\Z�jg���n��\Z\0&DN�(M��d����Z����tZR�,��d�g�H.�$�F���f �;J}�=�����Ve�ͮ���\r���}�R{�ˇ�l��\"�}/��d�e����u��������`���w�L?*�`c�&�\Z�����ݴ;?����Hc嵻^��7��#�s-��\0��u����y?K�Dw����VYU~�����k>��\0Y\"5�.ʳ=/s�5�CKH!�\0Kg�ף[�����L{����Xݵ!V��;C�ǺK��H���7ٹ8������2\Z���#����\0���\0�]R\Z�1��5�������~���(�T����?��X�\0�G����l@�����T-s�!��\0\'���F#@�wY»C�\\k�:N��\0���\0E�\0m�9����BH��H��m@���emx��~�\Z7ݻ�DnF��\"�\\��#�m��@IW�Vl���q\0�fg۳�h7Z+���YΤ���L�:Ɲ��͙�#��w�D1\r`a ��=�{��\0����*}u�����������J��^\0s����Yv�i�W�P��F��	?�,��\0�=fש/\Z����ۿy*�tZ��m�9�O�����L@}dO�N��c\Z��	o�?�w;�&x/^�i�c��7o�S�[�Q�H\rN��Y��l�rL��X�Ǝ$�iu��J5�*i5˜Z��7��L-۳x�tP���)g{�`��N�O���R9v;�s�g�.�k�4�/n�k�5���7i\Zݷ��:��Xq��U�sK�\0�c]�bh�����(zN-k����݆�\'���\0_�5\\1��e{ ���ד�����g_^A,{�Zݮ����ޚ��ڭ?�\r}�\0���ױߘ�4mw����\'B�e^���v�e�g�,�Hc:澺������l4G��w�փ��{q�p#m`��G�����W�KllM��FMV�;y��}�uK�\r	n�I{��\\	h\0�&v�n�mJ˜���7l�}��?O�_�Sp67s\rU����t3\rk����,cAhs�蓩�o�Dl���}�c�!��\0� \0�c���~����cH�����z+\r�<�;ht���f�lٱ�ma���-:j~����@\r\n�#�X���\Z�:	�ޛ���3�\Z�Y,�9q.���6�h&E��{6�\0�J�I 8\rv�C�߹\n�V��+�>��ɒ�ѵ\"6���a�f]�ֶ��:`&O�z�C{���ln#i�׶�A-s��f���?�U��j��l���\0cZ\Zg�	���?c}���K*&E��h�c�����m�g�O�\r%52,k��j�\rq]��=��\0�\"��^��p�ih��\rA�ť���{�c�v��<ͮk=�\0�E��]m1Qi�0>�����l����(���o��X7tG���]�����\r��X�4�I\0�	;X�w8�ӥ�sX�z���pw�����N\Z)��\0q��`;F�2����ؗ�R���zU}�����\0>���\0��)��/|�Èp:������7\'-1��@�K;�Xӷo�/�Q��c�i����m�>�?��\n�����;t���̻��*�\r����;�~���Ys���d�=�\'�-�� �ٓ�\02+@�vj�7GU���@��m07n�P\'��n��q&5�������>����Ḋ��G�I;�4˥�N��UV�F��H5ű�\"d4oJ�UIwө�~GsJhxii\07PD�̨��l/l>��1=�\"�z��2$L�~���Y죺M��9��%�����\n�<��g�\'۹�U5���7X��,pp��m!�A]{��\r�����Y�H^�E	۞Ai{c^$�F��� 0��l��5��7�@p�A�=���E���z����:x�;˝h�$�i�S�͢�ē���E���K@�:i��J6��o�?�N�n~瑰�G�O��1���1<��\0KT6�M�C�:�\Z}����	�؇6	���:9��C,��1�c��l�W�Ĳ�>�L���U�q�v��G)\Z\0�ݲדg����jO)�מْ~(2aӱ��O(�̻*�����L�l7���?A0�@(��C�$\rn�V���\0N�iL�\0\0�\'_�r����ѱ���\0�7���*�p\r�� �G��8w�{2e�ի2\\�Aw�P�(���s@���͛�f��i���Jf�h��H�\Z��#\"t�u�r��x��أŌy{Z\Zy�����ې��\ZD�d��>�j+v��$�K�%U�\nү��Ѡp$q�otD�ݰ��JoA���:�HV���l�!�=�N�L~�&�T�glh.i\0�S��������o:�\'�?M�� �{��\0��J����klp�����߾��&$V�0PЂ\n\Z4aKO�;����Í|L~w�M��5�$���O�ڤ\Zֻ�xc����V���u]�B��]�۬~k��Ӗ��;�w�/S�s��ݺ��T�B���D��V��B�\ZHӈ�R�u�����j����by����T�\\`�-�x�\0��C�X�\r�$$����}�j�Z�\\�?k�Н���j0p{	s�Z����\0娼�䍀��#M���\'�>�i	o���<Xk�m�J�-�s�M��{�l�\Z�ѩ�m��p#�V�\0n��j�,���=�.��{������bkp!��@�^�}-�Q��M�&�lv�\\�#Y`kCd{����9�!��Eu��. ��\0�zY��sݽӸ�G�u�O��mur��I\r�g�!�=n���v��gpn�����\0M�5��]s�IeDT\Z\'�+n�QVƥ�8nӣ�M>��\'���M�s˚8����d�@��3NC���*`�K�\'��Ck���/b~����9���v9/qE���oܤ��\\��{Hw���ow��Ғ�m�\Z6�\0(�w���R��w�\\Z �?��\0Sɥ��q�L=�]������a3c�s\\��Өw`?qۘ�l]R).-64�ZY��W����+r�{6�z{u�����Y��s�n����\Z������?Ԭ��m�v�S?�k7��ܕ~)IFC��YtCK@:�/O`Av3�f��ã������E���\rk����~{\Z�}�������;\Zk.kK,�����OOw��M&�@MS�[���>I��g?������R��y���kk����׷s���_Ӭ�fH�^�e�����ao����\0��N�f�Yn(k��l=�ǖ��������;�t�UZ�׾�m��:��Z76L9��k[eg��V�^�K�2�;�J���4vۼzw�ׇ\0)p;�}k]�/��\0��.���0���\r�h���w{����F�Ԣ��e��2`�?����[���C�}�����{nys����?��o�T\\67C۲}�k���T��As�j���S��w{�&#RKd����B}F�d<@?��p!^��\Z#Ǽ�����$��;��0��H\'��m��hݴ�r?�$���y���%�x��WCKv�x�-v��$����.�%p��cl��\ro�8F�~���I�ܟ��ĺ^�\r\r#������ѽ�����H��T�Z�;4a\"D���������U���i��C\\7{���A-�sa�p~��?w����%�y�_ç�Z�;��+�\ZN��X��%��-~+�Z�:���L�~���7�%�G���á�߷����u�9�6����?��~�vd\Z^���8\0G��n�#Z*�R���[-o.�Ix�}]��*��[Z��%���wo�=��������$�Ѵo�������I\Zw�<��R@���k6�i�����\0/�\Z�.5��k��ݫ��Qݹ��$v#��w�S�ž���bu�}�-�Q���\'��v>?��Ā��w�u���7��A�8׃��DǇ���d�\'S��w�u��]x�A\0iۇ�I��`��:�`)m�k�k^��7���\0�\0�:Ow\r\n6z��c�s����#�>��75�$}\r��5���ݱ�֒�I]=�G�~�U��_��R9���V.��[a�c�ǗDL�K�6���H&��\08�\0��b\r�{���L[h1�nk�G{����TͶ1�/s���c#���q����f�X�ݰ��c��\0C�g�{A\0��Iq�m�.��)��?��a�{]���>�������+�]���!�����Ǎ��=���\0��mE���3��\r����8kjo��~�o��M�\\ {����͞��1�,���{��v�#�o���	�w����?�KF�j~�����vN��Y#�K���S�����y�Mr\\�\\}Hp�{\01��RC��2�Fd��%�w�Z\rck@q���wO�n�5W`���;Z��O-�M��h����5\04\'�\'p�T�����9�z�+�m�\0�.?����j[�Ѱm��X\">���u\\A���II������wnݐK\Z�h[u��]�\rxc�MN��G�?�{��i/$Ln��5:��8�;]b	\"?���ҤZbn�p�Û��	d�un���\0�Ph���#��#�\0&������4<�..l���E�o~�#鰘-#W1͇���� *ؗ��gs��D�\0�w�}�VE�z��懼��k������5������X��ޭ����\'��\0d}���7)���\Z7��;��{��7l�\0[z.�W;*��gmn��;��v�𛿛�\"`*~�4MO;n�͒��gƱ�\0������\"��Z�@�ޥ_��\0I���`u���l.�����\0�Ҥ������C	L�5D��ӹΟ���o�B��4[���Hԏ?w�T�.yԐ5:@��z��[�Ǵ���<��nR��@\'����\0�#ğ�r\\K�:��t����8�.-��\0�Rv���(m�\"B����3.2A\Z�\'���mJ���%�CcC��B��g���|n\r�ߴ�\0+��4T�xt��+]4M�XU}�z�k����������=�k����MS��v�t�����I�Bz]z�z�V��[��{c�g��[��%��A�C��P����1..h���>�w�V��t\0	t��O���츎Ñ�r���?\"�������Љ\Z}Ulk}�sf{�(���{�ù\rO�Z$\0������S�@���]Җ�A%��\n���ڈ�tG��gϸPy�fIӾ�L�ED�$5ӹţ���\0�\"��S&��4-��;�g���h�t%N�8\0i�XMY=����,���{�[@.:���G��������p�Mr��M�i�u��+67k\Z�N�kɃ�(x�ڤ*�<1����G��*���z��?�v�;X�x<�@��&�v�]B�u=ޛ�a�n�\ZL�c����:�a�b\Z��W蠋ƈ2�A{;hT	��Is{|�S��Z#�y�qn�\0��>���Y!�0{Y����*�\0��@&;�w�):݌!���$j \r�=���ԭ\ZQy��}`�ݮ��~w��&\Z�}�\0� ��A{�惰�tNw�X\rsZO�H����hcw�R�������O��1�e�;]D�T2��:���@�P��?�Hj|�{_� ���{��>�h�Κ�L�Z`����\Z���Ađ�hA�:���ҵ�VC�$H#lr�X}�ˎ�x��ֵ�I��������m��R;�\r�>�l�����\0WiL���$�\"�\0��/P�\r����g�T��LC��&�~=RE$2�F�>��>��CsZӴ��{�I�ߧ�S��@yHN\0�7�D��\0�\r-$�\'�:?�sRX��\ZG0?���RG3D-7<�\'�&�U&����v�;��ZG����	�8�3����\0��at0�:�\r�t��s���vč��vD�W�Y.0\\gFχ������X��{+�v�n��������n�d�$k��v�T\\洹ė?A��\0��U��F�L��;��\0ko�@����Z-d��X��f���\0�C����~\0��\0�j$��43	ؠ�׽�qm���\"G��ZB�����\Z��?�����K�ɐ\"@�����\0~���	���9\0t���Z�d��mo\\C�[`�\0�c���\0��άs�ee�$hv���vWg���ĝ�2]����c�k���k���]�{���\Z��G�;_w���_Ӱ��#h&�@��܎[ꇶ�%���@�ݪL���C�?M�	-��k��&:��H��#inր�3̳�����`��^�>��w�e����G�n�����\07u�ؘ�M�w���_��\0\"���Gp��YMF��v����\"}�֏��\0	���KƎ\r.����	��.��4s\r׏�m�E�qx/�5���>%B]��$�&a��w �B�`h.�☴{���0��\0I8�(\\�����{��6���?�j�lpc��\'�Iv���T��4馰Gq�܉]�8��ZkO��$�\Z�$��� �Bm.|�w� �`�{�q0�+U�l}vI2�pO��)�\0i-�5 W��V�=�I���5{�ٻ��H���\'�J�o�M��� \0�4w�������s\\eѬm�~�k�<~��빐5��lNo��V���K@�#�.���ޫ�2���c6��i��P.6h\0ez�M#��O�9#�i�/w-Ԑ4�i���d��D�&S��V�KX�K>l�w�w�AN�M���qg����>�؆^�5�Z]\"&��\"�>�������~r@&�2��/s�Z�	LIw��Z��cd4�����w��\'\0X�����?��C}A��nq?I���P����2�g�k`�}��k.k���8���9�x���4�Mg�y�\'�=�m����K��A��j[\Z��*#��m��m���^H�����A\'�%�ldȝO����84����R-;��;��N��,լ��b8��*�[7Hs��~����;k��m$���$�\Z�?rnBm�5�mѬrx�\0�TK}��ƀ��P0�2N��yO���Kt>i_��������`Ѝ=��,۵3m;\0ۻ{N�� ��-��%��[��S��0�On�~n�~rp�\nm�̽΂I.>jx��v��l�qp:ms��-�<8>�U�H���`�\0�g�G���*��=���� CKG�7:�۾�m�&�V���c�#�n�O�j���!ƢӠ-ii���\0;����Y�:���N�h-3��mW��\Z��\0�d�\0W܁Sh�%�6�`o���O�����Z]d�Do�V�Q��6ƀ&.#�DsY$v��`�\0�B#O�Qb��;q�Q�ަ��p��yO��4�n<���65��:��?��H5t%��ޛ �F�\"Vƴ��@�?�G{k/�-�H���N@2 �0#�DU��wz�[��R�7r#����i���k���,ٹ�.a&\\\Z`�ݖ\"�� } F�LO��\0U�Դ��R�e���Xy-}m.-�;oҫ�\0VF���w4����5��5�m��oU1��Y�H�?hf�I�\0	�Ϣ��:�ѩ24k�fژ#c踚n�ͺ�49�������?��T�����?I\"=���wCv\0\\g�k���k���l�@\\m\Z��5Ր��֤t�CW���,d�\\5<;̔��k�S	�ω���\"d<�Z�k\\\0q] �B��O?��n��Uqa���?�����C��p�u5`�!�9���%a���I�tF�Ġ���ݴO�N��5��\0\Z|E\"���s �5��G��h]�ځ<G\Z��[cL��\0�cHwb������\Z~:h�R��\"\rl�N�%*�\\<~i�$A�T���1J`\0ʼ�v��!�!�� r?���c�ZF�����g�\0G����[\04I������+}�>a�@��A�u�/<\04�T\\�\Z\\N��\n{� ÌH� N��7J{x��$���׼9����\n&v��ѣO\r��)HG��W��Y!��$q�\n�q_�c���p>\nN� h\n9\\�\ZR�CC����6�@�>��H\06 L��I�`4h5ܙ�v���#Ĥ{�R�n����+/}���j�I�����}�m�r�����ΰd�?���S�\n%Д4��V\0j.�L�Pumqq�v��I�G��M��,p0x1�?�Q�ޛ�^b��q�	�2��\05C�aXk�$���\0zN��d�{wF�zV��cIkg���U��H���\'�M44��F��f�gtHG��68���\Z��\\1��H�Onӣ��\Z�\0���E\Z�D�^=A�{C��>������6�A���V^�\0�<C\\}�y�n�\0,-Ѱ�c���!\'�u���F�͈- z�����G��V1Š���w�Rsj��=Ǿ�\Z~rr�����iװHb�-k�\"9Ɗm{XC`�\Z�B�m�:	�H\"����M�{�\0贅�E+B�wx\Z;���. �^5��k\\�\r�\Z��������4�5\'j�5�0K�Y�c������C�h]�256���-i/F��\0j��D���U�K�����s�<�>����p娧�E�\0u�B��Ix�$�k���u����T+͓\\-sAh\Z����P=�˜��O1����6�~��03?���\Z-k�����wꮅ-��l�D�֟�\'��F\\2,�Xͯ\Z5�	?�����B7\Z��Y.6A����}������\"����w��2�<R��VD�� jD�\0�MA²�\0��|G��I�T�ί�n�-��{_�Q�\"��V]-��v�q�v�\'��[[��y������8�0��͸6����\"wl1�	w�ڢ}J�i�\'I�7���Ԥ3�k�as��������觩��Zk�	&	��ݾ�}�hs�0`���f��\Z��=��\Z�C�#�~��\0�%z��U]�mű^�l�Z�C��ͪB�X�hw	s��\0�C��=��~��[L�5�;�����	n������&ٿ�	����4�.ah�}�����)e��=Q\r{^�����!���p�g�\0s��`X,��j��P���@�\'��ŭ�=�A=�	�k���!�������p�=�Aqdk\Z�������MS���@o������\0�j�w��w��L�H$�O��JǗj��#��ꋜ�i-:�\0H��\0I��BG��^ź�P�t�3�#�L�$\r\0�\0��L7�DD�聳\"w�`���	��(��Jwkp�Ƃ�L�\r�c�|���w�\0��J���s�Ѥ}/�&�L<h��䩷��\Z�\Z�.u�Z`\Zݮ�:^�5k�����ߺ�7��i��\Zk�)>�Μ|�H����&d�~	Ğ��L��@&Z{���#T������\rs�	GkK���6��;V�\Zx��A��:I��O�ɤ�}R�K�=&�i���}5�v�I�i�A!��R�\0��e���2H�����:�\\�\Z$�ڢu�%}ޛ��dwh)�\\lf�;襶�׸�>��G���P}p�5��״�\0i8ި�D��kt%�@�8?�ڠ�Ǹ��~�#�LRan��������\r\'R`���\n����+2N���~����t���VN�2e�̓���f�KΑ��?��83���-:i1��T�\\��w���5��� C�$l��#��]kə�Z5w$���N��Q�8U��w퉀@�2������	�n縒%���Q���\'̏�-Z���#�&s�A�A㿗��z�H�|�E�`��q �#�U�w�m\rjHI��e�4��өk~�����$���/�:mh@��\0�#�I���洶4>��S��z���_����i�Sv�!K���BM��$8�\Z��U��\\�\r�PIд�?ʳv�.���ƒl�	�����s�\\�i\0�\0�s��Sv�cp n���k���D(l��ϴ�� �\0�%��Fq�	��c�Ğtl���Q7�ph��+���*[��w��Q;���h�4�i$wi��0֖�F��jS�A�����G��Cb͵��[F��\0lnzrH\0mǏ��HI�\Z`{d���O��\'A���be�u��n��kā��3y\0ې��ƻ	2�=��+}�MU�d��`�!͖���B��\\�t\0��@��\r���$4:l�S��s����4\0~k��P{�c�w ��?7�o��\0���5�C���Ѡ�=����c+.�v���:s���+@�Sh�N�;��\0�(Ya�0Z71�\Z�ݻ�T��������\0!�\0I��Pc�\ZC� �i���[�� T�\0������\Z�׉��E�xsw���?��pcC9�>j!��;������R�[���\0Bk_P�~�r]��,$vx�=�yۮ��1\nLs�A�Gb@�\']�QL��#RP����=�2��{q��\r�� �D�]�m�v4j�n#��?���ih�5�v�H�<!)�Dm��<��A��䝓T@�`���f�Ip�d�\'��9�L�e���Wk�ٻh���84p:��M��\0���<$\'�T=�Ѯ��<��6[\"Hv	�W��Kj�9�^��d��\r��ƀ�\n� \0XglO�C�Iq�~T��9�ۧ`�\Z��i(�ٙ����;J�ZFƙ�$\0y#�	�4��U)��\r��I�ٝ�&H�\0\"����\ZO��Q��U�`G�^e��������v�q�I��R�]�uv��ģUp��=��\\v��w�%^�1���ۙ�a���4���@�MiF�@��Ž��}nn�\01��;�s�f �ٱ��=�t���u�s��I�w���&q����w���5{5��=Ys��ܡ��\r����~nKk��v�$�J��l� �\0�4�PM5[m��\0BH�vVW��<@�Oh\Z5��?;�\01��] ����Q�@w�J��$�$�4�\0��kT���	:?�Z�:�k�����A�2	 \0��\0�>�|?J�>iw6Z�M`\'�Rpk�!�b&?�{SA�}È�TέںN�>I��Z�;�mD�m$t�JA��G�:~�[w4�R@���+p�j\0 \n]c�I\0�0H�t�W�Q)��CAs����\0��ր�.�$k�m���\"�?���t+tOicX\rm\rq�n�����!���&`�N��߸lh���bgr����,0 2�\'��\0��\\��`O���_�.����3�F����ZǇ=�k�A���i-I[y!ike��<�rj�:Z%��X\r������\Z~r�n�9�p!�\r�c�j�^�݅��6���v\rL���h����ÄN�\0����\\���#�=����7慠R�g�^��S��ր��.\"@\'�I�f\Z�${b\n\r.��<�F����8��� t���j��aXU;�.:pG�\nd��l�Xu�:�Ҷ$��~����A���֟P\ZLY\";�ȁ\0�:�\0ߜ��\0Iv��-��[�=	>�#Q$��A��Lk�1�\0��A���4b�X�KI�RF�?�E\0c��Il��!���\'5�mh\Z����(P�n�C�d�Bo\ry�혽��#��O����P��k/\Z�ΰ�\'s�>�����\0Ŵ(�%��=�v�hu�#gui�o�$��t��F��sD���\n,��[���g���)V!�if�;��h�_�I]����}ǿ�Cr�H���D�\"bq�m�4�Ln1#D��\n�dl�Iw\'�Z�\ZF�\\���J�dhH�?5�c@\r 	����:�QRPK���G�(����A�\0��NQc���q���Ԉ���d뱢*�������@9N�\"���@=������p��<x����;${���!�8\ZLJf]�K�\'�\0x�k�H��.�5\'��M�z�%���y>(�Nqw� ��\"5rfn�x`�o<?Gb~H�\Zy������<��G�\n虻]\"CgC\Z���F���x\0� O��L�5�\06[���r�6���@���;���C ��]���?����QsC�i�=�#��\0��v���}�<���M�\Z�uo.�a�y}-S�C{R;)����LΟ�j	k;���$O��]ۋ\\A��u?���s\\�8<\rR5�AC�Y{N��5Q\0�pt#�CT�d:k��\04�sc�O>P�Ѕ\r��ip�g��#U.k���Qtm\r\0�<5����I����h\r�n�ɖ�C��0$j}��T��\" ����������*p�E�<8��bK��0d1�������g�F���#H�R)p���?�v��8����idn0�O#�LK4|�(ln։�kʋ���n���>��[D4�%�~h\r��- ������u����4*bC�@%߼����;�uI0\r�%�վ_�����f4�[�\0�\"�#ke�č;nٿ�,|�D�����S\ZF���s�Gb�@;��$��ѵ�p��5ǟ�r0�z�@v�\Z&��	��:��#^�!1�m�o`��}�S;��ǈ�\0IA�,x�s�\0Y�R;�\r�V�\r��6xs�f�0�v��obH0yCqk��C��� )�\Z�|��S�՞Zgq����At6���E\"[�\"DHw\"���{[��ω�����;��Y[CjY��0��OnA���kg�9sY%+v� ���I�S��?%�Z*px����\0F�\0�(����s��a�{t����\0|Q��C}�:q����PIsAk��a���5�$����ָ��2d��ޙa�I��+ݫ�ԓ#�}2�7On���>Mn����\"4C@w1\Z��\\D@�n�5N�i�#���H�D{�	綒��k�9�Й�C�����uWF�$n�tCqh\Z	��=��Q� N�)K�d�3Y�GN�e���cVM`ns��}����H����g�<N�* ��Ded���q\0��0�+tx�p�c�)5� ��\Z%��Gd��voq:4����hi3����[��?lX�V�~���\"dp��q�\Z&.�\r��Q���S)-@2q�p����RS�LwSрN���iu�j���\r���#�=Z~�l5གt.n���J�.k��?7��T�C�H�\ZBt&!uZ�H] �v��]�����i�D��)x	u�|�t�{�����\0\\��?���kco{L��&;h}���\0�jx�����N�	mJY��XZw{�<�;۷�j�M��iG��\0���R����?�%��y���OS��-thd�ow�*6�Z�#�ؕA���F�!!ŧVJ5�D�*s\\��Z�@��\0)�y�N��\Zy����\0\r�q��6U��>�i<��B`�Zߔ�jc�n� A#��r-�c��V@cĹ��z�����<���#P\0i�&�\"^�)4H#KS�A�-w��{CI��!��ur����y��� �\"l�hE���y����yik\\`�����S��Oe��L��OA��[�@�\'��kH�N���̀4�91�y��-\Z6?���\"�\"Ѩd\ZI~�@�\0;j���I�\Z�\ZZXL�u\Zr��a����q�e������#]Y4���\Z�\ru��;�ۡ�BC`)�!����d����<:-ՠ��?58Р	�����\0}\Z릪�-H���M�p�@�ӓ��\"\Z]��\0~�q�����55#P����I�q ɏ���&��ڟ�%���\0T�Ӵ���D����G�	��+-��8�g2?�v�6װh�G~w�5�\"	�A�����<�\'��<x�ɛ�p�cc�#C�����z��=N��Y�=�k\\X�ϝZ\0!2ǐI\0L����I �-B�m�$ƐS�����L�\0e3^\Z��7��2�gR�$\rz?y+U&{k��#��O�ߘ��Hq�]� �8Cu-�x��	���:L!\"����r�ϥ.->�N���g���\r\Z��ϩ64���w�Ws�r�`��w�����`;��O��\"xhr�ԓ��D��~�@\"�~k��;�w6^�5�]>�����}8ys�#^\0��F��^�D�8?��S��\"�\0n�H:k�qѤ�$�S�K�\0�����O�Àp�?)M��=X�\Z�5�>HO����\n{�\'p�������KeS������sD�\"tWk���J9.tø<���≍Ug��zck����}v��S<5�Ӡ零����i<K��0��؎�Ű�\Zϥ���)�f�\0P.h�h2�#������\0i��B�ò�&Y��ݩ�s�\0R�s�\"H�{� \'t���a:���}��\Z��p\'��a���\Z�#�\Z�Ԥ��$Hq�N`�qd��O������\"8�x�\0��uB�A�:\Z<��\0e3�;�!�?��ܟ�N]X�K���u\'Y����ǹ���P�mzb��a��\0L�\\���kPm�iԝ��G�(8��C�A�ABtݵ�\n�\\�3C�ð�N�\r(��P��솺$w�\\�\0Ai\r�2`+7�&�?t�!B�@p�w�K��q�30	�;X������J��A�(���F��\Z&��>I�C^,p>���=P�]���\Z���\0���k�3��BrѴ��CñJ7����B<�0��=�G(mn��$).3$?\"�IQO����\n\rkw�d����:4��%-c�$mR;�܅��d�1�����&LF�a\Z���@զ\"t��\0~C\0hy�H@�UѓM�qh�<9�~�b-�v�5ׄ۶���	�	�}�\0�	�����R�5\"�k��ėi�\\� �����H$�`�YAo=�\0���x��rɄ\0e�$:��.\"���_��M�@ ���	��~����r2\Z���h`�Aۯ�?��mt�Ė�40S��0]�F�5\"Rs�i��\'�Y;E/���v��>���s���q;�x)�ݬ�6`�w��} �m\r{A�\r\'�M�C7�$4�x��RD�F��$i\r̀$�����7��gpi$i�?�����!�D\r��	����]#_\"H�[_Q�s����H�!�����\0�4\0:�����m�A��0�Z{���n#Yr�#a3�+���5���gX��D��\\\"���O:�fg৩��_�Q&ʈ�0��L�q3�&+��#��JkGs��>)�\\@���&�d��BA�JPc�H7�\'��I�4QWVK��\Z5�`x���ۉ��)���$��I$N�~!H9������$H� 48|K��i���<�v�I��;�	&�|R3���*�LΞZ�\n�v�Z�gBUv�p=�x�����Y/q0�OĎ�h�=�����3$����I���\'t�qԨk�H��L�(�ҕ�RI㶩����H5�CG)8lw�<����޺1c��r#��q��L�@�4.䀎ֶ�P�lms� �}���H�}H�7�Ȫ�����[�O�=�������lo����\0]���\Z�D#��\Z@0ZA�?�N���Zk�L�!���V5�v�r��r�?6���=˛c���3?�R��0zMv������OԷ!��<�5���6�!��=żr����f�?	�.6;��ʊ;Ku�̀G�O�=ŰLx�Z����ڵ����?�˘���Sev%z:��%�4��6��� �ݔ3|8%H@C��):�����-᪃����DΞ%H��R?�&�����\'�)֐�C�=��:���(:���Sn�2F�T�-l��&J���\0}$��Y���&f��r��4Ph�	\"{�\0Y3å�ӷ�	��ԃ���8e�\r�wpA#���5�i��q�\"�O��A6y��JږȆSK�k�D�G��Bw�ӱ�ݧ3�򽨛��/o\Zq�T\\*6Hn�j\'�5>Z���ѧta�O��K�����#���$���0�-N����<V,D�����%�7L�T�\0q��hg��lQ��D�a\Z�]��\\�b�|�����k �.�4�D�p �̎�#�^�P6���&t*Bݭ۷i\0k@\0[C�;F�������Z��Z}���L��&Dq�o�A).v�p:=����uu�\Z�6����@���)2�L\'�F�A�}���5M�m��k�0w;].=�kXH2�\Z�f�[���[Æ��_��5�	:� )3h2��:v���F�R\n�x#o=�S�Dǈ�C-�O����v�$s�HH�YMiAb�ם��5�\"M�]3\"�R�BI���k��$��tD��4	Bƚ�/Z=��-y�<HS\r����p >ك؎��Aq�ÉD}%(��ݩ���s��a� �p�����7�#q=��W�T�=�V��1�O�D�MT�>�\\\\5�b?w�����.���;��㺷j����w(�����������;�N�K^�Ggk��5�-��L@���}@H#�t\Z��h���=Ў��v��=�s�r�{�G�Dq��joa\"N�G��JZ�K\Zt�\0����_2�J��=�7B�M{�k0�#�|P�߹�K{�����t:�<�dm���N����ÿ�g���z��qa�����>������	��.V@�[I%�M��)D�]�Et^�T]����v�߿�bU�������|�B5�ms��2��f�>�F��jd������곥(�4U�f����J: ƃ��>��y�?�S�h�@#@L�Bw\"��\r;�2x��ؑ��40��~������i?��%�K���L蝮�c�HPe�{|�\"0��\'S#怕�?����#����Cc�O�ʓ$�I���	�9����#����\\�d�q�h��d�w�-��V~�d��(���<�e;]c@qՐ&;!�K�%��N�]�ZfGo>�%�����$w��TK��$�=�e1���:I��!k���#��md�5�����\ZƛF�zl>A�|��Lk���t�h�S�`����֣6,��`��	09�栵���#�[��R&�*�`�����ڞ>�[�$�>ECp�Σw?�O<�q�8�i,\\de���{�$�\0��$�����*;�c�ḗC\\�>�i?���%�x��]G�t��h~��t=�8?8Q��� �(�_�q�Z�6F�Rg����Y�Z7x���!�����\0G�����@\r׃(\r�\n������$�Dh���:	A<@�qSn��V�u�5�?6`y·�0-\r�A\ZvQ\Zt��Vi2��<�u���(�ip\0�`�=�G���ѯ$N��;��C��sIho/�L��:PB����_AI�\'�7u6�Ԉ��\0Z��\0L��� �)\0�\r���>N��j�6���w �\r���g��e�q`k#�Tݹ�1��>�m֙q2OG�<��\0�#u綟�U[3$H�^=lg�q��v��c��l\rΜ�+.k�)h�֍�|Jx����)-7����\\ݞ֑-�VmqLy��`v�-��d۝*9Nɰu;.�X>(��z����\Z��|5O���!6&��\\uf�����zKwl$���~���jy�����H1��TlYV7t��Ak�6F��O�����l!�C����\0\n�6����\0&���̏J��u�n:�ʗ��G��g���ɾ�w��<�f�D�/��Z\rՇ������ݤ{����*�۩?i]z�����7�\Z��s6�}�xh�����u\'_LǦ\'��Ȗ�i�w-vѐ��[��9\n6�㻸;H��IͯV�^��7i�\0O��k�㹎2�a�u�]�Jp �\0(������\0-X�v�1����8���i〠;�~	�� �i��xmQ߈_L�d��;pj �l̞4Ru�\Zm���KD\"N����N�O=��n\0\rOKqy��dA\0�obӬ���t]t�5� m�6L\'e� ���y	��`\r;$4��s���z�V��Pc�����x0Tm�8�h᧗����M�v�}:D(��t�\'��)��O��=Oؒ�z���>1��K����� �c�訷gҝ��3��� k�/��ڟ�4���	T�!���\0\"�a;��A!��8#���We���1K��%I��x0b�����	��K�GnB\Z춯^쌻S�<�#�>)��Q�S��i���W��<l��w���80�@M����B� ��>_jS���\Z|�I���r�K�6u\"u\n\"�7n�Gܦ6�4���u檤a�n�]�D\'in�����G��y\0�4:�7�M����&�#k���BD)���^���Q�0~c����������\0�y\Zp��&4�*�O$�L�dx�����\ZC#w�Γ�s�P��\\4��t������0w(�[�[��nk�gS��l�;���8�`�\Z�K{�4 r�(vh-ԏ5��Ӵ�%GS��&�o��$�y��h��]�c��v�;.�l��J�����Hn~�\rT�!�\0 �-5$}S�{tZ|z��[��A {Gc��<�������ōf����\0ΐ�͚*ւ��h�\\c��T�!�D�cO�!\Zd9��o��0tBBC���Q���V�<���Ľ�}N�D������i�;p�(���1s�S1;o֕F�i�m�k7���t#�T��EMs����G��U�ő�-,����]�����4lv�j����1:I�+\Z�Q����p�����^��udi�����I��p\r�@�A��	��;�P\'QIMX�-������4���N���\0\Z�p�\0_�(�sx&!0��\\@\r�D�~*Nuq�0O�J\r\'A�t�B��k�X�4�|&�V-�H$\ryOP�\\5\"Q\Z��s����(��[�!�^O�#܇��O ��H٨R�oa{%�]$I�~r#�mok\Z^����CZ��솸Xn�\'�\0���\0R�l�}���Ѯ���-,s�p��T�X��8#�)1��ڽ�ƭ��)��־d�hF��R���>	��D�u���$��ĞR.n�k�����T@a���(C�3�E�H��y�����y�>P�nVn�\0A>q	ll	>�s����@t��\n5K�CA�\0��J���h������)CHѣ�9�h����<��@<\']}V��C^I�:@��?E�ml��@P������\\s�w�$��4�����n��g;I�J]��;u��M��Qs��:b8MD�� p n�u#�\0\"�����cCޢ \0]� H\n{L8nӴ��$B����F��T��Tl��*@V��0Ko�6�w������y�*L����P���T���x(m$n�or��x\ZƁI�V��G� @6dk�6EP�-h ��@N\Z6�Q�聏���xM�\0���I>%:�)9�	���l#XP�CQc�N��j�cA������,\"O`��\0�*��:)��F�:~E$f+��XbwVݎ��]���It��k*&{p�*�D�DX�@I 	��d2#��>A3��; u�_��I\r�o4��5�\n>* t��JN��fH\Zh6@����>I�)��\"T��o$��:�hg�����7�F�x�\nl�����U&�5��2��́�k������1���]�kߨ�!�8��A��X��&�U�[�~��..!��G�MO���zXɐ�\0y����;��\0U[8��v���4n�\r�0~�豈�����ᦍ  :�=��]�r��\n�=SR��+j������k�p��#��@�ŭpk�L}��$)� DH\'�M�KO�rg2�+N�uPN�,;�X8�ɪ��n��p�;�ꦪƵ�u�Y ���B���Hv��`�o�L\'bR��\0��Gat��	�:�\\ }-xVo���l�?4�\01��D�T�FCK���\Z��\0����f�y��\0�J{����\0�*��˓�r< m�U��,�������#�׿��\0��\0RƵ@�۴-it��*l����h0y��@\n5��\r{��YD����LN� ��8�5�g�)��:�G�(�\n��8���ט����\0ԩ0�I��*O�LX�:��C{Y%�p$r\"u��_�|�_w��d�Xw��\'���8���1�.\\\'��!��\Z%(�?/��ꁲ���m\Z����\0�v=��J����\0��s��?2�mH8���n�Ʊ���@���LA�\0�tl�!1���%��-��.�3���Q��ӷx�2 ~*R���\ZO�S�wO��u�E�sn�2L�O��R$6 ��N��H�\\\"����H�� }�u�&�\0�d�@ӲLii�:!F��hɭ$��\0�H9��9�8�ˤ�O�?�����܃ߟ��[t;�`��lj4���Aݡ�J�� b|��v�[������i�\0#Ƿ�j�&|������QvQ�#y0`��Ok]�y\rN[�ݣ[ǚ��۟Gm�H�mX\0uv�4��4�tPˉ;��K}��y�,OD�\0�k\Z5v�O����7A�eD�`3���)\r�:�|�i�J�]RX!��a�~�\0��K۳V��<|�\Z�=��\0$���v���A�	HlwZ@ ��n�Rx�F{���%@�L�:y�&j�_�=Α����I�r��5��M�q�$vsy�5e��\\O�?���\0���-q�Lq<{��� \0����n�umd��k��$�G��&=�����nB�8�����sI�=��S.$��t]���mU�\"�4x��4��F�����������<�v:A@�F���q�Q��3��%KF��CJ�>^%�Y�gSU�*0t������l��B0m����1����\'��m���F���/U���(i��70��o�X��%�;��v�����w�@��Z`�ʌ�Gغ�_�g�)wb x��i;��M���.h�N��\0҉J�cCK�7��v�k��w�`��R���\0�;���R��X�\\��*P5$�k�g⅄����?7r.V@߰je�9:|&˵̩�kZ��ȗ+��[mvo\'|{��N�������\\J�8�G2�kd���M�<��0{v�ʝ�\r��Gݣ��Qpc���^á�5 6 �{�G-.&~3Ή���?�窋Z`�>.<��d�\"%6��U\0��_y>͐Ӽ��*�F�\"A:�`�ft0�3�J����n ;Fƣ�?u3l���\"81����<���Y�L�o���\0I��R�W� �q<�<H���Iۛ$t�z��	�	�j���/K{ �JM\'�-����gX#^\'r=B�r\nDk�P�����ġ���??s��E�Hl\'���\rc�����㹮hH�JP:#`%�=��E|�G�����Gѐ �ܩ�c�`���������,�~\'U!�B���ħi��`�Gs��v��f�*U.�\0k?�Q`$�hS�G�#�����BwI@IE:81�9k�X ��z<7��U�\rpt�Sk�O����GҸ�i�O�#q�l�[�\0FH�O�J8�z~m���3vcqtXdO���9�A1ۺ���U��^;&�/� I�i��@G��*U�k��J�ǰ<������2����]v?����@�\n\0I�M5�M\\�c�OY�A>������8�	ws�u��&?�I����v�`�K�MlV��=��4,���DY��Q��`F����U�����ߤ�����O�d����BL/r��dWc%�<�=¢��$�;\0cCH�;���ڢ�:\'d��u�D\0ţTM�m�Q� ��d��t \r���0�q��B�c����B\'HQ�\n��<��E�G=�Oc>�\"�@#��F����&b<�U��3G���\0����TyH�]ay\'BT�$�\0�䆐���7W�4l���\0`v��m����V�Y����Ui�~jls\ZK��7���Q����Xc�m�u���o�#F��~r�2�f�0Ɂ�������{��]̢Z\0i�wl|g�T�������T��a\0�#��ڝ��Y�H�Q�Qi�Pu�Q.�O\Z|SlRz�y	O\Z���Ds�Z6�h=Ο樴�Xt\'���O�6�A�@:���S�]hˢ��7@\'�9�c�7h؏$\"ׇ��t�8Du����`�\Z�?}�@H��w�ʒ���;�i��P��҆��c]tL�XY:������\'��(�����Kꆚ�\\=���1���C�yh�mCk�C�*�><wN ��]�@:���[ ��v��I��DH���������\03@6\0):\rJ�$8����r[���_ȝޡD nq	<Á����)�\0-�,w<頞`r� $��K��pJ`\ZL�\Zj9��~��$���ݸ4@<�Lwn�)����{����Q�S߸Q��T�sN�t�T���P�PC�x�H8�S��w~!a�`�wh4�$���֡�\0�����Ln3�#��w@a�\'�aZ\"K��`�A�Ȅ�\'M\0	�b8�(����$��j@�$`��|�LZ�%�7*�dO�������L����\'MO�.��L�\0%�F�I�?��7X^e��)�N�r{J�\Z��d��\Zw	� H2���I��uГ�7&{�[n�}�th�\0�\0.MO��K�*;�����Kԃ�6�t:��R�4��ý\0��K�c^��Hn�������`�3�x.4�<������xҋ�@\r��\'���[������r���K]��\0r��h�`�g��]�zwH��S�\r��:��\'�(�-��2	����P����O��\"u$�j�a��Ӡ�5m��4A1\0�/���+	����^K���� k���I\0K��B~������6�8i��k��f�hˏ�KH&\'��EXjX}c\r�h�>�C�.i?H�c���_��e	�pZ����Z�:������	�\r�����\nk�S��;��O��lq�$���摧cۄB��ΰF�u�?��N�|�.����e���N��T�`���h2f#��*��\'I�I�%�f�O�P��N%Ho�7ǉq� ԧ��y�:�Ǹ����l��Zؘ��(�c��W��&��1�؏ŏ{axi�s�X=����l\n���� 4q��%���C�D��v�*la�\0\0�餒�\' ���J�DH�{kc��{.a;��#󿶪�4����5?P6���w����,y�D�uo��:R�t\0~��;YԒB�.�M���d�yP��>aG?�~����l�?�/ ���\n��\ZCG=�H\0>bQ��J:���v��$��%8�I͎*��d���5N��~fy�\05#���z}W��\Z<�3I�^g�?�z��\r�tLv1��?I�s�� |4�� \ZF�ޭ=Y���g`\"\0����5*�p��[${��>�w5*�{����\Z@ ���k=�Gu����6��_�KM4��\'`mvV	۩ ��!Hٹ��s���T[������_EK���p�M�AW���L�r��Ķ;��}��L�xB��v��������-�_2���\'_�Ы7�y0�c1�M�-yp��Q\"\Z/;����߂�[~���)�i�$�e�J%�tMSnC�]@�y���d�\'�(β��kt#���v]�]51��ʕ�o;� xx~�:2�)j%\"��P:7\\�����!@�\'ySA �Qљ$���������B�i��F��f\r�2&<9Rp�-�\Z�)4�)��ï���H\n l�l��hCt�Gs�Pv�A��1^����5��;��A8�v��!�lPN빺<&���ら�|J���O��DM�2T��4OV�]�G\'�~�;�����w��e(C�`�R�P�I���5�t�1��&p\0$,��3=�7��&�8�G��ף��\0KG&4	4��g���e_̀A�>��� [K����i��1,H��%=?�U	Y �&O�^�4纷U8�;!��8���`#�g�#��c=V7i\Z����v���\0H��\"E���#�X�\0��a2ؑ���!��� w�����*l:馑*Ý���#n���Zײ���\r@28�=�KxR���\r0ϙ?�N\"�4\\Z��F02�un��ҝ�\r���#k~	5��bA{���@(��a6e��c]�.���X�92��%�X��!+k8e���)��!��Iv�Do�\"��qa��#���7��\"��py�F�;|G�!��K�|%G(�-G��+��˺�y%�Ct!H�v�y�<��T^C�#�J;�$I�[V�t\\홍����Zt��v��Ӱ\'�\0\"�X�|y(��iV��q�4x�\0_�K��n���3����L��i�ڝ8��O�O����a���r��9�x\"��|4�*kC�#�	���K<v���h���B{K滑���Q��3^�O4;���]��<��N5+eD��݀\r]�v\nd�\Z	���k৺Y�dN�m�fX\Z�W-��8�Bl�β�%�\"dG����F�Җ׊�i�H��E��\'�d�Ct<x&u�2\Z�{w%6� \rH�\0_j[��)��v��U7�4���m���\Z?��ɛ�x��Kf~	�\0	촛(�\02�:F�����J[I��~����բ�^k���bS�4%�	�1��^(�6�� ��Q��H�5��Z?� �|��~j.�ׇ���|���HsLλ!<�b���	h��J�wH��\'a�|;�Q/�6	���R�O��\0����D�q\Z\'��F�8���@i-�\03���l}n��\Z�ku��w����?����f�a����j\'���rm�K�����O����Š�3 �3��=�k`�x3jVz^���TF�>s��\0%�ι�� \r��v��栽�t�׀<Q4�.@4�+\"�J��-b�c���|ACt��6��~��$�[�l��G��r�0Wm_�e�čT���In�|B�\"5��&`�w���� �BV\r�tå�ˇ@�j �R��\0\Zkx��$��O�1�\0U�\0I*��5\'�G���\0r�wo]{}8��0��O�*�}G�?�a����ID�gwdV�\rnk���C�Hd%-MW��\0��a�f��˴���$�f�R>�k�;赮c��;�9��-�u[D��s�������R�Ԫ���4�YF(Dx}\"��/Ԑ.�\\0@sK\\7���$��k�Y\Z����\r�n��!�5���	$\0{	���7\Z��!�kt\0~Ft*.-i�A�?�\\��c��5����\Z����vzD{��<$��1�\0EB��xRo��O�Aܨ;�g�<�53�T���\0s�P�Z\'�����~���������P���M�;[cZM.kÛ%��D~k�]Ơ��Z袶�4h�����bG^�p�E�Ƃ\\]���s?rB�׹���g�50mN{����5�����=��c�MD->]U~h_[C���y�\"V�� 0�wq���JN����>aN�zd��\r�KA��(��	�v������u��*ws$��D>����\"=\r�k��\Z�\0~N:�������Q�r�cHw̦#��:���l��r��*\\&w�qP�#%F2\'��!���4ۈ��Z�a#�e,�T�ֵ�	tL�䪩�w��,s�6�F�g�����!n=�Smd��{y�{j�<G};-6g�{6�q�*Е!؎Y%��oU\r�#�D�\0y\nE@�#�)]��:��X�GPek��>�Cdj��\r����N��\\BS�ƕE�ֶ;�v�J����KA�\0OeV��ٷi$��4�&@׿\nGo-�<{�$�R;W䞬L�:s�LR죽J��+\Zo�\Z+ �=ʱ~1m�9�60���<m���V9mu���N����rmp-5�������}5dT1�.��/�b7)hj�:0���4�	�Y�������d����7{\'��E��f%M�=��d��(��L���?�WJ\ZP�չ}4rͬ$\r��;��w��jh��\0��E�����H�|ϒg�KG��I^�Q�ր�H	�yk�	$(Ooa���w\'�%I�JT�\Z�A��cO�i�\"�������$\r\nv�uf �\0��۹5�ha���#���6~*�;T�a��h�\r���\0EB�7����*U����K|{k�Ox/h�:	CS.������u��`XC����$�L�[���\0\Z��Y5�e�/�ۼ�?b9�NX�v�u#U+,q\0�o��8���[z�V�����Q}`�ƈs~�M�����X��-�>�@p#P��# w�����aЍ53�p;�#�\'�-IW6ƀ�I>�@t@�<wX5�<x��Qq%����7����1�BcM����j�	���VǴ\0Gr<�\09XC�v�h>�\0$�(��#B>i��>DElw�P�O	�\0c��~ɀ\rW�T��%\'l:�1�x�n��*\'I�|���#�O�|S6 ���\'Ôи��)��\0]R:7�R��úx\Z��m`y�D�q\0�g�%4{���#������r�J�2�<\rI�8	�7��3�=�H�ȣ-?�Ck���6�5� WAê�(�l�Z@�gP�\0�=���杰C�~�$�ȺY�L�\"*;[:8q�?*v��I;[�@G�]h��A��yAϑ�yN�5$�$�(d�S\'\"4��uOM�ceĆN�r��E%��$�����W��\r<� ��¼V��<Gc*|4~j\"#�M6��Ve��2fP�沢֍dr5�7E�5�;�	h|�$�ͤ��ZG�6I��:��C��`\\�{wF���z��Q�T\Z��6��?D�T��Kۤ5�;EI46����@��=���8CmE�����OmG�E;�5�	й���� �\\��)\'d�[�����c_4j�S+��\\\Z!�����w4��ܻ�d����l\0\0��=ZTTH&��ؾ�d4>���\\��	��O\Zn	�\\�k*t���pպ�|�B)z�ʀ��m&����j ���eQ����П��;���UB��p�������9�k�$|�@�cݨ�h:�	����@,�wk3�!F�if�:��:��~�<��ܡ�b�\09��Wv�������_��8F��%��9���`�8�	����N�� V4��έ����%A��:;W��\0Totmԇ\0~�S$��>\\(8���C`i<�a�s}G#B@�R��-{*F�ѫn�����\0R�amdE��;���c[a�kb�ǰ�]���ch}�?���A4w跈\Z�s���dD���^:	�#��W6�Kbbd�?0A���A�i��	n���ˤ�><2}���l6u2~��i D|\ntA��v K�v�(�@���I�$���\0���\'|��C`h����_������9_���$���^�i�)J��v�m�\"�U�QKb�6%%]$Ӻ��v�B��Cp���^�6>��\09T�Vez][�Vޞ�A��Q$�o�\\:�S�T�H�(6��O�D�\n�I�5�=[��β%E�4EU$�TiCŶӠ	�_5M$���[�:&.�\n�IK�ء��Nֹ�\rh�L\0�$�;꽼��S�K����#���VՍKj��Ƈj}��}��X�+0�WN/�	�\\Z_�����(x�Nǉl�?�����sH\Z�=�4�g��|t��˅�x�L|��l-7k�������o��#]rJmxc�u�?�ӈ��[�����׃���{�F=+�%����:�8(.$��ʚI�/�&5�]:�SI����!�k~��$��A�8+���\n��|�_�-�F���Q$�*�(��ӧ�m�����\';�k\Z��4��ת�U�*�nc�v���3�D�8�URKN=.��:�q� ��� �5%8��n�kF�Or������,\Z�a>՞�f��ͮ�i�GN�2H�h\Z��ǉT�N��F��@�\"�#��¢�ot������1\"8���_Eh�h����U$�EWЮ;�[�i�;���|J��SKzj�jA��xp�$��M��n:p�Gq\n�I��JFᵶ\0�*a��xT�Hp�J6���Da�TRRyv��>�\Z�{Z$�2\Z��<Ь��_�I��k���*�J	2�O�C�D�?�F��\\��`���;��r�IO�?��vc�q[��+�����F��ݠ<���O5���\'��oO�o]���s��ǟ}?�!��t�	�B������d��[�S������p�<��w�ۢަ��z��{Za���c\'Q˼J�IK?����;	�����f��%�Hoi+1$��pߊ��]\"wZLG�^�s@hsߩ����ݻ�ZI��+��\0�»����7썌��)���m��s�����嚒��W��\0��T�B�\0��+�s�+��}�����^��%�E�G���9��]����!W��\0��,$1��?/�S\'�H��ZH��~�;�]ki��D�;.����h$�r�I(]����U���ϺYR{��픞�N��O�\'�X�)5��\0�%���{��A������β\n�I:��.��]؎q\Z\ZwX�$�Wi�Ls)�1\0k+-%C滨��',NULL,'','','','jmi');
/*!40000 ALTER TABLE `cir_requestfrom_opac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cir_transaction_history`
--

DROP TABLE IF EXISTS `cir_transaction_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cir_transaction_history` (
  `library_id` varchar(100) NOT NULL,
  `memid` varchar(70) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `transaction_date` varchar(50) default NULL,
  `document_id` varchar(25) NOT NULL,
  `status` varchar(100) default NULL,
  `checkout_id` int(11) default NULL,
  `checkout_date` varchar(25) default NULL,
  `checkin_id` int(11) default NULL,
  `checkin_date` varchar(25) default NULL,
  `fine_amt` float default NULL,
  `lost_item_id` varchar(25) default NULL,
  PRIMARY KEY  (`library_id`,`transaction_id`,`sublibrary_id`),
  CONSTRAINT `cir_transaction_history_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cir_transaction_history`
--

LOCK TABLES `cir_transaction_history` WRITE;
/*!40000 ALTER TABLE `cir_transaction_history` DISABLE KEYS */;
INSERT INTO `cir_transaction_history` VALUES ('jmi','111','jmi',1,'2011-07-02','1','returned',1,'2011-07-02',1,'2011-07-02',0,NULL),('jmi','111','jmi',2,'2011-07-02','1','returned',2,'2011-07-02',2,'2011-07-02',0,NULL),('jmi','111','jmi',3,'2011-07-02','1','returned',3,'2011-07-02',3,'2011-07-02',0,NULL),('jmi','111','jmi',4,'2011-07-05','1','issued',4,'2011-07-05',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cir_transaction_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `courses` (
  `library_id` varchar(20) NOT NULL,
  `course_id` varchar(20) NOT NULL,
  `course_name` varchar(50) default NULL,
  `dept_id` varchar(20) NOT NULL,
  `faculty_id` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`course_id`,`dept_id`,`library_id`,`faculty_id`),
  KEY `library_id` (`library_id`,`faculty_id`,`dept_id`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`library_id`, `faculty_id`, `dept_id`) REFERENCES `department` (`library_id`, `faculty_id`, `dept_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('jmi','bsc','bechelor of science','cs','science'),('CUL','MCA','Master of computer science','CS','Sc');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customizedbiblio`
--

DROP TABLE IF EXISTS `customizedbiblio`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `customizedbiblio` (
  `library_id` varchar(20) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `bib_id` int(11) NOT NULL default '0',
  `marctag` varchar(20) NOT NULL,
  `indicator1` char(1) default NULL,
  `indicator2` char(1) default NULL,
  `$a` varchar(500) default NULL,
  `$b` varchar(100) default NULL,
  `$c` varchar(100) default NULL,
  `$d` varchar(100) default NULL,
  `$e` varchar(100) default NULL,
  `$f` varchar(100) default NULL,
  `$g` varchar(100) default NULL,
  `$h` varchar(100) default NULL,
  `$i` varchar(100) default NULL,
  `$j` varchar(100) default NULL,
  `$k` varchar(100) default NULL,
  `$l` varchar(100) default NULL,
  `$m` varchar(100) default NULL,
  `$n` varchar(100) default NULL,
  `$o` varchar(100) default NULL,
  `$p` varchar(100) default NULL,
  `$q` varchar(100) default NULL,
  `$r` varchar(100) default NULL,
  `$s` varchar(100) default NULL,
  `$t` varchar(100) default NULL,
  `$u` varchar(100) default NULL,
  `$v` varchar(100) default NULL,
  `$w` varchar(100) default NULL,
  `$x` varchar(100) default NULL,
  `$y` varchar(100) default NULL,
  `$z` varchar(100) default NULL,
  `$0` varchar(100) default NULL,
  `$1` varchar(100) default NULL,
  `$2` varchar(100) default NULL,
  `$3` varchar(100) default NULL,
  `$4` varchar(100) default NULL,
  `$5` varchar(100) default NULL,
  `$6` varchar(100) default NULL,
  `$7` varchar(100) default NULL,
  `$8` varchar(100) default NULL,
  `$9` varchar(100) default NULL,
  PRIMARY KEY  (`library_id`,`bib_id`,`marctag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `customizedbiblio`
--

LOCK TABLES `customizedbiblio` WRITE;
/*!40000 ALTER TABLE `customizedbiblio` DISABLE KEYS */;
/*!40000 ALTER TABLE `customizedbiblio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demandlist`
--

DROP TABLE IF EXISTS `demandlist`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `demandlist` (
  `library_id` varchar(20) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `memId` varchar(70) NOT NULL,
  `title` varchar(50) NOT NULL,
  `category` varchar(50) default NULL,
  `author` varchar(50) default NULL,
  `publisher` varchar(50) default NULL,
  `publish_yr` varchar(10) default NULL,
  `isbn` varchar(50) default NULL,
  `no_of_copy` varchar(10) default NULL,
  `volume` varchar(50) default NULL,
  `edition` varchar(50) default NULL,
  `remark` varchar(50) default NULL,
  `demand_date` varchar(50) default NULL,
  `language` varchar(20) default NULL,
  `issn` varchar(20) default NULL,
  `status` varchar(100) default NULL,
  PRIMARY KEY  (`library_id`,`memId`,`sublibrary_id`,`title`),
  KEY `library_id` (`library_id`,`sublibrary_id`,`memId`),
  CONSTRAINT `demandlist_ibfk_1` FOREIGN KEY (`library_id`, `sublibrary_id`, `memId`) REFERENCES `cir_member_account` (`library_id`, `sublibrary_id`, `memid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `demandlist`
--

LOCK TABLES `demandlist` WRITE;
/*!40000 ALTER TABLE `demandlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `demandlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `department` (
  `library_id` varchar(20) NOT NULL,
  `dept_id` varchar(20) NOT NULL,
  `dept_name` varchar(50) default NULL,
  `faculty_id` varchar(20) NOT NULL,
  PRIMARY KEY  (`dept_id`,`faculty_id`,`library_id`),
  KEY `library_id` (`library_id`,`faculty_id`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`library_id`, `faculty_id`) REFERENCES `faculty` (`library_id`, `faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `department_ibfk_2` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('bbzhcet','AP','Applied Physics','ENGG'),('amu','Arabic','Arabic','a'),('iitk','bed','Education','sc'),('iitk','cs','Computer Science','cs'),('amu','cs','Computer Science','sc'),('jmi','cs','Computer Science','science'),('jmi','fm','Forest Management','wl'),('amu','His','History','a'),('jmi','his','Dept of History','arts'),('iitk','phy','Physics','cs'),('amu','phy','Physics','sc'),('scc','Physics','Physics','sc');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_category`
--

DROP TABLE IF EXISTS `document_category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `document_category` (
  `document_category_id` varchar(20) NOT NULL default '',
  `document_category_name` varchar(30) default NULL,
  `issue_check` varchar(20) default NULL,
  `library_id` varchar(20) NOT NULL default '',
  `sublibrary_id` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`document_category_id`,`library_id`,`sublibrary_id`),
  KEY `library_id` (`library_id`),
  CONSTRAINT `document_category_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `document_category`
--

LOCK TABLES `document_category` WRITE;
/*!40000 ALTER TABLE `document_category` DISABLE KEYS */;
INSERT INTO `document_category` VALUES ('g','General Reading','Issuable','amu','amu'),('g','General Reading','NotIssuable','iitk','iitk'),('m','Manuscript','NotIssuable','amu','amu'),('man','manuscript','NotIssuable','scc','scc'),('r','Reference Book','Issuable','amu','csamu'),('r','Reference Book','NotIssuable','dei','dei'),('r','ref','NotIssuable','jmi','cs'),('ref','Reference Book','Issuable','iitk','iitk'),('ref','Reference Book','NotIssuable','jmi','jmi'),('t','Text Book','Issuable','amu','amu'),('t','Text Book','Issuable','amu','csamu'),('t','Text Book','Issuable','dei','dei'),('t','Text Book','Issuable','iitk','iitk'),('t','textbook','Issuable','jmi','cs'),('t','textual','Issuable','jmi','jmi'),('t','textual','Issuable','yy','yy'),('TB','Text Book','Issuable','bbzhcet','bbzhcet'),('txt','Text Book','Issuable','jmi','jmi'),('txt','Text Book','Issuable','scc','scc');
/*!40000 ALTER TABLE `document_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_details`
--

DROP TABLE IF EXISTS `document_details`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `document_details` (
  `document_id` int(11) NOT NULL default '0',
  `biblio_id` int(11) default NULL,
  `library_id` varchar(20) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `document_type` varchar(20) default NULL,
  `book_type` varchar(20) default NULL,
  `accession_type` varchar(20) default NULL,
  `date_acquired` varchar(20) default NULL,
  `title` varchar(200) default NULL,
  `subtitle` varchar(200) default NULL,
  `alt_title` varchar(200) default NULL,
  `statement_responsibility` varchar(200) default NULL,
  `main_entry` varchar(200) default NULL,
  `added_entry` varchar(200) default NULL,
  `added_entry1` varchar(200) default NULL,
  `added_entry2` varchar(200) default NULL,
  `added_entry3` varchar(200) default NULL,
  `publisher_name` varchar(200) default NULL,
  `publication_place` varchar(200) default NULL,
  `publishing_year` varchar(20) default NULL,
  `parts_no` int(11) default NULL,
  `subject` varchar(200) default NULL,
  `entry_language` varchar(200) default NULL,
  `isbn10` varchar(20) default NULL,
  `isbn13` varchar(20) default NULL,
  `LCC_no` varchar(30) default NULL,
  `edition` varchar(20) default NULL,
  `no_of_copies` int(11) default NULL,
  `author_name` varchar(200) default NULL,
  `guide_name` varchar(200) default NULL,
  `university_faculty` varchar(200) default NULL,
  `degree` varchar(200) default NULL,
  `submitted_on` varchar(20) default NULL,
  `acceptance_year` varchar(20) default NULL,
  `collation1` varchar(20) default NULL,
  `notes` varchar(2000) default NULL,
  `abstract` varchar(2000) default NULL,
  `address` varchar(20) default NULL,
  `state1` varchar(100) default NULL,
  `country` varchar(100) default NULL,
  `email` varchar(200) default NULL,
  `frmr_frq` varchar(20) default NULL,
  `frq_date` varchar(20) default NULL,
  `issn` varchar(20) default NULL,
  `volume_location` varchar(20) default NULL,
  `production_year` int(11) default NULL,
  `source1` varchar(20) default NULL,
  `duration` varchar(20) default NULL,
  `series` varchar(1000) default NULL,
  `physical_form` varchar(200) default NULL,
  `colour` varchar(20) default NULL,
  `type_of_disc` varchar(20) default NULL,
  `file_type` varchar(20) default NULL,
  `accession_no` varchar(40) default NULL,
  `record_no` int(11) default NULL,
  `call_no` varchar(30) default NULL,
  `volume_no` varchar(5) default NULL,
  `location` varchar(200) default NULL,
  `shelving_location` varchar(200) default NULL,
  `index_no` varchar(20) default NULL,
  `no_of_pages` varchar(20) default NULL,
  `physical_width` varchar(20) default NULL,
  `bind_type` varchar(20) default NULL,
  `status` varchar(50) default NULL,
  PRIMARY KEY  (`document_id`,`library_id`,`sublibrary_id`),
  KEY `biblio_id` (`biblio_id`,`library_id`,`sublibrary_id`),
  CONSTRAINT `document_details_ibfk_1` FOREIGN KEY (`biblio_id`, `library_id`, `sublibrary_id`) REFERENCES `bibliographic_details` (`biblio_id`, `library_id`, `sublibrary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `document_details`
--

LOCK TABLES `document_details` WRITE;
/*!40000 ALTER TABLE `document_details` DISABLE KEYS */;
INSERT INTO `document_details` VALUES (1,1,'jmi','jmi','Book','ref',NULL,'2011-09-13','complete ref java','','','kedar kumar','kedar kumar','','','','','','','',NULL,'','HI','z100','','','',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'HI1',1,'100','2','RM','3rd stack','I-XI','200','5.4 inch','hard','available'),(2,1,'jmi','jmi','Book','ref',NULL,'2011-09-13','complete ref java','','','kedar kumar','kedar kumar','','','','','','','',NULL,'','HI','z100','','','',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'HI2',2,'100','2','RM','3rd stack','I-XI','200','5.4 inch','hard','available'),(3,2,'jmi','jmi','Book','ref',NULL,'2011-09-13','Java Bible','','','Asif Iqubal','asif iqubal','','','','','TMH','','2000',NULL,'','','','','','',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'3',3,'200','1','RM','','i-xii','150','8.4 inch','hard','available'),(4,2,'jmi','jmi','Book','ref',NULL,'2011-09-13','Java Bible','','','Asif Iqubal','asif iqubal','','','','','TMH','','2000',NULL,'','','','','','',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'4',4,'200','1','RM','','i-xii','150','8.4 inch','hard','available'),(5,3,'jmi','jmi','Book','txt',NULL,'2011-09-13','prem chand','','','prem chand','prem chand','','','','','','','',NULL,'','HI','','','','',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'HI5',5,'300','2','RM','2nd reck','i-xi','200','5.4 inch','hard','available'),(6,3,'jmi','jmi','Book','txt',NULL,'2011-09-13','prem chand','','','prem chand','prem chand','','','','','','','',NULL,'','HI','','','','',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'HI6',6,'300','2','RM','2nd reck','i-xi','200','5.4 inch','hard','available');
/*!40000 ALTER TABLE `document_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editmarc`
--

DROP TABLE IF EXISTS `editmarc`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `editmarc` (
  `tagnumber` bigint(20) NOT NULL default '0',
  `tagname` varchar(100) default NULL,
  `subsymbol` char(1) NOT NULL default '',
  `subdescription` varchar(100) default NULL,
  `repeatable1` tinyint(1) default NULL,
  PRIMARY KEY  (`tagnumber`,`subsymbol`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `editmarc`
--

LOCK TABLES `editmarc` WRITE;
/*!40000 ALTER TABLE `editmarc` DISABLE KEYS */;
/*!40000 ALTER TABLE `editmarc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_type`
--

DROP TABLE IF EXISTS `employee_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `employee_type` (
  `library_id` varchar(20) NOT NULL,
  `emptype_id` varchar(20) NOT NULL,
  `emptype_full_name` varchar(100) default NULL,
  PRIMARY KEY  (`library_id`,`emptype_id`),
  CONSTRAINT `employee_type_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `employee_type`
--

LOCK TABLES `employee_type` WRITE;
/*!40000 ALTER TABLE `employee_type` DISABLE KEYS */;
INSERT INTO `employee_type` VALUES ('amu','nt','Non-Teaching Staff'),('amu','t','Teaching Staff'),('bbzhcet','s','Student'),('dei','st','Student'),('dei','t','Teaching Staff'),('iitk','nt','Non-Teaching Staff'),('iitk','rtd','Retired'),('iitk','s','Student'),('iitk','st','Student'),('iitk','t','Teaching Staff'),('jmi','nt','Non-Teaching Staff'),('jmi','s','Student'),('jmi','st','student1'),('jmi','t','Teaching Staff'),('scc','s','Student'),('yy','st','student');
/*!40000 ALTER TABLE `employee_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `faculty` (
  `library_id` varchar(20) NOT NULL default '',
  `faculty_id` varchar(20) NOT NULL default '',
  `faculty_name` varchar(50) default NULL,
  PRIMARY KEY  (`library_id`,`faculty_id`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('amu','a','Arts'),('amu','sc','Science'),('bbzhcet','ENGG','Engineering & Tech'),('iitk','cs','Science'),('iitk','sc','Social Science'),('jmi','arts','Faculty of Arts'),('jmi','science','Science'),('jmi','wl','Faculty of Wild Life'),('scc','sc','Science');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `feedback` (
  `library_id` varchar(20) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `name` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `comments` text,
  `date` varchar(15) default NULL,
  PRIMARY KEY  (`library_id`,`sublibrary_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `library` (
  `registration_id` int(11) default NULL,
  `library_id` varchar(20) NOT NULL,
  `library_name` varchar(50) default NULL,
  `staff_id` varchar(100) default NULL,
  `working_status` varchar(50) NOT NULL default 'OK',
  PRIMARY KEY  (`library_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
INSERT INTO `library` VALUES (9,'A','A','admin.A','OK'),(1,'amu','Maulana Azad Library1','admin.amu','OK'),(7,'avlin','avilib','admin.avlin','OK'),(8,'bbzhcet','Book Bank, ZHCET','admin.bbzhcet','OK'),(3,'dei','Dayalbagh Central Library','admin.dei','OK'),(10,'e','A','admin.e','OK'),(12,'i','i','admin.i','OK'),(2,'iitk','IITK Library','admin.iitk','OK'),(10,'iu','fhdfh','admin.iu','OK'),(4,'jmi','Dr. Zakir Hussain Library','admin.jmi','OK'),(0,'libms','libms','admin.libms','OK'),(11,'o','o','admin.o','OK'),(13,'p','p','admin.p','OK'),(6,'rvce','rvce-library','admin.rvce','OK'),(5,'scc','Shivaji Library','admin.scc','OK'),(9,'tt','ghfgjhfg','admin.tt','OK'),(11,'yy','fhdfh','admin.yy','OK');
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `location` (
  `location_id` varchar(10) NOT NULL default '',
  `location_name` varchar(20) default NULL,
  `library_id` varchar(20) NOT NULL default '',
  `sublibrary_id` varchar(20) NOT NULL default '',
  `location_desc` varchar(2000) default NULL,
  PRIMARY KEY  (`location_id`,`library_id`,`sublibrary_id`),
  KEY `library_id` (`library_id`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES ('Cir','GF','bbzhcet','bbzhcet',''),('gf','central','rvce','rvce','main library of rvce'),('Old','Old Building','amu','csamu',''),('Old','Old Building','iitk','iitk',''),('RM','Reading Room','amu','amu','2nd Floor'),('RM','Reading Room','jmi','jmi',''),('TSD','Textual Division','amu','amu','First Floor'),('tsd','Textual Division','dei','dei','First Floor'),('TSD','Textual Division','iitk','iitk','Ist Floor'),('tsd','kk','jmi','cs',''),('tsd','textual division','scc','scc',''),('tsd','text','yy','yy','');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `login` (
  `library_id` varchar(20) NOT NULL default '',
  `sublibrary_id` varchar(20) default NULL,
  `login_id` varchar(100) NOT NULL,
  `staff_id` varchar(100) NOT NULL default '',
  `user_name` varchar(50) default NULL,
  `question` varchar(1000) default NULL,
  `ans` varchar(500) default NULL,
  `role` varchar(50) default NULL,
  `password` varchar(200) default NULL,
  PRIMARY KEY  (`staff_id`,`library_id`),
  UNIQUE KEY `login_id` (`login_id`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`staff_id`, `library_id`) REFERENCES `staff_detail` (`staff_id`, `library_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('amu','amu','kedar','111','Kedar Kumar','@','null','admin','b454a6858eb34fee55ec859fa2634510'),('bbzhcet','bbzhcet','kamal','111','Syed Kamal Ahmad','What is your school name?','SST','staff','7f58341b9dceb1f1edca80dae10b92bc'),('dei','dei','111','111','Arush Kumar','What is your pet name?','arush','admin','6e45a1a9e36ef7f033b949131f2f8893'),('jmi','jmi','222','111','Kedar kumar','@','null','staff','2ee65f24663cc23f7fe6655d7abff80f'),('yy','yy','j','111','gsg dgsd','What is your pet name?','dd','staff','f089719c48d9f879edd104a7520d9eab'),('amu','csamu','iqubal','222','Iqubal Ahmad','What is your pet name?','iqubal','dept-admin','1ecc67aac81ca79635ff2a046303bb15'),('jmi','cs','6666','6666','Asif Iqubal','@',NULL,'dept-staff','17435531c34d44f623e3840c11f5970e'),('amu','amu','aasim','admin.amu','Aasim Zafar','What is your pet name?','kk','insti-admin','3f6ea67e781aa476e8638df6d5877447'),('avlin','avlin','auengg','admin.avlin','avi admin','What is your school name?','auengg','insti-admin','0192023a7bbd73250516f069df18b500'),('bbzhcet','bbzhcet','bbzhcet','admin.bbzhcet','Asif fareed Siddiqui','What is your school name?','GIC','insti-admin','7e0deb8853363a84629ba98fbaa29c55'),('dei','dei','prem','admin.dei','Prem Sewak Sudhish','What is your pet name?','prem','insti-admin','f0c17eb77a937d973f1625f0441d02b6'),('iitk','iitk','ynsingh','admin.iitk','Yatindra Nath Singh','What is your pet name?','ynsingh','insti-admin','8a9b1c308adbdefe4c47d62bf861f49d'),('iu','iu','u','admin.iu','i i','@',NULL,'insti-admin',''),('jmi','jmi','azim','admin.jmi','muzaffar azim','What is your school name?','jmi','insti-admin','38471924c9a7bd52a10d5e83756c9fc2'),('libms','libms','superadmin','admin.libms','superadmin',NULL,NULL,'superadmin','cb1410590d830d574e61fd941c4c43e1'),('rvce','rvce','renukaprasadb','admin.rvce','subramanya kn','What is your pet name?','renu','insti-admin','46eed70681a9a156462ae05b29a6914e'),('scc','scc','murtaza','admin.scc','Murtaza Ali','What is your pet name?','murtaza','insti-admin','129e3011b32e8c12fd23475e3106ff6b'),('tt','tt','kk','admin.tt','kk kk','@',NULL,'insti-admin',''),('yy','yy','k','admin.yy','k kjkh','What is your pet name?','kk','insti-admin','05f7d7a7d57cd9ee7934aff0af35105a');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `logs` (
  `sno` int(5) NOT NULL auto_increment,
  `user_id` varchar(100) default NULL,
  `date` varchar(100) default NULL,
  `time` varchar(100) default NULL,
  `classname` varchar(100) default NULL,
  `url` varchar(100) default NULL,
  `action_message` varchar(100) default NULL,
  `action_result` varchar(100) default NULL,
  `library_id` varchar(20) default NULL,
  `sublibrary_id` varchar(20) default NULL,
  `username` varchar(200) default NULL,
  `role` varchar(50) default NULL,
  PRIMARY KEY  (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,'superadmin','2011-09-13 14:32:38',NULL,NULL,'/LibMS/logout.do',NULL,NULL,'libms','libms','superadmin','superadmin'),(2,'superadmin','2011-09-13 14:32:48',NULL,NULL,'/LibMS/superadmin.do',NULL,NULL,'libms','libms','superadmin','superadmin'),(3,'superadmin','2011-09-13 14:32:50',NULL,NULL,'/LibMS/admin/search_log.jsp',NULL,NULL,'libms','libms','superadmin','superadmin'),(4,'superadmin','2011-09-13 14:32:50',NULL,NULL,'/LibMS/admin/search_log.do',NULL,NULL,'libms','libms','superadmin','superadmin'),(5,'superadmin','2011-09-13 14:33:02',NULL,NULL,'/LibMS/logout.do',NULL,NULL,'libms','libms','superadmin','superadmin'),(6,'','2011-09-13','1315905300420','com.myapp.struts.LoginAction','/LibMS','','Successfully Login','jmi','jmi',NULL,NULL),(7,'','2011-09-13','1315906237380','com.myapp.struts.LoginAction','/LibMS','','Successfully Login','jmi','jmi',NULL,NULL),(8,'','2011-09-13','1315906567834','com.myapp.struts.LoginAction','/LibMS','','Successfully Login','jmi','jmi',NULL,NULL),(9,'','2011-09-13','1315906645294','com.myapp.struts.LoginAction','/LibMS','','Invalid UserName or password',NULL,NULL,NULL,NULL),(10,'','2011-09-13','1315906651906','com.myapp.struts.LoginAction','/LibMS','','Successfully Login','jmi','jmi',NULL,NULL),(250,'','2011-09-14','1315958614762','com.myapp.struts.LoginAction','/LibMS','','Successfully Login','jmi','jmi',NULL,NULL),(251,'','2011-09-14','1315959088802','com.myapp.struts.LoginAction','/LibMS','','Successfully Login','jmi','jmi',NULL,NULL),(252,'','2011-09-14','1315959435241','com.myapp.struts.LoginAction','/LibMS','','Successfully Login','jmi','jmi',NULL,NULL),(253,'','2011-09-14','1315959468253','com.myapp.struts.LoginAction','/LibMS','','Successfully Login','jmi','jmi',NULL,NULL),(254,'','2011-09-14','1315962542861','com.myapp.struts.LoginAction','/LibMS','','Invalid UserName or password',NULL,NULL,NULL,NULL),(255,'','2011-09-14','1315962551192','com.myapp.struts.LoginAction','/LibMS','','Successfully Login','libms','libms',NULL,NULL),(256,'','2011-09-14','1315962570491','com.myapp.struts.LoginAction','/LibMS','','Successfully Login','libms','libms',NULL,NULL),(257,'','2011-09-14','1315962604255','com.myapp.struts.LoginAction','/LibMS','','Successfully Login','jmi','jmi',NULL,NULL),(258,'','2011-09-14','1315963015081','com.myapp.struts.LoginAction','/LibMS','','Successfully Login','jmi','jmi',NULL,NULL);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logsetting`
--

DROP TABLE IF EXISTS `logsetting`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `logsetting` (
  `sno` int(11) NOT NULL auto_increment,
  `p1` varchar(100) default NULL,
  `p2` varchar(100) default NULL,
  `p3` varchar(100) default NULL,
  `p4` varchar(100) default NULL,
  `p5` varchar(100) default NULL,
  `p6` varchar(100) default NULL,
  `p7` varchar(100) default NULL,
  `p8` varchar(100) default NULL,
  PRIMARY KEY  (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `logsetting`
--

LOCK TABLES `logsetting` WRITE;
/*!40000 ALTER TABLE `logsetting` DISABLE KEYS */;
INSERT INTO `logsetting` VALUES (6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `logsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL default '0',
  `library_id` varchar(20) NOT NULL default '',
  `subject` varchar(59) default NULL,
  `message` varchar(198) default NULL,
  PRIMARY KEY  (`notice_id`,`library_id`),
  KEY `library_id` (`library_id`),
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `notices` (
  `library_id` varchar(20) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `notice_id` varchar(50) NOT NULL,
  `subject` varchar(200) default NULL,
  `detail` text,
  `date` varchar(15) default NULL,
  `sot` varchar(5) default NULL,
  PRIMARY KEY  (`library_id`,`sublibrary_id`,`notice_id`),
  CONSTRAINT `notices_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
INSERT INTO `notices` VALUES ('amu','amu','a','aaaa','dgdfgdzfdsfvdsfvdsfsdbds d ds d d ds d \r\n dd d','2011-4-16',NULL),('iitk','iitk','1','Submit Dues','All due should be submitted by 25th April 2011.','2011-4-18',NULL);
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `privilege` (
  `library_id` varchar(20) NOT NULL default '',
  `sublibrary_id` varchar(20) default NULL,
  `staff_id` varchar(100) NOT NULL,
  `acquisition` varchar(5) default 'true',
  `cataloguing` varchar(5) default 'true',
  `circulation` varchar(5) default 'true',
  `serial` varchar(5) default 'true',
  `administrator` varchar(5) default 'true',
  `system_setup` varchar(5) default 'true',
  `utilities` varchar(5) default 'true',
  `opac` varchar(5) default 'true',
  PRIMARY KEY  (`staff_id`,`library_id`),
  CONSTRAINT `login_ibfk_3` FOREIGN KEY (`staff_id`, `library_id`) REFERENCES `staff_detail` (`staff_id`, `library_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES ('amu','amu','111','false','false','false','false','false','false','false','false'),('bbzhcet','bbzhcet','111','true','true','false','true','true','true','true','true'),('dei','dei','111','false','false','false','false','false','false','false','false'),('jmi','jmi','111','false','false','false','false','true','true','true','false'),('yy','yy','111','false','true','true','true','true','true','true','true'),('amu','csamu','222','true','false','false','true','false','false','false','false'),('jmi','cs','6666','true','false','true','true','true','true','true','true'),('amu','amu','admin.amu','false','false','false','false','false','false','false','false'),('avlin','avlin','admin.avlin','false','false','false','false','false','false','false','false'),('bbzhcet','bbzhcet','admin.bbzhcet','false','false','false','false','false','false','false','false'),('dei','dei','admin.dei','false','false','false','false','false','false','false','false'),('iitk','iitk','admin.iitk','false','false','false','false','false','false','false','false'),('iu','iu','admin.iu','false','false','false','false','false','false','false','false'),('jmi','jmi','admin.jmi','false','false','false','false','false','false','false','false'),('rvce','rvce','admin.rvce','false','false','false','false','false','false','false','false'),('scc','scc','admin.scc','false','false','false','false','false','false','false','false'),('tt','tt','admin.tt','false','false','false','false','false','false','false','false'),('yy','yy','admin.yy','false','false','false','false','false','false','false','false');
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservationlist`
--

DROP TABLE IF EXISTS `reservationlist`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reservationlist` (
  `request_id` varchar(20) NOT NULL default '',
  `library_id` varchar(100) NOT NULL default '',
  `sublibrary_id` varchar(20) NOT NULL default '',
  `memid` varchar(70) NOT NULL default '',
  `accessionno` varchar(50) default NULL,
  `card_id` varchar(50) default NULL,
  `title` varchar(100) default NULL,
  `category` varchar(25) default NULL,
  `author` varchar(100) default NULL,
  `isbn` varchar(200) default NULL,
  `callno` varchar(50) default NULL,
  `edition` varchar(25) default NULL,
  `volume` varchar(25) default NULL,
  `publication` varchar(50) default NULL,
  `remark` varchar(100) default NULL,
  `request_date` varchar(15) default NULL,
  `status` varchar(10) default NULL,
  `issn` varchar(20) default NULL,
  `language` varchar(20) default NULL,
  `pub_year` varchar(15) default NULL,
  PRIMARY KEY  (`request_id`,`library_id`,`sublibrary_id`,`memid`),
  KEY `library_id` (`library_id`),
  CONSTRAINT `reservationlist_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reservationlist`
--

LOCK TABLES `reservationlist` WRITE;
/*!40000 ALTER TABLE `reservationlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservationlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ser_privilege`
--

DROP TABLE IF EXISTS `ser_privilege`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ser_privilege` (
  `library_id` varchar(20) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `staff_id` varchar(100) NOT NULL,
  `ser_401` varchar(5) default 'true',
  `ser_402` varchar(5) default 'true',
  `ser_403` varchar(5) default 'true',
  `ser_404` varchar(5) default 'true',
  `ser_405` varchar(5) default 'true',
  `ser_406` varchar(5) default 'true',
  `ser_407` varchar(5) default 'true',
  `ser_408` varchar(5) default 'true',
  `ser_409` varchar(5) default 'true',
  `ser_410` varchar(5) default 'true',
  `ser_411` varchar(5) default 'true',
  `ser_412` varchar(5) default 'true',
  `ser_413` varchar(5) default 'true',
  `ser_414` varchar(5) default 'true',
  `ser_415` varchar(5) default 'true',
  `ser_416` varchar(5) default 'true',
  `ser_417` varchar(5) default 'true',
  `ser_418` varchar(5) default 'true',
  `ser_419` varchar(5) default 'true',
  `ser_420` varchar(5) default 'true',
  `ser_421` varchar(5) default 'true',
  `ser_422` varchar(5) default 'true',
  `ser_423` varchar(5) default 'true',
  `ser_424` varchar(5) default 'true',
  `ser_425` varchar(5) default 'true',
  `ser_426` varchar(5) default 'true',
  `ser_427` varchar(5) default 'true',
  `ser_428` varchar(5) default 'true',
  `ser_429` varchar(5) default 'true',
  `ser_430` varchar(5) default 'true',
  `ser_431` varchar(5) default 'true',
  `ser_432` varchar(5) default 'true',
  `ser_433` varchar(5) default 'true',
  `ser_434` varchar(5) default 'true',
  `ser_435` varchar(5) default 'true',
  `ser_436` varchar(5) default 'true',
  `ser_437` varchar(5) default 'true',
  `ser_438` varchar(5) default 'true',
  `ser_439` varchar(5) default 'true',
  `ser_440` varchar(5) default 'true',
  `ser_441` varchar(5) default 'true',
  `ser_442` varchar(5) default 'true',
  `ser_443` varchar(5) default 'true',
  `ser_444` varchar(5) default 'true',
  `ser_445` varchar(5) default 'true',
  `ser_446` varchar(5) default 'true',
  `ser_447` varchar(5) default 'true',
  `ser_448` varchar(5) default 'true',
  `ser_449` varchar(5) default 'true',
  `ser_450` varchar(5) default 'true',
  `ser_451` varchar(5) default 'true',
  `ser_452` varchar(5) default 'true',
  `ser_453` varchar(5) default 'true',
  `ser_454` varchar(5) default 'true',
  `ser_455` varchar(5) default 'true',
  `ser_456` varchar(5) default 'true',
  `ser_457` varchar(5) default 'true',
  `ser_458` varchar(5) default 'true',
  `ser_459` varchar(5) default 'true',
  `ser_460` varchar(5) default 'true',
  `ser_461` varchar(5) default 'true',
  `ser_462` varchar(5) default 'true',
  `ser_463` varchar(5) default 'true',
  `ser_464` varchar(5) default 'true',
  `ser_465` varchar(5) default 'true',
  `ser_466` varchar(5) default 'true',
  `ser_467` varchar(5) default 'true',
  `ser_468` varchar(5) default 'true',
  `ser_469` varchar(5) default 'true',
  `ser_470` varchar(5) default 'true',
  `ser_471` varchar(5) default 'true',
  `ser_472` varchar(5) default 'true',
  `ser_473` varchar(5) default 'true',
  `ser_474` varchar(5) default 'true',
  `ser_475` varchar(5) default 'true',
  `ser_476` varchar(5) default 'true',
  `ser_477` varchar(5) default 'true',
  `ser_478` varchar(5) default 'true',
  `ser_479` varchar(5) default 'true',
  `ser_480` varchar(5) default 'true',
  `ser_481` varchar(5) default 'true',
  `ser_482` varchar(5) default 'true',
  `ser_483` varchar(5) default 'true',
  `ser_484` varchar(5) default 'true',
  `ser_485` varchar(5) default 'true',
  `ser_486` varchar(5) default 'true',
  `ser_487` varchar(5) default 'true',
  `ser_488` varchar(5) default 'true',
  `ser_489` varchar(5) default 'true',
  `ser_490` varchar(5) default 'true',
  `ser_491` varchar(5) default 'true',
  `ser_492` varchar(5) default 'true',
  `ser_493` varchar(5) default 'true',
  `ser_494` varchar(5) default 'true',
  `ser_495` varchar(5) default 'true',
  `ser_496` varchar(5) default 'true',
  `ser_497` varchar(5) default 'true',
  `ser_498` varchar(5) default 'true',
  `ser_499` varchar(5) default 'true',
  PRIMARY KEY  (`staff_id`,`library_id`),
  CONSTRAINT `login_ibfk_7` FOREIGN KEY (`staff_id`, `library_id`) REFERENCES `staff_detail` (`staff_id`, `library_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ser_privilege`
--

LOCK TABLES `ser_privilege` WRITE;
/*!40000 ALTER TABLE `ser_privilege` DISABLE KEYS */;
INSERT INTO `ser_privilege` VALUES ('amu','amu','111','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('bbzhcet','bbzhcet','111','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true'),('dei','dei','111','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('jmi','jmi','111','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('yy','yy','111','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true'),('amu','csamu','222','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true'),('jmi','cs','6666','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true','true'),('amu','amu','admin.amu','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('avlin','avlin','admin.avlin','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('bbzhcet','bbzhcet','admin.bbzhcet','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('dei','dei','admin.dei','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('iitk','iitk','admin.iitk','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('iu','iu','admin.iu','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('jmi','jmi','admin.jmi','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('rvce','rvce','admin.rvce','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('scc','scc','admin.scc','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('tt','tt','admin.tt','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false'),('yy','yy','admin.yy','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false','false');
/*!40000 ALTER TABLE `ser_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_detail`
--

DROP TABLE IF EXISTS `staff_detail`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `staff_detail` (
  `library_id` varchar(20) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `staff_id` varchar(100) NOT NULL,
  `title` varchar(5) default NULL,
  `first_name` varchar(20) default NULL,
  `last_name` varchar(20) default NULL,
  `contact_no` varchar(20) default NULL,
  `mobile_no` varchar(20) default NULL,
  `email_id` varchar(100) default NULL,
  `date_joining` date default NULL,
  `date_releaving` date default NULL,
  `father_name` varchar(30) default NULL,
  `date_of_birth` date default NULL,
  `gender` varchar(8) default NULL,
  `address1` varchar(50) default NULL,
  `city1` varchar(20) default NULL,
  `state1` varchar(20) default NULL,
  `country1` varchar(20) default NULL,
  `zip1` varchar(20) default NULL,
  `address2` varchar(50) default NULL,
  `city2` varchar(20) default NULL,
  `state2` varchar(20) default NULL,
  `country2` varchar(20) default NULL,
  `zip2` varchar(20) default NULL,
  `staff_image` longblob,
  PRIMARY KEY  (`staff_id`,`library_id`),
  KEY `library_id` (`library_id`),
  CONSTRAINT `staff_detail_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `staff_detail`
--

LOCK TABLES `staff_detail` WRITE;
/*!40000 ALTER TABLE `staff_detail` DISABLE KEYS */;
INSERT INTO `staff_detail` VALUES ('amu','amu','111','mr','Kedar','Kumar','','','kedar@gmail.com',NULL,NULL,'','1970-04-10','male','ADM Compound','Aligarh','UP','India','','ADM Compound','Aligarh','UP','India','',NULL),('bbzhcet','bbzhcet','111','mr','Syed Kamal','Ahmad','','','skamal90@yahoo.co.in','2011-05-04','2011-07-04','',NULL,'male','4/919, Iqbal Street, Jamalpur','Aligarh','Uttar Pradesh','India','202002','4/919, Iqbal Street, Jamalpur','Aligarh','Uttar Pradesh','India','202002',NULL),('dei','dei','111','mr','Arush','Kumar','','','arush@gmail.com',NULL,NULL,'',NULL,'male','DayalBagh','Agra','UP','India','','','','','','',NULL),('jmi','jmi','111',NULL,'Kedar','kumar','','','kedar9002@gmail.com',NULL,NULL,'',NULL,'Select','ADM','Aliagrh','UP','India','','','','','','',NULL),('yy','yy','111',NULL,'gsg','dgsd','','','kedar9002@gmail.com',NULL,NULL,'',NULL,NULL,'fghdf','dfhdf','fhdf','dfhdf','','','','','','',NULL),('jmi','jmi','112','mr','kk','kk','','','kk@gmail.com',NULL,NULL,'',NULL,NULL,'ss','aa','bb','ii','','','','','','',NULL),('amu','csamu','222','mr','Iqubal','Ahmad','','','iqubal@gmail.com',NULL,NULL,'',NULL,NULL,'ADM Compound','Aligarh','U.P.','India','','ADM Compound','Aligarh','U.P.','India','',NULL),('jmi','cs','222',NULL,'Kedar','kumar','','','kedar9002@gmail.com',NULL,NULL,'',NULL,NULL,'ADM','Aliagrh','UP','India','','','','','','',NULL),('jmi','cs','6666','mr','Asif','Iqubal','','','asif633@gmail.com',NULL,NULL,'',NULL,'male','Asif','Aligarh','UP','India','','','','','','',NULL),('amu','amu','admin.amu','Dr','Aasim','Zafar','','9319098461','aasimzafar@gmail.com',NULL,NULL,'',NULL,'male','AMU','Aligarh','U.P.','India','202002','','','','','',NULL),('avlin','avlin','admin.avlin','','avi','admin','','9842057738','admin@auengg.com',NULL,NULL,NULL,NULL,'male',NULL,'Coimbatore','TmailNadu','India','-641 108',NULL,NULL,NULL,NULL,NULL,NULL),('bbzhcet','bbzhcet','admin.bbzhcet','Mr.','Asif fareed','Siddiqui','0','9412509849','asiffareedsiddiqui@yahoo.com',NULL,NULL,NULL,NULL,'male',NULL,'Aligarh','Uttar Pradesh','India','202002',NULL,NULL,NULL,NULL,NULL,NULL),('dei','dei','admin.dei','Mr.','Prem Sewak','Sudhish','','09927400888','prem@gmail.com',NULL,NULL,NULL,NULL,'male',NULL,'Agra','U.P.','India','202002',NULL,NULL,NULL,NULL,NULL,NULL),('iitk','iitk','admin.iitk','Prof.','Yatindra Nath','Singh','','9223432451','ynsingh69@gmail.com',NULL,NULL,NULL,NULL,'male',NULL,'Kanpur','U.P.','India','',NULL,NULL,NULL,NULL,NULL,NULL),('iu','iu','admin.iu','i','i','i','hdfh','645645','kedar9002@gmail.com',NULL,NULL,NULL,NULL,'male',NULL,'i','i','i','i',NULL,NULL,NULL,NULL,NULL,NULL),('jmi','jmi','admin.jmi','','muzaffar','azim','','098100','kedar9002@gmail.com',NULL,NULL,'',NULL,'male','ADM','New Delhi','Delhi','India','','','','','','',NULL),('libms','libms','admin.libms',NULL,'superadmin',NULL,NULL,NULL,NULL,'2011-04-16','2011-04-16',NULL,'2011-04-16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('rvce','rvce','admin.rvce','','subramanya','kn','6717 8020','9901945674','renukaprasadb@gmail.com',NULL,NULL,NULL,NULL,'male',NULL,'bengaluru','Karnataka','India','560059',NULL,NULL,NULL,NULL,NULL,NULL),('scc','scc','admin.scc','','Murtaza','Ali','','09422155049','murtaza@gmail.com',NULL,NULL,NULL,NULL,'male',NULL,'Amravati','Maharashtra','India','',NULL,NULL,NULL,NULL,NULL,NULL),('tt','tt','admin.tt','','kk','kk','','56754745','kedar9002@gmail.com',NULL,NULL,NULL,NULL,'male',NULL,'fghfg','hfghfg','gfhfg','fghfg',NULL,NULL,NULL,NULL,NULL,NULL),('yy','yy','admin.yy','hk','k','kjkh','kj','64564564','kedar9002@gmail.com',NULL,NULL,NULL,NULL,'male',NULL,'kh','khk','kkh','kk',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `staff_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_employee_type`
--

DROP TABLE IF EXISTS `sub_employee_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sub_employee_type` (
  `library_id` varchar(20) NOT NULL,
  `emptype_id` varchar(20) NOT NULL,
  `sub_emptype_id` varchar(20) NOT NULL,
  `sub_emptype_full_name` varchar(100) default NULL,
  `no_of_issueable_book` int(11) default NULL,
  PRIMARY KEY  (`library_id`,`emptype_id`,`sub_emptype_id`),
  CONSTRAINT `sub_employee_type_ibfk_1` FOREIGN KEY (`library_id`, `emptype_id`) REFERENCES `employee_type` (`library_id`, `emptype_id`),
  CONSTRAINT `sub_employee_type_ibfk_2` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sub_employee_type`
--

LOCK TABLES `sub_employee_type` WRITE;
/*!40000 ALTER TABLE `sub_employee_type` DISABLE KEYS */;
INSERT INTO `sub_employee_type` VALUES ('amu','nt','l','Library Staff',5),('amu','nt','nl','Non-Library Staff',2),('amu','t','l','Lecturer',10),('amu','t','prof','Professor',12),('bbzhcet','s','PG','Post Graduate',3),('dei','st','pg','Post Graduate',10),('dei','st','ug','Under Graduate',2),('iitk','nt','cl','Clerk',2),('iitk','s','pg','Post Graduate',1),('iitk','s','ug','Under Graduate',2),('iitk','t','prof','Professor',1),('jmi','s','pg','Post Graduate',7),('jmi','s','ug','Under Graduate',5),('jmi','st','pg','post grad',1),('scc','s','ug','Undergraduate',4),('yy','st','pg','post grad',5);
/*!40000 ALTER TABLE `sub_employee_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_library`
--

DROP TABLE IF EXISTS `sub_library`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sub_library` (
  `sublibrary_id` varchar(20) NOT NULL,
  `sublib_name` varchar(100) NOT NULL,
  `library_id` varchar(20) NOT NULL default '',
  `faculty_name` varchar(100) default NULL,
  `dept_address` varchar(200) default NULL,
  PRIMARY KEY  (`library_id`,`sublibrary_id`),
  CONSTRAINT `sub_library_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `library` (`library_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sub_library`
--

LOCK TABLES `sub_library` WRITE;
/*!40000 ALTER TABLE `sub_library` DISABLE KEYS */;
INSERT INTO `sub_library` VALUES ('amu','Main Library','amu',NULL,NULL),('csamu','cs','amu','sc','AMU, Aligarh'),('avlin','Main Library','avlin',NULL,NULL),('bbzhcet','Main Library','bbzhcet',NULL,NULL),('dei','Main Library','dei',NULL,NULL),('cs','Computer Science','iitk','cs','Main Building'),('iitk','Main Library','iitk',NULL,NULL),('iu','Main Library','iu',NULL,NULL),('cqs','asas','jmi','arts','AMU, Aligarh2'),('cs','cs','jmi','science','computer science complex'),('cs1','his','jmi','arts','univer'),('jmi','Main Library','jmi',NULL,NULL),('seminar-cqs','Computer Science','jmi','arts','Lecture Building 2'),('wf1','Forest Convservation','jmi','wl','univer'),('libms','libms','libms',NULL,NULL),('rvce','Main Library','rvce',NULL,NULL),('phy','Physics','scc','sc','Main Building'),('scc','Main Library','scc',NULL,NULL),('tt','Main Library','tt',NULL,NULL),('yy','Main Library','yy',NULL,NULL);
/*!40000 ALTER TABLE `sub_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_excell_import`
--

DROP TABLE IF EXISTS `temp_excell_import`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `temp_excell_import` (
  `sno` int(11) NOT NULL auto_increment,
  `library_id` varchar(20) NOT NULL,
  `sublibrary_id` varchar(20) NOT NULL,
  `document_type` varchar(20) default NULL,
  `book_type` varchar(20) default NULL,
  `accession_type` varchar(20) default NULL,
  `date_acquired` varchar(20) default NULL,
  `title` varchar(200) default NULL,
  `subtitle` varchar(200) default NULL,
  `alt_title` varchar(200) default NULL,
  `statement_responsibility` varchar(200) default NULL,
  `main_entry` varchar(200) default NULL,
  `added_entry` varchar(200) default NULL,
  `added_entry1` varchar(200) default NULL,
  `added_entry2` varchar(200) default NULL,
  `added_entry3` varchar(200) default NULL,
  `publisher_name` varchar(200) default NULL,
  `publication_place` varchar(200) default NULL,
  `publishing_year` varchar(20) default NULL,
  `call_no` varchar(30) default NULL,
  `parts_no` varchar(20) default NULL,
  `subject` varchar(200) default NULL,
  `entry_language` varchar(200) default NULL,
  `isbn10` varchar(20) default NULL,
  `isbn13` varchar(20) default NULL,
  `LCC_no` varchar(30) default NULL,
  `edition` varchar(20) default NULL,
  `no_of_copies` varchar(20) default NULL,
  `author_name` varchar(200) default NULL,
  `guide_name` varchar(200) default NULL,
  `university_faculty` varchar(200) default NULL,
  `degree` varchar(200) default NULL,
  `submitted_on` varchar(20) default NULL,
  `acceptance_year` varchar(20) default NULL,
  `collation1` varchar(20) default NULL,
  `notes` varchar(2000) default NULL,
  `abstract` varchar(2000) default NULL,
  `address` varchar(200) default NULL,
  `state1` varchar(100) default NULL,
  `country` varchar(100) default NULL,
  `email` varchar(200) default NULL,
  `frmr_frq` varchar(20) default NULL,
  `frq_date` varchar(20) default NULL,
  `issn` varchar(20) default NULL,
  `volume_location` varchar(20) default NULL,
  `production_year` varchar(20) default NULL,
  `source1` varchar(20) default NULL,
  `duration` varchar(20) default NULL,
  `series` varchar(1000) default NULL,
  `type_of_disc` varchar(20) default NULL,
  `file_type` varchar(20) default NULL,
  `accession_no` varchar(40) default NULL,
  `record_no` varchar(20) default NULL,
  `volume_no` varchar(20) default NULL,
  `location` varchar(200) default NULL,
  `shelving_location` varchar(200) default NULL,
  `index_no` varchar(20) default NULL,
  `no_of_pages` varchar(20) default NULL,
  `physical_width` varchar(20) default NULL,
  `physical_form` varchar(200) default NULL,
  `physical_description` varchar(200) default NULL,
  `colour` varchar(20) default NULL,
  `status` varchar(50) default NULL,
  `bind_type` varchar(20) default NULL,
  PRIMARY KEY  (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `temp_excell_import`
--

LOCK TABLES `temp_excell_import` WRITE;
/*!40000 ALTER TABLE `temp_excell_import` DISABLE KEYS */;
INSERT INTO `temp_excell_import` VALUES (25,'jmi,','jmi,','Book,','t,','<NULL>,','<NULL>,','champak,','<NULL>,','<NULL>,','champak,','<NULL>,',NULL,'<NULL>,','<NULL>,','<NULL>,',NULL,'<NULL>,','2011,','1,','2,','<NULL>,','HI,','1088,','<NULL>,','<NULL>,','<NULL>,','2,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,',NULL,'<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','2011,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'avaliable',NULL),(26,'jmi,','jmi,','Book,','t,','<NULL>,','<NULL>,','c++,','<NULL>,','<NULL>,','kedar,','<NULL>,',NULL,'<NULL>,','<NULL>,','<NULL>,',NULL,'<NULL>,','2000,','2,','1,','<NULL>,','HI,','5600,','<NULL>,','<NULL>,','<NULL>,','2,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,',NULL,'<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','2000,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'avaliable',NULL),(27,'jmi,','jmi,','Book,','t,','<NULL>,','<NULL>,','c,','<NULL>,','<NULL>,','c,','<NULL>,',NULL,'<NULL>,','<NULL>,','<NULL>,',NULL,'<NULL>,','1999,','3,','3,','<NULL>,','HI,','5544,','<NULL>,','<NULL>,','<NULL>,','1,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,',NULL,'<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','1999,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','<NULL>,','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'avaliable',NULL),(46,'jmi','jmi','Book','t',NULL,'2011-09-06','champak','','','champak','champak','','','','','','','2011','1','5','','HI','1088','','','','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2011',NULL,NULL,'',NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'avaliable',NULL),(47,'jmi','jmi','Book','t',NULL,'2011-09-06','c++','','','kedar','kedar','','','','','','','2000','2','8','','HI','5600','','','','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1900',NULL,NULL,'',NULL,NULL,'2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'avaliable',NULL),(48,'jmi','jmi','Book','t',NULL,'2011-09-06','c','','','c','c','','','','','','','1999','3','9','','HI','5544','','','','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1999',NULL,NULL,'',NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'avaliable',NULL);
/*!40000 ALTER TABLE `temp_excell_import` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-09-14 17:34:53
