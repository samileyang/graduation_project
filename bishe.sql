/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : bishe

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 21/01/2019 22:20:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cert_order
-- ----------------------------
DROP TABLE IF EXISTS `cert_order`;
CREATE TABLE `cert_order`  (
  `cert_order_id` int(255) NOT NULL AUTO_INCREMENT,
  `ins_id` int(255) NULL DEFAULT NULL,
  `cert_id` int(255) NULL DEFAULT NULL,
  `cert_score` int(255) NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL COMMENT '是否完成认证',
  PRIMARY KEY (`cert_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cert_tpye
-- ----------------------------
DROP TABLE IF EXISTS `cert_tpye`;
CREATE TABLE `cert_tpye`  (
  `cert_id` int(255) NOT NULL AUTO_INCREMENT,
  `cert_name` int(255) NULL DEFAULT NULL,
  `cert_score` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`cert_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for classroom
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom`  (
  `classroom_id` int(255) NOT NULL AUTO_INCREMENT,
  `classroom_num` int(255) NULL DEFAULT NULL,
  `classroom_max` int(255) NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL COMMENT '教室是否可用',
  PRIMARY KEY (`classroom_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` int(255) NOT NULL AUTO_INCREMENT,
  `stu_myid` int(255) NULL DEFAULT NULL,
  `stu_aimid` int(255) NULL DEFAULT NULL,
  `score` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for culti_plan
-- ----------------------------
DROP TABLE IF EXISTS `culti_plan`;
CREATE TABLE `culti_plan`  (
  `course_id` int(255) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `tech_cert` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for final_schedule
-- ----------------------------
DROP TABLE IF EXISTS `final_schedule`;
CREATE TABLE `final_schedule`  (
  `final_id` int(255) NOT NULL AUTO_INCREMENT,
  `course_id` int(255) NULL DEFAULT NULL,
  `student_id` int(255) NULL DEFAULT NULL,
  `teacher_id` int(255) NULL DEFAULT NULL,
  `classroom_id` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`final_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gpa
-- ----------------------------
DROP TABLE IF EXISTS `gpa`;
CREATE TABLE `gpa`  (
  `score_id` int(255) NOT NULL AUTO_INCREMENT,
  `student_id` int(255) NULL DEFAULT NULL,
  `course_id` int(255) NULL DEFAULT NULL,
  `teacher_id` int(255) NULL DEFAULT NULL,
  `score` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`score_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for instructor
-- ----------------------------
DROP TABLE IF EXISTS `instructor`;
CREATE TABLE `instructor`  (
  `instructor_id` int(255) NOT NULL AUTO_INCREMENT,
  `instructor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `instructor_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`instructor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `pro_id` int(255) NOT NULL AUTO_INCREMENT,
  `pro_price` int(255) NULL DEFAULT NULL,
  `pro_amount` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`pro_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mkt_order
-- ----------------------------
DROP TABLE IF EXISTS `mkt_order`;
CREATE TABLE `mkt_order`  (
  `mkt_order_id` int(255) NOT NULL AUTO_INCREMENT,
  `pro_id` int(255) NULL DEFAULT NULL,
  `student_id` int(255) NULL DEFAULT NULL,
  `amount` int(255) NULL DEFAULT NULL,
  `final_price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`mkt_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for poor_cert
-- ----------------------------
DROP TABLE IF EXISTS `poor_cert`;
CREATE TABLE `poor_cert`  (
  `poor_id` int(255) NOT NULL AUTO_INCREMENT,
  `student_id` int(255) NULL DEFAULT NULL,
  `refund` int(255) NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL COMMENT '学生是否确认领取',
  PRIMARY KEY (`poor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for scholarship
-- ----------------------------
DROP TABLE IF EXISTS `scholarship`;
CREATE TABLE `scholarship`  (
  `scholarship_id` int(255) NOT NULL,
  `student_id` int(255) NULL DEFAULT NULL,
  `money` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`scholarship_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stu_choice
-- ----------------------------
DROP TABLE IF EXISTS `stu_choice`;
CREATE TABLE `stu_choice`  (
  `choose_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `status` int(255) NOT NULL COMMENT '是否完成教室安排',
  PRIMARY KEY (`choose_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `stu_id` int(255) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `stu_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `stu_money` int(255) NULL DEFAULT NULL,
  `stu_instructor` int(255) NULL DEFAULT NULL,
  `stu_room` int(255) NULL DEFAULT NULL,
  `stu_credit` int(255) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  PRIMARY KEY (`stu_id`) USING BTREE,
  INDEX `stu_instructor`(`stu_instructor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers`  (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `teacher_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
