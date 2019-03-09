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

 Date: 09/03/2019 14:56:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for add_credit_order
-- ----------------------------
DROP TABLE IF EXISTS `add_credit_order`;
CREATE TABLE `add_credit_order`  (
  `add_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NULL DEFAULT NULL,
  `rule_id` int(11) NULL DEFAULT NULL,
  `score` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`add_id`) USING BTREE,
  INDEX `stu_id`(`stu_id`) USING BTREE,
  INDEX `rule_id`(`rule_id`) USING BTREE,
  CONSTRAINT `add_credit_order_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `add_credit_order_ibfk_2` FOREIGN KEY (`rule_id`) REFERENCES `rules` (`rule_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `status` binary(255) NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for borrow_order
-- ----------------------------
DROP TABLE IF EXISTS `borrow_order`;
CREATE TABLE `borrow_order`  (
  `borrow_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NULL DEFAULT NULL,
  `book_id` int(11) NULL DEFAULT NULL,
  `startdate` datetime(0) NULL DEFAULT NULL,
  `supposedate` datetime(0) NULL DEFAULT NULL,
  `actdate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`borrow_id`) USING BTREE,
  INDEX `stu_id`(`stu_id`) USING BTREE,
  INDEX `book_id`(`book_id`) USING BTREE,
  CONSTRAINT `borrow_order_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrow_order_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `borrow` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for borrow_rule
-- ----------------------------
DROP TABLE IF EXISTS `borrow_rule`;
CREATE TABLE `borrow_rule`  (
  `education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `day` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`education`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for certification
-- ----------------------------
DROP TABLE IF EXISTS `certification`;
CREATE TABLE `certification`  (
  `certi_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_choice_id` int(11) NULL DEFAULT NULL,
  `status` binary(255) NULL DEFAULT NULL,
  PRIMARY KEY (`certi_id`) USING BTREE,
  INDEX `student_choice_id`(`student_choice_id`) USING BTREE,
  CONSTRAINT `certification_ibfk_1` FOREIGN KEY (`student_choice_id`) REFERENCES `student_choice` (`student_choice_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for classroom
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom`  (
  `classroom_id` int(11) NOT NULL AUTO_INCREMENT,
  `size` int(11) NULL DEFAULT NULL,
  `status` binary(255) NULL DEFAULT NULL,
  PRIMARY KEY (`classroom_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for credit
-- ----------------------------
DROP TABLE IF EXISTS `credit`;
CREATE TABLE `credit`  (
  `credit_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NULL DEFAULT NULL,
  `year` year NULL DEFAULT NULL,
  `score` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`credit_id`) USING BTREE,
  INDEX `stu_id`(`stu_id`) USING BTREE,
  CONSTRAINT `credit_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cultivate_plan
-- ----------------------------
DROP TABLE IF EXISTS `cultivate_plan`;
CREATE TABLE `cultivate_plan`  (
  `course_id` int(255) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `major_id` int(255) NULL DEFAULT NULL,
  `credit` int(255) NULL DEFAULT NULL,
  `grade` int(255) NULL DEFAULT NULL,
  `semester` int(255) NULL DEFAULT NULL,
  `time` int(255) NULL DEFAULT NULL COMMENT '用数字代表时间 如果数字有重复 则不可重复选择',
  `certification` binary(255) NULL DEFAULT NULL COMMENT '是否可以被认证',
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dorm
-- ----------------------------
DROP TABLE IF EXISTS `dorm`;
CREATE TABLE `dorm`  (
  `bed_id` int(255) NOT NULL AUTO_INCREMENT,
  `dorm_id` int(255) NOT NULL,
  `status` binary(255) NULL DEFAULT NULL,
  PRIMARY KEY (`bed_id`, `dorm_id`) USING BTREE,
  INDEX `bed_id`(`bed_id`) USING BTREE,
  INDEX `dorm_id`(`dorm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for instructor
-- ----------------------------
DROP TABLE IF EXISTS `instructor`;
CREATE TABLE `instructor`  (
  `instructor_id` int(11) NOT NULL AUTO_INCREMENT,
  `instructor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`instructor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lost_history
-- ----------------------------
DROP TABLE IF EXISTS `lost_history`;
CREATE TABLE `lost_history`  (
  `lost_id` int(11) NOT NULL AUTO_INCREMENT,
  `borrow_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`lost_id`) USING BTREE,
  INDEX `borrow_id`(`borrow_id`) USING BTREE,
  CONSTRAINT `lost_history_ibfk_1` FOREIGN KEY (`borrow_id`) REFERENCES `borrow_order` (`borrow_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `major_id` int(11) NOT NULL AUTO_INCREMENT,
  `major_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`major_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NULL DEFAULT NULL,
  `buyer_id` int(11) NULL DEFAULT NULL,
  `seller_comm` int(255) NULL DEFAULT NULL,
  `buyer_comm` int(255) NULL DEFAULT NULL,
  `price` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `buyer_id`(`buyer_id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`pro_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `student` (`stu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for penalty
-- ----------------------------
DROP TABLE IF EXISTS `penalty`;
CREATE TABLE `penalty`  (
  `stu_pen_id` int(255) NOT NULL AUTO_INCREMENT,
  `borrow_id` int(11) NULL DEFAULT NULL,
  `pen_money` int(255) NULL DEFAULT NULL,
  `education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`stu_pen_id`) USING BTREE,
  INDEX `stu_id`(`borrow_id`) USING BTREE,
  INDEX `education`(`education`) USING BTREE,
  CONSTRAINT `penalty_ibfk_1` FOREIGN KEY (`borrow_id`) REFERENCES `student` (`stu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `penalty_ibfk_2` FOREIGN KEY (`education`) REFERENCES `borrow_rule` (`education`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `price_org` int(255) NULL DEFAULT NULL,
  `price_cur` int(255) NULL DEFAULT NULL,
  `seller_id` int(11) NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `status` binary(255) NULL DEFAULT NULL,
  PRIMARY KEY (`pro_id`) USING BTREE,
  INDEX `seller_id`(`seller_id`) USING BTREE,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `student` (`stu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for roommate_comment
-- ----------------------------
DROP TABLE IF EXISTS `roommate_comment`;
CREATE TABLE `roommate_comment`  (
  `comm_id` int(11) NOT NULL AUTO_INCREMENT,
  `dorm_id` int(11) NULL DEFAULT NULL,
  `comm_maker_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `score` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`comm_id`) USING BTREE,
  INDEX `dorm_id`(`dorm_id`) USING BTREE,
  INDEX `comm_maker_id`(`comm_maker_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  CONSTRAINT `roommate_comment_ibfk_2` FOREIGN KEY (`comm_maker_id`) REFERENCES `student` (`stu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `roommate_comment_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `student` (`stu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rules
-- ----------------------------
DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules`  (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `score` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`rule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for scholarship
-- ----------------------------
DROP TABLE IF EXISTS `scholarship`;
CREATE TABLE `scholarship`  (
  `sch_id` int(255) NOT NULL AUTO_INCREMENT,
  `student_choice_id` int(255) NULL DEFAULT NULL,
  `status` binary(255) NULL DEFAULT NULL,
  `stu_comm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`sch_id`) USING BTREE,
  INDEX `student_choice_id`(`student_choice_id`) USING BTREE,
  CONSTRAINT `scholarship_ibfk_1` FOREIGN KEY (`student_choice_id`) REFERENCES `student_choice` (`student_choice_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `stu_id` int(255) NOT NULL AUTO_INCREMENT,
  `stu_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `stu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `stu_year` year NULL DEFAULT NULL,
  `major_id` int(255) NULL DEFAULT NULL,
  `money` int(255) NULL DEFAULT NULL,
  `stu_edu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `bed_id` int(255) NULL DEFAULT NULL,
  `dorm_id` int(255) NULL DEFAULT NULL,
  `instructor_id` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`stu_id`) USING BTREE,
  INDEX `major_id`(`major_id`) USING BTREE,
  INDEX `dorm_id`(`dorm_id`) USING BTREE,
  INDEX `instructor_id`(`instructor_id`) USING BTREE,
  INDEX `stu_id`(`stu_id`) USING BTREE,
  INDEX `stu_edu`(`stu_edu`) USING BTREE,
  INDEX `bed_id`(`bed_id`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_ibfk_3` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_ibfk_4` FOREIGN KEY (`stu_edu`) REFERENCES `borrow_rule` (`education`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_ibfk_5` FOREIGN KEY (`bed_id`) REFERENCES `dorm` (`bed_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_ibfk_6` FOREIGN KEY (`dorm_id`) REFERENCES `dorm` (`dorm_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student_choice
-- ----------------------------
DROP TABLE IF EXISTS `student_choice`;
CREATE TABLE `student_choice`  (
  `student_choice_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_choice_id` int(11) NULL DEFAULT NULL,
  `score` int(255) NULL DEFAULT NULL,
  `stu_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`student_choice_id`) USING BTREE,
  INDEX `teacher_choice_id`(`teacher_choice_id`) USING BTREE,
  INDEX `stu_id`(`stu_id`) USING BTREE,
  CONSTRAINT `student_choice_ibfk_1` FOREIGN KEY (`teacher_choice_id`) REFERENCES `teacher_choice` (`teacher_choice_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_choice_ibfk_2` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `tea_id` int(255) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `major_id` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`tea_id`) USING BTREE,
  INDEX `major_id`(`major_id`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teacher_choice
-- ----------------------------
DROP TABLE IF EXISTS `teacher_choice`;
CREATE TABLE `teacher_choice`  (
  `teacher_choice_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `course_id` int(11) NULL DEFAULT NULL,
  `course_year` year NULL DEFAULT NULL,
  `status` binary(255) NULL DEFAULT NULL,
  `classroom` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`teacher_choice_id`) USING BTREE,
  INDEX `teacher_id`(`teacher_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `classroom`(`classroom`) USING BTREE,
  CONSTRAINT `teacher_choice_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`tea_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `teacher_choice_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `cultivate_plan` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `teacher_choice_ibfk_3` FOREIGN KEY (`classroom`) REFERENCES `classroom` (`classroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
