/*
Navicat MySQL Data Transfer

Source Server         : Database
Source Server Version : 50041
Source Host           : localhost:3306
Source Database       : vsadb

Target Server Type    : MYSQL
Target Server Version : 50041
File Encoding         : 65001

Date: 2015-09-23 14:59:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `gallery_master`
-- ----------------------------
DROP TABLE IF EXISTS `gallery_master`;
CREATE TABLE `gallery_master` (
  `galleryid` int(10) NOT NULL auto_increment,
  `galleryname` varchar(100) default NULL,
  `description` varchar(100) default NULL,
  `amount` float(10,2) default '0.00',
  `timeuse` int(4) default '0',
  PRIMARY KEY  (`galleryid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gallery_master
-- ----------------------------
INSERT INTO `gallery_master` VALUES ('1', 'บ้านเดี่ยว', '2 ห้องนอน 8 ห้องน้ำ', '850000.00', '8');
INSERT INTO `gallery_master` VALUES ('2', 'บ้านสองชั้น', '4 ห้องนอน 2 ห้องน้ำ', '1200000.00', '12');
INSERT INTO `gallery_master` VALUES ('3', 'อาคารพาณิยช์', '4 ชั้น 3 ห้องน้ำ', '2300000.00', '10');
INSERT INTO `gallery_master` VALUES ('4', 'ตึกแถว', '3 ชั้น 2 ห้องน้ำ', '900000.00', '7');
