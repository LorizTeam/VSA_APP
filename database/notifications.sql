/*
Navicat MySQL Data Transfer

Source Server         : Database
Source Server Version : 50041
Source Host           : localhost:3306
Source Database       : vsadb

Target Server Type    : MYSQL
Target Server Version : 50041
File Encoding         : 65001

Date: 2015-09-23 12:28:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `notifications`
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `no` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `email` varchar(100) default NULL,
  `messagehd` varchar(50) default NULL,
  `messagedt` varchar(256) default NULL,
  `datetime` datetime default NULL,
  PRIMARY KEY  (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES ('1', 'สมชาย', 'S1Raccoon@gmail.com', 'ขอแบบบ้าน', 'ส่งมาให้ด้วยนะจ๊ะ', '2015-09-23 11:44:15');
INSERT INTO `notifications` VALUES ('2', 'สมคิด', 'Noli_ham@gmail.com', 'ขอน้ำแดงแฟนต้า', 'สองขวด', '2015-09-24 11:44:54');
INSERT INTO `notifications` VALUES ('3', 'สมจิต', 'Sanagki@gmail.com', 'ขอเบอร์', 'จุ๊บๆ', '2015-09-23 12:06:42');
