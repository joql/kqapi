/*
 Navicat Premium Data Transfer

 Source Server         : bwg
 Source Server Type    : MySQL
 Source Server Version : 50561
 Source Host           : b.kylinqi.cn:3306
 Source Schema         : kqapi_kylinqi_c

 Target Server Type    : MySQL
 Target Server Version : 50561
 File Encoding         : 65001

 Date: 30/11/2018 10:52:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for snake_articles
-- ----------------------------
DROP TABLE IF EXISTS `snake_articles`;
CREATE TABLE `snake_articles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章描述',
  `keywords` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章关键字',
  `thumbnail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章缩略图',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章内容',
  `add_time` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of snake_articles
-- ----------------------------
INSERT INTO `snake_articles` VALUES (2, '文章标题', '文章描述', '关键字1,关键字2,关键字3', '/upload/20170916/1e915c70dbb9d3e8a07bede7b64e4cff.png', '<p><img src=\"/upload/image/20170916/1505555254.png\" title=\"1505555254.png\" alt=\"QQ截图20170916174651.png\"/></p><p>测试文章内容</p><p>测试内容</p>', '2017-09-16 17:47:44');
INSERT INTO `snake_articles` VALUES (3, '生财有道', '', '', '', '', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for snake_goods
-- ----------------------------
DROP TABLE IF EXISTS `snake_goods`;
CREATE TABLE `snake_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详情',
  `img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品图片',
  `price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `ctime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of snake_goods
-- ----------------------------
INSERT INTO `snake_goods` VALUES (2, '股市—赢战寒冬', '213123', '/upload/20181129/9b7d4dbaa4afb50a76086876d3011a59.jpg', 1.32, 1543490598, '123ffff');
INSERT INTO `snake_goods` VALUES (3, '商品期货直播间 瑞盈直播 期货直播 商品直播', '商品期货直播间 瑞盈直播 期货直播 商品直播', '/upload/20181129/976bc846b9e33ffff3bc7c107a58771c.jpg', 1.77, 1543495589, '123222');
INSERT INTO `snake_goods` VALUES (4, '测试商品', '测试商品', '/upload/20181130/f1967b0b1cd2b68113ca1eb4f1bf1dad.jpg', 1.22, 1543541390, '045616551610');
INSERT INTO `snake_goods` VALUES (5, '测试商品2', '测试商品2', '/upload/20181130/4265b6e65afafec8b50ed0814c8ea2a1.jpg', 1.55, 1543541511, '04110655511716');
INSERT INTO `snake_goods` VALUES (6, '测试商品3', '测试商品3', '/upload/20181130/691b98d18f2bdd12e6bcd0cb9fc9c41f.jpg', 1.20, 1543541809, '0454461655510');
INSERT INTO `snake_goods` VALUES (7, '测试商品4', '测试商品4', '/upload/20181130/641a837f0e91b18863193cec1a386e98.jpg', 2.33, 1543541951, '0sdf5615615');
INSERT INTO `snake_goods` VALUES (8, '测试商品6', '测试商品6', '/upload/20181130/6e46b47155d0682d86c5ce6cd1bccedb.jpg', 1.77, 1543542414, '10606165111');

-- ----------------------------
-- Table structure for snake_node
-- ----------------------------
DROP TABLE IF EXISTS `snake_node`;
CREATE TABLE `snake_node`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_name` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '节点名称',
  `control_name` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器名',
  `action_name` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
  `is_menu` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否是菜单项 1不是 2是',
  `type_id` int(11) NOT NULL COMMENT '父级节点id',
  `style` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单样式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of snake_node
-- ----------------------------
INSERT INTO `snake_node` VALUES (1, '用户管理', '#', '#', 2, 0, 'fa fa-users');
INSERT INTO `snake_node` VALUES (2, '管理员管理', 'user', 'index', 2, 1, '');
INSERT INTO `snake_node` VALUES (3, '添加管理员', 'user', 'useradd', 1, 2, '');
INSERT INTO `snake_node` VALUES (4, '编辑管理员', 'user', 'useredit', 1, 2, '');
INSERT INTO `snake_node` VALUES (5, '删除管理员', 'user', 'userdel', 1, 2, '');
INSERT INTO `snake_node` VALUES (6, '角色管理', 'role', 'index', 2, 1, '');
INSERT INTO `snake_node` VALUES (7, '添加角色', 'role', 'roleadd', 1, 6, '');
INSERT INTO `snake_node` VALUES (8, '编辑角色', 'role', 'roleedit', 1, 6, '');
INSERT INTO `snake_node` VALUES (9, '删除角色', 'role', 'roledel', 1, 6, '');
INSERT INTO `snake_node` VALUES (10, '分配权限', 'role', 'giveaccess', 1, 6, '');
INSERT INTO `snake_node` VALUES (11, '系统管理', '#', '#', 2, 0, 'fa fa-desktop');
INSERT INTO `snake_node` VALUES (12, '数据备份/还原', 'data', 'index', 2, 11, '');
INSERT INTO `snake_node` VALUES (13, '备份数据', 'data', 'importdata', 1, 12, '');
INSERT INTO `snake_node` VALUES (14, '还原数据', 'data', 'backdata', 1, 12, '');
INSERT INTO `snake_node` VALUES (15, '节点管理', 'node', 'index', 2, 1, '');
INSERT INTO `snake_node` VALUES (16, '添加节点', 'node', 'nodeadd', 1, 15, '');
INSERT INTO `snake_node` VALUES (17, '编辑节点', 'node', 'nodeedit', 1, 15, '');
INSERT INTO `snake_node` VALUES (18, '删除节点', 'node', 'nodedel', 1, 15, '');
INSERT INTO `snake_node` VALUES (19, '商品管理', 'articles', 'index', 2, 0, 'fa fa-book');
INSERT INTO `snake_node` VALUES (20, '商品列表', 'articles', 'index', 2, 19, '');
INSERT INTO `snake_node` VALUES (21, '添加商品', 'articles', 'articleadd', 1, 19, '');
INSERT INTO `snake_node` VALUES (22, '编辑商品', 'articles', 'articleedit', 1, 19, '');
INSERT INTO `snake_node` VALUES (23, '删除商品', 'articles', 'articledel', 1, 19, '');
INSERT INTO `snake_node` VALUES (24, '上传图片', 'articles', 'uploadImg', 1, 19, '');
INSERT INTO `snake_node` VALUES (25, '个人中心', '#', '#', 1, 0, '');
INSERT INTO `snake_node` VALUES (26, '编辑信息', 'profile', 'index', 1, 25, '');
INSERT INTO `snake_node` VALUES (27, '编辑头像', 'profile', 'headedit', 1, 25, '');
INSERT INTO `snake_node` VALUES (28, '上传头像', 'profile', 'uploadheade', 1, 25, '');

-- ----------------------------
-- Table structure for snake_record
-- ----------------------------
DROP TABLE IF EXISTS `snake_record`;
CREATE TABLE `snake_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(255) NOT NULL DEFAULT 1 COMMENT 'type    1:出库   2:入库',
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编号',
  `ctime` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `state` tinyint(255) NOT NULL DEFAULT 1 COMMENT '状态  1：未使用  2：已使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '编号记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of snake_record
-- ----------------------------
INSERT INTO `snake_record` VALUES (1, 1, '123', 1543494461, 0);


-- ----------------------------
-- Table structure for snake_role
-- ----------------------------
DROP TABLE IF EXISTS `snake_role`;
CREATE TABLE `snake_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `rule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '权限节点数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of snake_role
-- ----------------------------
INSERT INTO `snake_role` VALUES (1, '超级管理员', '*');
INSERT INTO `snake_role` VALUES (2, '系统维护员', '1,2,3,4,5,6,7,8,9,10');

-- ----------------------------
-- Table structure for snake_user
-- ----------------------------
DROP TABLE IF EXISTS `snake_user`;
CREATE TABLE `snake_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '密码',
  `head` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '头像',
  `login_times` int(11) NOT NULL DEFAULT 0 COMMENT '登陆次数',
  `last_login_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` int(11) NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '真实姓名',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '状态',
  `role_id` int(11) NOT NULL DEFAULT 1 COMMENT '用户角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of snake_user
-- ----------------------------
INSERT INTO `snake_user` VALUES (1, 'admin', 'a9ddd2e7bdff202e3e9bca32765e9ba0', '/static/admin/images/profile_small.jpg', 44, '1.118.23.44', 1543540800, 'admin', 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
