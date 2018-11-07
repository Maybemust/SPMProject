/*
Navicat MySQL Data Transfer

Source Server         : sc2
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : bibliosoft

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2018-11-06 22:13:00
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
INSERT INTO `active` VALUES ('10', 'null', '0', '2018-11-03 09:11:38', '0');
INSERT INTO `active` VALUES ('2', 'diao', '1041405881@qq.com', '2018-10-15 16:37:06', '0');
INSERT INTO `active` VALUES ('3', 'diao', '1041405881@qq.com', '2018-10-15 16:39:23', '0');
INSERT INTO `active` VALUES ('4', 'diao', '1041405881@qq.com', '2018-10-15 16:40:53', '0');
INSERT INTO `active` VALUES ('5', 'diao', '1041405881@qq.com', '2018-10-15 16:43:02', '0');
INSERT INTO `active` VALUES ('6', 'diao', '1041405881@qq.com', '2018-10-15 16:45:02', '0');
INSERT INTO `active` VALUES ('7', 'diao', '1041405881@qq.com', '2018-10-15 23:40:16', '0');
INSERT INTO `active` VALUES ('8', '18220193519', '985264344@qq.com', '2018-11-03 09:08:43', '0');
INSERT INTO `active` VALUES ('9', 'null', '0', '2018-11-03 09:11:16', '0');

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
INSERT INTO `admin` VALUES ('1', '1', '2', '3', '3', '12', '2', '200');

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
  `cover` varchar(10000) DEFAULT NULL,
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
INSERT INTO `book` VALUES ('9787040055535-01', '工程数学:复变函数(第四版)', '9787040055535', '西安交通大学高等数学教研室', '高等教育出版社', 'location', 'http://img7.doubanio.com/view/subject/s/public/s26239395.jpg', null, '0', '2018-11-01', 'tag1', 'tag2', '15.3', '0', null);
INSERT INTO `book` VALUES ('9787040055535-02', '工程数学:复变函数(第四版)', '9787040055535', '西安交通大学高等数学教研室', '高等教育出版社', 'location', 'http://img7.doubanio.com/view/subject/s/public/s26239395.jpg', null, '0', '2018-10-25', 'tag1', 'tag2', '15.3', '1', '1');
INSERT INTO `book` VALUES ('9787040248982-01', '概率论与数理统计', '9787040248982', 'none', 'none', 'location', 'http://img3.doubanio.com/view/subject/s/public/s5961367.jpg', null, '2', '2018-11-01', 'tag1', 'tag2', '26.6', '1', '1');
INSERT INTO `book` VALUES ('9787040248982-02', '概率论与数理统计', '9787040248982', 'none', 'none', 'location', 'http://img3.doubanio.com/view/subject/s/public/s5961367.jpg', null, '0', '2018-11-01', 'tag1', 'tag2', '26.6', '0', null);
INSERT INTO `book` VALUES ('9787040248982-03', '概率论与数理统计', '9787040248982', 'none', 'none', 'location', 'http://img3.doubanio.com/view/subject/s/public/s5961367.jpg', null, '0', '2018-11-02', 'tag1', 'tag2', '26.6', '0', null);
INSERT INTO `book` VALUES ('9787040248982-04', '概率论与数理统计', '9787040248982', 'none', 'none', 'location', 'http://img3.doubanio.com/view/subject/s/public/s5961367.jpg', null, '0', '2018-11-02', 'tag1', 'tag2', '26.6', '0', null);
INSERT INTO `book` VALUES ('9787040248982-05', '概率论与数理统计', '9787040248982', 'none', 'none', 'location', 'http://img3.doubanio.com/view/subject/s/public/s5961367.jpg', null, '0', '2018-11-02', 'tag1', 'tag2', '26.6', '0', null);
INSERT INTO `book` VALUES ('9787040248982-06', '概率论与数理统计', '9787040248982', 'none', 'none', 'location', 'http://img3.doubanio.com/view/subject/s/public/s5961367.jpg', null, '0', '2018-11-02', 'tag1', 'tag2', '26.6', '0', null);
INSERT INTO `book` VALUES ('9787040248982-07', '概率论与数理统计', '9787040248982', 'none', 'none', 'location', 'http://img3.doubanio.com/view/subject/s/public/s5961367.jpg', null, '0', '2018-11-02', 'tag1', 'tag2', '26.6', '0', null);
INSERT INTO `book` VALUES ('9787040248982-08', '概率论与数理统计', '9787040248982', 'none', 'none', 'location', 'http://img3.doubanio.com/view/subject/s/public/s5961367.jpg', 'the book has been deleted for lost', '2', '2018-11-02', 'tag1', 'tag2', '26.6', '1', '1');
INSERT INTO `book` VALUES ('9787111453789-01', '计算机网络（第6版）', '9787111453789', '[美]', '机械工业出版社', 'location', 'http://img7.doubanio.com/view/subject/s/public/s27667093.jpg', null, '0', '2018-11-01', 'tag1', 'tag2', '79', '0', null);
INSERT INTO `book` VALUES ('9787121194276-01', '信号与系统', '9787121194276', 'none', '电子工业出版社', 'location', 'http://img7.doubanio.com/view/subject/s/public/s25507582.jpg', null, '2', '2018-11-02', 'tag1', 'tag2', '69', '1', '1');
INSERT INTO `book` VALUES ('9787302148111-01', '数据结构', '9787302148111', '殷人昆', '清华大学', 'location', 'http://img7.doubanio.com/view/subject/s/public/s22791934.jpg', null, '2', '2018-11-01', 'tag1', 'tag2', '39', '1', '1');
INSERT INTO `book` VALUES ('9787302148111-02', '数据结构', '9787302148111', '殷人昆', '清华大学', 'location', 'http://img7.doubanio.com/view/subject/s/public/s22791934.jpg', null, '0', '2018-11-02', 'tag1', 'tag2', '39', '0', null);
INSERT INTO `book` VALUES ('9787302148144-01', 'success', '9787302148144', 'mengqiyi', 'npu', 'floor 2 north', '.\\imgs\\15146023143903242.jpg', null, '0', '2018-11-02', 'Milltary', 'Geography', '25', '1', '1');
INSERT INTO `book` VALUES ('9787302148144-02', 'success', '9787302148144', 'mengqiyi', 'npu', 'floor 2 north', '.\\imgs\\15146023143903242.jpg', null, '0', '2018-11-02', 'Milltary', 'Geography', '25', '0', null);
INSERT INTO `book` VALUES ('9787560560441-01', '辅导讲义册', '9787560560441', 'sc', 'npu publishing', 'floor 2 east', '.\\imgs\\imgsIMG_20170114_170850.jpg', null, '0', '2018-11-01', 'Music', 'Bibliography', '21', '0', null);
INSERT INTO `book` VALUES ('9787560560885-01', '辅导讲义', '9787560560885', 'WangNing', 'npu publishing', 'floor 3 north', '.\\imgs\\', null, '0', '2018-11-01', 'Milltary', 'Milltary', '20', '1', '1');
INSERT INTO `book` VALUES ('9787811181043-01', '数字媒体技术基础', '9787811181043', '张文俊', '上海大学出版社', 'location', 'http://img7.doubanio.com/view/subject/s/public/s5827590.jpg', null, '2', '2018-11-01', 'tag1', 'tag2', '38', '1', '1');
INSERT INTO `book` VALUES ('9787811181043-02', '数字媒体技术基础', '9787811181043', '张文俊', '上海大学出版社', 'location', 'http://img7.doubanio.com/view/subject/s/public/s5827590.jpg', null, '0', '2018-11-02', 'tag1', 'tag2', '38', '0', null);
INSERT INTO `book` VALUES ('9787811181043-03', '数字媒体技术基础', '9787811181043', '张文俊', '上海大学出版社', 'location', 'http://img7.doubanio.com/view/subject/s/public/s5827590.jpg', null, '0', '2018-11-02', 'tag1', 'tag2', '38', '0', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrowedrecord
-- ----------------------------
INSERT INTO `borrowedrecord` VALUES ('26', '9787811181043-01', '数字媒体技术基础', '18220193519', '2018-11-01', '2018-11-02', '0');
INSERT INTO `borrowedrecord` VALUES ('27', '9787560560441-01', '辅导讲义册', '18220193519', '2018-09-20', '2018-11-02', '26');
INSERT INTO `borrowedrecord` VALUES ('28', '9787302148111-01', '数据结构', '18220193519', '2018-09-08', '2018-11-02', '50');
INSERT INTO `borrowedrecord` VALUES ('29', '9787811181043-01', '数字媒体技术基础', '18220193519', '2018-09-03', '2018-11-02', '60');
INSERT INTO `borrowedrecord` VALUES ('30', '9787811181043-01', '数字媒体技术基础', '15006110287', '2018-09-11', '2018-11-02', '0');
INSERT INTO `borrowedrecord` VALUES ('31', '9787121194276-01', '信号与系统', '18220193519', '2018-09-03', '2018-11-02', '0');
INSERT INTO `borrowedrecord` VALUES ('32', '9787302148111-01', '数据结构', '18220193519', '2018-09-04', '2018-11-02', '0');
INSERT INTO `borrowedrecord` VALUES ('33', '9787040248982-01', '概率论与数理统计', '18220193519', '2018-09-05', '2018-11-02', '0');
INSERT INTO `borrowedrecord` VALUES ('34', '9787111453789-01', '计算机网络（第6版）', '15006110287', '2018-09-06', '2018-11-02', '54');
INSERT INTO `borrowedrecord` VALUES ('35', '9787811181043-02', '数字媒体技术基础', '18220193519', '2018-11-02', '2018-11-02', '0');
INSERT INTO `borrowedrecord` VALUES ('36', '9787811181043-02', '数字媒体技术基础', '18220193519', '2018-09-05', '2018-11-05', '62');
INSERT INTO `borrowedrecord` VALUES ('37', '9787811181043-02', '数字媒体技术基础', '18220193519', '2018-09-06', '2018-11-05', '60');
INSERT INTO `borrowedrecord` VALUES ('38', '9787040248982-08', '概率论与数理统计', '15006110287', '2018-11-05', '2018-11-05', '0');

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
INSERT INTO `dayilyincome` VALUES ('2018-10-30', '400', '20');
INSERT INTO `dayilyincome` VALUES ('2018-10-31', '0', '319');
INSERT INTO `dayilyincome` VALUES ('2018-11-01', '800', '217');
INSERT INTO `dayilyincome` VALUES ('2018-11-02', '400', '362.6');
INSERT INTO `dayilyincome` VALUES ('2018-11-05', '0', '148.6');

-- ----------------------------
-- Table structure for `label`
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES ('ABC');
INSERT INTO `label` VALUES ('Bibliography');
INSERT INTO `label` VALUES ('Fine Arts');
INSERT INTO `label` VALUES ('Geography');
INSERT INTO `label` VALUES ('Language');
INSERT INTO `label` VALUES ('MATHS');
INSERT INTO `label` VALUES ('Milltary');
INSERT INTO `label` VALUES ('Music');
INSERT INTO `label` VALUES ('Philososphy');
INSERT INTO `label` VALUES ('SCCCC');
INSERT INTO `label` VALUES ('scccccccc');
INSERT INTO `label` VALUES ('World History');

-- ----------------------------
-- Table structure for `librarian`
-- ----------------------------
DROP TABLE IF EXISTS `librarian`;
CREATE TABLE `librarian` (
  `account` int(15) NOT NULL,
  `password` varchar(20) NOT NULL,
  `tag` int(1) NOT NULL,
  `question` varchar(200) DEFAULT NULL,
  `answer` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of librarian
-- ----------------------------
INSERT INTO `librarian` VALUES ('1', '999', '1', '12', '12');
INSERT INTO `librarian` VALUES ('2', '2', '2', '12', '12');
INSERT INTO `librarian` VALUES ('3', '3', '3', null, null);
INSERT INTO `librarian` VALUES ('4', '1', '0', null, null);
INSERT INTO `librarian` VALUES ('5', '1', '0', null, null);
INSERT INTO `librarian` VALUES ('6', '1', '0', null, null);
INSERT INTO `librarian` VALUES ('10', '123', '0', null, null);
INSERT INTO `librarian` VALUES ('12', '123', '0', null, null);
INSERT INTO `librarian` VALUES ('15', '789', '1', null, null);
INSERT INTO `librarian` VALUES ('987', '987', '0', 'NO SECURE QUESTION', null);

-- ----------------------------
-- Table structure for `location`
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `location` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES ('floor dd');
INSERT INTO `location` VALUES ('floor five');
INSERT INTO `location` VALUES ('floor four');
INSERT INTO `location` VALUES ('floor meng qi yi');
INSERT INTO `location` VALUES ('floor sc');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('12', '1', '2018-11-02', '<p>welcome to our library!<br/></p>', null, 'Labrary post demon!');
INSERT INTO `post` VALUES ('13', '1', '2018-11-02', '<p>WELCOME <img src=\"/BiblioSoft//utf8-jsp/jsp/upload/image/20181102/1541123176547055253.jpg\" title=\"1541123176547055253.jpg\" alt=\"15146023143903242.jpg\"/></p>', null, 'ABC');

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
INSERT INTO `reader` VALUES ('13016753873', '12345678', 'scnwpu@163.com', '13016753873', '0', '0', '200', '0');
INSERT INTO `reader` VALUES ('15006110287', '12345678', 'study@npu.com', '15006110287', '0', '0', '200', '0');
INSERT INTO `reader` VALUES ('18220193519', '123', '985264344@qq.com', '18220193519', '0', '0', '200', '0');
INSERT INTO `reader` VALUES ('18601378310', '12345678', 'mengqiyi@npu.com', '18601378310', '0', '0', '200', '0');
INSERT INTO `reader` VALUES ('18710468762', '12345678', '273090615@qq.com', '18710468762', '0', '0', '200', '0');

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

-- ----------------------------
-- Procedure structure for `update_borrowed_fine`
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_borrowed_fine`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_borrowed_fine`()
BEGIN
UPDATE borrowedrecord set fine= fine + 1

where time_to_sec(TIMEDIFF(curdate(),borrowedDate))>2592000;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `update_reader_fine`
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_reader_fine`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_reader_fine`()
UPDATE reader set fine = (
SELECT SUM(fine)
FROM borrowedrecord
WHERE reader.account = borrowedrecord.readerAccount and time_to_sec(TIMEDIFF(curdate(),borrowedDate))>2592000
)
;
;;
DELIMITER ;

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
-- Event structure for `update_borrowed_fine`
-- ----------------------------
DROP EVENT IF EXISTS `update_borrowed_fine`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `update_borrowed_fine` ON SCHEDULE EVERY 1 DAY STARTS '2018-11-02 01:05:30' ON COMPLETION NOT PRESERVE ENABLE DO CALL update_borrowed_fine()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `update_order`
-- ----------------------------
DROP EVENT IF EXISTS `update_order`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `update_order` ON SCHEDULE EVERY 1 MINUTE STARTS '2018-10-19 19:56:56' ON COMPLETION NOT PRESERVE ENABLE DO call update_reservedrecord()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `update_ReaderFine`
-- ----------------------------
DROP EVENT IF EXISTS `update_ReaderFine`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `update_ReaderFine` ON SCHEDULE EVERY 1 DAY STARTS '2018-11-02 01:22:01' ON COMPLETION NOT PRESERVE ENABLE DO call update_reader_fine()
;;
DELIMITER ;
