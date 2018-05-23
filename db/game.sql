/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : ga_admin

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2018-05-23 18:10:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ga_game
-- ----------------------------
DROP TABLE IF EXISTS `ga_game`;
CREATE TABLE `ga_game` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏名称',
  `cate_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '游戏类别',
  `abbr` varchar(255) NOT NULL DEFAULT '' COMMENT '名称缩写',
  `developer` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏研发厂商',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '游戏接入状态:-2未接入-1删除 0接入 1测试 2停止运营',
  `android` varchar(255) NOT NULL DEFAULT '' COMMENT 'android 安卓开发包路径',
  `ios` varchar(255) NOT NULL DEFAULT '' COMMENT 'ios开发包路径',
  `game_login_url` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏登录接口',
  `game_login_key` varchar(100) NOT NULL DEFAULT '' COMMENT '游戏登录key',
  `game_recharge_url` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏充值接口地址',
  `game_ios_recharge_url` varchar(255) NOT NULL DEFAULT '' COMMENT '苹果支付 游戏充值回调地址',
  `game_recharge_key` varchar(100) NOT NULL DEFAULT '' COMMENT '游戏充值key',
  `role_verify_url` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏角色验证地址',
  `qrcode_url` varchar(255) NOT NULL DEFAULT '' COMMENT '平台二维码',
  `hot_image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '热门图片',
  `image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏图片url',
  `recommend_id` tinyint(3) NOT NULL DEFAULT '0' COMMENT '游戏推荐状态 0默认1首页热门2首页推荐',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `downloads` int(10) NOT NULL DEFAULT '100' COMMENT '下载次数',
  `likes` int(10) NOT NULL DEFAULT '100' COMMENT '点赞次数',
  `stars` int(10) NOT NULL DEFAULT '0' COMMENT '星级',
  `tag_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏标签',
  `filesize` int(255) NOT NULL DEFAULT '0' COMMENT '安装包文件大小',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏描述',
  `comment` varchar(255) DEFAULT '' COMMENT '简介',
  `recommand_image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐图片',
  `logo_image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐logo',
  `article_image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '热门话题图片',
  `download_domain` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏apk下载地址',
  `download_apk` varchar(255) NOT NULL DEFAULT '' COMMENT '平台的下载地址',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序字段 数字越大排越前面',
  `ios_app_pay` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否使用平台自有的支付 0否 1是',
  PRIMARY KEY (`id`),
  KEY `addtime` (`addtime`),
  KEY `status` (`status`,`downloads`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ga_game
-- ----------------------------
INSERT INTO `ga_game` VALUES ('1', '剑绝', '1', 'sgl', 'baidu', '0', 'http://192.168.71.21:10002/android/app-release.apk', 'https://itunes.apple.com/us/app/%E4%B8%80%E5%89%91%E9%80%8D%E9%81%A5-3d%E5%94%AF%E7%BE%8E%E6%AD%A6%E4%BE%A0%E4%BF%AE%E4%BB%99%E6%A2%A6%E5%B9%BB%E6%89%8B%E6%B8%B8/id1314335393?l=zh&ls=1&mt=8', 'http://www.menle.com/login', '10', '100', 'http://www.menle.com/login', '100', '10', 'http://192.168.71.21:8000/d/file/article/20170222/148775895784799.png', '', 'http://192.168.71.21:8000/d/file/article/20170223/148785575371185.png', '0', '1486990977', '125317', '124', '0', '1', '0', '', '这个是游戏简介', '', '', 'http://192.168.71.21:8000/d/file/article/20170227/148820115390560.jpg', 'http://jianjue.d.youxi53.com/android', 'http://192.168.71.21:10002/android/app-release.apk', '0', '0');
INSERT INTO `ga_game` VALUES ('2', '剑雨江湖 s', '3', 'jyjh', 'menle', '0', 'http://192.168.71.21:10002/android/app-release.apk', 'jyjh', 'http://www.menle.com/login', '100', '100', '', '100', '100', '', '', 'http://192.168.71.21:8000/d/file/article/20170223/148785575371185.png', '0', '1487036462', '125317', '124', '0', '1', '0', '', '剑雨江湖剑雨江湖', '', '', '', '', '', '0', '0');
INSERT INTO `ga_game` VALUES ('3', '修天决3', '1', 'xtj', '腾讯', '0', 'http://192.168.71.21:10002/android/app-release.apk', 'ios', '100', '100', '100', '', '00', '00', 'http://192.168.71.21:8000/d/file/article/20170223/148784118350800.jpg', '', 'http://192.168.71.21:8000/d/file/article/20170225/148801678198256.png', '0', '1487064116', '125317', '124', '0', '1', '1', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `ga_game` VALUES ('4', '绝剑江湖', '1', 'jjjh', 'm', '0', 'http://192.168.71.21:10002/BingheSdk.apk', 'apk', '1', '1', '1', '', '1', '1', 'http://192.168.71.21:8000/d/file/article/20170222/148775875536920.png', 'http://192.168.71.21:8000/d/file/article/20170227/148820126624403.jpg', 'http://192.168.71.21:8000/d/file/article/20170227/148818158441550.jpg', '1', '1487301338', '125317', '124', '0', '1', '1', '游戏描述', '', '', '', 'http://192.168.71.21:8000/d/file/article/20170227/148820124481805.jpg', '', '', '0', '0');
INSERT INTO `ga_game` VALUES ('5', '剑雨江湖', '1', 'jyjh', 'baidu', '0', 'http://192.168.71.21:10002/d/file/apk/app-release.apk', 'test', 'test', 'test', 'test', '', 'test', 'test', 'http://192.168.71.21:8000/d/file/article/20170223/148784115264312.jpg', 'http://192.168.71.21:8000/d/file/article/20170227/148820128127577.jpg', 'http://192.168.71.21:8000/d/file/article/20170225/148801675856774.jpg', '1', '1487841163', '125428', '124', '0', '1', '100', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `ga_game` VALUES ('6', '首页推荐', '1', '少年群侠传', 'baidu', '0', 'app-debug.apk', 'tes', 'test', 'test', 'test', '', 'tse', 'test', 'http://192.168.71.21:8000/d/file/article/20170224/148790665873659.png', '', 'http://192.168.71.21:8000/d/file/article/20170227/148818161175039.png', '2', '1487906669', '125317', '124', '0', '1', '0', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `ga_game` VALUES ('7', '首页推荐', '1', 'test', 'test', '0', 'app-debug.apk', 'tes', 'tes', 'tse', 'tes', '', 'tse', 'tes', 'http://192.168.71.21:8000/d/file/article/20170224/148790669921586.png', '', 'http://192.168.71.21:8000/d/file/article/20170225/148801680616125.png', '2', '1487906708', '125317', '124', '0', '', '0', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `ga_game` VALUES ('8', '一剑逍遥', '2', 'bjcs', 'test', '0', 'http://192.168.71.21:10002/android/app-release.apk', 'test', 'test', 'tes', 'tes', '', 'ts', 'tes', 'http://192.168.71.21:10002/d/file/game/20170228/148825016520372.jpg', 'http://192.168.71.21:10002/d/file/game/20170228/148825014927709.png', 'http://192.168.71.21:10002/d/file/game/20170228/148825015832622.png', '2', '1487906870', '125317', '124', '0', '1', '0', '游戏描述', '一一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介一剑逍遥游戏简介剑逍遥游戏简介', 'http://192.168.71.21:10002/d/file/game/20170228/148825014343956.jpg', 'http://192.168.71.21:10002/d/file/game/20170228/148825015235585.jpg', 'http://192.168.71.21:10002/d/file/game/20170228/148825015496589.jpg', '', 'http://192.168.71.21:10002/android/app-release.apk', '0', '1');
INSERT INTO `ga_game` VALUES ('9', '1', '127', '1', '1', '99999', '', '', '', '', '', '', '', '', '', '', '', '0', '1505377115', '159', '124', '0', '1', '0', '1', '', '', '', '', '', '', '0', '0');
INSERT INTO `ga_game` VALUES ('10', '啊看见阿s', '127', '2', '2', '99999', 'http://192.168.71.21:10002/Desert.jpg', '', '', '', '', '', '', '', 'http://192.168.71.21:10002/d/file/game//20171009150751586516460.jpg', 'http://192.168.71.21:10002/d/file/game//20171009150751584968669.jpg', 'http://192.168.71.21:10002/d/file/game//20171009150751586316930.jpg', '0', '1505377125', '1059', '124', '0', '1', '0', '2', '', 'http://192.168.71.21:10002/d/file/game//20171009150751585197438.jpg', 'http://192.168.71.21:10002/d/file/game//20171009150751586080844.jpg', 'http://192.168.71.21:10002/d/file/game//20171009150751586196949.jpg', '', '', '0', '0');

-- ----------------------------
-- Table structure for ga_game_card
-- ----------------------------
DROP TABLE IF EXISTS `ga_game_card`;
CREATE TABLE `ga_game_card` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '卡类型名称,如新手卡，媒体卡，至尊卡等',
  `game_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '游戏id',
  `game_server_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '礼包对应的游戏服务器',
  `card_file` varchar(255) NOT NULL DEFAULT '' COMMENT '礼包存储路径',
  `type_id` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1表示礼包码,2表示激活码',
  `type_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '礼包内容',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '序号',
  `use_explain` varchar(255) NOT NULL DEFAULT '' COMMENT '礼包使用说明',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示在不展示，1表示在前台展示',
  `card_no_count` int(9) NOT NULL DEFAULT '0' COMMENT '礼包数目',
  `left_show_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '礼包左边广告栏图片',
  `package_hall_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '礼包大厅列表显示的图片',
  `level_id` tinyint(2) NOT NULL DEFAULT '0' COMMENT '会员等级ID',
  `max_count` int(4) NOT NULL DEFAULT '0' COMMENT '最大可领取数量',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '是否已经删除 -1已删除0正常',
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='礼包';

-- ----------------------------
-- Records of ga_game_card
-- ----------------------------
INSERT INTO `ga_game_card` VALUES ('1', '礼包测试', '1', '0', 'http://192.168.71.21:8000/d/file/article/20170223/148783671672629.txt', '1', '使用方法', '0', '使用方法', '1', '100', 'http://192.168.71.21:8000/d/file/article/20170223/148783672224038.png', 'http://192.168.71.21:8000/d/file/article/20170223/148783672564654.png', '0', '100', '0');
INSERT INTO `ga_game_card` VALUES ('2', '剑雨江湖礼包', '5', '0', 'http://192.168.71.21:8000/d/file/article/20170226/148808367751184.txt', '1', '礼包使用说明', '0', '礼包使用方法', '1', '21', 'http://192.168.71.21:8000/d/file/article/20170226/148808368558201.png', 'http://192.168.71.21:8000/d/file/article/20170226/148808369020725.jpg', '0', '100', '0');
INSERT INTO `ga_game_card` VALUES ('3', '礼包1', '1', '0', 'http://192.168.71.21:8000/d/file/article/20170227/148816601785883.txt', '1', '发斯蒂芬', '0', '萨芬的', '1', '11', 'http://192.168.71.21:8000/d/file/article/20170227/148816602616244.jpg', 'http://192.168.71.21:8000/d/file/article/20170227/148816603316185.jpg', '0', '12', '0');
INSERT INTO `ga_game_card` VALUES ('4', '礼包二', '1', '0', 'http://192.168.71.21:8000/d/file/article/20170227/148817317957939.txt', '1', '的说法的', '0', '阿斯顿发送到', '1', '11', 'http://192.168.71.21:8000/d/file/article/20170227/148817319161583.jpg', 'http://192.168.71.21:8000/d/file/article/20170227/148817319475914.jpg', '0', '123', '0');
INSERT INTO `ga_game_card` VALUES ('5', '礼包三', '7', '0', 'http://192.168.71.21:8000/d/file/article/20170227/148817323174328.txt', '1', '防守打法', '0', '防守打法', '1', '11', 'http://192.168.71.21:8000/d/file/article/20170227/148817323978673.jpg', 'http://192.168.71.21:8000/d/file/article/20170227/148817324349604.jpg', '0', '21', '0');
INSERT INTO `ga_game_card` VALUES ('6', '礼包四', '3', '0', 'http://192.168.71.21:8000/d/file/article/20170227/148817328094768.txt', '1', 'asdf', '0', '阿斯顿发送到', '1', '11', 'http://192.168.71.21:8000/d/file/article/20170227/148817328581306.jpg', 'http://192.168.71.21:8000/d/file/article/20170227/148817328831571.jpg', '0', '0', '0');
INSERT INTO `ga_game_card` VALUES ('7', '礼包五', '6', '0', 'http://192.168.71.21:8000/d/file/article/20170227/148817334413745.txt', '1', '阿斯顿发', '0', '阿斯顿发送到', '1', '11', 'http://192.168.71.21:8000/d/file/article/20170227/148817333762775.jpg', 'http://192.168.71.21:8000/d/file/article/20170227/148817333941956.jpg', '0', '12', '0');
INSERT INTO `ga_game_card` VALUES ('8', '礼包六', '3', '0', 'http://192.168.71.21:8000/d/file/article/20170227/148817875392203.txt', '1', '发的发生', '0', '防守打法', '1', '11', 'http://192.168.71.21:8000/d/file/article/20170227/148817876187514.jpg', 'http://192.168.71.21:8000/d/file/article/20170227/148817876317534.jpg', '0', '12', '0');
INSERT INTO `ga_game_card` VALUES ('9', '礼包7', '3', '0', 'http://192.168.71.21:8000/d/file/article/20170227/148817914067271.txt', '1', '阿斯顿发', '0', 'asdfa', '1', '11', 'http://192.168.71.21:8000/d/file/article/20170227/148817914767133.jpg', 'http://192.168.71.21:8000/d/file/article/20170227/148817915058590.jpg', '0', '12', '0');
INSERT INTO `ga_game_card` VALUES ('10', '单码礼包导入', '1', '0', 'http://192.168.71.21:10002/d/file/gamecard//20170331149096158491938.txt', '3', '使用方法', '0', '使用方法', '1', '1000', 'http://192.168.71.21:10002/d/file/article//20170331149096166419462.png', 'http://192.168.71.21:10002/d/file/article//20170331149096166882282.png', '0', '0', '0');
INSERT INTO `ga_game_card` VALUES ('11', '单服礼包', '1', '0', 'http://192.168.71.21:10002/d/file/gamecard//20170331149096185187236.txt', '3', '礼包说明', '0', '礼包方法', '1', '98', 'http://192.168.71.21:10002/d/file/article//20170331149096185554586.png', 'http://192.168.71.21:10002/d/file/article//20170331149096185850709.png', '0', '0', '0');
INSERT INTO `ga_game_card` VALUES ('12', '手机aaa', '1', '0', 'http://192.168.71.21:10002/d/file/gamecard//20170811150243496689408.txt', '4', '新手礼包', '0', '新手礼包', '0', '10', '0', '0', '0', '0', '0');
INSERT INTO `ga_game_card` VALUES ('13', '剑绝手机礼包', '1', '0', 'http://192.168.71.21:10002/d/file/gamecard//20170821150330947978636.txt', '4', 'test', '0', 'test', '0', '41', 'test', 'test', '0', '0', '0');

-- ----------------------------
-- Table structure for ga_game_card_detail
-- ----------------------------
DROP TABLE IF EXISTS `ga_game_card_detail`;
CREATE TABLE `ga_game_card_detail` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `card_no` varchar(120) NOT NULL DEFAULT '' COMMENT '卡号',
  `card_id` int(10) NOT NULL DEFAULT '0' COMMENT '卡类型id，关联卡类型表card_id',
  `card_make_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '卡生成方式标记，1= 批量导入，2=公式生成',
  `game_id` bigint(11) NOT NULL COMMENT '游戏id',
  `game_server_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '本地服务器id',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `make_url` varchar(255) NOT NULL DEFAULT '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_receive` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该礼包是否被领取 0未领取 1已领取',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '领取时间',
  PRIMARY KEY (`id`),
  KEY `card_no` (`card_no`,`card_id`,`game_id`),
  KEY `user_id` (`user_id`,`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8 COMMENT='礼包明细';

-- ----------------------------
-- Records of ga_game_card_detail
-- ----------------------------
INSERT INTO `ga_game_card_detail` VALUES ('1', '111111\r', '1', '0', '1', '0', '1000', '', '1487836765', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('2', '2222233\r', '1', '0', '1', '0', '0', '', '1487836765', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('3', '3333333\r', '1', '0', '1', '0', '6', '', '1487836765', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('4', '333333\r', '1', '0', '1', '0', '100', '', '1487836765', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('5', '222222', '1', '0', '1', '0', '52', '', '1487836765', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('6', 'jyjhhxxx\r', '2', '0', '5', '0', '100', '', '1488083712', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('7', 'jyjhhxxx\r', '2', '0', '5', '0', '0', '', '1488083712', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('8', 'jyjhhxxx\r', '2', '0', '5', '0', '6', '', '1488083712', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('9', 'jyjhhxxx\r', '2', '0', '5', '0', '52', '', '1488083712', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('10', 'jyjhhxxx\r', '2', '0', '5', '0', '45', '', '1488083712', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('11', 'jyjhhxxx\r', '2', '0', '5', '0', '46', '', '1488083712', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('12', 'jyjhhxxx\r', '2', '0', '5', '0', '78', '', '1488083712', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('13', 'jyjhhxxx\r', '2', '0', '5', '0', '76', '', '1488083712', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('14', 'jyjhhxxx\r', '2', '0', '5', '0', '59', '', '1488083712', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('15', 'jyjhhxxx\r', '2', '0', '5', '0', '102', '', '1488083712', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('16', 'jyjhhxxx\r', '2', '0', '5', '0', '105', '', '1488083712', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('17', 'jyjhhxxx\r', '2', '0', '5', '0', '1', '', '1488083712', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('18', 'jyjhhxxx\r', '2', '0', '5', '0', '1', '', '1488083712', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('19', 'jyjhhxxx\r', '2', '0', '5', '0', '1', '', '1488083712', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('20', 'jyjhhxxx\r', '2', '0', '5', '0', '1', '', '1488083712', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('21', 'jyjhhxxx\r', '2', '0', '5', '0', '1', '', '1488083712', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('22', 'jyjhhxxx\r', '2', '0', '5', '0', '1', '', '1488083712', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('23', 'jyjhhxxx\r', '2', '0', '5', '0', '1', '', '1488083712', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('24', 'asdfa\r', '3', '0', '1', '0', '100', '', '1488166048', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('25', 'asdfa\r', '3', '0', '1', '0', '52', '', '1488166048', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('26', 'asdfa\r', '3', '0', '1', '0', '45', '', '1488166048', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('27', 'asdfa\r', '3', '0', '1', '0', '46', '', '1488166048', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('28', 'asdfa\r', '3', '0', '1', '0', '59', '', '1488166048', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('29', 'asdfa\r', '3', '0', '1', '0', '105', '', '1488166048', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('30', 'asdfa\r', '3', '0', '1', '0', '7', '', '1488166048', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('31', 'asdfa\r', '3', '0', '1', '0', '162', '', '1488166048', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('32', 'asdfa\r', '3', '0', '1', '0', '232', '', '1488166048', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('33', 'asdfa\r', '3', '0', '1', '0', '0', '', '1488166048', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('34', 'asdfa', '3', '0', '1', '0', '0', '', '1488166048', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('35', 'asdfa\r', '4', '0', '1', '0', '100', '', '1488173204', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('36', 'asdfa\r', '4', '0', '1', '0', '52', '', '1488173204', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('37', 'asdfa\r', '4', '0', '1', '0', '45', '', '1488173204', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('38', 'asdfa\r', '4', '0', '1', '0', '46', '', '1488173204', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('39', 'asdfa\r', '4', '0', '1', '0', '59', '', '1488173204', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('40', 'asdfa\r', '4', '0', '1', '0', '105', '', '1488173204', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('41', 'asdfa\r', '4', '0', '1', '0', '162', '', '1488173204', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('42', 'asdfa\r', '4', '0', '1', '0', '232', '', '1488173204', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('43', 'asdfa\r', '4', '0', '1', '0', '0', '', '1488173204', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('44', 'asdfa\r', '4', '0', '1', '0', '0', '', '1488173204', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('45', 'asdfa', '4', '0', '1', '0', '0', '', '1488173204', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('46', 'asdfa\r', '5', '0', '7', '0', '100', '', '1488173254', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('47', 'asdfa\r', '5', '0', '7', '0', '52', '', '1488173254', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('48', 'asdfa\r', '5', '0', '7', '0', '45', '', '1488173254', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('49', 'asdfa\r', '5', '0', '7', '0', '46', '', '1488173254', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('50', 'asdfa\r', '5', '0', '7', '0', '59', '', '1488173254', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('51', 'asdfa\r', '5', '0', '7', '0', '0', '', '1488173254', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('52', 'asdfa\r', '5', '0', '7', '0', '0', '', '1488173254', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('53', 'asdfa\r', '5', '0', '7', '0', '0', '', '1488173254', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('54', 'asdfa\r', '5', '0', '7', '0', '0', '', '1488173254', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('55', 'asdfa\r', '5', '0', '7', '0', '0', '', '1488173254', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('56', 'asdfa', '5', '0', '7', '0', '0', '', '1488173254', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('57', 'asdfa\r', '6', '0', '3', '0', '100', '', '1488173293', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('58', 'asdfa\r', '6', '0', '3', '0', '52', '', '1488173293', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('59', 'asdfa\r', '6', '0', '3', '0', '46', '', '1488173293', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('60', 'asdfa\r', '6', '0', '3', '0', '45', '', '1488173293', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('61', 'asdfa\r', '6', '0', '3', '0', '59', '', '1488173293', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('62', 'asdfa\r', '6', '0', '3', '0', '0', '', '1488173293', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('63', 'asdfa\r', '6', '0', '3', '0', '0', '', '1488173293', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('64', 'asdfa\r', '6', '0', '3', '0', '0', '', '1488173293', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('65', 'asdfa\r', '6', '0', '3', '0', '0', '', '1488173293', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('66', 'asdfa\r', '6', '0', '3', '0', '0', '', '1488173293', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('67', 'asdfa', '6', '0', '3', '0', '0', '', '1488173293', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('68', 'asdfa\r', '7', '0', '6', '0', '100', '', '1488173352', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('69', 'asdfa\r', '7', '0', '6', '0', '52', '', '1488173352', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('70', 'asdfa\r', '7', '0', '6', '0', '46', '', '1488173352', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('71', 'asdfa\r', '7', '0', '6', '0', '45', '', '1488173352', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('72', 'asdfa\r', '7', '0', '6', '0', '59', '', '1488173352', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('73', 'asdfa\r', '7', '0', '6', '0', '102', '', '1488173352', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('74', 'asdfa\r', '7', '0', '6', '0', '1', '', '1488173352', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('75', 'asdfa\r', '7', '0', '6', '0', '0', '', '1488173352', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('76', 'asdfa\r', '7', '0', '6', '0', '0', '', '1488173352', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('77', 'asdfa\r', '7', '0', '6', '0', '0', '', '1488173352', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('78', 'asdfa', '7', '0', '6', '0', '0', '', '1488173352', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('79', 'asdfa\r', '8', '0', '3', '0', '100', '', '1488178773', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('80', 'asdfa\r', '8', '0', '3', '0', '46', '', '1488178773', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('81', 'asdfa\r', '8', '0', '3', '0', '45', '', '1488178773', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('82', 'asdfa\r', '8', '0', '3', '0', '59', '', '1488178773', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('83', 'asdfa\r', '8', '0', '3', '0', '105', '', '1488178773', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('84', 'asdfa\r', '8', '0', '3', '0', '1', '', '1488178773', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('85', 'asdfa\r', '8', '0', '3', '0', '0', '', '1488178773', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('86', 'asdfa\r', '8', '0', '3', '0', '0', '', '1488178773', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('87', 'asdfa\r', '8', '0', '3', '0', '0', '', '1488178773', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('88', 'asdfa\r', '8', '0', '3', '0', '0', '', '1488178773', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('89', 'asdfa', '8', '0', '3', '0', '0', '', '1488178773', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('90', 'asdfa\r', '9', '0', '3', '0', '46', '', '1488179159', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('91', 'asdfa\r', '9', '0', '3', '0', '45', '', '1488179159', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('92', 'asdfa\r', '9', '0', '3', '0', '105', '', '1488179159', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('93', 'asdfa\r', '9', '0', '3', '0', '1', '', '1488179159', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('94', 'asdfa\r', '9', '0', '3', '0', '162', '', '1488179159', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('95', 'asdfa\r', '9', '0', '3', '0', '0', '', '1488179159', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('96', 'asdfa\r', '9', '0', '3', '0', '0', '', '1488179159', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('97', 'asdfa\r', '9', '0', '3', '0', '0', '', '1488179159', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('98', 'asdfa\r', '9', '0', '3', '0', '0', '', '1488179159', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('99', 'asdfa\r', '9', '0', '3', '0', '0', '', '1488179159', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('100', 'asdfa', '9', '0', '3', '0', '0', '', '1488179159', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('101', 'libalibao', '10', '0', '1', '0', '162', '', '1490961670', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('102', 'libalibao', '11', '0', '1', '0', '162', '', '1490961868', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('103', 'libalibao', '11', '0', '1', '0', '1234575', '', '1490961868', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('104', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('105', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('106', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('107', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('108', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('109', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('110', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('111', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('112', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('113', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('114', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('115', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('116', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('117', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('118', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('119', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('120', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('121', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('122', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('123', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('124', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('125', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('126', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('127', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('128', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('129', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('130', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('131', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('132', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('133', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('134', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('135', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('136', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('137', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('138', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('139', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('140', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('141', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('142', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('143', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('144', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('145', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('146', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('147', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('148', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('149', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('150', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('151', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('152', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('153', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('154', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('155', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('156', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('157', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('158', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('159', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('160', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('161', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('162', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('163', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('164', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('165', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('166', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('167', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('168', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('169', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('170', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('171', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('172', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('173', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('174', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('175', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('176', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('177', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('178', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('179', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('180', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('181', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('182', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('183', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('184', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('185', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('186', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('187', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('188', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('189', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('190', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('191', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('192', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('193', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('194', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('195', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('196', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('197', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('198', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('199', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('200', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('201', 'libalibao', '11', '0', '1', '0', '0', '', '1490961868', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('202', 'NLqXGf', '13', '0', '1', '0', '162', '', '1503309499', '1', '0');
INSERT INTO `ga_game_card_detail` VALUES ('203', '0sDjza', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('204', 'OGG8Q8', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('205', 'r1AqVr', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('206', 'ntyUOf', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('207', '3viCCT', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('208', '8n8v0t', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('209', 'GMHFLX', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('210', 'iP9DBH', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('211', '2bkGzM', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('212', 'dEgTyC', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('213', 'xbIOzV', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('214', 'AgaSX1', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('215', 'W0XDyd', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('216', 'JwZPMI', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('217', 'FLwprN', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('218', 'qoEtiG', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('219', 'qLCN3j', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('220', 'iB8hks', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('221', 'hnVe56', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('222', 'rdPEbA', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('223', 'TMchxv', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('224', '342JGW', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('225', 'DMLoUz', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('226', 'AlTdDI', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('227', 'imyLzm', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('228', 'gP7wek', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('229', 'ncUHMN', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('230', 'By0OVn', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('231', 'UXPeSZ', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('232', '2la7Xv', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('233', 'QqM5mu', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('234', 'HnNAjq', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('235', 'Mvig1x', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('236', 'WaVAvL', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('237', 'b7NYYX', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('238', 'dVaGBU', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('239', 'pqdH3h', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('240', 'bBnQaa', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('241', '5Qdn6y', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('242', 'Ye7ZWd', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');
INSERT INTO `ga_game_card_detail` VALUES ('243', 'rx65eX', '13', '0', '1', '0', '0', '', '1503309499', '0', '0');

-- ----------------------------
-- Table structure for ga_game_card_type_name
-- ----------------------------
DROP TABLE IF EXISTS `ga_game_card_type_name`;
CREATE TABLE `ga_game_card_type_name` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ga_game_card_type_name
-- ----------------------------

-- ----------------------------
-- Table structure for ga_game_server
-- ----------------------------
DROP TABLE IF EXISTS `ga_game_server`;
CREATE TABLE `ga_game_server` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(10) NOT NULL DEFAULT '0' COMMENT '游戏id',
  `server_name` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器名称',
  `server_cname` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器列别名称',
  `game_key` varchar(64) NOT NULL DEFAULT '' COMMENT '厂商KEY',
  `game_server_id` int(10) NOT NULL DEFAULT '0' COMMENT '服务器编号',
  `open_time` int(10) NOT NULL DEFAULT '0' COMMENT '真实开服时间:到这个时间后，白名单用户可以进入游戏',
  `show_time` int(10) NOT NULL DEFAULT '0' COMMENT '显示开服时间:到这个时间后，一般玩家可以进入',
  `new_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否新服',
  `status` tinyint(1) NOT NULL COMMENT '运营状态:-3逻辑删除-2维护-1测试0正常开启1火爆',
  `game_server_type` int(2) NOT NULL DEFAULT '0' COMMENT '服务器类型:0普通 1正式',
  `show_server_id` int(2) NOT NULL DEFAULT '0' COMMENT '平台显示编号',
  `list_order` smallint(3) NOT NULL DEFAULT '0' COMMENT '排序',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='服务器表';

-- ----------------------------
-- Records of ga_game_server
-- ----------------------------
INSERT INTO `ga_game_server` VALUES ('1', '1', '不删服10', '11', '10000', '10', '1487052333', '1487052335', '1', '-2', '1', '1000', '0', '1487052464');
INSERT INTO `ga_game_server` VALUES ('2', '3', '修天1服', '100', '1000', '1', '1487052945', '1487052945', '0', '-2', '0', '0', '0', '1487052996');
INSERT INTO `ga_game_server` VALUES ('3', '1', '三国令10', 'bieming', '111', '100', '1487074620', '1487074620', '0', '-2', '0', '0', '0', '0');
INSERT INTO `ga_game_server` VALUES ('4', '4', '不删档测试-9999服', 'test', '55', '9999', '1487303700', '1487303700', '0', '-2', '0', '0', '0', '1487303643');
INSERT INTO `ga_game_server` VALUES ('5', '4', '不删档1服', 'test', '8-', '1', '1487311200', '1487311200', '0', '-2', '0', '0', '0', '1487303897');
INSERT INTO `ga_game_server` VALUES ('6', '8', '百将传说', 'test', 'test', '1', '1487561128', '1487561130', '0', '-2', '0', '0', '0', '1487561137');
INSERT INTO `ga_game_server` VALUES ('7', '9', '1测试2服', '', '', '2', '1509984000', '1509984000', '0', '0', '0', '0', '0', '1510020793');
INSERT INTO `ga_game_server` VALUES ('8', '9', '1测试1服', '', '', '1', '1509984000', '1509984000', '0', '0', '0', '0', '0', '1510020735');
INSERT INTO `ga_game_server` VALUES ('9', '9', '1测试3服', '', '', '3', '1509984000', '1509984000', '0', '0', '0', '0', '0', '1510020972');
INSERT INTO `ga_game_server` VALUES ('10', '9', '1测试4服', '', '', '4', '1509984000', '1509984000', '0', '0', '0', '0', '0', '1510021149');
INSERT INTO `ga_game_server` VALUES ('11', '9', '1测试5服', '', '', '5', '1509984000', '1509984000', '0', '0', '0', '0', '0', '1510021171');
INSERT INTO `ga_game_server` VALUES ('12', '9', '1测试6服', '1', '2', '6', '1509984000', '1509984000', '0', '0', '0', '0', '0', '1510021203');
INSERT INTO `ga_game_server` VALUES ('13', '9', '1测试7服', '1', '1', '7', '1509984000', '1509984000', '0', '0', '0', '0', '0', '1510021225');
INSERT INTO `ga_game_server` VALUES ('14', '9', '1测试8服', '', '', '8', '1509984000', '1509984000', '0', '0', '0', '0', '0', '1510021667');
INSERT INTO `ga_game_server` VALUES ('15', '9', '1测试9服', '', '', '9', '1509984000', '1509984000', '0', '0', '0', '0', '0', '1510021725');
INSERT INTO `ga_game_server` VALUES ('16', '1', '剑绝测试1服', 'ttt', 'ttt', '1', '1509465600', '1509984000', '0', '0', '0', '0', '0', '1510020793');
INSERT INTO `ga_game_server` VALUES ('17', '1', '剑绝测试2服', 'tttt', 'tttttt', '2', '1509552000', '1509984000', '0', '0', '0', '0', '0', '1510020735');
INSERT INTO `ga_game_server` VALUES ('18', '1', '剑绝测试3服', '3', '3', '3', '1509638400', '1509984000', '0', '0', '0', '0', '0', '1510020972');
INSERT INTO `ga_game_server` VALUES ('19', '1', '剑绝测试4服', '4', '4', '4', '1509724800', '1509984000', '0', '0', '0', '0', '0', '1510021149');
INSERT INTO `ga_game_server` VALUES ('20', '1', '剑绝测试5服', '5', '5', '5', '1509811200', '1509984000', '0', '0', '0', '0', '0', '1510021171');
INSERT INTO `ga_game_server` VALUES ('21', '1', '剑绝测试6服', '1', '2', '6', '1509897600', '1509984000', '0', '0', '0', '0', '0', '1510021203');
INSERT INTO `ga_game_server` VALUES ('22', '1', '剑绝测试7服', '7', '7', '7', '1509984000', '1509984000', '0', '0', '0', '0', '0', '1510021225');
INSERT INTO `ga_game_server` VALUES ('23', '1', '剑绝测试8服', '8', '8', '8', '1510070400', '1509984000', '0', '0', '0', '0', '0', '1510021667');
INSERT INTO `ga_game_server` VALUES ('24', '1', '剑绝测试9服', '9', '9', '9', '1510156800', '1509984000', '0', '0', '0', '0', '0', '1510021725');

-- ----------------------------
-- Table structure for ga_game_server_maintain
-- ----------------------------
DROP TABLE IF EXISTS `ga_game_server_maintain`;
CREATE TABLE `ga_game_server_maintain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(255) NOT NULL DEFAULT '' COMMENT '计划名称',
  `game_id` int(11) NOT NULL DEFAULT '0' COMMENT '游戏ID',
  `plan_server` varchar(255) NOT NULL DEFAULT '' COMMENT '计划区服',
  `plan_start_time` int(11) NOT NULL DEFAULT '0' COMMENT '计划开始时间',
  `plan_end_time` int(11) NOT NULL DEFAULT '0' COMMENT '计划结束时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '计划状态:-1表示删除 0表示未开始，1表示正在维护，2表示维护结束',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='服务器维护计划';

-- ----------------------------
-- Records of ga_game_server_maintain
-- ----------------------------
INSERT INTO `ga_game_server_maintain` VALUES ('1', 'plana', '1', '1-100', '1487074620', '1487074620', '2', '1487066648');
INSERT INTO `ga_game_server_maintain` VALUES ('3', 'plan_c', '1', '200-300', '1487063668', '1487150072', '2', '1487063675');
INSERT INTO `ga_game_server_maintain` VALUES ('4', '例行维护', '1', '100', '0', '0', '2', '1487557056');
INSERT INTO `ga_game_server_maintain` VALUES ('6', '例行维护', '1', '100', '0', '0', '2', '1487557048');
INSERT INTO `ga_game_server_maintain` VALUES ('9', '100', '1', '100', '1487557864', '1487645787', '2', '1487559390');
INSERT INTO `ga_game_server_maintain` VALUES ('10', '555', '4', '666', '1504368000', '1505491200', '1', '1505879155');
