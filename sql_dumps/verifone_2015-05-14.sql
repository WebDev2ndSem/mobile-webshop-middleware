# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.43-0ubuntu0.14.04.1)
# Database: verifone
# Generation Time: 2015-05-14 09:20:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table commonErrors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `commonErrors`;

CREATE TABLE `commonErrors` (
  `commonErrorId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `commonErrorDesc` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`commonErrorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table devicestatus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `devicestatus`;

CREATE TABLE `devicestatus` (
  `deviceId` int(11) NOT NULL AUTO_INCREMENT,
  `devicestatus` tinyint(1) NOT NULL,
  PRIMARY KEY (`deviceId`),
  CONSTRAINT `devicestatus_ibfk_1` FOREIGN KEY (`deviceId`) REFERENCES `userdevices` (`deviceId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

LOCK TABLES `devicestatus` WRITE;
/*!40000 ALTER TABLE `devicestatus` DISABLE KEYS */;

INSERT INTO `devicestatus` (`deviceId`, `devicestatus`)
VALUES
	(1,1),
	(2,0),
	(3,1),
	(4,0),
	(6,0),
	(7,1),
	(8,1);

/*!40000 ALTER TABLE `devicestatus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table problems
# ------------------------------------------------------------

DROP TABLE IF EXISTS `problems`;

CREATE TABLE `problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceId` int(11) NOT NULL,
  `comments` varchar(255) COLLATE utf8_bin DEFAULT '',
  `problemDate` datetime NOT NULL,
  `commonErrorId` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `deviceId` (`deviceId`),
  CONSTRAINT `problems_ibfk_1` FOREIGN KEY (`deviceId`) REFERENCES `userdevices` (`deviceId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

LOCK TABLES `problems` WRITE;
/*!40000 ALTER TABLE `problems` DISABLE KEYS */;

INSERT INTO `problems` (`id`, `deviceId`, `comments`, `problemDate`, `commonErrorId`, `subject`)
VALUES
	(9,4,X'776F726B733F','2015-05-09 09:00:33',0,X'7374696C6C'),
	(10,2,X'776F726C64','2015-05-11 08:23:45',0,X'68656C6C6F'),
	(11,2,X'776F726C64','2015-05-11 08:25:31',0,X'68656C6C6F'),
	(12,2,X'776F72C3B664','2015-05-11 11:21:27',0,X'68656C6C6F'),
	(13,3,X'646668','2015-05-11 11:24:39',0,X'776767'),
	(14,6,X'6A6A6A','2015-05-12 15:24:54',0,X'687361'),
	(15,6,X'6A6A6B','2015-05-12 15:25:29',0,X'6868682E6A6A'),
	(16,6,X'676868','2015-05-13 20:00:21',0,X'68656C702121'),
	(17,6,X'676868','2015-05-13 20:00:29',0,X'68656C702121'),
	(18,1,X'617364','2015-05-13 20:18:31',0,X'617364'),
	(19,1,X'617364','2015-05-13 20:18:32',0,X'617364');

/*!40000 ALTER TABLE `problems` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table statistics
# ------------------------------------------------------------

DROP TABLE IF EXISTS `statistics`;

CREATE TABLE `statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceId` int(11) NOT NULL,
  `income` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deviceId` (`deviceId`),
  CONSTRAINT `statistics_ibfk_1` FOREIGN KEY (`deviceId`) REFERENCES `userdevices` (`deviceId`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;

INSERT INTO `statistics` (`id`, `deviceId`, `income`, `date`)
VALUES
	(1,6,200,'2015-04-08 00:00:00'),
	(2,7,200,'2015-04-08 06:13:32'),
	(3,6,700,'2015-04-08 06:16:15'),
	(4,7,100,'2015-05-09 02:13:08'),
	(5,8,200,'2015-05-10 02:13:08'),
	(6,7,300,'2015-05-09 02:13:08'),
	(7,6,400,'2015-05-20 02:13:08'),
	(8,6,100,'2015-05-07 02:13:08'),
	(9,6,100,'2015-05-12 02:13:08'),
	(10,6,100,'2015-05-13 02:13:08'),
	(11,6,100,'2015-05-14 02:13:08'),
	(12,6,100,'2015-05-15 02:13:08'),
	(13,6,100,'2015-05-16 02:13:08'),
	(14,6,100,'2015-05-17 02:13:08'),
	(15,6,100,'2015-05-18 02:13:08'),
	(16,6,100,'2015-05-19 02:13:08'),
	(17,6,100,'2015-05-20 02:13:08'),
	(18,6,100,'2015-05-21 02:13:08'),
	(19,6,100,'2015-05-22 02:13:08'),
	(20,6,100,'2015-05-23 02:13:08'),
	(21,6,100,'2015-05-24 02:13:08'),
	(22,6,100,'2015-05-25 02:13:08'),
	(23,6,100,'2015-05-26 02:13:08'),
	(24,6,100,'2015-05-27 02:13:08'),
	(25,6,100,'2015-05-28 02:13:08'),
	(26,6,100,'2015-05-29 02:13:08'),
	(27,6,100,'2015-05-30 02:13:08'),
	(28,6,100,'2015-06-01 02:13:08'),
	(29,6,100,'2015-06-02 02:13:08'),
	(30,6,100,'2015-06-03 02:13:08'),
	(31,6,100,'2015-06-04 02:13:08'),
	(32,6,100,'2015-06-05 02:13:08'),
	(33,6,100,'2015-06-06 02:13:08'),
	(34,6,100,'2015-06-07 02:13:08'),
	(35,6,100,'2015-06-08 02:13:08'),
	(36,6,100,'2015-06-09 02:13:08'),
	(37,6,100,'2015-06-10 02:13:08'),
	(38,6,100,'2015-06-11 02:13:08'),
	(39,6,100,'2015-06-12 02:13:08'),
	(40,6,100,'2015-06-13 02:13:08'),
	(41,6,100,'2015-06-14 02:13:08'),
	(42,6,100,'2015-06-15 02:13:08'),
	(43,6,100,'2015-06-16 02:13:08'),
	(44,6,100,'2015-06-17 02:13:08'),
	(45,6,100,'2015-06-18 02:13:08'),
	(46,6,100,'2015-06-19 02:13:08'),
	(47,6,100,'2015-06-20 02:13:08'),
	(48,6,100,'2015-06-21 02:13:08'),
	(49,6,100,'2015-06-22 02:13:08'),
	(50,6,100,'2015-06-23 02:13:08'),
	(51,6,100,'2015-06-24 02:13:08'),
	(52,6,100,'2015-06-25 02:13:08'),
	(53,6,100,'2015-06-26 02:13:08'),
	(54,6,100,'2015-06-27 02:13:08'),
	(55,6,100,'2015-06-28 02:13:08'),
	(56,6,100,'2015-06-29 02:13:08'),
	(57,6,100,'2015-06-30 02:13:08');

/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table userdevices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userdevices`;

CREATE TABLE `userdevices` (
  `deviceId` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `deviceName` varchar(20) COLLATE utf8_bin NOT NULL,
  `purchaseDate` date NOT NULL,
  `deviceImage` varchar(255) CHARACTER SET utf8 DEFAULT '',
  PRIMARY KEY (`deviceId`),
  KEY `userID` (`userID`),
  CONSTRAINT `userdevices_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userId`),
  CONSTRAINT `userdevices_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

LOCK TABLES `userdevices` WRITE;
/*!40000 ALTER TABLE `userdevices` DISABLE KEYS */;

INSERT INTO `userdevices` (`deviceId`, `userID`, `deviceName`, `purchaseDate`, `deviceImage`)
VALUES
	(1,1,X'56582036383020776974682047534D','0000-00-00','https://shop.verifone.dk/Images/Produktbilleder/Billeder%20dankortterminaler/VX%20680/VX-680-1-verifone.png@p0x0-q85-M340x235-FrameNumber(1)-BG(Resources-ProductLargeBG.png).jpg'),
	(2,2,X'56582035323020436F6C6F72','0000-00-00','https://shop.verifone.dk/Images/Produktbilleder/Billeder%20dankortterminaler/VX%20520%20Color/VX520-product1.png@p0x0-q85-M340x235-FrameNumber(1)-BG(Resources-ProductLargeBG.png).jpg'),
	(3,3,X'56582036383020776974682057696669','2015-04-09','https://shop.verifone.dk/Images/Produktbilleder/Billeder%20dankortterminaler/VX%20680/VX-680-1-verifone.png@p0x0-q85-M340x235-FrameNumber(1)-BG(Resources-ProductLargeBG.png).jpg'),
	(4,3,X'56582036383020776974682057696669','2015-04-09','https://shop.verifone.dk/Images/Produktbilleder/Billeder%20dankortterminaler/VX%20680/VX-680-1-verifone.png@p0x0-q85-M340x235-FrameNumber(1)-BG(Resources-ProductLargeBG.png).jpg'),
	(6,4,X'56582036383020776974682057696669','2015-04-09','https://shop.verifone.dk/Images/Produktbilleder/Billeder%20dankortterminaler/VX%20680/VX-680-1-verifone.png@p0x0-q85-M340x235-FrameNumber(1)-BG(Resources-ProductLargeBG.png).jpg'),
	(7,4,X'56582035323020436F6C6F72','0000-00-00','https://shop.verifone.dk/Images/Produktbilleder/Billeder%20dankortterminaler/VX%20520%20Color/VX520-product1.png@p0x0-q85-M340x235-FrameNumber(1)-BG(Resources-ProductLargeBG.png).jpg'),
	(8,4,X'56582036383020776974682047534D','0000-00-00','https://shop.verifone.dk/Images/Produktbilleder/Billeder%20dankortterminaler/VX%20680/VX-680-1-verifone.png@p0x0-q85-M340x235-FrameNumber(1)-BG(Resources-ProductLargeBG.png).jpg');

/*!40000 ALTER TABLE `userdevices` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(70) COLLATE utf8_bin NOT NULL DEFAULT '',
  `firstName` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastName` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `phone` int(15) DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`userId`, `username`, `password`, `firstName`, `lastName`, `phone`, `email`)
VALUES
	(1,X'54455354',X'243279243130247030735A694A645461626A513474576A2E473959322E5446766376364B6B6D66464263787A686975514F5645764F486B545771316D',X'416E6F6E796D6F7573',X'49736D65',12345678,X'6173646C40676D61732E636363'),
	(2,X'5445535432',X'2432792431302464617344376145536C55677474456D6D6537665957753065723970586E4A4A61357176513258596946656730474C3044547A58394F',X'476C6173736573',X'486964656D65',87654321,X'73757065726D616E406F726269742E6561727468'),
	(3,X'5445535433',X'24327924313024484E426E7072686F6B6F6E474273786D36763254782E4C346D756A61396979454C575669316C383046454F4350795A686E2E6F5269',X'50686F746F',X'53686F70',23040234,X'7370696465726D616E40737469636B792E77616C6C'),
	(4,X'74657374',X'243279243130246E4D794D7A4452755A4F56594F6F306F62364D3063654A79585247443870726F35694D50496147516A5474796C654C714A586B4C69',X'4D61726B6B6F',X'4DC3A47274696E',12312312,X'6D61726B6B6F6D617274696E407772632E636F6D'),
	(5,X'6F736B6172',X'2432792431302477664E456A714F77544D58376375615279446436482E7677596A717648734B554461706874696C623161775976477252587862664F',X'4F736B6172',X'4D7572616E64',NULL,NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table verifoneDevices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `verifoneDevices`;

CREATE TABLE `verifoneDevices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deviceImage` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `deviceName` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
