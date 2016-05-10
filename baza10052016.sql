-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: prisbaza
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `komentar`
--

DROP TABLE IF EXISTS `komentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komentar` (
  `KOMENTARID` int(11) NOT NULL AUTO_INCREMENT,
  `KURSID` int(11) NOT NULL,
  `USERID` int(11) NOT NULL,
  `OPIS` varchar(255) NOT NULL,
  PRIMARY KEY (`KOMENTARID`),
  KEY `FK_RELATIONSHIP_11` (`USERID`),
  KEY `FK_RELATIONSHIP_14` (`KURSID`),
  CONSTRAINT `FK_RELATIONSHIP_11` FOREIGN KEY (`USERID`) REFERENCES `user` (`USERID`),
  CONSTRAINT `FK_RELATIONSHIP_14` FOREIGN KEY (`KURSID`) REFERENCES `kurs` (`KURSID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komentar`
--

LOCK TABLES `komentar` WRITE;
/*!40000 ALTER TABLE `komentar` DISABLE KEYS */;
INSERT INTO `komentar` VALUES (1,1,1,'koMentar NEKI'),(2,1,4,'Dodajem komentar'),(3,1,4,'Komentarcic'),(4,1,4,'hehe'),(5,1,4,'idemo radimoooo');
/*!40000 ALTER TABLE `komentar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kurs`
--

DROP TABLE IF EXISTS `kurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kurs` (
  `KURSID` int(11) NOT NULL AUTO_INCREMENT,
  `NAZIV` varchar(255) NOT NULL,
  `OPIS` varchar(255) NOT NULL,
  `ISHOD` varchar(255) NOT NULL,
  PRIMARY KEY (`KURSID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kurs`
--

LOCK TABLES `kurs` WRITE;
/*!40000 ALTER TABLE `kurs` DISABLE KEYS */;
INSERT INTO `kurs` VALUES (1,'Engleski jezik','englezi\r\nbarabe','i te\r\nkako'),(2,'Ruski','putin putin','vodka vodka'),(3,'Spanski','Si','Inkvizicija'),(4,'Anglo Saksonski','asda','asdsad');
/*!40000 ALTER TABLE `kurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lekcija`
--

DROP TABLE IF EXISTS `lekcija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lekcija` (
  `LEKCIJAID` int(11) NOT NULL AUTO_INCREMENT,
  `KURSID` int(11) NOT NULL,
  `USERID` int(11) NOT NULL,
  `NAZIV` varchar(255) NOT NULL,
  `TEXT` text NOT NULL,
  `TIPLEKCIJE` int(11) NOT NULL,
  PRIMARY KEY (`LEKCIJAID`),
  KEY `FK_RELATIONSHIP_19` (`USERID`),
  KEY `FK_RELATIONSHIP_5` (`KURSID`),
  CONSTRAINT `FK_RELATIONSHIP_19` FOREIGN KEY (`USERID`) REFERENCES `user` (`USERID`),
  CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`KURSID`) REFERENCES `kurs` (`KURSID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lekcija`
--

LOCK TABLES `lekcija` WRITE;
/*!40000 ALTER TABLE `lekcija` DISABLE KEYS */;
INSERT INTO `lekcija` VALUES (1,1,2,'Prva lekcija','<p>hehe ovo ono</p>\r\n<p><em><strong>fancy</strong></em></p>\r\n<p style=\"text-align: center;\">i ovo&nbsp;<img src=\"http://cdn.tinymce.com/4/plugins/emoticons/img/smiley-laughing.gif\" alt=\"laughing\" /></p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: right;\"><img src=\"http://cdn.tinymce.com/4/plugins/emoticons/img/smiley-cool.gif\" alt=\"cool\" /></p>\r\n<p style=\"text-align: center;\"><iframe src=\"//www.youtube.com/embed/gnR6UCO09Eo\" width=\"560\" height=\"316\" allowfullscreen=\"allowfullscreen\"></iframe></p>\r\n<p style=\"text-align: left;\">Maksa car</p>',0),(2,1,2,'Druga lekcija','<p style=\"text-align: center;\">JESTE</p>\r\n<p style=\"text-align: left;\"><iframe src=\"//www.youtube.com/embed/gnR6UCO09Eo\" width=\"560\" height=\"316\" allowfullscreen=\"allowfullscreen\"></iframe> hehe</p>',0),(3,1,9,'asdasd','<p>asd</p>',0);
/*!40000 ALTER TABLE `lekcija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocena`
--

DROP TABLE IF EXISTS `ocena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ocena` (
  `OCENAID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NOT NULL,
  `KURSID` int(11) NOT NULL,
  `OPIS` varchar(255) NOT NULL,
  `DATUM` date NOT NULL,
  PRIMARY KEY (`OCENAID`),
  KEY `FK_RELATIONSHIP_20` (`USERID`),
  KEY `FK_RELATIONSHIP_21` (`KURSID`),
  CONSTRAINT `FK_RELATIONSHIP_20` FOREIGN KEY (`USERID`) REFERENCES `user` (`USERID`),
  CONSTRAINT `FK_RELATIONSHIP_21` FOREIGN KEY (`KURSID`) REFERENCES `kurs` (`KURSID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocena`
--

LOCK TABLES `ocena` WRITE;
/*!40000 ALTER TABLE `ocena` DISABLE KEYS */;
INSERT INTO `ocena` VALUES (1,3,1,'5','2016-04-14'),(3,3,1,'3.5','2016-04-16'),(12,4,1,'2.75','2016-04-17'),(13,5,1,'2.5','2016-04-19'),(14,6,1,'4.5','2016-04-20'),(15,7,1,'1.5','2016-04-20'),(16,8,1,'4.75','2016-04-26'),(17,8,3,'4.25','2016-04-26'),(18,8,2,'1.75','2016-04-26'),(19,8,4,'0.5','2016-04-26');
/*!40000 ALTER TABLE `ocena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odgovor`
--

DROP TABLE IF EXISTS `odgovor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odgovor` (
  `ODGOVORID` int(11) NOT NULL AUTO_INCREMENT,
  `PITANJEID` int(11) NOT NULL,
  `TEXT` text NOT NULL,
  `TACAN` tinyint(1) NOT NULL,
  PRIMARY KEY (`ODGOVORID`),
  KEY `FK_RELATIONSHIP_2` (`PITANJEID`),
  CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`PITANJEID`) REFERENCES `pitanje` (`PITANJEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odgovor`
--

LOCK TABLES `odgovor` WRITE;
/*!40000 ALTER TABLE `odgovor` DISABLE KEYS */;
/*!40000 ALTER TABLE `odgovor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pitanje`
--

DROP TABLE IF EXISTS `pitanje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pitanje` (
  `PITANJEID` int(11) NOT NULL AUTO_INCREMENT,
  `TESTID` int(11) NOT NULL,
  `TEXT` text NOT NULL,
  `TIPODGOVORA` int(11) NOT NULL,
  PRIMARY KEY (`PITANJEID`),
  KEY `FK_RELATIONSHIP_3` (`TESTID`),
  CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`TESTID`) REFERENCES `test` (`TESTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pitanje`
--

LOCK TABLES `pitanje` WRITE;
/*!40000 ALTER TABLE `pitanje` DISABLE KEYS */;
/*!40000 ALTER TABLE `pitanje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polaze`
--

DROP TABLE IF EXISTS `polaze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polaze` (
  `USERID` int(11) NOT NULL,
  `TESTID` int(11) NOT NULL,
  `BROJBODOVA` float NOT NULL,
  PRIMARY KEY (`USERID`,`TESTID`),
  KEY `FK_RELATIONSHIP_13` (`TESTID`),
  CONSTRAINT `FK_RELATIONSHIP_12` FOREIGN KEY (`USERID`) REFERENCES `user` (`USERID`),
  CONSTRAINT `FK_RELATIONSHIP_13` FOREIGN KEY (`TESTID`) REFERENCES `test` (`TESTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polaze`
--

LOCK TABLES `polaze` WRITE;
/*!40000 ALTER TABLE `polaze` DISABLE KEYS */;
/*!40000 ALTER TABLE `polaze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predaje`
--

DROP TABLE IF EXISTS `predaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `predaje` (
  `USERID` int(11) NOT NULL,
  `KURSID` int(11) NOT NULL,
  PRIMARY KEY (`USERID`,`KURSID`),
  KEY `FK_RELATIONSHIP_16` (`KURSID`),
  CONSTRAINT `FK_RELATIONSHIP_15` FOREIGN KEY (`USERID`) REFERENCES `user` (`USERID`),
  CONSTRAINT `FK_RELATIONSHIP_16` FOREIGN KEY (`KURSID`) REFERENCES `kurs` (`KURSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predaje`
--

LOCK TABLES `predaje` WRITE;
/*!40000 ALTER TABLE `predaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `predaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prijavljen`
--

DROP TABLE IF EXISTS `prijavljen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prijavljen` (
  `USERID` int(11) NOT NULL,
  `KURSID` int(11) NOT NULL,
  PRIMARY KEY (`USERID`,`KURSID`),
  KEY `FK_RELATIONSHIP_18` (`KURSID`),
  CONSTRAINT `FK_RELATIONSHIP_17` FOREIGN KEY (`USERID`) REFERENCES `user` (`USERID`),
  CONSTRAINT `FK_RELATIONSHIP_18` FOREIGN KEY (`KURSID`) REFERENCES `kurs` (`KURSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prijavljen`
--

LOCK TABLES `prijavljen` WRITE;
/*!40000 ALTER TABLE `prijavljen` DISABLE KEYS */;
INSERT INTO `prijavljen` VALUES (3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(8,2),(8,3),(8,4);
/*!40000 ALTER TABLE `prijavljen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `TESTID` int(11) NOT NULL AUTO_INCREMENT,
  `KURSID` int(11) NOT NULL,
  `NASLOV` varchar(255) NOT NULL,
  `OPIS` varchar(255) NOT NULL,
  PRIMARY KEY (`TESTID`),
  KEY `FK_RELATIONSHIP_4_idx` (`KURSID`),
  CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`KURSID`) REFERENCES `kurs` (`KURSID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,1,'A','A'),(2,1,'A','B'),(3,1,'B','V'),(4,1,'C','C'),(5,1,'M','S');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uradjenopitanje`
--

DROP TABLE IF EXISTS `uradjenopitanje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uradjenopitanje` (
  `URADJENOPITANJEID` int(11) NOT NULL AUTO_INCREMENT,
  `ODGOVORID` varchar(45) DEFAULT NULL,
  `URADJENTESTID` int(11) NOT NULL,
  `PITANJEID` int(11) NOT NULL,
  PRIMARY KEY (`URADJENOPITANJEID`),
  KEY `fk_uradjenopitanje_uradjentest1_idx` (`URADJENTESTID`),
  KEY `fk_uradjenopitanje_pitanje1_idx` (`PITANJEID`),
  CONSTRAINT `fk_uradjenopitanje_pitanje1` FOREIGN KEY (`PITANJEID`) REFERENCES `pitanje` (`PITANJEID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_uradjenopitanje_uradjentest1` FOREIGN KEY (`URADJENTESTID`) REFERENCES `uradjentest` (`URADJENTESTID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uradjenopitanje`
--

LOCK TABLES `uradjenopitanje` WRITE;
/*!40000 ALTER TABLE `uradjenopitanje` DISABLE KEYS */;
/*!40000 ALTER TABLE `uradjenopitanje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uradjentest`
--

DROP TABLE IF EXISTS `uradjentest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uradjentest` (
  `URADJENTESTID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NOT NULL,
  `TESTID` int(11) NOT NULL,
  `KURSID` int(11) NOT NULL,
  PRIMARY KEY (`URADJENTESTID`),
  KEY `userid_idx` (`USERID`),
  KEY `testid_idx` (`TESTID`),
  KEY `fk_uradjentest_kurs1_idx` (`KURSID`),
  CONSTRAINT `fk_uradjentest_kurs1` FOREIGN KEY (`KURSID`) REFERENCES `kurs` (`KURSID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `testid` FOREIGN KEY (`TESTID`) REFERENCES `test` (`TESTID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userid` FOREIGN KEY (`USERID`) REFERENCES `user` (`USERID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uradjentest`
--

LOCK TABLES `uradjentest` WRITE;
/*!40000 ALTER TABLE `uradjentest` DISABLE KEYS */;
/*!40000 ALTER TABLE `uradjentest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `USERID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLEID` int(11) NOT NULL,
  `IME` varchar(255) NOT NULL,
  `PREZIME` varchar(255) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  PRIMARY KEY (`USERID`),
  KEY `FK_RELATIONSHIP_1` (`ROLEID`),
  CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`ROLEID`) REFERENCES `userrole` (`ROLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'Pris','Pris','admin','admin'),(2,2,'Rajko','Radonic','rayche','123'),(3,3,'Marko','Ljubic','rouz','123'),(4,3,'Neki','Lik','neki_lik','123'),(5,3,'Bojan','Pijak','boki','123'),(6,3,'Maksim','Lalic','maksa','123'),(7,3,'Milan','Gataric','mico','123'),(8,3,'timi','t','timi','123'),(9,2,'zile','zile','zile','12'),(10,3,'a','a','a','a');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrole` (
  `ROLEID` int(11) NOT NULL AUTO_INCREMENT,
  `OPIS` varchar(255) NOT NULL,
  PRIMARY KEY (`ROLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (1,'Admin'),(2,'Predavac'),(3,'Polaznik');
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-10  4:10:07
