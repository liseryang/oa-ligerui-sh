/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50521
Source Host           : localhost:3306
Source Database       : springmvc

Target Server Type    : MYSQL
Target Server Version : 50521
File Encoding         : 65001

Date: 2012-04-26 17:01:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `creteDate` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `depId` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('15', 'user', null, 'user', null, null, '2012-04-15', null, null, null);
INSERT INTO `user` VALUES ('16', null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('17', null, null, null, null, null, '2012-04-15', null, null, null);
INSERT INTO `user` VALUES ('18', null, null, null, null, null, '2012-04-15', null, null, null);
INSERT INTO `user` VALUES ('19', null, null, null, null, null, '2012-04-15', null, null, null);
INSERT INTO `user` VALUES ('20', 'zhangsan', null, 'zhangsan', null, null, '2012-04-15', null, null, null);
INSERT INTO `user` VALUES ('21', 'kkk', null, 'kkk', null, null, '2012-04-15', null, null, null);
INSERT INTO `user` VALUES ('22', 'fdaf', null, 'faf', null, null, '2012-04-15', null, null, null);
INSERT INTO `user` VALUES ('23', 'gggg', null, 'ggg', null, null, '2012-04-15', null, null, null);
INSERT INTO `user` VALUES ('24', 'fdas', null, 'fasf', null, null, '2012-04-15', null, null, null);
INSERT INTO `user` VALUES ('25', '32', null, '32', null, null, '2012-04-15', null, null, null);
INSERT INTO `user` VALUES ('26', '32', null, '32', null, null, '2012-04-15', null, null, null);
INSERT INTO `user` VALUES ('27', 'admin', null, 'admin', null, null, '2012-04-16', null, null, null);
INSERT INTO `user` VALUES ('28', '43', null, '43', null, null, '2012-04-17', null, null, null);
INSERT INTO `user` VALUES ('29', '4343', null, '4343', null, null, '2012-04-17', null, null, null);
INSERT INTO `user` VALUES ('30', '434343', null, '434343', null, null, '2012-04-17', null, null, null);
INSERT INTO `user` VALUES ('31', '434343434', null, '43434343', null, null, '2012-04-17', null, null, null);
INSERT INTO `user` VALUES ('32', '434343434434', null, '434', null, null, '2012-04-17', null, null, null);
INSERT INTO `user` VALUES ('33', '434343434434434', null, '', null, null, '2012-04-17', null, null, null);
INSERT INTO `user` VALUES ('34', '4343434344344344', null, '334', null, null, '2012-04-17', null, null, null);
INSERT INTO `user` VALUES ('35', '434343434434344344', null, '43', null, null, '2012-04-17', null, null, null);
INSERT INTO `user` VALUES ('36', '43434343443434344344', null, '43', null, null, '2012-04-17', null, null, null);
INSERT INTO `user` VALUES ('37', '4343434344433434344344', null, '43', null, null, '2012-04-17', null, null, null);
INSERT INTO `user` VALUES ('38', '43434343443433434344344', null, '43', null, null, '2012-04-17', null, null, null);
INSERT INTO `user` VALUES ('39', '43434343444343433434344344', null, '344', null, null, '2012-04-17', null, null, null);
INSERT INTO `user` VALUES ('40', '434343434', null, '43', null, null, '2012-04-17', null, null, null);
INSERT INTO `user` VALUES ('41', 'nnnnnn', null, 'nnnnnn', null, null, '2012-04-17', null, null, null);
INSERT INTO `user` VALUES ('42', '32', null, '32332', null, null, '2012-04-19', null, null, null);
INSERT INTO `user` VALUES ('43', null, null, null, null, null, '2012-04-19', null, null, null);
INSERT INTO `user` VALUES ('44', '', null, null, null, null, '2012-04-19', null, null, null);
INSERT INTO `user` VALUES ('45', '43434343444343433434344344', '32323232', '344', '1', '32323233232@qq.com2', null, null, null, '3232');
INSERT INTO `user` VALUES ('46', '43434343444343433434344344', '32323232', '344', '1', '32323233232@qq.com2', null, null, null, '3232');
INSERT INTO `user` VALUES ('47', '43434343444343433434344344', '', '344', '', '', null, null, null, '');
INSERT INTO `user` VALUES ('48', '344', '43434343', '434', '1', '43434', null, '43', null, '43');
INSERT INTO `user` VALUES ('49', '3441', '43434343', '434', '1', '43434', null, '43', null, '43');
INSERT INTO `user` VALUES ('50', '3441', '43434343', '434', '1', '43434', null, '43', null, '43');
INSERT INTO `user` VALUES ('51', '3441', '43434343', '434', '1', '43434', null, '43', null, '43');
INSERT INTO `user` VALUES ('52', '3441', '43434343', '434', '1', '43434', null, '43', null, '43');
INSERT INTO `user` VALUES ('53', '3441', '43434343', '434', '1', '43434', null, '43', null, '43');
INSERT INTO `user` VALUES ('54', '3441', '43434343', '434', '1', '43434', null, '43', null, '43');
INSERT INTO `user` VALUES ('55', '3441', '43434343', '434', '1', '43434', null, '43', null, '43');
INSERT INTO `user` VALUES ('56', '3441', '43434343', '434', '1', '43434', null, '43', null, '43');
INSERT INTO `user` VALUES ('57', '3441', '43434343', '434', '1', '43434', null, '43', null, '43');
INSERT INTO `user` VALUES ('65', '3441', '43434343', '434', '1', '43434', null, '43', null, '43');
INSERT INTO `user` VALUES ('66', '3441', '43434343', '434', '1', '43434', null, '43', null, '43');
INSERT INTO `user` VALUES ('67', '3441', '43434343', '434', '1', '43434', null, '43', null, '43');
INSERT INTO `user` VALUES ('69', '3441555', '43434343', '434', '1', '43434', null, '43', null, '43');
INSERT INTO `user` VALUES ('70', '3434', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('71', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('72', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('73', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('74', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('75', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('76', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('78', '', '', '', '', '', null, null, null, '');
INSERT INTO `user` VALUES ('79', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('80', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('84', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('85', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('86', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('87', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('88', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('89', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('90', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('91', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('92', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('93', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('94', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('95', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('96', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('97', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('98', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('99', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('100', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('101', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('102', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('103', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('104', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('106', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('107', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('108', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
INSERT INTO `user` VALUES ('109', '-----', '4343', '4343', '1', '4', null, '43433', null, '4343');
