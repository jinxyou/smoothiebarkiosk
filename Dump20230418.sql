-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: db_shopmaster
-- ------------------------------------------------------
-- Server version	5.7.40-log

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `activityId` int(12) NOT NULL AUTO_INCREMENT,
  `activityName` varchar(50) NOT NULL,
  `activityDes` varchar(500) NOT NULL,
  `discount` float DEFAULT '1',
  `fullPrice` int(12) DEFAULT NULL,
  `reducePrice` int(12) DEFAULT NULL,
  `fullNum` int(12) DEFAULT NULL,
  `reduceNum` int(12) DEFAULT NULL,
  PRIMARY KEY (`activityId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'测试活动','1231',1,123,123,1231,12),(2,'开业大酬宾','开业大酬宾，全场9折。',9.2,100,8,200,20);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `addressID` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `county` varchar(50) NOT NULL,
  `detailAddr` varchar(50) NOT NULL,
  `conName` varchar(50) NOT NULL,
  `conTel` varchar(50) NOT NULL,
  PRIMARY KEY (`addressID`),
  KEY `addressID` (`addressID`),
  KEY `userId` (`userId`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (7,1,'IL','Chicago','Cook','Kiosk #3','123123','2131231321'),(8,3,'IL','Chicago','Cook','Kiosk #2','Sam','18229189406'),(9,6,'IL','Chicago','Cook','Kiosk #1','Eugene','+8613151184007');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminId` int(12) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','25d55ad283aa400af464c76d713c07ad');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cateId` int(12) NOT NULL AUTO_INCREMENT,
  `cateName` varchar(50) NOT NULL,
  PRIMARY KEY (`cateId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Kiwi'),(2,'Strawberry'),(3,'Mango'),(4,'Grape'),(5,'Other');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection` (
  `userId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `collectTime` datetime NOT NULL,
  PRIMARY KEY (`userId`,`goodsId`),
  KEY `collection_ibfk_2` (`goodsId`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (3,93,'2019-05-13 10:47:26'),(3,94,'2019-05-13 10:16:11'),(3,95,'2019-05-13 10:37:35'),(3,97,'2019-05-13 10:23:11');
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `commentId` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `point` int(8) NOT NULL,
  `content` varchar(255) NOT NULL,
  `commentTime` datetime NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `userId` (`userId`),
  KEY `goodsId` (`goodsId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (2,3,93,4,'It\'s good!','2019-05-13 10:48:51');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliver`
--

DROP TABLE IF EXISTS `deliver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliver` (
  `deliverId` int(12) NOT NULL AUTO_INCREMENT,
  `orderId` int(12) NOT NULL,
  `sendId` int(12) NOT NULL,
  PRIMARY KEY (`deliverId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `deliver_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `indent` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliver`
--

LOCK TABLES `deliver` WRITE;
/*!40000 ALTER TABLE `deliver` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `goodsId` int(12) NOT NULL AUTO_INCREMENT,
  `goodsName` varchar(50) NOT NULL,
  `price` int(12) NOT NULL,
  `num` int(12) NOT NULL,
  `upTime` datetime NOT NULL,
  `category` int(12) NOT NULL,
  `detailCate` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `activityId` int(12) NOT NULL DEFAULT '1',
  PRIMARY KEY (`goodsId`),
  KEY `activityId` (`activityId`),
  KEY `category` (`category`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`activityId`) REFERENCES `activity` (`activityId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goods_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category` (`cateId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (93,'Smoothie #1',10,29,'2019-05-10 19:43:04',1,'Smoothie Cate 1','This smoothie contains ',1),(94,'Smoothie #2',7,34,'2019-05-10 19:44:28',2,'Smoothie Cate 2','This smoothie contains ',1),(95,'Smoothie #5',9,1231,'2019-05-11 11:41:24',1,'Smoothie Cate 1','This smoothie contains',1),(96,'Smoothie #3',8,222,'2019-05-11 11:42:00',1,'Smoothie Cate 1','This smoothie contains ',1),(97,'Smoothie #4',10,212,'2019-05-13 10:22:58',1,'Smoothie Cate 1','This smoothie contains ',1);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagepath`
--

DROP TABLE IF EXISTS `imagepath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagepath` (
  `pathId` int(12) NOT NULL AUTO_INCREMENT,
  `goodId` int(12) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`pathId`),
  KEY `goodid` (`goodId`),
  CONSTRAINT `imagepath_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagepath`
--

LOCK TABLES `imagepath` WRITE;
/*!40000 ALTER TABLE `imagepath` DISABLE KEYS */;
INSERT INTO `imagepath` VALUES (114,93,'img01.png'),(115,93,'img02.png'),(116,94,'img03.png'),(117,95,'img04.png'),(118,96,'img05.png'),(119,96,'img05.png'),(120,96,'img05.png'),(121,97,'img05.png'),(122,97,'img05.png'),(123,97,'img05.png'),(124,97,'img05.png'),(125,97,'img05.png'),(126,97,'img05.png'),(127,97,'img05.png'),(128,97,'img05.png');
/*!40000 ALTER TABLE `imagepath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indent`
--

DROP TABLE IF EXISTS `indent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indent` (
  `orderId` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `orderTime` datetime NOT NULL,
  `oldPrice` float NOT NULL,
  `newPrice` float NOT NULL,
  `isPay` tinyint(1) NOT NULL,
  `isSend` tinyint(1) NOT NULL,
  `isReceive` tinyint(1) NOT NULL,
  `isComplete` tinyint(1) NOT NULL,
  `addressId` int(12) NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  KEY `orderGoods` (`orderTime`),
  KEY `addressId` (`addressId`),
  CONSTRAINT `indent_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `indent_ibfk_2` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indent`
--

LOCK TABLES `indent` WRITE;
/*!40000 ALTER TABLE `indent` DISABLE KEYS */;
INSERT INTO `indent` VALUES (28,3,'2019-05-11 11:33:10',10,10,1,1,1,1,8),(29,3,'2019-05-11 11:39:39',125,125,1,1,1,1,8),(30,3,'2019-05-13 10:16:19',109,109,1,1,1,1,8),(31,3,'2019-05-13 10:37:59',10,10,0,1,1,1,8),(32,3,'2019-05-13 10:43:05',10,10,1,1,0,0,8),(33,3,'2019-05-13 10:47:42',40,40,1,1,1,1,8),(34,6,'2023-04-18 04:23:28',10,10,0,1,1,1,9),(35,6,'2023-04-19 11:34:19',10,10,1,0,0,0,9);
/*!40000 ALTER TABLE `indent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `itemId` int(12) NOT NULL AUTO_INCREMENT,
  `orderId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `num` int(12) NOT NULL,
  PRIMARY KEY (`itemId`),
  KEY `orderId` (`orderId`),
  KEY `goodsId` (`goodsId`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `indent` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (14,28,93,1),(15,29,93,1),(16,29,94,5),(17,30,93,4),(18,30,94,3),(19,31,93,1),(20,32,93,1),(21,33,93,4),(22,34,93,1),(23,35,93,1);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopcart`
--

DROP TABLE IF EXISTS `shopcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopcart` (
  `userId` int(12) NOT NULL,
  `goodsid` int(12) NOT NULL,
  `cateDate` datetime NOT NULL,
  `goodsNum` int(12) NOT NULL,
  PRIMARY KEY (`userId`,`goodsid`),
  KEY `userId` (`userId`),
  KEY `goodsid` (`goodsid`),
  CONSTRAINT `shopcart_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shopcart_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopcart`
--

LOCK TABLES `shopcart` WRITE;
/*!40000 ALTER TABLE `shopcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int(12) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `regTime` datetime NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'root','12345678','2019-04-18 17:16:34','123@gmail.com','18229819406'),(3,'admin','25d55ad283aa400af464c76d713c07ad','2019-05-16 10:46:46','123123','1231321'),(6,'you','25d55ad283aa400af464c76d713c07ad','2023-04-18 04:22:09','johnyjx44@gmail.com','2178983236');
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

-- Dump completed on 2023-04-18 22:50:26
