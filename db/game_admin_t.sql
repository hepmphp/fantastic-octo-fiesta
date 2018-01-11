/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : game_admin_t

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2018-01-11 18:39:49
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户分组';

-- ----------------------------
-- Records of ga_admin_group
-- ----------------------------
INSERT INTO `ga_admin_group` VALUES ('1', '超级管理员123', '超级管理员123', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,110,111,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,135,136,142,143,144,145,146,147,152,153', '1', '0');
INSERT INTO `ga_admin_group` VALUES ('2', '运营人员(查询)', '运营人员(查询)', '1,5,6,7,8,9,10,11', '1', '1510747472');
INSERT INTO `ga_admin_group` VALUES ('3', '运营人员(查询+充值)', '运营人员(查询+充值)', '7,11,10,9,8', '1', '1510748173');
INSERT INTO `ga_admin_group` VALUES ('4', '运营人员(查询+充值)', '运营人员(查询+充值)', '7,11,10,9,8,1,6,5,4,3,2', '1', '1510748299');
INSERT INTO `ga_admin_group` VALUES ('5', '查询+游戏服', '查询+游戏服', '7,11,10,9,8,1,6,5,4,3,2', '1', '1510748371');
INSERT INTO `ga_admin_group` VALUES ('6', '外联11', '外联11', '1,4,5,6,7,8,9,10,11,13,14,19,20', '1', '1510748387');
INSERT INTO `ga_admin_group` VALUES ('7', '分组测试', '123456', '', '1', '1511182035');
INSERT INTO `ga_admin_group` VALUES ('8', 'sogou', 'sogou', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,25,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,74,75,76,77,78,79,93,94,95,96,97,98,99,100,101,110,111', '1', '1512972626');
INSERT INTO `ga_admin_group` VALUES ('9', '客服', '客服', '21,23,49,50,54,55,57,61,62,63,64,65,66,67,68,69,70,71,72,74,75,76,77,78,79,93,94,95,96,97,98,99,100,101,126,127,128,129,130,131,136,138,139,140,141,143', '1', '1513301166');
INSERT INTO `ga_admin_group` VALUES ('10', '测试分组', '分组测试', 'init', '1', '0');
INSERT INTO `ga_admin_group` VALUES ('11', '外联11', '外联', 'init', '1', '0');
INSERT INTO `ga_admin_group` VALUES ('12', '测试分组', '分组测试测试', 'init', '1', '0');
INSERT INTO `ga_admin_group` VALUES ('13', '测试分组1', '分组测试的', '24,73,80,81,82,83,84,85,86,87,88,89,90,91,92,102,103,104,105,106,107,108,109,112,113,114,115,118,119,120,121,122,134,135,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,182,183,184,185,203,204,205,206,207', '1', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=989 DEFAULT CHARSET=utf8 COMMENT='管理员操作日志';

-- ----------------------------
-- Records of ga_admin_log
-- ----------------------------
INSERT INTO `ga_admin_log` VALUES ('986', '0', '0', 'sysadmin', '192.168.71.21', '', '', '1515665260', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('987', '0', '0', 'sysadmin', '192.168.71.21', '', '', '1515667133', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('988', '0', '0', 'sysadmin', '192.168.71.21', '', '', '1515667140', '4', '登录成功', '1');

-- ----------------------------
-- Table structure for ga_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `ga_admin_menu`;
CREATE TABLE `ga_admin_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '菜单上一级id',
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
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8 COMMENT='后台菜单';

-- ----------------------------
-- Records of ga_admin_menu
-- ----------------------------
INSERT INTO `ga_admin_menu` VALUES ('1', '13', 'ga-admin-menu', 'index', '系统设置', '0', '菜单管理', '', '1', '1');
INSERT INTO `ga_admin_menu` VALUES ('2', '1', 'ga-admin-menu', 'get_search_where', '', '-1', '搜索', '1', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('3', '1', 'ga-admin-menu', 'ajax-get-config-menu', '', '-1', '获取菜单', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('4', '1', 'ga-admin-menu', 'create', '', '-1', '添加', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('5', '1', 'ga-admin-menu', 'update', '', '-1', '修改', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('6', '1', 'ga-admin-menu', 'delete', '系统设置', '-1', '删除', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('7', '13', 'ga-admin-user', 'index', '系统设置', '0', '用户管理', '', '1', '1');
INSERT INTO `ga_admin_menu` VALUES ('8', '7', 'ga-admin-user', 'create', 'a', '-1', '用户添加', '', '0', '1');
INSERT INTO `ga_admin_menu` VALUES ('9', '7', 'ga-admin-user', 'update', '', '-1', '用户修改', '', '0', '1');
INSERT INTO `ga_admin_menu` VALUES ('10', '7', 'ga-admin-user', 'edit-password', '', '-1', '用户修改密码', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('11', '7', 'ga-admin-user', 'delete', '', '-1', '用户删除', '', '0', '1');
INSERT INTO `ga_admin_menu` VALUES ('12', '7', 'ga-admin-user', 'edit-permission', '', '-1', '权限修改', '', '0', '1');
INSERT INTO `ga_admin_menu` VALUES ('13', '0', 'ga-admin-user', 'index', '系统设置', '0', '系统设置', '', '6', '0');
INSERT INTO `ga_admin_menu` VALUES ('14', '13', 'ga-admin-group', 'index', '系统设置', '0', '用户组', '', '1', '1');
INSERT INTO `ga_admin_menu` VALUES ('15', '14', 'ga-admin-group', 'get-search-where', '', '-1', '用户组搜索', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('16', '14', 'ga-admin-group', 'create', '', '-1', '添加', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('17', '14', 'ga-admin-group', 'update', '', '-1', '修改', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('18', '14', 'ga-admin-group', 'delete', '', '-1', '删除', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('19', '14', 'ga-admin-group', 'edit-permission', '', '-1', '编辑权限', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('20', '14', 'ga-gamin-group', 'menu', '', '-1', '获取菜单', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('21', '0', 'Singleserversum', 'index', '单服数据', '0', '单服数据', '', '1', '0');
INSERT INTO `ga_admin_menu` VALUES ('22', '0', 'Datadailysummary', 'index', '数据汇总', '0', '数据汇总', '', '2', '0');
INSERT INTO `ga_admin_menu` VALUES ('23', '0', 'operationplayer', 'index', '运营功能', '0', '运营功能', '', '3', '0');
INSERT INTO `ga_admin_menu` VALUES ('24', '81', 'servermanage', 'stoplist', '服务器管理', '0', '停服', '', '4', '2');
INSERT INTO `ga_admin_menu` VALUES ('25', '0', 'monitor', 'index', '监控系统', '0', '监控系统', '', '5', '0');
INSERT INTO `ga_admin_menu` VALUES ('26', '0', 'Developer', 'index', '开发工具', '0', '开发工具', '', '7', '0');
INSERT INTO `ga_admin_menu` VALUES ('27', '1', 'Adminmenu', 'index', '系统设置', '0', '菜单管理', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('28', '7', 'Account', 'index', '系统设置', '0', '用户管理', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('29', '14', 'Group', 'index', '系统设置', '0', '用户组', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('30', '32', 'Singleserversum', 'index', '单服数据', '0', '服务器概况', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('31', '32', 'Singleserverdailysum', 'index', '单服数据', '0', '每日汇总', '', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('32', '21', 'Singleserversum', 'index', '单服数据', '0', '数据梗概', '', '1', '1');
INSERT INTO `ga_admin_menu` VALUES ('33', '40', 'Singleserverretained', 'index', '单服数据', '0', '留存数据', '留存数据', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('34', '40', 'Singleserverretained', 'creatingsteps', '单服数据', '-1', '创建步骤（流失）', '创建步骤（流失）', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('35', '40', 'Singleserverretained', 'gradedistribution', '单服数据', '-1', '等级分布（流失）', '等级分布（流失）', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('36', '40', 'Singleserverretained', 'timelength', '单服数据', '-1', '时长分布（流失）', '时长分布（流失）', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('37', '40', 'Singleserverretained', 'taskdistribution', '单服数据', '-1', '任务分布（流失）', '任务分布（流失）', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('38', '40', 'Singleserverretained', 'mapdistribution', '单服数据', '-1', '地图分布（流失）', '地图分布（流失）', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('39', '22', 'Datadailysummary', 'index', '数据汇总', '0', '汇总数据', '汇总数据', '1', '1');
INSERT INTO `ga_admin_menu` VALUES ('40', '21', 'Singleserverretained', 'index', '单服数据', '0', '数据分析', '数据分析', '5', '1');
INSERT INTO `ga_admin_menu` VALUES ('41', '40', 'Activeanalysis', 'index', '单服数据', '0', '活跃分析', '', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('42', '39', 'Datadailysummary', 'index', '数据汇总', '0', '每日汇总', '', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('43', '32', 'singleserversum', 'echars_charge', '', '-1', '近日充值概况图', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('44', '32', 'singleserversum', 'echars_user', '', '-1', '近日在线概况图', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('45', '21', 'Singleserverorder', 'index', '单服数据', '0', '充值数据', '', '2', '1');
INSERT INTO `ga_admin_menu` VALUES ('46', '45', 'singleserverorder', 'index', '单服数据', '0', '充值列表', '', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('47', '21', 'singleserveronline', 'index', '单服数据', '0', '在线数据', '', '3', '1');
INSERT INTO `ga_admin_menu` VALUES ('48', '47', 'Singleserveronline', 'index', '单服数据', '0', '当前在线', '', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('49', '23', 'Operationplayer', 'index', '运营功能', '0', '数据查询', '', '0', '1');
INSERT INTO `ga_admin_menu` VALUES ('50', '49', 'Operationplayer', 'index', '运营功能', '0', '玩家查询', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('51', '48', 'Singleserveronline', 'online_chart', '单服数据', '-1', '实时在线图', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('52', '48', 'singleserveronline', 'register_chart', '单服数据', '-1', '注册人数图', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('53', '48', 'singleserveronline', 'online_role', '单服数据', '-1', '在线角色', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('54', '23', 'Operationnotice', 'index', '运营功能', '0', '游戏工具', '', '0', '1');
INSERT INTO `ga_admin_menu` VALUES ('55', '54', 'Operationnotice', 'index', '运营功能', '0', '系统公告', '公告列表', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('56', '45', 'singleserveranalysis', 'index', '单服数据', '0', '充值分析', '充值统计', '2', '2');
INSERT INTO `ga_admin_menu` VALUES ('57', '54', 'Operationnotice', 'announcement', '运营功能', '-1', '发公告', '发公告', '2', '2');
INSERT INTO `ga_admin_menu` VALUES ('58', '45', 'singleserveranalysis', 'rechargeeveryhour', '单服数据', '-1', '每小时充值', '', '3', '2');
INSERT INTO `ga_admin_menu` VALUES ('59', '45', 'singleserveranalysis', 'rechargegradient', '单服数据', '-1', '充值梯度', '', '4', '2');
INSERT INTO `ga_admin_menu` VALUES ('60', '45', 'singleserveranalysis', 'rechargerank', '单服数据', '-1', '充值排行', '', '6', '2');
INSERT INTO `ga_admin_menu` VALUES ('61', '21', 'singleserverplayer', 'index', '单服数据', '0', '用户信息', '', '4', '1');
INSERT INTO `ga_admin_menu` VALUES ('62', '61', 'singleserverplayer', 'index', '单服数据', '0', '角色列表', '', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('63', '23', 'Inneraccount', 'index', '运营功能', '0', '返利类管理', '', '3', '1');
INSERT INTO `ga_admin_menu` VALUES ('64', '63', 'Operationinacc', 'index', '运营功能', '0', '内部账号管理', '', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('65', '63', 'Operationrebate', 'index', '运营功能', '0', '元宝申请', '', '2', '2');
INSERT INTO `ga_admin_menu` VALUES ('66', '54', 'Operationmail', 'index', '运营功能', '0', '邮件管理', '邮件列表', '3', '2');
INSERT INTO `ga_admin_menu` VALUES ('67', '54', 'Operationmail', 'sendmail', '运营功能', '-1', '个人邮件', '', '4', '2');
INSERT INTO `ga_admin_menu` VALUES ('68', '54', 'Operationlogin', 'index', '运营功能', '0', '无密登录', '', '7', '2');
INSERT INTO `ga_admin_menu` VALUES ('69', '54', 'Operationban', 'index', '运营功能', '0', '账号封禁', '封禁列表', '8', '2');
INSERT INTO `ga_admin_menu` VALUES ('70', '54', 'Operationban', 'banaccount', '运营功能', '-1', '封号', '', '9', '2');
INSERT INTO `ga_admin_menu` VALUES ('71', '23', 'Operationserver', 'index', '运营功能', '0', '服务器管理', '', '4', '1');
INSERT INTO `ga_admin_menu` VALUES ('72', '71', 'Operationserver', 'index', '运营功能', '0', '开服申请', '区服列表', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('73', '0', 'servermanage', 'index', '服务器管理', '0', '服务器管理', '', '5', '0');
INSERT INTO `ga_admin_menu` VALUES ('74', '71', 'Operationserver', 'mergeapply', '运营功能', '0', '合服申请', '', '3', '2');
INSERT INTO `ga_admin_menu` VALUES ('75', '23', 'Operationlog', 'index', '运营功能', '0', '日志查询', '登录日志', '5', '1');
INSERT INTO `ga_admin_menu` VALUES ('76', '75', 'Operationlog', 'login_log', '运营功能', '0', '登录日志', '', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('77', '74', 'Operationservercombined', 'index', '运营功能', '0', '合服申请', '', '2', '3');
INSERT INTO `ga_admin_menu` VALUES ('78', '72', 'Operationserver', 'apply', '运营功能', '0', '申请开服', '', '2', '3');
INSERT INTO `ga_admin_menu` VALUES ('79', '72', 'Operationserver', 'index', '运营功能', '0', '区服列表', '', '1', '3');
INSERT INTO `ga_admin_menu` VALUES ('80', '81', 'servermanage', 'index', '服务器管理', '0', '区服列表', '', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('81', '73', 'servermanage', 'index', '服务器管理', '0', '服务器管理', '', '1', '1');
INSERT INTO `ga_admin_menu` VALUES ('82', '73', 'servermanageroom', 'index', '服务器管理', '0', '机房管理', '', '2', '1');
INSERT INTO `ga_admin_menu` VALUES ('83', '82', 'servermanageroom', 'index', '服务器管理', '0', '机房管理', '', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('84', '82', 'servermanagemachine', 'index', '服务器管理', '0', '机器管理', '', '2', '2');
INSERT INTO `ga_admin_menu` VALUES ('85', '81', 'servermanage', 'handleopen', '服务器管理', '0', '开服申请处理', '', '2', '2');
INSERT INTO `ga_admin_menu` VALUES ('86', '81', 'servermanage', 'handlecombine', '服务器管理', '0', '合服申请处理', '', '3', '2');
INSERT INTO `ga_admin_menu` VALUES ('87', '24', 'servermanage', 'stoplist', '服务器管理', '0', '停服列表', '', '1', '3');
INSERT INTO `ga_admin_menu` VALUES ('88', '24', 'servermanage', 'handlestop', '服务器管理', '0', '停服', '', '2', '3');
INSERT INTO `ga_admin_menu` VALUES ('89', '83', 'servermanageroom', 'index', '服务器管理', '0', '机房管理', '', '1', '3');
INSERT INTO `ga_admin_menu` VALUES ('90', '83', 'servermanageroom', 'add', '服务器管理', '0', '添加机房', '', '2', '3');
INSERT INTO `ga_admin_menu` VALUES ('91', '84', 'servermanagemachine', 'index', '服务器管理', '0', '机器列表', '', '1', '3');
INSERT INTO `ga_admin_menu` VALUES ('92', '84', 'servermanagemachine', 'add', '服务器管理', '0', '添加机器', '', '2', '3');
INSERT INTO `ga_admin_menu` VALUES ('93', '65', 'operationrebate', 'add', '元宝申请', '-1', '元宝申请', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('94', '65', 'operationrebate', 'edit', '', '-1', '发放/取消', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('95', '65', 'operationrebate', 'check_nickname', '运营功能', '0', '获取角色信息', '', '3', '3');
INSERT INTO `ga_admin_menu` VALUES ('96', '54', 'Operationmail', 'batchsend', '运营功能', '-1', '全服邮件', '', '5', '2');
INSERT INTO `ga_admin_menu` VALUES ('97', '65', 'operationrebate', 'index', '运营功能', '0', '返利发放列表', '', '1', '3');
INSERT INTO `ga_admin_menu` VALUES ('98', '65', 'operationrebate', 'get_search_where', '运营功能', '0', '返利发放列表 搜索', '', '2', '3');
INSERT INTO `ga_admin_menu` VALUES ('99', '72', 'Operationserver', 'reject_list', '运营功能', '0', '驳回列表', '', '3', '3');
INSERT INTO `ga_admin_menu` VALUES ('100', '72', 'Operationserver', 'get_servers', '运营工具', '0', '生成区服', '', '1', '3');
INSERT INTO `ga_admin_menu` VALUES ('101', '54', 'Operationmail', 'batchplatformsend', '运营功能', '-1', '全平台邮件', '', '6', '2');
INSERT INTO `ga_admin_menu` VALUES ('102', '85', 'servermanage', 'edit_open_time', '', '-1', '修改开服时间', '', '1', '3');
INSERT INTO `ga_admin_menu` VALUES ('103', '85', 'servermanage', 'bussiness_audit', '', '-1', '商务审核', '', '2', '3');
INSERT INTO `ga_admin_menu` VALUES ('104', '85', 'servermanage', 'bussiness_reject', '', '-1', '商务驳回', '', '3', '3');
INSERT INTO `ga_admin_menu` VALUES ('105', '83', 'servermanageroom', 'edit', '服务器管理', '0', '修改机房', '', '3', '3');
INSERT INTO `ga_admin_menu` VALUES ('106', '85', 'servermanage', 'operation_ack', '', '-1', '运维确认', '', '4', '3');
INSERT INTO `ga_admin_menu` VALUES ('107', '85', 'servermanage', 'get_computer', '', '-1', '服务器管理', '', '5', '3');
INSERT INTO `ga_admin_menu` VALUES ('108', '92', 'Servermanagecomputerconfig', 'index', '服务器管理', '0', '查看配置单', '', '0', '4');
INSERT INTO `ga_admin_menu` VALUES ('109', '92', 'Servermanagecomputerconfig', 'add', '服务器管理', '0', '添加配置', '', '0', '4');
INSERT INTO `ga_admin_menu` VALUES ('110', '25', 'Monitor', 'index', '监控系统', '0', '聊天监控', '', '1', '1');
INSERT INTO `ga_admin_menu` VALUES ('111', '110', 'Monitor', 'index', '监控系统', '0', '实时监控', '', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('112', '80', 'Servermanage', 'server_maintain', '', '-1', '服务器维护', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('113', '85', 'Servermanage', 'get_computer_port', '', '0', '获取服务器端口', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('114', '80', 'Servermanage', 'server_open', '', '0', '服务器开启', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('115', '80', 'Servermanage', 'server_stop', '', '0', '服务器关闭', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('116', '26', 'developer', 'index', '开发工具', '0', '平台管理', '', '1', '1');
INSERT INTO `ga_admin_menu` VALUES ('117', '116', 'Developer', 'index', '开发工具', '0', '平台信息', '', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('118', '122', 'Gamecenter', 'get_game_server', '开发工具', '-1', 'API管理', '', '1', '1');
INSERT INTO `ga_admin_menu` VALUES ('119', '118', 'Gamecenter', 'get_game_server', 'API管理', '-1', '获取对应平台信息', '', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('120', '118', 'Gamecenter', 'set_game_server', 'API管理', '-1', '切换区服', '', '2', '2');
INSERT INTO `ga_admin_menu` VALUES ('121', '118', 'Gameitem', 'get_game_item', 'API管理', '-1', '获取道具信息', '', '3', '2');
INSERT INTO `ga_admin_menu` VALUES ('122', '0', 'Gamecenter', 'get_game_server', 'API管理', '-1', 'API管理', '', '8', '0');
INSERT INTO `ga_admin_menu` VALUES ('123', '116', 'Developer', 'add', '开发工具', '-1', '添加平台', '', '2', '2');
INSERT INTO `ga_admin_menu` VALUES ('124', '116', 'Developer', 'edit', '开发工具', '-1', '修改平台信息', '', '3', '2');
INSERT INTO `ga_admin_menu` VALUES ('125', '116', 'Developer', 'delete', '开发工具', '-1', '删除平台', '', '4', '2');
INSERT INTO `ga_admin_menu` VALUES ('126', '23', 'Operationfeedback', 'index', '运营功能', '0', '其它', '', '6', '1');
INSERT INTO `ga_admin_menu` VALUES ('127', '126', 'Operationfeedback', 'index', '运营功能', '0', '玩家反馈', '', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('128', '126', 'Operationfeedback', 'feedback', '运营功能', '-1', '回复用户反馈', '', '2', '2');
INSERT INTO `ga_admin_menu` VALUES ('129', '126', 'Operationfeedback', 'addgoods', '运营功能', '-1', '反馈邮件添加附件', '', '3', '2');
INSERT INTO `ga_admin_menu` VALUES ('130', '126', 'Operationfeedback', 'edit', '运营功能', '-1', '已读删除', '', '4', '2');
INSERT INTO `ga_admin_menu` VALUES ('131', '126', 'Operationfeedback', 'look', '运营功能', '-1', '查看回复', '', '5', '2');
INSERT INTO `ga_admin_menu` VALUES ('132', '53', 'singleserveronline', 'ip_disable_login', '', '-1', '封禁ip', '', '0', '4');
INSERT INTO `ga_admin_menu` VALUES ('133', '53', 'singleserveronline', 'disable_chat', '', '-1', 'IP禁言', '', '0', '4');
INSERT INTO `ga_admin_menu` VALUES ('134', '91', 'servermanagemachine', 'edit', '', '0', '机器列表修改', '', '0', '4');
INSERT INTO `ga_admin_menu` VALUES ('135', '118', 'Gamecenter', 'checkserver', 'API管理', '-1', '检测区服', '', '4', '2');
INSERT INTO `ga_admin_menu` VALUES ('136', '64', 'Operationinacc', 'add', '运营功能', '-1', '内部账号添加', '', '1', '3');
INSERT INTO `ga_admin_menu` VALUES ('137', '33', 'loginsteplog', 'index', '', '0', '登录转换详情', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('138', '126', 'giftcode', 'index', '', '0', '礼包生成', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('139', '138', 'giftcode', 'add', '', '0', '礼包添加', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('140', '138', 'giftcode', 'export', '', '0', '礼包导出', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('141', '138', 'giftcode', 'delete', '', '0', '礼包删除', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('142', '45', 'Singleserveranalysis', 'levelrecharge', '单服数据', '-1', '等级充值', '', '5', '2');
INSERT INTO `ga_admin_menu` VALUES ('143', '54', 'operationnotice', 'noticeoperation', '运营功能', '-1', '消息发送', '', '13', '2');
INSERT INTO `ga_admin_menu` VALUES ('144', '65', 'Operationrebate', 'inaccrebate', '运营功能', '-1', '内部账号（发放记录）', '', '6', '3');
INSERT INTO `ga_admin_menu` VALUES ('145', '65', 'Operationrebate', 'inaccapply', '运营功能', '-1', '内部账号(元宝申请)', '', '7', '3');
INSERT INTO `ga_admin_menu` VALUES ('146', '65', 'Operationrebate', 'inaccsend', '运营功能', '-1', '内部账号发放元宝', '', '8', '3');
INSERT INTO `ga_admin_menu` VALUES ('147', '65', 'Operationrebate', 'checkinacc', '运营功能', '-1', '内部账号检测', '', '9', '3');
INSERT INTO `ga_admin_menu` VALUES ('148', '75', 'operationcoinlog', 'index', '', '0', '货币消耗日志', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('149', '40', 'Singleservercoinexpenddaily', 'index', '', '0', '消费分析', '', '3', '2');
INSERT INTO `ga_admin_menu` VALUES ('150', '149', 'Singleservercoinexpenddaily', 'index', '', '0', '消费分析', '', '1', '3');
INSERT INTO `ga_admin_menu` VALUES ('151', '149', 'Singleservercoinexpenddaily', 'server_ingot_daily_total', '', '0', '服务器元宝统计', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('152', '39', 'Datadailysummary', 'platform_summary', '数据汇总', '-1', '各平台报表', '', '2', '2');
INSERT INTO `ga_admin_menu` VALUES ('153', '39', 'Datadailysummary', 'server_summary', '数据汇总', '-1', '各区服报表', '', '3', '2');
INSERT INTO `ga_admin_menu` VALUES ('154', '85', 'Servermanage', 'auto_assign_server_port', '服务器管理', '0', '自动分配端口', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('155', '73', 'servermanagerupdate', 'index', '服务器管理', '0', '服务器更新', '', '3', '1');
INSERT INTO `ga_admin_menu` VALUES ('156', '155', 'servermanagerupdate', 'client_version', '服务器管理', '0', '客户端版本控制', '', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('157', '155', 'servermanagerupdate', 'hot_fix', '服务器管理', '0', '热更', '', '2', '2');
INSERT INTO `ga_admin_menu` VALUES ('158', '82', 'servermanagecomputertemplate', 'index', '服务管理', '0', '机器模板', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('159', '158', 'servermanagecomputertemplate', 'add', '服务管理', '0', '机器模板添加', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('160', '158', 'servermanagecomputertemplate', 'edit', '服务器管理', '0', '机器模板修改', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('161', '158', 'servermanagecomputertemplate', 'delete', '服务器管理', '0', '机器模板删除', '', '3', '3');
INSERT INTO `ga_admin_menu` VALUES ('162', '73', 'servermanagecomputercost', 'server', '服务器管理', '0', '费用', '', '4', '1');
INSERT INTO `ga_admin_menu` VALUES ('163', '162', 'servermanagecomputercost', 'server', '服务器管理', '0', '费用统计', '', '1', '2');
INSERT INTO `ga_admin_menu` VALUES ('164', '162', 'servermanagecomputercostreporting', 'agent', '服务器管理', '0', '费用管控', '', '2', '2');
INSERT INTO `ga_admin_menu` VALUES ('165', '163', 'servermanagecomputercost', 'server', '服务器管理', '0', '区服费用统计', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('166', '163', 'servermanagecomputercost', 'computer', '服务器管理', '0', '机器费用统计', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('167', '163', 'servermanagecomputercost', 'agent', '服务器管理', '0', '平台费用统计', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('168', '164', 'servermanagecomputercostreporting', 'server', '服务器管理', '0', '区服费用统计', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('169', '164', 'servermanagecomputercostreporting', 'computer', '服务器管理', '0', '机器费用统计', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('170', '164', 'servermanagecomputercostreporting', 'agent', '服务器管理', '0', '平台费用统计', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('171', '75', 'Operationlog', 'logout_log', '运营功能', '0', '登出日志', '', '3', '2');
INSERT INTO `ga_admin_menu` VALUES ('172', '75', 'Operationlog', 'update_log', '运营功能', '0', '升级日志', '', '4', '2');
INSERT INTO `ga_admin_menu` VALUES ('173', '39', 'datasummarycharge', 'index', '数据汇总', '0', '充值汇总', '', '2', '2');
INSERT INTO `ga_admin_menu` VALUES ('174', '22', 'datasummarycompare', 'index', '数据汇总', '0', '数据对比', '', '2', '1');
INSERT INTO `ga_admin_menu` VALUES ('175', '174', 'datasummarychargecompare', 'index', '数据汇总', '0', '充值对比', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('176', '22', 'datasummarychargereporting', 'index', '数据汇总', '0', '充值报表', '', '3', '1');
INSERT INTO `ga_admin_menu` VALUES ('177', '176', 'datasummarychargereporting', 'day', '数据汇总', '0', '每日报表', '', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('178', '177', 'datasummarychargereporting', 'day', '数据汇总', '0', '每日报表', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('179', '177', 'datasummarychargereporting', 'month', '数据汇总', '0', '每月报表', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('180', '177', 'datasummarychargereporting', 'day', '数据汇总', '0', '每日报表', '', '1', '3');
INSERT INTO `ga_admin_menu` VALUES ('181', '174', 'datasummarychargecontinued', 'index', '数据汇总', '0', '持续付费分析', '', '2', '2');
INSERT INTO `ga_admin_menu` VALUES ('182', '81', 'servermanagecrossserver', 'index', '服务器管理', '0', '跨服管理', '', '5', '2');
INSERT INTO `ga_admin_menu` VALUES ('183', '182', 'servermanagecrossserver', 'add', '服务器管理', '0', '跨服添加', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('184', '182', 'servermanagecrossserver', 'edit', '服务器管理', '0', '跨服修改', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('185', '182', 'servermanagecrossserver', 'index', '服务器管理', '0', '跨服管理', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('186', '40', 'singleservergamerank', 'power', '单服数据', '0', '游戏排行榜', '', '4', '2');
INSERT INTO `ga_admin_menu` VALUES ('187', '186', 'singleservergamerank', 'system', '单服数据', '0', '系统排行榜', '', '2', '3');
INSERT INTO `ga_admin_menu` VALUES ('188', '186', 'singleservergamerank', 'power', '1', '0', '战力排行榜', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('189', '186', 'singleservergamerank', 'level', '单服数据', '0', '等级排行', '', '3', '3');
INSERT INTO `ga_admin_menu` VALUES ('190', '186', 'singleservergamerank', 'group', '单服数据', '0', '帮派排行榜', '', '4', '3');
INSERT INTO `ga_admin_menu` VALUES ('191', '71', 'Operationserver', 'handleopen', '运营功能', '0', '开服申请处理', '', '3', '2');
INSERT INTO `ga_admin_menu` VALUES ('192', '191', 'Operationserver', 'handleopen', '运营功能', '0', '开服申请处理', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('193', '191', 'Operationserver', 'edit_open_time', '运营功能', '0', '编辑开服时间', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('194', '191', 'Operationserver', 'bussiness_audit', '运营功能', '0', '商务审核', '', '0', '3');
INSERT INTO `ga_admin_menu` VALUES ('195', '54', 'operationfaction', 'index', '运营功能', '0', '帮派管理', '', '14', '2');
INSERT INTO `ga_admin_menu` VALUES ('196', '195', 'operationfaction', 'changemanage', '运营功能', '0', '更换门主', '', '2', '3');
INSERT INTO `ga_admin_menu` VALUES ('197', '195', 'operationfaction', 'member', '运营功能', '0', '成员', '', '2', '3');
INSERT INTO `ga_admin_menu` VALUES ('198', '195', 'operationfaction', 'editnote', '运营功能', '0', '修改公告', '', '3', '3');
INSERT INTO `ga_admin_menu` VALUES ('199', '195', 'operationfaction', 'dismiss', '运营功能', '0', '解散', '', '4', '3');
INSERT INTO `ga_admin_menu` VALUES ('203', '118', 'test', 'test', '无', '0', '测试菜单', '这是备注', '1', '0');
INSERT INTO `ga_admin_menu` VALUES ('204', '203', 'test', 'test2', '参数', '0', '测试菜单2', '1', '1', '0');
INSERT INTO `ga_admin_menu` VALUES ('205', '204', 'test', 'test3', '1', '0', '测试菜单3', '1', '1', '0');
INSERT INTO `ga_admin_menu` VALUES ('206', '205', '1', '1', '1', '0', '菜单', '1', '1', '0');
INSERT INTO `ga_admin_menu` VALUES ('207', '204', '1', '1', '1', '0', '测试菜单3-1', '1', '1', '0');
INSERT INTO `ga_admin_menu` VALUES ('208', '13', 'ga-admin-menu', 'index', '系统设置', '0', '菜单管理', '', '1', '0');
INSERT INTO `ga_admin_menu` VALUES ('209', '1', 'ga-admin-menu', 'add', '', '-1', '添加', '', '0', '0');

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
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  `mids` text NOT NULL COMMENT '用户菜单权限',
  `platform_id` int(10) NOT NULL DEFAULT '0' COMMENT '平台id',
  `group_id` int(10) NOT NULL DEFAULT '0' COMMENT '分组id',
  `last_session_id` varchar(32) NOT NULL DEFAULT '' COMMENT '上一次登录的session_id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- ----------------------------
-- Records of ga_admin_user
-- ----------------------------
INSERT INTO `ga_admin_user` VALUES ('1', 'sysadmin', '系统管理', '', '74fe49a7f55b050063f698d5e64d52b7', '78sYss', '1479393090', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,203,204,205,206,207', '1000', '1', '1ha1qq7um6uikq61qbkj92kbu6', '1515667140');
INSERT INTO `ga_admin_user` VALUES ('2', 'test', 'test', '', 'c51f62115947f3689e5f440819ae7032', 'v6KJ4v', '1510814911', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,110,111,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,135,136,142,143,144,145,146,147,152,153', '61000', '1', 'emklcqulrtkgk1266soo8m07s2', '1513322025');
INSERT INTO `ga_admin_user` VALUES ('3', 'xhd', 'xhd', '', 'b8dd2d160aac9e9da4add8b4143b0d9a', 'BSmWrr', '1511182801', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,110,111,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,135,136,138,139,140,141,142,143,144,145,146,147,148,152,153,155,156,157,162,163,164,165,166,167,168,169,170,171,172,191,192,193,194,195,196,197,198,199', '1', '1', 'ta9asqvhjv9d5a7eg64i7m4i62', '1515205636');
INSERT INTO `ga_admin_user` VALUES ('4', 'wenbin', 'wenbin', '', '4173033fd3a048645eff75ee6f00a5f6', 'z4TGpO', '1511837805', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,110,111,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,135,136,142,143,144,145,146,147,152,153', '0', '1', 'fonqs26aiifh1hv4fap9rqlu87', '1511847554');
INSERT INTO `ga_admin_user` VALUES ('5', 'hy', '煌业', '', '2d4fbd0e5de3383dce284a4daa37f870', 'eFz1AS', '1512023369', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,110,111,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,135,136,142,143,144,145,146,147,152,153', '0', '1', 'j6o9paooko4b5k6anushgsfsp3', '1512026218');
INSERT INTO `ga_admin_user` VALUES ('6', 'sgcs01', '搜狗', '', 'ea873c023d1fc817ba62998d138ae60b', 'qSH8x8', '1512972690', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,25,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,74,75,76,77,78,79,93,94,95,96,97,98,99,100,101,110,111', '61001', '8', 'o122mo5bu0gao5m9432nidgs82', '1512973328');
INSERT INTO `ga_admin_user` VALUES ('7', 'sgcs02', '搜狗2', '', '60ab9bf435858eef829dc1d800632a47', 'hTJl7h', '1512972818', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,25,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,74,75,76,77,78,79,93,94,95,96,97,98,99,100,101,110,111', '1', '8', 'sqmpe54vq5c46hmves1u6rhb24', '1512976570');
INSERT INTO `ga_admin_user` VALUES ('8', 'sgcs03', 'sgcs03', '', '262c4136ba79f25b1fded92521036a50', 'h4GNFW', '1512977468', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,25,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,74,75,76,77,78,79,93,94,95,96,97,98,99,100,101,110,111', '0', '8', '', '0');
INSERT INTO `ga_admin_user` VALUES ('9', 'sgcs04', 'sgcs04', '', '042199e9ed782d37b7a5d95a45e7bd8c', '4cIthv', '1513300705', '0', '', '0', '8', '', '0');
INSERT INTO `ga_admin_user` VALUES ('11', 'sgcs5', 'sgcs5', '', 'dd8a512d181c3096f63a3a31ec1b6c4a', 'Lxg5f2', '1513300990', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,25,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,74,75,76,77,78,79,93,94,95,96,97,98,99,100,101,110,111', '0', '8', '', '0');
INSERT INTO `ga_admin_user` VALUES ('12', 'sgcs6', 'sgcs6', '', '79f45218475d8569e2ff404500906bb8', 'SV0N4r', '1513301078', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,25,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,74,75,76,77,78,79,93,94,95,96,97,98,99,100,101,110,111', '61000', '8', '', '0');
INSERT INTO `ga_admin_user` VALUES ('13', 'kf01', 'kf01', '', 'a7bf4f47674dd67890d31f750c8e186f', 'BTmlXi', '1513301818', '0', '21,23,49,50,54,55,57,61,62,63,64,65,66,67,68,69,70,71,72,74,75,76,77,78,79,93,94,95,96,97,98,99,100,101,126,127,128,129,130,131,136,138,139,140,141,143', '61000', '9', 'lond7eengs1s9673d8m5vc7qv5', '1513303206');
INSERT INTO `ga_admin_user` VALUES ('14', 'kfcs02', '客服测试', '', '887c8173d7a5aa94961f68042c2dbec5', 'HWLdG2', '1513303636', '0', '21,23,45,46,49,50,54,61,62,69,70', '61000', '9', '44o9rg009hnp1pqre84iqr5vt4', '1513303728');
INSERT INTO `ga_admin_user` VALUES ('15', '37wankf', '37玩客服', '', 'ab6563cd13838180d697989aa74eab34', 'xm8XYx', '1514253266', '0', '21,23,49,50,54,55,57,61,62,63,64,65,66,67,68,69,70,71,72,74,75,76,77,78,79,93,94,95,96,97,98,99,100,101,126,127,128,129,130,131,136,138,139,140,141,143', '61000', '9', '3g7trif0qu2g3rjulbesebdst6', '1514255623');
INSERT INTO `ga_admin_user` VALUES ('16', 'test201801', 'test201801', '', '3fc4c7da26591658aedd935684f82da8', 'yJKwOy', '1515578711', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,110,111,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,135,136,142,143,144,145,146,147,152,153', '61000', '1', '', '0');
INSERT INTO `ga_admin_user` VALUES ('17', 'test201801', 'test201801', '', 'be5e214206d7c34589524ca824a397b6', 'X0eLAL', '1515578975', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,110,111,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,135,136,142,143,144,145,146,147,152,153', '61000', '1', '', '0');
INSERT INTO `ga_admin_user` VALUES ('18', 'test201801', 'test20180', '', '', 'cQgx5D', '1515579064', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,110,111,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,135,136,142,143,144,145,146,147,152,153', '61000', '1', '', '0');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ga_platform
-- ----------------------------
INSERT INTO `ga_platform` VALUES ('61001', 'youwo', '游喔', '', '');
INSERT INTO `ga_platform` VALUES ('1000', '全部平台', '全部平台', '', '');
INSERT INTO `ga_platform` VALUES ('61000', 'sogou', '搜狗', '', '');
