/*
Navicat MySQL Data Transfer

Source Server         : Database
Source Server Version : 50041
Source Host           : localhost:3306
Source Database       : vsadb

Target Server Type    : MYSQL
Target Server Version : 50041
File Encoding         : 65001

Date: 2015-08-26 10:03:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `fileimage`
-- ----------------------------
DROP TABLE IF EXISTS `fileimage`;
CREATE TABLE `fileimage` (
  `imagename` varchar(50) NOT NULL default '',
  `galleryid` int(10) NOT NULL,
  `pathfile` varchar(100) default NULL,
  `status` varchar(2) default NULL,
  PRIMARY KEY  (`imagename`,`galleryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fileimage
-- ----------------------------
INSERT INTO `fileimage` VALUES ('2015-08-21 17-03-05-627.jpg', '10', 'upload/', 'dt');
INSERT INTO `fileimage` VALUES ('2015-08-21 17-03-02-435.jpg', '10', 'upload/', 'dt');
