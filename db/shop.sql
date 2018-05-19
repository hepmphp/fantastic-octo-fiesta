/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : game_admin

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2018-05-19 18:21:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for shop_brand
-- ----------------------------
DROP TABLE IF EXISTS `shop_brand`;
CREATE TABLE `shop_brand` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT 'logo',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌官网地址',
  `is_recommand` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否推荐|0:是,-1:否',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品牌';

-- ----------------------------
-- Records of shop_brand
-- ----------------------------

-- ----------------------------
-- Table structure for shop_suppiler
-- ----------------------------
DROP TABLE IF EXISTS `shop_suppiler`;
CREATE TABLE `shop_suppiler` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '' COMMENT '供应商名称',
  `desc` varchar(255) DEFAULT '' COMMENT '供货商描述',
  `contact` varchar(60) DEFAULT '' COMMENT '联系人',
  `mobile` varchar(15) DEFAULT '' COMMENT '联系电话',
  `admin_id` int(10) DEFAULT '0' COMMENT '管理员',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态|0:正常,-1:禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供货商';

-- ----------------------------
-- Records of shop_suppiler
-- ----------------------------
