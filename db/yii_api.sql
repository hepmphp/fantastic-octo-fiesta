/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : yii_api

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2018-01-18 16:50:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `code` char(2) NOT NULL,
  `name` char(52) NOT NULL,
  `population` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES ('BR', 'Brazil', '170115000');
INSERT INTO `country` VALUES ('CA', '\r\n', '1147000');
INSERT INTO `country` VALUES ('CN', 'China', '4000');
INSERT INTO `country` VALUES ('DE', 'Germany', '82164700');
INSERT INTO `country` VALUES ('FR', 'France', '59225700');
INSERT INTO `country` VALUES ('GB', 'United Kingdom', '59623400');
INSERT INTO `country` VALUES ('IN', 'India', '1013662000');
INSERT INTO `country` VALUES ('RU', 'Russia', '146934000');
INSERT INTO `country` VALUES ('US', 'United States', '278357000');

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1516168387');
INSERT INTO `migration` VALUES ('m130524_201442_init', '1516168390');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `expire_at` int(10) NOT NULL DEFAULT '0' COMMENT 'token过期时间',
  `allowance` int(11) DEFAULT '0' COMMENT '剩余的允许的请求数量',
  `allowance_updated_at` int(11) DEFAULT '0' COMMENT '相应的UNIX时间戳数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `password_reset_token` (`access_token`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'test', 'KoxWfdLuTuUG0xVeYv0zscvKCzvsghzB', '$2y$13$GgK.mBKIeXBXmJ1V2WIAxO8yKL/IzmqcoZezJ/aM0RsGN.w7AN5CS', '60201e75e59b15c79e002eaa4eb5506a', '', '10', '1516259245', '1516265215', '1518851467', '2', '1516265215');
INSERT INTO `user` VALUES ('4', 'test1', '3MpmStbmvHAcKDfNJMHZ7j0a8MuO2em5', '$2y$13$tg6lebHfLoLYyOD8uechY.ntQJsAZlIPLwSo7Qk3OitGNaz48XEnq', null, '', '10', '1516261123', '1516261123', '0', '0', '0');
INSERT INTO `user` VALUES ('5', 'test3', 'y51dL9EdedHB3uwivnkkImLumjeZXLsI', '$2y$13$U5/HAUbBXS9bP0/j1LwTyObJBVBg.t/AcTOMeFazvsrmJuOexMDU2', null, '', '10', '1516261129', '1516261129', '0', '0', '0');
INSERT INTO `user` VALUES ('6', 'test4', '_J3TBN22FH8-e2pumd1--Yzr8JVHWd39', '$2y$13$MDtJtJD5p8vm5zpP4HM3KudL0H.n1BmKJ9KvEaLrqiIWKSF8h6NUO', null, '', '10', '1516261132', '1516261132', '0', '0', '0');
