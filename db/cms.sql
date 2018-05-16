/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : game_admin

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-05-17 00:05:50
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
-- Table structure for cms_attach
-- ----------------------------
DROP TABLE IF EXISTS `cms_attach`;
CREATE TABLE `cms_attach` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属分类',
  `tag_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '标签id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '附件名称',
  `file` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `width` int(10) NOT NULL DEFAULT '0' COMMENT '宽度',
  `height` int(10) NOT NULL DEFAULT '0' COMMENT '高度',
  `ext` varchar(255) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` varchar(255) NOT NULL DEFAULT '' COMMENT '文件大小',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='附件';

-- ----------------------------
-- Records of cms_attach
-- ----------------------------
INSERT INTO `cms_attach` VALUES ('41', '0', '1', '遥望1.png', 'uploads/20180512/b83b084de63446421118a2c806d09a68.png', '2380', '3366', 'png', '141074', '1526136927');
INSERT INTO `cms_attach` VALUES ('42', '0', '1', '遥望2.png', 'uploads/20180512/e2cf19718a61fd15b747e94bcb2b7c46.png', '2380', '3366', 'png', '81101', '1526136927');
INSERT INTO `cms_attach` VALUES ('43', '0', '1,2,3', '流浪歌手的情人1.png', 'uploads/20180512/c75026c6465c9c7253388688f2fbd605.png', '1860', '2631', 'png', '141474', '1526136927');
INSERT INTO `cms_attach` VALUES ('44', '0', '1,2,3', '有多少爱可以重来.png', 'uploads/20180512/d42a11712498c27ea32d0de0adbfa8c5.png', '2380', '3366', 'png', '305396', '1526136927');
INSERT INTO `cms_attach` VALUES ('45', '0', '1,2,3', '喜欢你.png', 'uploads/20180512/22957ca5860482fa498de3ed90a1efa5.png', '1785', '2525', 'png', '209770', '1526137788');
INSERT INTO `cms_attach` VALUES ('46', '0', '1,2,3', '喜欢你2.png', 'uploads/20180512/1b242b18acdb46493e523ee633c87bec.png', '1785', '2525', 'png', '195864', '1526137788');
INSERT INTO `cms_attach` VALUES ('47', '0', '1,2,3', '遥望1.png', 'uploads/20180512/681b44438af35695a3787df80c13f846.png', '2380', '3366', 'png', '141074', '1526137788');
INSERT INTO `cms_attach` VALUES ('48', '0', '1,2,3', '喜欢你2.png', 'uploads/20180512/7e7eade820d0c94aabc06bd8cd01816b.png', '1785', '2525', 'png', '195864', '1526137906');
INSERT INTO `cms_attach` VALUES ('49', '0', '1,2,3', '遥望1.png', 'uploads/20180512/5d174f89d0059fa2c7574d3f59e4199c.png', '2380', '3366', 'png', '141074', '1526137906');
INSERT INTO `cms_attach` VALUES ('50', '0', '1,2,3', '喜欢你2.png', 'uploads/20180512/3596ad0eb31470781a2a2c1b662fb6b3.png', '1785', '2525', 'png', '195864', '1526138001');
INSERT INTO `cms_attach` VALUES ('51', '0', '1,2,3', '遥望1.png', 'uploads/20180512/e2e901340c0cae39c004ccf3175594c4.png', '2380', '3366', 'png', '141074', '1526138001');
INSERT INTO `cms_attach` VALUES ('52', '0', '1,2,3', '喜欢你.png', 'uploads/20180512/bf7b6cfa0c14a7827b66943931ab6a7c.png', '1785', '2525', 'png', '209770', '1526141435');
INSERT INTO `cms_attach` VALUES ('53', '0', '1,2,3', '喜欢你2.png', 'uploads/20180512/33806c21b1b3129e0f09bc1c842a47fe.png', '1785', '2525', 'png', '195864', '1526141435');
INSERT INTO `cms_attach` VALUES ('54', '0', '1,2,3', '遥望1.png', 'uploads/20180512/f4c6666c503aa187b7ddc8a3b4c09375.png', '2380', '3366', 'png', '141074', '1526141435');
INSERT INTO `cms_attach` VALUES ('56', '0', '1,2,3', '喜欢你2.png', 'uploads/20180513/4a2bfb80a5dbf811648d7cc32412cd55.png', '1785', '2525', 'png', '195864', '1526177511');
INSERT INTO `cms_attach` VALUES ('57', '0', '1,2,3', '喜欢你2.png', 'uploads/20180513/5469981e004640cb8184b5b50b9fe25c.png', '1785', '2525', 'png', '195864', '1526178717');
INSERT INTO `cms_attach` VALUES ('59', '0', '0', '喜欢你.png', 'uploads/20180513/8a79c0efe5989466fda222fb6ce79c31.png', '1785', '2525', 'png', '209770', '1526178816');
INSERT INTO `cms_attach` VALUES ('61', '0', '1,2,3', '喜欢你2.png', 'uploads/20180513/4ff50ac51f5c089dd052d7bfa1e0b1f6.png', '1785', '2525', 'png', '195864', '1526178836');
INSERT INTO `cms_attach` VALUES ('62', '0', '1,2,3', '喜欢你2.png', 'uploads/20180513/c6f1f2cea6dcf965d070585066181d5e.png', '1785', '2525', 'png', '195864', '1526178945');
INSERT INTO `cms_attach` VALUES ('63', '0', '1,2,3', '遥望1.png', 'uploads/20180513/c58d8710b7a022e1769794863dcdd6ee.png', '2380', '3366', 'png', '141074', '1526178945');
INSERT INTO `cms_attach` VALUES ('64', '0', '0', '喜欢你2.png', 'uploads/20180513/0327ec84ce95520c1b0e5e00b4e5c148.png', '1785', '2525', 'png', '195864', '1526179030');
INSERT INTO `cms_attach` VALUES ('65', '0', '0', '遥望1.png', 'uploads/20180513/a1f67ce4e19332bae0ff5b038866e82d.png', '2380', '3366', 'png', '141074', '1526179030');
INSERT INTO `cms_attach` VALUES ('66', '0', '0', '遥望1.png', 'uploads/20180513/05e6fe817362a741e6ab46e765a89b9c.png', '2380', '3366', 'png', '141074', '1526179155');
INSERT INTO `cms_attach` VALUES ('67', '0', '0', '喜欢你2.png', 'uploads/20180513/7da14e0c014683a3529d383bc00a9991.png', '1785', '2525', 'png', '195864', '1526179155');
INSERT INTO `cms_attach` VALUES ('68', '0', '流行, 民谣', '遥望1.png', 'uploads/20180513/2e59eb8e987e55cdc1da09a0e0a33c3c.png', '2380', '3366', 'png', '141074', '1526180515');
INSERT INTO `cms_attach` VALUES ('69', '0', '1,3', '遥望1.png', 'uploads/20180513/8f54a59206f9c1673ad37781ebab7fa2.png', '2380', '3366', 'png', '141074', '1526180823');
INSERT INTO `cms_attach` VALUES ('70', '0', '1,2,3', '喜欢你.png', 'uploads/20180515/579a0bec3c606beff4ae70e118b2cf7b.png', '1785', '2525', 'png', '209770', '1526402533');
INSERT INTO `cms_attach` VALUES ('71', '0', '1,2,3', '喜欢你2.png', 'uploads/20180515/2122f5b9f5ddb4d8e4ddd44cb7473c7b.png', '1785', '2525', 'png', '195864', '1526402543');
INSERT INTO `cms_attach` VALUES ('72', '0', '1,2,3', '遥望1.png', 'uploads/20180515/aa88133707ad9b068e632c2ffe97df0b.png', '2380', '3366', 'png', '141074', '1526402543');
INSERT INTO `cms_attach` VALUES ('73', '0', '1,2,3', '喜欢你.png', 'uploads/20180515/df833b1e6f42d535501a0ff0b6a08994.png', '1785', '2525', 'png', '209770', '1526402543');

-- ----------------------------
-- Table structure for cms_attach_cate
-- ----------------------------
DROP TABLE IF EXISTS `cms_attach_cate`;
CREATE TABLE `cms_attach_cate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '父类id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '附件分类名称',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='附件分类';

-- ----------------------------
-- Records of cms_attach_cate
-- ----------------------------
INSERT INTO `cms_attach_cate` VALUES ('1', '0', '摇滚', '1525878527');
INSERT INTO `cms_attach_cate` VALUES ('2', '0', '流行', '1525878531');
INSERT INTO `cms_attach_cate` VALUES ('3', '0', ' 民谣', '1525878544');

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
