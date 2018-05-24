/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : yii_admin

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-05-25 00:19:28
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='平台广告';

-- ----------------------------
-- Records of cms_ad
-- ----------------------------
INSERT INTO `cms_ad` VALUES ('1', '1', '首页广告测试', 'uploads/20180523/aa6941297137d47bc7c57fae2e59c863.png', 'http://www.baidu.com', '1527084963', '1527033600', '1527379200', '0', '0', '-1');

-- ----------------------------
-- Table structure for cms_ad_block
-- ----------------------------
DROP TABLE IF EXISTS `cms_ad_block`;
CREATE TABLE `cms_ad_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '区块名称',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='区块名称';

-- ----------------------------
-- Records of cms_ad_block
-- ----------------------------
INSERT INTO `cms_ad_block` VALUES ('1', '首页轮播', '1526912725');
INSERT INTO `cms_ad_block` VALUES ('2', '新闻轮播', '1526913301');
INSERT INTO `cms_ad_block` VALUES ('3', '新闻轮播', '1526913302');

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `cate_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '分类层级',
  `tag_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '标签id  ',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `admin` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `content` longtext NOT NULL COMMENT '内容',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶|0:普通,1:置顶,2:头条',
  `list_image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '列表显示图片',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态|0:正常,-1:删除',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`id`,`cate_ids`,`is_top`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='平台文章';

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES ('1', '0', '2', '标签', '1', 'sysadmin', '这是标题', '关键词', 'default text', '<p style=\"outline: 0px; padding: 0px; margin-top: 0px; margin-bottom: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; word-break: break-all; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; white-space: normal;\">&nbsp;在yii框架中使用参数化进行IN查询时，结果不如所愿</p><p style=\"outline: 0px; padding: 0px; margin-top: 0px; margin-bottom: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; word-break: break-all; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; white-space: normal;\"></p><div class=\"dp-highlighter bg_cpp\" style=\"outline: 0px; padding: 1px 0px 0px; margin: 0px 0px 24px; position: relative; overflow-y: hidden; overflow-x: auto; font-family: Consolas, &quot;Courier New&quot;, Courier, mono, serif; font-size: 12px; background-color: rgb(231, 229, 220); width: 843.469px; word-break: break-all; color: rgb(51, 51, 51); white-space: normal;\"><div class=\"bar\" style=\"outline: 0px; padding: 0px 0px 0px 45px; margin: 0px; word-break: break-all;\"><div class=\"tools\" style=\"outline: 0px; padding: 3px 8px 10px 10px; margin: 0px; word-break: break-all; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 9px; line-height: normal; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; color: silver; background-color: rgb(248, 248, 248); border-left: 3px solid rgb(108, 226, 108); border-right: 1px solid rgb(231, 229, 220);\"><b style=\"outline: 0px; word-break: break-all;\">[cpp]</b>&nbsp;<a href=\"https://blog.csdn.net/molaifeng/article/details/49667485#\" class=\"ViewSource\" title=\"view plain\" style=\"outline: 0px; color: rgb(103, 149, 181); background-image: url(&quot;https://csdnimg.cn/release/phoenix/images/ico_plain.gif&quot;); background-position: left top; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 1px; margin: 0px 10px 0px 0px; word-break: break-all; display: inline-block; width: 16px; height: 16px; text-indent: -2000px;\">view plain</a><span style=\"outline: 0px; word-break: break-all;\">&nbsp;<a href=\"https://blog.csdn.net/molaifeng/article/details/49667485#\" class=\"CopyToClipboard\" title=\"copy\" style=\"outline: 0px; color: rgb(103, 149, 181); background-image: url(&quot;https://csdnimg.cn/release/phoenix/images/ico_copy.gif&quot;); background-position: left top; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 1px; margin: 0px 10px 0px 0px; word-break: break-all; display: inline-block; width: 16px; height: 16px; text-indent: -2000px;\">copy</a><div style=\"outline: 0px; padding: 0px; margin: 0px; word-break: break-all; position: absolute; left: 497px; top: 368px; width: 16px; height: 16px; z-index: 99;\"></div><div style=\"outline: 0px; padding: 0px; margin: 0px; word-break: break-all; position: absolute; left: 497px; top: 368px; width: 16px; height: 16px; z-index: 99;\"></div></span><span style=\"outline: 0px; word-break: break-all;\"></span></div></div><ol class=\"dp-cpp\" style=\"outline: 0px; padding: 0px; margin-right: 0px; margin-bottom: 24px; margin-left: 0px; list-style-position: initial; list-style-image: initial; border-top: none; border-right: 1px solid rgb(231, 229, 220); border-bottom: none; border-left: none; border-image: initial; background-color: rgb(255, 255, 255); color: rgb(92, 92, 92); word-break: break-all;\"><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; background-color: inherit;\">$sql&nbsp;=&lt;&lt;&lt;SQL&nbsp;&nbsp;</span></span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">SELECT&nbsp;id&nbsp;FROM&nbsp;&nbsp;tb&nbsp;WHERE&nbsp;id&nbsp;IN(:ids)&nbsp;&nbsp;</span></li><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">SQL;&nbsp;&nbsp;</span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$db&nbsp;=&nbsp;GeneralService::getSlaveDB();&nbsp;&nbsp;</span></li><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$result&nbsp;=&nbsp;$db-&gt;createCommand($sql)-&gt;query([<span class=\"string\" style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: blue; background-color: inherit;\">\':ids\'</span><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; background-color: inherit;\">&nbsp;=&gt;&nbsp;</span><span class=\"string\" style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: blue; background-color: inherit;\">\'1013,1015,1017\'</span><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; background-color: inherit;\">])-&gt;readAll();&nbsp;&nbsp;</span></span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;print_r($result);&nbsp;&nbsp;</span></li><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;</span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">Array&nbsp;&nbsp;</span></li><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">(&nbsp;&nbsp;</span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;[0]&nbsp;=&gt;&nbsp;Array&nbsp;&nbsp;</span></li><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;&nbsp;</span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[id]&nbsp;=&gt;&nbsp;1013&nbsp;&nbsp;</span></li><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)&nbsp;&nbsp;</span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">)&nbsp;&nbsp;</span></li></ol></div><p><br><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; font-size: 14px; white-space: normal;\">&nbsp; &nbsp; &nbsp; &nbsp; 于是翻了yii框架中相关源码，发现采用的是pdo查询，于是又查询了pdo相关资料，知道了原因：</span><span style=\"outline: 0px; font-weight: 700; word-break: break-all; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; font-size: 14px; white-space: normal;\"><span style=\"outline: 0px; word-break: break-all; color: rgb(255, 0, 0);\">不能让占位符代替一组值</span>。</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; font-size: 14px; white-space: normal;\"></span></p><p style=\"outline: 0px; padding: 0px; margin-top: 0px; margin-bottom: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; word-break: break-all; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; white-space: normal;\"></p><p style=\"outline: 0px; padding: 0px; margin-top: 0px; margin-bottom: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; word-break: break-all; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; white-space: normal;\"></p><div class=\"dp-highlighter bg_cpp\" style=\"outline: 0px; padding: 1px 0px 0px; margin: 0px 0px 24px; position: relative; overflow-y: hidden; overflow-x: auto; font-family: Consolas, &quot;Courier New&quot;, Courier, mono, serif; font-size: 12px; background-color: rgb(231, 229, 220); width: 843.469px; word-break: break-all; color: rgb(51, 51, 51); white-space: normal;\"><div class=\"bar\" style=\"outline: 0px; padding: 0px 0px 0px 45px; margin: 0px; word-break: break-all;\"><div class=\"tools\" style=\"outline: 0px; padding: 3px 8px 10px 10px; margin: 0px; word-break: break-all; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 9px; line-height: normal; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; color: silver; background-color: rgb(248, 248, 248); border-left: 3px solid rgb(108, 226, 108); border-right: 1px solid rgb(231, 229, 220);\"><b style=\"outline: 0px; word-break: break-all;\">[cpp]</b>&nbsp;<a href=\"https://blog.csdn.net/molaifeng/article/details/49667485#\" class=\"ViewSource\" title=\"view plain\" style=\"outline: 0px; color: rgb(103, 149, 181); background-image: url(&quot;https://csdnimg.cn/release/phoenix/images/ico_plain.gif&quot;); background-position: left top; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 1px; margin: 0px 10px 0px 0px; word-break: break-all; display: inline-block; width: 16px; height: 16px; text-indent: -2000px;\">view plain</a><span style=\"outline: 0px; word-break: break-all;\">&nbsp;<a href=\"https://blog.csdn.net/molaifeng/article/details/49667485#\" class=\"CopyToClipboard\" title=\"copy\" style=\"outline: 0px; color: rgb(103, 149, 181); background-image: url(&quot;https://csdnimg.cn/release/phoenix/images/ico_copy.gif&quot;); background-position: left top; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 1px; margin: 0px 10px 0px 0px; word-break: break-all; display: inline-block; width: 16px; height: 16px; text-indent: -2000px;\">copy</a><div style=\"outline: 0px; padding: 0px; margin: 0px; word-break: break-all; position: absolute; left: 497px; top: 731px; width: 16px; height: 16px; z-index: 99;\"></div><div style=\"outline: 0px; padding: 0px; margin: 0px; word-break: break-all; position: absolute; left: 497px; top: 731px; width: 16px; height: 16px; z-index: 99;\"></div></span><span style=\"outline: 0px; word-break: break-all;\"></span></div></div><ol class=\"dp-cpp\" style=\"outline: 0px; padding: 0px; margin-right: 0px; margin-bottom: 24px; margin-left: 0px; list-style-position: initial; list-style-image: initial; border-top: none; border-right: 1px solid rgb(231, 229, 220); border-bottom: none; border-left: none; border-image: initial; background-color: rgb(255, 255, 255); color: rgb(92, 92, 92); word-break: break-all;\"><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; background-color: inherit;\">SELECT&nbsp;id&nbsp;FROM&nbsp;tb&nbsp;WHERE&nbsp;userid&nbsp;IN&nbsp;(&nbsp;?&nbsp;);&nbsp;&nbsp;</span></span></li></ol></div><p style=\"outline: 0px; padding: 0px; margin-top: 0px; margin-bottom: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; word-break: break-all; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; white-space: normal;\"><br></p><p style=\"outline: 0px; padding: 0px; margin-top: 0px; margin-bottom: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; word-break: break-all; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; white-space: normal;\">&nbsp; &nbsp; &nbsp; &nbsp; 既然知道了原因，那么就找到替代的方法，FIND_IN_SET正好可以满足</p><p style=\"outline: 0px; padding: 0px; margin-top: 0px; margin-bottom: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; word-break: break-all; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; white-space: normal;\"></p><div class=\"dp-highlighter bg_cpp\" style=\"outline: 0px; padding: 1px 0px 0px; margin: 0px 0px 24px; position: relative; overflow-y: hidden; overflow-x: auto; font-family: Consolas, &quot;Courier New&quot;, Courier, mono, serif; font-size: 12px; background-color: rgb(231, 229, 220); width: 843.469px; word-break: break-all; color: rgb(51, 51, 51); white-space: normal;\"><div class=\"bar\" style=\"outline: 0px; padding: 0px 0px 0px 45px; margin: 0px; word-break: break-all;\"><div class=\"tools\" style=\"outline: 0px; padding: 3px 8px 10px 10px; margin: 0px; word-break: break-all; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 9px; line-height: normal; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; color: silver; background-color: rgb(248, 248, 248); border-left: 3px solid rgb(108, 226, 108); border-right: 1px solid rgb(231, 229, 220);\"><b style=\"outline: 0px; word-break: break-all;\">[cpp]</b>&nbsp;<a href=\"https://blog.csdn.net/molaifeng/article/details/49667485#\" class=\"ViewSource\" title=\"view plain\" style=\"outline: 0px; color: rgb(103, 149, 181); background-image: url(&quot;https://csdnimg.cn/release/phoenix/images/ico_plain.gif&quot;); background-position: left top; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 1px; margin: 0px 10px 0px 0px; word-break: break-all; display: inline-block; width: 16px; height: 16px; text-indent: -2000px;\">view plain</a><span style=\"outline: 0px; word-break: break-all;\">&nbsp;<a href=\"https://blog.csdn.net/molaifeng/article/details/49667485#\" class=\"CopyToClipboard\" title=\"copy\" style=\"outline: 0px; color: rgb(103, 149, 181); background-image: url(&quot;https://csdnimg.cn/release/phoenix/images/ico_copy.gif&quot;); background-position: left top; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 1px; margin: 0px 10px 0px 0px; word-break: break-all; display: inline-block; width: 16px; height: 16px; text-indent: -2000px;\">copy</a><div style=\"outline: 0px; padding: 0px; margin: 0px; word-break: break-all; position: absolute; left: 497px; top: 884px; width: 16px; height: 16px; z-index: 99;\"></div><div style=\"outline: 0px; padding: 0px; margin: 0px; word-break: break-all; position: absolute; left: 497px; top: 884px; width: 16px; height: 16px; z-index: 99;\"></div></span><span style=\"outline: 0px; word-break: break-all;\"></span></div></div><ol class=\"dp-cpp\" style=\"outline: 0px; padding: 0px; margin-right: 0px; margin-bottom: 24px; margin-left: 0px; list-style-position: initial; list-style-image: initial; border-top: none; border-right: 1px solid rgb(231, 229, 220); border-bottom: none; border-left: none; border-image: initial; background-color: rgb(255, 255, 255); color: rgb(92, 92, 92); word-break: break-all;\"><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; background-color: inherit;\">$sql&nbsp;=&lt;&lt;&lt;SQL&nbsp;&nbsp;&nbsp;</span></span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">SELECT&nbsp;id&nbsp;FROM&nbsp;tb&nbsp;WHERE&nbsp;FIND_IN_SET(id,&nbsp;:ids)&nbsp;&nbsp;</span></li><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">SQL;&nbsp;&nbsp;</span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$db&nbsp;=&nbsp;GeneralService::getSlaveDB();&nbsp;&nbsp;</span></li><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$result&nbsp;=&nbsp;$db-&gt;createCommand($sql)-&gt;query([<span class=\"string\" style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: blue; background-color: inherit;\">\':ids\'</span><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; background-color: inherit;\">&nbsp;=&gt;&nbsp;</span><span class=\"string\" style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: blue; background-color: inherit;\">\'1013,1015,1017\'</span><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; background-color: inherit;\">])-&gt;readAll();&nbsp;&nbsp;</span></span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;print_r($result);&nbsp;&nbsp;</span></li><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;</span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">Array&nbsp;&nbsp;</span></li><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">(&nbsp;&nbsp;</span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;[0]&nbsp;=&gt;&nbsp;Array&nbsp;&nbsp;</span></li><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;&nbsp;</span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[id]&nbsp;=&gt;&nbsp;1013&nbsp;&nbsp;</span></li><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)&nbsp;&nbsp;</span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;</span></li><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;[1]&nbsp;=&gt;&nbsp;Array&nbsp;&nbsp;</span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;&nbsp;</span></li><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[id]&nbsp;=&gt;&nbsp;1015&nbsp;&nbsp;</span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)&nbsp;&nbsp;</span></li><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;</span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;[2]&nbsp;=&gt;&nbsp;Array&nbsp;&nbsp;</span></li><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(&nbsp;&nbsp;</span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[id]&nbsp;=&gt;&nbsp;1017&nbsp;&nbsp;</span></li><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)&nbsp;&nbsp;</span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">)&nbsp;&nbsp;</span></li></ol></div><p style=\"outline: 0px; padding: 0px; margin-top: 0px; margin-bottom: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; word-break: break-all; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; white-space: normal;\">&nbsp; &nbsp; &nbsp; &nbsp; 简单科普下FIND_IN_SET函数</p><p style=\"outline: 0px; padding: 0px; margin-top: 0px; margin-bottom: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; word-break: break-all; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; white-space: normal;\"></p><div class=\"dp-highlighter bg_cpp\" style=\"outline: 0px; padding: 1px 0px 0px; margin: 0px 0px 24px; position: relative; overflow-y: hidden; overflow-x: auto; font-family: Consolas, &quot;Courier New&quot;, Courier, mono, serif; font-size: 12px; background-color: rgb(231, 229, 220); width: 843.469px; word-break: break-all; color: rgb(51, 51, 51); white-space: normal;\"><div class=\"bar\" style=\"outline: 0px; padding: 0px 0px 0px 45px; margin: 0px; word-break: break-all;\"><div class=\"tools\" style=\"outline: 0px; padding: 3px 8px 10px 10px; margin: 0px; word-break: break-all; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 9px; line-height: normal; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; color: silver; background-color: rgb(248, 248, 248); border-left: 3px solid rgb(108, 226, 108); border-right: 1px solid rgb(231, 229, 220);\"><b style=\"outline: 0px; word-break: break-all;\">[cpp]</b>&nbsp;<a href=\"https://blog.csdn.net/molaifeng/article/details/49667485#\" class=\"ViewSource\" title=\"view plain\" style=\"outline: 0px; color: rgb(103, 149, 181); background-image: url(&quot;https://csdnimg.cn/release/phoenix/images/ico_plain.gif&quot;); background-position: left top; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 1px; margin: 0px 10px 0px 0px; word-break: break-all; display: inline-block; width: 16px; height: 16px; text-indent: -2000px;\">view plain</a><span style=\"outline: 0px; word-break: break-all;\">&nbsp;<a href=\"https://blog.csdn.net/molaifeng/article/details/49667485#\" class=\"CopyToClipboard\" title=\"copy\" style=\"outline: 0px; color: rgb(103, 149, 181); background-image: url(&quot;https://csdnimg.cn/release/phoenix/images/ico_copy.gif&quot;); background-position: left top; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 1px; margin: 0px 10px 0px 0px; word-break: break-all; display: inline-block; width: 16px; height: 16px; text-indent: -2000px;\">copy</a><div style=\"outline: 0px; padding: 0px; margin: 0px; word-break: break-all; position: absolute; left: 497px; top: 1409px; width: 16px; height: 16px; z-index: 99;\"></div><div style=\"outline: 0px; padding: 0px; margin: 0px; word-break: break-all; position: absolute; left: 497px; top: 1409px; width: 16px; height: 16px; z-index: 99;\"></div></span><span style=\"outline: 0px; word-break: break-all;\"></span></div></div><ol class=\"dp-cpp\" style=\"outline: 0px; padding: 0px; margin-right: 0px; margin-bottom: 24px; margin-left: 0px; list-style-position: initial; list-style-image: initial; border-top: none; border-right: 1px solid rgb(231, 229, 220); border-bottom: none; border-left: none; border-image: initial; background-color: rgb(255, 255, 255); color: rgb(92, 92, 92); word-break: break-all;\"><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; background-color: inherit;\">FIND_IN_SET(str,strlist)&nbsp;&nbsp;</span></span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">假如字符串str在由N子链组成的字符串列表strlist中，则返回值的范围在&nbsp;1&nbsp;到&nbsp;N&nbsp;之间。&nbsp;&nbsp;</span></li><li class=\"alt\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; color: inherit; line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">一个字符串列表就是一个由一些被&nbsp;‘,’&nbsp;符号分开的子链组成的字符串。如果第一个参数是一个常数字符串，而第二个是type&nbsp;SET列，则&nbsp;&nbsp;&nbsp;FIND_IN_SET()&nbsp;函数被优化，使用比特计算。&nbsp;&nbsp;</span></li><li class=\"\" style=\"outline: 0px; margin-top: 8px; margin-left: 40px; border-top: none; border-right: none; border-bottom: none; border-left: 3px solid rgb(108, 226, 108); border-image: initial; list-style-type: decimal; list-style-image: initial; background-color: rgb(248, 248, 248); line-height: 18px; word-break: break-all; padding: 0px 3px 0px 10px !important; margin-right: 0px !important; margin-bottom: 0px !important; list-style-position: outside !important;\"><span style=\"outline: 0px; word-break: break-all; margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">如果str不在strlist&nbsp;或strlist&nbsp;为空字符串，则返回值为&nbsp;0&nbsp;。如任意一个参数为NULL，则返回值为&nbsp;NULL。这个函数在第一个参数包含一个逗号(‘,’)时将无法正常运行。&nbsp;&nbsp;</span></li></ol></div><p><br><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; font-size: 14px; white-space: normal;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"outline: 0px; word-break: break-all; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; font-size: 14px; white-space: normal; color: rgb(255, 0, 0);\"><span style=\"outline: 0px; font-weight: 700; word-break: break-all;\">【ps】strlist中由逗号组成的字符串，不能像平常习惯的那样，逗号右边加个空格，那是认不出来的。</span></span></p><p><br></p>', '1527089128', '1527089604', '0', 'uploads/20180523/cea6a7c21f576f084af786728a234b8e.png', '-1');
INSERT INTO `cms_article` VALUES ('2', '7', '0,7', '2,3,1', '1', 'sysadmin', 'Forever', 'Forever', 'default text', '<p><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(245, 245, 245);\">霞（かす）む街?K（まちな）みに　ざわめく朝（あさ）は</span><br><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(245, 245, 245);\">晨雾里的街道 吵闹的清晨</span><br><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(245, 245, 245);\">あなたの香（かお）りで　?簦à妞幔─?ら??（さ）めてゆく</span><br><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(245, 245, 245);\">因你的香气由梦中醒来</span><br><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(245, 245, 245);\">出逢（であ）いと?e（わか）れは　いつでも…　プリズム（prism）</span><br><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(245, 245, 245);\">不论相逢与离别 都是三棱镜</span><br><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(245, 245, 245);\">色褪（いろあ）せた想（おも）い</span><br><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(245, 245, 245);\">褪了色的记忆</span><br><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(245, 245, 245);\">眩（まぶ）しいほど??（はじ）くよ</span><br><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(245, 245, 245);\">仍然闪烁的耀眼</span><br><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(245, 245, 245);\">?洌à?）わらぬ　恋（こい）の?s束（やくそく）</span><br><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(245, 245, 245);\">不会改变的 爱的约定</span><br></p><div id=\"flag_more\" class=\"\" style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(245, 245, 245);\">あの?鏊?（ばしょ）に置（お）き去（さ）りのまま<br>还在那老地方<br>信（しん）じることの??（つよ）さを<br>把相信的强烈信念<br>この胸（むね）に抱（だ）きしめて<br>紧紧的攥在胸中<br>love you forever, you<br>永远爱你<br>?n（あお）い月明（つきあ）かり　静（しず）かに照（て）らす<br>浅色的月光 静静的照着<br>“ねぇ　素直（すなお）な瞳（め）で　明日（あした）を??（み）つめようよ”<br>喂 用坦诚的目光看着明天吧<br>たとえ苦（くる）しい思（おも）い出（で）も…　宝石（ほうせき）<br>就算是疼苦的回忆 也是宝石<br>??（なつ）かしく光（ひかる）<br>闪着让人不能忘怀的光<br>いつか消（き）えてゆく　あの日（ひ）に<br>何时消逝掉 那一日<br>??（きず）つけ会（あ）う悲（かな）しみは<br>相互伤害的伤痛<br>ああ　?妫à胜撙溃─前K（いや）せるから<br>啊 眼泪可以疗伤<br>?郏à?い）し?A（つづ）ける勇?荩à妞Δ?）を<br>继续爱的勇气<br>いつまでも忘（わす）れないで<br>任何时候都请不要忘记<br>love you forever, you<br>永远爱你<br>?洌à?）わらぬ　恋（こい）の?s束（やくそく）<br>不会改变的 爱的约定<br>あの?鏊?（ばしょ）に置（お）き去（さ）りのまま<br>还在那老地方<br>信（しん）じることの??（つよ）さを<br>把相信的强烈信念<br>この胸（むね）に抱（だ）きしめて<br>紧紧的攥在胸中<br>??（きず）つけ会（あ）う悲（かな）しみは<br>相互伤害的伤痛<br>ああ　?妫à胜撙溃─前K（いや）せるから<br>啊 眼泪可以疗伤<br>?郏à?い）し?A（つづ）ける勇?荩à妞Δ?）を<br>继续爱的勇气<br>いつまでも忘（わす）れないで<br>任何时候都请不要忘记<br>love you forever, you<br>永远爱你</div><p><br></p>', '1527178055', '1527178671', '0', 'uploads/20180524/5140ec63000255d978fd3413da4004e0.jpg', '0');

-- ----------------------------
-- Table structure for cms_article_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_category`;
CREATE TABLE `cms_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '名称',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父类id',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级路径',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '层级',
  `description` varchar(50) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='文章分类';

-- ----------------------------
-- Records of cms_article_category
-- ----------------------------
INSERT INTO `cms_article_category` VALUES ('1', '游戏', '0', '0', '0', '游戏');
INSERT INTO `cms_article_category` VALUES ('2', '游戏攻略', '1', '0', '0', '游戏攻略');
INSERT INTO `cms_article_category` VALUES ('3', '游戏公告', '1', '0', '0', '游戏公告');
INSERT INTO `cms_article_category` VALUES ('4', '音乐', '0', '0', '0', '音乐');
INSERT INTO `cms_article_category` VALUES ('5', '音乐', '0', '0', '0', '音乐');
INSERT INTO `cms_article_category` VALUES ('6', '音乐', '0', '0', '0', '音乐');
INSERT INTO `cms_article_category` VALUES ('7', '摇滚', '4', '0,7', '1', '摇滚');
INSERT INTO `cms_article_category` VALUES ('8', '民谣', '4', '0,8', '1', '民谣');

-- ----------------------------
-- Table structure for cms_attach
-- ----------------------------
DROP TABLE IF EXISTS `cms_attach`;
CREATE TABLE `cms_attach` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cate_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '所属分类',
  `tag_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '标签id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '附件名称',
  `file` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `width` int(10) NOT NULL DEFAULT '0' COMMENT '宽度',
  `height` int(10) NOT NULL DEFAULT '0' COMMENT '高度',
  `ext` varchar(255) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` varchar(255) NOT NULL DEFAULT '' COMMENT '文件大小',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COMMENT='附件';

-- ----------------------------
-- Records of cms_attach
-- ----------------------------
INSERT INTO `cms_attach` VALUES ('41', '3', '1', '遥望1.png', 'uploads/20180512/b83b084de63446421118a2c806d09a68.png', '2380', '3366', 'png', '141074', '1526136927');
INSERT INTO `cms_attach` VALUES ('42', '1', '1', '遥望2.png', 'uploads/20180512/e2cf19718a61fd15b747e94bcb2b7c46.png', '2380', '3366', 'png', '81101', '1526136927');
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
INSERT INTO `cms_attach` VALUES ('74', '0', '0', '外面的世界2.png', 'uploads/20180520/cbd292b2cf154f309874ddd6ac2476bb.png', '1785', '2525', 'png', '216730', '1526830694');
INSERT INTO `cms_attach` VALUES ('75', '0', '0', '外面的世界1.png', 'uploads/20180520/731f8f06b77211b477f097396ddf9ace.png', '1785', '2525', 'png', '219233', '1526830703');
INSERT INTO `cms_attach` VALUES ('76', '0', '0', '喜欢你.png', 'uploads/20180520/706bf443530870e2c2453fe577a63102.png', '1785', '2525', 'png', '209770', '1526830833');
INSERT INTO `cms_attach` VALUES ('77', '0', '0', '外面的世界2.png', 'uploads/20180521/7514d31cb589796d2f71909a0d148b98.png', '1785', '2525', 'png', '216730', '1526914023');
INSERT INTO `cms_attach` VALUES ('78', '0', '0', '喜欢你.png', 'uploads/20180521/298fe5a540aaf2e52789f79b6eb2f06a.png', '1785', '2525', 'png', '209770', '1526914035');
INSERT INTO `cms_attach` VALUES ('79', '0', '0', '喜欢你.png', 'uploads/20180521/fa93af7d4b767cc37e748349d225bc24.png', '1785', '2525', 'png', '209770', '1526914044');
INSERT INTO `cms_attach` VALUES ('80', '0', '0', '喜欢你.png', 'uploads/20180521/1e0b70568f866ed6fe0235470b75eee2.png', '1785', '2525', 'png', '209770', '1526914054');
INSERT INTO `cms_attach` VALUES ('81', '0', '0', '喜欢你.png', 'uploads/20180521/961e54216cdfd0b61f9f98161569f9f7.png', '1785', '2525', 'png', '209770', '1526914072');
INSERT INTO `cms_attach` VALUES ('82', '0', '0', '外面的世界2.png', 'uploads/20180521/a864d2640973bfa8937a15da1b786b65.png', '1785', '2525', 'png', '216730', '1526914079');
INSERT INTO `cms_attach` VALUES ('83', '0', '0', '喜欢你.png', 'uploads/20180521/7760ff736aff68fe1c9abbde2450511c.png', '1785', '2525', 'png', '209770', '1526914090');
INSERT INTO `cms_attach` VALUES ('84', '0', '0', '外面的世界1.png', 'uploads/20180521/ff2251a25963d1fc9d2461e1a852427f.png', '1785', '2525', 'png', '219233', '1526915334');
INSERT INTO `cms_attach` VALUES ('85', '0', '0', '喜欢你.png', 'uploads/20180523/94d525d43d3303e35b07ba48c6a7e224.png', '1785', '2525', 'png', '209770', '1527084810');
INSERT INTO `cms_attach` VALUES ('86', '0', '0', '流浪歌手的情人1.png', 'uploads/20180523/87bb3920dc8437055faa7294cc9e0057.png', '1860', '2631', 'png', '141474', '1527084857');
INSERT INTO `cms_attach` VALUES ('87', '0', '0', '遥望1.png', 'uploads/20180523/4b66e775d2259a0053ae4adf4b1cef64.png', '2380', '3366', 'png', '141074', '1527084861');
INSERT INTO `cms_attach` VALUES ('88', '0', '0', '流浪歌手的情人1.png', 'uploads/20180523/aa6941297137d47bc7c57fae2e59c863.png', '1860', '2631', 'png', '141474', '1527084948');
INSERT INTO `cms_attach` VALUES ('89', '0', '0', '外面的世界1.png', 'uploads/20180523/cea6a7c21f576f084af786728a234b8e.png', '1785', '2525', 'png', '219233', '1527088491');
INSERT INTO `cms_attach` VALUES ('90', '0', '0', '2510185046230896.jpg', 'uploads/20180524/4c4ad96a5c8042b28250a8efdd8fabed.jpg', '130', '130', 'jpg', '36821', '1527177481');
INSERT INTO `cms_attach` VALUES ('91', '0', '0', '2510185046230896.jpg', 'uploads/20180524/5140ec63000255d978fd3413da4004e0.jpg', '130', '130', 'jpg', '36821', '1527177988');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文章标签';

-- ----------------------------
-- Records of cms_tag
-- ----------------------------
INSERT INTO `cms_tag` VALUES ('1', '摇滚', '1527176968');
INSERT INTO `cms_tag` VALUES ('2', '民谣', '1527176974');
INSERT INTO `cms_tag` VALUES ('3', '流行', '1527176982');

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
) ENGINE=InnoDB AUTO_INCREMENT=1089 DEFAULT CHARSET=utf8 COMMENT='管理员操作日志';

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
INSERT INTO `ga_admin_log` VALUES ('1087', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1527084638', '4', '登录成功', '1');
INSERT INTO `ga_admin_log` VALUES ('1088', '1', '0', 'sysadmin', '127.0.0.1', '', '', '1527175655', '4', '登录成功', '1');

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
INSERT INTO `ga_admin_menu` VALUES ('29', '28', '28', 'cms/attach', 'index', '', '0', '附件管理', '0', '0', '1');
INSERT INTO `ga_admin_menu` VALUES ('30', '29', '28', 'cms/attach', 'index', '', '0', '附件列表', '备注', '0', '2');
INSERT INTO `ga_admin_menu` VALUES ('31', '30', '28', 'cms/attach', 'add', '', '0', '附件添加', '附件', '0', '3');
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
INSERT INTO `ga_admin_user` VALUES ('1', 'sysadmin', '系统管理', '', '3885662a78b79c45ade750345fe0b679', 'i4BeVr', '1479393090', '0', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61', '1000', '1', 'tfgmtf0j8t3nvb12vb1fd9rve0', '1527175655');
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
  `is_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否推荐|0:是,-1:否',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品牌';

-- ----------------------------
-- Records of shop_brand
-- ----------------------------

-- ----------------------------
-- Table structure for shop_goods
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods`;
CREATE TABLE `shop_goods` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `brand_id` int(10) NOT NULL DEFAULT '0' COMMENT '品牌id',
  `brand_name` varchar(60) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `sale_price` int(10) NOT NULL DEFAULT '0' COMMENT '售价',
  `market_price` int(10) NOT NULL DEFAULT '0' COMMENT '市场价',
  `cost_price` int(10) NOT NULL DEFAULT '0' COMMENT '成本价',
  `supplier_id` int(10) NOT NULL DEFAULT '0' COMMENT '供应商id',
  `supplier_name` varchar(60) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `list_image` varchar(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `weight` int(10) NOT NULL DEFAULT '0' COMMENT '重量多少克',
  `expenses_id` int(10) NOT NULL DEFAULT '0' COMMENT '运费模板id',
  `type_id` int(10) NOT NULL DEFAULT '0' COMMENT '商品类型id',
  `goods_cate_id` int(10) NOT NULL DEFAULT '0' COMMENT '分类id',
  `sale_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '特殊商品类型|0:默认,1:预售2:预约',
  `send_coin` int(10) NOT NULL DEFAULT '0' COMMENT '赠送积分',
  `sku_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '库存计数|0:拍下减库存1:付款减库存,2:出库减库存',
  `rank` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '商品发布|0出售,1:待发布,2:放入仓库',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `keywords` varchar(60) NOT NULL DEFAULT '' COMMENT 'seo关键字',
  `description` varchar(60) NOT NULL DEFAULT '' COMMENT 'seo描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of shop_goods
-- ----------------------------

-- ----------------------------
-- Table structure for shop_goods_attr
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_attr`;
CREATE TABLE `shop_goods_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '属性名称',
  `goods_cate_id` int(10) NOT NULL DEFAULT '0' COMMENT '所属商品类型',
  `field_type` varchar(20) NOT NULL DEFAULT '' COMMENT '字段类型',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '可选值项',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性';

-- ----------------------------
-- Records of shop_goods_attr
-- ----------------------------

-- ----------------------------
-- Table structure for shop_goods_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_attr_value`;
CREATE TABLE `shop_goods_attr_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` bigint(10) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_attr_id` bigint(10) NOT NULL DEFAULT '0' COMMENT '属性id',
  `goods_attr_name` varchar(60) NOT NULL DEFAULT '' COMMENT '属性名称',
  `value` varchar(60) NOT NULL DEFAULT '' COMMENT '值',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性值';

-- ----------------------------
-- Records of shop_goods_attr_value
-- ----------------------------

-- ----------------------------
-- Table structure for shop_goods_detail
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_detail`;
CREATE TABLE `shop_goods_detail` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(10) NOT NULL DEFAULT '0' COMMENT '商品id',
  `image_lists` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图集',
  `sale_desc` int(11) NOT NULL DEFAULT '0' COMMENT '卖点描述',
  `goods_detail` text NOT NULL COMMENT '商品详情 全屏',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品详情';

-- ----------------------------
-- Records of shop_goods_detail
-- ----------------------------

-- ----------------------------
-- Table structure for shop_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_spec`;
CREATE TABLE `shop_goods_spec` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cate_id` int(10) NOT NULL DEFAULT '0' COMMENT '商品类型',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '规格名称',
  `items` varchar(255) NOT NULL DEFAULT '' COMMENT '规格项',
  `rank` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规格';

-- ----------------------------
-- Records of shop_goods_spec
-- ----------------------------

-- ----------------------------
-- Table structure for shop_goods_spec_price
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_spec_price`;
CREATE TABLE `shop_goods_spec_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` bigint(10) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_spec_ids` varchar(60) NOT NULL DEFAULT '0' COMMENT '商品规格ids|多项用,隔开',
  `goods_spec_items` varchar(60) NOT NULL DEFAULT '' COMMENT '规格名称多项用,隔开',
  `product_no` varchar(60) NOT NULL DEFAULT '' COMMENT '货号',
  `price` int(10) NOT NULL DEFAULT '0' COMMENT '价格|分存储',
  `sku` int(10) NOT NULL DEFAULT '0' COMMENT '库存数量',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_no` (`product_no`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规格价格表';

-- ----------------------------
-- Records of shop_goods_spec_price
-- ----------------------------

-- ----------------------------
-- Table structure for shop_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_type`;
CREATE TABLE `shop_goods_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '类型名称',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类型';

-- ----------------------------
-- Records of shop_goods_type
-- ----------------------------

-- ----------------------------
-- Table structure for shop_order
-- ----------------------------
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `out_trade_no` varchar(60) NOT NULL DEFAULT '' COMMENT '订单号',
  `money` int(10) NOT NULL DEFAULT '0' COMMENT '总金额',
  `user_id` bigint(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `exprese_id` int(10) NOT NULL DEFAULT '0' COMMENT '配送方式id',
  `exprese_name` varchar(60) NOT NULL DEFAULT '' COMMENT '配送名称',
  `exprese_fee` int(10) NOT NULL DEFAULT '0' COMMENT '配送费用',
  `exprese_no` varchar(60) NOT NULL DEFAULT '' COMMENT '货运单号',
  `receiver` varchar(60) NOT NULL DEFAULT '' COMMENT '收货人',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '联系方式',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '收货地址	',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '邮编',
  `delivery_time` int(11) NOT NULL DEFAULT '0' COMMENT '送货时间	',
  `message` varchar(60) NOT NULL DEFAULT '' COMMENT '客户留言',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态|0:待确认,1:已确认,2:无效4退货',
  `pay_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态 |0:未支付,1:已支付',
  `delivery_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '发货状态|0:未发货,1:已发货,2:待收货,3:完成',
  `pay_ways` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付方式	',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '下单时间	',
  `paytime` int(10) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品订单';

-- ----------------------------
-- Records of shop_order
-- ----------------------------

-- ----------------------------
-- Table structure for shop_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_detail`;
CREATE TABLE `shop_order_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` bigint(10) NOT NULL DEFAULT '0' COMMENT '订单号',
  `goods_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_image_list` varchar(128) NOT NULL DEFAULT '' COMMENT '封面',
  `goods_name` varchar(60) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_no` varchar(60) NOT NULL DEFAULT '' COMMENT '商品编号',
  `product_no` varchar(60) NOT NULL DEFAULT '' COMMENT '货号',
  `goods_spec_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品规格id',
  `goods_spec_item` varchar(60) NOT NULL DEFAULT '' COMMENT '商品规格名称',
  `price` int(10) NOT NULL DEFAULT '0' COMMENT '商品售价',
  `num` int(10) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `total_price` int(10) NOT NULL DEFAULT '0' COMMENT '商品总价',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单详情';

-- ----------------------------
-- Records of shop_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for shop_order_log
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_log`;
CREATE TABLE `shop_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` bigint(10) NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_comment` varchar(60) NOT NULL DEFAULT '' COMMENT '状态备注',
  `comment` varchar(60) NOT NULL DEFAULT '' COMMENT '操作备注',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单操作日志';

-- ----------------------------
-- Records of shop_order_log
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
