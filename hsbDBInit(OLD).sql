-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hsbcyberstorm
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Current Database: `hsbcyberstorm`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `hsbcyberstorm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hsbcyberstorm`;

--
-- Temporary view structure for view `challenge_info`
--

DROP TABLE IF EXISTS `challenge_info`;
/*!50001 DROP VIEW IF EXISTS `challenge_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `challenge_info` AS SELECT 
 1 AS `Team Name`,
 1 AS `Challenge Name`,
 1 AS `Password`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `challenge_passwords`
--

DROP TABLE IF EXISTS `challenge_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `challenge_passwords` (
  `team_id` int(11) NOT NULL,
  `challenge_id` int(11) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`team_id`,`challenge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenge_passwords`
--

LOCK TABLES `challenge_passwords` WRITE;
/*!40000 ALTER TABLE `challenge_passwords` DISABLE KEYS */;
INSERT INTO `challenge_passwords` VALUES (1,0,'<empty>'),(1,1,'<empty>'),(1,2,'cbarbabuzpzrnheqjepdlti'),(1,3,'<empty>'),(2,0,'<empty>'),(2,1,'<empty>'),(2,2,'oosi'),(2,3,'<empty>'),(3,0,'<empty>'),(3,1,'<empty>'),(3,2,'ennwubqke'),(3,3,'<empty>');
/*!40000 ALTER TABLE `challenge_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenge_times`
--

DROP TABLE IF EXISTS `challenge_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `challenge_times` (
  `team_id` int(11) NOT NULL,
  `challenge_id` int(11) NOT NULL,
  `completion_time` datetime DEFAULT NULL,
  PRIMARY KEY (`team_id`,`challenge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenge_times`
--

LOCK TABLES `challenge_times` WRITE;
/*!40000 ALTER TABLE `challenge_times` DISABLE KEYS */;
INSERT INTO `challenge_times` VALUES (1,0,'9999-12-31 00:00:00'),(1,1,'9999-12-31 00:00:00'),(1,2,'9999-12-31 00:00:00'),(1,3,'9999-12-31 00:00:00'),(2,0,'9999-12-31 00:00:00'),(2,1,'9999-12-31 00:00:00'),(2,2,'9999-12-31 00:00:00'),(2,3,'9999-12-31 00:00:00'),(3,0,'9999-12-31 00:00:00'),(3,1,'9999-12-31 00:00:00'),(3,2,'9999-12-31 00:00:00'),(3,3,'9999-12-31 00:00:00');
/*!40000 ALTER TABLE `challenge_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenges`
--

DROP TABLE IF EXISTS `challenges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `challenges` (
  `challenge_id` int(11) NOT NULL,
  `challenge_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`challenge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
INSERT INTO `challenges` VALUES (0,'Moving Button'),(1,'Packet Sniffing'),(2,'MySQL Injection'),(3,'Brainfuck');
/*!40000 ALTER TABLE `challenges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(45) DEFAULT NULL,
  `team_grade` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'mark','F'),(2,'jonathan','F'),(3,'joe','F');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `time_info`
--

DROP TABLE IF EXISTS `time_info`;
/*!50001 DROP VIEW IF EXISTS `time_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `time_info` AS SELECT 
 1 AS `Team Name`,
 1 AS `Challenge Name`,
 1 AS `Finish Time`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'hsbcyberstorm'
--

--
-- Dumping routines for database 'hsbcyberstorm'
--

--
-- Current Database: `injectiondb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `injectiondb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `injectiondb`;

--
-- Table structure for table `aha`
--

DROP TABLE IF EXISTS `aha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aha` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aha`
--

LOCK TABLES `aha` WRITE;
/*!40000 ALTER TABLE `aha` DISABLE KEYS */;
/*!40000 ALTER TABLE `aha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almostallemptyeww`
--

DROP TABLE IF EXISTS `almostallemptyeww`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almostallemptyeww` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almostallemptyeww`
--

LOCK TABLES `almostallemptyeww` WRITE;
/*!40000 ALTER TABLE `almostallemptyeww` DISABLE KEYS */;
/*!40000 ALTER TABLE `almostallemptyeww` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anotheremptyone`
--

DROP TABLE IF EXISTS `anotheremptyone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anotheremptyone` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anotheremptyone`
--

LOCK TABLES `anotheremptyone` WRITE;
/*!40000 ALTER TABLE `anotheremptyone` DISABLE KEYS */;
/*!40000 ALTER TABLE `anotheremptyone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anotheronebitesthedust`
--

DROP TABLE IF EXISTS `anotheronebitesthedust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anotheronebitesthedust` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anotheronebitesthedust`
--

LOCK TABLES `anotheronebitesthedust` WRITE;
/*!40000 ALTER TABLE `anotheronebitesthedust` DISABLE KEYS */;
/*!40000 ALTER TABLE `anotheronebitesthedust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anotheruselesstable`
--

DROP TABLE IF EXISTS `anotheruselesstable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anotheruselesstable` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anotheruselesstable`
--

LOCK TABLES `anotheruselesstable` WRITE;
/*!40000 ALTER TABLE `anotheruselesstable` DISABLE KEYS */;
/*!40000 ALTER TABLE `anotheruselesstable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canyoufindsomethingnotgarbage`
--

DROP TABLE IF EXISTS `canyoufindsomethingnotgarbage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canyoufindsomethingnotgarbage` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canyoufindsomethingnotgarbage`
--

LOCK TABLES `canyoufindsomethingnotgarbage` WRITE;
/*!40000 ALTER TABLE `canyoufindsomethingnotgarbage` DISABLE KEYS */;
/*!40000 ALTER TABLE `canyoufindsomethingnotgarbage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canyoufindtherealones`
--

DROP TABLE IF EXISTS `canyoufindtherealones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canyoufindtherealones` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canyoufindtherealones`
--

LOCK TABLES `canyoufindtherealones` WRITE;
/*!40000 ALTER TABLE `canyoufindtherealones` DISABLE KEYS */;
/*!40000 ALTER TABLE `canyoufindtherealones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doyoubelieve`
--

DROP TABLE IF EXISTS `doyoubelieve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doyoubelieve` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doyoubelieve`
--

LOCK TABLES `doyoubelieve` WRITE;
/*!40000 ALTER TABLE `doyoubelieve` DISABLE KEYS */;
/*!40000 ALTER TABLE `doyoubelieve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doyoulikegarbage`
--

DROP TABLE IF EXISTS `doyoulikegarbage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doyoulikegarbage` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doyoulikegarbage`
--

LOCK TABLES `doyoulikegarbage` WRITE;
/*!40000 ALTER TABLE `doyoulikegarbage` DISABLE KEYS */;
/*!40000 ALTER TABLE `doyoulikegarbage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hintsmaybe`
--

DROP TABLE IF EXISTS `hintsmaybe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hintsmaybe` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hintsmaybe`
--

LOCK TABLES `hintsmaybe` WRITE;
/*!40000 ALTER TABLE `hintsmaybe` DISABLE KEYS */;
/*!40000 ALTER TABLE `hintsmaybe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hmmisitme`
--

DROP TABLE IF EXISTS `hmmisitme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hmmisitme` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hmmisitme`
--

LOCK TABLES `hmmisitme` WRITE;
/*!40000 ALTER TABLE `hmmisitme` DISABLE KEYS */;
/*!40000 ALTER TABLE `hmmisitme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ifonlywecouldfilterthis`
--

DROP TABLE IF EXISTS `ifonlywecouldfilterthis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ifonlywecouldfilterthis` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifonlywecouldfilterthis`
--

LOCK TABLES `ifonlywecouldfilterthis` WRITE;
/*!40000 ALTER TABLE `ifonlywecouldfilterthis` DISABLE KEYS */;
/*!40000 ALTER TABLE `ifonlywecouldfilterthis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imemptydontlook`
--

DROP TABLE IF EXISTS `imemptydontlook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imemptydontlook` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imemptydontlook`
--

LOCK TABLES `imemptydontlook` WRITE;
/*!40000 ALTER TABLE `imemptydontlook` DISABLE KEYS */;
/*!40000 ALTER TABLE `imemptydontlook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injectioniscool`
--

DROP TABLE IF EXISTS `injectioniscool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `injectioniscool` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injectioniscool`
--

LOCK TABLES `injectioniscool` WRITE;
/*!40000 ALTER TABLE `injectioniscool` DISABLE KEYS */;
/*!40000 ALTER TABLE `injectioniscool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injt1`
--

DROP TABLE IF EXISTS `injt1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `injt1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `encrypted_password` varchar(45) DEFAULT NULL,
  `encryption_method` varchar(45) NOT NULL,
  `encryption_key` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injt1`
--

LOCK TABLES `injt1` WRITE;
/*!40000 ALTER TABLE `injt1` DISABLE KEYS */;
INSERT INTO `injt1` VALUES (1,'myusername','pizza','Vigenere','onlythebestkeyswin'),(2,'anotherusername','spaghetti','Vigenere','randomkeysarechosen'),(3,'DKrakauer','meatballs','Vigenere','moredatamorefailure'),(4,'BRussell','maccaroni','Vigenere','stupidsureintelligentdoubt'),(5,'HRazor','jello','Vigenere','stupidityexplainsall'),(6,'SRushdie','pudding','Vigenere','norighttonotbeoffended'),(7,'UEco','frootloops','Vigenere','legionscanspeak'),(8,'RMBernstein','fruitypebbles','Vigenere','knowingisnotunderstanding'),(9,'MFinger','capncrunch','Vigenere','dontwaittilldeath'),(10,'EWll','vanillaicecream','Vigenere','doubtkillsdreams'),(11,'YKnow','chocolatemilk','Vigenere','tworulestellone'),(12,'EElse','sausage','Vigenere','youareunique'),(13,'APerfect','franks','Vigenere','iamanobody'),(14,'UEverything','cheese','Vigenere','atomsareall'),(15,'NeDay','nachos','Vigenere','nothingisimpossible'),(16,'JRohn','ham','Vigenere','takeresponsibility'),(17,'HEllison','ramen','Vigenere','notentitled'),(18,'RSchuller','lasagna','Vigenere','spectacularachievement'),(19,'TPhysics','taco','Vigenere','ihaveatheory'),(20,'MMonroe','fajita','Vigenere','famouslady'),(21,'TEdison','burger','Vigenere','fatherofenergy'),(22,'BFranklin','crab','Vigenere','onefatherofusa'),(23,'ALincoln','salmon','Vigenere','honestabe'),(24,'MTeresa','potatoes','Vigenere','anunithink'),(25,'JFKennedy','tea','Vigenere','anexellentpresident'),(26,'MLKing','milk','Vigenere','leaderofcivilrightsmovement'),(27,'NMandela','water','Vigenere','idunnowhathedid'),(28,'QElizabeth','coolaid','Vigenere','anotherleaderofengland'),(29,'WChurchill','eel','Vigenere','leaderofengland'),(30,'DTrump','shellfish','Vigenere','ourpresident'),(31,'BGates','shrimp','Vigenere','fatherofmicrosoft'),(32,'MAli','lobster','Vigenere','boxerithink'),(33,'MGandhi','beef','Vigenere','ledfreedominindia'),(34,'MThatcher','lamb','Vigenere','dontknowhim'),(35,'CColumbus','goat','Vigenere','sailedtheseas'),(36,'CDarwin','poultry','Vigenere','fatherofevolution'),(37,'EPresley','raisinbran','Vigenere','famousmusician'),(38,'AEinstein','cookiecrist','Vigenere','agreatscientest'),(39,'PMcCartney','trix','Vigenere','imnotsure'),(40,'QVictoria','applejacks','Vigenere','queenofengland'),(41,'PFrancis','honeynutcheerios','Vigenere','hewasapope'),(42,'JNehru','cinnamontoastcrunch','Vigenere','beatsme'),(43,'LDVinci','cookiesandcreamicecream','Vigenere','anothergoodartist'),(44,'VVGogh','rockyroadicecream','Vigenere','agoodartist'),(45,'FDRoosevelt','chocolateicecream','Vigenere','ledduringwar'),(46,'JP2','cherryicecream','Vigenere','iforget'),(47,'WDisney','neopolitanicecream','Vigenere','mickymouse'),(48,'NArmstrong','mintchocolatechipicecream','Vigenere','hesonthemoon');
/*!40000 ALTER TABLE `injt1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jeezwhatabaddb`
--

DROP TABLE IF EXISTS `jeezwhatabaddb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jeezwhatabaddb` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jeezwhatabaddb`
--

LOCK TABLES `jeezwhatabaddb` WRITE;
/*!40000 ALTER TABLE `jeezwhatabaddb` DISABLE KEYS */;
/*!40000 ALTER TABLE `jeezwhatabaddb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lotsofgarbagehere`
--

DROP TABLE IF EXISTS `lotsofgarbagehere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lotsofgarbagehere` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotsofgarbagehere`
--

LOCK TABLES `lotsofgarbagehere` WRITE;
/*!40000 ALTER TABLE `lotsofgarbagehere` DISABLE KEYS */;
/*!40000 ALTER TABLE `lotsofgarbagehere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lotsoftrash`
--

DROP TABLE IF EXISTS `lotsoftrash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lotsoftrash` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotsoftrash`
--

LOCK TABLES `lotsoftrash` WRITE;
/*!40000 ALTER TABLE `lotsoftrash` DISABLE KEYS */;
/*!40000 ALTER TABLE `lotsoftrash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manyuselesstableshere`
--

DROP TABLE IF EXISTS `manyuselesstableshere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manyuselesstableshere` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manyuselesstableshere`
--

LOCK TABLES `manyuselesstableshere` WRITE;
/*!40000 ALTER TABLE `manyuselesstableshere` DISABLE KEYS */;
/*!40000 ALTER TABLE `manyuselesstableshere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maybethisone`
--

DROP TABLE IF EXISTS `maybethisone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maybethisone` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maybethisone`
--

LOCK TABLES `maybethisone` WRITE;
/*!40000 ALTER TABLE `maybethisone` DISABLE KEYS */;
/*!40000 ALTER TABLE `maybethisone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mayhapsyoucouldfilterthese`
--

DROP TABLE IF EXISTS `mayhapsyoucouldfilterthese`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mayhapsyoucouldfilterthese` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mayhapsyoucouldfilterthese`
--

LOCK TABLES `mayhapsyoucouldfilterthese` WRITE;
/*!40000 ALTER TABLE `mayhapsyoucouldfilterthese` DISABLE KEYS */;
/*!40000 ALTER TABLE `mayhapsyoucouldfilterthese` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mostunfortunate`
--

DROP TABLE IF EXISTS `mostunfortunate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mostunfortunate` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mostunfortunate`
--

LOCK TABLES `mostunfortunate` WRITE;
/*!40000 ALTER TABLE `mostunfortunate` DISABLE KEYS */;
/*!40000 ALTER TABLE `mostunfortunate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nahthisisuseless`
--

DROP TABLE IF EXISTS `nahthisisuseless`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nahthisisuseless` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nahthisisuseless`
--

LOCK TABLES `nahthisisuseless` WRITE;
/*!40000 ALTER TABLE `nahthisisuseless` DISABLE KEYS */;
/*!40000 ALTER TABLE `nahthisisuseless` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nopenothere`
--

DROP TABLE IF EXISTS `nopenothere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nopenothere` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nopenothere`
--

LOCK TABLES `nopenothere` WRITE;
/*!40000 ALTER TABLE `nopenothere` DISABLE KEYS */;
/*!40000 ALTER TABLE `nopenothere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nopenotthatone`
--

DROP TABLE IF EXISTS `nopenotthatone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nopenotthatone` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nopenotthatone`
--

LOCK TABLES `nopenotthatone` WRITE;
/*!40000 ALTER TABLE `nopenotthatone` DISABLE KEYS */;
/*!40000 ALTER TABLE `nopenotthatone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nothinginalmostallofthese`
--

DROP TABLE IF EXISTS `nothinginalmostallofthese`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nothinginalmostallofthese` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nothinginalmostallofthese`
--

LOCK TABLES `nothinginalmostallofthese` WRITE;
/*!40000 ALTER TABLE `nothinginalmostallofthese` DISABLE KEYS */;
/*!40000 ALTER TABLE `nothinginalmostallofthese` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nothinguseful`
--

DROP TABLE IF EXISTS `nothinguseful`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nothinguseful` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nothinguseful`
--

LOCK TABLES `nothinguseful` WRITE;
/*!40000 ALTER TABLE `nothinguseful` DISABLE KEYS */;
/*!40000 ALTER TABLE `nothinguseful` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oneoftheseistheone`
--

DROP TABLE IF EXISTS `oneoftheseistheone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oneoftheseistheone` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oneoftheseistheone`
--

LOCK TABLES `oneoftheseistheone` WRITE;
/*!40000 ALTER TABLE `oneoftheseistheone` DISABLE KEYS */;
/*!40000 ALTER TABLE `oneoftheseistheone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `somethingusefulmayhaps`
--

DROP TABLE IF EXISTS `somethingusefulmayhaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `somethingusefulmayhaps` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `somethingusefulmayhaps`
--

LOCK TABLES `somethingusefulmayhaps` WRITE;
/*!40000 ALTER TABLE `somethingusefulmayhaps` DISABLE KEYS */;
/*!40000 ALTER TABLE `somethingusefulmayhaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sorrynotsorry`
--

DROP TABLE IF EXISTS `sorrynotsorry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sorrynotsorry` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorrynotsorry`
--

LOCK TABLES `sorrynotsorry` WRITE;
/*!40000 ALTER TABLE `sorrynotsorry` DISABLE KEYS */;
/*!40000 ALTER TABLE `sorrynotsorry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stillempty`
--

DROP TABLE IF EXISTS `stillempty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stillempty` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stillempty`
--

LOCK TABLES `stillempty` WRITE;
/*!40000 ALTER TABLE `stillempty` DISABLE KEYS */;
/*!40000 ALTER TABLE `stillempty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stillyetmoreuselesstables`
--

DROP TABLE IF EXISTS `stillyetmoreuselesstables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stillyetmoreuselesstables` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stillyetmoreuselesstables`
--

LOCK TABLES `stillyetmoreuselesstables` WRITE;
/*!40000 ALTER TABLE `stillyetmoreuselesstables` DISABLE KEYS */;
/*!40000 ALTER TABLE `stillyetmoreuselesstables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thisistheone`
--

DROP TABLE IF EXISTS `thisistheone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thisistheone` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thisistheone`
--

LOCK TABLES `thisistheone` WRITE;
/*!40000 ALTER TABLE `thisistheone` DISABLE KEYS */;
/*!40000 ALTER TABLE `thisistheone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useless_table`
--

DROP TABLE IF EXISTS `useless_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useless_table` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useless_table`
--

LOCK TABLES `useless_table` WRITE;
/*!40000 ALTER TABLE `useless_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `useless_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertable`
--

DROP TABLE IF EXISTS `usertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertable` (
  `username` varchar(16) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertable`
--

LOCK TABLES `usertable` WRITE;
/*!40000 ALTER TABLE `usertable` DISABLE KEYS */;
INSERT INTO `usertable` VALUES ('myuser','myemail','mypassword','2019-02-04 06:15:09');
/*!40000 ALTER TABLE `usertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whatareallthesetrashtables`
--

DROP TABLE IF EXISTS `whatareallthesetrashtables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whatareallthesetrashtables` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whatareallthesetrashtables`
--

LOCK TABLES `whatareallthesetrashtables` WRITE;
/*!40000 ALTER TABLE `whatareallthesetrashtables` DISABLE KEYS */;
/*!40000 ALTER TABLE `whatareallthesetrashtables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whatisgoingonhere`
--

DROP TABLE IF EXISTS `whatisgoingonhere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whatisgoingonhere` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whatisgoingonhere`
--

LOCK TABLES `whatisgoingonhere` WRITE;
/*!40000 ALTER TABLE `whatisgoingonhere` DISABLE KEYS */;
/*!40000 ALTER TABLE `whatisgoingonhere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whomadethisdbwow`
--

DROP TABLE IF EXISTS `whomadethisdbwow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whomadethisdbwow` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whomadethisdbwow`
--

LOCK TABLES `whomadethisdbwow` WRITE;
/*!40000 ALTER TABLE `whomadethisdbwow` DISABLE KEYS */;
/*!40000 ALTER TABLE `whomadethisdbwow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whyaretheresomanybadtables`
--

DROP TABLE IF EXISTS `whyaretheresomanybadtables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whyaretheresomanybadtables` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whyaretheresomanybadtables`
--

LOCK TABLES `whyaretheresomanybadtables` WRITE;
/*!40000 ALTER TABLE `whyaretheresomanybadtables` DISABLE KEYS */;
/*!40000 ALTER TABLE `whyaretheresomanybadtables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `willyoulookmanually`
--

DROP TABLE IF EXISTS `willyoulookmanually`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `willyoulookmanually` (
  `useless_column` int(11) NOT NULL,
  PRIMARY KEY (`useless_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `willyoulookmanually`
--

LOCK TABLES `willyoulookmanually` WRITE;
/*!40000 ALTER TABLE `willyoulookmanually` DISABLE KEYS */;
/*!40000 ALTER TABLE `willyoulookmanually` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'injectiondb'
--

--
-- Dumping routines for database 'injectiondb'
--

--
-- Current Database: `hsbcyberstorm`
--

USE `hsbcyberstorm`;

--
-- Final view structure for view `challenge_info`
--

/*!50001 DROP VIEW IF EXISTS `challenge_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `challenge_info` AS select `t`.`team_name` AS `Team Name`,group_concat(`c`.`challenge_name` order by `p`.`challenge_id` ASC separator '\n') AS `Challenge Name`,group_concat(`p`.`password` order by `p`.`challenge_id` ASC separator '\n') AS `Password` from ((`challenges` `c` join `challenge_passwords` `p` on((`c`.`challenge_id` = `p`.`challenge_id`))) join `teams` `t` on((`p`.`team_id` = `t`.`team_id`))) group by `p`.`team_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `time_info`
--

/*!50001 DROP VIEW IF EXISTS `time_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `time_info` AS select `t`.`team_name` AS `Team Name`,group_concat(`c`.`challenge_name` order by `f`.`challenge_id` ASC separator '\n') AS `Challenge Name`,group_concat(`f`.`completion_time` order by `f`.`challenge_id` ASC separator '\n') AS `Finish Time` from ((`challenges` `c` join `challenge_times` `f` on((`c`.`challenge_id` = `f`.`challenge_id`))) join `teams` `t` on((`f`.`team_id` = `t`.`team_id`))) group by `f`.`team_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Current Database: `injectiondb`
--

USE `injectiondb`;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-14  7:58:15


--
-- User creation
--

CREATE USER 'injectuser'@'%' IDENTIFIED BY 'injectuser';
GRANT SELECT ON injectiondb.* TO 'injectuser'@'%';

CREATE USER 'hsbuser'@'%' IDENTIFIED BY 'hsbpasswordisareallygoodpassword';
GRANT ALL PRIVILEGES ON hsbcyberstorm.* TO 'hsbuser'@'%';
