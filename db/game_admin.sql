/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : yii_admin

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2018-05-23 18:03:52
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
INSERT INTO `ga_admin_group` VALUES ('1', '超级管理员', '超级管理员', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61', '1', '0');
INSERT INTO `ga_admin_group` VALUES ('2', '运营人员(查询)', '运营人员(查询)', '1,5,6,7,8,9,10,11', '1', '1510747472');
INSERT INTO `ga_admin_group` VALUES ('3', '运营人员(查询+充值)', '运营人员(查询+充值)', '7,11,10,9,8', '1', '1510748173');
INSERT INTO `ga_admin_group` VALUES ('4', '运营人员(查询+充值)', '运营人员(查询+充值)', '7,11,10,9,8,1,6,5,4,3,2', '1', '1510748299');
INSERT INTO `ga_admin_group` VALUES ('5', '查询+游戏服', '查询+游戏服', '7,11,10,9,8,1,6,5,4,3,2', '1', '1510748371');
INSERT INTO `ga_admin_group` VALUES ('6', '外联11', '外联11', '1,4,5,6,7,8,9,10,11,13,14,19,20', '1', '1510748387');
INSERT INTO `ga_admin_group` VALUES ('7', '分组测试', '123456', '', '1', '1511182035');
INSERT INTO `ga_admin_group` VALUES ('8', 'sogou', 'sogou', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,25,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,74,75,76,77,78,79,93,94,95,96,97,98,99,100,101,110,111', '1', '1512972626');
INSERT INTO `ga_admin_group` VALUES ('9', '客服', '客服', '21,23,49,50,54,55,57,61,62,63,64,65,66,67,68,69,70,71,72,74,75,76,77,78,79,93,94,95,96,97,98,99,100,101,126,127,128,129,130,131,136,138,139,140,141,143', '1', '1513301166');
INSERT INTO `ga_admin_group` VALUES ('10', '测试分组', '分组测试', 'init', '1', '0');
INSERT INTO `ga_admin_group` VALUES ('11', '外联', '外联', 'init', '1', '0');
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
) ENGINE=InnoDB AUTO_INCREMENT=1087 DEFAULT CHARSET=utf8 COMMENT='管理员操作日志';

-- ----------------------------
-- Records of ga_admin_log
-- ----------------------------
INSERT INTO `ga_admin_log` VALUES ('987', '0', '0', 'sysadmin', '192.168.71.21', '', '', '1515667133', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('988', '0', '0', 'sysadmin', '192.168.71.21', '', '', '1515667140', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('989', '0', '0', 'sysadmin', '192.168.71.21', '', '', '1515723846', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('990', '0', '0', 'sysadmin', '192.168.71.21', '', '', '1515723852', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('991', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515757667', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('992', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515768652', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('993', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515768704', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('994', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515768840', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('995', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515768846', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('996', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515768851', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('997', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515768880', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('998', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515768894', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('999', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515768900', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1000', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515768911', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1001', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515768948', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1002', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515768977', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1003', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515768985', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1004', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515823365', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1005', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515823370', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1006', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515823656', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1007', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515823666', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1008', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515851684', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1009', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515854475', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1010', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515854479', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1011', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515918902', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1012', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515919078', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1013', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515919519', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1014', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515919525', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1015', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515919564', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1016', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515919566', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1017', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515919572', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1018', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515919577', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1019', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515919585', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1020', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515919616', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1021', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515919623', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1022', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515919636', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1023', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515920156', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1024', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515920231', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1025', '0', '0', 'sysadmin', '127.0.0.1', '', '', '1515938977', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1026', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1516023496', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1027', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1516023853', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1028', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1516027778', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1029', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1523719497', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1030', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524061495', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1031', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524061500', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1032', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524061529', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1033', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524061587', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1034', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524061595', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1035', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524061714', '5', '密码错误', '0');
INSERT INTO `ga_admin_log` VALUES ('1036', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524061793', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1037', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524233545', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1038', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524324586', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1039', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524325143', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1040', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524325604', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1041', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524403544', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1042', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524404866', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1043', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524404923', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1044', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524405057', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1045', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524405069', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1046', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524405078', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1047', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524405111', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1048', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524405145', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1049', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524405257', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1050', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524405290', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1051', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524405498', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1052', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524579928', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1053', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524660792', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1054', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524755142', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1055', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1524757466', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1056', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1525188343', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1057', '1', '1000', 'zhangshan', '127.0.0.1', 'm', 'a', '1525621288', '1', '', '0');
INSERT INTO `ga_admin_log` VALUES ('1058', '1', '1000', 'zhangshan', '127.0.0.1', 'm', 'a', '1525621300', '1', '', '0');
INSERT INTO `ga_admin_log` VALUES ('1059', '1', '1000', 'zhangshan', '127.0.0.1', 'm', 'a', '1525621303', '1', '', '0');
INSERT INTO `ga_admin_log` VALUES ('1060', '1', '1000', 'aaaaaaaaaa', '127.0.0.1', 'm', 'a', '1525621304', '1', '', '0');
INSERT INTO `ga_admin_log` VALUES ('1061', '1', '1000', 'zhangshan', '127.0.0.1', 'm', 'a', '1525621315', '1', '', '0');
INSERT INTO `ga_admin_log` VALUES ('1062', '1', '1000', 'zhangshan', '127.0.0.1', 'm', 'a', '1525621316', '1', '', '0');
INSERT INTO `ga_admin_log` VALUES ('1063', '1', '1000', 'zhangshan', '127.0.0.1', 'm', 'a', '1525621317', '1', '', '0');
INSERT INTO `ga_admin_log` VALUES ('1064', '1', '1000', 'zhangshan', '127.0.0.1', 'm', 'a', '1525621318', '1', '', '0');
INSERT INTO `ga_admin_log` VALUES ('1065', '1', '1000', 'zhangshan', '127.0.0.1', 'm', 'a', '1525621340', '1', '', '0');
INSERT INTO `ga_admin_log` VALUES ('1066', '1', '1000', 'zhangshan', '127.0.0.1', 'm', 'a', '1525621355', '1', '', '0');
INSERT INTO `ga_admin_log` VALUES ('1067', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1525704277', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1068', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1525787289', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1069', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1525874800', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1070', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1525963429', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1071', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1526133183', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1072', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1526173145', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1073', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1526200024', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1074', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1526226012', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1075', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1526396433', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1076', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1526473436', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1077', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1526564064', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1078', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1526649575', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1079', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1526651715', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1080', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1526651750', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1081', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1526655596', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1082', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1526655627', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1083', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1526830647', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1084', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1526912204', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1085', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1527006987', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1086', '1', '0', 'sysadmin', '192.168.71.21', '', '', '1527037383', '4', '登录成功', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='后台菜单';

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- ----------------------------
-- Records of ga_admin_user
-- ----------------------------
INSERT INTO `ga_admin_user` VALUES ('1', 'sysadmin', '系统管理', '', '3885662a78b79c45ade750345fe0b679', 'i4BeVr', '1479393090', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61', '1000', '1', 'agtf5r3jj0nnahbajcebcpnus6', '1527037382');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台';

-- ----------------------------
-- Records of ga_platform
-- ----------------------------
INSERT INTO `ga_platform` VALUES ('61001', 'youwo', '游喔', '', '');
INSERT INTO `ga_platform` VALUES ('1000', '全部平台', '全部平台', '', '');
INSERT INTO `ga_platform` VALUES ('61000', 'sogou', '搜狗', '', '');
