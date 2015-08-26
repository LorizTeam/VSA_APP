/*
Navicat MySQL Data Transfer

Source Server         : Database
Source Server Version : 50041
Source Host           : localhost:3306
Source Database       : vsadb

Target Server Type    : MYSQL
Target Server Version : 50041
File Encoding         : 65001

Date: 2015-08-26 10:03:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `gallery_master`
-- ----------------------------
DROP TABLE IF EXISTS `gallery_master`;
CREATE TABLE `gallery_master` (
  `galleryid` int(10) NOT NULL auto_increment,
  `galleryname` varchar(100) default NULL,
  PRIMARY KEY  (`galleryid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gallery_master
-- ----------------------------
INSERT INTO `gallery_master` VALUES ('1', 'บ้านเดี่ยว');
INSERT INTO `gallery_master` VALUES ('8', 'บ้านสองชั้น');
INSERT INTO `gallery_master` VALUES ('10', 'อาคารพาณิยช์');
INSERT INTO `gallery_master` VALUES ('11', 'ตึกแถว');
