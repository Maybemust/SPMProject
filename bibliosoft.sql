/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : bibliosoft

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2018-10-15 02:01:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `active`
-- ----------------------------
DROP TABLE IF EXISTS `active`;
CREATE TABLE `active` (
  `ID` varchar(20) NOT NULL,
  `account` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `affective` datetime NOT NULL,
  `flag` int(2) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of active
-- ----------------------------
INSERT INTO `active` VALUES ('1', 'diao', '1041405881@qq.com', '2018-10-15 16:34:59', '0');
INSERT INTO `active` VALUES ('2', 'diao', '1041405881@qq.com', '2018-10-15 16:37:06', '0');
INSERT INTO `active` VALUES ('3', 'diao', '1041405881@qq.com', '2018-10-15 16:39:23', '0');
INSERT INTO `active` VALUES ('4', 'diao', '1041405881@qq.com', '2018-10-15 16:40:53', '0');
INSERT INTO `active` VALUES ('5', 'diao', '1041405881@qq.com', '2018-10-15 16:43:02', '0');
INSERT INTO `active` VALUES ('6', 'diao', '1041405881@qq.com', '2018-10-15 16:45:02', '0');
INSERT INTO `active` VALUES ('7', 'diao', '1041405881@qq.com', '2018-10-15 23:40:16', '0');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `account` int(15) NOT NULL,
  `password` varchar(20) NOT NULL,
  `fine` float NOT NULL,
  `borrowedMaxinum` int(2) NOT NULL,
  `reservedMaxinum` int(2) NOT NULL,
  `reservedTime` int(3) NOT NULL,
  `fineTime` int(5) NOT NULL,
  `cash` float(10,0) NOT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '1', '2', '3', '3', '12', '1', '200');

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `barCode` varchar(20) NOT NULL,
  `bookName` varchar(20) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `author` varchar(40) NOT NULL,
  `publishing` varchar(40) NOT NULL,
  `location` varchar(40) DEFAULT NULL,
  `cover` mediumblob,
  `introduction` varchar(80) DEFAULT NULL,
  `status` int(1) NOT NULL COMMENT '0是可借，1是预约，2是被借出',
  `dateOfStorage` date DEFAULT NULL,
  `tag1` varchar(20) DEFAULT NULL,
  `tag2` varchar(20) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `isdelete` int(1) DEFAULT NULL,
  `deleteman` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`barCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', 'DS', 'ISBN-1', 'xx', 'xxx', 'xxx', null, 'zzz', '0', '2018-09-24', null, null, '100', null, null);
INSERT INTO `book` VALUES ('2', 'SO', 'ISBN-2', 'xx', 'xx', 'xx', null, 'zzz', '0', '2018-10-09', null, null, null, null, null);

-- ----------------------------
-- Table structure for `borrowedrecord`
-- ----------------------------
DROP TABLE IF EXISTS `borrowedrecord`;
CREATE TABLE `borrowedrecord` (
  `bRID` int(14) NOT NULL,
  `barCode` varchar(20) NOT NULL,
  `bookName` varchar(20) NOT NULL,
  `readerAccount` varchar(15) NOT NULL,
  `borrowedDate` date NOT NULL,
  `returnedDate` date NOT NULL,
  `fine` float DEFAULT NULL,
  PRIMARY KEY (`bRID`),
  KEY `BR_Book` (`barCode`),
  KEY `BR_Reader` (`readerAccount`),
  CONSTRAINT `BR_Book` FOREIGN KEY (`barCode`) REFERENCES `book` (`barCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BR_Reader` FOREIGN KEY (`readerAccount`) REFERENCES `reader` (`account`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrowedrecord
-- ----------------------------
INSERT INTO `borrowedrecord` VALUES ('1', '1', 'DS', 'diao', '2018-10-09', '2018-10-10', '0');

-- ----------------------------
-- Table structure for `librarian`
-- ----------------------------
DROP TABLE IF EXISTS `librarian`;
CREATE TABLE `librarian` (
  `account` int(15) NOT NULL,
  `password` varchar(20) NOT NULL,
  `tag` int(1) NOT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of librarian
-- ----------------------------
INSERT INTO `librarian` VALUES ('1', '1', '1');
INSERT INTO `librarian` VALUES ('2', '2', '2');
INSERT INTO `librarian` VALUES ('3', '3', '3');
INSERT INTO `librarian` VALUES ('4', '1', '0');
INSERT INTO `librarian` VALUES ('5', '1', '0');
INSERT INTO `librarian` VALUES ('6', '1', '0');
INSERT INTO `librarian` VALUES ('7', '1', '0');
INSERT INTO `librarian` VALUES ('10', '123', '0');
INSERT INTO `librarian` VALUES ('12', '123', '0');
INSERT INTO `librarian` VALUES ('15', '123', '0');

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `postID` varchar(14) NOT NULL,
  `author` varchar(20) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `text` varchar(2000) DEFAULT NULL,
  `postImage` varchar(1000) DEFAULT NULL,
  `postTitle` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`postID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------

-- ----------------------------
-- Table structure for `reader`
-- ----------------------------
DROP TABLE IF EXISTS `reader`;
CREATE TABLE `reader` (
  `account` varchar(15) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` int(11) NOT NULL,
  `fine` float NOT NULL,
  `borrowedNum` int(11) NOT NULL,
  `cashPledge` float NOT NULL,
  `tag` int(1) NOT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reader
-- ----------------------------
INSERT INTO `reader` VALUES ('diao', '111', '1041405881@qq.com', '123546', '0', '3', '300', '0');

-- ----------------------------
-- Table structure for `reservedrecord`
-- ----------------------------
DROP TABLE IF EXISTS `reservedrecord`;
CREATE TABLE `reservedrecord` (
  `rRID` int(14) NOT NULL,
  `bookName` varchar(20) NOT NULL,
  `time` datetime NOT NULL,
  `readerAccount` varchar(15) NOT NULL,
  `barCode` varchar(20) NOT NULL,
  `flag` int(2) NOT NULL,
  PRIMARY KEY (`rRID`),
  KEY `RR_Book` (`barCode`),
  KEY `RR_Reader` (`readerAccount`),
  CONSTRAINT `RR_Book` FOREIGN KEY (`barCode`) REFERENCES `book` (`barCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RR_Reader` FOREIGN KEY (`readerAccount`) REFERENCES `reader` (`account`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reservedrecord
-- ----------------------------
INSERT INTO `reservedrecord` VALUES ('1', 'DS', '2018-10-09 00:00:00', 'diao', '1', '1');
INSERT INTO `reservedrecord` VALUES ('2', 'OS', '2018-10-05 20:59:19', 'diao', '2', '1');
INSERT INTO `reservedrecord` VALUES ('3', 'DS', '2018-10-14 23:33:36', 'diao', '1', '0');

-- ----------------------------
-- Procedure structure for `update_reservedrecord`
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_reservedrecord`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_reservedrecord`()
UPDATE reservedrecord set flag=1 where TIME_TO_SEC(TIMEDIFF(now(),time))>7200
;
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `update_reserver`
-- ----------------------------
DROP EVENT IF EXISTS `update_reserver`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `update_reserver` ON SCHEDULE EVERY 1 MINUTE STARTS '2018-10-14 21:35:53' ON COMPLETION NOT PRESERVE ENABLE DO call update_reservedrecord()
;;
DELIMITER ;
