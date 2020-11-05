/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.210
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : 192.168.1.210:3306
 Source Schema         : cls

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : 65001

 Date: 05/11/2020 09:25:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for biz_case
-- ----------------------------
DROP TABLE IF EXISTS `biz_case`;
CREATE TABLE `biz_case`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `case_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '案件名称',
  `case_time` datetime(0) NULL DEFAULT NULL COMMENT '案件时间',
  `case_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '案件地点',
  `case_reason` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '事由',
  `case_note` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '案件备注',
  `case_handler` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '处理人',
  `case_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '状态',
  `is_delete` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `modify_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '案件信息表：案件名称、时间、地点、事由、备注、处理人、状态、涉案人员关联增、删（显示姓名、性' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of biz_case
-- ----------------------------
INSERT INTO `biz_case` VALUES (6, '测试', '2020-10-01 03:02:00', '北京', '北京', '北京', '北京', '0', '0', '2020-10-16 18:05:25', '2020-10-16 18:05:25', 8, 8);
INSERT INTO `biz_case` VALUES (7, '西安', '2020-10-16 10:08:04', '西安', '西安', '西安', '西安', '1', '0', '2020-10-16 18:08:15', '2020-10-16 18:17:43', 8, 8);

-- ----------------------------
-- Table structure for biz_case_minor
-- ----------------------------
DROP TABLE IF EXISTS `biz_case_minor`;
CREATE TABLE `biz_case_minor`  (
  `minor_id` bigint(20) NULL DEFAULT NULL COMMENT '未成年人信息id',
  `case_id` bigint(20) NULL DEFAULT NULL COMMENT '案件id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '涉案人员关联关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for biz_minor
-- ----------------------------
DROP TABLE IF EXISTS `biz_minor`;
CREATE TABLE `biz_minor`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
  `sex` bit(1) NULL DEFAULT NULL COMMENT '性别',
  `id_card_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证号',
  `birthday` date NULL DEFAULT NULL COMMENT '出生年份',
  `police_station` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '所属派出所',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系电话',
  `case_record` bit(1) NULL DEFAULT NULL COMMENT '案件记录',
  `guardian_info` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '监护人信息',
  `is_delete` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `modify_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '未成年人信息表姓名、性别、身份证号、出生年份、所属派出所、联系电话、是否已有案件记录监护人' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of biz_minor
-- ----------------------------
INSERT INTO `biz_minor` VALUES (1, '测试', b'0', '123', '2020-10-13', '所属派出所', '15233344443', b'1', '存储监护人信息', '1', '2020-10-15 10:58:07', '2020-10-15 17:19:53', 8, 8);
INSERT INTO `biz_minor` VALUES (6, '测试女', b'1', '123', '2020-10-16', '女', '13255551111', b'0', '女', '0', '2020-10-15 18:05:30', '2020-10-15 18:05:30', 8, 8);
INSERT INTO `biz_minor` VALUES (7, '佘礼详', b'1', '123', '2020-10-30', 'Carey', '18566664443', b'1', 'Carey', '0', '2020-10-16 18:10:56', '2020-10-16 18:10:56', 8, 8);

-- ----------------------------
-- Table structure for sys_data_permission_test
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_permission_test`;
CREATE TABLE `sys_data_permission_test`  (
  `FIELD1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `FIELD2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIELD3` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIELD4` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DEPT_ID` int(11) NOT NULL,
  `CREATE_TIME` datetime(0) NULL,
  `ID` int(11) NOT NULL,
  `IS_DELETE` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户权限测试' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_data_permission_test
-- ----------------------------
INSERT INTO `sys_data_permission_test` VALUES ('小米', '小米10Pro', '4999', '珍珠白', 1, '2020-04-14 15:00:38', 1, 0);
INSERT INTO `sys_data_permission_test` VALUES ('腾讯', '黑鲨游戏手机3', '3799', '铠甲灰', 2, '2020-04-14 15:01:36', 2, 0);
INSERT INTO `sys_data_permission_test` VALUES ('华为', '华为P30', '3299', '天空之境', 1, '2020-04-14 15:03:11', 3, 0);
INSERT INTO `sys_data_permission_test` VALUES ('华为', '华为P40Pro', '6488', '亮黑色', 3, '2020-04-14 15:04:31', 4, 0);
INSERT INTO `sys_data_permission_test` VALUES ('vivo', 'Vivo iQOO 3', '3998', '拉力橙', 4, '2020-04-14 15:05:55', 5, 0);
INSERT INTO `sys_data_permission_test` VALUES ('一加', '一加7T', '3199', '冰际蓝', 5, '2020-04-14 15:06:53', 6, 0);
INSERT INTO `sys_data_permission_test` VALUES ('三星', '三星Galaxy S10', '4098', '浩玉白', 6, '2020-04-14 15:08:25', 7, 0);
INSERT INTO `sys_data_permission_test` VALUES ('苹果', 'iPhone 11 pro max', '9198', '暗夜绿', 4, '2020-04-14 15:09:20', 8, 0);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `DEPT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `PARENT_ID` bigint(20) NOT NULL COMMENT '上级部门ID',
  `DEPT_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `ORDER_NUM` bigint(20) NULL DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `IS_DELETE` bit(1) NULL DEFAULT b'0' COMMENT '是否删除',
  `CREATE_BY` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `MODIFY_BY` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`DEPT_ID`) USING BTREE,
  INDEX `t_dept_parent_id`(`PARENT_ID`) USING BTREE,
  INDEX `t_dept_dept_name`(`DEPT_NAME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (10, 0, '系统部', 7, '2019-06-14 21:01:31', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_eximport
-- ----------------------------
DROP TABLE IF EXISTS `sys_eximport`;
CREATE TABLE `sys_eximport`  (
  `FIELD1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段1',
  `FIELD2` int(11) NOT NULL COMMENT '字段2',
  `FIELD3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段3',
  `CREATE_TIME` datetime(0) NULL,
  `IS_DELETE` bit(1) NULL DEFAULT NULL COMMENT '是否删除'
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Excel导入导出测试' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_eximport
-- ----------------------------
INSERT INTO `sys_eximport` VALUES ('字段1', 1, 'mrbird0@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 2, 'mrbird1@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 3, 'mrbird2@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 4, 'mrbird3@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 5, 'mrbird4@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 6, 'mrbird5@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 7, 'mrbird6@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 8, 'mrbird7@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 9, 'mrbird8@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 10, 'mrbird9@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 11, 'mrbird10@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 12, 'mrbird11@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 13, 'mrbird12@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 14, 'mrbird13@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 15, 'mrbird14@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 16, 'mrbird15@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 17, 'mrbird16@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 18, 'mrbird17@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 19, 'mrbird18@gmail.com', '2019-06-13 03:14:06', b'0');
INSERT INTO `sys_eximport` VALUES ('字段1', 20, 'mrbird19@gmail.com', '2019-06-13 03:14:06', b'0');

-- ----------------------------
-- Table structure for sys_generator_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_generator_config`;
CREATE TABLE `sys_generator_config`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `base_package` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '基础包名',
  `entity_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'entity文件存放路径',
  `mapper_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'mapper文件存放路径',
  `mapper_xml_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'mapper xml文件存放路径',
  `service_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'servcie文件存放路径',
  `service_impl_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'serviceImpl文件存放路径',
  `controller_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'controller文件存放路径',
  `is_trim` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否去除前缀 1是 0否',
  `trim_value` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前缀内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_generator_config
-- ----------------------------
INSERT INTO `sys_generator_config` VALUES (1, 'Carey', 'com.cls.common', 'entity', 'mapper', 'mapper', 'service', 'service.impl', 'controller', '1', 'biz_');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `OPERATION` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作内容',
  `TIME` decimal(11, 0) NULL DEFAULT NULL COMMENT '耗时',
  `METHOD` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作方法',
  `PARAMS` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '方法参数',
  `IP` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者IP',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `t_log_create_time`(`CREATE_TIME`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1247 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1011, 'mrbird', '新增用户', 158, 'com.cls.system.controller.UserController.addUser()', ' user: \"User(userId=8, username=admin, password=470263a5622b6153be9e681545233f55, deptId=1, email=, mobile=, status=1, createTime=Tue Oct 13 16:11:02 CST 2020, modifyTime=null, lastLoginTime=null, sex=2, avatar=default.jpg, theme=black, isTab=1, description=, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=1, roleName=null, deptIds=null)\"', '192.168.214.2', '2020-10-13 16:11:03', NULL);
INSERT INTO `sys_log` VALUES (1012, 'mrbird', '删除用户', 85, 'com.cls.system.controller.UserController.deleteUsers()', ' userIds: \"2\"', '192.168.214.2', '2020-10-13 16:11:24', NULL);
INSERT INTO `sys_log` VALUES (1013, 'mrbird', '删除用户', 54, 'com.cls.system.controller.UserController.deleteUsers()', ' userIds: \"3\"', '192.168.214.2', '2020-10-13 16:11:25', NULL);
INSERT INTO `sys_log` VALUES (1014, 'mrbird', '删除用户', 61, 'com.cls.system.controller.UserController.deleteUsers()', ' userIds: \"4\"', '192.168.214.2', '2020-10-13 16:11:27', NULL);
INSERT INTO `sys_log` VALUES (1015, 'mrbird', '删除用户', 47, 'com.cls.system.controller.UserController.deleteUsers()', ' userIds: \"5\"', '192.168.214.2', '2020-10-13 16:11:33', NULL);
INSERT INTO `sys_log` VALUES (1016, 'mrbird', '删除用户', 40, 'com.cls.system.controller.UserController.deleteUsers()', ' userIds: \"6\"', '192.168.214.2', '2020-10-13 16:11:35', NULL);
INSERT INTO `sys_log` VALUES (1017, 'mrbird', '删除用户', 46, 'com.cls.system.controller.UserController.deleteUsers()', ' userIds: \"7\"', '192.168.214.2', '2020-10-13 16:11:37', NULL);
INSERT INTO `sys_log` VALUES (1018, 'admin', '删除用户', 79, 'com.cls.system.controller.UserController.deleteUsers()', ' userIds: \"1\"', '192.168.214.2', '2020-10-13 16:13:33', NULL);
INSERT INTO `sys_log` VALUES (1019, 'admin', '删除角色', 125, 'com.cls.system.controller.RoleController.deleteRoles()', ' roleIds: \"79\"', '192.168.214.2', '2020-10-13 16:13:38', NULL);
INSERT INTO `sys_log` VALUES (1020, 'admin', '删除角色', 58, 'com.cls.system.controller.RoleController.deleteRoles()', ' roleIds: \"80\"', '192.168.214.2', '2020-10-13 16:13:39', NULL);
INSERT INTO `sys_log` VALUES (1021, 'admin', '删除角色', 35, 'com.cls.system.controller.RoleController.deleteRoles()', ' roleIds: \"77\"', '192.168.214.2', '2020-10-13 16:13:53', NULL);
INSERT INTO `sys_log` VALUES (1022, 'admin', '删除角色', 58, 'com.cls.system.controller.RoleController.deleteRoles()', ' roleIds: \"2\"', '192.168.214.2', '2020-10-13 16:13:55', NULL);
INSERT INTO `sys_log` VALUES (1023, 'admin', '删除角色', 44, 'com.cls.system.controller.RoleController.deleteRoles()', ' roleIds: \"78\"', '192.168.214.2', '2020-10-13 16:13:57', NULL);
INSERT INTO `sys_log` VALUES (1024, 'admin', '删除部门', 91, 'com.cls.system.controller.DeptController.deleteDepts()', ' deptIds: \"1\"', '192.168.214.2', '2020-10-13 16:14:11', NULL);
INSERT INTO `sys_log` VALUES (1025, 'admin', '删除部门', 204, 'com.cls.system.controller.DeptController.deleteDepts()', ' deptIds: \"4,5,6,7,8,9\"', '192.168.214.2', '2020-10-13 16:14:24', NULL);
INSERT INTO `sys_log` VALUES (1026, 'admin', '修改用户', 119, 'com.cls.system.controller.UserController.updateUser()', ' user: \"User(userId=8, username=null, password=null, deptId=10, email=, mobile=, status=1, createTime=null, modifyTime=Tue Oct 13 16:14:38 CST 2020, lastLoginTime=null, sex=2, avatar=null, theme=null, isTab=null, description=, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=1, roleName=null, deptIds=)\"', '192.168.214.2', '2020-10-13 16:14:39', NULL);
INSERT INTO `sys_log` VALUES (1027, 'admin', '删除菜单/按钮', 69, 'com.cls.system.controller.MenuController.deleteMenus()', ' menuIds: \"101,102,103,104,105,106,107,108,173,109,110,174\"', '192.168.214.2', '2020-10-13 16:15:24', NULL);
INSERT INTO `sys_log` VALUES (1028, 'admin', '修改菜单/按钮', 146, 'com.cls.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=132, parentId=115, menuName=Website组件, url=, perms=, icon=, type=0, orderNum=1, createTime=null, modifyTime=Tue Oct 13 16:20:56 CST 2020)\"', '192.168.214.2', '2020-10-13 16:20:56', NULL);
INSERT INTO `sys_log` VALUES (1029, 'admin', '新增角色', 3802, 'com.cls.system.controller.RoleController.addRole()', ' role: \"Role(roleId=81, roleName=123, remark=123, menuIds=)\"', '192.168.214.2', '2020-10-14 10:19:46', NULL);
INSERT INTO `sys_log` VALUES (1030, 'admin', '新增角色', 216, 'com.cls.system.controller.RoleController.addRole()', ' role: \"Role(roleId=82, roleName=111, remark=, menuIds=1)\"', '192.168.214.2', '2020-10-14 11:58:22', NULL);
INSERT INTO `sys_log` VALUES (1031, 'admin', '删除角色', 95, 'com.cls.system.controller.RoleController.deleteRoles()', ' roleIds: \"82\"', '192.168.214.2', '2020-10-14 11:58:37', NULL);
INSERT INTO `sys_log` VALUES (1032, 'admin', '删除角色', 26, 'com.cls.system.controller.RoleController.deleteRoles()', ' roleIds: \"82\"', '192.168.214.2', '2020-10-14 11:59:00', NULL);
INSERT INTO `sys_log` VALUES (1033, 'admin', '修改GeneratorConfig', 116, 'com.cls.generator.controller.GeneratorConfigController.updateGeneratorConfig()', ' generatorConfig: GeneratorConfig(id=1, author=Carey, basePackage=com.cls.common, entityPackage=entity, mapperPackage=mapper, mapperXmlPackage=mapper, servicePackage=service, serviceImplPackage=service.impl, controllerPackage=controller, isTrim=1, trimValue=biz_, javaPath=/src/main/java/, resourcesPath=src/main/resources, date=2020-10-14 14:38:19, tableName=null, tableComment=null, className=null, hasDate=false, hasBigDecimal=false, columns=null)', '127.0.0.1', '2020-10-14 14:38:19', NULL);
INSERT INTO `sys_log` VALUES (1034, 'admin', '新增菜单/按钮', 84, 'com.cls.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=179, parentId=0, menuName=基础信息, url=/business/minor, perms=business, icon=layui-icon-team, type=0, orderNum=null)\"', '127.0.0.1', '2020-10-14 15:45:05', NULL);
INSERT INTO `sys_log` VALUES (1035, 'admin', '新增菜单/按钮', 31, 'com.cls.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=未成年人信息, url=, perms=, icon=layui-icon-team, type=0, orderNum=null)\"', '127.0.0.1', '2020-10-14 15:46:20', NULL);
INSERT INTO `sys_log` VALUES (1036, 'admin', '修改菜单/按钮', 38, 'com.cls.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=未成年人信息, url=/business/minor, perms=, icon=layui-icon-team, type=0, orderNum=null)\"', '127.0.0.1', '2020-10-14 15:46:29', NULL);
INSERT INTO `sys_log` VALUES (1037, 'admin', '修改菜单/按钮', 29, 'com.cls.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=179, parentId=0, menuName=基础信息, url=/business/minor, perms=, icon=layui-icon-team, type=0, orderNum=null)\"', '127.0.0.1', '2020-10-14 15:46:35', NULL);
INSERT INTO `sys_log` VALUES (1038, 'admin', '修改菜单/按钮', 21, 'com.cls.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=179, parentId=0, menuName=基础信息, url=, perms=, icon=layui-icon-team, type=0, orderNum=null)\"', '127.0.0.1', '2020-10-14 15:46:41', NULL);
INSERT INTO `sys_log` VALUES (1039, 'admin', '修改菜单/按钮', 38, 'com.cls.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=未成年人信息, url=/business/minor, perms=business, icon=layui-icon-team, type=0, orderNum=null)\"', '127.0.0.1', '2020-10-14 15:46:49', NULL);
INSERT INTO `sys_log` VALUES (1040, 'admin', '修改菜单/按钮', 48, 'com.cls.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=未成年人信息, url=/business/minor, perms=business:view, icon=layui-icon-team, type=0, orderNum=null)\"', '127.0.0.1', '2020-10-14 15:48:20', NULL);
INSERT INTO `sys_log` VALUES (1041, 'admin', '修改角色', 121, 'com.cls.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, menuIds=179,180,1,3,11,12,13,160,161,4,14,15,16,162,5,17,18,19,163,6,20,21,22,164,2,8,23,10,24,170,136,171,172,127,128,129,131,175,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"', '192.168.214.2', '2020-10-14 15:48:48', NULL);
INSERT INTO `sys_log` VALUES (1042, 'admin', '修改菜单/按钮', 49, 'com.cls.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=未成年人信息, url=/business/minor/minor, perms=business:view, icon=layui-icon-team, type=0, orderNum=null)\"', '127.0.0.1', '2020-10-14 15:49:31', NULL);
INSERT INTO `sys_log` VALUES (1043, 'admin', '修改菜单/按钮', 50, 'com.cls.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=未成年人信息, url=/business/minor/minor, perms=, icon=layui-icon-team, type=0, orderNum=null)\"', '127.0.0.1', '2020-10-14 15:50:19', NULL);
INSERT INTO `sys_log` VALUES (1044, 'admin', '修改菜单/按钮', 58, 'com.cls.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=未成年人信息, url=/business/minor, perms=, icon=layui-icon-team, type=0, orderNum=null)\"', '127.0.0.1', '2020-10-14 15:51:22', NULL);
INSERT INTO `sys_log` VALUES (1045, 'admin', '修改菜单/按钮', 106, 'com.cls.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=未成年人信息, url=/business/minor, perms=minor:view, icon=layui-icon-team, type=0, orderNum=null)\"', '127.0.0.1', '2020-10-14 18:15:04', NULL);
INSERT INTO `sys_log` VALUES (1046, 'admin', '修改菜单/按钮', 121, 'com.cls.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=179, parentId=0, menuName=基础信息, url=, perms=statistic:view, icon=layui-icon-piechart, type=0, orderNum=null)\"', '192.168.214.2', '2020-10-15 10:28:36', NULL);
INSERT INTO `sys_log` VALUES (1047, 'admin', '修改菜单/按钮', 90, 'com.cls.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=179, parentId=0, menuName=基础信息, url=, perms=, icon=layui-icon-team, type=0, orderNum=null)\"', '192.168.214.2', '2020-10-15 10:30:19', NULL);
INSERT INTO `sys_log` VALUES (1048, 'admin', '新增菜单/按钮', 37, 'com.cls.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=181, parentId=0, menuName=统计, url=/business/statistic, perms=statistic:view, icon=layui-icon-piechart, type=0, orderNum=null)\"', '192.168.214.2', '2020-10-15 10:31:18', NULL);
INSERT INTO `sys_log` VALUES (1049, 'admin', '修改角色', 216, 'com.cls.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, menuIds=179,180,181,1,3,11,12,13,160,161,4,14,15,16,162,5,17,18,19,163,6,20,21,22,164,2,8,23,10,24,170,136,171,172,127,128,129,131,175,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"', '192.168.214.2', '2020-10-15 10:34:16', NULL);
INSERT INTO `sys_log` VALUES (1050, 'admin', '新增Minor', 3799, 'com.cls.business.controller.MinorController.addMinor()', ' minor: \"Minor(id=1, name=测试, sex=false, idCardNumber=123, birthday=Wed Oct 14 00:00:00 CST 2020, policeStation=所属派出所, phone=15233344443, caseRecord=null, guardianInfo=存储监护人信息)\"', '127.0.0.1', '2020-10-15 10:58:07', NULL);
INSERT INTO `sys_log` VALUES (1051, 'admin', '获取案件和未成年人总数', 5676, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 15:13:19', NULL);
INSERT INTO `sys_log` VALUES (1052, 'admin', '获取案件和未成年人总数', 12383, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 15:26:58', NULL);
INSERT INTO `sys_log` VALUES (1053, 'admin', '获取案件和未成年人总数', 3204, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 15:32:05', NULL);
INSERT INTO `sys_log` VALUES (1054, 'admin', '获取案件和未成年人总数', 21144, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 15:32:57', NULL);
INSERT INTO `sys_log` VALUES (1055, 'admin', '获取案件和未成年人总数', 33, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 15:33:51', NULL);
INSERT INTO `sys_log` VALUES (1056, 'admin', '获取案件和未成年人总数', 8, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 15:38:54', NULL);
INSERT INTO `sys_log` VALUES (1057, 'admin', '获取案件和未成年人总数', 47, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 15:45:15', NULL);
INSERT INTO `sys_log` VALUES (1058, 'admin', '获取案件和未成年人总数', 18, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 15:45:38', NULL);
INSERT INTO `sys_log` VALUES (1059, 'admin', '获取案件和未成年人总数', 16, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 15:46:11', NULL);
INSERT INTO `sys_log` VALUES (1060, 'admin', '获取案件和未成年人总数', 11, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 15:48:37', NULL);
INSERT INTO `sys_log` VALUES (1061, 'admin', '获取案件和未成年人总数', 6, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 15:49:14', NULL);
INSERT INTO `sys_log` VALUES (1062, 'admin', '获取案件和未成年人总数', 13, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 16:20:05', NULL);
INSERT INTO `sys_log` VALUES (1063, 'admin', '获取案件和未成年人总数', 7, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 16:21:28', NULL);
INSERT INTO `sys_log` VALUES (1064, 'admin', '获取案件和未成年人总数', 8, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 16:21:49', NULL);
INSERT INTO `sys_log` VALUES (1065, 'admin', '获取案件和未成年人总数', 9, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 16:23:30', NULL);
INSERT INTO `sys_log` VALUES (1066, 'admin', '获取案件和未成年人总数', 11, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 16:25:38', NULL);
INSERT INTO `sys_log` VALUES (1067, 'admin', '获取案件和未成年人总数', 11, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 16:33:12', NULL);
INSERT INTO `sys_log` VALUES (1068, 'admin', '获取案件和未成年人总数', 53, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 16:39:17', NULL);
INSERT INTO `sys_log` VALUES (1069, 'admin', '获取案件和未成年人总数', 60, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 16:40:24', NULL);
INSERT INTO `sys_log` VALUES (1070, 'admin', '获取未成年人男女数', 52, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 16:40:24', NULL);
INSERT INTO `sys_log` VALUES (1071, 'admin', '获取未成年人男女数', 8, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 16:42:35', NULL);
INSERT INTO `sys_log` VALUES (1072, 'admin', '获取案件和未成年人总数', 16, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 16:42:35', NULL);
INSERT INTO `sys_log` VALUES (1073, 'admin', '获取案件和未成年人总数', 14, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 16:43:50', NULL);
INSERT INTO `sys_log` VALUES (1074, 'admin', '获取未成年人男女数', 5021, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 16:43:55', NULL);
INSERT INTO `sys_log` VALUES (1075, 'admin', '获取案件和未成年人总数', 2344, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 16:55:45', NULL);
INSERT INTO `sys_log` VALUES (1076, 'admin', '获取案件未成年人男女数', 14, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 16:55:45', NULL);
INSERT INTO `sys_log` VALUES (1077, 'admin', '获取未成年人男女数', 2338, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 16:55:45', NULL);
INSERT INTO `sys_log` VALUES (1078, 'admin', '获取案件和未成年人总数', 11, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 16:57:06', NULL);
INSERT INTO `sys_log` VALUES (1079, 'admin', '获取未成年人男女数', 13, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 16:57:06', NULL);
INSERT INTO `sys_log` VALUES (1080, 'admin', '获取案件未成年人男女数', 16, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 16:57:06', NULL);
INSERT INTO `sys_log` VALUES (1081, 'admin', '获取案件和未成年人总数', 13, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 16:58:19', NULL);
INSERT INTO `sys_log` VALUES (1082, 'admin', '获取未成年人男女数', 13, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 16:58:19', NULL);
INSERT INTO `sys_log` VALUES (1083, 'admin', '获取案件未成年人男女数', 8, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 16:58:19', NULL);
INSERT INTO `sys_log` VALUES (1084, 'admin', '获取案件和未成年人总数', 53, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 17:11:16', NULL);
INSERT INTO `sys_log` VALUES (1085, 'admin', '获取未成年人男女数', 49, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 17:11:16', NULL);
INSERT INTO `sys_log` VALUES (1086, 'admin', '获取案件未成年人男女数', 5, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 17:11:16', NULL);
INSERT INTO `sys_log` VALUES (1087, 'admin', '获取案件和未成年人总数', 6, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 17:13:25', NULL);
INSERT INTO `sys_log` VALUES (1088, 'admin', '获取未成年人男女数', 9, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 17:13:25', NULL);
INSERT INTO `sys_log` VALUES (1089, 'admin', '获取案件未成年人男女数', 6, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 17:13:25', NULL);
INSERT INTO `sys_log` VALUES (1090, 'admin', '修改Minor', 84, 'com.cls.business.controller.MinorController.updateMinor()', ' minor: \"Minor(id=2, name=测试, sex=false, idCardNumber=123, birthday=Tue Oct 13 00:00:00 CST 2020, policeStation=所属派出所, phone=15233344443, caseRecord=true, guardianInfo=存储监护人信息)\"', '127.0.0.1', '2020-10-15 17:15:35', NULL);
INSERT INTO `sys_log` VALUES (1091, 'admin', '修改Minor', 45, 'com.cls.business.controller.MinorController.updateMinor()', ' minor: \"Minor(id=3, name=测试, sex=false, idCardNumber=123, birthday=Tue Oct 13 00:00:00 CST 2020, policeStation=所属派出所, phone=15233344443, caseRecord=true, guardianInfo=存储监护人信息)\"', '127.0.0.1', '2020-10-15 17:15:45', NULL);
INSERT INTO `sys_log` VALUES (1092, 'admin', '修改Minor', 48, 'com.cls.business.controller.MinorController.updateMinor()', ' minor: \"Minor(id=4, name=测试, sex=false, idCardNumber=123, birthday=Tue Oct 13 00:00:00 CST 2020, policeStation=所属派出所, phone=15233344443, caseRecord=true, guardianInfo=存储监护人信息)\"', '127.0.0.1', '2020-10-15 17:16:21', NULL);
INSERT INTO `sys_log` VALUES (1093, 'admin', '修改Minor', 22241, 'com.cls.business.controller.MinorController.updateMinor()', ' minor: \"Minor(id=5, name=测试, sex=false, idCardNumber=123, birthday=Tue Oct 13 00:00:00 CST 2020, policeStation=所属派出所, phone=15233344443, caseRecord=true, guardianInfo=存储监护人信息)\"', '127.0.0.1', '2020-10-15 17:17:24', NULL);
INSERT INTO `sys_log` VALUES (1094, 'admin', '修改Minor', 4067, 'com.cls.business.controller.MinorController.updateMinor()', ' minor: \"Minor(id=1, name=测试, sex=false, idCardNumber=123, birthday=Tue Oct 13 00:00:00 CST 2020, policeStation=所属派出所, phone=15233344443, caseRecord=true, guardianInfo=存储监护人信息)\"', '127.0.0.1', '2020-10-15 17:19:53', NULL);
INSERT INTO `sys_log` VALUES (1095, 'admin', '获取未成年人男女数', 50, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 18:01:35', NULL);
INSERT INTO `sys_log` VALUES (1096, 'admin', '获取案件和未成年人总数', 66, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 18:01:35', NULL);
INSERT INTO `sys_log` VALUES (1097, 'admin', '获取案件未成年人男女数', 6, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 18:01:35', NULL);
INSERT INTO `sys_log` VALUES (1098, 'admin', '获取案件和未成年人总数', 8, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 18:02:01', NULL);
INSERT INTO `sys_log` VALUES (1099, 'admin', '获取未成年人男女数', 10, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 18:02:01', NULL);
INSERT INTO `sys_log` VALUES (1100, 'admin', '获取案件未成年人男女数', 8, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 18:02:01', NULL);
INSERT INTO `sys_log` VALUES (1101, 'admin', '获取案件和未成年人总数', 11, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 18:02:03', NULL);
INSERT INTO `sys_log` VALUES (1102, 'admin', '获取未成年人男女数', 13, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 18:02:03', NULL);
INSERT INTO `sys_log` VALUES (1103, 'admin', '获取案件未成年人男女数', 9, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 18:02:03', NULL);
INSERT INTO `sys_log` VALUES (1104, 'admin', '获取案件和未成年人总数', 6, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 18:02:47', NULL);
INSERT INTO `sys_log` VALUES (1105, 'admin', '获取未成年人男女数', 15, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 18:02:47', NULL);
INSERT INTO `sys_log` VALUES (1106, 'admin', '获取案件未成年人男女数', 18, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 18:02:47', NULL);
INSERT INTO `sys_log` VALUES (1107, 'admin', '获取未成年人男女数', 62, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 18:04:03', NULL);
INSERT INTO `sys_log` VALUES (1108, 'admin', '获取案件和未成年人总数', 64, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 18:04:03', NULL);
INSERT INTO `sys_log` VALUES (1109, 'admin', '获取案件未成年人男女数', 16, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 18:04:03', NULL);
INSERT INTO `sys_log` VALUES (1110, 'admin', '获取每月的案件数', 10, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-15 18:04:03', NULL);
INSERT INTO `sys_log` VALUES (1111, 'admin', '获取案件和未成年人总数', 5, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 18:04:19', NULL);
INSERT INTO `sys_log` VALUES (1112, 'admin', '获取未成年人男女数', 6, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 18:04:19', NULL);
INSERT INTO `sys_log` VALUES (1113, 'admin', '获取案件未成年人男女数', 7, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 18:04:19', NULL);
INSERT INTO `sys_log` VALUES (1114, 'admin', '获取每月的案件数', 66435, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-15 18:05:25', NULL);
INSERT INTO `sys_log` VALUES (1115, 'admin', '获取案件和未成年人总数', 5, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 18:05:29', NULL);
INSERT INTO `sys_log` VALUES (1116, 'admin', '获取未成年人男女数', 13, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 18:05:29', NULL);
INSERT INTO `sys_log` VALUES (1117, 'admin', '获取案件未成年人男女数', 11, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 18:05:29', NULL);
INSERT INTO `sys_log` VALUES (1118, 'admin', '获取每月的案件数', 3165, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-15 18:05:32', NULL);
INSERT INTO `sys_log` VALUES (1119, 'admin', '新增Minor', 66, 'com.cls.business.controller.MinorController.addMinor()', ' minor: \"Minor(id=6, name=测试女, sex=true, idCardNumber=123, birthday=Fri Oct 16 00:00:00 CST 2020, policeStation=女, phone=13255551111, caseRecord=false, guardianInfo=女, birthdayTimeFrom=null, birthdayTimeTo=null)\"', '127.0.0.1', '2020-10-15 18:05:30', NULL);
INSERT INTO `sys_log` VALUES (1120, 'admin', '获取案件和未成年人总数', 6, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 18:05:46', NULL);
INSERT INTO `sys_log` VALUES (1121, 'admin', '获取未成年人男女数', 29, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 18:05:46', NULL);
INSERT INTO `sys_log` VALUES (1122, 'admin', '获取案件未成年人男女数', 7, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 18:05:46', NULL);
INSERT INTO `sys_log` VALUES (1123, 'admin', '获取每月的案件数', 2353, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-15 18:05:49', NULL);
INSERT INTO `sys_log` VALUES (1124, 'admin', '获取案件和未成年人总数', 8, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 18:07:35', NULL);
INSERT INTO `sys_log` VALUES (1125, 'admin', '获取未成年人男女数', 10, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 18:07:35', NULL);
INSERT INTO `sys_log` VALUES (1126, 'admin', '获取案件未成年人男女数', 4, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 18:07:35', NULL);
INSERT INTO `sys_log` VALUES (1127, 'admin', '获取每月的案件数', 4, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-15 18:07:35', NULL);
INSERT INTO `sys_log` VALUES (1128, 'admin', '获取案件和未成年人总数', 5, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 18:08:12', NULL);
INSERT INTO `sys_log` VALUES (1129, 'admin', '获取未成年人男女数', 4, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 18:08:12', NULL);
INSERT INTO `sys_log` VALUES (1130, 'admin', '获取案件未成年人男女数', 6, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 18:08:12', NULL);
INSERT INTO `sys_log` VALUES (1131, 'admin', '获取每月的案件数', 4, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-15 18:08:12', NULL);
INSERT INTO `sys_log` VALUES (1132, 'admin', '获取未成年人男女数', 10, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 18:11:03', NULL);
INSERT INTO `sys_log` VALUES (1133, 'admin', '获取案件和未成年人总数', 16, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 18:11:03', NULL);
INSERT INTO `sys_log` VALUES (1134, 'admin', '获取案件未成年人男女数', 6, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 18:11:03', NULL);
INSERT INTO `sys_log` VALUES (1135, 'admin', '获取每月的案件数', 7, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-15 18:11:03', NULL);
INSERT INTO `sys_log` VALUES (1136, 'admin', '获取案件和未成年人总数', 6, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 18:11:07', NULL);
INSERT INTO `sys_log` VALUES (1137, 'admin', '获取未成年人男女数', 10, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 18:11:07', NULL);
INSERT INTO `sys_log` VALUES (1138, 'admin', '获取案件未成年人男女数', 7, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 18:11:07', NULL);
INSERT INTO `sys_log` VALUES (1139, 'admin', '获取每月的案件数', 4, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-15 18:11:07', NULL);
INSERT INTO `sys_log` VALUES (1140, 'admin', '获取案件和未成年人总数', 9, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 18:11:27', NULL);
INSERT INTO `sys_log` VALUES (1141, 'admin', '获取未成年人男女数', 10, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 18:11:27', NULL);
INSERT INTO `sys_log` VALUES (1142, 'admin', '获取案件未成年人男女数', 33, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 18:11:27', NULL);
INSERT INTO `sys_log` VALUES (1143, 'admin', '获取每月的案件数', 14, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-15 18:11:27', NULL);
INSERT INTO `sys_log` VALUES (1144, 'admin', '获取案件和未成年人总数', 46, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 18:12:05', NULL);
INSERT INTO `sys_log` VALUES (1145, 'admin', '获取未成年人男女数', 30, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 18:12:05', NULL);
INSERT INTO `sys_log` VALUES (1146, 'admin', '获取案件未成年人男女数', 8, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 18:12:05', NULL);
INSERT INTO `sys_log` VALUES (1147, 'admin', '获取每月的案件数', 8, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-15 18:12:05', NULL);
INSERT INTO `sys_log` VALUES (1148, 'admin', '获取案件和未成年人总数', 11, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 18:12:25', NULL);
INSERT INTO `sys_log` VALUES (1149, 'admin', '获取未成年人男女数', 6, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 18:12:25', NULL);
INSERT INTO `sys_log` VALUES (1150, 'admin', '获取案件未成年人男女数', 7, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 18:12:25', NULL);
INSERT INTO `sys_log` VALUES (1151, 'admin', '获取每月的案件数', 7, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-15 18:12:25', NULL);
INSERT INTO `sys_log` VALUES (1152, 'admin', '获取案件和未成年人总数', 7, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-15 18:13:02', NULL);
INSERT INTO `sys_log` VALUES (1153, 'admin', '获取未成年人男女数', 8, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-15 18:13:02', NULL);
INSERT INTO `sys_log` VALUES (1154, 'admin', '获取案件未成年人男女数', 6, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-15 18:13:02', NULL);
INSERT INTO `sys_log` VALUES (1155, 'admin', '获取每月的案件数', 6, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-15 18:13:02', NULL);
INSERT INTO `sys_log` VALUES (1156, 'admin', '获取案件和未成年人总数', 15, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '127.0.0.1', '2020-10-15 18:39:47', NULL);
INSERT INTO `sys_log` VALUES (1157, 'admin', '获取未成年人男女数', 11, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '127.0.0.1', '2020-10-15 18:39:47', NULL);
INSERT INTO `sys_log` VALUES (1158, 'admin', '获取案件和未成年人总数', 176, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-16 09:40:09', NULL);
INSERT INTO `sys_log` VALUES (1159, 'admin', '获取每月的案件数', 51, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-16 09:40:09', NULL);
INSERT INTO `sys_log` VALUES (1160, 'admin', '获取案件未成年人男女数', 52, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-16 09:40:09', NULL);
INSERT INTO `sys_log` VALUES (1161, 'admin', '获取未成年人男女数', 155, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-16 09:40:09', NULL);
INSERT INTO `sys_log` VALUES (1162, 'admin', '获取5年的案件数', 51, 'com.cls.business.controller.StatisticController.getCaseYearData()', '', '192.168.214.2', '2020-10-16 09:40:09', NULL);
INSERT INTO `sys_log` VALUES (1163, 'admin', '获取案件和未成年人总数', 7, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-16 09:40:25', NULL);
INSERT INTO `sys_log` VALUES (1164, 'admin', '获取未成年人男女数', 4, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-16 09:40:25', NULL);
INSERT INTO `sys_log` VALUES (1165, 'admin', '获取案件未成年人男女数', 5, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-16 09:40:25', NULL);
INSERT INTO `sys_log` VALUES (1166, 'admin', '获取每月的案件数', 7, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-16 09:40:25', NULL);
INSERT INTO `sys_log` VALUES (1167, 'admin', '获取5年的案件数', 4, 'com.cls.business.controller.StatisticController.getCaseYearData()', '', '192.168.214.2', '2020-10-16 09:40:25', NULL);
INSERT INTO `sys_log` VALUES (1168, 'admin', '获取未成年人男女数', 8, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-16 09:40:43', NULL);
INSERT INTO `sys_log` VALUES (1169, 'admin', '获取案件和未成年人总数', 9, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-16 09:40:43', NULL);
INSERT INTO `sys_log` VALUES (1170, 'admin', '获取案件未成年人男女数', 6, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-16 09:40:43', NULL);
INSERT INTO `sys_log` VALUES (1171, 'admin', '获取每月的案件数', 5, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-16 09:40:43', NULL);
INSERT INTO `sys_log` VALUES (1172, 'admin', '获取5年的案件数', 6, 'com.cls.business.controller.StatisticController.getCaseYearData()', '', '192.168.214.2', '2020-10-16 09:40:43', NULL);
INSERT INTO `sys_log` VALUES (1173, 'admin', '获取案件和未成年人总数', 8, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-16 09:45:01', NULL);
INSERT INTO `sys_log` VALUES (1174, 'admin', '获取未成年人男女数', 8, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-16 09:45:01', NULL);
INSERT INTO `sys_log` VALUES (1175, 'admin', '获取案件未成年人男女数', 13, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-16 09:45:01', NULL);
INSERT INTO `sys_log` VALUES (1176, 'admin', '获取每月的案件数', 15, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-16 09:45:01', NULL);
INSERT INTO `sys_log` VALUES (1177, 'admin', '获取5年的案件数', 14, 'com.cls.business.controller.StatisticController.getCaseYearData()', '', '192.168.214.2', '2020-10-16 09:45:02', NULL);
INSERT INTO `sys_log` VALUES (1178, 'admin', '获取案件和未成年人总数', 10, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-16 09:47:34', NULL);
INSERT INTO `sys_log` VALUES (1179, 'admin', '获取未成年人男女数', 8, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-16 09:47:35', NULL);
INSERT INTO `sys_log` VALUES (1180, 'admin', '获取案件未成年人男女数', 9, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-16 09:47:35', NULL);
INSERT INTO `sys_log` VALUES (1181, 'admin', '获取每月的案件数', 8, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-16 09:47:35', NULL);
INSERT INTO `sys_log` VALUES (1182, 'admin', '获取5年的案件数', 7, 'com.cls.business.controller.StatisticController.getCaseYearData()', '', '192.168.214.2', '2020-10-16 09:47:35', NULL);
INSERT INTO `sys_log` VALUES (1183, 'admin', '获取案件和未成年人总数', 5, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-16 09:49:36', NULL);
INSERT INTO `sys_log` VALUES (1184, 'admin', '获取未成年人男女数', 5, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-16 09:49:36', NULL);
INSERT INTO `sys_log` VALUES (1185, 'admin', '获取案件未成年人男女数', 5, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-16 09:49:36', NULL);
INSERT INTO `sys_log` VALUES (1186, 'admin', '获取每月的案件数', 4, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-16 09:49:36', NULL);
INSERT INTO `sys_log` VALUES (1187, 'admin', '获取5年的案件数', 7, 'com.cls.business.controller.StatisticController.getCaseYearData()', '', '192.168.214.2', '2020-10-16 09:49:36', NULL);
INSERT INTO `sys_log` VALUES (1188, 'admin', '获取案件和未成年人总数', 8, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-16 10:11:39', NULL);
INSERT INTO `sys_log` VALUES (1189, 'admin', '获取未成年人男女数', 17, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-16 10:11:39', NULL);
INSERT INTO `sys_log` VALUES (1190, 'admin', '获取案件未成年人男女数', 8, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-16 10:11:39', NULL);
INSERT INTO `sys_log` VALUES (1191, 'admin', '获取每月的案件数', 5, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-16 10:11:39', NULL);
INSERT INTO `sys_log` VALUES (1192, 'admin', '获取5年的案件数', 5, 'com.cls.business.controller.StatisticController.getCaseYearData()', '', '192.168.214.2', '2020-10-16 10:11:39', NULL);
INSERT INTO `sys_log` VALUES (1193, 'admin', '获取案件和未成年人总数', 38, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.56.1', '2020-10-16 10:36:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES (1194, 'admin', '获取未成年人男女数', 17, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.56.1', '2020-10-16 10:36:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES (1195, 'admin', '获取案件和未成年人总数', 6, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.56.1', '2020-10-16 10:40:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES (1196, 'admin', '获取未成年人男女数', 4, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.56.1', '2020-10-16 10:40:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES (1197, 'admin', '获取未成年人男女数', 62, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-16 10:41:55', NULL);
INSERT INTO `sys_log` VALUES (1198, 'admin', '获取案件和未成年人总数', 63, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-16 10:41:55', NULL);
INSERT INTO `sys_log` VALUES (1199, 'admin', '获取案件未成年人男女数', 7, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-16 10:41:55', NULL);
INSERT INTO `sys_log` VALUES (1200, 'admin', '获取每月的案件数', 12, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-16 10:41:55', NULL);
INSERT INTO `sys_log` VALUES (1201, 'admin', '获取5年的案件数', 6, 'com.cls.business.controller.StatisticController.getCaseYearData()', '', '192.168.214.2', '2020-10-16 10:41:55', NULL);
INSERT INTO `sys_log` VALUES (1202, 'admin', '获取案件未成年人男女数', 9, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-16 10:46:44', NULL);
INSERT INTO `sys_log` VALUES (1203, 'admin', '获取未成年人男女数', 133, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-16 10:46:44', NULL);
INSERT INTO `sys_log` VALUES (1204, 'admin', '获取5年的案件数', 28, 'com.cls.business.controller.StatisticController.getCaseYearData()', '', '192.168.214.2', '2020-10-16 10:46:44', NULL);
INSERT INTO `sys_log` VALUES (1205, 'admin', '获取每月的案件数', 16, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-16 10:46:44', NULL);
INSERT INTO `sys_log` VALUES (1206, 'admin', '获取案件和未成年人总数', 136, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-16 10:46:44', NULL);
INSERT INTO `sys_log` VALUES (1207, 'admin', '获取案件和未成年人总数', 64, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-16 10:48:48', NULL);
INSERT INTO `sys_log` VALUES (1208, 'admin', '获取未成年人男女数', 48, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-16 10:48:48', NULL);
INSERT INTO `sys_log` VALUES (1209, 'admin', '获取每月的案件数', 10, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-16 10:48:48', NULL);
INSERT INTO `sys_log` VALUES (1210, 'admin', '获取案件未成年人男女数', 26, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-16 10:48:48', NULL);
INSERT INTO `sys_log` VALUES (1211, 'admin', '获取5年的案件数', 9, 'com.cls.business.controller.StatisticController.getCaseYearData()', '', '192.168.214.2', '2020-10-16 10:48:48', NULL);
INSERT INTO `sys_log` VALUES (1212, 'admin', '获取未成年人男女数', 96, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-16 10:50:14', NULL);
INSERT INTO `sys_log` VALUES (1213, 'admin', '获取案件和未成年人总数', 114, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-16 10:50:14', NULL);
INSERT INTO `sys_log` VALUES (1214, 'admin', '获取案件未成年人男女数', 14, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-16 10:50:14', NULL);
INSERT INTO `sys_log` VALUES (1215, 'admin', '获取每月的案件数', 12, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-16 10:50:14', NULL);
INSERT INTO `sys_log` VALUES (1216, 'admin', '获取5年的案件数', 8, 'com.cls.business.controller.StatisticController.getCaseYearData()', '', '192.168.214.2', '2020-10-16 10:50:14', NULL);
INSERT INTO `sys_log` VALUES (1217, 'admin', '获取案件和未成年人总数', 6, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.56.1', '2020-10-16 11:04:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES (1218, 'admin', '获取未成年人男女数', 5, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.56.1', '2020-10-16 11:04:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES (1219, 'admin', '获取未成年人男女数', 170, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-16 11:07:49', NULL);
INSERT INTO `sys_log` VALUES (1220, 'admin', '获取5年的案件数', 28, 'com.cls.business.controller.StatisticController.getCaseYearData()', '', '192.168.214.2', '2020-10-16 11:07:49', NULL);
INSERT INTO `sys_log` VALUES (1221, 'admin', '获取案件未成年人男女数', 31, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-16 11:07:49', NULL);
INSERT INTO `sys_log` VALUES (1222, 'admin', '获取每月的案件数', 50, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-16 11:07:49', NULL);
INSERT INTO `sys_log` VALUES (1223, 'admin', '获取案件和未成年人总数', 170, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-16 11:07:49', NULL);
INSERT INTO `sys_log` VALUES (1224, 'admin', '获取案件和未成年人总数', 188, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '192.168.214.2', '2020-10-16 12:40:50', NULL);
INSERT INTO `sys_log` VALUES (1225, 'admin', '获取未成年人男女数', 173, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '192.168.214.2', '2020-10-16 12:40:50', NULL);
INSERT INTO `sys_log` VALUES (1226, 'admin', '获取5年的案件数', 38, 'com.cls.business.controller.StatisticController.getCaseYearData()', '', '192.168.214.2', '2020-10-16 12:40:50', NULL);
INSERT INTO `sys_log` VALUES (1227, 'admin', '获取案件未成年人男女数', 10, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '192.168.214.2', '2020-10-16 12:40:50', NULL);
INSERT INTO `sys_log` VALUES (1228, 'admin', '获取每月的案件数', 5, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '192.168.214.2', '2020-10-16 12:40:50', NULL);
INSERT INTO `sys_log` VALUES (1229, 'admin', '获取未成年人男女数', 12, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '127.0.0.1', '2020-10-16 17:21:24', NULL);
INSERT INTO `sys_log` VALUES (1230, 'admin', '获取案件和未成年人总数', 19, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '127.0.0.1', '2020-10-16 17:21:24', NULL);
INSERT INTO `sys_log` VALUES (1231, 'admin', '新增用户', 81, 'com.cls.system.controller.UserController.addUser()', ' user: \"User(userId=9, username=cessss, password=be2640407e580da7de84425cf8039310, deptId=null, email=, mobile=, status=1, lastLoginTime=null, sex=2, avatar=default.jpg, theme=black, isTab=1, description=, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=81, roleName=null, deptIds=null)\"', '127.0.0.1', '2020-10-16 17:22:36', NULL);
INSERT INTO `sys_log` VALUES (1232, 'admin', '删除用户', 65, 'com.cls.system.controller.UserController.deleteUsers()', ' userIds: \"9\"', '127.0.0.1', '2020-10-16 17:22:46', NULL);
INSERT INTO `sys_log` VALUES (1233, 'admin', '删除用户', 16, 'com.cls.system.controller.UserController.deleteUsers()', ' userIds: \"9\"', '127.0.0.1', '2020-10-16 17:23:07', NULL);
INSERT INTO `sys_log` VALUES (1234, 'admin', '删除Minor', 63, 'com.cls.business.controller.MinorController.deleteMinor()', ' ids: \"1\"', '127.0.0.1', '2020-10-16 17:56:07', NULL);
INSERT INTO `sys_log` VALUES (1235, 'admin', '新增菜单/按钮', 70, 'com.cls.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=182, parentId=179, menuName=案件信息管理, url=, perms=case:view, icon=, type=0, orderNum=2)\"', '127.0.0.1', '2020-10-16 17:57:41', NULL);
INSERT INTO `sys_log` VALUES (1236, 'admin', '修改菜单/按钮', 41, 'com.cls.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=182, parentId=179, menuName=案件信息管理, url=/business/case, perms=case:view, icon=, type=0, orderNum=2)\"', '127.0.0.1', '2020-10-16 17:58:02', NULL);
INSERT INTO `sys_log` VALUES (1237, 'admin', '修改角色', 181, 'com.cls.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, menuIds=179,180,181,182,1,3,11,12,13,160,161,4,14,15,16,162,5,17,18,19,163,6,20,21,22,164,2,8,23,10,24,170,136,171,172,127,128,129,131,175,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"', '127.0.0.1', '2020-10-16 17:58:15', NULL);
INSERT INTO `sys_log` VALUES (1238, 'admin', '新增Case', 82, 'com.cls.business.controller.CaseController.addCase()', ' caseParam: \"Case(id=6, caseName=测试, caseTime=Thu Oct 01 03:02:00 CST 2020, caseAddress=北京, caseReason=北京, caseNote=北京, caseHandler=北京, caseState=0, caseTimeFrom=null, caseTimeTo=null)\"', '127.0.0.1', '2020-10-16 18:05:25', NULL);
INSERT INTO `sys_log` VALUES (1239, 'admin', '新增Case', 52, 'com.cls.business.controller.CaseController.addCase()', ' caseParam: \"Case(id=7, caseName=西安, caseTime=Fri Oct 16 18:08:04 CST 2020, caseAddress=西安, caseReason=西安, caseNote=西安, caseHandler=西安, caseState=0, caseTimeFrom=null, caseTimeTo=null)\"', '127.0.0.1', '2020-10-16 18:08:15', NULL);
INSERT INTO `sys_log` VALUES (1240, 'admin', '新增Minor', 71, 'com.cls.business.controller.MinorController.addMinor()', ' minor: \"Minor(id=7, name=佘礼详, sex=true, idCardNumber=123, birthday=Fri Oct 30 00:00:00 CST 2020, policeStation=Carey, phone=18566664443, caseRecord=true, guardianInfo=Carey, birthdayTimeFrom=null, birthdayTimeTo=null)\"', '127.0.0.1', '2020-10-16 18:10:56', NULL);
INSERT INTO `sys_log` VALUES (1241, 'admin', '修改Case', 97, 'com.cls.business.controller.CaseController.updateCase()', ' caseParam: \"Case(id=7, caseName=西安, caseTime=Fri Oct 16 10:08:04 CST 2020, caseAddress=西安, caseReason=西安, caseNote=西安, caseHandler=西安, caseState=1, caseTimeFrom=null, caseTimeTo=null)\"', '127.0.0.1', '2020-10-16 18:17:43', NULL);
INSERT INTO `sys_log` VALUES (1242, 'admin', '获取案件和未成年人总数', 15, 'com.cls.business.controller.StatisticController.selectCaseCountAndMinorCount()', '', '127.0.0.1', '2020-10-21 09:23:57', NULL);
INSERT INTO `sys_log` VALUES (1243, 'admin', '获取未成年人男女数', 14, 'com.cls.business.controller.StatisticController.getSexRatioData()', '', '127.0.0.1', '2020-10-21 09:23:57', NULL);
INSERT INTO `sys_log` VALUES (1244, 'admin', '获取案件未成年人男女数', 4, 'com.cls.business.controller.StatisticController.getSexCaseRatioData()', '', '127.0.0.1', '2020-10-21 09:23:57', NULL);
INSERT INTO `sys_log` VALUES (1245, 'admin', '获取每月的案件数', 3, 'com.cls.business.controller.StatisticController.getCaseMonthlyData()', '', '127.0.0.1', '2020-10-21 09:23:57', NULL);
INSERT INTO `sys_log` VALUES (1246, 'admin', '获取5年的案件数', 5, 'com.cls.business.controller.StatisticController.getCaseYearData()', '', '127.0.0.1', '2020-10-21 09:23:57', NULL);

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `ID` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `LOGIN_TIME` datetime(0) NOT NULL COMMENT '登录时间',
  `LOCATION` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录地点',
  `IP` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `SYSTEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `BROWSER` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `t_login_log_login_time`(`LOGIN_TIME`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 144 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (70, 'mrbird', '2020-10-13 16:05:08', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (71, 'mrbird', '2020-10-13 16:07:43', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (72, 'mrbird', '2020-10-13 16:11:55', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (73, 'admin', '2020-10-13 16:12:29', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (74, 'admin', '2020-10-13 16:17:06', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (75, 'admin', '2020-10-13 16:20:31', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (76, 'admin', '2020-10-13 16:26:51', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (77, 'admin', '2020-10-13 18:18:19', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (78, 'admin', '2020-10-13 18:18:35', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (79, 'admin', '2020-10-13 18:21:02', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (80, 'admin', '2020-10-13 18:24:14', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (81, 'admin', '2020-10-13 18:26:04', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (82, 'admin', '2020-10-13 18:33:33', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (83, 'admin', '2020-10-13 18:36:01', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (84, 'admin', '2020-10-13 18:49:53', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (85, 'admin', '2020-10-14 09:45:57', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (86, 'admin', '2020-10-14 10:00:01', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (87, 'admin', '2020-10-14 10:09:17', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (88, 'admin', '2020-10-14 10:14:57', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (89, 'admin', '2020-10-14 10:16:42', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (90, 'admin', '2020-10-14 10:19:25', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (91, 'admin', '2020-10-14 11:07:42', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (92, 'admin', '2020-10-14 11:26:58', NULL, '127.0.0.1', 'Mac OS X 10_15_3', 'Chrome 86');
INSERT INTO `sys_login_log` VALUES (93, 'admin', '2020-10-14 11:42:10', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (94, 'admin', '2020-10-14 11:45:33', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (95, 'admin', '2020-10-14 11:47:58', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (96, 'admin', '2020-10-14 11:51:36', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (97, 'admin', '2020-10-14 11:53:31', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (98, 'admin', '2020-10-14 11:56:33', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (99, 'admin', '2020-10-14 11:58:07', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (100, 'admin', '2020-10-14 14:37:05', NULL, '127.0.0.1', 'Mac OS X 10_15_3', 'Chrome 86');
INSERT INTO `sys_login_log` VALUES (101, 'admin', '2020-10-14 15:26:44', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (102, 'admin', '2020-10-14 18:16:07', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (103, 'admin', '2020-10-14 18:18:32', NULL, '127.0.0.1', 'Mac OS X 10_15_3', 'Chrome 86');
INSERT INTO `sys_login_log` VALUES (104, 'admin', '2020-10-14 18:19:29', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (105, 'admin', '2020-10-14 18:19:37', NULL, '127.0.0.1', 'Mac OS X 10_15_3', 'Safari Version 13.0.5 ');
INSERT INTO `sys_login_log` VALUES (106, 'admin', '2020-10-15 10:06:54', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (107, 'admin', '2020-10-15 10:37:10', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (108, 'admin', '2020-10-15 14:33:50', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (109, 'admin', '2020-10-15 14:36:28', NULL, '127.0.0.1', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (110, 'admin', '2020-10-15 14:39:08', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (111, 'admin', '2020-10-15 14:44:55', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (112, 'admin', '2020-10-15 14:54:59', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (113, 'admin', '2020-10-15 15:03:33', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (114, 'admin', '2020-10-15 15:12:02', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (115, 'admin', '2020-10-15 15:26:42', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (116, 'admin', '2020-10-15 15:29:17', NULL, '127.0.0.1', 'Mac OS X 10_15_3', 'Chrome 86');
INSERT INTO `sys_login_log` VALUES (117, 'admin', '2020-10-15 15:31:56', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (118, 'admin', '2020-10-15 15:45:17', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (119, 'admin', '2020-10-15 16:40:21', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (120, 'admin', '2020-10-15 16:55:40', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (121, 'admin', '2020-10-15 17:11:14', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (122, 'admin', '2020-10-15 18:01:31', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (123, 'admin', '2020-10-15 18:04:00', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (124, 'admin', '2020-10-15 18:12:02', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (125, 'admin', '2020-10-15 18:39:01', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (126, 'admin', '2020-10-15 18:40:25', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (127, 'admin', '2020-10-16 09:31:46', NULL, '127.0.0.1', 'Mac OS X 10_15_3', 'Chrome 86');
INSERT INTO `sys_login_log` VALUES (128, 'admin', '2020-10-16 09:40:06', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (129, 'admin', '2020-10-16 10:18:08', NULL, '127.0.0.1', 'Mac OS X 10_15_3', 'Chrome 86');
INSERT INTO `sys_login_log` VALUES (130, 'admin', '2020-10-16 10:35:43', '内网IP|0|0|内网IP|内网IP', '192.168.56.1', 'Windows ', 'Chrome 77');
INSERT INTO `sys_login_log` VALUES (131, 'admin', '2020-10-16 10:41:47', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (132, 'admin', '2020-10-16 10:42:58', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (133, 'admin', '2020-10-16 10:46:35', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (134, 'admin', '2020-10-16 10:48:44', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (135, 'admin', '2020-10-16 10:50:10', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (136, 'admin', '2020-10-16 11:07:23', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (137, 'admin', '2020-10-16 11:07:25', NULL, '127.0.0.1', 'Mac OS X 10_15_3', 'Chrome 86');
INSERT INTO `sys_login_log` VALUES (138, 'admin', '2020-10-16 12:35:54', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (139, 'admin', '2020-10-16 12:39:18', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (140, 'admin', '2020-10-16 12:41:46', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (141, 'admin', '2020-10-16 12:42:17', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (142, 'admin', '2020-10-16 12:52:17', NULL, '192.168.214.2', 'Windows ', 'Chrome 84');
INSERT INTO `sys_login_log` VALUES (143, 'admin', '2020-10-21 09:23:49', NULL, '127.0.0.1', 'Mac OS X 10_15_3', 'Chrome 86');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `MENU_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮ID',
  `PARENT_ID` bigint(20) NOT NULL COMMENT '上级菜单ID',
  `MENU_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单/按钮名称',
  `URL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `PERMS` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '权限标识',
  `ICON` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `TYPE` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型 0菜单 1按钮',
  `ORDER_NUM` bigint(20) NULL DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime(0) NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `IS_DELETE` bit(1) NULL DEFAULT b'0' COMMENT '是否删除',
  `CREATE_BY` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `MODIFY_BY` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`MENU_ID`) USING BTREE,
  INDEX `t_menu_parent_id`(`PARENT_ID`) USING BTREE,
  INDEX `t_menu_menu_id`(`MENU_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 183 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 'layui-icon-setting', '0', 1, '2017-12-27 16:39:07', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2, 0, '系统监控', '', '', 'layui-icon-alert', '0', 2, '2017-12-27 16:45:51', '2019-06-13 11:20:40', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (3, 1, '用户管理', '/system/user', 'user:view', '', '0', 1, '2017-12-27 16:47:13', '2019-12-04 16:46:50', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (4, 1, '角色管理', '/system/role', 'role:view', '', '0', 2, '2017-12-27 16:48:09', '2019-06-13 08:57:19', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (5, 1, '菜单管理', '/system/menu', 'menu:view', '', '0', 3, '2017-12-27 16:48:57', '2019-06-13 08:57:34', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (6, 1, '部门管理', '/system/dept', 'dept:view', '', '0', 4, '2017-12-27 16:57:33', '2019-06-14 19:56:00', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (8, 2, '在线用户', '/monitor/online', 'online:view', '', '0', 1, '2017-12-27 16:59:33', '2019-06-13 14:30:31', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (10, 2, '系统日志', '/monitor/log', 'log:view', '', '0', 2, '2017-12-27 17:00:50', '2019-06-13 14:30:37', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (11, 3, '新增用户', NULL, 'user:add', NULL, '1', NULL, '2017-12-27 17:02:58', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (12, 3, '修改用户', NULL, 'user:update', NULL, '1', NULL, '2017-12-27 17:04:07', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (13, 3, '删除用户', NULL, 'user:delete', NULL, '1', NULL, '2017-12-27 17:04:58', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (14, 4, '新增角色', NULL, 'role:add', NULL, '1', NULL, '2017-12-27 17:06:38', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (15, 4, '修改角色', NULL, 'role:update', NULL, '1', NULL, '2017-12-27 17:06:38', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (16, 4, '删除角色', NULL, 'role:delete', NULL, '1', NULL, '2017-12-27 17:06:38', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (17, 5, '新增菜单', NULL, 'menu:add', NULL, '1', NULL, '2017-12-27 17:08:02', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (18, 5, '修改菜单', NULL, 'menu:update', NULL, '1', NULL, '2017-12-27 17:08:02', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (19, 5, '删除菜单', NULL, 'menu:delete', NULL, '1', NULL, '2017-12-27 17:08:02', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (20, 6, '新增部门', NULL, 'dept:add', NULL, '1', NULL, '2017-12-27 17:09:24', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (21, 6, '修改部门', NULL, 'dept:update', NULL, '1', NULL, '2017-12-27 17:09:24', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (22, 6, '删除部门', NULL, 'dept:delete', NULL, '1', NULL, '2017-12-27 17:09:24', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (23, 8, '踢出用户', NULL, 'user:kickout', NULL, '1', NULL, '2017-12-27 17:11:13', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (24, 10, '删除日志', NULL, 'log:delete', NULL, '1', NULL, '2017-12-27 17:11:45', '2019-06-06 05:56:40', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (115, 0, '其他模块', NULL, NULL, 'layui-icon-gift', '0', 5, '2019-05-27 10:18:07', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (116, 115, 'Apex图表', '', '', NULL, '0', 2, '2019-05-27 10:21:35', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (117, 116, '线性图表', '/others/apex/line', 'apex:line:view', NULL, '0', 1, '2019-05-27 10:24:49', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (118, 115, '高德地图', '/others/map', 'map:view', '', '0', 3, '2019-05-27 17:13:12', '2019-06-12 15:33:00', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (119, 116, '面积图表', '/others/apex/area', 'apex:area:view', NULL, '0', 2, '2019-05-27 18:49:22', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (120, 116, '柱形图表', '/others/apex/column', 'apex:column:view', NULL, '0', 3, '2019-05-27 18:51:33', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (121, 116, '雷达图表', '/others/apex/radar', 'apex:radar:view', NULL, '0', 4, '2019-05-27 18:56:05', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (122, 116, '条形图表', '/others/apex/bar', 'apex:bar:view', NULL, '0', 5, '2019-05-27 18:57:02', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (123, 116, '混合图表', '/others/apex/mix', 'apex:mix:view', '', '0', 6, '2019-05-27 18:58:04', '2019-06-06 02:55:23', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (125, 115, '导入导出', '/others/eximport', 'others:eximport:view', '', '0', 4, '2019-05-27 19:01:57', '2019-06-13 01:20:14', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (126, 132, '系统图标', '/others/website/icon', 'website:icons:view', '', '0', 4, '2019-05-27 19:03:18', '2019-06-06 03:05:26', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (127, 2, '请求追踪', '/monitor/httptrace', 'httptrace:view', '', '0', 6, '2019-05-27 19:06:38', '2019-06-13 14:36:43', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (128, 2, '系统信息', NULL, NULL, NULL, '0', 7, '2019-05-27 19:08:23', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (129, 128, 'JVM信息', '/monitor/jvm', 'jvm:view', '', '0', 1, '2019-05-27 19:08:50', '2019-06-13 14:36:51', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (131, 128, '服务器信息', '/monitor/server', 'server:view', '', '0', 3, '2019-05-27 19:10:07', '2019-06-13 14:37:04', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (132, 115, 'Website组件', '', '', '', '0', 1, '2019-05-27 19:13:54', '2020-10-13 16:20:56', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (133, 132, '表单组件', '/others/website/form', 'website:form:view', NULL, '0', 1, '2019-05-27 19:14:45', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (134, 132, 'FEBS工具', '/others/website/tools', 'website:tools:view', '', '0', 3, '2019-05-29 10:11:22', '2019-06-12 13:21:27', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (135, 132, '表单组合', '/others/website/form/group', 'website:formgroup:view', NULL, '0', 2, '2019-05-29 10:16:19', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (136, 2, '登录日志', '/monitor/loginlog', 'loginlog:view', '', '0', 3, '2019-05-29 15:56:15', '2019-06-13 14:35:56', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (137, 0, '代码生成', '', NULL, 'layui-icon-verticalright', '0', 4, '2019-06-03 15:35:58', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (138, 137, '生成配置', '/generator/configure', 'generator:configure:view', NULL, '0', 1, '2019-06-03 15:38:36', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (139, 137, '代码生成', '/generator/generator', 'generator:view', '', '0', 2, '2019-06-03 15:39:15', '2019-06-13 14:31:38', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (159, 132, '其他组件', '/others/website/others', 'others:website:others', '', '0', 5, '2019-06-12 07:51:08', '2019-06-12 07:51:40', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (160, 3, '密码重置', NULL, 'user:password:reset', NULL, '1', NULL, '2019-06-13 08:40:13', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (161, 3, '导出Excel', NULL, 'user:export', NULL, '1', NULL, '2019-06-13 08:40:34', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (162, 4, '导出Excel', NULL, 'role:export', NULL, '1', NULL, '2019-06-13 14:29:00', '2019-06-13 14:29:11', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (163, 5, '导出Excel', NULL, 'menu:export', NULL, '1', NULL, '2019-06-13 14:29:32', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (164, 6, '导出Excel', NULL, 'dept:export', NULL, '1', NULL, '2019-06-13 14:29:59', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (165, 138, '修改配置', NULL, 'generator:configure:update', NULL, '1', NULL, '2019-06-13 14:32:09', '2019-06-13 14:32:20', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (166, 139, '生成代码', NULL, 'generator:generate', NULL, '1', NULL, '2019-06-13 14:32:51', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (167, 125, '模板下载', NULL, 'eximport:template', NULL, '1', NULL, '2019-06-13 14:33:37', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (168, 125, '导出Excel', NULL, 'eximport:export', NULL, '1', NULL, '2019-06-13 14:33:57', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (169, 125, '导入Excel', NULL, 'eximport:import', NULL, '1', NULL, '2019-06-13 14:34:19', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (170, 10, '导出Excel', NULL, 'log:export', NULL, '1', NULL, '2019-06-13 14:34:55', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (171, 136, '删除日志', NULL, 'loginlog:delete', NULL, '1', NULL, '2019-06-13 14:35:27', '2019-06-13 14:36:08', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (172, 136, '导出Excel', NULL, 'loginlog:export', NULL, '1', NULL, '2019-06-13 14:36:26', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (175, 2, 'Swagger文档', '/monitor/swagger', 'swagger:view', '', '0', 8, '2019-08-18 17:25:36', '2019-08-18 17:25:59', b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (178, 115, '数据权限', '/others/datapermission', 'others:datapermission', '', '0', 5, '2020-04-29 09:34:25', NULL, b'0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (179, 0, '基础信息', '', '', 'layui-icon-team', '0', NULL, '2020-10-14 15:45:05', '2020-10-15 10:30:19', b'0', 8, 8);
INSERT INTO `sys_menu` VALUES (180, 179, '未成年人信息', '/business/minor', 'minor:view', 'layui-icon-team', '0', NULL, '2020-10-14 15:46:20', '2020-10-14 18:15:04', b'0', 8, 8);
INSERT INTO `sys_menu` VALUES (181, 179, '统计', '/business/statistic', 'statistic:view', 'layui-icon-piechart', '0', NULL, '2020-10-15 10:31:18', '2020-10-15 10:31:18', b'0', 8, 8);
INSERT INTO `sys_menu` VALUES (182, 179, '案件信息管理', '/business/case', 'case:view', '', '0', 2, '2020-10-16 17:57:41', '2020-10-16 17:58:02', b'0', 8, 8);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `ROLE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `REMARK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `CREATE_TIME` datetime(0) NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `IS_DELETE` bit(1) NULL DEFAULT NULL COMMENT '是否删除',
  `CREATE_BY` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `MODIFY_BY` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '系统管理员', '系统管理员，拥有所有操作权限 ^_^', '2019-06-14 16:23:11', '2020-10-16 17:58:15', b'0', NULL, 8);
INSERT INTO `sys_role` VALUES (81, '123', '123', '2020-10-14 10:19:46', '2020-10-14 10:19:46', b'0', 8, 8);
INSERT INTO `sys_role` VALUES (82, '111', '', '2020-10-14 11:58:22', '2020-10-14 11:58:22', b'1', 8, 8);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  `MENU_ID` bigint(20) NOT NULL COMMENT '菜单/按钮ID',
  INDEX `t_role_menu_menu_id`(`MENU_ID`) USING BTREE,
  INDEX `t_role_menu_role_id`(`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 179);
INSERT INTO `sys_role_menu` VALUES (1, 180);
INSERT INTO `sys_role_menu` VALUES (1, 181);
INSERT INTO `sys_role_menu` VALUES (1, 182);
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (1, 160);
INSERT INTO `sys_role_menu` VALUES (1, 161);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (1, 15);
INSERT INTO `sys_role_menu` VALUES (1, 16);
INSERT INTO `sys_role_menu` VALUES (1, 162);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (1, 18);
INSERT INTO `sys_role_menu` VALUES (1, 19);
INSERT INTO `sys_role_menu` VALUES (1, 163);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 20);
INSERT INTO `sys_role_menu` VALUES (1, 21);
INSERT INTO `sys_role_menu` VALUES (1, 22);
INSERT INTO `sys_role_menu` VALUES (1, 164);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 23);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 24);
INSERT INTO `sys_role_menu` VALUES (1, 170);
INSERT INTO `sys_role_menu` VALUES (1, 136);
INSERT INTO `sys_role_menu` VALUES (1, 171);
INSERT INTO `sys_role_menu` VALUES (1, 172);
INSERT INTO `sys_role_menu` VALUES (1, 127);
INSERT INTO `sys_role_menu` VALUES (1, 128);
INSERT INTO `sys_role_menu` VALUES (1, 129);
INSERT INTO `sys_role_menu` VALUES (1, 131);
INSERT INTO `sys_role_menu` VALUES (1, 175);
INSERT INTO `sys_role_menu` VALUES (1, 137);
INSERT INTO `sys_role_menu` VALUES (1, 138);
INSERT INTO `sys_role_menu` VALUES (1, 165);
INSERT INTO `sys_role_menu` VALUES (1, 139);
INSERT INTO `sys_role_menu` VALUES (1, 166);
INSERT INTO `sys_role_menu` VALUES (1, 115);
INSERT INTO `sys_role_menu` VALUES (1, 132);
INSERT INTO `sys_role_menu` VALUES (1, 133);
INSERT INTO `sys_role_menu` VALUES (1, 135);
INSERT INTO `sys_role_menu` VALUES (1, 134);
INSERT INTO `sys_role_menu` VALUES (1, 126);
INSERT INTO `sys_role_menu` VALUES (1, 159);
INSERT INTO `sys_role_menu` VALUES (1, 116);
INSERT INTO `sys_role_menu` VALUES (1, 117);
INSERT INTO `sys_role_menu` VALUES (1, 119);
INSERT INTO `sys_role_menu` VALUES (1, 120);
INSERT INTO `sys_role_menu` VALUES (1, 121);
INSERT INTO `sys_role_menu` VALUES (1, 122);
INSERT INTO `sys_role_menu` VALUES (1, 123);
INSERT INTO `sys_role_menu` VALUES (1, 118);
INSERT INTO `sys_role_menu` VALUES (1, 125);
INSERT INTO `sys_role_menu` VALUES (1, 167);
INSERT INTO `sys_role_menu` VALUES (1, 168);
INSERT INTO `sys_role_menu` VALUES (1, 169);
INSERT INTO `sys_role_menu` VALUES (1, 178);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `DEPT_ID` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `EMAIL` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `MOBILE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态 0锁定 1有效',
  `CREATE_TIME` datetime(0) NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `LAST_LOGIN_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最近访问时间',
  `SSEX` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别 0男 1女 2保密',
  `IS_TAB` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否开启tab，0关闭 1开启',
  `THEME` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题',
  `AVATAR` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `DESCRIPTION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `IS_DELETE` bit(1) NULL DEFAULT b'0' COMMENT '是否删除',
  `CREATE_BY` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `MODIFY_BY` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `t_user_username`(`USERNAME`) USING BTREE,
  INDEX `t_user_mobile`(`MOBILE`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (8, 'admin', '470263a5622b6153be9e681545233f55', 10, '', '', '1', '2020-10-13 16:11:03', '2020-10-21 09:23:50', '2020-10-21 09:23:50', '2', '1', 'black', 'default.jpg', '', b'0', NULL, 8);
INSERT INTO `sys_user` VALUES (9, 'cessss', 'be2640407e580da7de84425cf8039310', NULL, '', '', '1', '2020-10-16 17:22:36', '2020-10-16 17:22:36', NULL, '2', '1', 'black', 'default.jpg', '', b'1', 8, 8);

-- ----------------------------
-- Table structure for sys_user_data_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_data_permission`;
CREATE TABLE `sys_user_data_permission`  (
  `USER_ID` bigint(20) NOT NULL,
  `DEPT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`USER_ID`, `DEPT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户数据权限关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  INDEX `t_user_role_user_id`(`USER_ID`) USING BTREE,
  INDEX `t_user_role_role_id`(`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (8, 1);

-- ----------------------------
-- Procedure structure for proc_upsert_companyinfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_upsert_companyinfo`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_upsert_companyinfo`(
IN tableName varchar(100),
IN registration_form varchar(30),
IN taxpayer_contact_info varchar(50),
IN social_credit_code varchar(30),
IN taxpayer_name varchar(100),
IN taxpayer_state varchar(10),
IN course_recruitment_type varchar(50),
IN registration_type varchar(50),
IN organization varchar(50),
IN land_management_type varchar(50),
IN unit_subordination varchar(50),
IN approval_organs varchar(50),
IN certificates_name varchar(50),
IN certificates_code varchar(50),
IN practice_date varchar(50),
IN worker_num varchar(50),
IN fixed_worker_num varchar(50),
IN organization_type varchar(50),
IN accounting_order varchar(50),
IN business_scope varchar(1000),
IN industry varchar(100),
IN registration_authority varchar(100),
IN registration_date varchar(30),
IN master_tax_office varchar(100),
IN master_tax_branch_office varchar(100),
IN tax_revenue_manager varchar(40),
IN streets_villages varchar(100),
IN state_owned_holding_type varchar(40),
IN state_owned_investment_scale varchar(40),
IN natural_person_investment_scale varchar(40),
IN foreign_capital_investment_scale varchar(40),
IN registered_capital varchar(200),
IN total_investment varchar(400),
IN increases_taxpayers_type varchar(30),
IN accreditation_way varchar(30),
IN accounting_way varchar(30),
IN non_resident_enterprise_mark varchar(10),
IN cross_regional_property_reg_mark varchar(10),
IN effective_sign varchar(10),
IN registered_address_org varchar(10),
IN registered_address varchar(200),
IN registered_address_tel varchar(40),
IN production_registered_org varchar(40),
IN production_addr varchar(200),
IN production_address_tel varchar(40),
IN legal_person_name varchar(40),
IN legal_person_identity_type varchar(40),
IN legal_person_id_card varchar(40),
IN legal_person_tel varchar(40),
IN legal_person_mobile varchar(40),
IN finance_chief_name varchar(40),
IN finance_chief_id_card varchar(40),
IN finance_chief_tel varchar(40),
IN finance_chief_mobile varchar(40),
IN tax_collector_name varchar(40),
IN tax_collector_id_card varchar(40),
IN tax_collector_tel varchar(40),
IN tax_collector_mobile varchar(40),
IN entry_person varchar(40),
IN entry_date varchar(40),
IN modifier varchar(40),
IN modification_date varchar(40),
IN taxpayer_no varchar(40),
IN tax_archives_no varchar(100),
IN old_taxpayer_no varchar(100),
IN assessment_org varchar(40),
IN business_cancellation_date varchar(40),
IN is_cert_integration varchar(10),
IN accept_info varchar(80),
IN head_office_branch_type varchar(100),
IN head_office_info varchar(40),
IN branch_info varchar(40),
IN cross_regional_tax_related_no varchar(100),
IN taxpayer_subject_type varchar(40),
IN tegistrar_custom_category varchar(40),
IN is_private_enterprise varchar(10),
IN is_delete char(1),
IN create_by int,
IN create_date date,
IN update_by int,
IN update_date date ,
IN version int
-- ,
-- out executeSql varchar(5000),
-- out selectId int
)
BEGIN
    DECLARE selectId int;
    DECLARE executeSql varchar(5000);
		DECLARE selectModificationDate varchar(100);
-- 		查询此社会信用代码的企业信息是否存在，并把id存入tempId中 modification_date存入tempDate
		SET @sqlStmtSelect = CONCAT('select id,modification_date into @tempId, @tempDate from ',tableName,' where social_credit_code="',social_credit_code,'" LIMIT 1');
    PREPARE stmtSelect FROM @sqlStmtSelect;
    EXECUTE stmtSelect;
		deallocate prepare stmtSelect;
-- 		获得查询的企业id
		set selectId = @tempId;
-- 		获得查询的企业修改日期
		set selectModificationDate = @tempDate;
		
-- 		判断企业id是否为null,null则插入非空则更新，更新条件加上更新时间
		if selectId is null then 
			SET @sqlStmtInsert = CONCAT('INSERT INTO `',tableName,'`(`registration_form`, `taxpayer_contact_info`, `social_credit_code`, `taxpayer_name`, `taxpayer_state`, `course_recruitment_type`, 
			`registration_type`, `organization`, `land_management_type`, `unit_subordination`, `approval_organs`, `certificates_name`, `certificates_code`, `practice_date`,
			`worker_num`, `fixed_worker_num`, `organization_type`, `accounting_order`, `business_scope`, `industry`, `registration_authority`, `registration_date`, 
			`master_tax_office`, `master_tax_branch_office`, `tax_revenue_manager`, `streets_villages`, `state_owned_holding_type`, `state_owned_investment_scale`, 
			`natural_person_investment_scale`, `foreign_capital_investment_scale`, `registered_capital`, `total_investment`, `increases_taxpayers_type`, `accreditation_way`, 
			`accounting_way`, `non_resident_enterprise_mark`, `cross_regional_property_reg_mark`, `effective_sign`, `registered_address_org`, `registered_address`, 
			`registered_address_tel`, `production_registered_org`, `production_addr`, `production_address_tel`, `legal_person_name`, `legal_person_identity_type`, `legal_person_id_card`, 
			`legal_person_tel`, `legal_person_mobile`, `finance_chief_name`, `finance_chief_id_card`, `finance_chief_tel`, `finance_chief_mobile`, `tax_collector_name`, `tax_collector_id_card`, 
			`tax_collector_tel`, `tax_collector_mobile`, `entry_person`, `entry_date`, `modifier`, `modification_date`, `taxpayer_no`, `tax_archives_no`, `old_taxpayer_no`, `assessment_org`, 
			`business_cancellation_date`, `is_cert_integration`, `accept_info`, `head_office_branch_type`, `head_office_info`, `branch_info`, `cross_regional_tax_related_no`, `taxpayer_subject_type`, 
			`tegistrar_custom_category`, `is_private_enterprise`, `is_delete`, `create_by`, `create_date`, `update_by`, `update_date`, `version`) VALUES ',registration_form, taxpayer_contact_info, 
			social_credit_code, taxpayer_name, taxpayer_state, course_recruitment_type, registration_type, organization, land_management_type, unit_subordination, approval_organs, certificates_name, 
			certificates_code, practice_date, worker_num, fixed_worker_num, organization_type, accounting_order, business_scope, industry, registration_authority, registration_date, master_tax_office,
			master_tax_branch_office, tax_revenue_manager, streets_villages, state_owned_holding_type, state_owned_investment_scale, natural_person_investment_scale, foreign_capital_investment_scale, 
			registered_capital, total_investment, increases_taxpayers_type, accreditation_way, accounting_way, non_resident_enterprise_mark, cross_regional_property_reg_mark, effective_sign,
			registered_address_org, registered_address, registered_address_tel, production_registered_org, production_addr, production_address_tel, legal_person_name, legal_person_identity_type, 
			legal_person_id_card, legal_person_tel, legal_person_mobile, finance_chief_name, finance_chief_id_card, finance_chief_tel, finance_chief_mobile, tax_collector_name, tax_collector_id_card,
			tax_collector_tel, tax_collector_mobile, entry_person, entry_date, modifier, modification_date, taxpayer_no, tax_archives_no, old_taxpayer_no, assessment_org, business_cancellation_date, 
			is_cert_integration, accept_info, head_office_branch_type, head_office_info, branch_info, cross_regional_tax_related_no, taxpayer_subject_type, tegistrar_custom_category, is_private_enterprise,
			is_delete, create_by, create_date, update_by, update_date, version);
			PREPARE stmtInsert FROM @sqlStmtInsert;
			EXECUTE stmtInsert;
			deallocate prepare stmtInsert;
			set executeSql = @sqlStmtInsert;
		else
			SET @sqlStmtUpdate = CONCAT('UPDATE `',tableName,'` SET `registration_form` = "',registration_form,'", `taxpayer_contact_info` = "',taxpayer_contact_info,'", `taxpayer_name` = "',taxpayer_name,'",
			`taxpayer_state` = "',taxpayer_state,'", `course_recruitment_type` = "',course_recruitment_type,'", `registration_type` = "',registration_type,'", `organization` = "',organization,'",
			`land_management_type` = "',land_management_type,'", 
			`unit_subordination` = "',unit_subordination,'", `approval_organs` = "',approval_organs,'", `certificates_name` = "',certificates_name,'", `certificates_code` = "',certificates_code,'",
			`practice_date` = "',practice_date,'", `worker_num` = "',worker_num,'", 
			`fixed_worker_num` = "',fixed_worker_num,'", `organization_type` = "',organization_type,'", `accounting_order` = "',accounting_order,'", `business_scope` = "',business_scope,'",
			`industry` = "',industry,'", `registration_authority` = "',registration_authority,'", 
			`registration_date` = "',registration_date,'", `master_tax_office` = "',master_tax_office,'", `master_tax_branch_office` = "',master_tax_branch_office,'", `tax_revenue_manager` = "',tax_revenue_manager,'",
			`streets_villages` = "',streets_villages,'", 
			`state_owned_holding_type` = "',state_owned_holding_type,'", `state_owned_investment_scale` = "',state_owned_investment_scale,'", `natural_person_investment_scale` = "',natural_person_investment_scale,'", 
			`foreign_capital_investment_scale` = "',foreign_capital_investment_scale,'", `registered_capital` = "',registered_capital,'", `total_investment` = "',total_investment,'", `increases_taxpayers_type` = "',increases_taxpayers_type,'", 
			`accreditation_way` = "',accreditation_way,'", `accounting_way` = "',accounting_way,'", `non_resident_enterprise_mark` = "',non_resident_enterprise_mark,'", `cross_regional_property_reg_mark` = "',cross_regional_property_reg_mark,'",
			`effective_sign` = "',effective_sign,'", `registered_address_org` = "',registered_address_org,'", `registered_address` = "',registered_address,'", `registered_address_tel` = "',registered_address_tel,'", 
			`production_registered_org` = "',production_registered_org,'", `production_addr` = "',production_addr,'", `production_address_tel` = "',production_address_tel,'", `legal_person_name` = "',legal_person_name,'", 
			`legal_person_identity_type` = "',legal_person_identity_type,'", `legal_person_id_card` = "',legal_person_id_card,'", `legal_person_tel` = "',legal_person_tel,'", `legal_person_mobile` = "',legal_person_mobile,'", 
			`finance_chief_name` = "',finance_chief_name,'", `finance_chief_id_card` = "',finance_chief_id_card,'", `finance_chief_tel` = "',finance_chief_tel,'", `finance_chief_mobile` = "',finance_chief_mobile,'", 
			`tax_collector_name` = "',tax_collector_name,'", `tax_collector_id_card` = "',tax_collector_id_card,'", `tax_collector_tel` = "',tax_collector_tel,'", `tax_collector_mobile` = "',tax_collector_mobile,'", 
			`entry_person` = "',entry_person,'", `entry_date` = "',entry_date,'", `modifier` = "',modifier,'", `modification_date` = "',modification_date,'", `taxpayer_no` = "',taxpayer_no,'", `tax_archives_no` = "',tax_archives_no,'", 
			`old_taxpayer_no` = "',old_taxpayer_no,'", `assessment_org` = "',assessment_org,'", `business_cancellation_date` = "',business_cancellation_date,'", `is_cert_integration` = "',is_cert_integration,'",
			`accept_info` = "',accept_info,'", 
			`head_office_branch_type` = "',head_office_branch_type,'", `head_office_info` = "',head_office_info,'", `branch_info` = "',branch_info,'", `cross_regional_tax_related_no` = "',cross_regional_tax_related_no,'", 
			`taxpayer_subject_type` = "',taxpayer_subject_type,'", `tegistrar_custom_category` = "',tegistrar_custom_category,'", `is_private_enterprise` = "',is_private_enterprise,'", `is_delete` = "0", 
			`create_by` = "',create_by,'", `create_date` = "',create_date,'", `update_by` = "',update_by,'", `update_date` = "',update_date,'", `version` = 1 
			WHERE `social_credit_code` = "',social_credit_code,'" and STR_TO_DATE(modification_date,"%Y-%m-%d")<STR_TO_DATE(',modification_date,',"%Y-%m-%d")');
			PREPARE stmtUpdate FROM @sqlStmtUpdate;
			EXECUTE stmtUpdate;
			deallocate prepare stmtUpdate;
			set executeSql = @sqlStmtUpdate;
		end if;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
