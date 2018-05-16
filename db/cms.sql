/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : game_admin

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2018-05-16 18:15:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_ad
-- ----------------------------
DROP TABLE IF EXISTS `cms_ad`;
CREATE TABLE `cms_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `block_id` int(11) NOT NULL DEFAULT '0' COMMENT '广告位置',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '广告标题',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `link_address` varchar(512) NOT NULL DEFAULT '' COMMENT '广告地址',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态|0:显示,1:不显示',
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `tag_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '标签id  ',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `admin` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='文章标签';

-- ----------------------------
-- Records of cms_tag
-- ----------------------------

-- ----------------------------
-- Table structure for pp_qq_user
-- ----------------------------
DROP TABLE IF EXISTS `pp_qq_user`;
CREATE TABLE `pp_qq_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT 'QQ用户唯一标示',
  `user_id` bigint(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `nickname` varchar(60) NOT NULL DEFAULT '' COMMENT 'QQ用户昵称',
  `figureurl_qq_1` varchar(255) NOT NULL DEFAULT '' COMMENT '大小为40×40像素的QQ头像URL',
  `figureurl_qq_2` varchar(255) NOT NULL DEFAULT '' COMMENT '大小为100×100像素的QQ头像URL',
  `gender` char(2) NOT NULL DEFAULT '' COMMENT '性别。 如果获取不到则默认返回"男"',
  `province` varchar(20) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '城市',
  `year` smallint(4) NOT NULL DEFAULT '0' COMMENT '出生年份',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='QQ账号凭证';

-- ----------------------------
-- Records of pp_qq_user
-- ----------------------------

-- ----------------------------
-- Table structure for pp_user
-- ----------------------------
DROP TABLE IF EXISTS `pp_user`;
CREATE TABLE `pp_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(60) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '电子邮件',
  `uuid` varchar(60) NOT NULL DEFAULT '' COMMENT '设备号',
  `mac` varchar(60) NOT NULL DEFAULT '' COMMENT '设备id',
  `android_id` varchar(60) NOT NULL DEFAULT '' COMMENT '安卓id',
  `reg_platform` tinyint(4) NOT NULL DEFAULT '0' COMMENT '注册来源 0 pc 1 安卓 2 IOS',
  `reg_ip` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册ip 转成int',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_time` int(10) unsigned NOT NULL COMMENT '最后登录时间',
  `last_login_ip` bigint(10) NOT NULL DEFAULT '0' COMMENT '最后一次登录ip 转成int',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态0正常 -1锁定',
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`status`),
  KEY `ip` (`reg_ip`),
  KEY `mobile` (`mobile`),
  KEY `reg_time` (`reg_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='passport用户表';

-- ----------------------------
-- Records of pp_user
-- ----------------------------

-- ----------------------------
-- Table structure for pp_user_info
-- ----------------------------
DROP TABLE IF EXISTS `pp_user_info`;
CREATE TABLE `pp_user_info` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `true_name` varchar(30) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `card_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '证据类型 0身份证',
  `card_no` varchar(20) NOT NULL DEFAULT '' COMMENT '证件号码',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='用户详情';

-- ----------------------------
-- Records of pp_user_info
-- ----------------------------

-- ----------------------------
-- Table structure for pp_weixin_user
-- ----------------------------
DROP TABLE IF EXISTS `pp_weixin_user`;
CREATE TABLE `pp_weixin_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `unionid` varchar(255) NOT NULL DEFAULT '' COMMENT '微信 unionid',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '微信用户唯一标示',
  `user_id` bigint(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `nickname` varchar(60) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `sex` tinyint(3) NOT NULL DEFAULT '0' COMMENT '性别',
  `province` varchar(20) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '城市',
  `headimgurl` varchar(255) NOT NULL DEFAULT '' COMMENT '头像地址',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unionid` (`unionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信账号凭证';

-- ----------------------------
-- Records of pp_weixin_user
-- ----------------------------
