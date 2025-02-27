CREATE DATABASE  IF NOT EXISTS `pico` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pico`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: pico_basic
-- ------------------------------------------------------
-- Server version	6.0.7-alpha-community

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
-- Table structure for table `budgetheadmaster`
--

DROP TABLE IF EXISTS `budgetheadmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budgetheadmaster` (
  `BHM_ID` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `BHM_Name` varchar(100) DEFAULT NULL,
  `BHM_IM_Id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`BHM_ID`),
  UNIQUE KEY `UNIQUE_BHM_IM_Id_BHM_Name` (`BHM_IM_Id`,`BHM_Name`),
  CONSTRAINT `fk_BHM_IM_Id` FOREIGN KEY (`BHM_IM_Id`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgetheadmaster`
--

LOCK TABLES `budgetheadmaster` WRITE;
/*!40000 ALTER TABLE `budgetheadmaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `budgetheadmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budgetmaster`
--

DROP TABLE IF EXISTS `budgetmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budgetmaster` (
  `bm_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `BM_IM_ID` smallint(5) unsigned NOT NULL,
  `BM_SIM_ID` mediumint(5) unsigned NOT NULL,
  `BM_DM_ID` mediumint(5) unsigned NOT NULL,
  `BM_BTM_ID` tinyint(3) unsigned NOT NULL COMMENT 'This fied stores Budget Type',
  `BM_Lapsable` enum('1','0') NOT NULL DEFAULT '0',
  `BM_FYM_ID` tinyint(3) unsigned NOT NULL,
  `BM_Budget_Name` varchar(100) NOT NULL,
  `BM_Allocated_Amount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bm_id`),
  UNIQUE KEY `Unique_BM_DM_ID_Budget_Name` (`BM_DM_ID`,`BM_Budget_Name`),
  KEY `FK_BM_InstitutionMaster_IM_ID` (`BM_IM_ID`),
  KEY `FK_BM_SubInstitutionMaster_SIM_ID` (`BM_SIM_ID`),
  KEY `FK_BM_BudgetTypeMaster_BTM_ID` (`BM_BTM_ID`),
  KEY `FK_BM_FinancialYearMaster_FYM_ID` (`BM_FYM_ID`),
  CONSTRAINT `FK_BM_BudgetTypeMaster_BTM_ID` FOREIGN KEY (`BM_BTM_ID`) REFERENCES `budgettypemaster` (`BTM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_BM_DepartmentMaster_DM_ID` FOREIGN KEY (`BM_DM_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_BM_FinancialYearMaster_FYM_ID` FOREIGN KEY (`BM_FYM_ID`) REFERENCES `financialyearmaster` (`FYM_FY_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_BM_InstitutionMaster_IM_ID` FOREIGN KEY (`BM_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_BM_SubInstitutionMaster_SIM_ID` FOREIGN KEY (`BM_SIM_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgetmaster`
--

LOCK TABLES `budgetmaster` WRITE;
/*!40000 ALTER TABLE `budgetmaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `budgetmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budgettypemaster`
--

DROP TABLE IF EXISTS `budgettypemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budgettypemaster` (
  `BTM_ID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `BTM_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`BTM_ID`),
  UNIQUE KEY `UNIQUE_BTM_Name` (`BTM_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgettypemaster`
--

LOCK TABLES `budgettypemaster` WRITE;
/*!40000 ALTER TABLE `budgettypemaster` DISABLE KEYS */;
INSERT INTO `budgettypemaster` VALUES (2,'Deposit'),(3,'Earmark'),(4,'Equipment Plan'),(5,'ERP Mission Project Budget'),(1,'Revenue');
/*!40000 ALTER TABLE `budgettypemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `committeemaster`
--

DROP TABLE IF EXISTS `committeemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committeemaster` (
  `Committee_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Committee_Type` int(10) unsigned DEFAULT NULL,
  `Committee_Name` varchar(100) NOT NULL,
  `Commmittee_Purpose` varchar(250) DEFAULT NULL,
  `Committee_Active` char(1) DEFAULT 'T',
  `Committee_Convener` varchar(100) NOT NULL COMMENT 'E-Mail Id of the committee convener',
  `Committee_Im_id` smallint(3) unsigned DEFAULT NULL,
  `Committee_SIM_ID` mediumint(3) unsigned DEFAULT NULL,
  `Committee_DM_ID` mediumint(5) unsigned DEFAULT NULL,
  `Committee_Level` char(1) DEFAULT 'I',
  PRIMARY KEY (`Committee_ID`),
  UNIQUE KEY `Committee_Name_UNIQUE` (`Committee_Name`),
  KEY `FK_Committee_Im_id_InstitutionMaster_IMID` (`Committee_Im_id`),
  KEY `FK_Committee_SIM_ID_SubInstitution_SIM_ID` (`Committee_SIM_ID`),
  KEY `FK_Committee_DM_ID_DepartmentMaster_DM_ID` (`Committee_DM_ID`),
  KEY `FK_Committee_Type_Erpm_General_Master_ERPMGM_EGM_ID` (`Committee_Type`),
  CONSTRAINT `FK_Committee_DM_ID_DepartmentMaster_DM_ID` FOREIGN KEY (`Committee_DM_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Committee_Im_id_InstitutionMaster_IMID` FOREIGN KEY (`Committee_Im_id`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Committee_SIM_ID_SubInstitution_SIM_ID` FOREIGN KEY (`Committee_SIM_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Committee_Type_Erpm_General_Master_ERPMGM_EGM_ID` FOREIGN KEY (`Committee_Type`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `committeemaster`
--

LOCK TABLES `committeemaster` WRITE;
/*!40000 ALTER TABLE `committeemaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `committeemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countrymaster`
--

DROP TABLE IF EXISTS `countrymaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countrymaster` (
  `Country_ID` tinyint(4) NOT NULL AUTO_INCREMENT,
  `Country_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Country_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countrymaster`
--

LOCK TABLES `countrymaster` WRITE;
/*!40000 ALTER TABLE `countrymaster` DISABLE KEYS */;
INSERT INTO `countrymaster` VALUES (1,'India'),(2,'China'),(3,'Japan'),(4,'Germany');
/*!40000 ALTER TABLE `countrymaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departmental_budget_allocation`
--

DROP TABLE IF EXISTS `departmental_budget_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departmental_budget_allocation` (
  `DBA_ID` mediumint(5) unsigned NOT NULL AUTO_INCREMENT,
  `DBA_IM_ID` smallint(3) unsigned NOT NULL,
  `DBA_SIM_ID` mediumint(3) unsigned NOT NULL,
  `DBA_DM_ID` mediumint(5) unsigned DEFAULT NULL,
  `DBA_From_Date` date DEFAULT NULL,
  `DBA_To_Date` date DEFAULT NULL,
  `DBA_BHM_ID` smallint(4) unsigned DEFAULT NULL,
  `DBA_Amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBA_ID`),
  UNIQUE KEY `UNIQUE_DBA_DM_ID_DBA_From_Date_DBA_To_Date_DBA_BHM_ID` (`DBA_DM_ID`,`DBA_From_Date`,`DBA_To_Date`,`DBA_BHM_ID`),
  KEY `fk_DBA_IM_ID_IM_ID` (`DBA_IM_ID`),
  KEY `fk_DBA_SIM_ID_SIM_ID` (`DBA_SIM_ID`),
  KEY `fk_DBA_BHM_ID_BHM_ID` (`DBA_BHM_ID`),
  CONSTRAINT `fk_DBA_BHM_ID_BHM_ID` FOREIGN KEY (`DBA_BHM_ID`) REFERENCES `budgetheadmaster` (`BHM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_DBA_DM_ID_DM_ID` FOREIGN KEY (`DBA_DM_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_DBA_IM_ID_IM_ID` FOREIGN KEY (`DBA_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_DBA_SIM_ID_SIM_ID` FOREIGN KEY (`DBA_SIM_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departmental_budget_allocation`
--

LOCK TABLES `departmental_budget_allocation` WRITE;
/*!40000 ALTER TABLE `departmental_budget_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `departmental_budget_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departmentmaster`
--

DROP TABLE IF EXISTS `departmentmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departmentmaster` (
  `DM_ID` mediumint(5) unsigned NOT NULL AUTO_INCREMENT,
  `DM_IM_ID` smallint(3) unsigned DEFAULT NULL,
  `DM_SIM_ID` mediumint(3) unsigned DEFAULT NULL,
  `DM_Name` varchar(100) NOT NULL,
  `DM_Short_Name` varchar(10) DEFAULT NULL,
  `DM_Address_Line1` varchar(50) DEFAULT NULL,
  `DM_Address_Line2` varchar(50) DEFAULT NULL,
  `DM_District` varchar(50) DEFAULT NULL,
  `DM_State_ID` tinyint(4) unsigned DEFAULT NULL,
  `DM_Pin_No` char(6) DEFAULT NULL,
  `DM_EMail_ID` varchar(50) DEFAULT NULL,
  `DM_Country_ID` tinyint(4) DEFAULT NULL,
  `DM_EMP_ID` int(5) unsigned DEFAULT NULL,
  `DM_Head_Designation` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`DM_ID`),
  KEY `FK_DM_StateMaster_State_ID` (`DM_State_ID`),
  KEY `FK_DM_SubInstitutionMaster_SIM_ID` (`DM_SIM_ID`),
  KEY `FK_DM_InstitutionMaster_IM_ID` (`DM_IM_ID`),
  KEY `fk_Countrymaster_DM_Country_ID` (`DM_Country_ID`),
  KEY `FK_DM_EMP_ID_employeemaster` (`DM_EMP_ID`),
  CONSTRAINT `fk_Countrymaster_DM_Country_ID` FOREIGN KEY (`DM_Country_ID`) REFERENCES `countrymaster` (`Country_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_DM_EMP_ID_employeemaster` FOREIGN KEY (`DM_EMP_ID`) REFERENCES `employeemaster` (`EMP_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_DM_InstitutionMaster_IM_ID` FOREIGN KEY (`DM_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_DM_StateMaster_State_ID` FOREIGN KEY (`DM_State_ID`) REFERENCES `statemaster` (`State_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_DM_SubInstitutionMaster_SIM_ID` FOREIGN KEY (`DM_SIM_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departmentmaster`
--

LOCK TABLES `departmentmaster` WRITE;
/*!40000 ALTER TABLE `departmentmaster` DISABLE KEYS */;
INSERT INTO `departmentmaster` VALUES (1,1,1,'Super Department','SUDEPT','Super Address 1','Super Address 2','Super City',1,'110025','pico.edrp@jmi.ac.in',1,1,'Director');
/*!40000 ALTER TABLE `departmentmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeemaster`
--

DROP TABLE IF EXISTS `employeemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeemaster` (
  `EMP_ID` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `EMP_IM_ID` smallint(3) unsigned NOT NULL,
  `EMP_SIM_ID` mediumint(3) unsigned NOT NULL,
  `EMP_DM_ID` mediumint(5) unsigned NOT NULL,
  `EMP_FName` varchar(20) NOT NULL,
  `EMP_MName` varchar(30) NOT NULL,
  `EMP_LName` varchar(30) NOT NULL,
  `EMP_DESIGNATION_ID` int(10) unsigned DEFAULT NULL,
  `EMP_EMail` varchar(50) DEFAULT NULL,
  `EMP_Mobile` varchar(17) DEFAULT NULL,
  `EMP_LandLine` varchar(17) DEFAULT NULL,
  `EMP_DOB` date DEFAULT NULL,
  `EMP_DOJ` date DEFAULT NULL,
  `EMP_Gender` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`EMP_ID`),
  KEY `FK_EMP_IM_ID_FROM_IM_ID` (`EMP_IM_ID`),
  KEY `FK_EMP_SIM_ID_FROM_IM_ID` (`EMP_SIM_ID`),
  KEY `FK_EMP_DM_ID_FROM_DM_ID` (`EMP_DM_ID`),
  KEY `FK_EMP_DESIGNATION_ID_FROM_gen_master` (`EMP_DESIGNATION_ID`),
  CONSTRAINT `FK_EMP_DM_ID_FROM_DM_ID` FOREIGN KEY (`EMP_DM_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_EMP_IM_ID_FROM_IM_ID` FOREIGN KEY (`EMP_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_EMP_SIM_ID_FROM_IM_ID` FOREIGN KEY (`EMP_SIM_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_EMP_DESIGNATION_ID_FROM_gen_master` FOREIGN KEY (`EMP_DESIGNATION_ID`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeemaster`
--

LOCK TABLES `employeemaster` WRITE;
/*!40000 ALTER TABLE `employeemaster` DISABLE KEYS */;
INSERT INTO `employeemaster` VALUES (1,1,1,1,'Super',' ','Employee',84,'sknaqvi@jmi.ac.in','','',NULL,NULL,'Male');
/*!40000 ALTER TABLE `employeemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_capital_category`
--

DROP TABLE IF EXISTS `erpm_capital_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_capital_category` (
  `ERPMCC_ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '	',
  `ERMCC_Desc` varchar(50) NOT NULL,
  `ERPM_IM_ID` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`ERPMCC_ID`),
  UNIQUE KEY `UNIQUE_ERPMCC_ERPM_IM_ID_ERPMCC_Desc` (`ERPM_IM_ID`,`ERMCC_Desc`),
  CONSTRAINT `FK_ERPM_IM_ID_IM_ID` FOREIGN KEY (`ERPM_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_capital_category`
--

LOCK TABLES `erpm_capital_category` WRITE;
/*!40000 ALTER TABLE `erpm_capital_category` DISABLE KEYS */;
INSERT INTO `erpm_capital_category` VALUES (1,'Building',1),(2,'Equipment',1),(3,'Furniture',1),(4,'Machinery',1);
/*!40000 ALTER TABLE `erpm_capital_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_gen_ctrl`
--

DROP TABLE IF EXISTS `erpm_gen_ctrl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_gen_ctrl` (
  `ERPMGC_GEN_TYPE` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `ERPMGC_GEN_DESC` varchar(50) NOT NULL,
  `ERPMGC_Remarks` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ERPMGC_GEN_TYPE`),
  UNIQUE KEY `ERPMGC_GEN_DESC_UNIQUE` (`ERPMGC_GEN_DESC`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_gen_ctrl`
--

LOCK TABLES `erpm_gen_ctrl` WRITE;
/*!40000 ALTER TABLE `erpm_gen_ctrl` DISABLE KEYS */;
INSERT INTO `erpm_gen_ctrl` VALUES (1,'Company Ownership Type',NULL),(2,'Supplier Category',NULL),(3,'Unit of Measurement',NULL),(4,'Institution Type',NULL),(5,'Sub Institution Type',NULL),(6,'Currency',NULL),(7,'Employee Designation',NULL),(8,'Document Status',NULL),(9,'Warranty Starts From',NULL),(10,'Payment Mode',NULL),(11,'Tax Forms','NULL'),(12,'PO Terms & Conditions',NULL),(13,'Tax','For Storing Tax Names'),(14,'Committee Types',NULL),(15,'Committee Actions',NULL),(16,'WorkFlow Type','Type of Workflow'),(17,'WorkFlow Actions','e.g. Forward, Approve etc.'),(18,'Warranty_Type','e.g. Comprehensive, OnSite etc'),(19,'Designation','Employee Designation'),(20,'Tender Type','e.g. Local, Open, Global'),(21,'Tender Revision Type','e.g. Corrigendum, Extension'),(22,'Tender EMDType','e.g. Bank Guarantee, Demand Draft etc.'),(23,'Tender Schedule Type','e.g. Submission, Technical,  Financial Bid Opening'),(24,'Tender Status','e.g. Floated, Awarded.');
/*!40000 ALTER TABLE `erpm_gen_ctrl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_gen_master`
--

DROP TABLE IF EXISTS `erpm_gen_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_gen_master` (
  `ERPMGM_EGM_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ERPMGM_EGM_TYPE` smallint(5) unsigned NOT NULL,
  `ERPMGM_EGM_DESC` varchar(50) NOT NULL,
  `ERPGM_EGM_REMARKS` varchar(45) DEFAULT NULL,
  `ERPGM_EGM_CHECKS` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ERPMGM_EGM_ID`),
  UNIQUE KEY `UNIQUE_ERPMGM_EGM_DESC_ERPMGM_EGM_TYPE` (`ERPMGM_EGM_DESC`,`ERPMGM_EGM_TYPE`),
  KEY `ERPMGM_EGM_TYPE_ERPMC_GEN_TYPE` (`ERPMGM_EGM_TYPE`),
  CONSTRAINT `FK_ERPMGM_EGM_TYPE_ERPMGC_ERPMGC_ID` FOREIGN KEY (`ERPMGM_EGM_TYPE`) REFERENCES `erpm_gen_ctrl` (`ERPMGC_GEN_TYPE`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_gen_master`
--

LOCK TABLES `erpm_gen_master` WRITE;
/*!40000 ALTER TABLE `erpm_gen_master` DISABLE KEYS */;
INSERT INTO `erpm_gen_master` VALUES (1,1,'Govt. of India Undertakings','',''),(2,1,'State Govt. Undertaking','',''),(3,1,'Ltd Company:Memorandum & Atrticles of Association','',''),(4,1,'Pvt. Company:Memorandum & Atrticles of Association','',''),(5,1,'Cooperative Sopciety:Society Rules and Byelaws','',''),(6,1,'Partnership Firm','',''),(7,1,'Proprietoryship Firm','',''),(8,2,'Manufacturers','',''),(9,2,'Agents/Distributors','',''),(10,2,'Foreign Manufacturer','',''),(11,2,'Stockists','',''),(12,2,'Supplier of imported goods','',''),(13,3,'Pieces','',''),(14,3,'Meters','',''),(15,3,'Licences','',''),(16,3,'Licences+Media','',''),(17,4,'Central University','',''),(18,4,'State University','',''),(19,4,'Deemed University','',''),(20,4,'Indian Institute of Technology','',''),(21,4,'Indian Institute of Management','',''),(22,5,'School','',''),(23,5,'Faculty','',''),(24,5,'Centre','',''),(25,5,'College','',''),(26,5,'Administrative Offices','',''),(27,1,'Others','',''),(28,19,'Reader','',' '),(29,4,'Other Institution','',''),(30,19,'HOD','',' '),(31,8,'Pending','',''),(32,8,'Apporved','',''),(33,8,'Rejected','',''),(34,6,'Dollar','',''),(35,6,'Rupees','',''),(36,6,'Riyal','',''),(37,9,'Date of Delivery','',''),(38,9,'Date of installation','',''),(39,9,'Given Date','',''),(40,10,'Letter of Credit','',''),(41,11,'Form C','',''),(42,10,'Live Wire','',''),(43,11,'Form 31','',''),(44,11,'Form 16','',''),(45,12,'PO Payment Terms','',''),(46,12,'PO Warranty Clause','',''),(47,12,'PO Delivery Terms','',''),(48,12,'PO Testing Terms','',''),(49,13,'Service Tax','',''),(50,13,'VAT','',''),(51,10,'Demand Draft','',''),(52,10,'Cheque','',''),(53,14,'Authority','',''),(54,14,'Committee','',''),(55,15,'Forward','',''),(56,15,'Recommend Approval','',''),(57,15,'Send Back','',''),(58,15,'Recommend Rejection','',''),(59,16,'Indent WorkFlow','',''),(60,16,'Other WorkFlow','',''),(61,18,'Comprehensive Warranty',' ',' '),(62,18,'Limited Warranty',' ',' '),(63,3,'Kg.','',''),(64,3,'Pound','',' '),(65,20,'Limited Tender','',' '),(66,20,'Local Tender','',' '),(67,20,'Global Tender','',' '),(68,20,'Open Tender','',' '),(69,21,'Corrigendum','',' '),(70,21,'Addendum','',' '),(71,22,'Bank Guarantee','',' '),(72,22,'Banker\'s Cheque','',' '),(73,23,'Submission','',' '),(74,23,'Technical Bid Opening','',' '),(75,23,'Financial Bid Opening','',' '),(76,24,'Floated','',' '),(77,24,'In-Process','',' '),(78,24,'Technical Bid Opened','',' '),(79,24,'Financial Bid Opened','',' '),(80,24,'Awarded','',' '),(81,24,'Closed','',' '),(82,24,'Scrapped','',' '),(83,19,'Dean','',' '),(84,19,'Director','',' '),(85,19,'Head Of Department','',' '),(86,19,'Vice-Chancellor','',' '),(87,19,'Registrar','',' '),(88,19,'Assistant Registrar','',' '),(89,19,'Deputy Registrar','',' '),(90,19,'Additional Director','',' '),(91,19,'Senior Project Engineer','',' ');
/*!40000 ALTER TABLE `erpm_gen_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_general_terms`
--

DROP TABLE IF EXISTS `erpm_general_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_general_terms` (
  `GT_GTID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `GT_IM_ID` smallint(5) unsigned NOT NULL,
  `GT_EGM_ID` int(10) unsigned NOT NULL,
  `GT_TERMS_DESCRIPTION` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`GT_GTID`),
  UNIQUE KEY `GT_IMT_ID_UNIQUE` (`GT_IM_ID`,`GT_EGM_ID`),
  KEY `FK_GT_IM` (`GT_IM_ID`),
  KEY `FK_GT_EGM` (`GT_EGM_ID`),
  CONSTRAINT `FK_GT_EGM` FOREIGN KEY (`GT_EGM_ID`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_GT_IM` FOREIGN KEY (`GT_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_general_terms`
--

LOCK TABLES `erpm_general_terms` WRITE;
/*!40000 ALTER TABLE `erpm_general_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_general_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_indent_detail`
--

DROP TABLE IF EXISTS `erpm_indent_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_indent_detail` (
  `indt_Detail_Id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Indt_indt_mst_Indent_Id` smallint(5) unsigned NOT NULL,
  `Indt_Item_Id` int(10) unsigned NOT NULL,
  `Indt_quantity` smallint(5) NOT NULL,
  `indt_Approxcost` decimal(10,2) NOT NULL,
  `Indt_Purpose` varchar(100) DEFAULT NULL,
  `Indt_IR_Item_Rate_Id` int(10) unsigned DEFAULT NULL,
  `Indt_Approved_Quantity` smallint(5) DEFAULT NULL,
  `Indt_Accepted_Unit_Rate` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`indt_Detail_Id`),
  UNIQUE KEY `Indt_indt_mst_Indent_Id` (`Indt_indt_mst_Indent_Id`,`Indt_Item_Id`),
  KEY `fk_INDENTDET_IND_master` (`Indt_indt_mst_Indent_Id`),
  KEY `fk_INDENTDET_erpm_item_master` (`Indt_Item_Id`),
  KEY `FK_Indt_IR_Item_Rate_Id_Item_Rate_Id` (`Indt_IR_Item_Rate_Id`),
  CONSTRAINT `fk_INDENTDET_erpm_item_master` FOREIGN KEY (`Indt_Item_Id`) REFERENCES `erpm_item_master` (`ERPMIM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_INDENTDET_IND_master` FOREIGN KEY (`Indt_indt_mst_Indent_Id`) REFERENCES `erpm_indent_master` (`Indt_Indent_Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_Indt_IR_Item_Rate_Id_Item_Rate_Id` FOREIGN KEY (`Indt_IR_Item_Rate_Id`) REFERENCES `erpm_item_rate` (`IR_Item_Rate_Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_indent_detail`
--

LOCK TABLES `erpm_indent_detail` WRITE;
/*!40000 ALTER TABLE `erpm_indent_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_indent_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_indent_master`
--

DROP TABLE IF EXISTS `erpm_indent_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_indent_master` (
  `Indt_Indent_Id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Indt_Indent_Date` date NOT NULL,
  `Indt_Institution_Id` smallint(5) unsigned NOT NULL,
  `Indt_Subinstitution_Id` mediumint(5) unsigned NOT NULL,
  `Indt_Department_Id` mediumint(5) unsigned NOT NULL,
  `Indt_BudgetHead_Id` smallint(4) unsigned DEFAULT NULL,
  `Indt_Generated_By` varchar(50) DEFAULT NULL,
  `Indt_User_Id` mediumint(9) unsigned NOT NULL,
  `Indt_status` int(10) unsigned DEFAULT NULL,
  `Indt_Currency_Id` int(10) unsigned DEFAULT NULL,
  `Indt_Remarks` varchar(100) DEFAULT NULL,
  `Indt_Forwarded_To_Email` varchar(40) DEFAULT NULL,
  `Indt_DBA_ID` mediumint(5) unsigned DEFAULT NULL,
  `Indt_WFM_ID` int(10) unsigned DEFAULT NULL,
  `Indt_Title` varchar(100) NOT NULL,
  PRIMARY KEY (`Indt_Indent_Id`),
  UNIQUE KEY `UNIQUE_DeptId_Indent_Date_Indent_Title` (`Indt_Department_Id`,`Indt_Indent_Date`,`Indt_Title`),
  KEY `fk_INDENT_Insitution_master` (`Indt_Institution_Id`),
  KEY `fk_INDENT_subInsitution_master` (`Indt_Subinstitution_Id`),
  KEY `fk_INDENT_Department_master` (`Indt_Department_Id`),
  KEY `fk_INDENT_Budget_head_master` (`Indt_BudgetHead_Id`),
  KEY `fk_INDENT_erpmusers` (`Indt_User_Id`),
  KEY `fk_INDENT_Erpm_gen_master` (`Indt_Currency_Id`),
  KEY `FK_Indt_Forwarded_To_User_Id` (`Indt_Forwarded_To_Email`),
  KEY `fk_DBA_ID_Indt_DBA_ID` (`Indt_DBA_ID`),
  KEY `fk_erpm_gen_master_Indt_status` (`Indt_status`),
  KEY `fk_indent_Workflow-ID` (`Indt_WFM_ID`),
  CONSTRAINT `fk_DBA_ID_Indt_DBA_ID` FOREIGN KEY (`Indt_DBA_ID`) REFERENCES `departmental_budget_allocation` (`DBA_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_erpm_gen_master_Indt_status` FOREIGN KEY (`Indt_status`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_INDENT_Budget_head_master` FOREIGN KEY (`Indt_BudgetHead_Id`) REFERENCES `budgetheadmaster` (`BHM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_INDENT_Department_master` FOREIGN KEY (`Indt_Department_Id`) REFERENCES `departmentmaster` (`DM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_INDENT_erpmusers` FOREIGN KEY (`Indt_User_Id`) REFERENCES `erpmusers` (`ERPMU_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_INDENT_Erpm_gen_master` FOREIGN KEY (`Indt_Currency_Id`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_INDENT_Insitution_master` FOREIGN KEY (`Indt_Institution_Id`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_INDENT_subInsitution_master` FOREIGN KEY (`Indt_Subinstitution_Id`) REFERENCES `subinstitutionmaster` (`sim_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_indent_Workflow-ID` FOREIGN KEY (`Indt_WFM_ID`) REFERENCES `workflowmaster` (`WFM_Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_indent_master`
--

LOCK TABLES `erpm_indent_master` WRITE;
/*!40000 ALTER TABLE `erpm_indent_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_indent_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_issue_detail`
--

DROP TABLE IF EXISTS `erpm_issue_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_issue_detail` (
  `ISD_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ISD_ISM_ID` int(10) unsigned NOT NULL,
  `ISD_Item_ID` int(10) unsigned NOT NULL,
  `ISD_Issued_Quantity` decimal(8,2) NOT NULL DEFAULT '0.00',
  `ISD_Received_Quantity` decimal(8,2) NOT NULL DEFAULT '0.00',
  `ISD_Returned_Quantity` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`ISD_ID`),
  KEY `FK_ISD_ISM_ID` (`ISD_ISM_ID`),
  KEY `FK_ISD_Item_ID` (`ISD_Item_ID`),
  CONSTRAINT `FK_ISD_ISM_ID` FOREIGN KEY (`ISD_ISM_ID`) REFERENCES `erpm_issue_master` (`ISM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ISD_Item_ID` FOREIGN KEY (`ISD_Item_ID`) REFERENCES `erpm_item_master` (`ERPMIM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_issue_detail`
--

LOCK TABLES `erpm_issue_detail` WRITE;
/*!40000 ALTER TABLE `erpm_issue_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_issue_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_issue_master`
--

DROP TABLE IF EXISTS `erpm_issue_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_issue_master` (
  `ISM_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ISM_From_Institute_ID` smallint(5) unsigned NOT NULL,
  `ISM_From_Subinstitute_ID` mediumint(5) unsigned NOT NULL,
  `ISM_From_Department_ID` mediumint(5) unsigned NOT NULL,
  `ISM_From_Employee_ID` int(10) unsigned DEFAULT NULL COMMENT 'issueing authority, to be used while printing the issue slip for signing.',
  `ISM_Issue_No` varchar(20) NOT NULL,
  `ISM_Issue_Date` date NOT NULL,
  `ISM_Issue_Desc` varchar(100) DEFAULT NULL,
  `ISM_To_Institute_ID` smallint(5) unsigned NOT NULL,
  `ISM_To_Subinstitute_ID` mediumint(5) unsigned NOT NULL,
  `ISM_To_Department_ID` mediumint(5) unsigned NOT NULL,
  `ISM_To_Employee_ID` int(5) unsigned DEFAULT NULL,
  `ISM_To_Committee_ID` int(11) unsigned DEFAULT NULL,
  `ISM_To_Supplier_ID` int(10) unsigned DEFAULT NULL,
  `ISM_To_Email` varchar(50) DEFAULT NULL,
  `ISM_Against_Indent_ID` smallint(5) unsigned DEFAULT NULL,
  `ISM_Issue_Type` char(1) NOT NULL DEFAULT 'N' COMMENT 'U  -  Issue for Use\nS -   Issue for stock transfer\nR  - Issue for repair/maintenance\nW  -  Issue for write-off',
  `ISM_Return_Due_Date` date DEFAULT NULL,
  `ISM_Remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ISM_ID`),
  KEY `FK_ISM_From_Institute_ID` (`ISM_From_Institute_ID`),
  KEY `FK_ISM_From_Subinstitute_ID` (`ISM_From_Subinstitute_ID`),
  KEY `FK_ISM_From_Department_ID` (`ISM_From_Department_ID`),
  KEY `FK_ISM_To_Institute_ID` (`ISM_To_Institute_ID`),
  KEY `FK_ISM_To_Subinstitute_ID` (`ISM_To_Subinstitute_ID`),
  KEY `FK_ISM_To_Department_ID` (`ISM_To_Department_ID`),
  KEY `FK_ISM_To_Employee_ID` (`ISM_To_Employee_ID`),
  KEY `FK_ISM_Against_Indent_ID` (`ISM_Against_Indent_ID`),
  KEY `FK_ISM_To_Committee_ID` (`ISM_To_Committee_ID`),
  KEY `FK_ISM_To_Supplier_ID` (`ISM_To_Supplier_ID`),
  KEY `FK_ISM_From_Employee_ID` (`ISM_From_Employee_ID`),
  CONSTRAINT `FK_ISM_Against_Indent_ID` FOREIGN KEY (`ISM_Against_Indent_ID`) REFERENCES `erpm_indent_master` (`Indt_Indent_Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ISM_From_Department_ID` FOREIGN KEY (`ISM_From_Department_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ISM_From_Employee_ID` FOREIGN KEY (`ISM_From_Employee_ID`) REFERENCES `employeemaster` (`EMP_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ISM_From_Institute_ID` FOREIGN KEY (`ISM_From_Institute_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ISM_From_Subinstitute_ID` FOREIGN KEY (`ISM_From_Subinstitute_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ISM_To_Committee_ID` FOREIGN KEY (`ISM_To_Committee_ID`) REFERENCES `committeemaster` (`Committee_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ISM_To_Department_ID` FOREIGN KEY (`ISM_To_Department_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ISM_To_Employee_ID` FOREIGN KEY (`ISM_To_Employee_ID`) REFERENCES `employeemaster` (`EMP_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ISM_To_Institute_ID` FOREIGN KEY (`ISM_To_Institute_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ISM_To_Subinstitute_ID` FOREIGN KEY (`ISM_To_Subinstitute_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ISM_To_Supplier_ID` FOREIGN KEY (`ISM_To_Supplier_ID`) REFERENCES `suppliermaster` (`SM_Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_issue_master`
--

LOCK TABLES `erpm_issue_master` WRITE;
/*!40000 ALTER TABLE `erpm_issue_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_issue_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_issue_receive`
--

DROP TABLE IF EXISTS `erpm_issue_receive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_issue_receive` (
  `ISR_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ISR_Institute_ID` smallint(5) unsigned NOT NULL,
  `ISR_Subinstitute_ID` mediumint(5) unsigned NOT NULL,
  `ISR_Department_ID` mediumint(5) unsigned NOT NULL,
  `ISR_Receipt_No` varchar(20) NOT NULL,
  `ISR_Receipt_Date` date NOT NULL,
  `ISR_To_Employee_ID` int(5) unsigned DEFAULT NULL,
  `ISR_To_Committee_ID` int(11) unsigned DEFAULT NULL,
  `ISR_ISM_ID` int(10) unsigned NOT NULL,
  `ISR_Remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ISR_ID`),
  KEY `FK_ISR_Institute_ID` (`ISR_Institute_ID`),
  KEY `FK_ISR_Subinstitute_ID` (`ISR_Subinstitute_ID`),
  KEY `FK_ISR_Department_ID` (`ISR_Department_ID`),
  KEY `FK_ISR_To_Employee_ID` (`ISR_To_Employee_ID`),
  KEY `FK_ISR_To_Committee_ID` (`ISR_To_Committee_ID`),
  KEY `FK_ISR_ISM_ID` (`ISR_ISM_ID`),
  CONSTRAINT `FK_ISR_Department_ID` FOREIGN KEY (`ISR_Department_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ISR_Institute_ID` FOREIGN KEY (`ISR_Institute_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ISR_ISM_ID` FOREIGN KEY (`ISR_ISM_ID`) REFERENCES `erpm_issue_master` (`ISM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ISR_Subinstitute_ID` FOREIGN KEY (`ISR_Subinstitute_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ISR_To_Committee_ID` FOREIGN KEY (`ISR_To_Committee_ID`) REFERENCES `committeemaster` (`Committee_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ISR_To_Employee_ID` FOREIGN KEY (`ISR_To_Employee_ID`) REFERENCES `employeemaster` (`EMP_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_issue_receive`
--

LOCK TABLES `erpm_issue_receive` WRITE;
/*!40000 ALTER TABLE `erpm_issue_receive` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_issue_receive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_issue_return_detail`
--

DROP TABLE IF EXISTS `erpm_issue_return_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_issue_return_detail` (
  `IRMD_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IRMD_IRM_ID` int(10) unsigned NOT NULL,
  `IRMD_Stock_ID` int(10) unsigned DEFAULT NULL,
  `IRMD_ISM_ID` int(10) unsigned NOT NULL,
  `IRMD_Item_ID` int(10) unsigned NOT NULL,
  `IRMD_Return_Quantity` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`IRMD_ID`),
  KEY `FK_IRMD_IRM_ID` (`IRMD_IRM_ID`),
  KEY `FK_IRMD_Item_ID` (`IRMD_Item_ID`),
  KEY `FK_IRMD_Stock_ID` (`IRMD_Stock_ID`),
  KEY `FK_IRMD_ISM_ID` (`IRMD_ISM_ID`),
  CONSTRAINT `FK_IRMD_IRM_ID` FOREIGN KEY (`IRMD_IRM_ID`) REFERENCES `erpm_issue_return_master` (`IRM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_IRMD_ISM_ID` FOREIGN KEY (`IRMD_ISM_ID`) REFERENCES `erpm_issue_master` (`ISM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_IRMD_Item_ID` FOREIGN KEY (`IRMD_Item_ID`) REFERENCES `erpm_item_master` (`ERPMIM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_IRMD_Stock_ID` FOREIGN KEY (`IRMD_Stock_ID`) REFERENCES `erpm_stock_received` (`ST_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_issue_return_detail`
--

LOCK TABLES `erpm_issue_return_detail` WRITE;
/*!40000 ALTER TABLE `erpm_issue_return_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_issue_return_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_issue_return_master`
--

DROP TABLE IF EXISTS `erpm_issue_return_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_issue_return_master` (
  `IRM_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IRM_Institute_ID` smallint(5) unsigned NOT NULL,
  `IRM_Subinstitute_ID` mediumint(5) unsigned NOT NULL,
  `IRM_Department_ID` mediumint(5) unsigned NOT NULL,
  `IRM_Return_No` varchar(20) NOT NULL,
  `IRM_Return_Date` date NOT NULL,
  `IRM_ReturnTo_Employee_ID` int(10) unsigned NOT NULL COMMENT 'To be used as a signing authority while printing return slip',
  `IRM_Return_Type` char(1) NOT NULL DEFAULT 'U' COMMENT 'U - Return after Use\nR - Return after repair',
  `IRM_Remarks` varchar(200) DEFAULT NULL,
  `IRM_Return_Mode` bit(1) NOT NULL DEFAULT '\0',
  PRIMARY KEY (`IRM_ID`),
  KEY `FK_IRM_Institute_ID` (`IRM_Institute_ID`),
  KEY `FK_IRM_Subinstitute_ID` (`IRM_Subinstitute_ID`),
  KEY `FK_IRM_Department_ID` (`IRM_Department_ID`),
  KEY `FK_IRM_ReturnTo_Employee_ID` (`IRM_ReturnTo_Employee_ID`),
  CONSTRAINT `FK_IRM_Department_ID` FOREIGN KEY (`IRM_Department_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_IRM_Institute_ID` FOREIGN KEY (`IRM_Institute_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_IRM_ReturnTo_Employee_ID` FOREIGN KEY (`IRM_ReturnTo_Employee_ID`) REFERENCES `employeemaster` (`EMP_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_IRM_Subinstitute_ID` FOREIGN KEY (`IRM_Subinstitute_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_issue_return_master`
--

LOCK TABLES `erpm_issue_return_master` WRITE;
/*!40000 ALTER TABLE `erpm_issue_return_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_issue_return_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_issue_serial_detail`
--

DROP TABLE IF EXISTS `erpm_issue_serial_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_issue_serial_detail` (
  `ISSD_ID` int(10) NOT NULL AUTO_INCREMENT,
  `ISSD_ISD_ID` int(10) unsigned NOT NULL,
  `ISSD_Stock_Serial_ID` int(10) unsigned NOT NULL,
  `ISSD_Received` tinyint(1) NOT NULL DEFAULT '0',
  `ISSD_Returned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ISSD_ID`),
  KEY `FK_ISSD_ISD_ID` (`ISSD_ISD_ID`),
  KEY `FK_ISSD_Stock_Serial_ID` (`ISSD_Stock_Serial_ID`),
  CONSTRAINT `FK_ISSD_ISD_ID` FOREIGN KEY (`ISSD_ISD_ID`) REFERENCES `erpm_issue_detail` (`ISD_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ISSD_Stock_Serial_ID` FOREIGN KEY (`ISSD_Stock_Serial_ID`) REFERENCES `erpm_stock_received` (`ST_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_issue_serial_detail`
--

LOCK TABLES `erpm_issue_serial_detail` WRITE;
/*!40000 ALTER TABLE `erpm_issue_serial_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_issue_serial_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_item_category_master`
--

DROP TABLE IF EXISTS `erpm_item_category_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_item_category_master` (
  `ERPMICM_Item_ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '		',
  `ERPMICM_Item_Level` smallint(6) NOT NULL COMMENT '						',
  `ERPMICM_Parent_Item_ID` int(11) unsigned DEFAULT NULL,
  `ERPMICM_Cat_Desc` varchar(50) NOT NULL,
  `ERPMICM_IM_ID` smallint(5) unsigned DEFAULT NULL,
  `ERPMICM_Depreciation_Method` char(1) DEFAULT 'S',
  `ERPMICM_Depreciation_Percentage` int(3) DEFAULT '0',
  PRIMARY KEY (`ERPMICM_Item_ID`),
  UNIQUE KEY `UNIQUE_ERPMICM_Desc_ERPMICM_IM_ID` (`ERPMICM_Cat_Desc`,`ERPMICM_IM_ID`),
  KEY `ERPMICM_Parent_Item_ID_ERPMICM_Item_ID` (`ERPMICM_Parent_Item_ID`),
  KEY `FK_ERPMICM_IM_ID_Institution_Master_IM_ID` (`ERPMICM_IM_ID`),
  CONSTRAINT `ERPMICM_Parent_Item_ID_ERPMICM_Item_ID` FOREIGN KEY (`ERPMICM_Parent_Item_ID`) REFERENCES `erpm_item_category_master` (`ERPMICM_Item_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ERPMICM_IM_ID_Institution_Master_IM_ID` FOREIGN KEY (`ERPMICM_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_item_category_master`
--

LOCK TABLES `erpm_item_category_master` WRITE;
/*!40000 ALTER TABLE `erpm_item_category_master` DISABLE KEYS */;
INSERT INTO `erpm_item_category_master` VALUES (1,1,NULL,'Non-Consumable',1,'S',0),(2,1,NULL,'Consumable',1,'S',0),(3,1,NULL,'Services',1,'S',0);
/*!40000 ALTER TABLE `erpm_item_category_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_item_master`
--

DROP TABLE IF EXISTS `erpm_item_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_item_master` (
  `ERPMIM_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ERPMIM_IM_ID` smallint(5) unsigned DEFAULT NULL COMMENT 'This field stores Institution for which Item has been created',
  `ERPMIM_Item_Brief_Desc` varchar(500) NOT NULL,
  `ERPMIM_Item_Cat1` int(11) unsigned NOT NULL,
  `ERPMIM_Item_Cat2` int(11) unsigned NOT NULL,
  `ERPMIM_Item_Cat3` int(11) unsigned NOT NULL,
  `ERPMIM_UOP` int(10) unsigned NOT NULL,
  `ERPMIM_Make` varchar(20) DEFAULT NULL,
  `ERPMIM_Model` varchar(20) DEFAULT NULL,
  `ERPMIM_Capital_Cat` int(10) unsigned DEFAULT NULL,
  `ERPMIM_Detailed_Desc` varchar(2000) NOT NULL,
  `ERPMIM_Remarks` varchar(100) DEFAULT NULL,
  `ERPMIM_Issue_Policy` varchar(15) NOT NULL,
  `ERPMIM_Serial_No_Applicable` char(1) NOT NULL DEFAULT 'N',
  `ERPMIM_Depreciation_Method` char(1) DEFAULT NULL,
  `ERPMIM_Depreciation_Percentage` int(3) DEFAULT '0',
  `ERPMIM_Residual_Value` int(10) DEFAULT '0',
  PRIMARY KEY (`ERPMIM_ID`),
  KEY `FK_ERPMIM_Item_Cat2_ERPMICM_Item_Id` (`ERPMIM_Item_Cat2`),
  KEY `FK_ERPMIM_Item_Cat1_ERPMICM_Item_Id` (`ERPMIM_Item_Cat1`),
  KEY `FK_ERPMIM_IM_ID_IM_ID` (`ERPMIM_IM_ID`),
  KEY `FK_ERPMIM_Capital_Cat_ERPMCC_ID` (`ERPMIM_Capital_Cat`),
  KEY `FK_ERPMIM_Item_Cat3_ERPMICM_Item_Id` (`ERPMIM_Item_Cat3`),
  KEY `FK_ERPMIM_Item_UOP_ERPMGM_EGM_ID` (`ERPMIM_UOP`),
  CONSTRAINT `FK_ERPMIM_Capital_Cat_ERPMCC_ID` FOREIGN KEY (`ERPMIM_Capital_Cat`) REFERENCES `erpm_capital_category` (`ERPMCC_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ERPMIM_IM_ID_IM_ID` FOREIGN KEY (`ERPMIM_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ERPMIM_Item_Cat1_ERPMICM_Item_Id` FOREIGN KEY (`ERPMIM_Item_Cat1`) REFERENCES `erpm_item_category_master` (`ERPMICM_Item_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ERPMIM_Item_Cat2_ERPMICM_Item_Id` FOREIGN KEY (`ERPMIM_Item_Cat2`) REFERENCES `erpm_item_category_master` (`ERPMICM_Item_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ERPMIM_Item_Cat3_ERPMICM_Item_Id` FOREIGN KEY (`ERPMIM_Item_Cat3`) REFERENCES `erpm_item_category_master` (`ERPMICM_Item_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ERPMIM_Item_UOP_ERPMGM_EGM_ID` FOREIGN KEY (`ERPMIM_UOP`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_item_master`
--

LOCK TABLES `erpm_item_master` WRITE;
/*!40000 ALTER TABLE `erpm_item_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_item_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_item_rate`
--

DROP TABLE IF EXISTS `erpm_item_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_item_rate` (
  `IR_Item_Rate_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IR_IM_ID` smallint(5) unsigned NOT NULL,
  `IR_Supplier_ID` int(10) unsigned NOT NULL,
  `IR_Item_ID` int(10) unsigned NOT NULL,
  `IR_Currency_ID` int(10) unsigned NOT NULL,
  `IR_Warranty_Months` int(3) unsigned DEFAULT NULL,
  `IR_Warranty_Starts_From_ID` int(10) unsigned DEFAULT NULL,
  `IR_Warranty_Clause` varchar(100) DEFAULT NULL,
  `IRD_WEF_Date` date NOT NULL,
  `IRD_WET_Date` date NOT NULL,
  `IRD_Rate` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `IR_Min_Qty` int(11) DEFAULT NULL,
  `IR_Max_Qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`IR_Item_Rate_Id`),
  UNIQUE KEY `UNIQUE_ITEM_ID_AND_VALIDITY_PERIOD` (`IR_Item_ID`,`IR_Supplier_ID`,`IRD_WEF_Date`,`IRD_WET_Date`),
  KEY `FK_IR_IM_ID` (`IR_IM_ID`),
  KEY `FK_IR_Supplier_ID` (`IR_Supplier_ID`),
  KEY `FK_IR_Item_ID` (`IR_Item_ID`),
  KEY `FK_IR_Currency_ID` (`IR_Currency_ID`),
  KEY `FK_IR_WarrantyStartsfrom_ID` (`IR_Warranty_Starts_From_ID`),
  CONSTRAINT `FK_Institution_ImID` FOREIGN KEY (`IR_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_IR_Currency_ID_GeneralMaster` FOREIGN KEY (`IR_Currency_ID`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_IR_Item_ID_ERPM_Item_Master` FOREIGN KEY (`IR_Item_ID`) REFERENCES `erpm_item_master` (`ERPMIM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_IR_WarrantyStartsfrom_ID` FOREIGN KEY (`IR_Warranty_Starts_From_ID`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Supplier_ID` FOREIGN KEY (`IR_Supplier_ID`) REFERENCES `suppliermaster` (`SM_Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_item_rate`
--

LOCK TABLES `erpm_item_rate` WRITE;
/*!40000 ALTER TABLE `erpm_item_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_item_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_item_rate_taxes`
--

DROP TABLE IF EXISTS `erpm_item_rate_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_item_rate_taxes` (
  `IRT_Item_Rate_Taxes_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IRT_Item_Rate_ID` int(10) unsigned NOT NULL,
  `IRT_Tax_Name_ID` int(10) unsigned NOT NULL,
  `IRT_Tax_Percent` decimal(5,2) DEFAULT '0.00',
  `IRT_Tax_on_Value_Percent` decimal(5,2) DEFAULT '0.00',
  `IRT_Surcharge_Percent` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`IRT_Item_Rate_Taxes_Id`),
  KEY `FK_IRT_Item_Rate_Id` (`IRT_Item_Rate_ID`),
  KEY `FK_IRT_Item_Rate_Details` (`IRT_Item_Rate_ID`),
  KEY `FK_IRT_Tax_Name_ERPMGM_EGM_ID` (`IRT_Tax_Name_ID`),
  CONSTRAINT `FK_Erpm_Item_Rate` FOREIGN KEY (`IRT_Item_Rate_ID`) REFERENCES `erpm_item_rate` (`IR_Item_Rate_Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_IRT_Tax_Name_ERPMGM_EGM_ID` FOREIGN KEY (`IRT_Tax_Name_ID`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_item_rate_taxes`
--

LOCK TABLES `erpm_item_rate_taxes` WRITE;
/*!40000 ALTER TABLE `erpm_item_rate_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_item_rate_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_news`
--

DROP TABLE IF EXISTS `erpm_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_news` (
  `News_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `News_Type` varchar(30) NOT NULL,
  `News_Text` varchar(200) NOT NULL,
  `News_Publish_Date` date NOT NULL,
  `News_Expiry_Date` date NOT NULL,
  `User_ID` mediumint(9) unsigned NOT NULL,
  PRIMARY KEY (`News_Id`),
  KEY `PK_User_ID` (`User_ID`),
  CONSTRAINT `PK_User_ID` FOREIGN KEY (`User_ID`) REFERENCES `erpmusers` (`ERPMU_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_news`
--

LOCK TABLES `erpm_news` WRITE;
/*!40000 ALTER TABLE `erpm_news` DISABLE KEYS */;
INSERT INTO `erpm_news` VALUES (1,'Guest Logon Information','You can Log on into the system by User Name guest and Password guest','2012-04-01','2020-03-31',1);
/*!40000 ALTER TABLE `erpm_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_po_details`
--

DROP TABLE IF EXISTS `erpm_po_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_po_details` (
  `POD_PODetails_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `POD_POMaster_ID` int(10) unsigned NOT NULL,
  `POD_Item_ID` int(10) unsigned NOT NULL,
  `POD_Quantity` decimal(8,2) unsigned DEFAULT NULL,
  `POD_Discount` decimal(4,2) DEFAULT NULL,
  `POD_Warranty_Terms` varchar(200) DEFAULT NULL,
  `POD_Schedule` enum('0','1') DEFAULT NULL,
  `POD_RATE` decimal(10,2) unsigned DEFAULT NULL,
  `POD_INDTL_ID` smallint(5) unsigned DEFAULT NULL,
  `POD_Item_Rate_ID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`POD_PODetails_ID`),
  UNIQUE KEY `POD_POID_ITEM_UNIQUE` (`POD_POMaster_ID`,`POD_Item_ID`),
  KEY `FK_POD_Item` (`POD_Item_ID`),
  KEY `FK_POD_POMaster` (`POD_POMaster_ID`),
  KEY `FK_PO_Item_Rate_Id_Item_Rate_Id` (`POD_RATE`),
  KEY `FK_POD_INDTL_Id_Indent_Dtl_Id` (`POD_INDTL_ID`),
  KEY `FK_POD_Item_Rate_ID` (`POD_Item_Rate_ID`),
  CONSTRAINT `FK_POD_INDTL_Id_Indent_Dtl_Id` FOREIGN KEY (`POD_INDTL_ID`) REFERENCES `erpm_indent_detail` (`indt_Detail_Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_POD_Item` FOREIGN KEY (`POD_Item_ID`) REFERENCES `erpm_item_master` (`ERPMIM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_POD_Item_Rate_ID` FOREIGN KEY (`POD_Item_Rate_ID`) REFERENCES `erpm_item_rate` (`IR_Item_Rate_Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_POD_POMaster` FOREIGN KEY (`POD_POMaster_ID`) REFERENCES `erpm_po_master` (`POM_PO_Master_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_po_details`
--

LOCK TABLES `erpm_po_details` WRITE;
/*!40000 ALTER TABLE `erpm_po_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_po_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_po_locations`
--

DROP TABLE IF EXISTS `erpm_po_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_po_locations` (
  `po_locations_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `POM_PO_Master_ID` int(10) unsigned NOT NULL,
  `QTY` int(11) NOT NULL,
  `Location` varchar(50) DEFAULT NULL,
  `DEPT` mediumint(5) unsigned DEFAULT NULL,
  `Item_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`po_locations_id`),
  KEY `FK_PO_ID` (`POM_PO_Master_ID`),
  KEY `FK_DEPT_MST` (`DEPT`),
  KEY `FK_Item_ID` (`Item_ID`),
  CONSTRAINT `FK_DEPT_MST` FOREIGN KEY (`DEPT`) REFERENCES `departmentmaster` (`DM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Item_ID` FOREIGN KEY (`Item_ID`) REFERENCES `erpm_item_master` (`ERPMIM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PO_ID` FOREIGN KEY (`POM_PO_Master_ID`) REFERENCES `erpm_po_master` (`POM_PO_Master_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_po_locations`
--

LOCK TABLES `erpm_po_locations` WRITE;
/*!40000 ALTER TABLE `erpm_po_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_po_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_po_master`
--

DROP TABLE IF EXISTS `erpm_po_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_po_master` (
  `POM_PO_Master_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `POM_IM_ID` smallint(5) unsigned NOT NULL,
  `POM_SIM_ID` mediumint(5) unsigned NOT NULL,
  `POM_DM_ID` mediumint(5) unsigned NOT NULL,
  `POM_PO_No` int(10) unsigned DEFAULT NULL,
  `POM_PO_Date` date NOT NULL,
  `POM_Purchase_Mode` varchar(10) DEFAULT NULL,
  `POM_Payment_Mode_ID` int(10) unsigned NOT NULL,
  `POM_Supplier_ID` int(10) unsigned NOT NULL,
  `POM_Supplier_Address_ID` int(10) unsigned DEFAULT NULL,
  `POM_Form_ID` int(10) unsigned DEFAULT NULL,
  `POM_Form_No` varchar(20) DEFAULT NULL,
  `POM_Terms_Days` int(11) DEFAULT NULL,
  `POM_Delivery_Date` date DEFAULT NULL,
  `POM_Remarks` varchar(200) DEFAULT NULL,
  `POM_Discount` decimal(4,2) DEFAULT '0.00',
  `POM_Currency_ID` int(10) unsigned NOT NULL,
  `POM_Approved_By_ID` mediumint(9) unsigned DEFAULT '0',
  `POM_Approved_By_Designation` varchar(30) DEFAULT NULL,
  `POM_Against_Reference_ID` int(10) unsigned DEFAULT NULL,
  `POM_User_ID` mediumint(9) unsigned DEFAULT NULL,
  `POM_Accomplished` char(3) DEFAULT 'NO',
  `POM_Cancelled` char(3) DEFAULT 'NO',
  `POM_Purchase_Purpose` varchar(50) DEFAULT NULL,
  `erpm_po_mastercol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`POM_PO_Master_ID`),
  KEY `FK_POM_Approved_By` (`POM_User_ID`),
  KEY `FK_POM_Currency` (`POM_Currency_ID`),
  KEY `FK_POM_DM` (`POM_DM_ID`),
  KEY `FK_POM_Form` (`POM_Form_ID`),
  KEY `FK_POM_IM` (`POM_IM_ID`),
  KEY `FK_POM_Payment_Mode` (`POM_Payment_Mode_ID`),
  KEY `FK_POM_Supplier` (`POM_Supplier_ID`),
  KEY `FK_POM_User` (`POM_User_ID`),
  KEY `FK_POM_SIM` (`POM_SIM_ID`),
  KEY `FK_POM_Approved` (`POM_Approved_By_ID`),
  KEY `FK_POM_Supplier_Address` (`POM_Supplier_Address_ID`),
  CONSTRAINT `FK_POM_Approved` FOREIGN KEY (`POM_Approved_By_ID`) REFERENCES `erpmusers` (`ERPMU_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_POM_Currency` FOREIGN KEY (`POM_Currency_ID`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_POM_DM` FOREIGN KEY (`POM_DM_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_POM_Form` FOREIGN KEY (`POM_Form_ID`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_POM_IM` FOREIGN KEY (`POM_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_POM_Payment_Mode` FOREIGN KEY (`POM_Payment_Mode_ID`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_POM_SIM` FOREIGN KEY (`POM_SIM_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_POM_Supplier` FOREIGN KEY (`POM_Supplier_ID`) REFERENCES `suppliermaster` (`SM_Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_POM_Supplier_Address` FOREIGN KEY (`POM_Supplier_Address_ID`) REFERENCES `supplier_address` (`sup_ad_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_POM_User` FOREIGN KEY (`POM_User_ID`) REFERENCES `erpmusers` (`ERPMU_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_po_master`
--

LOCK TABLES `erpm_po_master` WRITE;
/*!40000 ALTER TABLE `erpm_po_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_po_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_po_taxes`
--

DROP TABLE IF EXISTS `erpm_po_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_po_taxes` (
  `POT_PO_Taxes_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `POT_PODetail_ID` int(10) unsigned NOT NULL,
  `POT_Tax_Name` varchar(30) DEFAULT NULL,
  `POT_Tax_Percent` decimal(5,2) DEFAULT '0.00',
  `POT_Tax_on_Value_Percent` decimal(5,2) DEFAULT '0.00',
  `POT_Surcharge_Percent` decimal(4,2) DEFAULT '0.00',
  PRIMARY KEY (`POT_PO_Taxes_ID`),
  KEY `FK_POT_PODetail` (`POT_PODetail_ID`),
  CONSTRAINT `FK_POT_PODetail` FOREIGN KEY (`POT_PODetail_ID`) REFERENCES `erpm_po_details` (`POD_PODetails_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_po_taxes`
--

LOCK TABLES `erpm_po_taxes` WRITE;
/*!40000 ALTER TABLE `erpm_po_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_po_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_po_terms`
--

DROP TABLE IF EXISTS `erpm_po_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_po_terms` (
  `POT_POT_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `POT_POM_ID` int(10) unsigned NOT NULL,
  `POT_EGM_ID` int(10) unsigned NOT NULL,
  `POT_TERMS_DESCRIPTION` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`POT_POT_ID`),
  UNIQUE KEY `POT_POM_ID_UNIQUE` (`POT_POM_ID`,`POT_EGM_ID`),
  KEY `FK_POT_PO` (`POT_POM_ID`),
  KEY `FK_POT_EGM` (`POT_EGM_ID`),
  CONSTRAINT `FK_POT_EGM` FOREIGN KEY (`POT_EGM_ID`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_POT_PO` FOREIGN KEY (`POT_POM_ID`) REFERENCES `erpm_po_master` (`POM_PO_Master_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_po_terms`
--

LOCK TABLES `erpm_po_terms` WRITE;
/*!40000 ALTER TABLE `erpm_po_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_po_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_purchasechallan_detail`
--

DROP TABLE IF EXISTS `erpm_purchasechallan_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_purchasechallan_detail` (
  `PCD_PCD_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PCD_PCMaster_ID` int(11) unsigned NOT NULL,
  `PCD_ItemMaster_ID` int(10) unsigned DEFAULT NULL,
  `PCD_Recv_Quantity` decimal(8,2) unsigned DEFAULT '0.00',
  `PCD_Q_n_Q_Checked` char(1) NOT NULL DEFAULT 'N',
  `PCD_Q_n_Q_Verified` char(1) NOT NULL DEFAULT 'N',
  `PCD_Verified_By` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PCD_PCD_ID`),
  UNIQUE KEY `PCD_PCMID_ITEMID_UNIQUE` (`PCD_PCMaster_ID`,`PCD_ItemMaster_ID`),
  KEY `FK_PCD_PCMaster_ID` (`PCD_PCMaster_ID`),
  KEY `FK_PCD_ItemMaster_ID` (`PCD_ItemMaster_ID`),
  CONSTRAINT `FK_PCD_ItemMaster_ID` FOREIGN KEY (`PCD_ItemMaster_ID`) REFERENCES `erpm_item_master` (`ERPMIM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PCD_PCMaster_ID` FOREIGN KEY (`PCD_PCMaster_ID`) REFERENCES `erpm_purchasechallan_master` (`PCM_PCM_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_purchasechallan_detail`
--

LOCK TABLES `erpm_purchasechallan_detail` WRITE;
/*!40000 ALTER TABLE `erpm_purchasechallan_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_purchasechallan_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_purchasechallan_master`
--

DROP TABLE IF EXISTS `erpm_purchasechallan_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_purchasechallan_master` (
  `PCM_PCM_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PCM_IM_ID` smallint(5) unsigned NOT NULL,
  `PCM_SIM_ID` mediumint(5) unsigned NOT NULL,
  `PCM_DM_ID` mediumint(5) unsigned NOT NULL,
  `PCM_Recv_Date` date DEFAULT NULL,
  `PCM_Challan_No` varchar(20) DEFAULT NULL,
  `PCM_Challan_Date` date DEFAULT NULL,
  `PCM_PO_Master_ID` int(10) unsigned NOT NULL,
  `PCM_ImportExchange_Rate` decimal(5,2) DEFAULT NULL,
  `PCM_Remarks` varchar(500) DEFAULT NULL,
  `PCM_BillMaster_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `PCM_PreparedBy_ID` mediumint(9) unsigned DEFAULT NULL,
  `PCM_Checked_By` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PCM_PCM_ID`),
  UNIQUE KEY `PCM_ID_SIM_DM_PO_CHNO_UNIQUE` (`PCM_IM_ID`,`PCM_SIM_ID`,`PCM_DM_ID`,`PCM_Challan_No`,`PCM_PO_Master_ID`),
  KEY `FK_PCM_IM_ID` (`PCM_IM_ID`),
  KEY `FK_PCM_SIM_ID` (`PCM_SIM_ID`),
  KEY `FK_PCM_DM_ID` (`PCM_DM_ID`),
  KEY `FK_PCM_PO_Master_ID` (`PCM_PO_Master_ID`),
  KEY `FK_PCM_PreparedBy_ID` (`PCM_PreparedBy_ID`),
  CONSTRAINT `FK_PCM_DM_ID` FOREIGN KEY (`PCM_DM_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PCM_IM_ID` FOREIGN KEY (`PCM_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PCM_PO_Master_ID` FOREIGN KEY (`PCM_PO_Master_ID`) REFERENCES `erpm_po_master` (`POM_PO_Master_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PCM_PreparedBy_ID` FOREIGN KEY (`PCM_PreparedBy_ID`) REFERENCES `erpmusers` (`ERPMU_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PCM_SIM_ID` FOREIGN KEY (`PCM_SIM_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_purchasechallan_master`
--

LOCK TABLES `erpm_purchasechallan_master` WRITE;
/*!40000 ALTER TABLE `erpm_purchasechallan_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_purchasechallan_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_purchasechallan_serial`
--

DROP TABLE IF EXISTS `erpm_purchasechallan_serial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_purchasechallan_serial` (
  `PCS_PCS_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PCS_PCDetail_ID` int(10) unsigned NOT NULL,
  `PCS_Equipment_Serial_No` varchar(50) DEFAULT NULL,
  `PCS_Stock_Serial_No` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PCS_PCS_ID`),
  UNIQUE KEY `PCS_PCDID_EQSL_UNIQUE` (`PCS_PCDetail_ID`,`PCS_Equipment_Serial_No`),
  KEY `FK_PCS_PCDetail_ID` (`PCS_PCDetail_ID`),
  CONSTRAINT `FK_PCS_PCDetail_ID` FOREIGN KEY (`PCS_PCDetail_ID`) REFERENCES `erpm_purchasechallan_detail` (`PCD_PCD_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_purchasechallan_serial`
--

LOCK TABLES `erpm_purchasechallan_serial` WRITE;
/*!40000 ALTER TABLE `erpm_purchasechallan_serial` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_purchasechallan_serial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_purchaseinvoice_detail`
--

DROP TABLE IF EXISTS `erpm_purchaseinvoice_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_purchaseinvoice_detail` (
  `PID_PID_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PID_PIM_ID` int(10) unsigned NOT NULL,
  `PID_Item_ID` int(10) unsigned NOT NULL,
  `PID_Quantity` decimal(8,2) unsigned DEFAULT NULL,
  `PID_Discount` decimal(4,2) DEFAULT NULL,
  `PID_Rate` decimal(10,2) unsigned DEFAULT NULL,
  `PCD_Q_n_Q_Checked` char(1) NOT NULL DEFAULT 'N',
  `PCD_Q_n_Q_Verified` char(1) NOT NULL DEFAULT 'N',
  `PCD_Verified_By` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PID_PID_ID`),
  UNIQUE KEY `PID_PIMID_ITEMID_UNIQUE` (`PID_PIM_ID`,`PID_Item_ID`),
  KEY `FK_PID_PIM_ID` (`PID_PIM_ID`),
  KEY `FK_PID_Item_ID` (`PID_Item_ID`),
  CONSTRAINT `FK_PID_Item_ID` FOREIGN KEY (`PID_Item_ID`) REFERENCES `erpm_item_master` (`ERPMIM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_PID_PIM_ID` FOREIGN KEY (`PID_PIM_ID`) REFERENCES `erpm_purchaseinvoice_master` (`PIM_PIM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_purchaseinvoice_detail`
--

LOCK TABLES `erpm_purchaseinvoice_detail` WRITE;
/*!40000 ALTER TABLE `erpm_purchaseinvoice_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_purchaseinvoice_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_purchaseinvoice_master`
--

DROP TABLE IF EXISTS `erpm_purchaseinvoice_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_purchaseinvoice_master` (
  `PIM_PIM_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PIM_IM_ID` smallint(5) unsigned NOT NULL,
  `PIM_SIM_ID` mediumint(5) unsigned NOT NULL,
  `PIM_DM_ID` mediumint(5) unsigned NOT NULL,
  `PIM_Invoice_Type` varchar(20) DEFAULT NULL,
  `PIM_Supplier_ID` int(10) unsigned DEFAULT NULL,
  `PIM_InvoiceRecvd_Date` date NOT NULL,
  `PIM_Supplier_Invoice_No` varchar(20) NOT NULL,
  `PIM_Supplier_Invoice_Date` date NOT NULL,
  `PIM_ImportExchange_Rate` decimal(5,2) DEFAULT NULL,
  `PIM_Remarks` varchar(500) DEFAULT NULL,
  `PIM_PreparedBy_ID` mediumint(9) unsigned DEFAULT NULL,
  `PIM_Checked_By` varchar(50) DEFAULT NULL,
  `PIM_PO_Master_ID` int(10) unsigned DEFAULT NULL,
  `PIM_PChallan_Master_ID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`PIM_PIM_ID`),
  KEY `FK_PIM_IM_ID` (`PIM_IM_ID`),
  KEY `FK_PIM_SIM_ID` (`PIM_SIM_ID`),
  KEY `FK_PIM_DM_ID` (`PIM_DM_ID`),
  KEY `FK_PIM_PreparedBy_ID` (`PIM_PreparedBy_ID`),
  KEY `FK_PIM_Supplier_ID` (`PIM_Supplier_ID`),
  KEY `FK_PIM_PO_Master_ID` (`PIM_PO_Master_ID`),
  KEY `FK_PIM_PChallan_Master_ID` (`PIM_PChallan_Master_ID`),
  CONSTRAINT `FK_PIM_DM_ID` FOREIGN KEY (`PIM_DM_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_PIM_IM_ID` FOREIGN KEY (`PIM_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_PIM_PChallan_Master_ID` FOREIGN KEY (`PIM_PChallan_Master_ID`) REFERENCES `erpm_purchasechallan_master` (`PCM_PCM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_PIM_PO_Master_ID` FOREIGN KEY (`PIM_PO_Master_ID`) REFERENCES `erpm_po_master` (`POM_PO_Master_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_PIM_PreparedBy_ID` FOREIGN KEY (`PIM_PreparedBy_ID`) REFERENCES `erpmusers` (`ERPMU_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_PIM_SIM_ID` FOREIGN KEY (`PIM_SIM_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_PIM_Supplier_ID` FOREIGN KEY (`PIM_Supplier_ID`) REFERENCES `suppliermaster` (`SM_Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_purchaseinvoice_master`
--

LOCK TABLES `erpm_purchaseinvoice_master` WRITE;
/*!40000 ALTER TABLE `erpm_purchaseinvoice_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_purchaseinvoice_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_purchaseinvoice_taxes`
--

DROP TABLE IF EXISTS `erpm_purchaseinvoice_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_purchaseinvoice_taxes` (
  `PIT_PI_Taxes_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PIT_PID_ID` int(10) unsigned NOT NULL,
  `PIT_Tax_Name` varchar(30) DEFAULT NULL,
  `PIT_Tax_Percent` decimal(5,2) DEFAULT '0.00',
  `PIT_Tax_on_Value_Percent` decimal(5,2) DEFAULT '0.00',
  `PIT_Surcharge_Percent` decimal(4,2) DEFAULT '0.00',
  PRIMARY KEY (`PIT_PI_Taxes_ID`),
  KEY `FK_PIT_PID_ID` (`PIT_PID_ID`),
  CONSTRAINT `FK_PIT_PID_ID` FOREIGN KEY (`PIT_PID_ID`) REFERENCES `erpm_purchaseinvoice_detail` (`PID_PID_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_purchaseinvoice_taxes`
--

LOCK TABLES `erpm_purchaseinvoice_taxes` WRITE;
/*!40000 ALTER TABLE `erpm_purchaseinvoice_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_purchaseinvoice_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_purchaseinvoice_terms`
--

DROP TABLE IF EXISTS `erpm_purchaseinvoice_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_purchaseinvoice_terms` (
  `PIT_PIT_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PIT_PIM_ID` int(10) unsigned NOT NULL,
  `PIT_EGM_ID` int(10) unsigned NOT NULL,
  `PIT_TERMS_DESCRIPTION` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`PIT_PIT_ID`),
  KEY `FK_PIT_PIM_ID` (`PIT_PIM_ID`),
  CONSTRAINT `FK_PIT_PIM_ID` FOREIGN KEY (`PIT_PIM_ID`) REFERENCES `erpm_purchaseinvoice_master` (`PIM_PIM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_purchaseinvoice_terms`
--

LOCK TABLES `erpm_purchaseinvoice_terms` WRITE;
/*!40000 ALTER TABLE `erpm_purchaseinvoice_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_purchaseinvoice_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_stock_received`
--

DROP TABLE IF EXISTS `erpm_stock_received`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_stock_received` (
  `ST_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ST_IM_ID` smallint(5) unsigned NOT NULL,
  `ST_SIM_ID` mediumint(5) unsigned NOT NULL,
  `ST_DM_ID` mediumint(5) unsigned NOT NULL,
  `ST_SM_ID` int(10) unsigned DEFAULT NULL,
  `ST_Item_ID` int(10) unsigned NOT NULL,
  `ST_In_Stock_Since` date DEFAULT NULL,
  `ST_Challan_Det_ID` int(10) unsigned DEFAULT NULL,
  `ST_PO_No` varchar(20) DEFAULT NULL,
  `ST_PO_Date` date DEFAULT NULL,
  `ST_Challan_No` varchar(20) DEFAULT NULL,
  `ST_Challan_Date` date DEFAULT NULL,
  `ST_Invoice_No` varchar(20) DEFAULT NULL,
  `ST_Invoice_Date` date DEFAULT NULL,
  `ST_Quantity` decimal(10,2) DEFAULT '0.00',
  `ST_Unit_Rate` decimal(8,2) DEFAULT NULL,
  `ST_Tax_Value` decimal(8,2) DEFAULT NULL,
  `ST_CSR_No` varchar(20) DEFAULT NULL,
  `ST_CSR_PgNo` int(10) unsigned DEFAULT NULL,
  `ST_DeptSR_No` varchar(20) DEFAULT NULL,
  `ST_DeptSR_PgNo` int(10) unsigned DEFAULT NULL,
  `ST_Product_No` varchar(30) DEFAULT NULL,
  `ST_Stock_Serial_No` varchar(30) DEFAULT NULL,
  `ST_Warranty_Expiry_Date` date DEFAULT NULL,
  `ST_Warranty_Type_ID` int(10) unsigned DEFAULT NULL,
  `ST_Depriciated_Value` decimal(10,2) DEFAULT '0.00',
  `ST_Depriciation_Calc_Date` date DEFAULT NULL,
  PRIMARY KEY (`ST_ID`),
  KEY `PK_ST_IM_ID` (`ST_IM_ID`),
  KEY `PK_ST_SIM_ID` (`ST_SIM_ID`),
  KEY `PK_ST_DM_ID` (`ST_DM_ID`),
  KEY `PK_ST_SM_ID` (`ST_SM_ID`),
  KEY `PK_ST_Item_ID` (`ST_Item_ID`),
  KEY `PK_Warranty_Type_ID` (`ST_Warranty_Type_ID`),
  CONSTRAINT `PK_ST_DM_ID` FOREIGN KEY (`ST_DM_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `PK_ST_IM_ID` FOREIGN KEY (`ST_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `PK_ST_Item_ID` FOREIGN KEY (`ST_Item_ID`) REFERENCES `erpm_item_master` (`ERPMIM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `PK_ST_SIM_ID` FOREIGN KEY (`ST_SIM_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON UPDATE CASCADE,
  CONSTRAINT `PK_ST_SM_ID` FOREIGN KEY (`ST_SM_ID`) REFERENCES `suppliermaster` (`SM_Id`) ON UPDATE CASCADE,
  CONSTRAINT `PK_ST_Warranty_Type_ID` FOREIGN KEY (`ST_Warranty_Type_ID`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_stock_received`
--

LOCK TABLES `erpm_stock_received` WRITE;
/*!40000 ALTER TABLE `erpm_stock_received` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_stock_received` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_temp_opening_stock`
--

DROP TABLE IF EXISTS `erpm_temp_opening_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_temp_opening_stock` (
  `TOS_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TOS_IM_ID` smallint(5) unsigned NOT NULL,
  `TOS_SIM_ID` mediumint(5) unsigned NOT NULL,
  `TOS_DM_ID` mediumint(5) unsigned NOT NULL,
  `TOS_SM_ID` int(10) unsigned DEFAULT NULL,
  `TOS_Item_ID` int(10) unsigned NOT NULL,
  `TOS_In_Stock_Since` date DEFAULT NULL,
  `TOS_PO_No` varchar(20) DEFAULT NULL,
  `TOS_PO_Date` date DEFAULT NULL,
  `TOS_Challan_No` varchar(20) DEFAULT NULL,
  `TOS_Challan_Date` date DEFAULT NULL,
  `TOS_Invoice_No` varchar(20) DEFAULT NULL,
  `TOS_Invoice_Date` date DEFAULT NULL,
  `TOS_Quantity` decimal(10,2) DEFAULT '0.00',
  `TOS_Unit_Rate` decimal(8,2) DEFAULT NULL,
  `TOS_Tax_Value` decimal(8,2) DEFAULT NULL,
  `TOS_CSR_No` varchar(20) NOT NULL,
  `TOS_CSR_PgNo` int(3) unsigned NOT NULL,
  `TOS_DeptSR_No` varchar(20) NOT NULL,
  `TOS_DeptSR_PgNo` int(3) unsigned NOT NULL,
  `TOS_Product_No` varchar(30) DEFAULT NULL,
  `TOS_Stock_Serial_No` varchar(30) DEFAULT NULL,
  `TOS_Warranty_Expiry_Date` date DEFAULT NULL,
  `TOS_Warranty_Type_ID` int(10) unsigned DEFAULT NULL,
  `TOS_Batch_ID` varchar(50) NOT NULL,
  PRIMARY KEY (`TOS_ID`),
  KEY `PK_TOS_Warranty_Type_ID` (`TOS_Warranty_Type_ID`),
  KEY `PK_TOS_DM_ID` (`TOS_DM_ID`),
  KEY `PK_TOS_IM_ID` (`TOS_IM_ID`),
  KEY `PK_TOS_Item_ID` (`TOS_Item_ID`),
  KEY `PK_TOS_SIM_ID` (`TOS_SIM_ID`),
  KEY `PK_TOS_SM_ID` (`TOS_SM_ID`),
  CONSTRAINT `PK_TOS_DM_ID` FOREIGN KEY (`TOS_DM_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `PK_TOS_IM_ID` FOREIGN KEY (`TOS_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `PK_TOS_Item_ID` FOREIGN KEY (`TOS_Item_ID`) REFERENCES `erpm_item_master` (`ERPMIM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `PK_TOS_SIM_ID` FOREIGN KEY (`TOS_SIM_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON UPDATE CASCADE,
  CONSTRAINT `PK_TOS_SM_ID` FOREIGN KEY (`TOS_SM_ID`) REFERENCES `suppliermaster` (`SM_Id`) ON UPDATE CASCADE,
  CONSTRAINT `PK_TOS_Warranty_Type_ID` FOREIGN KEY (`TOS_Warranty_Type_ID`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_temp_opening_stock`
--

LOCK TABLES `erpm_temp_opening_stock` WRITE;
/*!40000 ALTER TABLE `erpm_temp_opening_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_temp_opening_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_tender_master`
--

DROP TABLE IF EXISTS `erpm_tender_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_tender_master` (
  `TM_TM_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TM_IM_ID` smallint(5) unsigned NOT NULL,
  `TM_SIM_ID` mediumint(5) unsigned NOT NULL,
  `TM_DM_ID` mediumint(5) unsigned NOT NULL,
  `TM_Tender_No` varchar(30) NOT NULL,
  `TM_Name` varchar(100) NOT NULL,
  `TM_Type_ID` int(10) unsigned NOT NULL,
  `TM_Date` date NOT NULL,
  `TM_Fee` int(10) DEFAULT '0',
  `TM_Estimated_Amount` int(10) DEFAULT '0',
  `TM_EMD_Amount` int(10) DEFAULT '0',
  `TM_Document_Link` varchar(100) DEFAULT NULL,
  `TM_Notice_Link` varchar(100) DEFAULT NULL,
  `TM_Status_ID` int(10) unsigned NOT NULL,
  `TM_Awarded_Submission_ID` int(10) unsigned DEFAULT NULL,
  `TM_Remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`TM_TM_ID`),
  KEY `FK_TM_Status_idx` (`TM_Status_ID`),
  KEY `FK_TM_IM_ID_idx` (`TM_IM_ID`),
  KEY `FK_TM_SIM_ID_idx` (`TM_SIM_ID`),
  KEY `FK_TM_DM_ID_idx` (`TM_DM_ID`),
  KEY `FK_idx` (`TM_Type_ID`),
  KEY `TM_Awarded_Submission_ID_idx` (`TM_Awarded_Submission_ID`),
  CONSTRAINT `FK_TM_DM_ID` FOREIGN KEY (`TM_DM_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_TM_IM_ID` FOREIGN KEY (`TM_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_TM_SIM_ID` FOREIGN KEY (`TM_SIM_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_TM_Status` FOREIGN KEY (`TM_Status_ID`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_TM_Type` FOREIGN KEY (`TM_Type_ID`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `TM_Awarded_Submission_ID` FOREIGN KEY (`TM_Awarded_Submission_ID`) REFERENCES `erpm_tender_submission` (`TSB_TSB_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_tender_master`
--

LOCK TABLES `erpm_tender_master` WRITE;
/*!40000 ALTER TABLE `erpm_tender_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_tender_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_tender_revisions`
--

DROP TABLE IF EXISTS `erpm_tender_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_tender_revisions` (
  `TR_TR_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TR_IM_ID` smallint(5) unsigned NOT NULL,
  `TR_SIM_ID` mediumint(5) unsigned NOT NULL,
  `TR_DM_ID` mediumint(5) unsigned NOT NULL,
  `TR_TM_ID` int(10) unsigned NOT NULL,
  `TR_Revision_No` int(10) NOT NULL,
  `TR_Revision_Type_ID` int(10) unsigned NOT NULL,
  `TR_Revision_Date` date NOT NULL,
  `TR_Revision_Description` varchar(200) DEFAULT NULL,
  `TR_Revision_Link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TR_TR_ID`),
  KEY `FK_TR_TM_ID_idx` (`TR_TM_ID`),
  KEY `FK_TR_IM_ID_idx` (`TR_IM_ID`),
  KEY `FK_TR_SIM_ID_idx` (`TR_SIM_ID`),
  KEY `FK_TR_DM_ID_idx` (`TR_DM_ID`),
  KEY `FK_TR_Revision_Type_ID_idx` (`TR_Revision_Type_ID`),
  CONSTRAINT `FK_TR_DM_ID` FOREIGN KEY (`TR_DM_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_TR_IM_ID` FOREIGN KEY (`TR_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_TR_Revision_Type_ID` FOREIGN KEY (`TR_Revision_Type_ID`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_TR_SIM_ID` FOREIGN KEY (`TR_SIM_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_TR_TM_ID` FOREIGN KEY (`TR_TM_ID`) REFERENCES `erpm_tender_master` (`TM_TM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_tender_revisions`
--

LOCK TABLES `erpm_tender_revisions` WRITE;
/*!40000 ALTER TABLE `erpm_tender_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_tender_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_tender_schedule`
--

DROP TABLE IF EXISTS `erpm_tender_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_tender_schedule` (
  `TSC_TSC_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TSC_IM_ID` smallint(5) unsigned NOT NULL,
  `TSC_SIM_ID` mediumint(5) unsigned NOT NULL,
  `TSC_DM_ID` mediumint(5) unsigned NOT NULL,
  `TSC_TM_ID` int(10) unsigned NOT NULL,
  `TSC_Remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`TSC_TSC_ID`),
  KEY `FK_TSC_TM_ID_idx` (`TSC_TM_ID`),
  KEY `FK_TSC_IM_ID_idx` (`TSC_IM_ID`),
  KEY `FK_TSC_SIM_ID_idx` (`TSC_SIM_ID`),
  KEY `FK_TSC_DM_ID_idx` (`TSC_DM_ID`),
  CONSTRAINT `FK_TSC_DM_ID` FOREIGN KEY (`TSC_DM_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_TSC_IM_ID` FOREIGN KEY (`TSC_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_TSC_SIM_ID` FOREIGN KEY (`TSC_SIM_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_TSC_TM_ID` FOREIGN KEY (`TSC_TM_ID`) REFERENCES `erpm_tender_master` (`TM_TM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_tender_schedule`
--

LOCK TABLES `erpm_tender_schedule` WRITE;
/*!40000 ALTER TABLE `erpm_tender_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_tender_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_tender_schedule_detail`
--

DROP TABLE IF EXISTS `erpm_tender_schedule_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_tender_schedule_detail` (
  `TSCD_TSCD_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TSCD_TSC_ID` int(10) unsigned NOT NULL,
  `TSCD_Schedule_No` int(2) NOT NULL,
  `TSCD_Schedule_Type_ID` int(10) unsigned NOT NULL,
  `TSCD_Schedule_Date` date NOT NULL,
  `TSCD_Schedule_Time` varchar(10) NOT NULL,
  `TSCD_Venue` varchar(50) NOT NULL,
  PRIMARY KEY (`TSCD_TSCD_ID`),
  KEY `FK_TSCD_TSC_ID_idx` (`TSCD_TSC_ID`),
  KEY `FK_TSCD_Schedule_Type_ID_idx` (`TSCD_Schedule_Type_ID`),
  CONSTRAINT `FK_TSCD_Schedule_Type_ID` FOREIGN KEY (`TSCD_Schedule_Type_ID`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_TSCD_TSC_ID` FOREIGN KEY (`TSCD_TSC_ID`) REFERENCES `erpm_tender_schedule` (`TSC_TSC_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_tender_schedule_detail`
--

LOCK TABLES `erpm_tender_schedule_detail` WRITE;
/*!40000 ALTER TABLE `erpm_tender_schedule_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_tender_schedule_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_tender_submission`
--

DROP TABLE IF EXISTS `erpm_tender_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_tender_submission` (
  `TSB_TSB_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TSB_IM_ID` smallint(5) unsigned NOT NULL,
  `TSB_SIM_ID` mediumint(5) unsigned NOT NULL,
  `TSB_DM_ID` mediumint(5) unsigned NOT NULL,
  `TSB_TM_ID` int(10) unsigned NOT NULL,
  `TSB_Submission_Date` date NOT NULL,
  `TSB_Company_Name` varchar(100) NOT NULL,
  `TSB_Company_Email` varchar(100) NOT NULL,
  `TSB_Company_Address` varchar(100) DEFAULT NULL,
  `TSB_Company_Phone` varchar(45) DEFAULT NULL,
  `TSB_EMD_Amount` int(10) DEFAULT NULL,
  `TSB_EMD_Bank_Name` varchar(50) DEFAULT NULL,
  `TSB_EMD_Type_ID` int(10) unsigned DEFAULT NULL,
  `TSB_BG_DD_No` varchar(30) DEFAULT NULL,
  `TSB_BG_DD_Validity_Date` date DEFAULT NULL,
  `TSB_Tender_Fee` int(10) DEFAULT NULL,
  `TSB_DD_Cash` varchar(5) DEFAULT NULL,
  `TSB_DD_CashReceipt_No` varchar(10) DEFAULT NULL,
  `TSB_EMD_Returned` char(1) DEFAULT NULL,
  `TSB_EMD_Return_Date` date DEFAULT NULL,
  `TSB_EMD_Return_File_Reference` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TSB_TSB_ID`),
  KEY `FK_TSB_EMD_Type_ID_idx` (`TSB_EMD_Type_ID`),
  KEY `FK_TSB_TM_ID_idx` (`TSB_TM_ID`),
  KEY `FK_TSB_IM_ID_idx` (`TSB_IM_ID`),
  KEY `FK_TSB_SIM_ID_idx` (`TSB_SIM_ID`),
  KEY `FK_TSB_DM_ID_idx` (`TSB_DM_ID`),
  CONSTRAINT `FK_TSB_DM_ID` FOREIGN KEY (`TSB_DM_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_TSB_EMD_Type_ID` FOREIGN KEY (`TSB_EMD_Type_ID`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_TSB_IM_ID` FOREIGN KEY (`TSB_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_TSB_SIM_ID` FOREIGN KEY (`TSB_SIM_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_TSB_TM_ID` FOREIGN KEY (`TSB_TM_ID`) REFERENCES `erpm_tender_master` (`TM_TM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_tender_submission`
--

LOCK TABLES `erpm_tender_submission` WRITE;
/*!40000 ALTER TABLE `erpm_tender_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_tender_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpm_tender_submission_files`
--

DROP TABLE IF EXISTS `erpm_tender_submission_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpm_tender_submission_files` (
  `TSF_TSF_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TSF_TSB_ID` int(10) unsigned NOT NULL,
  `TSF_File_Name` varchar(30) NOT NULL,
  `TSF_File_Stream` longblob,
  `TSF_File_Remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`TSF_TSF_ID`),
  KEY `FK_TSF_TSB_ID_idx` (`TSF_TSB_ID`),
  CONSTRAINT `FK_TSF_TSB_ID` FOREIGN KEY (`TSF_TSB_ID`) REFERENCES `erpm_tender_submission` (`TSB_TSB_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpm_tender_submission_files`
--

LOCK TABLES `erpm_tender_submission_files` WRITE;
/*!40000 ALTER TABLE `erpm_tender_submission_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpm_tender_submission_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpmmodule`
--

DROP TABLE IF EXISTS `erpmmodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpmmodule` (
  `ERPMM_ID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `ERPMM_Short_Name` char(15) NOT NULL,
  `ERPMM_Name` varchar(100) NOT NULL,
  `ERPMM_ERPMT_ID` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`ERPMM_ID`),
  UNIQUE KEY `UN_EM_ERPMM_Short_Name` (`ERPMM_Short_Name`),
  KEY `FK_EM_ERPMTeam_ERPMT_ID` (`ERPMM_ERPMT_ID`),
  CONSTRAINT `FK_EM_ERPMTeam_ERPMT_ID` FOREIGN KEY (`ERPMM_ERPMT_ID`) REFERENCES `erpmteam` (`ERPMT_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpmmodule`
--

LOCK TABLES `erpmmodule` WRITE;
/*!40000 ALTER TABLE `erpmmodule` DISABLE KEYS */;
INSERT INTO `erpmmodule` VALUES (1,'PICO','Purchase and Inventory Control Module',6);
/*!40000 ALTER TABLE `erpmmodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpmprogram`
--

DROP TABLE IF EXISTS `erpmprogram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpmprogram` (
  `ERPMP_ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `ERPMP_Display_Name` varchar(50) NOT NULL,
  `ERPMP_ESM_ID` int(11) unsigned NOT NULL,
  `ERPMP_Purpose` varchar(100) DEFAULT NULL,
  `ERPMP_HREF` varchar(200) DEFAULT NULL,
  `ERPMP_Order` tinyint(4) DEFAULT NULL,
  `ERPMP_SubProgram_ID` smallint(6) DEFAULT NULL,
  `EPMP_Env_Variable` varchar(100) DEFAULT NULL,
  `ERPMP_Display_Name_Hindi` varchar(50) NOT NULL DEFAULT ' ',
  `ERPMP_Display_Name_Urdu` varchar(50) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`ERPMP_ID`),
  KEY `FK_ERPMP_ERPMM_ERPMM_ID` (`ERPMP_ESM_ID`),
  KEY `FK_ERPMP_ID_SP_ID` (`ERPMP_SubProgram_ID`),
  CONSTRAINT `FK_ERPMP_ESM_ID` FOREIGN KEY (`ERPMP_ESM_ID`) REFERENCES `erpmsubmodule` (`ErpmSubModule_Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ERPMP_ID_SP_ID` FOREIGN KEY (`ERPMP_SubProgram_ID`) REFERENCES `erpmprogram` (`ERPMP_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpmprogram`
--

LOCK TABLES `erpmprogram` WRITE;
/*!40000 ALTER TABLE `erpmprogram` DISABLE KEYS */;
INSERT INTO `erpmprogram` VALUES (1,'PICO User Roles',1,NULL,'/pico/Administration/ManageInstitutionUserRoleAction.action',4,36,NULL,'PICO उपयोगकर्ता भूमिका',' '),(2,'Authorization Requests',1,NULL,'/pico/Administration/ManageAuthorizationRequests.action',4,36,NULL,'प्राधिकरण अनुरोध',' '),(3,'Master Data',1,NULL,'#',2,NULL,NULL,'प्रमुख आंकडे',' '),(4,'Capital Items',1,NULL,'/pico/Administration/ManageCapitalCategoryAction.action',2,3,NULL,'कैपिटल आइटम्स',' '),(5,'Budget Heads',1,NULL,'/pico/Administration/ManagebudgetheadAction.action',4,3,NULL,'बजट के प्रमुख',' '),(6,'Budget Allocation',1,'To let user manage Budget Allocation','/pico/Administration/ManageDepartmentalBudgetAllocationAction.action',7,NULL,NULL,'बजट आवंटन',' '),(7,'General Terms',1,NULL,'/pico/Administration/ManageGeneralTermsAction.action',5,3,NULL,'सामान्य शर्तें',' '),(8,'Organization',1,'To let user manage Organizational Data','#',1,NULL,NULL,'संगठन',' '),(9,'Institution',1,'To let user manage Institutional Records','/pico/Administration/ManageInstitutionAction.action',1,8,NULL,'संस्था',' '),(10,'College/Faculty/School',1,'To let user manage Subinstitution Records','/pico/Administration/ManageSubInstitutionAction.action',2,8,NULL,'कॉलेज / संकाय / स्कूल',' '),(11,'Departments',1,'To let user manage Department Records','/pico/Administration/ManageDepartmentAction.action',3,8,NULL,'विभाग',' '),(12,'Employees',1,'To let user manage Employee  Records','/pico/Administration/ManageEmployeeAction.action',4,8,NULL,'कर्मचारी',' '),(13,'Purchase Items',2,'To let user manage Purchase Items','/pico/PrePurchase/ManageItems.action',1,NULL,NULL,'क्रय वस्तुएँ',' '),(14,'Suppliers',2,'To let user manage Suppliers','/pico/PrePurchase/ManageSupplier.action',2,NULL,NULL,'आपूर्तिकर्ता',' '),(15,'Item Rates',2,'To let user manage Item Rates','/pico/PrePurchase/ManageItemRates.action',3,NULL,NULL,'आइटम की दरें',' '),(16,'Indent',2,'To let user manage Indents','/pico/PrePurchase/ManageIndent.action',4,NULL,NULL,'मांगपत्र',' '),(17,'Purchase Order',2,'To let user manage Purchase Order','/pico/PrePurchase/ManagePOMaster.action',6,NULL,NULL,'क्रय आदेश',' '),(18,'Purchase Challan',3,'To let user manage Purchase Challan','/pico/Purchase/ManagePurchaseChallanAction.action',1,NULL,NULL,'क्रय चालान',' '),(19,'Current Profile',5,'To let user see his Current Profile',NULL,1,NULL,'IM_SN + \"/\" + SIM_SN + \"/\" + DM_SN + \"/\" + ERPMU_Full_Name','वर्त्तमान प्रोफाइल देखें',' '),(20,'Change Profile',5,'To let user change his Profile','/pico/PrePurchase/ChangeProfileAction',2,NULL,NULL,'प्रोफ़ाइल बदलें',' '),(21,'Committees',1,'To let user manage Committees and Authorities','/pico/Administration/CommitteeMasterAction',5,8,NULL,'समिति',' '),(22,'Workflow',1,NULL,'/pico/Administration/WorkFlowMasterAction',6,3,NULL,'कार्यप्रवाह',' '),(23,'Issue Items',4,'To Let user Issue Items','/pico/Inventory/IssueItemsAction',1,NULL,NULL,'निर्गत वस्तुएँ',' '),(24,'PICO Programs',1,NULL,'/pico/Administration/ErpmprogramAction',2,36,NULL,'PICO कार्यक्रम',' '),(25,'PICO Sub Module',1,NULL,'/pico/Administration/ManageSubmoduleAction',1,36,NULL,'PICO उपकार्यक्रम',' '),(26,'Receive Items',4,'To Let user Receive Issued Items','/pico/Inventory/ReceiveItemsAction',3,NULL,NULL,'प्राप्त वस्तुएँ',' '),(27,'Opening Stock',4,'To Let user Add Opening Stock','/pico/Inventory/ManageOpeningStockAction',1,NULL,NULL,'प्रारंभिक माल',' '),(28,'Return Items',4,'To Let user Return Issued Items','/pico/Inventory/ReturnIssuedItemsAction.action',4,NULL,NULL,'वापसी वस्तुएँ',' '),(29,'Purchase Invoice',3,'To let user manage Purchase Invoice','/pico/Purchase/PurchaseInvoiceAction.action',2,NULL,NULL,'क्रय बीजक',' '),(30,'Stock Reports',4,'To Let user open Stock Reports','/pico/Inventory/StockReportsAction',5,NULL,NULL,'स्टॉक तालिकाएँ',' '),(31,'PICO News',1,'To Let User Manage News','/pico/Administration/ManageNewsAction',11,NULL,NULL,'PICO समाचार',' '),(32,'Purchase Reports',3,'To Let User Print Purchase Related Reports','/pico/Purchase/PurchaseReportAction.action',3,NULL,NULL,'क्रय तालिकाएँ',' '),(33,'GFR Master',1,NULL,'/pico/Administration/ManageGFRAction',7,3,NULL,'GFR प्रधान',' '),(34,'GFR Program Mapping',1,NULL,'/pico/Administration/ManageGFRProgramMappingAction',13,36,NULL,'GFR कार्यक्रम मानचित्र',' '),(35,'General Master',1,NULL,'/pico/Administration/ManageGeneralMasterAction.action',1,3,NULL,'सामान्य प्रमुख आंकडे',' '),(36,'PICO Admin',1,'To let user manage PICOPrograms','#',3,NULL,NULL,'PICO प्रशासक',' '),(37,'Item Category',1,'To Let User Manage Item Categories','/pico/Administration/ItemCategoryAction.action',3,3,NULL,'वस्तु श्रेणी',' '),(38,'Tender',2,NULL,'#',5,NULL,NULL,'निविदा',' '),(39,'Tender Master',2,NULL,'/pico/PrePurchase/TenderMasterAction.action',1,38,NULL,'निविदा प्रमुख',' '),(40,'Tender Schedule',2,NULL,'/pico/PrePurchase/TenderScheduleAction.action',2,38,NULL,'निविदा अनुसूची',' '),(41,'Tender Submission',2,NULL,'/pico/PrePurchase/TenderSubmissionAction.action',3,38,NULL,'निविदा प्रस्तुतीकरण',' '),(42,'Pre-Purchase Reports',2,NULL,'/pico/PrePurchase/PrePurchaseReportAction.action',7,NULL,NULL,'क्रय पूर्व तालिकाएँ',' '),(43,'Tender Revision',2,NULL,'/pico/PrePurchase/TenderRevisionAction.action',4,38,NULL,'निविदा संशोधन',' ');
/*!40000 ALTER TABLE `erpmprogram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpmsubmodule`
--

DROP TABLE IF EXISTS `erpmsubmodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpmsubmodule` (
  `ErpmSubModule_Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ESM_Module_Id` tinyint(3) unsigned DEFAULT NULL,
  `ESM_Name` varchar(45) DEFAULT NULL,
  `ESM_ORDER` tinyint(4) DEFAULT NULL,
  `ESM_HREF` varchar(200) DEFAULT NULL,
  `ESM_Env_Variable` varchar(100) DEFAULT NULL,
  `ESM_Name_Hindi` varchar(45) NOT NULL DEFAULT ' ',
  `ESM_Name_Urdu` varchar(45) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`ErpmSubModule_Id`),
  KEY `ESM_ERPMM_ID` (`ESM_Module_Id`),
  CONSTRAINT `ESM_ERPMM_ID` FOREIGN KEY (`ESM_Module_Id`) REFERENCES `erpmmodule` (`ERPMM_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpmsubmodule`
--

LOCK TABLES `erpmsubmodule` WRITE;
/*!40000 ALTER TABLE `erpmsubmodule` DISABLE KEYS */;
INSERT INTO `erpmsubmodule` VALUES (1,1,'Administration',2,'#',NULL,'प्रशासन',' '),(2,1,'Pre-Purchase',3,'#',NULL,'पूर्व क्रय',' '),(3,1,'Purchase',4,'#',NULL,'क्रय',' '),(4,1,'Inventory',5,'#',NULL,'इन्वेंट्री',' '),(5,1,'User Profile',6,'#',NULL,'उपयोगकर्ता प्रोफ़ाइल',' '),(6,1,'PICO Help',7,'#',NULL,'पिको मदद',' '),(7,1,'Exit',8,'/pico/PrePurchase/LogoutAction',NULL,'निकास',' '),(8,1,'Welcome',1,'#','username','आपका स्वागत है',' ');
/*!40000 ALTER TABLE `erpmsubmodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpmteam`
--

DROP TABLE IF EXISTS `erpmteam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpmteam` (
  `ERPMT_ID` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `ERPMT_Name` varchar(100) NOT NULL,
  `ERMT_PI_Name` varchar(50) NOT NULL,
  `ERPMT_COPI_Name` varchar(50) DEFAULT NULL,
  `ERPMT_PI_EMail` varchar(50) NOT NULL,
  `ERPMT_COPI_EMail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ERPMT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpmteam`
--

LOCK TABLES `erpmteam` WRITE;
/*!40000 ALTER TABLE `erpmteam` DISABLE KEYS */;
INSERT INTO `erpmteam` VALUES (1,'Aligah Muslim University','Prof. Nisar Ahmad','Dr. Asim Zafar','nisar@amu',NULL),(2,'Amrita Vishwa Vidya Peetham','Mr. Raghu ','Ms. Prema','raghu@',NULL),(3,'IIT Kanpur','Dr. Y.N. Singh',NULL,'ynsungh@',NULL),(4,'IIT Roorkee','Prof. Padam Singh',NULL,'padamsingh@',NULL),(5,'Dayalbagh Educational Institute','Mr. Prem Sudhish',NULL,'prem@',NULL),(6,'Jamia Millia Islamia','Dr. S. Kazim Naqvi','Mr. Muzaffar Azim','sknaqvi@jmi.ac.in','mazim@jmi.ac.in'),(7,'SMVDU, Jammu','Ms. Sonalika',NULL,'sonalika@',NULL),(8,'IGNOU','Prof. Uma Kanjilal',NULL,'umak@',NULL);
/*!40000 ALTER TABLE `erpmteam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpmuserdepartments`
--

DROP TABLE IF EXISTS `erpmuserdepartments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpmuserdepartments` (
  `ERPMUD_ID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ERPMUD_DM_ID` mediumint(5) unsigned NOT NULL,
  `ERPMUD_IUP_ID` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`ERPMUD_ID`),
  KEY `FK_ERPMUD_DepartmentMaster_DM_ID` (`ERPMUD_DM_ID`),
  KEY `FK_ERPMUD_InstitutionUserPrivileges_IUP_ID` (`ERPMUD_IUP_ID`),
  CONSTRAINT `FK_ERPMUD_DepartmentMaster_DM_ID` FOREIGN KEY (`ERPMUD_DM_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ERPMUD_InstitutionUserPrivileges_IUP_ID` FOREIGN KEY (`ERPMUD_IUP_ID`) REFERENCES `institutionroleprivileges` (`IUP_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpmuserdepartments`
--

LOCK TABLES `erpmuserdepartments` WRITE;
/*!40000 ALTER TABLE `erpmuserdepartments` DISABLE KEYS */;
/*!40000 ALTER TABLE `erpmuserdepartments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpmuserprofile`
--

DROP TABLE IF EXISTS `erpmuserprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpmuserprofile` (
  `IM_Id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `IM_Short_name` varchar(10) DEFAULT NULL,
  `SIM_ID` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `SIM_Short_name` varchar(10) DEFAULT NULL,
  `DM_ID` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `DM_Short_Name` varchar(10) DEFAULT NULL,
  `ERPMU_ID` mediumint(9) NOT NULL,
  PRIMARY KEY (`ERPMU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpmuserprofile`
--

LOCK TABLES `erpmuserprofile` WRITE;
/*!40000 ALTER TABLE `erpmuserprofile` DISABLE KEYS */;
INSERT INTO `erpmuserprofile` VALUES (1,'SUINST',1,'SUCLG',1,'SUDEPT',1);
/*!40000 ALTER TABLE `erpmuserprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpmuserrole`
--

DROP TABLE IF EXISTS `erpmuserrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpmuserrole` (
  `ERPMUR_ID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ERPMUR_ERPMU_ID` mediumint(9) unsigned DEFAULT NULL,
  `ERPMUR_IM_ID` smallint(5) unsigned DEFAULT NULL,
  `ERPMUR_SIM_ID` mediumint(5) unsigned NOT NULL,
  `ERPMUR_DM_ID` mediumint(5) unsigned NOT NULL,
  `ERPMUR_IUR_ID` mediumint(8) unsigned NOT NULL,
  `ERPMUR_Default` char(1) DEFAULT 'N',
  `ERPMUR_Active` char(1) DEFAULT 'N',
  PRIMARY KEY (`ERPMUR_ID`),
  KEY `FK_ERPMUR_DepartmentMaster_DM_ID` (`ERPMUR_DM_ID`),
  KEY `FK_ERPMUR_ERPMUsers_ERPMU_ID` (`ERPMUR_ERPMU_ID`),
  KEY `FK_ERPMUR_InstitutionMaster_IM_ID` (`ERPMUR_IM_ID`),
  KEY `FK_ERPMUR_IUR_IUR_ID` (`ERPMUR_IUR_ID`),
  KEY `FK_ERPMUR_SubInstitutionMsater_SIM_ID` (`ERPMUR_SIM_ID`),
  CONSTRAINT `FK_ERPMUR_DepartmentMaster_DM_ID` FOREIGN KEY (`ERPMUR_DM_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ERPMUR_ERPMUsers_ERPMU_ID` FOREIGN KEY (`ERPMUR_ERPMU_ID`) REFERENCES `erpmusers` (`ERPMU_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ERPMUR_InstitutionMaster_IM_ID` FOREIGN KEY (`ERPMUR_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ERPMUR_IUR_IUR_ID` FOREIGN KEY (`ERPMUR_IUR_ID`) REFERENCES `institutionuserroles` (`IUR_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ERPMUR_SubInstitutionMsater_SIM_ID` FOREIGN KEY (`ERPMUR_SIM_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpmuserrole`
--

LOCK TABLES `erpmuserrole` WRITE;
/*!40000 ALTER TABLE `erpmuserrole` DISABLE KEYS */;
INSERT INTO `erpmuserrole` VALUES (1,1,1,1,1,1,'t','Y');
/*!40000 ALTER TABLE `erpmuserrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erpmusers`
--

DROP TABLE IF EXISTS `erpmusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erpmusers` (
  `ERPMU_ID` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `ERPMU_Name` varchar(50) NOT NULL,
  `ERPMU_Password` varchar(50) NOT NULL,
  `ERPMU_DOB` date NOT NULL,
  `ERPMU_Active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `ERPMU_Verified_By` varchar(50) DEFAULT NULL,
  `ERPMU_Secret_Question` varchar(100) DEFAULT NULL,
  `ERPMU_Secret_Answer` varchar(100) DEFAULT NULL,
  `ERPMU_Full_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`ERPMU_ID`),
  UNIQUE KEY `UNIQUE_ERPMU_Name` (`ERPMU_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erpmusers`
--

LOCK TABLES `erpmusers` WRITE;
/*!40000 ALTER TABLE `erpmusers` DISABLE KEYS */;
INSERT INTO `erpmusers` VALUES (1,'admin','admin','2015-04-01','Y',NULL,'What is my father\'s middle name?','admin','PICO Administrator'),(2,'guest','guest','1969-12-07','N',NULL,'What is my father\'s first name?','shane','Guest');
/*!40000 ALTER TABLE `erpmusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_detail`
--

DROP TABLE IF EXISTS `file_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_detail` (
  `FD_Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `FM_Id` int(11) unsigned NOT NULL,
  `FD_IM_Id` smallint(3) unsigned DEFAULT NULL,
  `FD_SIM_Id` mediumint(3) unsigned DEFAULT NULL,
  `FD_DM_Id` mediumint(5) unsigned DEFAULT NULL,
  `FD_Official_Addressed` int(5) unsigned DEFAULT NULL,
  `FD_Received_By` mediumint(9) unsigned DEFAULT NULL,
  `FD_Received_Date` datetime DEFAULT NULL,
  `FD_received_Pages` int(5) DEFAULT NULL,
  `FD_Public_Remarks` varchar(250) DEFAULT NULL,
  `FD_Private_Remarks` varchar(250) DEFAULT NULL,
  `FD_Action` char(1) DEFAULT NULL,
  `FD_Action_Date` datetime DEFAULT NULL,
  `FD_Designation_Addressed` varchar(50) DEFAULT NULL,
  `FD_Despatch_Date` datetime DEFAULT NULL,
  `FD_Despatch_No` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`FD_Id`),
  KEY `FK_FD_IM_ID` (`FD_IM_Id`),
  KEY `FK_FD_SIM_ID` (`FD_SIM_Id`),
  KEY `FK_FD_DM_ID` (`FD_DM_Id`),
  KEY `FK_FD_Official_Addressed` (`FD_Official_Addressed`),
  KEY `FK_FD_Received_By` (`FD_Received_By`),
  KEY `FK_FM_ID` (`FM_Id`),
  CONSTRAINT `FK_FD_DM_ID` FOREIGN KEY (`FD_DM_Id`) REFERENCES `departmentmaster` (`DM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_FD_IM_ID` FOREIGN KEY (`FD_IM_Id`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_FD_Official_Addressed` FOREIGN KEY (`FD_Official_Addressed`) REFERENCES `employeemaster` (`EMP_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_FD_Received_By` FOREIGN KEY (`FD_Received_By`) REFERENCES `erpmusers` (`ERPMU_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_FD_SIM_ID` FOREIGN KEY (`FD_SIM_Id`) REFERENCES `subinstitutionmaster` (`sim_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_FM_ID` FOREIGN KEY (`FM_Id`) REFERENCES `file_master` (`File_Id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_detail`
--

LOCK TABLES `file_detail` WRITE;
/*!40000 ALTER TABLE `file_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_master`
--

DROP TABLE IF EXISTS `file_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_master` (
  `File_Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `File_Number` varchar(20) DEFAULT NULL,
  `File_Subject` varchar(200) DEFAULT NULL,
  `File_IM_Id` smallint(3) unsigned DEFAULT NULL,
  `File_SIM_Id` mediumint(3) unsigned DEFAULT NULL,
  `File_DM_Id` mediumint(5) unsigned DEFAULT NULL,
  `File_User_Id` mediumint(9) unsigned DEFAULT NULL,
  `File_Type` int(10) unsigned DEFAULT NULL,
  `File_Pages` int(11) DEFAULT NULL,
  `File_Signed_By` int(5) unsigned DEFAULT NULL,
  `File_Dispatch_Date` datetime DEFAULT NULL,
  `File_Confidential` bit(1) DEFAULT NULL,
  PRIMARY KEY (`File_Id`),
  UNIQUE KEY `File_Number_DM_ID_UNIQUE` (`File_Number`,`File_DM_Id`),
  KEY `FK_FM_IM_ID` (`File_IM_Id`),
  KEY `FK_FM_SIM_ID` (`File_SIM_Id`),
  KEY `FK_FM_DM_ID` (`File_DM_Id`),
  KEY `FK_FM_User_Id` (`File_User_Id`),
  KEY `FK_FM_File_Type` (`File_Type`),
  KEY `FK_FM_File_Signed_By` (`File_Signed_By`),
  CONSTRAINT `FK_FM_DM_ID` FOREIGN KEY (`File_DM_Id`) REFERENCES `departmentmaster` (`DM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_FM_File_Signed_By` FOREIGN KEY (`File_Signed_By`) REFERENCES `employeemaster` (`EMP_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_FM_File_Type` FOREIGN KEY (`File_Type`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_FM_IM_ID` FOREIGN KEY (`File_IM_Id`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_FM_SIM_ID` FOREIGN KEY (`File_SIM_Id`) REFERENCES `subinstitutionmaster` (`sim_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_FM_User_Id` FOREIGN KEY (`File_User_Id`) REFERENCES `erpmusers` (`ERPMU_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_master`
--

LOCK TABLES `file_master` WRITE;
/*!40000 ALTER TABLE `file_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financialyearmaster`
--

DROP TABLE IF EXISTS `financialyearmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financialyearmaster` (
  `FYM_FY_ID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `FYM_From_Year` smallint(4) NOT NULL,
  `FYM_To_Year` smallint(4) NOT NULL,
  PRIMARY KEY (`FYM_FY_ID`),
  UNIQUE KEY `Unique_FYM_From_Year_FYM_To_Year` (`FYM_From_Year`,`FYM_To_Year`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financialyearmaster`
--

LOCK TABLES `financialyearmaster` WRITE;
/*!40000 ALTER TABLE `financialyearmaster` DISABLE KEYS */;
INSERT INTO `financialyearmaster` VALUES (1,2010,2011),(2,2011,2012),(3,2012,2013),(4,2013,2014),(5,2014,2015);
/*!40000 ALTER TABLE `financialyearmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genericroleprivileges`
--

DROP TABLE IF EXISTS `genericroleprivileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genericroleprivileges` (
  `GUP_ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `GUP_ERPMM_ID` tinyint(3) unsigned DEFAULT NULL,
  `GUP_ERPMP_ID` smallint(6) NOT NULL,
  `GUP_GUR_ID` tinyint(3) unsigned NOT NULL,
  `GUP_Can_Add` enum('0','1') NOT NULL DEFAULT '0',
  `GUP_Can_Delete` enum('1','0') NOT NULL DEFAULT '0',
  `GUP_Can_Edit` enum('0','1') NOT NULL DEFAULT '0',
  `GUP_Can_View` enum('0','1') DEFAULT '0',
  `GUP_ERPMSM_ID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`GUP_ID`),
  KEY `FK_UP_ERPMProgram_ERPMP_ID` (`GUP_ERPMP_ID`),
  KEY `FK_GUP_GenericUserRole_GUR_ID` (`GUP_GUR_ID`),
  KEY `FK_GUP_ERPMM_ERPMM_ID` (`GUP_ERPMM_ID`),
  KEY `FK_GUP_ERPMSM_ID_ErpmSubModule_Id` (`GUP_ERPMSM_ID`),
  CONSTRAINT `FK_GUP_ERPMM_ERPMM_ID` FOREIGN KEY (`GUP_ERPMM_ID`) REFERENCES `erpmmodule` (`ERPMM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_GUP_ERPMP_ERPMP_ID` FOREIGN KEY (`GUP_ERPMP_ID`) REFERENCES `erpmprogram` (`ERPMP_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_GUP_ERPMSM_ID_ErpmSubModule_Id` FOREIGN KEY (`GUP_ERPMSM_ID`) REFERENCES `erpmsubmodule` (`ErpmSubModule_Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_GUP_GenericUserRole_GUR_ID` FOREIGN KEY (`GUP_GUR_ID`) REFERENCES `genericuserroles` (`GUR_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genericroleprivileges`
--

LOCK TABLES `genericroleprivileges` WRITE;
/*!40000 ALTER TABLE `genericroleprivileges` DISABLE KEYS */;
INSERT INTO `genericroleprivileges` VALUES (1,1,1,1,'1','1','1','1',1),(2,1,2,1,'1','1','1','1',1),(3,1,3,1,'1','1','1','1',1),(4,1,4,1,'1','1','1','1',1),(5,1,5,1,'1','1','1','1',1),(6,1,6,1,'1','1','1','1',1),(7,1,7,1,'1','1','1','1',1),(8,1,8,1,'1','1','1','1',1),(9,1,9,1,'1','1','1','1',1),(10,1,10,1,'1','1','1','1',1),(11,1,11,1,'1','1','1','1',1),(12,1,12,1,'1','1','1','1',1),(13,1,13,1,'1','1','1','1',2),(14,1,14,1,'1','1','1','1',2),(15,1,15,1,'1','1','1','1',2),(16,1,16,1,'1','1','1','1',2),(17,1,17,1,'1','1','1','1',2),(18,1,18,1,'1','1','1','1',3),(19,1,19,1,'1','1','1','1',5),(20,1,20,1,'1','1','1','1',5),(21,1,21,1,'1','1','1','1',1),(22,1,22,1,'1','1','1','1',1),(23,1,23,1,'1','1','1','1',4),(24,1,24,1,'1','1','1','1',1),(25,1,25,1,'1','1','1','1',1),(26,1,26,1,'1','1','1','1',4),(27,1,27,1,'1','1','1','1',4),(28,1,28,1,'1','1','1','1',4),(29,1,29,1,'1','1','1','1',3),(30,1,30,1,'1','1','1','1',4),(31,1,31,1,'1','1','1','1',1),(32,1,32,1,'1','1','1','1',3),(33,1,33,1,'1','1','1','1',1),(34,1,34,1,'1','1','1','1',1),(35,1,35,1,'1','1','1','1',1),(36,1,36,1,'1','1','1','1',1),(37,1,37,1,'1','1','1','1',1),(38,1,38,1,'1','1','1','1',2),(39,1,39,1,'1','1','1','1',2),(40,1,40,1,'1','1','1','1',2),(41,1,41,1,'1','1','1','1',2),(42,1,42,1,'1','1','1','1',2),(43,1,43,1,'1','1','1','1',2);
/*!40000 ALTER TABLE `genericroleprivileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genericuserroles`
--

DROP TABLE IF EXISTS `genericuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genericuserroles` (
  `GUR_ID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `GUR_Role_Name` varchar(50) NOT NULL,
  `GUR_Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`GUR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='This table holds user roles e.eg. Administrator, Manager etc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genericuserroles`
--

LOCK TABLES `genericuserroles` WRITE;
/*!40000 ALTER TABLE `genericuserroles` DISABLE KEYS */;
INSERT INTO `genericuserroles` VALUES (1,'Administrator','Can do any opeartion including approving the user accounts and privileges'),(2,'Purchase Manager','Can approve items and their rates'),(3,'Purchase Staff','Allows for all clerical operations in te module'),(4,'Head of the Department','Can place purchase Order ');
/*!40000 ALTER TABLE `genericuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gfr_master`
--

DROP TABLE IF EXISTS `gfr_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gfr_master` (
  `GFR_GFR_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `GFR_Section` varchar(5) NOT NULL,
  `GFR_Chapter_No` int(2) NOT NULL,
  `GFR_Chapter_Name` varchar(100) NOT NULL,
  `GFR_Rule_No` varchar(15) NOT NULL,
  `GFR_Description` varchar(2000) NOT NULL,
  `GFR_Or_Institute_Rule` char(1) NOT NULL DEFAULT 'G' COMMENT 'G  - General Financial Rule,  I - Institute Specific Rule',
  `GFR_IM_ID` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`GFR_GFR_Id`),
  KEY `FK_GFR_IM_ID` (`GFR_IM_ID`),
  CONSTRAINT `FK_GFR_IM_ID` FOREIGN KEY (`GFR_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gfr_master`
--

LOCK TABLES `gfr_master` WRITE;
/*!40000 ALTER TABLE `gfr_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `gfr_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gfr_program_mapping`
--

DROP TABLE IF EXISTS `gfr_program_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gfr_program_mapping` (
  `GPM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GPM_GFR_ID` int(10) unsigned NOT NULL,
  `GPM_Program_ID` smallint(6) NOT NULL,
  PRIMARY KEY (`GPM_ID`),
  KEY `FK_GPM_GFR_ID_idx` (`GPM_GFR_ID`),
  KEY `FK_GPM_Program_ID_idx` (`GPM_Program_ID`),
  CONSTRAINT `FK_GPM_GFR_ID` FOREIGN KEY (`GPM_GFR_ID`) REFERENCES `gfr_master` (`GFR_GFR_Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_GPM_Program_ID` FOREIGN KEY (`GPM_Program_ID`) REFERENCES `erpmprogram` (`ERPMP_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gfr_program_mapping`
--

LOCK TABLES `gfr_program_mapping` WRITE;
/*!40000 ALTER TABLE `gfr_program_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `gfr_program_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestbook`
--

DROP TABLE IF EXISTS `guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guestbook` (
  `VisitorNo` int(11) NOT NULL AUTO_INCREMENT,
  `VisitorName` varchar(100) DEFAULT NULL,
  `Message` varchar(100) DEFAULT NULL,
  `MessageDate` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`VisitorNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbook`
--

LOCK TABLES `guestbook` WRITE;
/*!40000 ALTER TABLE `guestbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutionmaster`
--

DROP TABLE IF EXISTS `institutionmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutionmaster` (
  `IM_ID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `IM_Name` varchar(100) NOT NULL,
  `IM_Short_Name` varchar(10) DEFAULT NULL,
  `im_type` int(10) unsigned DEFAULT NULL,
  `IM_Address_Line1` varchar(50) NOT NULL,
  `IM_Address_Line2` varchar(50) DEFAULT NULL,
  `IM_District` varchar(50) DEFAULT NULL,
  `IM_State_ID` tinyint(4) unsigned DEFAULT NULL,
  `IM_Pin_No` char(6) DEFAULT NULL,
  `IM_EMail_ID` varchar(50) DEFAULT NULL,
  `IM_Country_ID` tinyint(4) DEFAULT NULL,
  `IM_EMP_ID` int(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`IM_ID`),
  UNIQUE KEY `Unique_IM_Name` (`IM_Name`),
  UNIQUE KEY `Unique_IM_Short_Name` (`IM_Short_Name`),
  KEY `FK_IM_StateMaster_SM_ID` (`IM_State_ID`),
  KEY `FK_IM_InstitutionType_IT_Type_ID` (`im_type`),
  KEY `fk_Countrymaster_IM_Country_ID` (`IM_Country_ID`),
  KEY `FK_IM_EMP_ID_employeemaster` (`IM_EMP_ID`),
  CONSTRAINT `fk_Countrymaster_IM_Country_ID` FOREIGN KEY (`IM_Country_ID`) REFERENCES `countrymaster` (`Country_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_IM_EMP_ID_employeemaster` FOREIGN KEY (`IM_EMP_ID`) REFERENCES `employeemaster` (`EMP_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_IM_InstitutionType_IT_Type_ID` FOREIGN KEY (`im_type`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_IM_StateMaster_SM_ID` FOREIGN KEY (`IM_State_ID`) REFERENCES `statemaster` (`State_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutionmaster`
--

LOCK TABLES `institutionmaster` WRITE;
/*!40000 ALTER TABLE `institutionmaster` DISABLE KEYS */;
INSERT INTO `institutionmaster` VALUES (1,'Super Institute','SUINST',17,'Super Address 1','Super Address 2','Super City',1,'110025','pico.edrp@jmi.ac.in',1,NULL);
/*!40000 ALTER TABLE `institutionmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutionroleprivileges`
--

DROP TABLE IF EXISTS `institutionroleprivileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutionroleprivileges` (
  `IUP_ID` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `IUP_ERPM_ID` tinyint(3) unsigned DEFAULT NULL,
  `IUP_ERPMP_ID` smallint(6) NOT NULL,
  `IUP_IUR_ID` mediumint(8) unsigned NOT NULL,
  `IUP_Can_Add` tinyint(1) DEFAULT NULL,
  `IUP_Can_Delete` tinyint(1) DEFAULT NULL,
  `IUP_Can_Edit` tinyint(1) DEFAULT NULL,
  `IUP_Can_View` tinyint(1) DEFAULT NULL,
  `IUP_IM_ID` smallint(5) unsigned DEFAULT NULL,
  `IUP_EMPMSM_ID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`IUP_ID`),
  KEY `FK_IUP_ERPMM_ERPMM_ID` (`IUP_ERPM_ID`),
  KEY `FK_IUP_ERPMP_ERPMP_ID` (`IUP_ERPMP_ID`),
  KEY `FK_IUP_IUR_IUR_ID` (`IUP_IUR_ID`),
  KEY `FK_IUP_IM_ID` (`IUP_IM_ID`),
  KEY `FK_IUP_ERPMSM_ID_ERPMSM_ID` (`IUP_EMPMSM_ID`),
  CONSTRAINT `FK_IUP_ERPMM_ERPMM_ID` FOREIGN KEY (`IUP_ERPM_ID`) REFERENCES `erpmmodule` (`ERPMM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_IUP_ERPMP_ERPMP_ID` FOREIGN KEY (`IUP_ERPMP_ID`) REFERENCES `erpmprogram` (`ERPMP_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_IUP_ERPMSM_ID_ERPMSM_ID` FOREIGN KEY (`IUP_EMPMSM_ID`) REFERENCES `erpmsubmodule` (`ErpmSubModule_Id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_IUP_IM_ID` FOREIGN KEY (`IUP_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_IUP_IUR_IUR_ID` FOREIGN KEY (`IUP_IUR_ID`) REFERENCES `institutionuserroles` (`IUR_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutionroleprivileges`
--

LOCK TABLES `institutionroleprivileges` WRITE;
/*!40000 ALTER TABLE `institutionroleprivileges` DISABLE KEYS */;
INSERT INTO `institutionroleprivileges` VALUES (1,1,1,1,1,1,1,1,1,1),(2,1,2,1,1,1,1,1,1,1),(3,1,3,1,1,1,1,1,1,1),(4,1,4,1,1,1,1,1,1,1),(5,1,5,1,1,1,1,1,1,1),(6,1,6,1,1,1,1,1,1,1),(7,1,7,1,1,1,1,1,1,1),(8,1,13,1,1,1,1,1,1,2),(9,1,14,1,1,1,1,1,1,2),(10,1,15,1,1,1,1,1,1,2),(11,1,16,1,1,1,1,1,1,2),(12,1,17,1,1,1,1,1,1,2),(13,1,18,1,1,1,1,1,1,3),(14,1,19,1,1,1,1,1,1,5),(15,1,20,1,1,1,1,1,1,5),(16,1,8,1,2,1,2,2,1,1),(17,1,9,1,2,1,2,2,1,1),(18,1,10,1,2,1,2,2,1,1),(19,1,11,1,2,1,2,2,1,1),(20,1,12,1,2,1,2,2,1,1),(21,1,21,1,1,1,1,1,1,1),(22,1,23,1,1,1,1,1,1,1),(23,1,24,1,1,1,1,1,1,1),(24,1,25,1,1,1,1,1,1,1),(25,1,26,1,1,1,1,1,1,1),(26,1,27,1,1,1,1,1,1,1),(27,1,28,1,1,1,1,1,1,1),(28,1,29,1,1,1,1,1,1,1),(29,1,30,1,1,1,1,1,1,1),(30,1,31,1,1,1,1,1,1,1),(31,1,32,1,1,1,1,1,1,1),(32,1,33,1,1,1,1,1,1,1),(33,1,34,1,1,1,1,1,1,1),(34,1,37,1,1,1,1,1,1,1),(35,1,38,1,1,1,1,1,1,1),(36,1,39,1,1,1,1,1,NULL,NULL),(37,1,40,1,1,1,1,1,NULL,NULL),(38,1,41,1,1,1,1,1,NULL,NULL),(39,1,42,1,1,1,1,1,NULL,NULL),(40,1,43,1,1,1,1,1,NULL,NULL),(41,1,36,1,1,1,1,1,1,1),(42,1,22,1,1,1,1,1,1,1),(43,1,35,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `institutionroleprivileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutionuserroles`
--

DROP TABLE IF EXISTS `institutionuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutionuserroles` (
  `IUR_ID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `IUR_IM_ID` smallint(5) unsigned DEFAULT NULL,
  `IUR_Name` varchar(50) NOT NULL,
  `IUR_Remarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IUR_ID`),
  UNIQUE KEY `UNIQUE_IUR_Name_IUR_IM_ID` (`IUR_Name`,`IUR_IM_ID`),
  KEY `FK_IUR_IM_ID_IM_IM_ID` (`IUR_IM_ID`),
  CONSTRAINT `FK_IUR_IM_ID_IM_IM_ID` FOREIGN KEY (`IUR_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutionuserroles`
--

LOCK TABLES `institutionuserroles` WRITE;
/*!40000 ALTER TABLE `institutionuserroles` DISABLE KEYS */;
INSERT INTO `institutionuserroles` VALUES (1,1,'Administrator','Can do any opeartion including approving the user accounts and privileges'),(2,1,'Purchase Manager','Can approve items and their rates'),(3,1,'Purchase Staff','Allows for all clerical operations in te module'),(4,1,'Head of the Department','Can place purchase Order ');
/*!40000 ALTER TABLE `institutionuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemcategory`
--

DROP TABLE IF EXISTS `itemcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemcategory` (
  `IC_ID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `IC_Name` varchar(50) DEFAULT NULL COMMENT '	',
  `IC_IM_ID` smallint(5) unsigned DEFAULT NULL,
  `IC_SIM_ID` mediumint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`IC_ID`),
  KEY `FK_IC_InstititionMaster_IM_ID` (`IC_IM_ID`),
  KEY `FK_IC_SubInstitutionMaster_SIM_ID` (`IC_SIM_ID`),
  CONSTRAINT `FK_IC_InstititionMaster_IM_ID` FOREIGN KEY (`IC_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_IC_SubInstitutionMaster_SIM_ID` FOREIGN KEY (`IC_SIM_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='This table holds Item Categories such as (Computer, Lab Equi';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemcategory`
--

LOCK TABLES `itemcategory` WRITE;
/*!40000 ALTER TABLE `itemcategory` DISABLE KEYS */;
INSERT INTO `itemcategory` VALUES (1,'Furniture',1,NULL),(2,'Machinery',1,NULL);
/*!40000 ALTER TABLE `itemcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemtype`
--

DROP TABLE IF EXISTS `itemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemtype` (
  `IT_ID` tinyint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT 'This autoincrement column holds ID for each Item Type',
  `IT_Name` varchar(50) NOT NULL COMMENT 'Holds Item Name',
  PRIMARY KEY (`IT_ID`),
  UNIQUE KEY `IT_Name_UNIQUE` (`IT_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='This table stores Items Types (Non-Consumable, Consumable,, ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemtype`
--

LOCK TABLES `itemtype` WRITE;
/*!40000 ALTER TABLE `itemtype` DISABLE KEYS */;
INSERT INTO `itemtype` VALUES (2,'Cosumable'),(1,'Non-Cosumable'),(3,'Services');
/*!40000 ALTER TABLE `itemtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_master`
--

DROP TABLE IF EXISTS `language_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_master` (
  `LANG_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `LANG_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`LANG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_master`
--

LOCK TABLES `language_master` WRITE;
/*!40000 ALTER TABLE `language_master` DISABLE KEYS */;
INSERT INTO `language_master` VALUES (1,'English'),(2,'German'),(3,'France'),(4,'Chinese');
/*!40000 ALTER TABLE `language_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `message_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `message_code` varchar(4) DEFAULT NULL,
  `message_type` enum('W','E') DEFAULT NULL,
  `message_text` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `message_code` (`message_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'E001','E','Sorry, you are not authorised for this operation'),(2,'W001','W','Your session has expired. Pease Login again');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderingoptions`
--

DROP TABLE IF EXISTS `orderingoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderingoptions` (
  `OO_ID` smallint(5) NOT NULL AUTO_INCREMENT,
  `OO_Base_Table` varchar(50) DEFAULT NULL,
  `OO_Order_By_Clause` varchar(100) DEFAULT NULL,
  `OO_Order_By_LOV` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`OO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderingoptions`
--

LOCK TABLES `orderingoptions` WRITE;
/*!40000 ALTER TABLE `orderingoptions` DISABLE KEYS */;
INSERT INTO `orderingoptions` VALUES (1,'BudgetMaster','BM_IM_ID, BM_SIM_ID, BM_DM_ID, BM_Budget_Name Asc','Institution, SubInstitution,, Department, Budget Name (Ascending)'),(2,'BudgetMaster','BM_FYM_ID, BM_IM_ID, BM_SIM_ID, BM_DM_ID, BM_Budget_Name Asc','Financial Year, Institution, SubInstitution,, Department, Budget Name (Ascending)');
/*!40000 ALTER TABLE `orderingoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statemaster`
--

DROP TABLE IF EXISTS `statemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statemaster` (
  `State_ID` tinyint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Field to Store State ID',
  `State_Name` varchar(100) NOT NULL,
  `State_Type` set('Union Territory','State') DEFAULT 'State',
  `state_country_id` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`State_ID`),
  KEY `FK_SM_state_country_id_CM_country_id` (`state_country_id`),
  CONSTRAINT `FK_SM_state_country_id_CM_country_id` FOREIGN KEY (`state_country_id`) REFERENCES `countrymaster` (`Country_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statemaster`
--

LOCK TABLES `statemaster` WRITE;
/*!40000 ALTER TABLE `statemaster` DISABLE KEYS */;
INSERT INTO `statemaster` VALUES (1,'Delhi','State',1),(2,'Uttar Pradesh','State',1),(3,'Madhya Pradesh','State',1),(4,'Bihar','State',1),(5,'Andhra Pradesh','State',1),(6,'Tamilnadu','State',1),(7,'Maharashtra','State',1),(8,'Gujrat','State',1),(9,'Jammu Kashmir','State',1),(10,'Haryana','State',1),(11,'Asam','State',1),(12,'West Bengal','State',1),(13,'Uttranchal','State',1),(14,'Arunachal Pradesh','State',1),(15,'Punjab','State',1),(16,'Rajasthan','State',1),(17,'Kerala','State',1),(18,'Karnataka','State',1),(19,'Manipur','State',1),(20,'Meghalaya','State',1),(21,'Tokyo','State',3),(22,'Beijing','State',2);
/*!40000 ALTER TABLE `statemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storemaster`
--

DROP TABLE IF EXISTS `storemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storemaster` (
  `SM_ID` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `SM_Dep_ID` mediumint(6) unsigned NOT NULL,
  `SM_Name` varchar(100) NOT NULL,
  `SM_Type` tinyint(3) unsigned NOT NULL,
  `SM_Address_Line1` varchar(50) DEFAULT NULL,
  `SM_Address_Line2` varchar(50) DEFAULT NULL,
  `SM_District` varchar(50) DEFAULT NULL,
  `SM_State_ID` tinyint(4) unsigned DEFAULT NULL,
  `SM_Pin_No` char(6) DEFAULT NULL,
  `SM_EMail_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SM_ID`),
  KEY `FK_SM_DepartmentMaster_DM_ID` (`SM_Dep_ID`),
  KEY `FK_SM_StateMaster_State_ID` (`SM_State_ID`),
  KEY `FK_SM_StoreType_ST_Type_ID` (`SM_Type`),
  CONSTRAINT `FK_SM_DepartmentMaster_DM_ID` FOREIGN KEY (`SM_Dep_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SM_StateMaster_State_ID` FOREIGN KEY (`SM_State_ID`) REFERENCES `statemaster` (`State_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SM_StoreType_ST_Type_ID` FOREIGN KEY (`SM_Type`) REFERENCES `storetype` (`ST_Type_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storemaster`
--

LOCK TABLES `storemaster` WRITE;
/*!40000 ALTER TABLE `storemaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `storemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storetype`
--

DROP TABLE IF EXISTS `storetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storetype` (
  `ST_Type_ID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `ST_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`ST_Type_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storetype`
--

LOCK TABLES `storetype` WRITE;
/*!40000 ALTER TABLE `storetype` DISABLE KEYS */;
INSERT INTO `storetype` VALUES (1,'Office'),(2,'Lab'),(3,'Library'),(4,'Seminar Room'),(5,'Auditorium'),(6,'Classroom'),(7,'Store');
/*!40000 ALTER TABLE `storetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subinstitutionmaster`
--

DROP TABLE IF EXISTS `subinstitutionmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subinstitutionmaster` (
  `sim_id` mediumint(5) unsigned NOT NULL AUTO_INCREMENT,
  `SIM_IM_ID` smallint(5) unsigned NOT NULL,
  `SIM_Name` varchar(100) NOT NULL,
  `SIM_Short_Name` varchar(10) DEFAULT NULL,
  `sim_type` int(10) unsigned DEFAULT NULL,
  `SIM_Address_Line1` varchar(50) DEFAULT NULL,
  `SIM_Address_Line2` varchar(50) DEFAULT NULL,
  `SIM_District` varchar(50) DEFAULT NULL,
  `SIM_State_ID` tinyint(4) unsigned DEFAULT NULL,
  `SIM_Pin_No` char(6) DEFAULT NULL,
  `SIM_EMail_ID` varchar(50) DEFAULT NULL,
  `SIM_Country_ID` tinyint(4) DEFAULT NULL,
  `SIM_EMP_ID` int(5) unsigned DEFAULT NULL,
  `SIM_Head_Designation` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sim_id`),
  UNIQUE KEY `UNIQUE_SIM_IM_ID_SIM_Name` (`SIM_IM_ID`,`SIM_Name`),
  KEY `FK_SIM_StateMaster_SM_ID` (`SIM_State_ID`),
  KEY `fk_Countrymaster_SIM_Country_ID` (`SIM_Country_ID`),
  KEY `FK_SIM_EMP_ID_employeemaster` (`SIM_EMP_ID`),
  KEY `FK_SIM_Type` (`sim_type`),
  CONSTRAINT `fk_Countrymaster_SIM_Country_ID` FOREIGN KEY (`SIM_Country_ID`) REFERENCES `countrymaster` (`Country_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SIM_EMP_ID_employeemaster` FOREIGN KEY (`SIM_EMP_ID`) REFERENCES `employeemaster` (`EMP_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SIM_InstitutionMaster_IM_ID` FOREIGN KEY (`SIM_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SIM_StateMaster_SM_ID` FOREIGN KEY (`SIM_State_ID`) REFERENCES `statemaster` (`State_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SIM_Type` FOREIGN KEY (`sim_type`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subinstitutionmaster`
--

LOCK TABLES `subinstitutionmaster` WRITE;
/*!40000 ALTER TABLE `subinstitutionmaster` DISABLE KEYS */;
INSERT INTO `subinstitutionmaster` VALUES (1,1,'Super College','SUCLG',23,'Super Address 1','Super Address 2','Super City',1,'110025','pico.edrp@jmi.ac.in',1,1,'Dean');
/*!40000 ALTER TABLE `subinstitutionmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_address`
--

DROP TABLE IF EXISTS `supplier_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_address` (
  `sup_ad_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ad_Line1` varchar(50) NOT NULL,
  `ad_Line2` varchar(50) DEFAULT NULL,
  `ad_country_id` tinyint(4) DEFAULT NULL,
  `ad_state_id` tinyint(4) unsigned DEFAULT NULL,
  `ad_city` varchar(50) DEFAULT NULL,
  `ad_Phn` int(12) DEFAULT NULL,
  `ad_Mob` int(12) DEFAULT NULL,
  `ad_Faxn` int(12) DEFAULT NULL,
  `ad_email` varchar(50) DEFAULT NULL,
  `ad_sm_id` int(10) unsigned DEFAULT NULL,
  `ad_desc` char(6) DEFAULT NULL,
  PRIMARY KEY (`sup_ad_id`),
  KEY `fk_sup_add_country_id` (`ad_country_id`),
  KEY `fk_sup_add_state_id` (`ad_state_id`),
  KEY `fk_sup_add_sup_id` (`ad_sm_id`),
  CONSTRAINT `fk_sup_add_country_id` FOREIGN KEY (`ad_country_id`) REFERENCES `countrymaster` (`Country_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_sup_add_state_id` FOREIGN KEY (`ad_state_id`) REFERENCES `statemaster` (`State_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_sup_add_sup_id` FOREIGN KEY (`ad_sm_id`) REFERENCES `suppliermaster` (`SM_Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_address`
--

LOCK TABLES `supplier_address` WRITE;
/*!40000 ALTER TABLE `supplier_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliermaster`
--

DROP TABLE IF EXISTS `suppliermaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliermaster` (
  `SM_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SM_IM_Id` smallint(5) unsigned NOT NULL,
  `SM_Name` varchar(50) NOT NULL,
  `SM_Supplier_Type` int(10) unsigned DEFAULT NULL,
  `SM_Ownership_Type` int(10) unsigned DEFAULT NULL,
  `SM_Deals_With` varchar(200) DEFAULT NULL,
  `SM_Year_Establishment` date DEFAULT NULL,
  `SM_PAN_No` varchar(15) DEFAULT NULL,
  `SM_TAN_No` varchar(15) DEFAULT NULL,
  `SM_STATE_ST_VAT_RGN_NO` varchar(15) DEFAULT NULL,
  `SM_CEN_ST_VAT_RGN_NO` varchar(15) DEFAULT NULL,
  `SM_ED_RGN_NO` varchar(15) DEFAULT NULL,
  `SM_ECC_CODE` varchar(15) DEFAULT NULL,
  `SM_ENTREPRENURE_MEM_NO` varchar(15) DEFAULT NULL,
  `SM_REG_DATE` date NOT NULL,
  `SM_Remarks` varchar(100) DEFAULT NULL,
  `SM_CEO_OR_PROPRIETOR_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SM_Id`),
  UNIQUE KEY `SM_IM_ID_SM_Name_Unique` (`SM_IM_Id`,`SM_Name`),
  UNIQUE KEY `Unique_SM_IM_ID_SM_PAN_No` (`SM_IM_Id`,`SM_PAN_No`),
  UNIQUE KEY `Unique_SM_IM_ID_SM_TAN_No` (`SM_IM_Id`,`SM_TAN_No`),
  KEY `FK_SMST_ERPMGM_EGM_ID` (`SM_Supplier_Type`),
  KEY `FK_SMOT_ERPMGM_EGM_ID` (`SM_Ownership_Type`),
  CONSTRAINT `FK_IMID_IM_IM_ID` FOREIGN KEY (`SM_IM_Id`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SMOT_ERPMGM_EGM_ID` FOREIGN KEY (`SM_Ownership_Type`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SMST_ERPMGM_EGM_ID` FOREIGN KEY (`SM_Supplier_Type`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliermaster`
--

LOCK TABLES `suppliermaster` WRITE;
/*!40000 ALTER TABLE `suppliermaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliermaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplierregistrationauthority`
--

DROP TABLE IF EXISTS `supplierregistrationauthority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplierregistrationauthority` (
  `SRA_ID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `SRA_IM_ID` smallint(3) unsigned NOT NULL,
  `SRA_SIM_ID` mediumint(3) unsigned NOT NULL,
  `SRA_DM_ID` mediumint(5) unsigned NOT NULL,
  `SRA_Name` varchar(50) NOT NULL,
  `SRA_Designation` varchar(50) NOT NULL,
  `SRA_EMail` varchar(100) NOT NULL,
  `SRA_Office_Number` varchar(10) NOT NULL,
  PRIMARY KEY (`SRA_ID`),
  KEY `FK_SRA_InstitutionMaster_IM_ID` (`SRA_IM_ID`),
  KEY `FK_SRA_SubInstitutionMaster_SIM_ID` (`SRA_SIM_ID`),
  KEY `FK_SRA_DepartmentMaster_DM_ID` (`SRA_DM_ID`),
  CONSTRAINT `FK_SRA_DepartmentMaster_DM_ID` FOREIGN KEY (`SRA_DM_ID`) REFERENCES `departmentmaster` (`DM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SRA_InstitutionMaster_IM_ID` FOREIGN KEY (`SRA_IM_ID`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SRA_SubInstitutionMaster_SIM_ID` FOREIGN KEY (`SRA_SIM_ID`) REFERENCES `subinstitutionmaster` (`sim_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplierregistrationauthority`
--

LOCK TABLES `supplierregistrationauthority` WRITE;
/*!40000 ALTER TABLE `supplierregistrationauthority` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplierregistrationauthority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplierregistrationcategory`
--

DROP TABLE IF EXISTS `supplierregistrationcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplierregistrationcategory` (
  `SRC_ID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `SRC_Name` varchar(200) NOT NULL,
  `SRC_Remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`SRC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplierregistrationcategory`
--

LOCK TABLES `supplierregistrationcategory` WRITE;
/*!40000 ALTER TABLE `supplierregistrationcategory` DISABLE KEYS */;
INSERT INTO `supplierregistrationcategory` VALUES (1,'Manufacturers, who supply indigenous items','MANUAL ON POLICIES AND PROCEDURES FOR PURCHASE OF GOODS, 2006 Section 5.5'),(2,'Agents/ Distributors of such manufacturers, who desire to market their production only through their agents','MANUAL ON POLICIES AND PROCEDURES FOR PURCHASE OF GOODS, 2006 Section 5.5'),(3,'Foreign manufacturer with / without their accredited agents agent in India','MANUAL ON POLICIES AND PROCEDURES FOR PURCHASE OF GOODS, 2006 Section 5.5'),(4,'Stockiest of imported spares or other specified items','MANUAL ON POLICIES AND PROCEDURES FOR PURCHASE OF GOODS, 2006 Section 5.5'),(5,'Supplier of imported goods as are having regular arrangement with foreign manufacturers','MANUAL ON POLICIES AND PROCEDURES FOR PURCHASE OF GOODS, 2006 Section 5.5');
/*!40000 ALTER TABLE `supplierregistrationcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_message`
--

DROP TABLE IF EXISTS `user_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_message` (
  `um_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UM_FROM_ERPMU_ID` mediumint(9) unsigned DEFAULT NULL,
  `UM_TO_ERPMU_ID` mediumint(9) unsigned DEFAULT NULL,
  `UM_MESSAGE` varchar(100) DEFAULT NULL,
  `um_action_name` varchar(200) DEFAULT NULL,
  `UM_REQUEST_SUBMISSION_DATE` date DEFAULT NULL,
  `um_status` int(10) unsigned DEFAULT '42',
  `UM_REQ_TYPE` varchar(100) DEFAULT NULL,
  `UM_REQ_TYPE_ID` smallint(5) unsigned DEFAULT NULL,
  `UM_MSG_ID` int(10) unsigned DEFAULT NULL,
  `UM_Action_Date` date DEFAULT NULL,
  PRIMARY KEY (`um_id`),
  KEY `FK_UM_FROM_ERPMU_IDERPMU_ID` (`UM_FROM_ERPMU_ID`),
  KEY `FK_UM_TO_ERPMU_IDERPMU_ID` (`UM_TO_ERPMU_ID`),
  KEY `FK_UM_STATUS_ERPMGM_EGM_ID` (`um_status`),
  CONSTRAINT `FK_UM_FROM_ERPMU_IDERPMU_ID` FOREIGN KEY (`UM_FROM_ERPMU_ID`) REFERENCES `erpmusers` (`ERPMU_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_UM_STATUS_ERPMGM` FOREIGN KEY (`um_status`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_UM_TO_ERPMU_IDERPMU_ID` FOREIGN KEY (`UM_TO_ERPMU_ID`) REFERENCES `erpmusers` (`ERPMU_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_message`
--

LOCK TABLES `user_message` WRITE;
/*!40000 ALTER TABLE `user_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userprivileges`
--

DROP TABLE IF EXISTS `userprivileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userprivileges` (
  `RP_ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `RP_ERPMP_ID` smallint(6) NOT NULL,
  `RP_UR_ID` tinyint(3) unsigned NOT NULL,
  `RP_Can_Add` enum('0','1') NOT NULL DEFAULT '0',
  `RP_Can_Delete` enum('1','0') DEFAULT '0',
  `RP_Can_Edit` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`RP_ID`),
  KEY `FK_UP_ERPMProgram_ERPMP_ID` (`RP_ERPMP_ID`),
  CONSTRAINT `FK_UP_ERPMProgram_ERPMP_ID` FOREIGN KEY (`RP_ERPMP_ID`) REFERENCES `erpmprogram` (`ERPMP_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprivileges`
--

LOCK TABLES `userprivileges` WRITE;
/*!40000 ALTER TABLE `userprivileges` DISABLE KEYS */;
/*!40000 ALTER TABLE `userprivileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_issue_indent_detail`
--

DROP TABLE IF EXISTS `view_issue_indent_detail`;
/*!50001 DROP VIEW IF EXISTS `view_issue_indent_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_issue_indent_detail` (
  `ISD_ID` int(10) unsigned,
  `ISD_Item_ID` int(10) unsigned,
  `Indent_quantity` smallint(5),
  `Indent_Approved_Quantity` smallint(5),
  `ISD_Issued_Quantity` decimal(8,2),
  `ISM_ID` int(10) unsigned,
  `Item_Brief_Desc` varchar(500)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_issue_item_details`
--

DROP TABLE IF EXISTS `view_issue_item_details`;
/*!50001 DROP VIEW IF EXISTS `view_issue_item_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_issue_item_details` (
  `Item_ID` int(10) unsigned,
  `Item_Brief_Desc` varchar(500),
  `UOP` int(10) unsigned,
  `erpm_issue_master_ISM_ID` int(10) unsigned,
  `IM_ID` smallint(5) unsigned,
  `SIM_ID` mediumint(5) unsigned,
  `DM_ID` mediumint(5) unsigned,
  `SM_ID` int(1),
  `From_Emp_ID` int(10) unsigned,
  `Issue_No` varchar(20),
  `Dated` date,
  `Issue_Desc` varchar(100),
  `To_IM_ID` smallint(5) unsigned,
  `To_SIM_ID` mediumint(5) unsigned,
  `To_DM_ID` mediumint(5) unsigned,
  `To_Emp_ID` int(5) unsigned,
  `To_Committee_ID` int(11) unsigned,
  `To_Supplier_ID` int(10) unsigned,
  `Issue_Quantity` decimal(8,2),
  `Recd_Quantity` int(1),
  `UOP_Name` varchar(50),
  `employeemaster_EMP_FName` varchar(20),
  `employeemaster_EMP_MName` varchar(30),
  `employeemaster_EMP_LName` varchar(30),
  `Supplier_Name` varchar(50),
  `Committee_Name` varchar(100)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_issue_item_details_st`
--

DROP TABLE IF EXISTS `view_issue_item_details_st`;
/*!50001 DROP VIEW IF EXISTS `view_issue_item_details_st`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_issue_item_details_st` (
  `Item_ID` int(10) unsigned,
  `Item_Brief_Desc` varchar(500),
  `UOP` int(10) unsigned,
  `ISM_ID` int(10) unsigned,
  `IM_ID` smallint(5) unsigned,
  `SIM_ID` mediumint(5) unsigned,
  `DM_ID` mediumint(5) unsigned,
  `SM_ID` int(1),
  `From_Emp_ID` int(10) unsigned,
  `Issue_No` varchar(20),
  `Dated` date,
  `Issue_Desc` varchar(100),
  `To_IM_ID` smallint(5) unsigned,
  `To_SIM_ID` mediumint(5) unsigned,
  `To_DM_ID` mediumint(5) unsigned,
  `To_Emp_ID` int(5) unsigned,
  `To_Committee_ID` int(11) unsigned,
  `To_Supplier_ID` int(10) unsigned,
  `Issue_Quantity` decimal(8,2),
  `Recd_Quantity` int(1),
  `Write-Off_Quantity` int(1),
  `UOP_Name` varchar(50),
  `EMP_FName` varchar(20),
  `EMP_MName` varchar(30),
  `EMP_LName` varchar(30),
  `Supplier_Name` varchar(50),
  `Committee_Name` varchar(100)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_issue_item_details_wo`
--

DROP TABLE IF EXISTS `view_issue_item_details_wo`;
/*!50001 DROP VIEW IF EXISTS `view_issue_item_details_wo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_issue_item_details_wo` (
  `Item_ID` int(10) unsigned,
  `Item_Brief_Desc` varchar(500),
  `UOP` int(10) unsigned,
  `ISM_ID` int(10) unsigned,
  `IM_ID` smallint(5) unsigned,
  `SIM_ID` mediumint(5) unsigned,
  `DM_ID` mediumint(5) unsigned,
  `SM_ID` int(1),
  `From_Emp_ID` int(10) unsigned,
  `Issue_No` varchar(20),
  `Dated` date,
  `Issue_Desc` varchar(100),
  `To_IM_ID` smallint(5) unsigned,
  `To_SIM_ID` mediumint(5) unsigned,
  `To_DM_ID` mediumint(5) unsigned,
  `To_Emp_ID` int(5) unsigned,
  `To_Committee_ID` int(11) unsigned,
  `To_Supplier_ID` int(10) unsigned,
  `Issue_Quantity` int(1),
  `Recd_Quantity` int(1),
  `Write-Off_Quantity` decimal(8,2),
  `UOP_Name` varchar(50),
  `EMP_FName` varchar(20),
  `EMP_MName` varchar(30),
  `EMP_LName` varchar(30),
  `Supplier_Name` varchar(50),
  `Committee_Name` varchar(100)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_issue_serial_detail`
--

DROP TABLE IF EXISTS `view_issue_serial_detail`;
/*!50001 DROP VIEW IF EXISTS `view_issue_serial_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_issue_serial_detail` (
  `ISD_ID` int(10) unsigned,
  `ISD_ISM_ID` int(10) unsigned,
  `ISD_Item_ID` int(10) unsigned,
  `ISD_Issued_Quantity` decimal(8,2),
  `ISD_Received_Quantity` decimal(8,2),
  `ISD_Returned_Quantity` decimal(8,2),
  `ISSD_ID` bigint(11),
  `ISSD_ISD_ID` decimal(11,0),
  `ISSD_Stock_Serial_ID` decimal(11,0),
  `ISSD_Received` int(4),
  `ISSD_Returned` int(4),
  `ST_Stock_Serial_No` varchar(30),
  `Display_Quantity` decimal(8,2),
  `ERPMIM_Item_Brief_Desc` varchar(500),
  `ERPMIM_Serial_No_Applicable` char(1),
  `ISM_Issue_No` varchar(20),
  `IM_Short_Name` varchar(10),
  `SIM_Short_Name` varchar(10),
  `DM_Short_Name` varchar(10),
  `Serial_Code` varchar(46)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_item_ledger`
--

DROP TABLE IF EXISTS `view_item_ledger`;
/*!50001 DROP VIEW IF EXISTS `view_item_ledger`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_item_ledger` (
  `IM_ID` smallint(6) unsigned,
  `SIM_ID` mediumint(8) unsigned,
  `DM_ID` mediumint(8) unsigned,
  `Supplier_Name` varchar(50),
  `Issue_Id` bigint(11),
  `Issue_No` varchar(20),
  `Dated` date,
  `Invoice_No` varchar(20),
  `Invoice_Date` date,
  `Item_ID` int(11) unsigned,
  `Item_Brief_Desc` varchar(500),
  `Issue_Quantity` decimal(12,2),
  `Recd_Quantity` decimal(32,2),
  `WriteOff_Quantity` decimal(12,2),
  `ST_Unit_Rate` decimal(18,2),
  `ST_Depriciated_Value` decimal(18,2),
  `ST_Depriciation_Calc_Date` varbinary(10)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_stock_item_details`
--

DROP TABLE IF EXISTS `view_stock_item_details`;
/*!50001 DROP VIEW IF EXISTS `view_stock_item_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_stock_item_details` (
  `Item_ID` int(10) unsigned,
  `Item_Brief_Desc` varchar(500),
  `UOP` int(10) unsigned,
  `UOP_Name` varchar(50),
  `Supplier_Name` varchar(50),
  `IM_ID` smallint(5) unsigned,
  `SIM_ID` mediumint(5) unsigned,
  `DM_ID` mediumint(5) unsigned,
  `SM_ID` int(10) unsigned,
  `Invoice_No` varchar(20),
  `Invoice_Date` date,
  `Dated` date,
  `Issue_Quantity` int(1),
  `Recd_Quantity` decimal(32,2),
  `Write-Off_Quantity` int(1),
  `ST_Unit_Rate` decimal(8,2),
  `ST_Depriciated_Value` decimal(10,2),
  `ST_Depriciation_Calc_Date` date
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_stock_received`
--

DROP TABLE IF EXISTS `view_stock_received`;
/*!50001 DROP VIEW IF EXISTS `view_stock_received`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_stock_received` (
  `ST_ID` int(10) unsigned,
  `ST_IM_ID` smallint(5) unsigned,
  `IM_Short_Name` varchar(10),
  `ST_SIM_ID` mediumint(5) unsigned,
  `SIM_Short_Name` varchar(10),
  `ST_DM_ID` mediumint(5) unsigned,
  `DM_Short_Name` varchar(10),
  `ST_SM_ID` int(10) unsigned,
  `SM_Name` varchar(50),
  `ST_Item_ID` int(10) unsigned,
  `ST_In_Stock_Since` date,
  `ST_Challan_Det_ID` int(10) unsigned,
  `ST_PO_No` varchar(20),
  `ST_PO_Date` date,
  `ST_Challan_No` varchar(20),
  `ST_Challan_Date` date,
  `ST_Invoice_No` varchar(20),
  `ST_Invoice_Date` date,
  `ST_Quantity` decimal(10,2),
  `ST_Unit_Rate` decimal(8,2),
  `ST_Tax_Value` decimal(8,2),
  `ST_CSR_No` varchar(20),
  `ST_CSR_PgNo` int(10) unsigned,
  `ST_DeptSR_No` varchar(20),
  `ST_DeptSR_PgNo` int(10) unsigned,
  `ST_Product_No` varchar(30),
  `ST_Stock_Serial_No` varchar(30),
  `ST_Warranty_Expiry_Date` date,
  `ST_Warranty_Type_ID` int(10) unsigned,
  `Serial_Code` varchar(76)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_stock_register`
--

DROP TABLE IF EXISTS `view_stock_register`;
/*!50001 DROP VIEW IF EXISTS `view_stock_register`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_stock_register` (
  `IM_ID` smallint(6) unsigned,
  `SIM_ID` mediumint(8) unsigned,
  `DM_ID` mediumint(8) unsigned,
  `Item_ID` int(11) unsigned,
  `Item_Brief_Desc` varchar(500),
  `Opening_Qty` decimal(56,2),
  `Opening_Value` decimal(58,4),
  `Stock_Added_Qty` decimal(54,2),
  `Stock_Added_Value` decimal(65,4),
  `Write_Off_Qty` decimal(34,2),
  `Write_Off_Value` decimal(52,4),
  `Stock_Transfered_Qty` decimal(34,2),
  `Stock_Transfered_Value` decimal(52,4)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `workflowactions`
--

DROP TABLE IF EXISTS `workflowactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowactions` (
  `WFA_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `WFA_WFD_Id` int(10) unsigned NOT NULL,
  `WFA_EGM_Action_Id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`WFA_Id`),
  KEY `FK_WFA_WFD_Id` (`WFA_WFD_Id`),
  KEY `FK_WFA_EGM_Action_Id` (`WFA_EGM_Action_Id`),
  CONSTRAINT `FK_WFA_EGM_Action_Id` FOREIGN KEY (`WFA_EGM_Action_Id`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_WFA_WFD_Id` FOREIGN KEY (`WFA_WFD_Id`) REFERENCES `workflowdetail` (`WFD_Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowactions`
--

LOCK TABLES `workflowactions` WRITE;
/*!40000 ALTER TABLE `workflowactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflowactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowdetail`
--

DROP TABLE IF EXISTS `workflowdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowdetail` (
  `WFD_Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '	',
  `WFD_WFM_Id` int(10) unsigned DEFAULT NULL,
  `WFD_Stage` int(11) NOT NULL,
  `WFD_Source_Committee` int(11) unsigned DEFAULT NULL,
  `WFD_Destination_Committee` int(11) unsigned DEFAULT NULL,
  `WFD_Forward` tinyint(1) DEFAULT NULL,
  `WFD_Send_Back` tinyint(1) DEFAULT NULL,
  `WFD_Recommend_Approval` tinyint(1) DEFAULT NULL,
  `WFD_Recommend_Reject` tinyint(1) DEFAULT NULL,
  `WFD_Approve` tinyint(1) DEFAULT NULL,
  `WFD_Reject` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`WFD_Id`),
  KEY `FK_WFD_WFM_Id` (`WFD_WFM_Id`),
  KEY `FK_WFD_Source_Committee_CM_ID` (`WFD_Source_Committee`),
  KEY `WFD_Destination_Committee` (`WFD_Destination_Committee`),
  CONSTRAINT `FK_WFD_Source_Committee_CM_ID` FOREIGN KEY (`WFD_Source_Committee`) REFERENCES `committeemaster` (`Committee_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_WFD_WFM_Id` FOREIGN KEY (`WFD_WFM_Id`) REFERENCES `workflowmaster` (`WFM_Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `WFD_Destination_Committee` FOREIGN KEY (`WFD_Destination_Committee`) REFERENCES `committeemaster` (`Committee_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowdetail`
--

LOCK TABLES `workflowdetail` WRITE;
/*!40000 ALTER TABLE `workflowdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflowdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowmaster`
--

DROP TABLE IF EXISTS `workflowmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowmaster` (
  `WFM_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `WFM_Name` varchar(100) NOT NULL,
  `WFM_Institution` smallint(5) unsigned DEFAULT NULL,
  `WFM_Sub_Institution` mediumint(5) unsigned DEFAULT NULL,
  `WFM_Depaartment` mediumint(5) unsigned DEFAULT NULL,
  `WFM_EGM_ID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`WFM_Id`),
  KEY `FK_WFM_Institution_ImId` (`WFM_Institution`),
  KEY `FK_WFM_Sub_Institution` (`WFM_Sub_Institution`),
  KEY `FK_WFM_Depaartment` (`WFM_Depaartment`),
  KEY `FK_WFM_EGM` (`WFM_EGM_ID`),
  CONSTRAINT `FK_WFM_Depaartment` FOREIGN KEY (`WFM_Depaartment`) REFERENCES `departmentmaster` (`DM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_WFM_EGM` FOREIGN KEY (`WFM_EGM_ID`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_WFM_Institution_ImId` FOREIGN KEY (`WFM_Institution`) REFERENCES `institutionmaster` (`IM_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_WFM_Sub_Institution` FOREIGN KEY (`WFM_Sub_Institution`) REFERENCES `subinstitutionmaster` (`sim_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowmaster`
--

LOCK TABLES `workflowmaster` WRITE;
/*!40000 ALTER TABLE `workflowmaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflowmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowtransaction`
--

DROP TABLE IF EXISTS `workflowtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowtransaction` (
  `WFT_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `WFT_Date` datetime NOT NULL,
  `WFT_WFM_Id` int(10) unsigned NOT NULL,
  `WFT_Source_Id` int(11) unsigned DEFAULT NULL,
  `WFT_Destination_Id` int(11) unsigned DEFAULT NULL,
  `WFT_Work_Id` int(10) NOT NULL,
  `WFT_Stage` int(10) unsigned DEFAULT NULL,
  `WFT_Destination_Email` varchar(45) DEFAULT NULL,
  `WFT_Action_Taken` int(10) unsigned DEFAULT NULL,
  `WFT_Action_Remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`WFT_Id`),
  KEY `FK_WFT_WFM_Id` (`WFT_WFM_Id`),
  KEY `FK_WFT_Source_Id` (`WFT_Source_Id`),
  KEY `FK_WFT_Destination_Id` (`WFT_Destination_Id`),
  KEY `FK_WFT_ACTION_TAKEN_ERPMGM_EGM_ID` (`WFT_Action_Taken`),
  CONSTRAINT `FK_WFT_ACTION_TAKEN_ERPMGM_EGM_ID` FOREIGN KEY (`WFT_Action_Taken`) REFERENCES `erpm_gen_master` (`ERPMGM_EGM_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_WFT_Destination_Id` FOREIGN KEY (`WFT_Destination_Id`) REFERENCES `committeemaster` (`Committee_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_WFT_Source_Id` FOREIGN KEY (`WFT_Source_Id`) REFERENCES `committeemaster` (`Committee_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_WFT_WFM_Id` FOREIGN KEY (`WFT_WFM_Id`) REFERENCES `workflowmaster` (`WFM_Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowtransaction`
--

LOCK TABLES `workflowtransaction` WRITE;
/*!40000 ALTER TABLE `workflowtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflowtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pico_basic'
--

--
-- Dumping routines for database 'pico_basic'
--
/*!50003 DROP PROCEDURE IF EXISTS `copy_genericroleprivileges` */;
ALTER DATABASE `pico` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `copy_genericroleprivileges`(GUR_ID tinyint, IUR_ID mediumint, IM_ID smallint)
BEGIN




DECLARE done INT DEFAULT 0;




DECLARE var_GUP_ID smallint(6);




DECLARE var_GUP_ERPMM_ID tinyint(3);




DECLARE var_GUP_ERPMP_ID smallint(6);




DECLARE var_GUP_GUR_ID tinyint(3);




DECLARE var_GUP_Can_Add enum('0','1');




DECLARE var_GUP_Can_Delete enum('1','0');




DECLARE var_GUP_Can_Edit enum('0','1');




DECLARE var_GUP_Can_View enum('0','1');









 




DECLARE GRP CURSOR FOR Select * from genericroleprivileges where gup_gur_id = GUR_ID and




            gup_erpmp_id not in (select iup_erpmp_id from institutionroleprivileges where iup_iur_id = IUR_ID);









DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;









  OPEN GRP ;




    REPEAT




        FETCH GRP INTO  var_GUP_ID, var_GUP_ERPMM_ID, var_GUP_ERPMP_ID, var_GUP_GUR_ID, var_GUP_Can_Add,




                    var_GUP_Can_Delete, var_GUP_Can_Edit, var_GUP_Can_View;




        IF NOT done THEN




          insert into institutionroleprivileges (IUP_ERPM_ID, IUP_ERPMP_ID, IUP_IUR_ID, IUP_Can_Add, IUP_Can_Delete, IUP_Can_Edit,




            IUP_Can_View, IUP_IM_ID)




            values




        (var_GUP_ERPMM_ID, var_GUP_ERPMP_ID, IUR_ID, var_GUP_Can_Add, var_GUP_Can_Delete, var_GUP_Can_Edit, var_GUP_Can_View, IM_ID);




        END IF;




  UNTIL done END REPEAT;




  CLOSE GRP ;




END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `pico` CHARACTER SET utf8 COLLATE utf8_general_ci ;

--
-- Final view structure for view `view_issue_indent_detail`
--

/*!50001 DROP TABLE IF EXISTS `view_issue_indent_detail`*/;
/*!50001 DROP VIEW IF EXISTS `view_issue_indent_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_issue_indent_detail` AS select `erpm_issue_detail`.`ISD_ID` AS `ISD_ID`,`erpm_issue_detail`.`ISD_Item_ID` AS `ISD_Item_ID`,`erpm_indent_detail`.`Indt_quantity` AS `Indent_quantity`,`erpm_indent_detail`.`Indt_Approved_Quantity` AS `Indent_Approved_Quantity`,`erpm_issue_detail`.`ISD_Issued_Quantity` AS `ISD_Issued_Quantity`,`erpm_issue_detail`.`ISD_ISM_ID` AS `ISM_ID`,`erpm_item_master`.`ERPMIM_Item_Brief_Desc` AS `Item_Brief_Desc` from (((`erpm_issue_master` join `erpm_issue_detail` on((`erpm_issue_master`.`ISM_ID` = `erpm_issue_detail`.`ISD_ISM_ID`))) join `erpm_indent_detail` on(((`erpm_issue_master`.`ISM_Against_Indent_ID` = `erpm_indent_detail`.`Indt_indt_mst_Indent_Id`) and (`erpm_indent_detail`.`Indt_Item_Id` = `erpm_issue_detail`.`ISD_Item_ID`)))) join `erpm_item_master` on(((`erpm_indent_detail`.`Indt_Item_Id` = `erpm_item_master`.`ERPMIM_ID`) and (`erpm_item_master`.`ERPMIM_ID` = `erpm_issue_detail`.`ISD_Item_ID`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_issue_item_details`
--

/*!50001 DROP TABLE IF EXISTS `view_issue_item_details`*/;
/*!50001 DROP VIEW IF EXISTS `view_issue_item_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_issue_item_details` AS select `erpm_item_master`.`ERPMIM_ID` AS `Item_ID`,`erpm_item_master`.`ERPMIM_Item_Brief_Desc` AS `Item_Brief_Desc`,`erpm_item_master`.`ERPMIM_UOP` AS `UOP`,`erpm_issue_master`.`ISM_ID` AS `erpm_issue_master_ISM_ID`,`erpm_issue_master`.`ISM_From_Institute_ID` AS `IM_ID`,`erpm_issue_master`.`ISM_From_Subinstitute_ID` AS `SIM_ID`,`erpm_issue_master`.`ISM_From_Department_ID` AS `DM_ID`,0 AS `SM_ID`,`erpm_issue_master`.`ISM_From_Employee_ID` AS `From_Emp_ID`,`erpm_issue_master`.`ISM_Issue_No` AS `Issue_No`,`erpm_issue_master`.`ISM_Issue_Date` AS `Dated`,`erpm_issue_master`.`ISM_Issue_Desc` AS `Issue_Desc`,`erpm_issue_master`.`ISM_To_Institute_ID` AS `To_IM_ID`,`erpm_issue_master`.`ISM_To_Subinstitute_ID` AS `To_SIM_ID`,`erpm_issue_master`.`ISM_To_Department_ID` AS `To_DM_ID`,`erpm_issue_master`.`ISM_To_Employee_ID` AS `To_Emp_ID`,`erpm_issue_master`.`ISM_To_Committee_ID` AS `To_Committee_ID`,`erpm_issue_master`.`ISM_To_Supplier_ID` AS `To_Supplier_ID`,`erpm_issue_detail`.`ISD_Issued_Quantity` AS `Issue_Quantity`,0 AS `Recd_Quantity`,`erpm_gen_master`.`ERPMGM_EGM_DESC` AS `UOP_Name`,`employeemaster`.`EMP_FName` AS `employeemaster_EMP_FName`,`employeemaster`.`EMP_MName` AS `employeemaster_EMP_MName`,`employeemaster`.`EMP_LName` AS `employeemaster_EMP_LName`,`suppliermaster`.`SM_Name` AS `Supplier_Name`,`committeemaster`.`Committee_Name` AS `Committee_Name` from ((((((`erpm_issue_master` join `erpm_issue_detail` on((`erpm_issue_master`.`ISM_ID` = `erpm_issue_detail`.`ISD_ISM_ID`))) join `erpm_item_master` on((`erpm_issue_detail`.`ISD_Item_ID` = `erpm_item_master`.`ERPMIM_ID`))) join `erpm_gen_master` on((`erpm_item_master`.`ERPMIM_UOP` = `erpm_gen_master`.`ERPMGM_EGM_ID`))) left join `employeemaster` on((`erpm_issue_master`.`ISM_To_Employee_ID` = `employeemaster`.`EMP_ID`))) left join `suppliermaster` on((`erpm_issue_master`.`ISM_To_Supplier_ID` = `suppliermaster`.`SM_Id`))) left join `committeemaster` on((`erpm_issue_master`.`ISM_To_Committee_ID` = `committeemaster`.`Committee_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_issue_item_details_st`
--

/*!50001 DROP TABLE IF EXISTS `view_issue_item_details_st`*/;
/*!50001 DROP VIEW IF EXISTS `view_issue_item_details_st`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_issue_item_details_st` AS select `erpm_item_master`.`ERPMIM_ID` AS `Item_ID`,`erpm_item_master`.`ERPMIM_Item_Brief_Desc` AS `Item_Brief_Desc`,`erpm_item_master`.`ERPMIM_UOP` AS `UOP`,`erpm_issue_master`.`ISM_ID` AS `ISM_ID`,`erpm_issue_master`.`ISM_From_Institute_ID` AS `IM_ID`,`erpm_issue_master`.`ISM_From_Subinstitute_ID` AS `SIM_ID`,`erpm_issue_master`.`ISM_From_Department_ID` AS `DM_ID`,0 AS `SM_ID`,`erpm_issue_master`.`ISM_From_Employee_ID` AS `From_Emp_ID`,`erpm_issue_master`.`ISM_Issue_No` AS `Issue_No`,`erpm_issue_master`.`ISM_Issue_Date` AS `Dated`,`erpm_issue_master`.`ISM_Issue_Desc` AS `Issue_Desc`,`erpm_issue_master`.`ISM_To_Institute_ID` AS `To_IM_ID`,`erpm_issue_master`.`ISM_To_Subinstitute_ID` AS `To_SIM_ID`,`erpm_issue_master`.`ISM_To_Department_ID` AS `To_DM_ID`,`erpm_issue_master`.`ISM_To_Employee_ID` AS `To_Emp_ID`,`erpm_issue_master`.`ISM_To_Committee_ID` AS `To_Committee_ID`,`erpm_issue_master`.`ISM_To_Supplier_ID` AS `To_Supplier_ID`,`erpm_issue_detail`.`ISD_Issued_Quantity` AS `Issue_Quantity`,0 AS `Recd_Quantity`,0 AS `Write-Off_Quantity`,`erpm_gen_master`.`ERPMGM_EGM_DESC` AS `UOP_Name`,`employeemaster`.`EMP_FName` AS `EMP_FName`,`employeemaster`.`EMP_MName` AS `EMP_MName`,`employeemaster`.`EMP_LName` AS `EMP_LName`,`suppliermaster`.`SM_Name` AS `Supplier_Name`,`committeemaster`.`Committee_Name` AS `Committee_Name` from ((((((`erpm_issue_master` join `erpm_issue_detail` on((`erpm_issue_master`.`ISM_ID` = `erpm_issue_detail`.`ISD_ISM_ID`))) join `erpm_item_master` on((`erpm_issue_detail`.`ISD_Item_ID` = `erpm_item_master`.`ERPMIM_ID`))) join `erpm_gen_master` on((`erpm_item_master`.`ERPMIM_UOP` = `erpm_gen_master`.`ERPMGM_EGM_ID`))) left join `employeemaster` on((`erpm_issue_master`.`ISM_To_Employee_ID` = `employeemaster`.`EMP_ID`))) left join `suppliermaster` on((`erpm_issue_master`.`ISM_To_Supplier_ID` = `suppliermaster`.`SM_Id`))) left join `committeemaster` on((`erpm_issue_master`.`ISM_To_Committee_ID` = `committeemaster`.`Committee_ID`))) where (`erpm_issue_master`.`ISM_Issue_Type` = _utf8'S') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_issue_item_details_wo`
--

/*!50001 DROP TABLE IF EXISTS `view_issue_item_details_wo`*/;
/*!50001 DROP VIEW IF EXISTS `view_issue_item_details_wo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_issue_item_details_wo` AS select `erpm_item_master`.`ERPMIM_ID` AS `Item_ID`,`erpm_item_master`.`ERPMIM_Item_Brief_Desc` AS `Item_Brief_Desc`,`erpm_item_master`.`ERPMIM_UOP` AS `UOP`,`erpm_issue_master`.`ISM_ID` AS `ISM_ID`,`erpm_issue_master`.`ISM_From_Institute_ID` AS `IM_ID`,`erpm_issue_master`.`ISM_From_Subinstitute_ID` AS `SIM_ID`,`erpm_issue_master`.`ISM_From_Department_ID` AS `DM_ID`,0 AS `SM_ID`,`erpm_issue_master`.`ISM_From_Employee_ID` AS `From_Emp_ID`,`erpm_issue_master`.`ISM_Issue_No` AS `Issue_No`,`erpm_issue_master`.`ISM_Issue_Date` AS `Dated`,`erpm_issue_master`.`ISM_Issue_Desc` AS `Issue_Desc`,`erpm_issue_master`.`ISM_To_Institute_ID` AS `To_IM_ID`,`erpm_issue_master`.`ISM_To_Subinstitute_ID` AS `To_SIM_ID`,`erpm_issue_master`.`ISM_To_Department_ID` AS `To_DM_ID`,`erpm_issue_master`.`ISM_To_Employee_ID` AS `To_Emp_ID`,`erpm_issue_master`.`ISM_To_Committee_ID` AS `To_Committee_ID`,`erpm_issue_master`.`ISM_To_Supplier_ID` AS `To_Supplier_ID`,0 AS `Issue_Quantity`,0 AS `Recd_Quantity`,`erpm_issue_detail`.`ISD_Issued_Quantity` AS `Write-Off_Quantity`,`erpm_gen_master`.`ERPMGM_EGM_DESC` AS `UOP_Name`,`employeemaster`.`EMP_FName` AS `EMP_FName`,`employeemaster`.`EMP_MName` AS `EMP_MName`,`employeemaster`.`EMP_LName` AS `EMP_LName`,`suppliermaster`.`SM_Name` AS `Supplier_Name`,`committeemaster`.`Committee_Name` AS `Committee_Name` from ((((((`erpm_issue_master` join `erpm_issue_detail` on((`erpm_issue_master`.`ISM_ID` = `erpm_issue_detail`.`ISD_ISM_ID`))) join `erpm_item_master` on((`erpm_issue_detail`.`ISD_Item_ID` = `erpm_item_master`.`ERPMIM_ID`))) join `erpm_gen_master` on((`erpm_item_master`.`ERPMIM_UOP` = `erpm_gen_master`.`ERPMGM_EGM_ID`))) left join `employeemaster` on((`erpm_issue_master`.`ISM_To_Employee_ID` = `employeemaster`.`EMP_ID`))) left join `suppliermaster` on((`erpm_issue_master`.`ISM_To_Supplier_ID` = `suppliermaster`.`SM_Id`))) left join `committeemaster` on((`erpm_issue_master`.`ISM_To_Committee_ID` = `committeemaster`.`Committee_ID`))) where (`erpm_issue_master`.`ISM_Issue_Type` = _utf8'W') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_issue_serial_detail`
--

/*!50001 DROP TABLE IF EXISTS `view_issue_serial_detail`*/;
/*!50001 DROP VIEW IF EXISTS `view_issue_serial_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_issue_serial_detail` AS select `erpm_issue_detail`.`ISD_ID` AS `ISD_ID`,`erpm_issue_detail`.`ISD_ISM_ID` AS `ISD_ISM_ID`,`erpm_issue_detail`.`ISD_Item_ID` AS `ISD_Item_ID`,`erpm_issue_detail`.`ISD_Issued_Quantity` AS `ISD_Issued_Quantity`,`erpm_issue_detail`.`ISD_Received_Quantity` AS `ISD_Received_Quantity`,`erpm_issue_detail`.`ISD_Returned_Quantity` AS `ISD_Returned_Quantity`,if(isnull(`erpm_issue_serial_detail`.`ISSD_ID`),0,`erpm_issue_serial_detail`.`ISSD_ID`) AS `ISSD_ID`,if(isnull(`erpm_issue_serial_detail`.`ISSD_ISD_ID`),0,`erpm_issue_serial_detail`.`ISSD_ISD_ID`) AS `ISSD_ISD_ID`,if(isnull(`erpm_issue_serial_detail`.`ISSD_Stock_Serial_ID`),0,`erpm_issue_serial_detail`.`ISSD_Stock_Serial_ID`) AS `ISSD_Stock_Serial_ID`,if(isnull(`erpm_issue_serial_detail`.`ISSD_Received`),0,`erpm_issue_serial_detail`.`ISSD_Received`) AS `ISSD_Received`,if(isnull(`erpm_issue_serial_detail`.`ISSD_Returned`),0,`erpm_issue_serial_detail`.`ISSD_Returned`) AS `ISSD_Returned`,if(isnull(`erpm_stock_received`.`ST_Stock_Serial_No`),0,`erpm_stock_received`.`ST_Stock_Serial_No`) AS `ST_Stock_Serial_No`,if((`erpm_item_master`.`ERPMIM_Serial_No_Applicable` = _utf8'Y'),if(isnull(`erpm_issue_serial_detail`.`ISSD_Received`),0,`erpm_issue_serial_detail`.`ISSD_Received`),`erpm_issue_detail`.`ISD_Received_Quantity`) AS `Display_Quantity`,`erpm_item_master`.`ERPMIM_Item_Brief_Desc` AS `ERPMIM_Item_Brief_Desc`,`erpm_item_master`.`ERPMIM_Serial_No_Applicable` AS `ERPMIM_Serial_No_Applicable`,`erpm_issue_master`.`ISM_Issue_No` AS `ISM_Issue_No`,`institutionmaster`.`IM_Short_Name` AS `IM_Short_Name`,`subinstitutionmaster`.`SIM_Short_Name` AS `SIM_Short_Name`,`departmentmaster`.`DM_Short_Name` AS `DM_Short_Name`,concat(`institutionmaster`.`IM_Short_Name`,_utf8'/',`subinstitutionmaster`.`SIM_Short_Name`,_utf8'/',`departmentmaster`.`DM_Short_Name`,_utf8'/',lpad(cast(`erpm_stock_received`.`ST_Item_ID` as char charset utf8),6,_utf8'0'),_utf8'/',lpad(cast(`erpm_stock_received`.`ST_Stock_Serial_No` as char charset utf8),6,_utf8'0')) AS `Serial_Code` from (((((((`erpm_issue_detail` left join `erpm_issue_master` on((`erpm_issue_master`.`ISM_ID` = `erpm_issue_detail`.`ISD_ISM_ID`))) left join `erpm_issue_serial_detail` on((`erpm_issue_detail`.`ISD_ID` = `erpm_issue_serial_detail`.`ISSD_ISD_ID`))) join `erpm_item_master` on((`erpm_issue_detail`.`ISD_Item_ID` = `erpm_item_master`.`ERPMIM_ID`))) left join `erpm_stock_received` on((`erpm_issue_serial_detail`.`ISSD_Stock_Serial_ID` = `erpm_stock_received`.`ST_ID`))) join `departmentmaster` on((`erpm_stock_received`.`ST_DM_ID` = `departmentmaster`.`DM_ID`))) join `institutionmaster` on((`erpm_stock_received`.`ST_IM_ID` = `institutionmaster`.`IM_ID`))) join `subinstitutionmaster` on((`erpm_stock_received`.`ST_SIM_ID` = `subinstitutionmaster`.`sim_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_item_ledger`
--

/*!50001 DROP TABLE IF EXISTS `view_item_ledger`*/;
/*!50001 DROP VIEW IF EXISTS `view_item_ledger`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_item_ledger` AS select `view_stock_item_details`.`IM_ID` AS `IM_ID`,`view_stock_item_details`.`SIM_ID` AS `SIM_ID`,`view_stock_item_details`.`DM_ID` AS `DM_ID`,`view_stock_item_details`.`Supplier_Name` AS `Supplier_Name`,0 AS `Issue_Id`,_utf8'' AS `Issue_No`,`view_stock_item_details`.`Dated` AS `Dated`,`view_stock_item_details`.`Invoice_No` AS `Invoice_No`,`view_stock_item_details`.`Invoice_Date` AS `Invoice_Date`,`view_stock_item_details`.`Item_ID` AS `Item_ID`,`view_stock_item_details`.`Item_Brief_Desc` AS `Item_Brief_Desc`,`view_stock_item_details`.`Issue_Quantity` AS `Issue_Quantity`,`view_stock_item_details`.`Recd_Quantity` AS `Recd_Quantity`,`view_stock_item_details`.`Write-Off_Quantity` AS `WriteOff_Quantity`,`view_stock_item_details`.`ST_Unit_Rate` AS `ST_Unit_Rate`,`view_stock_item_details`.`ST_Depriciated_Value` AS `ST_Depriciated_Value`,`view_stock_item_details`.`ST_Depriciation_Calc_Date` AS `ST_Depriciation_Calc_Date` from `view_stock_item_details` union select `view_issue_item_details_st`.`IM_ID` AS `IM_ID`,`view_issue_item_details_st`.`SIM_ID` AS `SIM_ID`,`view_issue_item_details_st`.`DM_ID` AS `DM_ID`,_utf8'' AS `Supplier_Name`,`view_issue_item_details_st`.`ISM_ID` AS `Issue_Id`,`view_issue_item_details_st`.`Issue_No` AS `Issue_No`,`view_issue_item_details_st`.`Dated` AS `Dated`,_utf8'' AS `Invoice_No`,NULL AS `Invoice_Date`,`view_issue_item_details_st`.`Item_ID` AS `Item_ID`,`view_issue_item_details_st`.`Item_Brief_Desc` AS `Item_Brief_Desc`,`view_issue_item_details_st`.`Issue_Quantity` AS `Issue_Quantity`,`view_issue_item_details_st`.`Recd_Quantity` AS `Recd_Quantity`,`view_issue_item_details_st`.`Write-Off_Quantity` AS `Write-Off_Quantity`,0 AS `ST_Unit_Rate`,0 AS `ST_Depriciated_Value`,_utf8'' AS `ST_Depriciation_Calc_Date` from `view_issue_item_details_st` union select `view_issue_item_details_wo`.`IM_ID` AS `IM_ID`,`view_issue_item_details_wo`.`SIM_ID` AS `SIM_ID`,`view_issue_item_details_wo`.`DM_ID` AS `DM_ID`,_utf8'' AS `Supplier_Name`,`view_issue_item_details_wo`.`ISM_ID` AS `Issue_Id`,`view_issue_item_details_wo`.`Issue_No` AS `Issue_No`,`view_issue_item_details_wo`.`Dated` AS `Dated`,_utf8'' AS `Invoice_No`,NULL AS `Invoice_Date`,`view_issue_item_details_wo`.`Item_ID` AS `Item_ID`,`view_issue_item_details_wo`.`Item_Brief_Desc` AS `Item_Brief_Desc`,`view_issue_item_details_wo`.`Issue_Quantity` AS `Issue_Quantity`,`view_issue_item_details_wo`.`Recd_Quantity` AS `Recd_Quantity`,`view_issue_item_details_wo`.`Write-Off_Quantity` AS `Write-Off_Quantity`,0 AS `ST_Unit_Rate`,0 AS `ST_Depriciated_Value`,_utf8'' AS `ST_Depriciation_Calc_Date` from `view_issue_item_details_wo` order by `Item_Brief_Desc`,`Dated`,`Recd_Quantity`,`Issue_Quantity` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_stock_item_details`
--

/*!50001 DROP TABLE IF EXISTS `view_stock_item_details`*/;
/*!50001 DROP VIEW IF EXISTS `view_stock_item_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_stock_item_details` AS select `erpm_item_master`.`ERPMIM_ID` AS `Item_ID`,`erpm_item_master`.`ERPMIM_Item_Brief_Desc` AS `Item_Brief_Desc`,`erpm_item_master`.`ERPMIM_UOP` AS `UOP`,`erpm_gen_master`.`ERPMGM_EGM_DESC` AS `UOP_Name`,`suppliermaster`.`SM_Name` AS `Supplier_Name`,`erpm_stock_received`.`ST_IM_ID` AS `IM_ID`,`erpm_stock_received`.`ST_SIM_ID` AS `SIM_ID`,`erpm_stock_received`.`ST_DM_ID` AS `DM_ID`,`erpm_stock_received`.`ST_SM_ID` AS `SM_ID`,`erpm_stock_received`.`ST_Invoice_No` AS `Invoice_No`,`erpm_stock_received`.`ST_Invoice_Date` AS `Invoice_Date`,`erpm_stock_received`.`ST_In_Stock_Since` AS `Dated`,0 AS `Issue_Quantity`,sum(`erpm_stock_received`.`ST_Quantity`) AS `Recd_Quantity`,0 AS `Write-Off_Quantity`,`erpm_stock_received`.`ST_Unit_Rate` AS `ST_Unit_Rate`,`erpm_stock_received`.`ST_Depriciated_Value` AS `ST_Depriciated_Value`,`erpm_stock_received`.`ST_Depriciation_Calc_Date` AS `ST_Depriciation_Calc_Date` from (((`erpm_item_master` join `erpm_gen_master` on((`erpm_item_master`.`ERPMIM_UOP` = `erpm_gen_master`.`ERPMGM_EGM_ID`))) join `erpm_stock_received` on((`erpm_item_master`.`ERPMIM_ID` = `erpm_stock_received`.`ST_Item_ID`))) left join `suppliermaster` on((`erpm_stock_received`.`ST_SM_ID` = `suppliermaster`.`SM_Id`))) group by `erpm_item_master`.`ERPMIM_ID`,`erpm_stock_received`.`ST_In_Stock_Since`,`erpm_stock_received`.`ST_IM_ID`,`erpm_stock_received`.`ST_SIM_ID`,`erpm_stock_received`.`ST_DM_ID`,`erpm_stock_received`.`ST_SM_ID`,`erpm_stock_received`.`ST_Unit_Rate`,`erpm_stock_received`.`ST_Depriciated_Value` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_stock_received`
--

/*!50001 DROP TABLE IF EXISTS `view_stock_received`*/;
/*!50001 DROP VIEW IF EXISTS `view_stock_received`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_stock_received` AS select `erpm_stock_received`.`ST_ID` AS `ST_ID`,`erpm_stock_received`.`ST_IM_ID` AS `ST_IM_ID`,`institutionmaster`.`IM_Short_Name` AS `IM_Short_Name`,`erpm_stock_received`.`ST_SIM_ID` AS `ST_SIM_ID`,`subinstitutionmaster`.`SIM_Short_Name` AS `SIM_Short_Name`,`erpm_stock_received`.`ST_DM_ID` AS `ST_DM_ID`,`departmentmaster`.`DM_Short_Name` AS `DM_Short_Name`,`erpm_stock_received`.`ST_SM_ID` AS `ST_SM_ID`,`suppliermaster`.`SM_Name` AS `SM_Name`,`erpm_stock_received`.`ST_Item_ID` AS `ST_Item_ID`,`erpm_stock_received`.`ST_In_Stock_Since` AS `ST_In_Stock_Since`,`erpm_stock_received`.`ST_Challan_Det_ID` AS `ST_Challan_Det_ID`,`erpm_stock_received`.`ST_PO_No` AS `ST_PO_No`,`erpm_stock_received`.`ST_PO_Date` AS `ST_PO_Date`,`erpm_stock_received`.`ST_Challan_No` AS `ST_Challan_No`,`erpm_stock_received`.`ST_Challan_Date` AS `ST_Challan_Date`,`erpm_stock_received`.`ST_Invoice_No` AS `ST_Invoice_No`,`erpm_stock_received`.`ST_Invoice_Date` AS `ST_Invoice_Date`,`erpm_stock_received`.`ST_Quantity` AS `ST_Quantity`,`erpm_stock_received`.`ST_Unit_Rate` AS `ST_Unit_Rate`,`erpm_stock_received`.`ST_Tax_Value` AS `ST_Tax_Value`,`erpm_stock_received`.`ST_CSR_No` AS `ST_CSR_No`,`erpm_stock_received`.`ST_CSR_PgNo` AS `ST_CSR_PgNo`,`erpm_stock_received`.`ST_DeptSR_No` AS `ST_DeptSR_No`,`erpm_stock_received`.`ST_DeptSR_PgNo` AS `ST_DeptSR_PgNo`,`erpm_stock_received`.`ST_Product_No` AS `ST_Product_No`,`erpm_stock_received`.`ST_Stock_Serial_No` AS `ST_Stock_Serial_No`,`erpm_stock_received`.`ST_Warranty_Expiry_Date` AS `ST_Warranty_Expiry_Date`,`erpm_stock_received`.`ST_Warranty_Type_ID` AS `ST_Warranty_Type_ID`,concat(`institutionmaster`.`IM_Short_Name`,_utf8'/',`subinstitutionmaster`.`SIM_Short_Name`,_utf8'/',convert(`departmentmaster`.`DM_Short_Name` using utf8),_utf8'/',lpad(cast(`erpm_stock_received`.`ST_Item_ID` as char charset utf8),6,_utf8'0'),_utf8'/',lpad(cast(`erpm_stock_received`.`ST_Stock_Serial_No` as char charset utf8),6,_utf8'0')) AS `Serial_Code` from ((((`erpm_stock_received` join `departmentmaster` on((`erpm_stock_received`.`ST_DM_ID` = `departmentmaster`.`DM_ID`))) join `institutionmaster` on((`erpm_stock_received`.`ST_IM_ID` = `institutionmaster`.`IM_ID`))) join `subinstitutionmaster` on((`erpm_stock_received`.`ST_SIM_ID` = `subinstitutionmaster`.`sim_id`))) join `suppliermaster` on((`erpm_stock_received`.`ST_SM_ID` = `suppliermaster`.`SM_Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_stock_register`
--

/*!50001 DROP TABLE IF EXISTS `view_stock_register`*/;
/*!50001 DROP VIEW IF EXISTS `view_stock_register`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_stock_register` AS select `view_item_ledger`.`IM_ID` AS `IM_ID`,`view_item_ledger`.`SIM_ID` AS `SIM_ID`,`view_item_ledger`.`DM_ID` AS `DM_ID`,`view_item_ledger`.`Item_ID` AS `Item_ID`,`view_item_ledger`.`Item_Brief_Desc` AS `Item_Brief_Desc`,sum(((`view_item_ledger`.`Recd_Quantity` - `view_item_ledger`.`Issue_Quantity`) - `view_item_ledger`.`WriteOff_Quantity`)) AS `Opening_Qty`,sum(((`view_item_ledger`.`Recd_Quantity` - `view_item_ledger`.`Issue_Quantity`) - (`view_item_ledger`.`WriteOff_Quantity` * `view_item_ledger`.`ST_Unit_Rate`))) AS `Opening_Value`,0 AS `Stock_Added_Qty`,0 AS `Stock_Added_Value`,0 AS `Write_Off_Qty`,0 AS `Write_Off_Value`,0 AS `Stock_Transfered_Qty`,0 AS `Stock_Transfered_Value` from `view_item_ledger` where (`view_item_ledger`.`Dated` < _utf8'2010-03-31') group by `view_item_ledger`.`IM_ID`,`view_item_ledger`.`SIM_ID`,`view_item_ledger`.`DM_ID`,`view_item_ledger`.`Item_ID` union select `view_item_ledger`.`IM_ID` AS `IM_ID`,`view_item_ledger`.`SIM_ID` AS `SIM_ID`,`view_item_ledger`.`DM_ID` AS `DM_ID`,`view_item_ledger`.`Item_ID` AS `Item_ID`,`view_item_ledger`.`Item_Brief_Desc` AS `Item_Brief_Desc`,0 AS `Opening_Qty`,0 AS `Opening_Value`,sum(`view_item_ledger`.`Recd_Quantity`) AS `Stock_Added_Qty`,sum((`view_item_ledger`.`Recd_Quantity` * `view_item_ledger`.`ST_Unit_Rate`)) AS `Stock_Added_Value`,sum(`view_item_ledger`.`WriteOff_Quantity`) AS `Write_Off_Qty`,sum((`view_item_ledger`.`WriteOff_Quantity` * `view_item_ledger`.`ST_Unit_Rate`)) AS `Write_Off_Value`,sum(`view_item_ledger`.`Issue_Quantity`) AS `Stock_Transfered_Qty`,sum((`view_item_ledger`.`Issue_Quantity` * `view_item_ledger`.`ST_Unit_Rate`)) AS `Stock_Transfered_Value` from `view_item_ledger` where (`view_item_ledger`.`Dated` >= _utf8'2010-03-31') group by `view_item_ledger`.`IM_ID`,`view_item_ledger`.`SIM_ID`,`view_item_ledger`.`DM_ID`,`view_item_ledger`.`Item_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-06 14:40:42
