/*
Navicat MySQL Data Transfer

Source Server         : one
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : qyqxgl

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2019-08-15 16:12:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `ID` int(32) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `NICKNAME` varchar(20) DEFAULT NULL,
  `PHONENUM` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', '张三', '小三', '18888888888', 'zs@163.com');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `ID` int(32) NOT NULL,
  `ORDERNUM` varchar(20) NOT NULL,
  `ORDERTIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PEOPLECOUNT` int(11) DEFAULT NULL,
  `ORDERDESC` varchar(500) DEFAULT NULL,
  `PAYTYPE` int(11) DEFAULT NULL,
  `ORDERSTATUS` int(11) DEFAULT NULL,
  `PRODUCTID` int(32) DEFAULT NULL,
  `MEMBERID` int(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AK_Key_2` (`ORDERNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '54321', '2019-08-08 20:24:22', '2', '没什么', '0', '1', '1', '1');
INSERT INTO `orders` VALUES ('2', '67890', '2019-08-08 20:24:22', '2', '没什么', '0', '1', '2', '1');
INSERT INTO `orders` VALUES ('3', '98765', '2019-08-08 20:24:22', '2', '没什么', '0', '1', '2', '1');
INSERT INTO `orders` VALUES ('4', '11111', '2019-08-08 20:24:22', '2', '没什么', '0', '1', '2', '1');
INSERT INTO `orders` VALUES ('5', '22222', '2019-08-08 20:24:22', '2', '没什么', '0', '1', '2', '1');
INSERT INTO `orders` VALUES ('6', '33333', '2019-08-08 20:24:22', '2', '没什么', '0', '1', '3', '1');
INSERT INTO `orders` VALUES ('7', '44444', '2019-08-08 20:24:22', '2', '没什么', '0', '1', '3', '1');
INSERT INTO `orders` VALUES ('8', '55555', '2019-08-08 20:24:22', '2', '没什么', '0', '1', '3', '1');
INSERT INTO `orders` VALUES ('9', 'wdnmd', '2019-08-09 11:35:35', '2', 'wdnmd', '0', '1', '3', '1');
INSERT INTO `orders` VALUES ('10', '1', '2019-08-08 23:38:41', null, null, null, null, null, null);
INSERT INTO `orders` VALUES ('11', ' ', '2019-08-08 23:38:48', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `order_traveller`
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller` (
  `ORDERID` int(32) NOT NULL,
  `TRAVELLERID` int(32) NOT NULL,
  PRIMARY KEY (`ORDERID`,`TRAVELLERID`),
  KEY `FK_Reference_2` (`TRAVELLERID`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`ORDERID`) REFERENCES `orders` (`ID`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`TRAVELLERID`) REFERENCES `traveller` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
INSERT INTO `order_traveller` VALUES ('1', '1');
INSERT INTO `order_traveller` VALUES ('4', '1');
INSERT INTO `order_traveller` VALUES ('6', '1');
INSERT INTO `order_traveller` VALUES ('2', '2');
INSERT INTO `order_traveller` VALUES ('3', '2');
INSERT INTO `order_traveller` VALUES ('5', '2');
INSERT INTO `order_traveller` VALUES ('7', '2');
INSERT INTO `order_traveller` VALUES ('8', '2');

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'user findAll', '/users/findAll.do');
INSERT INTO `permission` VALUES ('2', 'user findById', '/users/findById.do');
INSERT INTO `permission` VALUES ('3', 'role findAll', '/role/findAll.do');
INSERT INTO `permission` VALUES ('4', '1', '1');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `productNum` varchar(50) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `DepartureTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `productPrice` double(11,0) DEFAULT NULL,
  `productDesc` varchar(500) DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product` (`id`,`productNum`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'itcast-002', '北京三日游', '北京', '2019-08-08 09:57:15', '1200', '不错的旅行', '1');
INSERT INTO `product` VALUES ('2', 'itcast-003', '上海五日游', '上海', '2019-08-08 09:57:15', '1800', '魔都我来了', '0');
INSERT INTO `product` VALUES ('3', 'itcast-001', '北京三日游', '北京', '2019-08-08 09:57:15', '1200', '不错的旅行', '1');
INSERT INTO `product` VALUES ('4', '12', '啊啊', '发', '2019-08-08 17:43:00', '7489', '发', '0');
INSERT INTO `product` VALUES ('5', 'wdnmd', 'wdnmd', 'wdnmd', '2019-08-08 19:39:00', '1500', 'wdnmd', '1');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ADMIN', 'VIP');
INSERT INTO `role` VALUES ('2', 'USER', 'superVIP');
INSERT INTO `role` VALUES ('3', 'BOSS', '你大哥');
INSERT INTO `role` VALUES ('4', 'BOSS1', '11');
INSERT INTO `role` VALUES ('5', 'BOSS111', '你大哥1');

-- ----------------------------
-- Table structure for `role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `permissionId` int(32) NOT NULL DEFAULT '0',
  `roleId` int(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permissionId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1');
INSERT INTO `role_permission` VALUES ('2', '1');
INSERT INTO `role_permission` VALUES ('3', '1');
INSERT INTO `role_permission` VALUES ('1', '2');
INSERT INTO `role_permission` VALUES ('1', '3');
INSERT INTO `role_permission` VALUES ('2', '5');
INSERT INTO `role_permission` VALUES ('3', '5');

-- ----------------------------
-- Table structure for `syslog`
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `visitTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(50) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `executionTime` int(11) DEFAULT NULL,
  `method` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('9', '2019-08-15 11:41:27', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '0', '[类名] com.hyeah.powerSystem.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('10', '2019-08-15 11:43:05', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '0', '[类名] com.hyeah.powerSystem.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('11', '2019-08-15 11:43:17', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '0', '[类名] com.hyeah.powerSystem.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('12', '2019-08-15 11:43:26', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '0', '[类名] com.hyeah.powerSystem.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('13', '2019-08-15 11:44:56', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '0', '[类名] com.hyeah.powerSystem.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('14', '2019-08-15 11:45:09', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '738', '[类名] com.hyeah.powerSystem.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('92', '2019-08-15 15:20:32', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '20', '[类名] com.hyeah.powerSystem.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('93', '2019-08-15 15:21:15', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '19', '[类名] com.hyeah.powerSystem.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('94', '2019-08-15 15:21:19', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '33', '[类名] com.hyeah.powerSystem.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('95', '2019-08-15 15:22:23', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '33', '[类名] com.hyeah.powerSystem.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('96', '2019-08-15 15:22:38', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '23', '[类名] com.hyeah.powerSystem.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('97', '2019-08-15 15:24:13', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '20', '[类名] com.hyeah.powerSystem.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('98', '2019-08-15 15:25:48', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '34', '[类名] com.hyeah.powerSystem.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('99', '2019-08-15 15:26:20', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '8', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('100', '2019-08-15 15:26:33', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '10', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('101', '2019-08-15 15:26:54', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '191', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('102', '2019-08-15 15:26:55', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '9', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('103', '2019-08-15 15:27:27', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '10', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('104', '2019-08-15 15:27:30', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '33', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('105', '2019-08-15 15:27:47', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '132', '[类名] com.hyeah.powerSystem.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('106', '2019-08-15 15:33:13', 'admin', '0:0:0:0:0:0:0:1', '/roletoAdd.do', '4', '[类名] com.hyeah.powerSystem.controller.RoleController[方法名] toAdd');
INSERT INTO `syslog` VALUES ('107', '2019-08-15 15:33:15', 'admin', '0:0:0:0:0:0:0:1', '/roletoAdd.do', '189', '[类名] com.hyeah.powerSystem.controller.RoleController[方法名] toAdd');
INSERT INTO `syslog` VALUES ('108', '2019-08-15 15:33:15', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '9', '[类名] com.hyeah.powerSystem.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('109', '2019-08-15 15:33:28', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '26', '[类名] com.hyeah.powerSystem.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('110', '2019-08-15 15:33:31', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '20', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('111', '2019-08-15 15:33:32', 'admin', '0:0:0:0:0:0:0:1', '/userstoAdd.do', '1', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] toAdd');
INSERT INTO `syslog` VALUES ('112', '2019-08-15 15:33:57', 'admin', '0:0:0:0:0:0:0:1', '/userstoAdd.do', '203', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] toAdd');
INSERT INTO `syslog` VALUES ('113', '2019-08-15 15:33:57', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '8', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('114', '2019-08-15 15:43:01', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '81', '[类名] com.hyeah.powerSystem.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('115', '2019-08-15 15:43:14', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '167', '[类名] com.hyeah.powerSystem.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('116', '2019-08-15 15:43:17', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '17', '[类名] com.hyeah.powerSystem.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('117', '2019-08-15 15:43:19', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '53', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('118', '2019-08-15 15:43:24', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '41', '[类名] com.hyeah.powerSystem.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('119', '2019-08-15 15:43:32', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '19', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('120', '2019-08-15 15:43:35', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '13', '[类名] com.hyeah.powerSystem.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('121', '2019-08-15 15:43:40', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '55', '[类名] com.hyeah.powerSystem.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('122', '2019-08-15 15:43:46', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '10', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('123', '2019-08-15 15:43:48', 'admin', '0:0:0:0:0:0:0:1', '/userstoAdd.do', '0', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] toAdd');
INSERT INTO `syslog` VALUES ('124', '2019-08-15 15:43:52', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '19', '[类名] com.hyeah.powerSystem.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('125', '2019-08-15 15:43:53', 'admin', '0:0:0:0:0:0:0:1', '/roletoAdd.do', '1', '[类名] com.hyeah.powerSystem.controller.RoleController[方法名] toAdd');
INSERT INTO `syslog` VALUES ('126', '2019-08-15 15:43:57', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '22', '[类名] com.hyeah.powerSystem.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('127', '2019-08-15 15:43:58', 'admin', '0:0:0:0:0:0:0:1', '/permission/toAdd.do', '1', '[类名] com.hyeah.powerSystem.controller.PermissionController[方法名] toAdd');
INSERT INTO `syslog` VALUES ('128', '2019-08-15 15:44:04', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '19', '[类名] com.hyeah.powerSystem.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('129', '2019-08-15 15:46:16', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '20', '[类名] com.hyeah.powerSystem.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('130', '2019-08-15 15:46:18', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '47', '[类名] com.hyeah.powerSystem.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('131', '2019-08-15 15:49:46', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '12', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('132', '2019-08-15 15:49:47', 'admin', '0:0:0:0:0:0:0:1', '/userstoAdd.do', '0', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] toAdd');
INSERT INTO `syslog` VALUES ('133', '2019-08-15 15:49:59', 'admin', '0:0:0:0:0:0:0:1', '/userstoAdd.do', '277', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] toAdd');
INSERT INTO `syslog` VALUES ('134', '2019-08-15 15:49:59', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '7', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('135', '2019-08-15 15:50:01', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '29', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('136', '2019-08-15 15:50:10', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '19', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('137', '2019-08-15 15:50:12', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '47', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('138', '2019-08-15 15:50:15', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '89', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('139', '2019-08-15 15:50:15', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '8', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('140', '2019-08-15 15:50:17', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '39', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('141', '2019-08-15 15:50:21', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '14', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('142', '2019-08-15 15:50:24', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '19', '[类名] com.hyeah.powerSystem.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('143', '2019-08-15 15:50:25', 'admin', '0:0:0:0:0:0:0:1', '/roletoAdd.do', '1', '[类名] com.hyeah.powerSystem.controller.RoleController[方法名] toAdd');
INSERT INTO `syslog` VALUES ('144', '2019-08-15 15:50:29', 'admin', '0:0:0:0:0:0:0:1', '/roletoAdd.do', '90', '[类名] com.hyeah.powerSystem.controller.RoleController[方法名] toAdd');
INSERT INTO `syslog` VALUES ('145', '2019-08-15 15:50:30', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '13', '[类名] com.hyeah.powerSystem.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('146', '2019-08-15 15:50:36', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '13', '[类名] com.hyeah.powerSystem.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('147', '2019-08-15 15:50:38', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '22', '[类名] com.hyeah.powerSystem.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('148', '2019-08-15 15:50:43', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '812', '[类名] com.hyeah.powerSystem.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('149', '2019-08-15 15:50:44', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '10', '[类名] com.hyeah.powerSystem.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('150', '2019-08-15 15:50:52', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '10', '[类名] com.hyeah.powerSystem.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('151', '2019-08-15 15:50:55', 'admin', '0:0:0:0:0:0:0:1', '/permission/toAdd.do', '0', '[类名] com.hyeah.powerSystem.controller.PermissionController[方法名] toAdd');
INSERT INTO `syslog` VALUES ('152', '2019-08-15 15:50:58', 'admin', '0:0:0:0:0:0:0:1', '/permission/toAdd.do', '83', '[类名] com.hyeah.powerSystem.controller.PermissionController[方法名] toAdd');
INSERT INTO `syslog` VALUES ('153', '2019-08-15 15:50:58', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '9', '[类名] com.hyeah.powerSystem.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('154', '2019-08-15 15:51:43', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '22', '[类名] com.hyeah.powerSystem.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('155', '2019-08-15 15:53:21', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '9', '[类名] com.hyeah.powerSystem.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('156', '2019-08-15 15:53:28', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '9', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('157', '2019-08-15 15:53:52', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '11', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('158', '2019-08-15 15:54:51', 'admin', '0:0:0:0:0:0:0:1', '/users/findAll.do', '10', '[类名] com.hyeah.powerSystem.controller.UsersController[方法名] findAll');

-- ----------------------------
-- Table structure for `traveller`
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller` (
  `ID` int(32) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `SEX` varchar(20) DEFAULT NULL,
  `PHONENUM` varchar(20) DEFAULT NULL,
  `CREDENTIALSTYPE` int(11) DEFAULT NULL,
  `CREDENTIALSNUM` varchar(50) DEFAULT NULL,
  `TRAVELLERTYPE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES ('1', '张龙', '男', '13333333333', '0', '123456789009876543', '0');
INSERT INTO `traveller` VALUES ('2', '张小龙', '男', '15555555555', '0', '987654321123456789', '1');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '91@qq.com', 'admin', '$2a$10$Vbupd6ov8.jguFEXobJnV.1wKJFvqeV4k/UMi/DJt8R0AGC1WSaJi', '11111', '1');
INSERT INTO `users` VALUES ('11', 'af12a@qq.com', '321', '$2a$10$tXSt5Jansj.ImVgwCVFtbOcco/Dii3ELojVryoh0FXYqRaSVNyeAO', '12345678910', '1');
INSERT INTO `users` VALUES ('13', '1323@qq.com', 'ceshi', '$2a$10$i4cbkkRAWkje5yYZYG44euWbHEB8RMf4X/Ol7nZL0IkB/3y98FkU.', '12345678910', '1');
INSERT INTO `users` VALUES ('14', '12223@qq.com', '1122', '$2a$10$fU5Ctvp4An/7f436jM6Q.u5tuO1nHhl8eI0871yU7Ll7.MsH7R1X.', '12345678910', '1');
INSERT INTO `users` VALUES ('15', '12e3@qq.com', 'eee', '$2a$10$G5JM/dTqbhA9LL0e2K.BmOKqXmEVeMwru45tIPco77uMn4RkryDQi', '12345678910', '1');
INSERT INTO `users` VALUES ('16', '1233@qq.com', '33', '$2a$10$Ib6w9fMZuJj20Qz3AcjkuexBezkWPJ2RZtmaEwaYYP.F/G/IqbuPi', '12345678910', '0');
INSERT INTO `users` VALUES ('17', '12D3@qq.com', '1122的', '$2a$10$QfIJNhOLxIq0AFL76asui.6dUJOier26L6noqVgsXWoWq.q7.bavu', '12345678910', '0');
INSERT INTO `users` VALUES ('18', '12113@qq.com', '123', '$2a$10$5UW/JurfqB5aehO/O.brMeQOPNb1mklbh6rOTXgrC9gZ7rE5XwiGe', '12345678910', '1');
INSERT INTO `users` VALUES ('19', '啊123@qq.com', 'ceshi2', '$2a$10$SxfGlowpQjXDzLi0wEP7OeiFFfKe8YumXAB/Ehj86F2tvNEAYW1HW', '12345678910', '1');
INSERT INTO `users` VALUES ('20', '1222223@qq.com', 'admin5446', '$2a$10$8fQYjZz8QPpAS6q99m/TFelUtDy6MQKyclS5.AouEFpIH/rY7DNoS', '12345678910', '1');
INSERT INTO `users` VALUES ('21', '11123@qq.com', '111', '$2a$10$SIdT51jkL.FwPuc67g3B8uq9ViWwTrc8jajAx1kpO4mUb/JV/xKZa', '12345678910', '1');

-- ----------------------------
-- Table structure for `users_role`
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `userId` int(32) NOT NULL DEFAULT '0',
  `roleId` int(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('1', '1');
INSERT INTO `users_role` VALUES ('14', '1');
INSERT INTO `users_role` VALUES ('15', '1');
INSERT INTO `users_role` VALUES ('1', '2');
INSERT INTO `users_role` VALUES ('18', '2');
INSERT INTO `users_role` VALUES ('1', '3');
INSERT INTO `users_role` VALUES ('14', '3');
INSERT INTO `users_role` VALUES ('1', '4');
