/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : bibliosoft

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2018-10-25 20:39:48
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
  `cover` varchar(1000) DEFAULT NULL,
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
INSERT INTO `book` VALUES ('1', 'DS', 'ISBN-1', 'xx', 'xxx', 'xxx', null, 'zzz', '0', '2018-09-24', null, null, '100', '0', null);
INSERT INTO `book` VALUES ('111111-01', '1111111', '111111', '11', '11', '11', null, null, '2', '2018-10-21', 'Milltary', 'Music', '45', '0', null);
INSERT INTO `book` VALUES ('111111-03', '1111111', '111111', '11', '11', '11', null, null, '0', '2018-10-21', 'Milltary', 'Music', '45', '0', null);
INSERT INTO `book` VALUES ('111111-04', '1111111', '111111', '11', '11', '11', null, null, '0', '2018-10-21', 'Milltary', 'Music', '45', '1', '1');
INSERT INTO `book` VALUES ('111111-05', '1111111', '111111', '11', '11', '11', null, null, '2', '2018-10-21', 'Milltary', 'Music', '45', '1', '1');
INSERT INTO `book` VALUES ('111111-06', '1111111', '111111', '11', '11', '11', null, null, '2', '2018-10-21', 'Milltary', 'Music', '45', '1', '1');
INSERT INTO `book` VALUES ('2', 'SO', 'ISBN-2', 'xx', 'xx', 'xx', 'http://pic19.nipic.com/20120308/4970979_102637717125_2.jpg', 'zzz', '2', '2018-10-09', null, null, null, '0', null);
INSERT INTO `book` VALUES ('222222222222222-01', '222222', '222222222222222', '2', '2', '2', null, null, '0', '2018-10-21', 'Milltary', 'Bibliography', '222', '0', null);
INSERT INTO `book` VALUES ('222222222222222-02', '222222', '222222222222222', '2', '2', '2', null, null, '0', '2018-10-21', 'Milltary', 'Bibliography', '222', '1', '1');
INSERT INTO `book` VALUES ('222222222222222-03', '222222', '222222222222222', '2', '2', '2', null, null, '0', '2018-10-21', 'Milltary', 'Bibliography', '222', '0', null);
INSERT INTO `book` VALUES ('222222222222222-04', '222222', '222222222222222', '2', '2', '2', null, null, '0', '2018-10-21', 'Milltary', 'Bibliography', '222', '1', '1');
INSERT INTO `book` VALUES ('222222222222222-05', '222222', '222222222222222', '2', '2', '2', null, null, '0', '2018-10-21', 'Milltary', 'Bibliography', '222', '1', '1');
INSERT INTO `book` VALUES ('3', '3', 'ISBN-2', '33', '33', '33', 'http://pic19.nipic.com/20120308/4970979_102637717125_2.jpg', '33', '1', '2018-10-18', '3', '33', '33', '1', '1');
INSERT INTO `book` VALUES ('4', '41', 'ISBN-2', '44', '44', '44', null, '', '0', '2018-10-04', 'Bibliography', 'World History', '12', '0', null);
INSERT INTO `book` VALUES ('566-01', '55', '566', '55', '55', '55', null, null, '0', '2018-10-21', 'Music', 'Bibliography', '5', '0', null);
INSERT INTO `book` VALUES ('566-02', '999', '566', '999', '999', '999', null, '999', '0', '2018-10-21', 'World History', 'Milltary', '99', '0', null);
INSERT INTO `book` VALUES ('566-03', '777', '566', '777', '777', '777', null, '777', '0', '2018-10-21', 'World History', 'Bibliography', '77', '1', '1');
INSERT INTO `book` VALUES ('566-04', '55', '566', '55', '55', '55', null, '', '0', '2018-10-21', '==none==', '==none==', '0.01', '0', null);
INSERT INTO `book` VALUES ('9787040055535-01', '工程数学:复变函数(第四版)', '9787040055535', '西安交通大学高等数学教研室', '高等教育出版社', 'location', null, '', '0', '2018-10-21', 'Bibliography', 'Milltary', '21', '0', null);
INSERT INTO `book` VALUES ('9787040055535-02', '工程数学:复变函数(第四版)', '9787040055535', '西安交通大学高等数学教研室', '高等教育出版社', 'location', null, null, '0', '2018-10-25', 'tag1', 'tag2', '15.3', '0', null);
INSERT INTO `book` VALUES ('9787040055535-03', '工程数学:复变函数(第四版)', '9787040055535', '西安交通大学高等数学教研室', '高等教育出版社', 'location', null, null, '0', '2018-10-25', 'tag1', 'tag2', '15.3', '0', null);
INSERT INTO `book` VALUES ('9787121194276-01', '信号与系统', '9787121194276', 'none', '电子工业出版社', 'location', 'http://img7.doubanio.com/view/subject/s/public/s25507582.jpg', null, '0', '2018-10-24', 'tag1', 'tag2', '69', '0', null);
INSERT INTO `book` VALUES ('9787121194276-02', '信号与系统', '9787121194276', 'none', '电子工业出版社', 'location', 'http://img7.doubanio.com/view/subject/s/public/s25507582.jpg', null, '0', '2018-10-25', 'tag1', 'tag2', '69', '0', null);
INSERT INTO `book` VALUES ('9787121194745-01', '中国电子商务年鉴', '9787121194745', '中国电子商务协会', '电子工业出版社', '2楼东', 'http://img7.doubanio.com/view/subject/s/public/s5827590.jpg', null, '0', '2018-10-25', 'Bibliography', 'Bibliography', '260', '0', null);
INSERT INTO `book` VALUES ('9787121194745-02', '中国电子商务年鉴', '9787121194745', '中国电子商务协会', '电子工业出版社', '2楼东', null, null, '0', '2018-10-25', 'Bibliography', 'Bibliography', '260', '0', null);
INSERT INTO `book` VALUES ('9787121194745-03', '中国电子商务年鉴', '9787121194745', '中国电子商务协会', '电子工业出版社', '2楼东', null, null, '0', '2018-10-25', 'Bibliography', 'Bibliography', '260', '0', null);
INSERT INTO `book` VALUES ('9787121194745-04', '中国电子商务年鉴', '9787121194745', '中国电子商务协会', '电子工业出版社', '2楼东', null, null, '0', '2018-10-25', 'Bibliography', 'Bibliography', '260', '0', null);
INSERT INTO `book` VALUES ('9787811181043-01', '数字媒体技术基础', '9787811181043', '张文俊', '上海大学出版社', 'location', 'http://img7.doubanio.com/view/subject/s/public/s5827590.jpg', null, '0', '2018-10-24', 'tag1', 'tag2', '38', '0', null);
INSERT INTO `book` VALUES ('9787811181043-02', '数字媒体技术基础', '9787811181043', '张文俊', '上海大学出版社', 'location', null, null, '0', '2018-10-24', 'tag1', 'tag2', '38', '0', null);
INSERT INTO `book` VALUES ('9787811181043-03', '数字媒体技术基础', '9787811181043', '张文俊', '上海大学出版社', 'location', null, null, '0', '2018-10-24', 'tag1', 'tag2', '38', '0', null);
INSERT INTO `book` VALUES ('9787811181043-04', '数字媒体技术基础', '9787811181043', '张文俊', '上海大学出版社', 'location', null, null, '0', '2018-10-24', 'tag1', 'tag2', '38', '0', null);
INSERT INTO `book` VALUES ('9787811181043-05', '数字媒体技术基础', '9787811181043', '张文俊', '上海大学出版社', 'location', null, null, '0', '2018-10-25', 'tag1', 'tag2', '38', '0', null);
INSERT INTO `book` VALUES ('9787811181043-06', '数字媒体技术基础', '9787811181043', '张文俊', '上海大学出版社', 'location', 'http://img7.doubanio.com/view/subject/s/public/s5827590.jpg', null, '0', '2018-10-25', 'tag1', 'tag2', '38', '0', null);
INSERT INTO `book` VALUES ('999-01', '999', '999', '999', '999', '999', null, null, '0', '2018-10-25', 'Music', 'Bibliography', '99', '1', '1');
INSERT INTO `book` VALUES ('999-02', '999', '999', '999', '999', '999', null, null, '0', '2018-10-25', 'Music', 'Bibliography', '99', '0', null);
INSERT INTO `book` VALUES ('999-03', '999', '999', '999', '999', '999', null, null, '0', '2018-10-25', 'Music', 'Bibliography', '99', '0', null);
INSERT INTO `book` VALUES ('999-04', '999', '999', '999', '999', '999', null, null, '0', '2018-10-25', 'Music', 'Bibliography', '99', '0', null);

-- ----------------------------
-- Table structure for `borrowedrecord`
-- ----------------------------
DROP TABLE IF EXISTS `borrowedrecord`;
CREATE TABLE `borrowedrecord` (
  `bRID` int(14) NOT NULL AUTO_INCREMENT,
  `barCode` varchar(20) NOT NULL,
  `bookName` varchar(20) NOT NULL,
  `readerAccount` varchar(15) NOT NULL,
  `borrowedDate` date NOT NULL,
  `returnedDate` date DEFAULT NULL,
  `fine` float DEFAULT NULL,
  PRIMARY KEY (`bRID`),
  KEY `BR_Book` (`barCode`),
  KEY `BR_Reader` (`readerAccount`),
  CONSTRAINT `BR_Book` FOREIGN KEY (`barCode`) REFERENCES `book` (`barCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BR_Reader` FOREIGN KEY (`readerAccount`) REFERENCES `reader` (`account`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrowedrecord
-- ----------------------------
INSERT INTO `borrowedrecord` VALUES ('2', '111111-04', '1111111', '182220193519', '2018-10-11', '2018-10-22', '0');
INSERT INTO `borrowedrecord` VALUES ('6', '111111-05', '1111111', 'diao', '2018-09-03', '2018-10-22', '38');
INSERT INTO `borrowedrecord` VALUES ('7', '111111-04', '1111111', 'diao', '2018-09-03', '2018-10-22', '38');
INSERT INTO `borrowedrecord` VALUES ('10', '111111-04', '1111111', 'diao', '2018-09-04', '2018-10-23', '38');
INSERT INTO `borrowedrecord` VALUES ('11', '111111-03', '1111111', 'diao', '2018-09-02', '2018-10-23', '42');
INSERT INTO `borrowedrecord` VALUES ('13', '9787811181043-06', '数字媒体技术基础', 'diao', '2018-10-25', '2018-10-25', '0');

-- ----------------------------
-- Table structure for `dayilyincome`
-- ----------------------------
DROP TABLE IF EXISTS `dayilyincome`;
CREATE TABLE `dayilyincome` (
  `date` date NOT NULL DEFAULT '0000-00-00',
  `cash` double DEFAULT NULL,
  `fine` double DEFAULT NULL,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dayilyincome
-- ----------------------------
INSERT INTO `dayilyincome` VALUES ('2018-10-09', '100', '200');
INSERT INTO `dayilyincome` VALUES ('2018-10-16', '150', '300');
INSERT INTO `dayilyincome` VALUES ('2018-10-23', '400', '146');
INSERT INTO `dayilyincome` VALUES ('2018-10-25', '200', '0');

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
INSERT INTO `librarian` VALUES ('10', '123', '0');
INSERT INTO `librarian` VALUES ('12', '123', '0');
INSERT INTO `librarian` VALUES ('15', '789', '1');

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `postID` int(14) NOT NULL AUTO_INCREMENT,
  `author` varchar(20) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `text` varchar(2000) DEFAULT NULL,
  `postImage` varchar(1000) DEFAULT NULL,
  `postTitle` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`postID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('1', '1', '2018-10-21', '<p><img src=\"/BiblioSoft//utf8-jsp/jsp/upload/image/20181021/1540101947145069423.jpg\" title=\"1540101947145069423.jpg\" alt=\"IMG_20170114_170850.jpg\"/><br/><br/><br/><span style=\"font-size: 24px;\">宋昌<br/>宋昌<br/>宋昌<br/>宋昌<br/>宋昌<br/>宋昌<br/>宋昌<br/>宋昌<br/>宋昌<br/>宋昌<br/></span><span style=\"font-size: 36px;\"><span style=\"font-size: 24px;\">宋昌<br/></span><span style=\"font-size: 24px;\">宋昌<br/></span><span style=\"font-size: 24px;\">宋昌<br/></span><span style=\"font-size: 24px;\">宋昌<br/></span><span style=\"font-size: 24px;\">宋昌<br/></span><span style=\"font-size: 24px;\">宋昌<br/></span><span style=\"font-size: 24px;\">宋昌<br/></span><span style=\"font-size: 24px;\">宋昌<br/></span><span style=\"font-size: 24px;\">宋昌<br/></span><span style=\"font-size: 24px;\">宋昌<br/></span></span></p>', '/BiblioSoft//utf8-jsp/jsp/upload/image/20181021/1540101947145069423.jpg', '8');
INSERT INTO `post` VALUES ('2', '1', '2018-10-22', '<p><img src=\"/BiblioSoft//utf8-jsp/jsp/upload/image/20181021/1540102472817025424.jpg\" title=\"1540102472817025424.jpg\" alt=\"sc.jpg.jpg\"/><br/>post</p>', '/BiblioSoft//utf8-jsp/jsp/upload/image/20181021/1540102472817025424.jpg', '7');
INSERT INTO `post` VALUES ('3', '1', '2018-10-21', '<p><img src=\"/BiblioSoft//utf8-jsp/jsp/upload/image/20181021/1540103083558021236.jpg\" title=\"1540103083558021236.jpg\" alt=\"IMG_20170114_170850.jpg\"/><br/><br/><span style=\"font-size: 36px;\"><span style=\"font-size: 36px;\">宋昌<br/></span><span style=\"font-size: 36px;\">宋昌<br/></span><span style=\"font-size: 36px;\">宋昌<br/></span><span style=\"font-size: 36px;\">宋昌<br/></span><span style=\"font-size: 36px;\">宋昌<br/></span><span style=\"font-size: 36px;\">宋昌<br/></span><span style=\"font-size: 36px;\">宋昌<br/></span><span style=\"font-size: 36px;\">宋昌<br/></span><span style=\"font-size: 36px;\">宋昌<br/></span><span style=\"font-size: 36px;\">宋昌<br/></span><span style=\"font-size: 36px;\">宋昌<br/></span><span style=\"font-size: 36px;\">宋昌<br/></span><span style=\"font-size: 36px;\">宋昌<br/></span><span style=\"font-size: 36px;\">宋昌<br/></span><span style=\"font-size: 36px;\">宋昌<br/></span><span style=\"font-size: 36px;\">宋昌<br/></span><span style=\"font-size: 36px;\">宋昌<br/></span></span><br/></p>', '/BiblioSoft//utf8-jsp/jsp/upload/image/20181021/1540103083558021236.jpg', '6');
INSERT INTO `post` VALUES ('8', '1', '2018-10-22', '<p>111111111111111111111<img src=\"/BiblioSoft//utf8-jsp/jsp/upload/image/20181022/1540139274558042713.png\" title=\"1540139274558042713.png\" alt=\")@YRFJ3L}9WMM}DX`R8$%~M.png\"/></p>', '/BiblioSoft//utf8-jsp/jsp/upload/image/20181021/1540103083558021236.jpg', '<p>111111111111111111111<br/></p>');

-- ----------------------------
-- Table structure for `reader`
-- ----------------------------
DROP TABLE IF EXISTS `reader`;
CREATE TABLE `reader` (
  `account` varchar(15) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` bigint(14) NOT NULL,
  `fine` float NOT NULL,
  `borrowedNum` int(11) NOT NULL,
  `cashPledge` float NOT NULL,
  `tag` int(1) NOT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reader
-- ----------------------------
INSERT INTO `reader` VALUES ('13016753873', '12345678', '119@qq.com', '13016753873', '0', '0', '200', '0');
INSERT INTO `reader` VALUES ('182220193519', '333', '111@qq.com', '182220193519', '1', '2', '100', '0');
INSERT INTO `reader` VALUES ('189787', '12345678', '777@qq.com', '189787', '0', '0', '200', '0');
INSERT INTO `reader` VALUES ('2016303152', 'songchang', '252@qq.com', '2016303152', '0', '0', '200', '0');
INSERT INTO `reader` VALUES ('321311', '12345678', '321@qq.com', '321311', '0', '0', '200', '0');
INSERT INTO `reader` VALUES ('746446', '12345678', '77@qq.com', '746446', '0', '0', '200', '0');
INSERT INTO `reader` VALUES ('999988', '12345678', '988@qq.com', '999988', '0', '0', '200', '0');
INSERT INTO `reader` VALUES ('diao', '222', '985264344@qq.com', '123546', '0', '3', '200', '0');

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
;;
DELIMITER ;
