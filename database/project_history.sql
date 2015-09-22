/*
Navicat MySQL Data Transfer

Source Server         : Database
Source Server Version : 50041
Source Host           : localhost:3306
Source Database       : vsadb

Target Server Type    : MYSQL
Target Server Version : 50041
File Encoding         : 65001

Date: 2015-09-22 13:26:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `project_history`
-- ----------------------------
DROP TABLE IF EXISTS `project_history`;
CREATE TABLE `project_history` (
  `customer_id` varchar(6) NOT NULL,
  `project_id` varchar(6) NOT NULL default '',
  `project_runno` varchar(6) NOT NULL default '',
  `structure` char(1) default NULL,
  `material_code` int(3) default NULL,
  `datetime` datetime default NULL,
  `qtyuse` varchar(6) default NULL,
  `amount_old` float(10,2) default NULL,
  `amount_new` float(10,2) default NULL,
  `amounttotal` float(10,2) default NULL,
  PRIMARY KEY  (`customer_id`,`project_id`,`project_runno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_history
-- ----------------------------
