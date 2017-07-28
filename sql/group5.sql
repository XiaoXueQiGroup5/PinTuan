/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : group5

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-07-28 11:56:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `A_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `A_name` varchar(20) NOT NULL,
  `A_password` varchar(20) NOT NULL,
  `A_telphone` varchar(15) NOT NULL,
  `A_email` varchar(30) NOT NULL,
  `A_sex` varchar(5) NOT NULL,
  PRIMARY KEY (`A_id`),
  UNIQUE KEY `A_id` (`A_id`),
  UNIQUE KEY `A_name` (`A_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------

-- ----------------------------
-- Table structure for `picture`
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `Pic_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `Pic_address` varchar(50) NOT NULL,
  PRIMARY KEY (`Pic_id`),
  UNIQUE KEY `Pic_id` (`Pic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `A_id` int(10) NOT NULL AUTO_INCREMENT,
  `Ts_id` int(20) DEFAULT NULL,
  `P_telephone` varchar(64) DEFAULT NULL,
  `P_date` varchar(64) DEFAULT NULL,
  `P_tag` varchar(64) DEFAULT NULL,
  `P_tag2` varchar(64) DEFAULT NULL,
  `P_title` varchar(64) DEFAULT NULL,
  `P_description` varchar(2000) DEFAULT NULL,
  `Pic_url` varchar(1000) DEFAULT 'noPic',
  PRIMARY KEY (`A_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------

-- ----------------------------
-- Table structure for `publish_info`
-- ----------------------------
DROP TABLE IF EXISTS `publish_info`;
CREATE TABLE `publish_info` (
  `P_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `A_id` bigint(10) NOT NULL,
  `Ts_id` bigint(10) NOT NULL,
  `P_telphone` varchar(15) NOT NULL,
  `P_date` datetime NOT NULL,
  `P_tag` text,
  `P_description` text,
  `Pic_id` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`P_id`),
  UNIQUE KEY `P_id` (`P_id`),
  KEY `A_id` (`A_id`),
  KEY `Ts_id` (`Ts_id`),
  KEY `Pic_id` (`Pic_id`) USING BTREE,
  CONSTRAINT `publish_info_ibfk_1` FOREIGN KEY (`A_id`) REFERENCES `account` (`A_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `publish_info_ibfk_2` FOREIGN KEY (`Ts_id`) REFERENCES `type_ass` (`Ts_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `publish_info_ibfk_3` FOREIGN KEY (`Pic_id`) REFERENCES `picture` (`Pic_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publish_info
-- ----------------------------

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `T_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `T_name` varchar(20) NOT NULL,
  PRIMARY KEY (`T_id`),
  UNIQUE KEY `T_id` (`T_id`),
  UNIQUE KEY `T_name` (`T_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('3', '二手');
INSERT INTO `type` VALUES ('1', '同行');
INSERT INTO `type` VALUES ('4', '组队');
INSERT INTO `type` VALUES ('2', '购物');

-- ----------------------------
-- Table structure for `type_ass`
-- ----------------------------
DROP TABLE IF EXISTS `type_ass`;
CREATE TABLE `type_ass` (
  `Ts_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `T_id` bigint(10) NOT NULL,
  `Ts_name` varchar(20) NOT NULL,
  PRIMARY KEY (`Ts_id`),
  KEY `T_id` (`T_id`),
  CONSTRAINT `type_ass_ibfk_1` FOREIGN KEY (`T_id`) REFERENCES `type` (`T_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type_ass
-- ----------------------------
INSERT INTO `type_ass` VALUES ('1', '1', '北京');
INSERT INTO `type_ass` VALUES ('2', '1', '天津');
INSERT INTO `type_ass` VALUES ('3', '1', '上海');
INSERT INTO `type_ass` VALUES ('4', '1', '重庆');
INSERT INTO `type_ass` VALUES ('5', '1', '河北');
INSERT INTO `type_ass` VALUES ('6', '1', '山西');
INSERT INTO `type_ass` VALUES ('7', '1', '辽宁');
INSERT INTO `type_ass` VALUES ('8', '1', '吉林');
INSERT INTO `type_ass` VALUES ('9', '1', '黑龙江');
INSERT INTO `type_ass` VALUES ('10', '1', '江苏');
INSERT INTO `type_ass` VALUES ('11', '1', '浙江');
INSERT INTO `type_ass` VALUES ('12', '1', '安徽');
INSERT INTO `type_ass` VALUES ('13', '1', '福建');
INSERT INTO `type_ass` VALUES ('14', '1', '江西');
INSERT INTO `type_ass` VALUES ('15', '1', '山东');
INSERT INTO `type_ass` VALUES ('16', '1', '河南');
INSERT INTO `type_ass` VALUES ('17', '1', '湖北');
INSERT INTO `type_ass` VALUES ('18', '1', '湖南');
INSERT INTO `type_ass` VALUES ('19', '1', '广东');
INSERT INTO `type_ass` VALUES ('20', '1', '海南');
INSERT INTO `type_ass` VALUES ('21', '1', '四川');
INSERT INTO `type_ass` VALUES ('22', '1', '贵州');
INSERT INTO `type_ass` VALUES ('23', '1', '云南');
INSERT INTO `type_ass` VALUES ('24', '1', '陕西');
INSERT INTO `type_ass` VALUES ('25', '1', '甘肃');
INSERT INTO `type_ass` VALUES ('26', '1', '青海');
INSERT INTO `type_ass` VALUES ('27', '1', '台湾');
INSERT INTO `type_ass` VALUES ('28', '1', '内蒙古');
INSERT INTO `type_ass` VALUES ('29', '1', '广西');
INSERT INTO `type_ass` VALUES ('30', '1', '西藏');
INSERT INTO `type_ass` VALUES ('31', '1', '宁夏');
INSERT INTO `type_ass` VALUES ('32', '1', '新疆');
INSERT INTO `type_ass` VALUES ('33', '1', '香港');
INSERT INTO `type_ass` VALUES ('34', '1', '澳门');
INSERT INTO `type_ass` VALUES ('35', '1', '国外');
INSERT INTO `type_ass` VALUES ('36', '2', '女装');
INSERT INTO `type_ass` VALUES ('37', '3', '女装');
INSERT INTO `type_ass` VALUES ('38', '2', '男装');
INSERT INTO `type_ass` VALUES ('39', '3', '男装');
INSERT INTO `type_ass` VALUES ('40', '2', '鞋靴');
INSERT INTO `type_ass` VALUES ('41', '3', '鞋靴');
INSERT INTO `type_ass` VALUES ('42', '2', '美妆');
INSERT INTO `type_ass` VALUES ('43', '3', '美妆');
INSERT INTO `type_ass` VALUES ('44', '2', '书籍');
INSERT INTO `type_ass` VALUES ('45', '3', '书籍');
INSERT INTO `type_ass` VALUES ('46', '2', '美食');
INSERT INTO `type_ass` VALUES ('47', '3', '美食');
INSERT INTO `type_ass` VALUES ('48', '2', '数码');
INSERT INTO `type_ass` VALUES ('49', '3', '数码');
INSERT INTO `type_ass` VALUES ('50', '2', '杂货');
INSERT INTO `type_ass` VALUES ('51', '3', '杂货');
INSERT INTO `type_ass` VALUES ('52', '4', '比赛');
INSERT INTO `type_ass` VALUES ('53', '4', '其他');
