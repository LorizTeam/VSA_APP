/*
Navicat MySQL Data Transfer

Source Server         : Database
Source Server Version : 50041
Source Host           : localhost:3306
Source Database       : vsadb

Target Server Type    : MYSQL
Target Server Version : 50041
File Encoding         : 65001

Date: 2015-10-01 13:27:02
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
  `status_read` varchar(2) default NULL,
  `status_type` varchar(1) default NULL,
  PRIMARY KEY  (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES ('1', 'สมชาย', 'S1Raccoon@gmail.com', 'ขอแบบบ้าน', 'ส่งมาให้ด้วยนะจ๊ะ', '2015-09-23 11:44:15', 'ur', 'b');
INSERT INTO `notifications` VALUES ('2', 'สมคิด', 'Noli_ham@gmail.com', 'ขอน้ำแดงแฟนต้า', 'สองขวด', '2015-09-24 11:44:54', 'ur', 'a');
INSERT INTO `notifications` VALUES ('3', 'สมจิต', 'Sanagki@gmail.com', 'ขอเบอร์', 'จุ๊บๆ', '2015-09-23 12:06:42', 'ur', 'a');
INSERT INTO `notifications` VALUES ('6', 'เศรษฐพงศ์', 'settgaphong@gmail.com', 'ขีบร้อง', 'ประสานเสียง', '2015-09-23 13:08:14', 'ur', 'a');
INSERT INTO `notifications` VALUES ('10', 'สุรวิทย์', 'surawit@gmail.com', 'น้ำมา', 'ให้รีบตัก', '2015-09-23 13:13:37', 'ur', 'a');
INSERT INTO `notifications` VALUES ('11', 'พงศธร', 'pongsatorn@gmail.com', 'น้ำลด', 'ปลากินมด', '2015-09-23 13:15:34', 'ur', 'a');
INSERT INTO `notifications` VALUES ('12', 'เศรษฐพงศ์ ธุรพันธ์กิจโชติ', 's1raccoon@email.com', 'ผัก', 'กวางตุ้ง ผักบุ้ง ผักคะน้า', '2015-09-28 13:24:41', 'ur', 'a');
INSERT INTO `notifications` VALUES ('13', 'เศรษฐพงศ์ ธุรพันธ์กิจโชติ', 's1raccoon@email.com', 'ขอแบบบ้าน', 'ขอนะครับ', '2015-09-30 14:53:23', 'ur', 'b');
INSERT INTO `notifications` VALUES ('18', 'รักคณิต มิตรไมตรี', 'noli@gmail.com', 'ขอแบบบ้าน', 'ขอนะครับ', '2015-09-30 15:58:20', 'ur', 'b');
INSERT INTO `notifications` VALUES ('19', 'เศรษฐพงศ์ ธุรพันธ์กิจโชติ', 's1raccoon@email.com', 'มีไรปะ', 'มีไรก็บอก', '2015-09-30 16:32:38', 'ur', 'a');
