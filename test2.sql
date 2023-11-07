/*
 Navicat Premium Data Transfer

 Source Server         : heaven
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : test2

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 25/05/2022 13:14:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户姓名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户密码',
  `phone` int NOT NULL COMMENT '用户电话',
  `age` int NOT NULL,
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户性别',
  `status` int NOT NULL COMMENT '用户状态 0 正常 1 不正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (100, 'admin', 'admin', 1234567891, 0, '1', 0);

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
  USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;
INSERT INTO `grade` VALUES (1, '计科1班');
INSERT INTO `grade` VALUES (2, '计科2班');
INSERT INTO `grade` VALUES (4, '计科3班');
INSERT INTO `grade` VALUES (5, '计科4班');
INSERT INTO `grade` VALUES (6, '计科5班');
INSERT INTO `grade` VALUES (7, '计科6班');
INSERT INTO `grade` VALUES (8, '信管1班');

-- ----------------------------
-- Table structure for lib
-- ----------------------------
DROP TABLE IF EXISTS `lib`;
CREATE TABLE `lib`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '实验室名称',
  `number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '实验室编号',
  `manager` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '实验室管理员',
  `place` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地点',
  `quantity` int NOT NULL COMMENT '实验室容纳人数',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '实验室备注',
  `status` int NOT NULL COMMENT '实验室状态 0 正常 1 未开放',
  `create_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lib
-- ----------------------------
INSERT INTO `lib` VALUES (1, '机电实验室01', 'A101', '李嘉骏', '行政楼对面', 80, '机电进行车床，焊接等实验', 0, '2021-03-25 16:28:05', '2022-05-22 11:32:43');
INSERT INTO `lib` VALUES (2, '机电实验室02', 'A102', '李嘉骏', '121212', 70, '练习', 0, '2021-03-25 16:55:12', '2022-05-22 11:32:44');
INSERT INTO `lib` VALUES (3, '机电实验室03', 'A103', '李嘉骏', '121212', 90, '实验课', 0, NULL, '2022-05-22 11:32:45');
INSERT INTO `lib` VALUES (4, '机电实验室04', 'A104', '李嘉骏', '121212', 90, '实验课', 0, NULL, '2022-05-22 11:32:46');
INSERT INTO `lib` VALUES (5, '机电实验室05', 'A105', '李嘉骏', '121212', 90, '实验课', 0, NULL, '2022-05-22 11:32:48');
INSERT INTO `lib` VALUES (6, '机电实验室06', 'A106', '李嘉骏', '121212', 90, '实验课', 0, NULL, '2022-05-22 11:32:54');
INSERT INTO `lib` VALUES (7, '计科实验室', 'A501', '李嘉骏', '教学楼', 80, 'java课', 0, '2021-03-25 17:00:29', '2022-05-22 11:32:59');

-- ----------------------------
-- Table structure for menu
-- ----------------------------

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单跳转的路径',
  `parent_id` int NOT NULL COMMENT '父id',
  `sort` int NOT NULL DEFAULT 0 COMMENT '菜单权重',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;
-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '主页', 'index.html', 0, 3);
INSERT INTO `menu` VALUES (2, '用户管理', '', 0, 1);
INSERT INTO `menu` VALUES (4, '实验室管理', '', 0, 1);
INSERT INTO `menu` VALUES (5, '教务管理', '', 0, 3);
INSERT INTO `menu` VALUES (6, '学生管理', './user/student/index.html', 2, 0);
INSERT INTO `menu` VALUES (7, '教师管理', './user/teacher/index.html', 2, 1);
INSERT INTO `menu` VALUES (8, '实验室列表', './lib/index.html', 4, 0);
INSERT INTO `menu` VALUES (9, '班级管理', './education/grade/index.html', 5, 0);
INSERT INTO `menu` VALUES (10, '课程管理', './education/subject/index.html', 5, 1);
INSERT INTO `menu` VALUES (11, '通知管理', '', 0, 1);
INSERT INTO `menu` VALUES (12, '通知管理', './announcement/adminIndex.html', 11, 1);



-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type` int NOT NULL,
  `lib_id` int NOT NULL,
  `grade_id` int NOT NULL,
  `start_week` int NOT NULL,
  `end_week` int NOT NULL,
  `day` int NOT NULL,
  `part` int NOT NULL,
  `status` int NOT NULL DEFAULT 0 COMMENT '0 未审核 1 已审核',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '通知内容',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES (6, 3, 1, 1, 0, 1, 0, 1, 1, 1, '111', NULL, NULL);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade_id` int NOT NULL COMMENT '班级id',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '性别',
  `age` int NOT NULL,
  `status` int NOT NULL COMMENT '状态 0 正常 1 不正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '小安', '123456', 0 ,'男', 30, 0);
INSERT INTO `student` VALUES (2, '小红', '123456', 2, '女', 17, 0);
INSERT INTO `student` VALUES (3, '小黄', '123456', 4, '女', 19, 0);
INSERT INTO `student` VALUES (4, '刘洋', '123456', 6, '男', 16, 0);
INSERT INTO `student` VALUES (5, '小兰', '123456', 7, '女', 18, 0);
INSERT INTO `student` VALUES (6, '小紫', '123456', 5, '女', 19, 0);
INSERT INTO `student` VALUES (7, '李五', '123456', 7, '男', 22, 0);

ALTER TABLE student
ADD CONSTRAINT adStu
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);


-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '课程名',
  `grade_id` int NOT NULL COMMENT '班级id',
  `teacher_id` int NOT NULL COMMENT '教师id',
  `start_week` int NOT NULL COMMENT '起始周 1-20',
  `end_week` int NOT NULL COMMENT '结束周 1-20',
  `day` int NOT NULL COMMENT '周几 1 - 7',
  `part` int NOT NULL COMMENT '节次 1-6',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, 'C语言', 1, 2, 1, 17, 1, 1);
INSERT INTO `subject` VALUES (2, 'test01', 1, 3, 1, 1, 2, 1);
INSERT INTO `subject` VALUES (3, 'test02', 4, 2, 1, 1, 3, 1);
INSERT INTO `subject` VALUES (4, 'javaWeb', 1, 4, 1, 1, 4, 1);
INSERT INTO `subject` VALUES (5, 'test06', 2, 2, 2, 13, 2, 2);
INSERT INTO `subject` VALUES (6, 'java', 8, 1, 1, 9, 2, 1);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int NOT NULL,
  `sex` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int NOT NULL,
  `status` int NOT NULL DEFAULT 0 COMMENT '状态 0 正常 1 不正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '张三', '123456', 111, '男', 25, 0);
INSERT INTO `teacher` VALUES (2, '王五', '123456', 112, '男', 22, 0);
INSERT INTO `teacher` VALUES (3, '李四', '123456', 113, '男', 23, 0);
INSERT INTO `teacher` VALUES (4, 'java老师', '123456', 112, '男', 23, 0);
INSERT INTO `teacher` VALUES (5, 'c语言老师', '123456', 123, '女', 23, 0);
INSERT INTO `teacher` VALUES (6, '李二', '123456', 123, '男', 22, 0);

SET FOREIGN_KEY_CHECKS = 1;

DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
    `id` int NOT NULL AUTO_INCREMENT,
    `content` varchar(700) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `release_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

INSERT INTO `announcement` VALUES (1,'今日xxx实验室因设备安装无法进行预约','2023-10-20');
INSERT INTO `announcement` VALUES (2, '2023-10-27 有关部门将进行实验室安全检查，固当日全天不开放','2023-10-22');
INSERT INTO `announcement` VALUES ('2023-10-39 xxx实验室不开放');