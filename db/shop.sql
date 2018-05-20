/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : game_admin

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-05-20 21:59:14
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
