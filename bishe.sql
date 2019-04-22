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

 Date: 22/04/2019 22:28:21
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
  `status` int(255) NULL DEFAULT NULL,
  `rule_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`add_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of add_credit_order
-- ----------------------------
INSERT INTO `add_credit_order` VALUES (4, 1, 1, 10, 1, 'A类期刊', 'qwdqdwqd');
INSERT INTO `add_credit_order` VALUES (5, 1, 2, 1, 0, '志愿者', 'qwdqdwqd');
INSERT INTO `add_credit_order` VALUES (6, 1, 3, 5, 0, '学生会会长', 'qwdqdwqd');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add add credit order', 7, 'add_addcreditorder');
INSERT INTO `auth_permission` VALUES (26, 'Can change add credit order', 7, 'change_addcreditorder');
INSERT INTO `auth_permission` VALUES (27, 'Can delete add credit order', 7, 'delete_addcreditorder');
INSERT INTO `auth_permission` VALUES (28, 'Can view add credit order', 7, 'view_addcreditorder');
INSERT INTO `auth_permission` VALUES (29, 'Can add borrow', 8, 'add_borrow');
INSERT INTO `auth_permission` VALUES (30, 'Can change borrow', 8, 'change_borrow');
INSERT INTO `auth_permission` VALUES (31, 'Can delete borrow', 8, 'delete_borrow');
INSERT INTO `auth_permission` VALUES (32, 'Can view borrow', 8, 'view_borrow');
INSERT INTO `auth_permission` VALUES (33, 'Can add borrow order', 9, 'add_borroworder');
INSERT INTO `auth_permission` VALUES (34, 'Can change borrow order', 9, 'change_borroworder');
INSERT INTO `auth_permission` VALUES (35, 'Can delete borrow order', 9, 'delete_borroworder');
INSERT INTO `auth_permission` VALUES (36, 'Can view borrow order', 9, 'view_borroworder');
INSERT INTO `auth_permission` VALUES (37, 'Can add borrow rule', 10, 'add_borrowrule');
INSERT INTO `auth_permission` VALUES (38, 'Can change borrow rule', 10, 'change_borrowrule');
INSERT INTO `auth_permission` VALUES (39, 'Can delete borrow rule', 10, 'delete_borrowrule');
INSERT INTO `auth_permission` VALUES (40, 'Can view borrow rule', 10, 'view_borrowrule');
INSERT INTO `auth_permission` VALUES (41, 'Can add certification', 11, 'add_certification');
INSERT INTO `auth_permission` VALUES (42, 'Can change certification', 11, 'change_certification');
INSERT INTO `auth_permission` VALUES (43, 'Can delete certification', 11, 'delete_certification');
INSERT INTO `auth_permission` VALUES (44, 'Can view certification', 11, 'view_certification');
INSERT INTO `auth_permission` VALUES (45, 'Can add credit', 12, 'add_credit');
INSERT INTO `auth_permission` VALUES (46, 'Can change credit', 12, 'change_credit');
INSERT INTO `auth_permission` VALUES (47, 'Can delete credit', 12, 'delete_credit');
INSERT INTO `auth_permission` VALUES (48, 'Can view credit', 12, 'view_credit');
INSERT INTO `auth_permission` VALUES (49, 'Can add cultivate plan', 13, 'add_cultivateplan');
INSERT INTO `auth_permission` VALUES (50, 'Can change cultivate plan', 13, 'change_cultivateplan');
INSERT INTO `auth_permission` VALUES (51, 'Can delete cultivate plan', 13, 'delete_cultivateplan');
INSERT INTO `auth_permission` VALUES (52, 'Can view cultivate plan', 13, 'view_cultivateplan');
INSERT INTO `auth_permission` VALUES (53, 'Can add dorm', 14, 'add_dorm');
INSERT INTO `auth_permission` VALUES (54, 'Can change dorm', 14, 'change_dorm');
INSERT INTO `auth_permission` VALUES (55, 'Can delete dorm', 14, 'delete_dorm');
INSERT INTO `auth_permission` VALUES (56, 'Can view dorm', 14, 'view_dorm');
INSERT INTO `auth_permission` VALUES (57, 'Can add instructor', 15, 'add_instructor');
INSERT INTO `auth_permission` VALUES (58, 'Can change instructor', 15, 'change_instructor');
INSERT INTO `auth_permission` VALUES (59, 'Can delete instructor', 15, 'delete_instructor');
INSERT INTO `auth_permission` VALUES (60, 'Can view instructor', 15, 'view_instructor');
INSERT INTO `auth_permission` VALUES (61, 'Can add lost history', 16, 'add_losthistory');
INSERT INTO `auth_permission` VALUES (62, 'Can change lost history', 16, 'change_losthistory');
INSERT INTO `auth_permission` VALUES (63, 'Can delete lost history', 16, 'delete_losthistory');
INSERT INTO `auth_permission` VALUES (64, 'Can view lost history', 16, 'view_losthistory');
INSERT INTO `auth_permission` VALUES (65, 'Can add major', 17, 'add_major');
INSERT INTO `auth_permission` VALUES (66, 'Can change major', 17, 'change_major');
INSERT INTO `auth_permission` VALUES (67, 'Can delete major', 17, 'delete_major');
INSERT INTO `auth_permission` VALUES (68, 'Can view major', 17, 'view_major');
INSERT INTO `auth_permission` VALUES (69, 'Can add orders', 18, 'add_orders');
INSERT INTO `auth_permission` VALUES (70, 'Can change orders', 18, 'change_orders');
INSERT INTO `auth_permission` VALUES (71, 'Can delete orders', 18, 'delete_orders');
INSERT INTO `auth_permission` VALUES (72, 'Can view orders', 18, 'view_orders');
INSERT INTO `auth_permission` VALUES (73, 'Can add penalty', 19, 'add_penalty');
INSERT INTO `auth_permission` VALUES (74, 'Can change penalty', 19, 'change_penalty');
INSERT INTO `auth_permission` VALUES (75, 'Can delete penalty', 19, 'delete_penalty');
INSERT INTO `auth_permission` VALUES (76, 'Can view penalty', 19, 'view_penalty');
INSERT INTO `auth_permission` VALUES (77, 'Can add pen appeal', 20, 'add_penappeal');
INSERT INTO `auth_permission` VALUES (78, 'Can change pen appeal', 20, 'change_penappeal');
INSERT INTO `auth_permission` VALUES (79, 'Can delete pen appeal', 20, 'delete_penappeal');
INSERT INTO `auth_permission` VALUES (80, 'Can view pen appeal', 20, 'view_penappeal');
INSERT INTO `auth_permission` VALUES (81, 'Can add products', 21, 'add_products');
INSERT INTO `auth_permission` VALUES (82, 'Can change products', 21, 'change_products');
INSERT INTO `auth_permission` VALUES (83, 'Can delete products', 21, 'delete_products');
INSERT INTO `auth_permission` VALUES (84, 'Can view products', 21, 'view_products');
INSERT INTO `auth_permission` VALUES (85, 'Can add rules', 22, 'add_rules');
INSERT INTO `auth_permission` VALUES (86, 'Can change rules', 22, 'change_rules');
INSERT INTO `auth_permission` VALUES (87, 'Can delete rules', 22, 'delete_rules');
INSERT INTO `auth_permission` VALUES (88, 'Can view rules', 22, 'view_rules');
INSERT INTO `auth_permission` VALUES (89, 'Can add scholarship', 23, 'add_scholarship');
INSERT INTO `auth_permission` VALUES (90, 'Can change scholarship', 23, 'change_scholarship');
INSERT INTO `auth_permission` VALUES (91, 'Can delete scholarship', 23, 'delete_scholarship');
INSERT INTO `auth_permission` VALUES (92, 'Can view scholarship', 23, 'view_scholarship');
INSERT INTO `auth_permission` VALUES (93, 'Can add student', 24, 'add_student');
INSERT INTO `auth_permission` VALUES (94, 'Can change student', 24, 'change_student');
INSERT INTO `auth_permission` VALUES (95, 'Can delete student', 24, 'delete_student');
INSERT INTO `auth_permission` VALUES (96, 'Can view student', 24, 'view_student');
INSERT INTO `auth_permission` VALUES (97, 'Can add student choice', 25, 'add_studentchoice');
INSERT INTO `auth_permission` VALUES (98, 'Can change student choice', 25, 'change_studentchoice');
INSERT INTO `auth_permission` VALUES (99, 'Can delete student choice', 25, 'delete_studentchoice');
INSERT INTO `auth_permission` VALUES (100, 'Can view student choice', 25, 'view_studentchoice');
INSERT INTO `auth_permission` VALUES (101, 'Can add teacher', 26, 'add_teacher');
INSERT INTO `auth_permission` VALUES (102, 'Can change teacher', 26, 'change_teacher');
INSERT INTO `auth_permission` VALUES (103, 'Can delete teacher', 26, 'delete_teacher');
INSERT INTO `auth_permission` VALUES (104, 'Can view teacher', 26, 'view_teacher');
INSERT INTO `auth_permission` VALUES (105, 'Can add teacher choice', 27, 'add_teacherchoice');
INSERT INTO `auth_permission` VALUES (106, 'Can change teacher choice', 27, 'change_teacherchoice');
INSERT INTO `auth_permission` VALUES (107, 'Can delete teacher choice', 27, 'delete_teacherchoice');
INSERT INTO `auth_permission` VALUES (108, 'Can view teacher choice', 27, 'view_teacherchoice');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES (1, '高等数学', 1, 10.00);
INSERT INTO `borrow` VALUES (2, 'python', 1, 20.00);
INSERT INTO `borrow` VALUES (3, 'SQL', 1, 20.00);
INSERT INTO `borrow` VALUES (4, '百年孤独', 1, 20.00);
INSERT INTO `borrow` VALUES (5, '论语', 0, 15.00);
INSERT INTO `borrow` VALUES (6, '孟子', 0, 15.00);
INSERT INTO `borrow` VALUES (7, '庄子', 0, 20.00);
INSERT INTO `borrow` VALUES (8, 'java', 0, 30.00);
INSERT INTO `borrow` VALUES (9, 'R', 0, 19.00);

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
  `return_status` int(255) NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`borrow_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow_order
-- ----------------------------
INSERT INTO `borrow_order` VALUES (27, 1, 1, '2019-04-09 15:50:16', '2019-04-08 15:50:16', '2019-04-09 15:54:44', 1, 10.00);
INSERT INTO `borrow_order` VALUES (28, 1, 2, '2019-04-09 15:51:54', '2019-03-08 15:51:54', '2019-04-09 15:54:42', 1, 20.00);
INSERT INTO `borrow_order` VALUES (29, 1, 3, '2019-04-09 15:51:56', '2019-02-08 15:51:56', '2019-04-09 15:54:41', 1, 20.00);
INSERT INTO `borrow_order` VALUES (30, 1, 4, '2019-04-09 15:51:58', '2019-07-08 15:51:58', '2019-04-09 15:54:40', 1, 20.00);
INSERT INTO `borrow_order` VALUES (31, 1, 5, '2019-04-09 15:51:59', '2019-07-08 15:51:59', '2019-04-09 15:54:45', 1, 15.00);
INSERT INTO `borrow_order` VALUES (32, 1, 1, '2019-04-09 15:54:52', '2019-07-08 15:54:52', '2019-04-09 15:54:56', 1, 10.00);
INSERT INTO `borrow_order` VALUES (33, 1, 2, '2019-04-09 15:54:53', '2019-07-08 15:54:53', '2019-04-09 16:10:14', 1, 20.00);
INSERT INTO `borrow_order` VALUES (34, 1, 3, '2019-04-09 15:54:54', '2019-07-08 15:54:54', '2019-04-20 13:29:47', 1, 20.00);
INSERT INTO `borrow_order` VALUES (35, 1, 4, '2019-04-20 13:27:51', '2019-04-19 13:27:51', '2019-04-21 17:06:21', 1, 20.00);
INSERT INTO `borrow_order` VALUES (36, 1, 5, '2019-04-20 13:27:52', '2019-04-19 13:27:52', '2019-04-21 17:06:22', 1, 15.00);
INSERT INTO `borrow_order` VALUES (37, 1, 6, '2019-04-20 13:27:53', '2019-07-19 13:27:53', '2019-04-21 17:06:23', 1, 15.00);
INSERT INTO `borrow_order` VALUES (38, 1, 4, '2019-04-21 20:49:46', '2019-07-20 20:49:46', NULL, 0, 20.00);

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
-- Records of borrow_rule
-- ----------------------------
INSERT INTO `borrow_rule` VALUES ('本科', 90);
INSERT INTO `borrow_rule` VALUES ('研究生', 120);

-- ----------------------------
-- Table structure for certification
-- ----------------------------
DROP TABLE IF EXISTS `certification`;
CREATE TABLE `certification`  (
  `certi_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_choice_id` int(11) NULL DEFAULT NULL,
  `status` binary(255) NULL DEFAULT NULL,
  PRIMARY KEY (`certi_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cheat
-- ----------------------------
DROP TABLE IF EXISTS `cheat`;
CREATE TABLE `cheat`  (
  `cheat_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NULL DEFAULT NULL,
  `student_choice_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cheat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cheat
-- ----------------------------
INSERT INTO `cheat` VALUES (1, 1, 5);

-- ----------------------------
-- Table structure for credit
-- ----------------------------
DROP TABLE IF EXISTS `credit`;
CREATE TABLE `credit`  (
  `status` int(255) NULL DEFAULT NULL,
  `credit_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NULL DEFAULT NULL,
  `year` year NULL DEFAULT NULL,
  `score` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`credit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of credit
-- ----------------------------
INSERT INTO `credit` VALUES (1, 1, 1, 2019, 100);
INSERT INTO `credit` VALUES (1, 2, 1, 2019, 100);
INSERT INTO `credit` VALUES (1, 3, 1, 2019, 100);
INSERT INTO `credit` VALUES (0, 4, 1, 2019, 100);

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
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用数字代表时间 如果数字有重复 则不可重复选择',
  `certification` int(255) NULL DEFAULT NULL COMMENT '是否可以被认证',
  `class` int(255) NULL DEFAULT NULL,
  `limit` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cultivate_plan
-- ----------------------------
INSERT INTO `cultivate_plan` VALUES (1, '大数据', 1, 3, 3, 1, '周一下午', 1, 1, 1);
INSERT INTO `cultivate_plan` VALUES (2, 'Python', 1, 2, 3, 2, '周三上午', 1, 1, 1);
INSERT INTO `cultivate_plan` VALUES (3, '基础会计', 3, 2, 2, 1, '周一上午', 0, 1, 2);
INSERT INTO `cultivate_plan` VALUES (4, '建模', 2, 2, 3, 2, '周五上午', 0, 1, 1);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'mybishe', 'addcreditorder');
INSERT INTO `django_content_type` VALUES (8, 'mybishe', 'borrow');
INSERT INTO `django_content_type` VALUES (9, 'mybishe', 'borroworder');
INSERT INTO `django_content_type` VALUES (10, 'mybishe', 'borrowrule');
INSERT INTO `django_content_type` VALUES (11, 'mybishe', 'certification');
INSERT INTO `django_content_type` VALUES (12, 'mybishe', 'credit');
INSERT INTO `django_content_type` VALUES (13, 'mybishe', 'cultivateplan');
INSERT INTO `django_content_type` VALUES (14, 'mybishe', 'dorm');
INSERT INTO `django_content_type` VALUES (15, 'mybishe', 'instructor');
INSERT INTO `django_content_type` VALUES (16, 'mybishe', 'losthistory');
INSERT INTO `django_content_type` VALUES (17, 'mybishe', 'major');
INSERT INTO `django_content_type` VALUES (18, 'mybishe', 'orders');
INSERT INTO `django_content_type` VALUES (19, 'mybishe', 'penalty');
INSERT INTO `django_content_type` VALUES (20, 'mybishe', 'penappeal');
INSERT INTO `django_content_type` VALUES (21, 'mybishe', 'products');
INSERT INTO `django_content_type` VALUES (22, 'mybishe', 'rules');
INSERT INTO `django_content_type` VALUES (23, 'mybishe', 'scholarship');
INSERT INTO `django_content_type` VALUES (24, 'mybishe', 'student');
INSERT INTO `django_content_type` VALUES (25, 'mybishe', 'studentchoice');
INSERT INTO `django_content_type` VALUES (26, 'mybishe', 'teacher');
INSERT INTO `django_content_type` VALUES (27, 'mybishe', 'teacherchoice');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-04-01 04:03:22.236048');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-04-01 04:03:32.353874');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-04-01 04:03:34.412578');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-04-01 04:03:34.465474');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-04-01 04:03:34.524529');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2019-04-01 04:03:35.926393');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2019-04-01 04:03:36.690710');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2019-04-01 04:03:37.628504');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2019-04-01 04:03:37.688664');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2019-04-01 04:03:38.358809');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2019-04-01 04:03:38.401319');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2019-04-01 04:03:38.453874');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2019-04-01 04:03:39.335887');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2019-04-01 04:03:40.701335');
INSERT INTO `django_migrations` VALUES (15, 'mybishe', '0001_initial', '2019-04-01 04:03:40.836457');
INSERT INTO `django_migrations` VALUES (16, 'sessions', '0001_initial', '2019-04-01 04:03:41.482670');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('2fyfvcvhhx6mcurm88dlevtj8ereepfe', 'MjQ2Y2YyOThmNDlhNzdlODFjMGEzZjc3M2EzYzY2MDhlN2U2MmFiODp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6Inl5aCIsInN0dV9uYW1lIjoieXloIiwic3R1X2lkIjoxfQ==', '2019-04-15 07:49:56.194934');
INSERT INTO `django_session` VALUES ('3e1x3hi160k89ghe9pcfmjbwp7po9e46', 'YTIyY2VmZjE0MzdhOTRiNGY4OTA2NGQ1MTcwYTQ3Y2RlNjQ5YTU4ZTp7InRlYWNoZXJfbmFtZSI6Inp4ZCIsInRlYWNoZXJfaWQiOjEsInN0dV9uYW1lIjoieHhjIiwic3R1X2lkIjoyfQ==', '2019-04-20 08:30:11.685330');
INSERT INTO `django_session` VALUES ('8akuwfn5lw0c4na5ykkwj8y8lxsusd5t', 'ZmUzMDI4ZGQ1NzA3NGM5MzU2MWNmNTU2Mjg2MjljNDU0N2VmNTJjMzp7Imluc3RydWN0b3JfbmFtZSI6Ilx1OGY4NVx1NWJmY1x1NTQ1ODEiLCJpbnN0cnVjdG9yX2lkIjoxLCJ0ZWFjaGVyX25hbWUiOiJ6eGQiLCJ0ZWFjaGVyX2lkIjoxLCJzdHVfbmFtZSI6Inl5aCIsInN0dV9pZCI6MX0=', '2019-04-16 13:05:25.282626');
INSERT INTO `django_session` VALUES ('a6gnwg09qll5vglulkmzgidb1sb5fk1a', 'Njk4OTlmN2FjMjNiZWQxY2M2Yjk1MzA2YTYxZTExNDIwYzk5NDBhNjp7InRlYWNoZXJfbmFtZSI6Inp4ZCIsInRlYWNoZXJfaWQiOjF9', '2019-04-16 08:12:45.467745');
INSERT INTO `django_session` VALUES ('gkvnkxpy9iyox5mhfpy6r2kztsurc3zo', 'Njk4OTlmN2FjMjNiZWQxY2M2Yjk1MzA2YTYxZTExNDIwYzk5NDBhNjp7InRlYWNoZXJfbmFtZSI6Inp4ZCIsInRlYWNoZXJfaWQiOjF9', '2019-04-16 13:20:52.550860');
INSERT INTO `django_session` VALUES ('no5bn0hmjdz4uj5lkthglhny0h9mvsb8', 'YmE3YWRhNDk3YTM1ZTQ4NmUwYWRjYWVlNjFjZTk0YjJkODU1NTlmYzp7InRlYWNoZXJfbmFtZSI6Inp4ZCIsInRlYWNoZXJfaWQiOjEsInN0dV9uYW1lIjoieXloIiwic3R1X2lkIjoxLCJpbnN0cnVjdG9yX25hbWUiOiJcdThmODVcdTViZmNcdTU0NTgxIiwiaW5zdHJ1Y3Rvcl9pZCI6MX0=', '2019-04-23 21:27:55.550042');
INSERT INTO `django_session` VALUES ('qmr4tqdbmfeugyhjpwe387xfl9resoil', 'YmE3YWRhNDk3YTM1ZTQ4NmUwYWRjYWVlNjFjZTk0YjJkODU1NTlmYzp7InRlYWNoZXJfbmFtZSI6Inp4ZCIsInRlYWNoZXJfaWQiOjEsInN0dV9uYW1lIjoieXloIiwic3R1X2lkIjoxLCJpbnN0cnVjdG9yX25hbWUiOiJcdThmODVcdTViZmNcdTU0NTgxIiwiaW5zdHJ1Y3Rvcl9pZCI6MX0=', '2019-05-06 15:16:56.594862');
INSERT INTO `django_session` VALUES ('vgx7be0tl5ku47i3a2k4pug90ymf70wj', 'ZWJlMjk2MjM5YTUyY2QwMzliNTA0NjBiNzIzNWFmNjgzZTI5YmJjOTp7InN0dV9uYW1lIjoieXloIiwic3R1X2lkIjoxLCJ0ZWFjaGVyX25hbWUiOiJ6eGQiLCJ0ZWFjaGVyX2lkIjoxLCJpbnN0cnVjdG9yX25hbWUiOiJcdThmODVcdTViZmNcdTU0NTgxIiwiaW5zdHJ1Y3Rvcl9pZCI6MX0=', '2019-04-16 03:07:47.777296');

-- ----------------------------
-- Table structure for instructor
-- ----------------------------
DROP TABLE IF EXISTS `instructor`;
CREATE TABLE `instructor`  (
  `instructor_id` int(11) NOT NULL AUTO_INCREMENT,
  `instructor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `instructor_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`instructor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of instructor
-- ----------------------------
INSERT INTO `instructor` VALUES (1, '辅导员1', '000');
INSERT INTO `instructor` VALUES (2, '辅导员2', '000');

-- ----------------------------
-- Table structure for job_certification
-- ----------------------------
DROP TABLE IF EXISTS `job_certification`;
CREATE TABLE `job_certification`  (
  `status` int(255) NULL DEFAULT NULL,
  `stu_id` int(11) NULL DEFAULT NULL,
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `days` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_certification
-- ----------------------------
INSERT INTO `job_certification` VALUES (1, 1, 2, 'lalall', 9);
INSERT INTO `job_certification` VALUES (0, 1, 14, '数据分析师', 90);

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `major_id` int(11) NOT NULL AUTO_INCREMENT,
  `major_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`major_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, '信管');
INSERT INTO `major` VALUES (2, '管科');
INSERT INTO `major` VALUES (3, '会计');

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
  `received` int(255) NULL DEFAULT NULL,
  `seller_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `buyer_id`(`buyer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, 1, 100, 100, 3999, 1, 1);
INSERT INTO `orders` VALUES (2, 4, 1, NULL, NULL, 5999, 1, 1);
INSERT INTO `orders` VALUES (3, 7, 1, NULL, NULL, 399, 0, 1);

-- ----------------------------
-- Table structure for pen_appeal
-- ----------------------------
DROP TABLE IF EXISTS `pen_appeal`;
CREATE TABLE `pen_appeal`  (
  `pen_appeal_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_pen_id` int(11) NULL DEFAULT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`pen_appeal_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pen_appeal
-- ----------------------------
INSERT INTO `pen_appeal` VALUES (3, 8, 1, 1);
INSERT INTO `pen_appeal` VALUES (4, 8, 1, 0);

-- ----------------------------
-- Table structure for penalty
-- ----------------------------
DROP TABLE IF EXISTS `penalty`;
CREATE TABLE `penalty`  (
  `stu_pen_id` int(255) NOT NULL AUTO_INCREMENT,
  `pen_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `borrow_id` int(11) NULL DEFAULT NULL,
  `pen_money` int(255) NULL DEFAULT NULL,
  `paid` int(11) NULL DEFAULT NULL,
  `appeal` int(255) NULL DEFAULT NULL,
  `stu_id` int(11) NULL DEFAULT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`stu_pen_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of penalty
-- ----------------------------
INSERT INTO `penalty` VALUES (6, '逾期', 29, 60, 1, 0, 1, NULL);
INSERT INTO `penalty` VALUES (7, '逾期', 28, 32, 1, 0, 1, NULL);
INSERT INTO `penalty` VALUES (8, '逾期', 27, 1, 0, 1, 1, NULL);
INSERT INTO `penalty` VALUES (9, '丢书', 32, 10, NULL, NULL, 1, NULL);
INSERT INTO `penalty` VALUES (10, '丢书', 33, 20, NULL, NULL, 1, NULL);
INSERT INTO `penalty` VALUES (11, '丢书', 33, 20, NULL, NULL, 1, NULL);
INSERT INTO `penalty` VALUES (12, '丢书', 33, 20, NULL, NULL, 1, NULL);
INSERT INTO `penalty` VALUES (13, '丢书', 33, 20, NULL, NULL, 1, NULL);
INSERT INTO `penalty` VALUES (14, '丢书', 33, 20, NULL, NULL, 1, NULL);
INSERT INTO `penalty` VALUES (15, '丢书', 34, 20, NULL, NULL, 1, NULL);
INSERT INTO `penalty` VALUES (16, '逾期', 35, 2, 0, 0, 1, NULL);
INSERT INTO `penalty` VALUES (17, '逾期', 36, 2, 0, 0, 1, NULL);

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
  `status` int(255) NULL DEFAULT NULL,
  `paid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`pro_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'iPhone', 5999, 3999, 1, '操场', 1, 1);
INSERT INTO `products` VALUES (4, 'iPhone XR', 8999, 5999, 1, '南校', 1, 1);
INSERT INTO `products` VALUES (6, 'iphone XS', 8999, 6999, 1, '南校', 1, 0);
INSERT INTO `products` VALUES (7, 'blabla', 599, 399, 1, '教超', 1, 1);
INSERT INTO `products` VALUES (8, 'iphone XR', 8999, 6999, 1, '教超', 1, 0);

-- ----------------------------
-- Table structure for rules
-- ----------------------------
DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules`  (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `score` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`rule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rules
-- ----------------------------
INSERT INTO `rules` VALUES (1, 'A类期刊', 10);
INSERT INTO `rules` VALUES (2, '志愿者', 1);
INSERT INTO `rules` VALUES (3, '学生会会长', 5);

-- ----------------------------
-- Table structure for scholarship
-- ----------------------------
DROP TABLE IF EXISTS `scholarship`;
CREATE TABLE `scholarship`  (
  `sch_id` int(255) NOT NULL AUTO_INCREMENT,
  `stu_id` int(255) NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL,
  `money` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`sch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scholarship
-- ----------------------------
INSERT INTO `scholarship` VALUES (4, 2, 0, 1000);
INSERT INTO `scholarship` VALUES (5, 3, 0, 700);
INSERT INTO `scholarship` VALUES (6, 1, 1, 400);

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
  PRIMARY KEY (`stu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '000', 'yyh', 2015, 1, 7877, '本科', 101, 1, 1);
INSERT INTO `student` VALUES (2, '000', 'xxc', 2015, 1, 100, '本科', 201, 2, 1);
INSERT INTO `student` VALUES (3, '000', 'tjy', 2015, 1, 100, '本科', 102, 1, 1);
INSERT INTO `student` VALUES (4, '000', 'ljh', 2015, 1, 100, '本科', 202, 2, 1);

-- ----------------------------
-- Table structure for student_choice
-- ----------------------------
DROP TABLE IF EXISTS `student_choice`;
CREATE TABLE `student_choice`  (
  `student_choice_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_choice_id` int(11) NULL DEFAULT NULL,
  `score` int(255) NULL DEFAULT NULL,
  `stu_id` int(11) NULL DEFAULT NULL,
  `course_id` int(11) NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`student_choice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_choice
-- ----------------------------
INSERT INTO `student_choice` VALUES (1, 1, 100, 1, 1, 1);
INSERT INTO `student_choice` VALUES (2, 13, 100, 1, 2, 1);
INSERT INTO `student_choice` VALUES (3, 1, 100, 2, 1, 0);
INSERT INTO `student_choice` VALUES (4, 14, 100, 1, 3, 1);
INSERT INTO `student_choice` VALUES (6, 1, 87, 3, 1, 0);
INSERT INTO `student_choice` VALUES (7, 13, 98, 3, 2, 0);
INSERT INTO `student_choice` VALUES (8, 14, 78, 3, 3, 0);
INSERT INTO `student_choice` VALUES (9, 1, 70, 4, 1, 0);
INSERT INTO `student_choice` VALUES (10, 13, 87, 4, 2, 0);
INSERT INTO `student_choice` VALUES (11, 14, 66, 4, 3, 0);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `tea_id` int(255) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `major_id` int(255) NULL DEFAULT NULL,
  `tea_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`tea_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 'zxd', 1, '000');

-- ----------------------------
-- Table structure for teacher_choice
-- ----------------------------
DROP TABLE IF EXISTS `teacher_choice`;
CREATE TABLE `teacher_choice`  (
  `teacher_choice_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `course_id` int(11) NULL DEFAULT NULL,
  `course_year` year NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL,
  `time` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `certification` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`teacher_choice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher_choice
-- ----------------------------
INSERT INTO `teacher_choice` VALUES (1, 1, 1, 2018, 0, '周一下午', 1);
INSERT INTO `teacher_choice` VALUES (13, 1, 2, 2019, 0, '周三上午', 1);
INSERT INTO `teacher_choice` VALUES (14, 1, 3, 2019, 0, '周一上午', 0);
INSERT INTO `teacher_choice` VALUES (15, 1, 4, 2019, 0, '周五上午', 0);

SET FOREIGN_KEY_CHECKS = 1;
