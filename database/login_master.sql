/*
Navicat MySQL Data Transfer

Source Server         : Database
Source Server Version : 50041
Source Host           : localhost:3306
Source Database       : vsadb

Target Server Type    : MYSQL
Target Server Version : 50041
File Encoding         : 65001

Date: 2015-07-17 16:21:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `login_master`
-- ----------------------------
DROP TABLE IF EXISTS `login_master`;
CREATE TABLE `login_master` (
  `username` varchar(30) NOT NULL default '',
  `password` varchar(100) default NULL,
  `name` varchar(100) default NULL,
  `type` varchar(3) default NULL,
  `date` date default NULL,
  `tel` char(10) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_master
-- ----------------------------
INSERT INTO `login_master` VALUES ('s1raccoon@email.com', 'jLIjfQZ5yojbZGTqxg2pY0VROWQ=', 'เศรษฐพงศ์ ธุรพันธ์กิจโชติ', 'amd', '2015-07-17', '0854498315');
