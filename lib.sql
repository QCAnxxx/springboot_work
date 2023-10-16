/*
Navicat MySQL Data Transfer

Source Server         : 192.168.79.131
Source Server Version : 50650
Source Host           : 192.168.79.131:3306
Source Database       : lib

Target Server Type    : MYSQL
Target Server Version : 50650
File Encoding         : 65001

Date: 2021-03-26 17:51:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '用户姓名',
  `password` varchar(50) NOT NULL COMMENT '用户密码',
  `phone` int(11) NOT NULL COMMENT '用户电话',
  `age` int(11) NOT NULL,
  `sex` char(1) NOT NULL COMMENT '用户性别',
  `status` int(11) NOT NULL COMMENT '用户状态 0 正常 1 不正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', '1234567891', '0', '1', '0');

-- ----------------------------
-- Table structure for `grade`
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '计科1班');
INSERT INTO `grade` VALUES ('2', '计科2班');
INSERT INTO `grade` VALUES ('4', '计科3班');
INSERT INTO `grade` VALUES ('5', '计科4班');
INSERT INTO `grade` VALUES ('6', '计科5班');
INSERT INTO `grade` VALUES ('7', '计科6班');
INSERT INTO `grade` VALUES ('8', '信管1班');

-- ----------------------------
-- Table structure for `lib`
-- ----------------------------
DROP TABLE IF EXISTS `lib`;
CREATE TABLE `lib` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '实验室名称',
  `number` varchar(20) NOT NULL COMMENT '实验室编号',
  `manager` varchar(20) NOT NULL COMMENT '实验室管理员',
  `place` varchar(256) NOT NULL COMMENT '地点',
  `quantity` int(11) NOT NULL COMMENT '实验室容纳人数',
  `remark` varchar(256) DEFAULT NULL COMMENT '实验室备注',
  `status` int(11) NOT NULL COMMENT '实验室状态 0 正常 1 未开放',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of lib
-- ----------------------------
INSERT INTO `lib` VALUES ('1', '机电实验室01', 'A101', '李永华', '行政楼对面', '80', '机电进行车床，焊接等实验', '0', '2021-03-25 16:28:05', '2021-03-25 16:28:05');
INSERT INTO `lib` VALUES ('2', '机电实验室02', 'A102', '李永华', '121212', '70', '练习', '0', '2021-03-25 16:55:12', '2021-03-25 16:55:12');
INSERT INTO `lib` VALUES ('3', '机电实验室03', 'A103', '李永华', '121212', '90', '阿巴阿巴阿巴', '0', '2021-03-25 11:37:49', '2021-03-25 11:37:49');
INSERT INTO `lib` VALUES ('4', '机电实验室04', 'A104', '李永华', '121212', '90', '阿巴阿巴阿巴', '0', '2021-03-25 11:37:57', '2021-03-25 11:37:57');
INSERT INTO `lib` VALUES ('5', '机电实验室05', 'A105', '李永华', '121212', '90', '阿巴阿巴阿巴', '0', '2021-03-25 11:38:02', '2021-03-25 11:38:02');
INSERT INTO `lib` VALUES ('6', '机电实验室06', 'A106', '李永华', '121212', '90', '阿巴阿巴阿巴', '0', '2021-03-25 11:38:07', '2021-03-25 11:38:07');
INSERT INTO `lib` VALUES ('7', '计科实验室', 'A501', '李永华', '教学楼', '80', 'java课', '0', '2021-03-25 17:00:29', '2021-03-25 17:00:29');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `url` varchar(50) NOT NULL COMMENT '菜单跳转的路径',
  `parent_id` int(11) NOT NULL COMMENT '父id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '菜单权重',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '主页', 'index.html', '0', '3');
INSERT INTO `menu` VALUES ('2', '用户管理', 'javascript:;', '0', '1');
INSERT INTO `menu` VALUES ('4', '实验室管理', '111', '0', '1');
INSERT INTO `menu` VALUES ('5', '教务管理', 'javascript:;', '0', '3');
INSERT INTO `menu` VALUES ('6', '学生管理', './user/student/index.html', '2', '0');
INSERT INTO `menu` VALUES ('7', '教师管理', './user/teacher/index.html', '2', '1');
INSERT INTO `menu` VALUES ('8', '实验室列表', './lib/index.html', '4', '0');
INSERT INTO `menu` VALUES ('9', '班级管理', './education/grade/index.html', '5', '0');
INSERT INTO `menu` VALUES ('10', '课程管理', './education/subject/index.html', '5', '1');

-- ----------------------------
-- Table structure for `reservation`
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `lib_id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `start_week` int(11) NOT NULL,
  `end_week` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `part` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0 未审核 1 已审核',
  `remark` varchar(256) NOT NULL COMMENT '通知内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES ('1', '1', '0', '3', '1', '1', '1', '1', '1', '1', '小组练习', '2021-03-25 14:30:19', '2021-03-26 16:26:46');
INSERT INTO `reservation` VALUES ('2', '2', '1', '1', '1', '1', '0', '1', '1', '0', 'C语言上机', '2021-03-26 15:59:05', '2021-03-26 16:26:24');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `grade_id` int(11) NOT NULL COMMENT '班级id',
  `sex` char(1) NOT NULL COMMENT '性别',
  `age` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '状态 0 正常 1 不正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '小明', '123456', '2', '男', '15', '0');
INSERT INTO `student` VALUES ('2', '小红', '123456', '2', '女', '17', '0');
INSERT INTO `student` VALUES ('3', '小黄', '123456', '4', '女', '19', '0');
INSERT INTO `student` VALUES ('4', '刘洋', '123456', '6', '男', '16', '0');
INSERT INTO `student` VALUES ('5', '小兰', '123456', '7', '女', '18', '0');
INSERT INTO `student` VALUES ('6', '小紫', '123456', '5', '女', '19', '0');

-- ----------------------------
-- Table structure for `subject`
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '课程名',
  `grade_id` int(11) NOT NULL COMMENT '班级id',
  `teacher_id` int(11) NOT NULL COMMENT '教师id',
  `start_week` int(11) NOT NULL COMMENT '起始周 1-20',
  `end_week` int(11) NOT NULL COMMENT '结束周 1-20',
  `day` int(11) NOT NULL COMMENT '周几 1 - 7',
  `part` int(11) NOT NULL COMMENT '节次 1-6',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('1', 'C语言', '1', '2', '1', '17', '1', '1');
INSERT INTO `subject` VALUES ('2', 'test01', '1', '3', '1', '1', '2', '1');
INSERT INTO `subject` VALUES ('3', 'test02', '4', '2', '1', '1', '3', '1');
INSERT INTO `subject` VALUES ('4', 'javaWeb', '1', '4', '1', '1', '4', '1');
INSERT INTO `subject` VALUES ('5', 'test06', '2', '2', '2', '13', '2', '2');
INSERT INTO `subject` VALUES ('6', 'java', '8', '5', '1', '9', '2', '1');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `sex` char(255) NOT NULL,
  `age` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0 正常 1 不正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('2', '张三', '123456', '111', '男', '25', '0');
INSERT INTO `teacher` VALUES ('3', '王五', '123456', '112', '男', '22', '0');
INSERT INTO `teacher` VALUES ('4', '李四', '123456', '113', '男', '23', '0');
INSERT INTO `teacher` VALUES ('5', 'java老师', '123456', '112', '男', '23', '0');
