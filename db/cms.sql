/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : game_admin

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2018-05-15 17:02:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_ad
-- ----------------------------
DROP TABLE IF EXISTS `cms_ad`;
CREATE TABLE `cms_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `block_id` int(11) NOT NULL DEFAULT '0' COMMENT '该条广告所属的广告位置',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '广告标题',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '广告图片链接地址',
  `link_address` varchar(512) NOT NULL DEFAULT '' COMMENT '广告链接地址',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0显示1不显示',
  `is_mobile` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是m版',
  PRIMARY KEY (`id`),
  KEY `block_id` (`id`,`block_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台广告';

-- ----------------------------
-- Records of cms_ad
-- ----------------------------

-- ----------------------------
-- Table structure for cms_ad_block
-- ----------------------------
DROP TABLE IF EXISTS `cms_ad_block`;
CREATE TABLE `cms_ad_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '区块名称',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='区块名称';

-- ----------------------------
-- Records of cms_ad_block
-- ----------------------------

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签id  ',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `admin_username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `content` longtext NOT NULL COMMENT '内容',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶 0普通 1置顶 2头条',
  `list_image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '列表显示图片',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0正常 -1 删除',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`id`,`cate_id`,`is_top`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台文章';

-- ----------------------------
-- Records of cms_article
-- ----------------------------

-- ----------------------------
-- Table structure for cms_article_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_category`;
CREATE TABLE `cms_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `description` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章分类';

-- ----------------------------
-- Records of cms_article_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_tag
-- ----------------------------
DROP TABLE IF EXISTS `cms_tag`;
CREATE TABLE `cms_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '标签名称',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cms标签';

-- ----------------------------
-- Records of cms_tag
-- ----------------------------
