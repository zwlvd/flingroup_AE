/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : ae

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 09/12/2024 16:28:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'main_case', '案例库表', NULL, NULL, 'MainCase', 'crud', 'element-ui', 'com.ruoyi.main', 'main', 'case', '案例库', 'akuza', '0', '/', '{\"parentMenuId\":0}', 'admin', '2024-11-19 20:22:22', '', '2024-11-21 19:00:55', NULL);
INSERT INTO `gen_table` VALUES (2, 'main_model', '算法模型表', NULL, NULL, 'MainModel', 'crud', 'element-ui', 'com.ruoyi.main', 'main', 'model', '算法模型', 'akuza', '0', '/', '{\"parentMenuId\":0}', 'admin', '2024-11-21 18:54:51', '', '2024-11-21 19:03:30', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'case_id', '案例ID', 'bigint', 'Long', 'caseId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-11-19 20:22:22', '', '2024-11-21 19:00:55');
INSERT INTO `gen_table_column` VALUES (2, 1, 'case_name', '案例名称', 'varchar(30)', 'String', 'caseName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-11-19 20:22:22', '', '2024-11-21 19:00:55');
INSERT INTO `gen_table_column` VALUES (3, 1, 'case_type', '案例类型', 'varchar(30)', 'String', 'caseType', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-11-19 20:22:22', '', '2024-11-21 19:00:55');
INSERT INTO `gen_table_column` VALUES (4, 1, 'case_address', '案例地址', 'varchar(100)', 'String', 'caseAddress', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2024-11-19 20:22:22', '', '2024-11-21 19:00:55');
INSERT INTO `gen_table_column` VALUES (5, 1, 'case_info', '案例介绍', 'varchar(100)', 'String', 'caseInfo', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2024-11-19 20:22:22', '', '2024-11-21 19:00:55');
INSERT INTO `gen_table_column` VALUES (6, 1, 'case_image', '案例图片', 'varchar(100)', 'String', 'caseImage', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'imageUpload', '', 6, 'admin', '2024-11-19 20:22:22', '', '2024-11-21 19:00:55');
INSERT INTO `gen_table_column` VALUES (7, 1, 'case_video', '案例视频', 'varchar(100)', 'String', 'caseVideo', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'fileUpload', '', 7, 'admin', '2024-11-19 20:22:22', '', '2024-11-21 19:00:55');
INSERT INTO `gen_table_column` VALUES (8, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-11-19 20:22:22', '', '2024-11-21 19:00:55');
INSERT INTO `gen_table_column` VALUES (9, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-11-19 20:22:22', '', '2024-11-21 19:00:55');
INSERT INTO `gen_table_column` VALUES (10, 1, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-11-19 20:22:22', '', '2024-11-21 19:00:55');
INSERT INTO `gen_table_column` VALUES (11, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2024-11-19 20:22:22', '', '2024-11-21 19:00:55');
INSERT INTO `gen_table_column` VALUES (12, 1, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 12, 'admin', '2024-11-19 20:22:22', '', '2024-11-21 19:00:55');
INSERT INTO `gen_table_column` VALUES (13, 2, 'model_id', '算法模型ID', 'bigint', 'Long', 'modelId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-11-21 18:54:51', '', '2024-11-21 19:03:30');
INSERT INTO `gen_table_column` VALUES (14, 2, 'model_name', '算法模型名称', 'varchar(30)', 'String', 'modelName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-11-21 18:54:52', '', '2024-11-21 19:03:30');
INSERT INTO `gen_table_column` VALUES (15, 2, 'model_type', '算法类型', 'varchar(30)', 'String', 'modelType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'main_model_type', 3, 'admin', '2024-11-21 18:54:52', '', '2024-11-21 19:03:30');
INSERT INTO `gen_table_column` VALUES (16, 2, 'model_address', '模型地址', 'varchar(100)', 'String', 'modelAddress', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2024-11-21 18:54:52', '', '2024-11-21 19:03:30');
INSERT INTO `gen_table_column` VALUES (17, 2, 'dataset_name', '训练数据集', 'varchar(100)', 'String', 'datasetName', '0', '0', '0', '1', '1', '1', '0', 'LIKE', 'input', '', 5, 'admin', '2024-11-21 18:54:52', '', '2024-11-21 19:03:30');
INSERT INTO `gen_table_column` VALUES (18, 2, 'model_info', '模型情况', 'varchar(500)', 'String', 'modelInfo', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 6, 'admin', '2024-11-21 18:54:52', '', '2024-11-21 19:03:30');
INSERT INTO `gen_table_column` VALUES (19, 2, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-11-21 18:54:52', '', '2024-11-21 19:03:30');
INSERT INTO `gen_table_column` VALUES (20, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-11-21 18:54:52', '', '2024-11-21 19:03:30');
INSERT INTO `gen_table_column` VALUES (21, 2, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-11-21 18:54:52', '', '2024-11-21 19:03:30');
INSERT INTO `gen_table_column` VALUES (22, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-11-21 18:54:52', '', '2024-11-21 19:03:30');
INSERT INTO `gen_table_column` VALUES (23, 2, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 11, 'admin', '2024-11-21 18:54:52', '', '2024-11-21 19:03:30');

-- ----------------------------
-- Table structure for main_case
-- ----------------------------
DROP TABLE IF EXISTS `main_case`;
CREATE TABLE `main_case`  (
  `case_id` bigint NOT NULL AUTO_INCREMENT COMMENT '案例ID',
  `case_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '案例名称',
  `case_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '案例类型',
  `case_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '案例地址',
  `case_info` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '案例介绍',
  `case_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '案例图片',
  `case_video` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '案例视频',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`case_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '案例库表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of main_case
-- ----------------------------
INSERT INTO `main_case` VALUES (100, 'patch对抗攻击_机动车检测与识别_夜晚', 'patch对抗攻击', '', '夜晚', '/profile/upload/2024/11/21/zju_20241121192904A002.png', '/profile/upload/2024/11/28/patch对抗攻击_夜晚1_20241128141239A013.mp4', '', '2024-11-19 20:56:32', '', '2024-11-28 14:12:40', '测试成功');
INSERT INTO `main_case` VALUES (101, 'patch对抗攻击_机动车检测与识别_白天', '目标消失', '', '白天', '/profile/upload/2024/11/22/back_20241122163207A001.jpg', '/profile/upload/2024/11/28/patch对抗攻击_白天2_20241128141006A011.mp4', '', '2024-11-22 16:32:33', '', '2024-11-28 14:10:08', '测试成功');
INSERT INTO `main_case` VALUES (102, '对抗投影攻击_0_傍晚_阴_环氧地坪_10kmh_车库_限行_01', '对抗投影攻击', '', '对抗投影攻击_0_傍晚_阴_环氧地坪_10kmh_车库_限行', NULL, '/profile/upload/2024/11/28/对抗投影攻击_0_傍晚_阴_环氧地坪_10kmh_车库_限行_01_20241128133433A001.mp4', '', '2024-11-22 16:52:17', '', '2024-11-28 13:37:26', NULL);
INSERT INTO `main_case` VALUES (103, '对抗投影攻击_0_傍晚_阴_环氧地坪_10kmh_车库_限行_02', '对抗投影攻击', '', '对抗投影攻击_0_傍晚_阴_环氧地坪_10kmh_车库_限行_02', NULL, '/profile/upload/2024/11/28/对抗投影攻击_0_傍晚_阴_环氧地坪_10kmh_车库_限行_02_20241128133757A002.mp4', '', '2024-11-22 16:52:21', '', '2024-11-28 13:38:39', NULL);
INSERT INTO `main_case` VALUES (104, '对抗投影攻击_0_傍晚_阴_环氧地坪_20kmh_车库_限行_01', '对抗投影攻击', '', '对抗投影攻击_0_傍晚_阴_环氧地坪_20kmh_车库_限行_01', NULL, '/profile/upload/2024/11/28/对抗投影攻击_0_傍晚_阴_环氧地坪_20kmh_车库_限行_01_20241128133912A003.mp4', '', '2024-11-22 16:52:26', '', '2024-11-28 13:39:17', NULL);
INSERT INTO `main_case` VALUES (105, '对抗投影攻击_3_白天_阴_柏油路_10kmh_stop_01', '对抗投影攻击', '', '对抗投影攻击_3_白天_阴_柏油路_10kmh_stop_01', NULL, '/profile/upload/2024/11/28/对抗投影攻击_3_白天_阴_柏油路_10kmh_stop_01_20241128133936A004.mp4', '', '2024-11-22 16:52:31', '', '2024-11-28 13:39:37', NULL);
INSERT INTO `main_case` VALUES (106, '7', '7', '', '', NULL, '/profile/upload/2024/11/28/傍晚_20241128135721A008.mov', '', '2024-11-22 16:52:38', '', '2024-11-28 13:57:23', NULL);
INSERT INTO `main_case` VALUES (107, '8', '8', '', '', NULL, '', '', '2024-11-22 16:52:45', '', '2024-11-28 13:57:45', NULL);
INSERT INTO `main_case` VALUES (108, '9', '9', '', '', NULL, NULL, '', '2024-11-22 16:52:50', '', NULL, NULL);
INSERT INTO `main_case` VALUES (109, '10', '10', '', '', NULL, NULL, '', '2024-11-22 16:52:55', '', NULL, NULL);

-- ----------------------------
-- Table structure for main_model
-- ----------------------------
DROP TABLE IF EXISTS `main_model`;
CREATE TABLE `main_model`  (
  `model_id` bigint NOT NULL AUTO_INCREMENT COMMENT '算法模型ID',
  `model_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '算法模型名称',
  `model_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '算法类型',
  `model_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型地址',
  `dataset_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '训练数据集',
  `model_info` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模型情况',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`model_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '算法模型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of main_model
-- ----------------------------
INSERT INTO `main_model` VALUES (100, 'YOLOv3', '1', NULL, 'COCO', '', '', '2024-11-21 19:16:05', '', '2024-11-22 20:29:09', NULL);
INSERT INTO `main_model` VALUES (101, 'Fast RCNN', '2', NULL, NULL, '', '', '2024-11-22 20:28:50', '', NULL, NULL);
INSERT INTO `main_model` VALUES (102, 'YOLOv2', '1', NULL, NULL, '', '', '2024-11-22 20:29:03', '', NULL, NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-11-19 16:04:48', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-11-19 16:04:48', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-11-19 16:04:48', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2024-11-19 16:04:48', 'admin', '2024-11-22 13:40:33', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2024-11-19 16:04:48', 'admin', '2024-11-19 19:38:28', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-11-19 16:04:48', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-11-19 16:04:47', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-11-19 16:04:47', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-11-19 16:04:47', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-11-19 16:04:47', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-11-19 16:04:47', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-11-19 16:04:47', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-11-19 16:04:47', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-11-19 16:04:47', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-11-19 16:04:47', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-11-19 16:04:47', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, 'YOLO', '1', 'main_model_type', NULL, 'default', 'N', '0', 'admin', '2024-11-21 18:58:54', 'admin', '2024-11-21 18:59:07', 'YOLO系列');
INSERT INTO `sys_dict_data` VALUES (101, 1, 'RCNN', '2', 'main_model_type', NULL, 'default', 'N', '0', 'admin', '2024-11-21 18:59:28', '', NULL, 'RCNN系列');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-11-19 16:04:48', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '算法类型', 'main_model_type', '0', 'admin', '2024-11-21 18:56:47', 'admin', '2024-11-21 18:57:08', '算法类型列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-11-19 16:04:48', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-11-19 16:04:48', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-11-19 16:04:48', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2024-11-19 16:22:58');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2024-11-19 16:23:15');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-19 16:23:39');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-19 16:28:33');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-19 16:29:22');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-19 16:30:43');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-19 16:30:47');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-19 16:33:40');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-19 16:58:33');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2024-11-19 19:37:55');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2024-11-19 19:37:58');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2024-11-19 19:38:03');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-19 19:38:06');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-19 19:38:39');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-19 20:06:01');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-21 14:22:39');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2024-11-21 15:19:15');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2024-11-21 15:19:18');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2024-11-21 15:19:21');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-21 15:19:24');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-21 16:00:14');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-21 17:50:38');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-21 17:51:17');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-21 18:50:56');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-21 18:50:56');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-21 18:51:09');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2024-11-22 13:40:07');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2024-11-22 13:40:09');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2024-11-22 13:40:12');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-22 13:40:16');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-22 16:18:32');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-22 18:49:25');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 16:00:51');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-28 13:07:51');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-28 21:11:31');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-29 10:31:23');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-29 12:10:44');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-03 13:36:58');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-03 14:05:06');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-03 15:08:18');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-03 19:20:29');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-07 16:56:07');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-08 13:02:01');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-09 15:36:56');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-09 16:13:30');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2014 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 3, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-11-19 16:04:47', 'admin', '2024-11-21 14:35:47', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 4, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-11-19 16:04:47', 'admin', '2024-11-21 14:35:52', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 5, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-11-19 16:04:47', 'admin', '2024-11-21 14:35:57', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '官网', 0, 6, 'http://zju.edu.cn', NULL, '', '', 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2024-11-19 16:04:47', 'admin', '2024-11-21 14:35:28', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-11-19 16:04:47', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-11-19 16:04:47', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-11-19 16:04:47', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-11-19 16:04:47', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-11-19 16:04:47', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-11-19 16:04:47', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-11-19 16:04:47', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-11-19 16:04:47', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-11-19 16:04:47', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-11-19 16:04:47', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-11-19 16:04:47', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-11-19 16:04:47', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-11-19 16:04:47', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-11-19 16:04:47', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-11-19 16:04:47', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-11-19 16:04:47', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-11-19 16:04:47', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-11-19 16:04:47', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-11-19 16:04:47', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-11-19 16:04:47', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '案例库', 2006, 1, 'case', 'main/case/index', NULL, '', 1, 0, 'C', '0', '0', 'main:case:list', 'example', 'admin', '2024-11-19 20:34:42', 'admin', '2024-11-19 20:46:51', '案例库菜单');
INSERT INTO `sys_menu` VALUES (2001, '案例库查询', 2000, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'main:case:query', '#', 'admin', '2024-11-19 20:34:42', 'admin', '2024-11-19 20:41:09', '');
INSERT INTO `sys_menu` VALUES (2002, '案例库新增', 2000, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'main:case:add', '#', 'admin', '2024-11-19 20:34:42', 'admin', '2024-11-19 20:41:18', '');
INSERT INTO `sys_menu` VALUES (2003, '案例库修改', 2000, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'main:case:edit', '#', 'admin', '2024-11-19 20:34:42', 'admin', '2024-11-19 20:41:28', '');
INSERT INTO `sys_menu` VALUES (2004, '案例库删除', 2000, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'main:case:remove', '#', 'admin', '2024-11-19 20:34:42', 'admin', '2024-11-19 20:41:34', '');
INSERT INTO `sys_menu` VALUES (2005, '案例库导出', 2000, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'main:case:export', '#', 'admin', '2024-11-19 20:34:42', 'admin', '2024-11-19 20:41:43', '');
INSERT INTO `sys_menu` VALUES (2006, '案例管理', 0, 2, 'main', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'chart', 'admin', '2024-11-19 20:46:32', 'admin', '2024-11-21 14:36:02', '');
INSERT INTO `sys_menu` VALUES (2007, '实时检测', 0, 1, 'detect', 'main/detect/index', NULL, '', 1, 0, 'C', '0', '0', '', 'monitor', 'admin', '2024-11-21 14:34:38', 'admin', '2024-11-21 14:37:03', '');
INSERT INTO `sys_menu` VALUES (2008, '算法模型', 2006, 2, 'model', 'main/model/index', NULL, '', 1, 0, 'C', '0', '0', 'main:model:list', 'table', 'admin', '2024-11-21 19:05:38', 'admin', '2024-11-21 19:07:45', '算法模型菜单');
INSERT INTO `sys_menu` VALUES (2009, '算法模型查询', 2008, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'main:model:query', '#', 'admin', '2024-11-21 19:05:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '算法模型新增', 2008, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'main:model:add', '#', 'admin', '2024-11-21 19:05:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '算法模型修改', 2008, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'main:model:edit', '#', 'admin', '2024-11-21 19:05:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '算法模型删除', 2008, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'main:model:remove', '#', 'admin', '2024-11-21 19:05:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '算法模型导出', 2008, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'main:model:export', '#', 'admin', '2024-11-21 19:05:38', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-11-19 16:04:48', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-11-19 16:04:48', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 191 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-11-19 16:04:47\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://zju.edu.cn\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-19 16:40:21', 14);
INSERT INTO `sys_oper_log` VALUES (101, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 16:04:48\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-19 19:38:28', 15);
INSERT INTO `sys_oper_log` VALUES (102, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"create table main_case(\\n                          case_id           bigint(20)      not null auto_increment    comment \'案例ID\',\\n                          case_name         varchar(30)     not null                   comment \'案例名称\',\\n                          case_type         varchar(30)     not null                   comment \'案例类型\',\\n                          case_address      varchar(100)    default \'\'                 comment \'案例地址\',\\n                          case_info         varchar(100)    default \'\'                 comment \'案例介绍\',\\n                          case_image        varchar(100)                               comment \'案例图片\',\\n                          case_video        varchar(100)                               comment \'案例视频\',\\n                          create_by         varchar(64)     default \'\'                 comment \'创建者\',\\n                          create_time       datetime                                   comment \'创建时间\',\\n                          update_by         varchar(64)     default \'\'                 comment \'更新者\',\\n                          update_time       datetime                                   comment \'更新时间\',\\n                          remark            varchar(500)    default null               comment \'备注\',\\n                          primary key (user_id)\\n) engine=innodb auto_increment=100 comment = \'案例库表\';\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-11-19 20:21:38', 247);
INSERT INTO `sys_oper_log` VALUES (103, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"create table main_case(\\n                          case_id           bigint(20)      not null auto_increment    comment \'案例ID\',\\n                          case_name         varchar(30)     not null                   comment \'案例名称\',\\n                          case_type         varchar(30)     not null                   comment \'案例类型\',\\n                          case_address      varchar(100)    default \'\'                 comment \'案例地址\',\\n                          case_info         varchar(100)    default \'\'                 comment \'案例介绍\',\\n                          case_image        varchar(100)                               comment \'案例图片\',\\n                          case_video        varchar(100)                               comment \'案例视频\',\\n                          create_by         varchar(64)     default \'\'                 comment \'创建者\',\\n                          create_time       datetime                                   comment \'创建时间\',\\n                          update_by         varchar(64)     default \'\'                 comment \'更新者\',\\n                          update_time       datetime                                   comment \'更新时间\',\\n                          remark            varchar(500)    default null               comment \'备注\',\\n                          primary key (case_id)\\n) engine=innodb auto_increment=100 comment = \'案例库表\';\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-19 20:22:22', 189);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"case\",\"className\":\"MainCase\",\"columns\":[{\"capJavaField\":\"CaseId\",\"columnComment\":\"案例ID\",\"columnId\":1,\"columnName\":\"case_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"caseId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CaseName\",\"columnComment\":\"案例名称\",\"columnId\":2,\"columnName\":\"case_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"caseName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CaseType\",\"columnComment\":\"案例类型\",\"columnId\":3,\"columnName\":\"case_type\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"caseType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CaseAddress\",\"columnComment\":\"案例地址\",\"columnId\":4,\"columnName\":\"case_address\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequire', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-19 20:27:40', 33);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"case\",\"className\":\"MainCase\",\"columns\":[{\"capJavaField\":\"CaseId\",\"columnComment\":\"案例ID\",\"columnId\":1,\"columnName\":\"case_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"caseId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-11-19 20:27:40\",\"usableColumn\":false},{\"capJavaField\":\"CaseName\",\"columnComment\":\"案例名称\",\"columnId\":2,\"columnName\":\"case_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"caseName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-11-19 20:27:40\",\"usableColumn\":false},{\"capJavaField\":\"CaseType\",\"columnComment\":\"案例类型\",\"columnId\":3,\"columnName\":\"case_type\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"caseType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-11-19 20:27:40\",\"usableColumn\":false},{\"capJavaField\":\"CaseAddress\",\"columnComment\":\"案例地址\",\"columnId\":4,\"columnName\":\"case_address\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"in', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-19 20:28:18', 23);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"case\",\"className\":\"MainCase\",\"columns\":[{\"capJavaField\":\"CaseId\",\"columnComment\":\"案例ID\",\"columnId\":1,\"columnName\":\"case_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"caseId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-11-19 20:28:18\",\"usableColumn\":false},{\"capJavaField\":\"CaseName\",\"columnComment\":\"案例名称\",\"columnId\":2,\"columnName\":\"case_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"caseName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-11-19 20:28:18\",\"usableColumn\":false},{\"capJavaField\":\"CaseType\",\"columnComment\":\"案例类型\",\"columnId\":3,\"columnName\":\"case_type\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"caseType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-11-19 20:28:18\",\"usableColumn\":false},{\"capJavaField\":\"CaseAddress\",\"columnComment\":\"案例地址\",\"columnId\":4,\"columnName\":\"case_address\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"in', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-19 20:29:12', 20);
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"main/case/index\",\"createTime\":\"2024-11-19 20:34:42\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"案例库\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"case\",\"perms\":\"main:case:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-19 20:40:59', 17);
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-11-19 20:34:42\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"案例库查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"#\",\"perms\":\"main:case:query\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-19 20:41:09', 7);
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-11-19 20:34:42\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"案例库新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"#\",\"perms\":\"main:case:add\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-19 20:41:18', 5);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-11-19 20:34:42\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"案例库修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"#\",\"perms\":\"main:case:edit\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-19 20:41:28', 7);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-11-19 20:34:42\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"案例库删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"#\",\"perms\":\"main:case:remove\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-19 20:41:34', 7);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-11-19 20:34:42\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"案例库导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"#\",\"perms\":\"main:case:export\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-19 20:41:43', 5);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"案例管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"main\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-19 20:46:32', 65);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"main/case/index\",\"createTime\":\"2024-11-19 20:34:42\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"案例库\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"case\",\"perms\":\"main:case:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-19 20:46:51', 22);
INSERT INTO `sys_oper_log` VALUES (115, '案例库', 1, 'com.ruoyi.main.controller.MainCaseController.add()', 'POST', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseImage\":\"/profile/upload/2024/11/19/back_20241119204859A001.jpg\",\"caseName\":\"test\",\"createTime\":\"2024-11-19 20:49:02\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'case_type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Code\\IdeaProjects\\ae_springboot\\ruoyi-admin\\target\\classes\\mapper\\main\\MainCaseMapper.xml]\r\n### The error may involve com.ruoyi.main.mapper.MainCaseMapper.insertMainCase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into main_case          ( case_name,                                                    case_image,                                       create_time )           values ( ?,                                                    ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'case_type\' doesn\'t have a default value\n; Field \'case_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'case_type\' doesn\'t have a default value', '2024-11-19 20:49:02', 40);
INSERT INTO `sys_oper_log` VALUES (116, '案例库', 1, 'com.ruoyi.main.controller.MainCaseController.add()', 'POST', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseImage\":\"/profile/upload/2024/11/19/back_20241119204859A001.jpg\",\"caseName\":\"test\",\"createTime\":\"2024-11-19 20:49:06\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'case_type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Code\\IdeaProjects\\ae_springboot\\ruoyi-admin\\target\\classes\\mapper\\main\\MainCaseMapper.xml]\r\n### The error may involve com.ruoyi.main.mapper.MainCaseMapper.insertMainCase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into main_case          ( case_name,                                                    case_image,                                       create_time )           values ( ?,                                                    ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'case_type\' doesn\'t have a default value\n; Field \'case_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'case_type\' doesn\'t have a default value', '2024-11-19 20:49:06', 4);
INSERT INTO `sys_oper_log` VALUES (117, '案例库', 1, 'com.ruoyi.main.controller.MainCaseController.add()', 'POST', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"1\",\"caseImage\":\"/profile/upload/2024/11/19/back_20241119205051A002.jpg\",\"caseName\":\"1\",\"createTime\":\"2024-11-19 20:50:51\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'case_type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Code\\IdeaProjects\\ae_springboot\\ruoyi-admin\\target\\classes\\mapper\\main\\MainCaseMapper.xml]\r\n### The error may involve com.ruoyi.main.mapper.MainCaseMapper.insertMainCase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into main_case          ( case_name,                          case_address,                          case_image,                                       create_time )           values ( ?,                          ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'case_type\' doesn\'t have a default value\n; Field \'case_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'case_type\' doesn\'t have a default value', '2024-11-19 20:50:51', 2);
INSERT INTO `sys_oper_log` VALUES (118, '案例库', 1, 'com.ruoyi.main.controller.MainCaseController.add()', 'POST', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"1\",\"caseImage\":\"/profile/upload/2024/11/19/back_20241119205051A002.jpg\",\"caseName\":\"1\",\"createTime\":\"2024-11-19 20:50:55\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'case_type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Code\\IdeaProjects\\ae_springboot\\ruoyi-admin\\target\\classes\\mapper\\main\\MainCaseMapper.xml]\r\n### The error may involve com.ruoyi.main.mapper.MainCaseMapper.insertMainCase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into main_case          ( case_name,                          case_address,                          case_image,                                       create_time )           values ( ?,                          ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'case_type\' doesn\'t have a default value\n; Field \'case_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'case_type\' doesn\'t have a default value', '2024-11-19 20:50:55', 2);
INSERT INTO `sys_oper_log` VALUES (119, '案例库', 1, 'com.ruoyi.main.controller.MainCaseController.add()', 'POST', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseName\":\"1\",\"createTime\":\"2024-11-19 20:54:11\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'case_type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Code\\IdeaProjects\\ae_springboot\\ruoyi-admin\\target\\classes\\mapper\\main\\MainCaseMapper.xml]\r\n### The error may involve com.ruoyi.main.mapper.MainCaseMapper.insertMainCase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into main_case          ( case_name,                                                                                           create_time )           values ( ?,                                                                                           ? )\r\n### Cause: java.sql.SQLException: Field \'case_type\' doesn\'t have a default value\n; Field \'case_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'case_type\' doesn\'t have a default value', '2024-11-19 20:54:11', 4);
INSERT INTO `sys_oper_log` VALUES (120, '案例库', 1, 'com.ruoyi.main.controller.MainCaseController.add()', 'POST', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseId\":100,\"caseName\":\"1\",\"createTime\":\"2024-11-19 20:56:31\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-19 20:56:31', 18);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-11-19 16:04:47\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 14:28:52', 14);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-11-19 16:04:47\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 14:28:59', 9);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-11-19 16:04:47\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 14:29:05', 12);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-11-19 16:04:47\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"官网\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"http://zju.edu.cn\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 14:29:11', 13);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"实时检测\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"detect\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 14:34:38', 66);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-11-19 20:46:32\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"案例管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"main\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 14:35:03', 14);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-11-19 20:46:32\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"案例管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"main\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 14:35:07', 16);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-11-19 20:46:32\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"案例管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"main\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 14:35:11', 6);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-11-19 20:46:32\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"案例管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"main\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 14:35:15', 24);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-11-19 16:04:47\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"官网\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"http://zju.edu.cn\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 14:35:28', 18);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-11-19 16:04:47\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 14:35:47', 37);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-11-19 16:04:47\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 14:35:52', 22);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-11-19 16:04:47\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 14:35:57', 17);
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-11-19 20:46:32\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"案例管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"main\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 14:36:02', 24);
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"main/detect/index\",\"createTime\":\"2024-11-21 14:34:38\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"实时检测\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"detect\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 14:37:03', 13);
INSERT INTO `sys_oper_log` VALUES (136, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/11/21/avatar_20241121175139A001.png\",\"code\":200}', 0, NULL, '2024-11-21 17:51:39', 59);
INSERT INTO `sys_oper_log` VALUES (137, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"drop table if exists main_model;\\ncreate table main_model (\\n                            model_id        bigint(20)      not null auto_increment    comment \'算法模型ID\',\\n                            model_name      varchar(30)     not null                   comment \'算法模型名称\',\\n                            model_type      varchar(30)                                comment \'算法类型\',\\n                            model_address   varchar(100)                               comment \'模型地址\',\\n                            dataset_name    varchar(100)                               comment \'训练数据集\',\\n                            model_info      varchar(500)    default \'\'                 comment \'模型情况\',\\n                            create_by       varchar(64)     default \'\'                 comment \'创建者\',\\n                            create_time     datetime                                   comment \'创建时间\',\\n                            update_by       varchar(64)     default \'\'                 comment \'更新者\',\\n                            update_time     datetime                                   comment \'更新时间\',\\n                            remark          varchar(500)    default null               comment \'备注\',\\n                            primary key (model_id)\\n) engine=innodb auto_increment=100 comment = \'算法模型表\';\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-11-21 17:57:35', 11);
INSERT INTO `sys_oper_log` VALUES (138, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"drop table if exists main_model;\\ncreate table main_model (\\n                            model_id        bigint(20)      not null auto_increment    comment \'算法模型ID\',\\n                            model_name      varchar(30)     not null                   comment \'算法模型名称\',\\n                            model_type      varchar(30)                                comment \'算法类型\',\\n                            model_address   varchar(100)                               comment \'模型地址\',\\n                            dataset_name    varchar(100)                               comment \'训练数据集\',\\n                            model_info      varchar(500)    default \'\'                 comment \'模型情况\',\\n                            create_by       varchar(64)     default \'\'                 comment \'创建者\',\\n                            create_time     datetime                                   comment \'创建时间\',\\n                            update_by       varchar(64)     default \'\'                 comment \'更新者\',\\n                            update_time     datetime                                   comment \'更新时间\',\\n                            remark          varchar(500)    default null               comment \'备注\',\\n                            primary key (model_id)\\n) engine=innodb auto_increment=100 comment = \'算法模型表\';\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-11-21 18:51:27', 3);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"main_model\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 18:54:52', 337);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"model\",\"className\":\"MainModel\",\"columns\":[{\"capJavaField\":\"ModelId\",\"columnComment\":\"算法模型ID\",\"columnId\":13,\"columnName\":\"model_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-11-21 18:54:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"modelId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ModelName\",\"columnComment\":\"算法模型名称\",\"columnId\":14,\"columnName\":\"model_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-21 18:54:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"modelName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ModelType\",\"columnComment\":\"算法类型\",\"columnId\":15,\"columnName\":\"model_type\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-21 18:54:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"modelType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ModelAddress\",\"columnComment\":\"模型地址\",\"columnId\":16,\"columnName\":\"model_address\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-21 18:54:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 18:55:41', 48);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"model\",\"className\":\"MainModel\",\"columns\":[{\"capJavaField\":\"ModelId\",\"columnComment\":\"算法模型ID\",\"columnId\":13,\"columnName\":\"model_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-11-21 18:54:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"modelId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-11-21 18:55:41\",\"usableColumn\":false},{\"capJavaField\":\"ModelName\",\"columnComment\":\"算法模型名称\",\"columnId\":14,\"columnName\":\"model_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-21 18:54:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"modelName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-11-21 18:55:41\",\"usableColumn\":false},{\"capJavaField\":\"ModelType\",\"columnComment\":\"算法类型\",\"columnId\":15,\"columnName\":\"model_type\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-21 18:54:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"modelType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-11-21 18:55:41\",\"usableColumn\":false},{\"capJavaField\":\"ModelAddress\",\"columnComment\":\"模型地址\",\"columnId\":16,\"columnName\":\"model_address\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-21 18:54:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 18:56:05', 154);
INSERT INTO `sys_oper_log` VALUES (142, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"算法类型\",\"dictType\":\"main_model_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 18:56:47', 37);
INSERT INTO `sys_oper_log` VALUES (143, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-21 18:56:47\",\"dictId\":100,\"dictName\":\"算法类型\",\"dictType\":\"main_model_type\",\"params\":{},\"remark\":\"算法类型列表\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 18:57:09', 20);
INSERT INTO `sys_oper_log` VALUES (144, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"YOLO\",\"dictSort\":0,\"dictType\":\"main_model_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 18:58:54', 28);
INSERT INTO `sys_oper_log` VALUES (145, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-11-21 18:58:54\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"YOLO\",\"dictSort\":0,\"dictType\":\"main_model_type\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"YOLO系列\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 18:59:07', 13);
INSERT INTO `sys_oper_log` VALUES (146, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"RCNN\",\"dictSort\":1,\"dictType\":\"main_model_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"remark\":\"RCNN系列\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 18:59:28', 13);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"model\",\"className\":\"MainModel\",\"columns\":[{\"capJavaField\":\"ModelId\",\"columnComment\":\"算法模型ID\",\"columnId\":13,\"columnName\":\"model_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-11-21 18:54:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"modelId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-11-21 18:56:05\",\"usableColumn\":false},{\"capJavaField\":\"ModelName\",\"columnComment\":\"算法模型名称\",\"columnId\":14,\"columnName\":\"model_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-21 18:54:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"modelName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-11-21 18:56:05\",\"usableColumn\":false},{\"capJavaField\":\"ModelType\",\"columnComment\":\"算法类型\",\"columnId\":15,\"columnName\":\"model_type\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-21 18:54:52\",\"dictType\":\"main_model_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"modelType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-11-21 18:56:05\",\"usableColumn\":false},{\"capJavaField\":\"ModelAddress\",\"columnComment\":\"模型地址\",\"columnId\":16,\"columnName\":\"model_address\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-21 18:54:52\",\"dictType\":\"\",\"edit\":true,\"ht', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 18:59:51', 36);
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"case\",\"className\":\"MainCase\",\"columns\":[{\"capJavaField\":\"CaseId\",\"columnComment\":\"案例ID\",\"columnId\":1,\"columnName\":\"case_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"caseId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-11-19 20:29:12\",\"usableColumn\":false},{\"capJavaField\":\"CaseName\",\"columnComment\":\"案例名称\",\"columnId\":2,\"columnName\":\"case_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"caseName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-11-19 20:29:12\",\"usableColumn\":false},{\"capJavaField\":\"CaseType\",\"columnComment\":\"案例类型\",\"columnId\":3,\"columnName\":\"case_type\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"caseType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-11-19 20:29:12\",\"usableColumn\":false},{\"capJavaField\":\"CaseAddress\",\"columnComment\":\"案例地址\",\"columnId\":4,\"columnName\":\"case_address\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"in', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 19:00:07', 23);
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"case\",\"className\":\"MainCase\",\"columns\":[{\"capJavaField\":\"CaseId\",\"columnComment\":\"案例ID\",\"columnId\":1,\"columnName\":\"case_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"caseId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-11-21 19:00:07\",\"usableColumn\":false},{\"capJavaField\":\"CaseName\",\"columnComment\":\"案例名称\",\"columnId\":2,\"columnName\":\"case_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"caseName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-11-21 19:00:07\",\"usableColumn\":false},{\"capJavaField\":\"CaseType\",\"columnComment\":\"案例类型\",\"columnId\":3,\"columnName\":\"case_type\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"caseType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-11-21 19:00:07\",\"usableColumn\":false},{\"capJavaField\":\"CaseAddress\",\"columnComment\":\"案例地址\",\"columnId\":4,\"columnName\":\"case_address\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 20:22:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 19:00:55', 37);
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"model\",\"className\":\"MainModel\",\"columns\":[{\"capJavaField\":\"ModelId\",\"columnComment\":\"算法模型ID\",\"columnId\":13,\"columnName\":\"model_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-11-21 18:54:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"modelId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-11-21 18:59:51\",\"usableColumn\":false},{\"capJavaField\":\"ModelName\",\"columnComment\":\"算法模型名称\",\"columnId\":14,\"columnName\":\"model_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-21 18:54:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"modelName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-11-21 18:59:51\",\"usableColumn\":false},{\"capJavaField\":\"ModelType\",\"columnComment\":\"算法类型\",\"columnId\":15,\"columnName\":\"model_type\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-21 18:54:52\",\"dictType\":\"main_model_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"modelType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-11-21 18:59:51\",\"usableColumn\":false},{\"capJavaField\":\"ModelAddress\",\"columnComment\":\"模型地址\",\"columnId\":16,\"columnName\":\"model_address\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-21 18:54:52\",\"dictType\":\"\",\"edit\":true,\"ht', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 19:03:30', 35);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"main/model/index\",\"createTime\":\"2024-11-21 19:05:38\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"算法模型\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2006,\"path\":\"model\",\"perms\":\"main:model:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 19:07:45', 36);
INSERT INTO `sys_oper_log` VALUES (152, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-11-19 16:04:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2007,2006,2000,2001,2002,2003,2004,2005,2008,2009,2010,2011,2012,2013,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 19:13:09', 141);
INSERT INTO `sys_oper_log` VALUES (153, '算法模型', 1, 'com.ruoyi.main.controller.MainModelController.add()', 'POST', 1, 'admin', '研发部门', '/main/model', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-21 19:16:05\",\"datasetName\":\"COCO\",\"modelId\":100,\"modelName\":\"YOLOV3\",\"modelType\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 19:16:05', 201);
INSERT INTO `sys_oper_log` VALUES (154, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":100,\"caseImage\":\"/profile/upload/2024/11/21/zju_20241121192904A002.png\",\"caseInfo\":\"\",\"caseName\":\"1\",\"createBy\":\"\",\"createTime\":\"2024-11-19 20:56:32\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-11-21 19:29:12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 19:29:12', 18);
INSERT INTO `sys_oper_log` VALUES (155, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":100,\"caseImage\":\"/profile/upload/2024/11/21/zju_20241121192904A002.png\",\"caseInfo\":\"\",\"caseName\":\"1\",\"caseVideo\":\"/profile/upload/2024/11/21/视频1_20241121194648A002.mov\",\"createBy\":\"\",\"createTime\":\"2024-11-19 20:56:32\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-11-21 19:46:52\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-21 19:46:52', 52);
INSERT INTO `sys_oper_log` VALUES (156, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2024-11-19 16:04:48\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-22 13:40:33', 12);
INSERT INTO `sys_oper_log` VALUES (157, '案例库', 1, 'com.ruoyi.main.controller.MainCaseController.add()', 'POST', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseId\":101,\"caseImage\":\"/profile/upload/2024/11/22/back_20241122163207A001.jpg\",\"caseInfo\":\"攻击后无法检测到目标\",\"caseName\":\"case2\",\"caseType\":\"目标消失\",\"caseVideo\":\"/profile/upload/2024/11/22/视频1_20241122163221A002.mov\",\"createTime\":\"2024-11-22 16:32:33\",\"params\":{},\"remark\":\"测试成功\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-22 16:32:33', 73);
INSERT INTO `sys_oper_log` VALUES (158, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":100,\"caseImage\":\"/profile/upload/2024/11/21/zju_20241121192904A002.png\",\"caseInfo\":\"攻击后可以检测到虚假目标\",\"caseName\":\"case1\",\"caseType\":\"虚假目标\",\"caseVideo\":\"/profile/upload/2024/11/21/视频1_20241121194430A001.mov\",\"createBy\":\"\",\"createTime\":\"2024-11-19 20:56:32\",\"params\":{},\"remark\":\"测试成功\",\"updateBy\":\"\",\"updateTime\":\"2024-11-22 16:33:15\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-22 16:33:15', 10);
INSERT INTO `sys_oper_log` VALUES (159, '案例库', 1, 'com.ruoyi.main.controller.MainCaseController.add()', 'POST', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseId\":102,\"caseName\":\"3\",\"caseType\":\"3\",\"createTime\":\"2024-11-22 16:52:16\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-22 16:52:16', 9);
INSERT INTO `sys_oper_log` VALUES (160, '案例库', 1, 'com.ruoyi.main.controller.MainCaseController.add()', 'POST', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseId\":103,\"caseName\":\"4\",\"caseType\":\"4\",\"createTime\":\"2024-11-22 16:52:20\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-22 16:52:20', 12);
INSERT INTO `sys_oper_log` VALUES (161, '案例库', 1, 'com.ruoyi.main.controller.MainCaseController.add()', 'POST', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseId\":104,\"caseName\":\"5\",\"caseType\":\"5\",\"createTime\":\"2024-11-22 16:52:25\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-22 16:52:25', 12);
INSERT INTO `sys_oper_log` VALUES (162, '案例库', 1, 'com.ruoyi.main.controller.MainCaseController.add()', 'POST', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseId\":105,\"caseName\":\"6\",\"caseType\":\"6\",\"createTime\":\"2024-11-22 16:52:31\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-22 16:52:31', 7);
INSERT INTO `sys_oper_log` VALUES (163, '案例库', 1, 'com.ruoyi.main.controller.MainCaseController.add()', 'POST', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseId\":106,\"caseName\":\"7\",\"caseType\":\"7\",\"createTime\":\"2024-11-22 16:52:37\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-22 16:52:37', 11);
INSERT INTO `sys_oper_log` VALUES (164, '案例库', 1, 'com.ruoyi.main.controller.MainCaseController.add()', 'POST', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseId\":107,\"caseName\":\"8\",\"caseType\":\"8\",\"createTime\":\"2024-11-22 16:52:44\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-22 16:52:44', 10);
INSERT INTO `sys_oper_log` VALUES (165, '案例库', 1, 'com.ruoyi.main.controller.MainCaseController.add()', 'POST', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseId\":108,\"caseName\":\"9\",\"caseType\":\"9\",\"createTime\":\"2024-11-22 16:52:49\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-22 16:52:49', 11);
INSERT INTO `sys_oper_log` VALUES (166, '案例库', 1, 'com.ruoyi.main.controller.MainCaseController.add()', 'POST', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseId\":109,\"caseName\":\"10\",\"caseType\":\"10\",\"createTime\":\"2024-11-22 16:52:55\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-22 16:52:55', 12);
INSERT INTO `sys_oper_log` VALUES (167, '算法模型', 1, 'com.ruoyi.main.controller.MainModelController.add()', 'POST', 1, 'admin', '研发部门', '/main/model', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-22 20:28:49\",\"modelId\":101,\"modelName\":\"Fast RCNN\",\"modelType\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-22 20:28:50', 299);
INSERT INTO `sys_oper_log` VALUES (168, '算法模型', 1, 'com.ruoyi.main.controller.MainModelController.add()', 'POST', 1, 'admin', '研发部门', '/main/model', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-11-22 20:29:02\",\"modelId\":102,\"modelName\":\"YOLOv2\",\"modelType\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-22 20:29:02', 15);
INSERT INTO `sys_oper_log` VALUES (169, '算法模型', 2, 'com.ruoyi.main.controller.MainModelController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/model', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-11-21 19:16:05\",\"datasetName\":\"COCO\",\"modelId\":100,\"modelInfo\":\"\",\"modelName\":\"YOLOv3\",\"modelType\":\"1\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-11-22 20:29:08\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-22 20:29:08', 12);
INSERT INTO `sys_oper_log` VALUES (170, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":102,\"caseInfo\":\"对抗投影攻击_0_傍晚_阴_环氧地坪_10kmh_车库_限行\",\"caseName\":\"对抗投影攻击_0_傍晚_阴_环氧地坪_10kmh_车库_限行_01\",\"caseType\":\"对抗投影攻击\",\"caseVideo\":\"/profile/upload/2024/11/28/对抗投影攻击_0_傍晚_阴_环氧地坪_10kmh_车库_限行_01_20241128133433A001.mp4\",\"createBy\":\"\",\"createTime\":\"2024-11-22 16:52:17\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-11-28 13:34:58\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'case_name\' at row 1\r\n### The error may exist in file [D:\\Code\\IdeaProjects\\ae_springboot\\ruoyi-admin\\target\\classes\\mapper\\main\\MainCaseMapper.xml]\r\n### The error may involve com.ruoyi.main.mapper.MainCaseMapper.updateMainCase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update main_case          SET case_name = ?,             case_type = ?,             case_address = ?,             case_info = ?,                          case_video = ?,             create_by = ?,             create_time = ?,             update_by = ?,             update_time = ?          where case_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'case_name\' at row 1\n; Data truncation: Data too long for column \'case_name\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'case_name\' at row 1', '2024-11-28 13:34:59', 68);
INSERT INTO `sys_oper_log` VALUES (171, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":102,\"caseInfo\":\"对抗投影攻击_0_傍晚_阴_环氧地坪_10kmh_车库_限行\",\"caseName\":\"对抗投影攻击_0_傍晚_阴_环氧地坪_10kmh_车库_限行_01\",\"caseType\":\"对抗投影攻击\",\"caseVideo\":\"/profile/upload/2024/11/28/对抗投影攻击_0_傍晚_阴_环氧地坪_10kmh_车库_限行_01_20241128133433A001.mp4\",\"createBy\":\"\",\"createTime\":\"2024-11-22 16:52:17\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-11-28 13:35:37\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'case_name\' at row 1\r\n### The error may exist in file [D:\\Code\\IdeaProjects\\ae_springboot\\ruoyi-admin\\target\\classes\\mapper\\main\\MainCaseMapper.xml]\r\n### The error may involve com.ruoyi.main.mapper.MainCaseMapper.updateMainCase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update main_case          SET case_name = ?,             case_type = ?,             case_address = ?,             case_info = ?,                          case_video = ?,             create_by = ?,             create_time = ?,             update_by = ?,             update_time = ?          where case_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'case_name\' at row 1\n; Data truncation: Data too long for column \'case_name\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'case_name\' at row 1', '2024-11-28 13:35:37', 3);
INSERT INTO `sys_oper_log` VALUES (172, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":102,\"caseInfo\":\"对抗投影攻击_0_傍晚_阴_环氧地坪_10kmh_车库_限行\",\"caseName\":\"对抗投影攻击_0_傍晚_阴_环氧地坪_10kmh_车库_限行_01\",\"caseType\":\"对抗投影攻击\",\"caseVideo\":\"/profile/upload/2024/11/28/对抗投影攻击_0_傍晚_阴_环氧地坪_10kmh_车库_限行_01_20241128133433A001.mp4\",\"createBy\":\"\",\"createTime\":\"2024-11-22 16:52:17\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-11-28 13:37:26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 13:37:26', 9);
INSERT INTO `sys_oper_log` VALUES (173, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":103,\"caseInfo\":\"对抗投影攻击_0_傍晚_阴_环氧地坪_10kmh_车库_限行_02\",\"caseName\":\"对抗投影攻击_0_傍晚_阴_环氧地坪_10kmh_车库_限行_02\",\"caseType\":\"对抗投影攻击\",\"caseVideo\":\"/profile/upload/2024/11/28/对抗投影攻击_0_傍晚_阴_环氧地坪_10kmh_车库_限行_02_20241128133757A002.mp4\",\"createBy\":\"\",\"createTime\":\"2024-11-22 16:52:21\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-11-28 13:38:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 13:38:39', 18);
INSERT INTO `sys_oper_log` VALUES (174, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":104,\"caseInfo\":\"对抗投影攻击_0_傍晚_阴_环氧地坪_20kmh_车库_限行_01\",\"caseName\":\"对抗投影攻击_0_傍晚_阴_环氧地坪_20kmh_车库_限行_01\",\"caseType\":\"对抗投影攻击\",\"caseVideo\":\"/profile/upload/2024/11/28/对抗投影攻击_0_傍晚_阴_环氧地坪_20kmh_车库_限行_01_20241128133912A003.mp4\",\"createBy\":\"\",\"createTime\":\"2024-11-22 16:52:26\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-11-28 13:39:16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 13:39:16', 10);
INSERT INTO `sys_oper_log` VALUES (175, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":105,\"caseInfo\":\"对抗投影攻击_3_白天_阴_柏油路_10kmh_stop_01\",\"caseName\":\"对抗投影攻击_3_白天_阴_柏油路_10kmh_stop_01\",\"caseType\":\"对抗投影攻击\",\"caseVideo\":\"/profile/upload/2024/11/28/对抗投影攻击_3_白天_阴_柏油路_10kmh_stop_01_20241128133936A004.mp4\",\"createBy\":\"\",\"createTime\":\"2024-11-22 16:52:31\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-11-28 13:39:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 13:39:37', 11);
INSERT INTO `sys_oper_log` VALUES (176, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":100,\"caseImage\":\"/profile/upload/2024/11/21/zju_20241121192904A002.png\",\"caseInfo\":\"攻击后可以检测到虚假目标\",\"caseName\":\"patch对抗攻击_机动车检测与识别\",\"caseType\":\"patch对抗攻击\",\"caseVideo\":\"/profile/upload/2024/11/21/视频1_20241121194430A001.mov\",\"createBy\":\"\",\"createTime\":\"2024-11-19 20:56:32\",\"params\":{},\"remark\":\"测试成功\",\"updateBy\":\"\",\"updateTime\":\"2024-11-28 13:48:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 13:48:04', 19);
INSERT INTO `sys_oper_log` VALUES (177, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":101,\"caseImage\":\"/profile/upload/2024/11/22/back_20241122163207A001.jpg\",\"caseInfo\":\"白天\",\"caseName\":\"patch对抗攻击_机动车检测与识别\",\"caseType\":\"目标消失\",\"caseVideo\":\"/profile/upload/2024/11/28/白天1_20241128134853A005.mp4\",\"createBy\":\"\",\"createTime\":\"2024-11-22 16:32:33\",\"params\":{},\"remark\":\"测试成功\",\"updateBy\":\"\",\"updateTime\":\"2024-11-28 13:48:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 13:48:56', 13);
INSERT INTO `sys_oper_log` VALUES (178, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":101,\"caseImage\":\"/profile/upload/2024/11/22/back_20241122163207A001.jpg\",\"caseInfo\":\"白天\",\"caseName\":\"patch对抗攻击_机动车检测与识别_白天·\",\"caseType\":\"目标消失\",\"caseVideo\":\"/profile/upload/2024/11/28/白天1_20241128134853A005.mp4\",\"createBy\":\"\",\"createTime\":\"2024-11-22 16:32:33\",\"params\":{},\"remark\":\"测试成功\",\"updateBy\":\"\",\"updateTime\":\"2024-11-28 13:49:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 13:49:59', 17);
INSERT INTO `sys_oper_log` VALUES (179, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":101,\"caseImage\":\"/profile/upload/2024/11/22/back_20241122163207A001.jpg\",\"caseInfo\":\"白天\",\"caseName\":\"patch对抗攻击_机动车检测与识别_白天·\",\"caseType\":\"目标消失\",\"caseVideo\":\"/profile/upload/2024/11/28/白天1_20241128135125A006.mp4\",\"createBy\":\"\",\"createTime\":\"2024-11-22 16:32:33\",\"params\":{},\"remark\":\"测试成功\",\"updateBy\":\"\",\"updateTime\":\"2024-11-28 13:51:27\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 13:51:27', 22);
INSERT INTO `sys_oper_log` VALUES (180, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":101,\"caseImage\":\"/profile/upload/2024/11/22/back_20241122163207A001.jpg\",\"caseInfo\":\"白天\",\"caseName\":\"patch对抗攻击_机动车检测与识别_白天\",\"caseType\":\"目标消失\",\"caseVideo\":\"/profile/upload/2024/11/28/白天1_20241128135125A006.mp4\",\"createBy\":\"\",\"createTime\":\"2024-11-22 16:32:33\",\"params\":{},\"remark\":\"测试成功\",\"updateBy\":\"\",\"updateTime\":\"2024-11-28 13:52:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 13:52:02', 10);
INSERT INTO `sys_oper_log` VALUES (181, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":100,\"caseImage\":\"/profile/upload/2024/11/21/zju_20241121192904A002.png\",\"caseInfo\":\"攻击后可以检测到虚假目标\",\"caseName\":\"patch对抗攻击_机动车检测与识别_夜晚\",\"caseType\":\"patch对抗攻击\",\"caseVideo\":\"/profile/upload/2024/11/21/视频1_20241121194430A001.mov\",\"createBy\":\"\",\"createTime\":\"2024-11-19 20:56:32\",\"params\":{},\"remark\":\"测试成功\",\"updateBy\":\"\",\"updateTime\":\"2024-11-28 13:52:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 13:52:14', 14);
INSERT INTO `sys_oper_log` VALUES (182, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":100,\"caseImage\":\"/profile/upload/2024/11/21/zju_20241121192904A002.png\",\"caseInfo\":\"夜晚\",\"caseName\":\"patch对抗攻击_机动车检测与识别_夜晚\",\"caseType\":\"patch对抗攻击\",\"caseVideo\":\"/profile/upload/2024/11/21/视频1_20241121194430A001.mov\",\"createBy\":\"\",\"createTime\":\"2024-11-19 20:56:32\",\"params\":{},\"remark\":\"测试成功\",\"updateBy\":\"\",\"updateTime\":\"2024-11-28 13:52:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 13:52:29', 6);
INSERT INTO `sys_oper_log` VALUES (183, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":101,\"caseImage\":\"/profile/upload/2024/11/22/back_20241122163207A001.jpg\",\"caseInfo\":\"白天\",\"caseName\":\"patch对抗攻击_机动车检测与识别_白天\",\"caseType\":\"目标消失\",\"caseVideo\":\"/profile/upload/2024/11/28/白天2_20241128135652A007.mp4\",\"createBy\":\"\",\"createTime\":\"2024-11-22 16:32:33\",\"params\":{},\"remark\":\"测试成功\",\"updateBy\":\"\",\"updateTime\":\"2024-11-28 13:56:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 13:56:54', 18);
INSERT INTO `sys_oper_log` VALUES (184, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":106,\"caseInfo\":\"\",\"caseName\":\"7\",\"caseType\":\"7\",\"caseVideo\":\"/profile/upload/2024/11/28/傍晚_20241128135721A008.mov\",\"createBy\":\"\",\"createTime\":\"2024-11-22 16:52:38\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-11-28 13:57:22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 13:57:22', 6);
INSERT INTO `sys_oper_log` VALUES (185, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":107,\"caseInfo\":\"\",\"caseName\":\"8\",\"caseType\":\"8\",\"caseVideo\":\"/profile/upload/2024/11/28/白天2_20241128135734A009.mp4\",\"createBy\":\"\",\"createTime\":\"2024-11-22 16:52:45\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-11-28 13:57:36\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 13:57:36', 13);
INSERT INTO `sys_oper_log` VALUES (186, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":107,\"caseInfo\":\"\",\"caseName\":\"8\",\"caseType\":\"8\",\"caseVideo\":\"\",\"createBy\":\"\",\"createTime\":\"2024-11-22 16:52:45\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-11-28 13:57:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 13:57:45', 19);
INSERT INTO `sys_oper_log` VALUES (187, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":101,\"caseImage\":\"/profile/upload/2024/11/22/back_20241122163207A001.jpg\",\"caseInfo\":\"白天\",\"caseName\":\"patch对抗攻击_机动车检测与识别_白天\",\"caseType\":\"目标消失\",\"caseVideo\":\"/profile/upload/2024/11/28/patch对抗攻击_白天1_20241128135912A010.mp4\",\"createBy\":\"\",\"createTime\":\"2024-11-22 16:32:33\",\"params\":{},\"remark\":\"测试成功\",\"updateBy\":\"\",\"updateTime\":\"2024-11-28 13:59:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 13:59:14', 30);
INSERT INTO `sys_oper_log` VALUES (188, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":101,\"caseImage\":\"/profile/upload/2024/11/22/back_20241122163207A001.jpg\",\"caseInfo\":\"白天\",\"caseName\":\"patch对抗攻击_机动车检测与识别_白天\",\"caseType\":\"目标消失\",\"caseVideo\":\"/profile/upload/2024/11/28/patch对抗攻击_白天2_20241128141006A011.mp4\",\"createBy\":\"\",\"createTime\":\"2024-11-22 16:32:33\",\"params\":{},\"remark\":\"测试成功\",\"updateBy\":\"\",\"updateTime\":\"2024-11-28 14:10:08\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 14:10:08', 13);
INSERT INTO `sys_oper_log` VALUES (189, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":100,\"caseImage\":\"/profile/upload/2024/11/21/zju_20241121192904A002.png\",\"caseInfo\":\"夜晚\",\"caseName\":\"patch对抗攻击_机动车检测与识别_夜晚\",\"caseType\":\"patch对抗攻击\",\"caseVideo\":\"/profile/upload/2024/11/28/patch对抗攻击_夜晚1_20241128141135A012.mp4\",\"createBy\":\"\",\"createTime\":\"2024-11-19 20:56:32\",\"params\":{},\"remark\":\"测试成功\",\"updateBy\":\"\",\"updateTime\":\"2024-11-28 14:11:36\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 14:11:36', 12);
INSERT INTO `sys_oper_log` VALUES (190, '案例库', 2, 'com.ruoyi.main.controller.MainCaseController.edit()', 'PUT', 1, 'admin', '研发部门', '/main/case', '127.0.0.1', '内网IP', '{\"caseAddress\":\"\",\"caseId\":100,\"caseImage\":\"/profile/upload/2024/11/21/zju_20241121192904A002.png\",\"caseInfo\":\"夜晚\",\"caseName\":\"patch对抗攻击_机动车检测与识别_夜晚\",\"caseType\":\"patch对抗攻击\",\"caseVideo\":\"/profile/upload/2024/11/28/patch对抗攻击_夜晚1_20241128141239A013.mp4\",\"createBy\":\"\",\"createTime\":\"2024-11-19 20:56:32\",\"params\":{},\"remark\":\"测试成功\",\"updateBy\":\"\",\"updateTime\":\"2024-11-28 14:12:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 14:12:39', 5);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-11-19 16:04:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-11-19 16:04:47', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-11-19 16:04:47', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-11-19 16:04:47', 'admin', '2024-11-21 19:13:09', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2013);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2024/11/21/avatar_20241121175139A001.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-12-09 16:13:30', 'admin', '2024-11-19 16:04:47', '', '2024-12-09 16:13:30', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-11-19 16:04:47', 'admin', '2024-11-19 16:04:47', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
