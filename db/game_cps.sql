/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : game_cps

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-08-01 00:41:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for game_game
-- ----------------------------
DROP TABLE IF EXISTS `game_game`;
CREATE TABLE `game_game` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '游戏名称',
  `comment` varchar(255) DEFAULT '' COMMENT '简介',
  `cate_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '游戏类别',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '接入状态|-2:未接入,-1:删除,0:接入,1:测试,2:停止运营',
  `game_login_url` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏登录接口',
  `game_login_key` varchar(100) NOT NULL DEFAULT '' COMMENT '游戏登录key',
  `game_recharge_url` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏充值接口地址',
  `game_recharge_key` varchar(100) NOT NULL DEFAULT '' COMMENT '游戏充值key',
  `role_verify_url` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏角色验证地址',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='游戏';

-- ----------------------------
-- Records of game_game
-- ----------------------------
INSERT INTO `game_game` VALUES ('1', '一剑逍遥', '一键下月', '0', '0', 'xxx', 'xxx', 'xxx', 'xxx', 'xxx', '1531559600');

-- ----------------------------
-- Table structure for game_server
-- ----------------------------
DROP TABLE IF EXISTS `game_server`;
CREATE TABLE `game_server` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(10) NOT NULL DEFAULT '0' COMMENT '游戏id',
  `server_name` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器名称',
  `game_server_id` int(10) NOT NULL DEFAULT '0' COMMENT '服务器编号',
  `open_time` int(10) NOT NULL DEFAULT '0' COMMENT '真实开服时间:到这个时间后，白名单用户可以进入游戏',
  `status` tinyint(1) NOT NULL COMMENT '运营状态:-3逻辑删除-2维护-1测试0正常开启1火爆',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区服列表';

-- ----------------------------
-- Records of game_server
-- ----------------------------

-- ----------------------------
-- Table structure for ga_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `ga_admin_group`;
CREATE TABLE `ga_admin_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分组名称',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT '分组说明',
  `mids` text NOT NULL COMMENT '用户组权限id',
  `allow_mutil_login` tinyint(4) NOT NULL DEFAULT '1' COMMENT '允许多人登录 0否 1是',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户分组';

-- ----------------------------
-- Records of ga_admin_group
-- ----------------------------
INSERT INTO `ga_admin_group` VALUES ('1', '超级管理员', '超级管理员', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68', '1', '0');

-- ----------------------------
-- Table structure for ga_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `ga_admin_log`;
CREATE TABLE `ga_admin_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `platform_id` int(10) NOT NULL DEFAULT '0' COMMENT '平台id',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `ip` varchar(16) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `m` varchar(50) NOT NULL DEFAULT '' COMMENT '控制器',
  `a` varchar(50) NOT NULL DEFAULT '' COMMENT '方法',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `log_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '日志类型 1添加2修改3删除4登录成功5登录失败',
  `info` varchar(255) NOT NULL DEFAULT '' COMMENT '操作说明',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '登录状态 1成功0失败',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='管理员操作日志';

-- ----------------------------
-- Records of ga_admin_log
-- ----------------------------
INSERT INTO `ga_admin_log` VALUES ('1', '1', '0', 'sysadmin', '192.168.71.21', '', '', '1531555670', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('2', '1', '0', 'sysadmin', '192.168.71.21', '', '', '1531555675', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('3', '1', '0', 'sysadmin', '192.168.71.21', '', '', '1531556912', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('4', '1', '0', 'sysadmin', '192.168.71.21', '', '', '1531556917', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('5', '1', '0', 'sysadmin', '192.168.71.21', '', '', '1531556922', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('6', '1', '0', 'sysadmin', '192.168.71.21', '', '', '1531556931', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('7', '1', '0', 'sysadmin', '192.168.71.21', '', '', '1531556938', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('8', '1', '0', 'sysadmin', '192.168.71.21', '', '', '1531556940', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('9', '1', '0', 'sysadmin', '192.168.71.21', '', '', '1531556949', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('10', '1', '0', 'sysadmin', '192.168.71.21', '', '', '1531557435', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('11', '1', '0', 'sysadmin', '192.168.71.21', '', '', '1531557445', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('12', '1', '0', 'sysadmin', '192.168.71.21', '', '', '1531557451', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('13', '1', '0', 'sysadmin', '192.168.71.21', '', '', '1531557455', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('14', '1', '0', 'sysadmin', '192.168.71.21', '', '', '1531557657', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('15', '1', '0', 'sysadmin', '192.168.71.21', '', '', '1531557662', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('16', '1', '0', 'sysadmin', '192.168.71.21', '', '', '1531557689', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('17', '1', '0', 'sysadmin', '192.168.71.21', '', '', '1531558189', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('18', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1532858383', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('19', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1532874976', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('20', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1532875290', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('21', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1532876448', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('22', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1532955411', '4', '登录成功', '1');

-- ----------------------------
-- Table structure for ga_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `ga_admin_menu`;
CREATE TABLE `ga_admin_menu` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '菜单上一级id',
  `top_menu_id` int(11) DEFAULT '0',
  `model` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '方法',
  `data` char(50) NOT NULL DEFAULT '' COMMENT '业务数据',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单状态 -1 隐藏  0正常',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '菜单级别 0 1 2 3 4 依次递增',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='后台菜单';

-- ----------------------------
-- Records of ga_admin_menu
-- ----------------------------
INSERT INTO `ga_admin_menu` VALUES ('1', '0', '1', 'ga-admin-menu', 'index', '', '0', '系统设置', '一级菜单', '101', '0');
INSERT INTO `ga_admin_menu` VALUES ('2', '1', '1', 'ga-admin-menu', 'index', '', '0', '菜单列表', '', '1', '1');
INSERT INTO `ga_admin_menu` VALUES ('3', '2', '1', 'ga-admin-menu', 'create', '', '-1', '菜单添加', '', '2', '2');
INSERT INTO `ga_admin_menu` VALUES ('4', '2', '1', 'ga-admin-menu', 'update', '', '-1', '菜单修改', '', '3', '2');
INSERT INTO `ga_admin_menu` VALUES ('5', '2', '1', 'ga-admin-menu', 'delete', '', '-1', '菜单删除', '', '4', '2');
INSERT INTO `ga_admin_menu` VALUES ('6', '2', '1', 'ga-admin-menu', 'index', '', '0', '菜单列表', '', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('7', '2', '1', 'ga-admin-menu', 'ajax-get-config-menu', '', '-1', '获取菜单', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('8', '1', '1', 'ga-admin-group', 'index', '', '0', '用户组', '', '2', '1');
INSERT INTO `ga_admin_menu` VALUES ('9', '8', '1', 'ga-admin-group', 'index', '', '0', '用户组列表', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('10', '8', '1', 'ga-admin-group', 'create', '', '-1', '用户组添加', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('11', '8', '1', 'ga-admin-group', 'update', '', '-1', '用户组修改', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('12', '8', '1', 'ga-admin-group', 'delete', '', '-1', '用户组删除', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('13', '8', '1', 'ga-admin-group', 'edit-permission', '', '-1', '编辑权限', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('14', '8', '1', 'ga-admin-group', 'menu', '', '-1', '获取菜单', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('15', '1', '1', 'ga-admin-user', 'index', '', '0', '用户管理', '', '3', '1');
INSERT INTO `ga_admin_menu` VALUES ('16', '15', '1', 'ga-admin-user', 'index', '', '0', '用户列表', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('17', '15', '1', 'ga-admin-user', 'create', '', '-1', '用户添加', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('18', '15', '1', 'ga-admin-user', 'update', '', '-1', '用户修改', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('19', '15', '1', 'ga-admin-user', 'delete', '', '-1', '用户删除', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('20', '15', '1', 'ga-admin-user', 'edit-password', '', '-1', '修改密码', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('21', '15', '1', 'ga-admin-user', 'edit-permission', '', '-1', '权限修改', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('22', '0', '22', 'developer', 'index', '', '0', '开发工具', '', '100', '0');
INSERT INTO `ga_admin_menu` VALUES ('23', '22', '22', 'gii', '', '', '0', '开发工具', '', '0', '1');
INSERT INTO `ga_admin_menu` VALUES ('24', '23', '22', 'gii', '', '', '0', 'gii', '', '2', '2');
INSERT INTO `ga_admin_menu` VALUES ('25', '23', '22', 'developer', 'index', '', '0', '开发工具', '', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('26', '23', '22', 'developer', 'preview', '', '-1', '表单生成预览', '', '2', '2');
INSERT INTO `ga_admin_menu` VALUES ('27', '23', '22', 'developer', 'create-js', '', '-1', '生成js', '', '2', '2');
INSERT INTO `ga_admin_menu` VALUES ('28', '0', '28', 'cms/cms-article', 'index', '', '0', 'CMS', 'cms', '3', '0');
INSERT INTO `ga_admin_menu` VALUES ('29', '28', '28', 'cms/default', 'index', '', '0', '附件管理', '0', '0', '1');
INSERT INTO `ga_admin_menu` VALUES ('30', '29', '28', 'cms/default', 'index', '', '0', '附件列表', '备注', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('31', '30', '28', 'cms/default', 'add', '', '0', '附件添加', '附件', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('32', '29', '28', 'cms/attach-cate', 'index', '0', '-1', '附件分类管理', 'cms', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('33', '32', '28', 'cms/attach-cate', 'add', '', '0', '添加', '附件分类', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('34', '32', '28', 'cms/attach-cate', 'search', '', '-1', '附件下拉搜索', '', '1', '3');
INSERT INTO `ga_admin_menu` VALUES ('35', '28', '28', 'cms/cms-ad', 'index', '', '0', '广告管理', 'cms', '0', '1');
INSERT INTO `ga_admin_menu` VALUES ('36', '35', '28', 'cms/cms-ad', 'index', '', '0', '广告管理', 'cms', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('37', '35', '28', 'cms/cms-ad-block', 'index', '', '0', '广告区块', 'cms', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('38', '36', '28', 'cms/cms-ad', 'index', '', '0', '广告列表', 'cms', '1', '3');
INSERT INTO `ga_admin_menu` VALUES ('39', '36', '28', 'cms/cms-ad', 'create', '', '0', '广告添加', 'cms', '1', '3');
INSERT INTO `ga_admin_menu` VALUES ('40', '36', '28', 'cms/cms-ad', 'update', '', '0', '广告修改', 'cms', '1', '3');
INSERT INTO `ga_admin_menu` VALUES ('41', '36', '28', 'cms/cms-ad', 'delete', '', '0', '广告删除', 'cms', '1', '3');
INSERT INTO `ga_admin_menu` VALUES ('42', '37', '28', 'cms/cms-ad-block', 'index', '', '0', '区块列表', 'cms', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('43', '37', '28', 'cms/cms-ad-block', 'create', '', '0', '区块添加', 'cms', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('44', '37', '28', 'cms/cms-ad-block', 'update', '', '0', '区块修改', 'cms', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('45', '37', '28', 'cms/cms-ad-block', 'delete', '', '0', '区块删除', 'cms', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('46', '28', '28', 'cms/cms-article', 'index', '', '0', '资讯管理', 'cms', '0', '1');
INSERT INTO `ga_admin_menu` VALUES ('47', '51', '28', 'cms/cms-article', 'index', '', '0', '资讯列表', 'cms', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('48', '51', '28', 'cms/cms-article', 'create', '', '0', '资讯添加', 'cms', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('49', '51', '28', 'cms/cms-article', 'update', '', '0', '资讯修改', 'cms', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('50', '51', '28', 'cms/cms-article', 'delete', '', '0', '资讯删除', 'cms', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('51', '46', '28', 'cms/cms-article', 'index', '', '0', '资讯管理', 'cms', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('52', '46', '28', 'cms/cms-article-category', 'index', '', '0', '分类管理', 'cms', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('53', '46', '28', 'cms/cms-tag', 'index', '', '0', '标签管理', 'cms', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('54', '52', '28', 'cms/cms-article-category', 'index', '', '0', '分类列表', 'cms', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('55', '52', '28', 'cms/cms-article-category', 'create', '', '0', '分类添加', 'cms', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('56', '52', '28', 'cms/cms-article-category', 'update', '', '0', '分类修改', 'cms', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('57', '52', '28', 'cms/cms-article-category', 'delete', '', '0', '分类删除', 'cms', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('58', '53', '28', 'cms/cms-tag', 'index', '', '0', '标签列表', 'cms', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('59', '53', '28', 'cms/cms-tag', 'create', '', '0', '标签添加', 'cms', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('60', '53', '28', 'cms/cms-tag', 'update', '', '0', '标签修改', 'cms', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('61', '53', '28', 'cms/cms-tag', 'delete', '', '0', '标签删除', 'cms', '4', '3');
INSERT INTO `ga_admin_menu` VALUES ('62', '0', '62', 'game/game-game', 'index', '', '0', '游戏', '', '0', '0');
INSERT INTO `ga_admin_menu` VALUES ('63', '68', '62', 'game/game-game', 'index', '', '0', '游戏列表', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('64', '68', '62', 'game/game-game', 'create', '', '0', '游戏添加', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('65', '68', '62', 'game/game-game', 'update', '', '0', '游戏修改', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('66', '68', '62', 'game/game-game', 'delete', '', '0', '游戏删除', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('67', '62', '62', 'game/game-game', 'index', '', '0', '游戏', '', '0', '1');
INSERT INTO `ga_admin_menu` VALUES ('68', '67', '62', 'game/game-game', 'index', '', '0', '游戏管理', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('69', '62', '62', 'game/pp-user', 'index', '', '0', '用户', '', '0', '1');
INSERT INTO `ga_admin_menu` VALUES ('70', '69', '62', 'game/pp-user', 'index', '', '0', '用户列表', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('71', '62', '62', 'game/pp-order', 'index', '', '0', '订单', '', '0', '1');
INSERT INTO `ga_admin_menu` VALUES ('72', '71', '62', 'game/pp-order', 'index', '', '0', '订单列表', '', '0', '2');

-- ----------------------------
-- Table structure for ga_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `ga_admin_user`;
CREATE TABLE `ga_admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `realname` varchar(255) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `salt` varchar(6) NOT NULL COMMENT '密码盐',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态|0:正常,1:删除',
  `mids` text NOT NULL COMMENT '用户菜单权限',
  `platform_id` int(10) NOT NULL DEFAULT '0' COMMENT '平台id',
  `group_id` int(10) NOT NULL DEFAULT '0' COMMENT '分组id',
  `last_session_id` varchar(32) NOT NULL DEFAULT '' COMMENT '上一次登录的session_id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- ----------------------------
-- Records of ga_admin_user
-- ----------------------------
INSERT INTO `ga_admin_user` VALUES ('1', 'sysadmin', '系统管理', '', '3885662a78b79c45ade750345fe0b679', 'i4BeVr', '1479393090', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72', '1000', '1', '6m1av832k1b56bbet3mojlu8rm', '1532955411');

-- ----------------------------
-- Table structure for ga_platform
-- ----------------------------
DROP TABLE IF EXISTS `ga_platform`;
CREATE TABLE `ga_platform` (
  `id` varchar(20) NOT NULL DEFAULT '' COMMENT '平台id',
  `sign` varchar(20) NOT NULL DEFAULT '' COMMENT '标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '平台名称',
  `ip_list` varchar(10000) NOT NULL DEFAULT '' COMMENT 'ip列表 用,分隔',
  `domain` varchar(255) NOT NULL DEFAULT '' COMMENT '域名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台';

-- ----------------------------
-- Records of ga_platform
-- ----------------------------
INSERT INTO `ga_platform` VALUES ('61001', 'youwo', '游喔', '', '');
INSERT INTO `ga_platform` VALUES ('1000', '全部平台', '全部平台', '', '');
INSERT INTO `ga_platform` VALUES ('61000', 'sogou', '搜狗', '', '');

-- ----------------------------
-- Table structure for pp_order
-- ----------------------------
DROP TABLE IF EXISTS `pp_order`;
CREATE TABLE `pp_order` (
  `id` bigint(12) NOT NULL AUTO_INCREMENT,
  `game_id` int(10) NOT NULL DEFAULT '0' COMMENT '游戏id',
  `guide_id` varchar(20) NOT NULL DEFAULT '0' COMMENT '公会id',
  `game_server_id` int(10) NOT NULL DEFAULT '0' COMMENT '区服id',
  `channel` tinyint(4) NOT NULL DEFAULT '1' COMMENT '充值渠道|1:支付宝,2:微信,3:网银支付',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `money` int(10) NOT NULL DEFAULT '0' COMMENT '充值金额 以分为单位',
  `income_money` int(10) NOT NULL DEFAULT '0' COMMENT '实际到账金额 以分为单位',
  `cp_out_trade_no` varchar(255) NOT NULL DEFAULT '' COMMENT 'cp商户订单号',
  `cp_game_server_id` varchar(255) NOT NULL DEFAULT '0' COMMENT 'cp游戏区服id',
  `cp_ext` varchar(255) NOT NULL DEFAULT '' COMMENT 'cp透传参数 ',
  `out_trade_no` varchar(60) NOT NULL DEFAULT '' COMMENT '本地订单号',
  `is_test` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是测试订单',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态|0:初始,1:成功',
  `game_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '游戏充值状态|0:初始,1:成功',
  `regtime` int(10) NOT NULL DEFAULT '0' COMMENT '用户注册时间',
  `addtime_bak` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单添加时间',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单支付时间',
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`,`username`,`channel`),
  KEY `game` (`game_id`,`game_server_id`) USING BTREE,
  KEY `out_trade_no` (`out_trade_no`),
  KEY `cp_out_trade_no` (`cp_out_trade_no`),
  KEY `addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='用户订单表';

-- ----------------------------
-- Records of pp_order
-- ----------------------------

-- ----------------------------
-- Table structure for pp_user
-- ----------------------------
DROP TABLE IF EXISTS `pp_user`;
CREATE TABLE `pp_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `roleid` varchar(255) NOT NULL DEFAULT '',
  `cp_game_server_id` varchar(20) NOT NULL DEFAULT 's1' COMMENT 'cp区服信息',
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(60) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '电子邮件',
  `uuid` varchar(60) NOT NULL DEFAULT '' COMMENT '设备号',
  `mac` varchar(60) NOT NULL DEFAULT '' COMMENT '设备id',
  `android_id` varchar(60) NOT NULL DEFAULT '' COMMENT '安卓id',
  `reg_ip` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册ip 转成int',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_time` int(10) unsigned NOT NULL COMMENT '最后登录时间',
  `last_login_ip` bigint(10) NOT NULL DEFAULT '0' COMMENT '最后一次登录ip 转成int',
  `guide_id` varchar(20) NOT NULL DEFAULT '' COMMENT '公会id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态|0:正常,-1:锁定',
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`status`),
  KEY `ip` (`reg_ip`),
  KEY `mobile` (`mobile`),
  KEY `reg_time` (`reg_time`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='passport用户表';

-- ----------------------------
-- Records of pp_user
-- ----------------------------
INSERT INTO `pp_user` VALUES ('2', '5629521524714111232', 's1', 'xiaoming1', '', 'fff3840ce78dc297a4691276ca2795e5', '', '', '', '', '', '2130706433', '1532766077', '1532955363', '2130706433', '', '0');
