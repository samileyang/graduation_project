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

 Date: 20/05/2019 20:30:21
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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of add_credit_order
-- ----------------------------
INSERT INTO `add_credit_order` VALUES (7, 1, 1, 10, 1, 'A类期刊一作', 'qwdqdwqd');
INSERT INTO `add_credit_order` VALUES (8, 1, 12, 5, 1, '口笔译', 'qwdqdwqd');
INSERT INTO `add_credit_order` VALUES (9, 3, 13, 1, 1, '普通话等级', 'qwdqdwqd');
INSERT INTO `add_credit_order` VALUES (10, 5, 3, 5, 1, '学生会会长', 'qwdqdwqd');
INSERT INTO `add_credit_order` VALUES (11, 6, 11, 5, 1, '英语6级', 'qwdqdwqd');
INSERT INTO `add_credit_order` VALUES (12, 10, 14, 3, 1, '人力资源', 'qwdqdwqd');
INSERT INTO `add_credit_order` VALUES (13, 10, 2, 1, 1, '志愿者', 'qwdqdwqd');
INSERT INTO `add_credit_order` VALUES (14, 11, 2, 1, 1, '志愿者', 'qwdqdwqd');
INSERT INTO `add_credit_order` VALUES (15, 14, 4, 3, 1, '学生会部员', 'qwdqdwqd');
INSERT INTO `add_credit_order` VALUES (16, 10, 2, 1, 0, '志愿者', 'qwdqdwqd');
INSERT INTO `add_credit_order` VALUES (17, 8, 11, 5, 0, '英语6级', 'qwdqdwqd');

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

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
INSERT INTO `borrow` VALUES (10, 'bootstrap', 1, 50.00);
INSERT INTO `borrow` VALUES (11, '线性代数', 1, 30.00);
INSERT INTO `borrow` VALUES (12, '概率论', 0, 23.00);
INSERT INTO `borrow` VALUES (13, '托福', 0, 20.00);
INSERT INTO `borrow` VALUES (14, 'GMAT', 0, 15.00);

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
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow_order
-- ----------------------------
INSERT INTO `borrow_order` VALUES (39, 2, 1, '2019-05-07 10:23:35', '2019-08-05 10:23:35', '2019-05-07 10:26:40', 1, 10.00);
INSERT INTO `borrow_order` VALUES (40, 2, 3, '2019-05-07 10:23:35', '2019-08-05 10:23:35', '2019-05-07 10:27:32', 1, 20.00);
INSERT INTO `borrow_order` VALUES (41, 2, 6, '2019-05-07 10:23:37', '2019-08-05 10:23:37', '2019-05-07 10:49:39', 1, 15.00);
INSERT INTO `borrow_order` VALUES (42, 12, 4, '2019-05-07 10:46:40', '2019-08-05 10:46:40', '2019-05-07 10:49:40', 1, 20.00);
INSERT INTO `borrow_order` VALUES (43, 12, 7, '2019-05-07 10:46:40', '2019-08-05 10:46:40', '2019-05-07 10:49:40', 1, 20.00);
INSERT INTO `borrow_order` VALUES (44, 12, 9, '2019-05-07 10:46:41', '2019-08-05 10:46:41', '2019-05-07 10:49:40', 1, 19.00);
INSERT INTO `borrow_order` VALUES (45, 1, 2, '2019-05-19 11:03:03', '2019-08-17 11:03:03', '2019-05-19 11:03:18', 1, 20.00);
INSERT INTO `borrow_order` VALUES (46, 1, 4, '2019-05-19 11:06:05', '2019-05-17 11:06:05', '2019-05-19 11:07:50', 1, 20.00);
INSERT INTO `borrow_order` VALUES (47, 1, 4, '2019-05-20 15:13:18', '2019-08-18 15:13:18', '2019-05-20 15:13:30', 1, 20.00);
INSERT INTO `borrow_order` VALUES (48, 2, 6, '2019-05-20 15:28:35', '2019-08-18 15:28:35', '2019-05-20 15:28:48', 1, 15.00);
INSERT INTO `borrow_order` VALUES (49, 1, 5, '2019-05-20 15:59:16', '2019-05-18 15:59:16', '2019-05-20 15:59:56', 1, 15.00);
INSERT INTO `borrow_order` VALUES (50, 8, 10, '2019-05-20 20:20:39', '2019-08-18 20:20:39', NULL, 0, 50.00);
INSERT INTO `borrow_order` VALUES (51, 8, 11, '2019-05-20 20:20:41', '2019-08-18 20:20:41', NULL, 0, 30.00);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of credit
-- ----------------------------
INSERT INTO `credit` VALUES (1, 5, 1, 2019, 100);
INSERT INTO `credit` VALUES (1, 6, 2, 2019, 100);
INSERT INTO `credit` VALUES (1, 7, 2, 2019, 100);
INSERT INTO `credit` VALUES (1, 8, 3, 2019, 100);
INSERT INTO `credit` VALUES (1, 9, 4, 2019, 100);
INSERT INTO `credit` VALUES (1, 10, 5, 2019, 100);
INSERT INTO `credit` VALUES (1, 11, 8, 2019, 100);
INSERT INTO `credit` VALUES (1, 12, 11, 2019, 100);
INSERT INTO `credit` VALUES (1, 13, 12, 2019, 100);
INSERT INTO `credit` VALUES (1, 14, 12, 2019, 100);
INSERT INTO `credit` VALUES (1, 15, 13, 2019, 100);
INSERT INTO `credit` VALUES (1, 16, 13, 2019, 100);
INSERT INTO `credit` VALUES (1, 17, 13, 2019, 100);

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cultivate_plan
-- ----------------------------
INSERT INTO `cultivate_plan` VALUES (1, '大数据', 1, 3, 3, 1, '周一下午', 1, 1, 1);
INSERT INTO `cultivate_plan` VALUES (2, 'Python', 1, 2, 3, 2, '周三上午', 1, 1, 1);
INSERT INTO `cultivate_plan` VALUES (3, '基础会计', 3, 2, 2, 1, '周一上午', 0, 1, 1);
INSERT INTO `cultivate_plan` VALUES (4, '建模', 2, 2, 3, 2, '周五上午', 0, 1, 1);
INSERT INTO `cultivate_plan` VALUES (5, '税收学', 6, 6, 2, 1, 'xxx', 1, 1, 1);
INSERT INTO `cultivate_plan` VALUES (6, '市场营销', 4, 3, 2, 1, 'xx', 0, 1, 1);
INSERT INTO `cultivate_plan` VALUES (7, '人因工程', 7, 4, 2, 2, 'xx', 0, 1, 1);
INSERT INTO `cultivate_plan` VALUES (8, '商务英语（中美）', 5, 2, 4, 1, 'x', 1, 1, 1);
INSERT INTO `cultivate_plan` VALUES (9, '经济学', 3, 2, 3, 1, 'xx', 0, 1, 1);
INSERT INTO `cultivate_plan` VALUES (10, '电子商务', 7, 2, 1, 1, 'x', 0, 1, 1);
INSERT INTO `cultivate_plan` VALUES (11, '数据库', 1, 3, 2, 1, 'xx', 1, 1, 1);

-- ----------------------------
-- Table structure for debt_score
-- ----------------------------
DROP TABLE IF EXISTS `debt_score`;
CREATE TABLE `debt_score`  (
  `stu_id` int(11) NULL DEFAULT NULL,
  `stu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` int(255) NULL DEFAULT NULL,
  `rank` int(255) NOT NULL,
  PRIMARY KEY (`rank`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of debt_score
-- ----------------------------
INSERT INTO `debt_score` VALUES (8, 'Ben', 170, 1);
INSERT INTO `debt_score` VALUES (13, 'Bruce', 170, 2);
INSERT INTO `debt_score` VALUES (6, 'Chris', 169, 3);
INSERT INTO `debt_score` VALUES (4, 'ljh', 169, 4);
INSERT INTO `debt_score` VALUES (7, 'Peter', 169, 5);
INSERT INTO `debt_score` VALUES (3, 'tjy', 161, 6);
INSERT INTO `debt_score` VALUES (2, 'xxc', 161, 7);
INSERT INTO `debt_score` VALUES (1, 'yyh', 160, 8);
INSERT INTO `debt_score` VALUES (5, 'Sam', 160, 9);
INSERT INTO `debt_score` VALUES (12, 'Bill', 160, 10);
INSERT INTO `debt_score` VALUES (14, 'Dennis', 155, 11);
INSERT INTO `debt_score` VALUES (11, 'Arthur', 155, 12);
INSERT INTO `debt_score` VALUES (9, 'Alice', 155, 13);
INSERT INTO `debt_score` VALUES (15, 'Gabriel', 155, 14);
INSERT INTO `debt_score` VALUES (10, 'Adam', 149, 15);

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
INSERT INTO `django_session` VALUES ('qmr4tqdbmfeugyhjpwe387xfl9resoil', 'YmE3YWRhNDk3YTM1ZTQ4NmUwYWRjYWVlNjFjZTk0YjJkODU1NTlmYzp7InRlYWNoZXJfbmFtZSI6Inp4ZCIsInRlYWNoZXJfaWQiOjEsInN0dV9uYW1lIjoieXloIiwic3R1X2lkIjoxLCJpbnN0cnVjdG9yX25hbWUiOiJcdThmODVcdTViZmNcdTU0NTgxIiwiaW5zdHJ1Y3Rvcl9pZCI6MX0=', '2019-06-03 20:22:16.571963');
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of instructor
-- ----------------------------
INSERT INTO `instructor` VALUES (1, '辅导员1', '000');
INSERT INTO `instructor` VALUES (2, '辅导员2', '000');
INSERT INTO `instructor` VALUES (3, '辅导员3', '000');

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
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_certification
-- ----------------------------
INSERT INTO `job_certification` VALUES (1, 1, 25, '会计', 40);
INSERT INTO `job_certification` VALUES (1, 3, 27, '前台', 60);
INSERT INTO `job_certification` VALUES (1, 4, 29, '数据分析师', 90);
INSERT INTO `job_certification` VALUES (1, 6, 32, '产品助理', 90);
INSERT INTO `job_certification` VALUES (1, 7, 35, '会计', 90);
INSERT INTO `job_certification` VALUES (0, 10, 36, '家教', 40);

-- ----------------------------
-- Table structure for labor_score
-- ----------------------------
DROP TABLE IF EXISTS `labor_score`;
CREATE TABLE `labor_score`  (
  `stu_id` int(11) NOT NULL,
  `stu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` int(255) NULL DEFAULT NULL,
  `rank` int(255) NOT NULL,
  PRIMARY KEY (`rank`, `stu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of labor_score
-- ----------------------------
INSERT INTO `labor_score` VALUES (4, 'ljh', 163, 1);
INSERT INTO `labor_score` VALUES (6, 'Chris', 159, 2);
INSERT INTO `labor_score` VALUES (7, 'Peter', 158, 3);
INSERT INTO `labor_score` VALUES (3, 'tjy', 156, 4);
INSERT INTO `labor_score` VALUES (1, 'yyh', 154, 5);
INSERT INTO `labor_score` VALUES (13, 'Bruce', 152, 6);
INSERT INTO `labor_score` VALUES (2, 'xxc', 150, 7);
INSERT INTO `labor_score` VALUES (12, 'Bill', 149, 8);
INSERT INTO `labor_score` VALUES (8, 'Ben', 146, 9);
INSERT INTO `labor_score` VALUES (5, 'Sam', 144, 10);
INSERT INTO `labor_score` VALUES (11, 'Arthur', 143, 11);
INSERT INTO `labor_score` VALUES (14, 'Dennis', 139, 12);
INSERT INTO `labor_score` VALUES (15, 'Gabriel', 138, 13);
INSERT INTO `labor_score` VALUES (9, 'Alice', 138, 14);
INSERT INTO `labor_score` VALUES (10, 'Adam', 137, 15);

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `major_id` int(11) NOT NULL AUTO_INCREMENT,
  `major_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`major_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, '信管');
INSERT INTO `major` VALUES (2, '管科');
INSERT INTO `major` VALUES (3, '会计');
INSERT INTO `major` VALUES (4, '工商');
INSERT INTO `major` VALUES (5, '工商（中美合作）');
INSERT INTO `major` VALUES (6, '税收');
INSERT INTO `major` VALUES (7, '工业工程');
INSERT INTO `major` VALUES (8, '电子商务');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (4, 9, 10, 87, 100, 6999, 1, 1);
INSERT INTO `orders` VALUES (5, 11, 10, 87, 100, 2699, 1, 3);
INSERT INTO `orders` VALUES (6, 14, 2, 100, 100, 39, 1, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pen_appeal
-- ----------------------------
INSERT INTO `pen_appeal` VALUES (1, 22, 1, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of penalty
-- ----------------------------
INSERT INTO `penalty` VALUES (18, '丢书', 39, 10, NULL, NULL, 2, NULL);
INSERT INTO `penalty` VALUES (19, '丢书', 40, 20, NULL, NULL, 2, NULL);
INSERT INTO `penalty` VALUES (20, '丢书', 40, 20, NULL, NULL, 2, NULL);
INSERT INTO `penalty` VALUES (21, '丢书', 45, 20, NULL, NULL, 1, NULL);
INSERT INTO `penalty` VALUES (22, '逾期', 46, 2, 0, 1, 1, NULL);
INSERT INTO `penalty` VALUES (23, '丢书', 47, 20, NULL, NULL, 1, NULL);
INSERT INTO `penalty` VALUES (24, '逾期', 49, 2, 1, 0, 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (9, 'iphone XR', 8999, 6999, 1, '南校', 1, 1);
INSERT INTO `products` VALUES (10, 'ipad', 2999, 800, 3, '南校', 1, 0);
INSERT INTO `products` VALUES (11, '笔记本电脑', 5699, 2699, 3, '教超', 1, 1);
INSERT INTO `products` VALUES (12, '笔记本电脑', 2999, 800, 7, '南校', 1, 0);
INSERT INTO `products` VALUES (14, '托福词汇', 59, 39, 1, '南校', 1, 1);

-- ----------------------------
-- Table structure for rules
-- ----------------------------
DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules`  (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `score` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`rule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rules
-- ----------------------------
INSERT INTO `rules` VALUES (1, 'A类期刊一作', 10);
INSERT INTO `rules` VALUES (2, '志愿者', 1);
INSERT INTO `rules` VALUES (3, '学生会会长', 5);
INSERT INTO `rules` VALUES (4, '学生会部员', 3);
INSERT INTO `rules` VALUES (5, 'B类期刊一作', 8);
INSERT INTO `rules` VALUES (6, 'A类期刊二作', 9);
INSERT INTO `rules` VALUES (7, 'B类期刊二作', 7);
INSERT INTO `rules` VALUES (8, '国家类奖励', 15);
INSERT INTO `rules` VALUES (9, '市级奖励', 10);
INSERT INTO `rules` VALUES (10, '英语四级', 3);
INSERT INTO `rules` VALUES (11, '英语6级', 5);
INSERT INTO `rules` VALUES (12, '口笔译', 5);
INSERT INTO `rules` VALUES (13, '普通话等级', 1);
INSERT INTO `rules` VALUES (14, '人力资源', 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scholarship
-- ----------------------------
INSERT INTO `scholarship` VALUES (7, 13, 1, 1000);
INSERT INTO `scholarship` VALUES (8, 8, 1, 700);
INSERT INTO `scholarship` VALUES (9, 2, 1, 400);

-- ----------------------------
-- Table structure for sep_score
-- ----------------------------
DROP TABLE IF EXISTS `sep_score`;
CREATE TABLE `sep_score`  (
  `sep_id` int(11) NOT NULL AUTO_INCREMENT,
  `score_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stu_id` int(11) NULL DEFAULT NULL,
  `score` int(255) NULL DEFAULT NULL,
  `rank` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`sep_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1313 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sep_score
-- ----------------------------
INSERT INTO `sep_score` VALUES (1193, 'stu_scholarship', 13, 200, 1);
INSERT INTO `sep_score` VALUES (1194, 'stu_scholarship', 8, 170, 2);
INSERT INTO `sep_score` VALUES (1195, 'stu_scholarship', 2, 140, 3);
INSERT INTO `sep_score` VALUES (1196, 'stu_scholarship', 1, 100, 4);
INSERT INTO `sep_score` VALUES (1197, 'stu_scholarship', 3, 100, 5);
INSERT INTO `sep_score` VALUES (1198, 'stu_scholarship', 4, 100, 6);
INSERT INTO `sep_score` VALUES (1199, 'stu_scholarship', 5, 100, 7);
INSERT INTO `sep_score` VALUES (1200, 'stu_scholarship', 6, 100, 8);
INSERT INTO `sep_score` VALUES (1201, 'stu_scholarship', 7, 100, 9);
INSERT INTO `sep_score` VALUES (1202, 'stu_scholarship', 9, 100, 10);
INSERT INTO `sep_score` VALUES (1203, 'stu_scholarship', 10, 100, 11);
INSERT INTO `sep_score` VALUES (1204, 'stu_scholarship', 11, 100, 12);
INSERT INTO `sep_score` VALUES (1205, 'stu_scholarship', 12, 100, 13);
INSERT INTO `sep_score` VALUES (1206, 'stu_scholarship', 14, 100, 14);
INSERT INTO `sep_score` VALUES (1207, 'stu_scholarship', 15, 100, 15);
INSERT INTO `sep_score` VALUES (1208, 'stu_gpa', 13, 176, 1);
INSERT INTO `sep_score` VALUES (1209, 'stu_gpa', 8, 175, 2);
INSERT INTO `sep_score` VALUES (1210, 'stu_gpa', 2, 172, 3);
INSERT INTO `sep_score` VALUES (1211, 'stu_gpa', 1, 169, 4);
INSERT INTO `sep_score` VALUES (1212, 'stu_gpa', 11, 167, 5);
INSERT INTO `sep_score` VALUES (1213, 'stu_gpa', 14, 165, 6);
INSERT INTO `sep_score` VALUES (1214, 'stu_gpa', 12, 163, 7);
INSERT INTO `sep_score` VALUES (1215, 'stu_gpa', 4, 161, 8);
INSERT INTO `sep_score` VALUES (1216, 'stu_gpa', 15, 161, 9);
INSERT INTO `sep_score` VALUES (1217, 'stu_gpa', 6, 159, 10);
INSERT INTO `sep_score` VALUES (1218, 'stu_gpa', 3, 157, 11);
INSERT INTO `sep_score` VALUES (1219, 'stu_gpa', 9, 155, 12);
INSERT INTO `sep_score` VALUES (1220, 'stu_gpa', 5, 153, 13);
INSERT INTO `sep_score` VALUES (1221, 'stu_gpa', 7, 153, 14);
INSERT INTO `sep_score` VALUES (1222, 'stu_gpa', 10, 150, 15);
INSERT INTO `sep_score` VALUES (1223, 'stu_paper', 1, 115, 1);
INSERT INTO `sep_score` VALUES (1224, 'stu_paper', 5, 105, 2);
INSERT INTO `sep_score` VALUES (1225, 'stu_paper', 6, 105, 3);
INSERT INTO `sep_score` VALUES (1226, 'stu_paper', 10, 104, 4);
INSERT INTO `sep_score` VALUES (1227, 'stu_paper', 14, 103, 5);
INSERT INTO `sep_score` VALUES (1228, 'stu_paper', 3, 101, 6);
INSERT INTO `sep_score` VALUES (1229, 'stu_paper', 11, 101, 7);
INSERT INTO `sep_score` VALUES (1230, 'stu_paper', 2, 100, 8);
INSERT INTO `sep_score` VALUES (1231, 'stu_paper', 4, 100, 9);
INSERT INTO `sep_score` VALUES (1232, 'stu_paper', 7, 100, 10);
INSERT INTO `sep_score` VALUES (1233, 'stu_paper', 8, 100, 11);
INSERT INTO `sep_score` VALUES (1234, 'stu_paper', 9, 100, 12);
INSERT INTO `sep_score` VALUES (1235, 'stu_paper', 12, 100, 13);
INSERT INTO `sep_score` VALUES (1236, 'stu_paper', 13, 100, 14);
INSERT INTO `sep_score` VALUES (1237, 'stu_paper', 15, 100, 15);
INSERT INTO `sep_score` VALUES (1238, 'stu_job', 4, 140, 1);
INSERT INTO `sep_score` VALUES (1239, 'stu_job', 6, 140, 2);
INSERT INTO `sep_score` VALUES (1240, 'stu_job', 7, 140, 3);
INSERT INTO `sep_score` VALUES (1241, 'stu_job', 3, 110, 4);
INSERT INTO `sep_score` VALUES (1242, 'stu_job', 1, 90, 5);
INSERT INTO `sep_score` VALUES (1243, 'stu_job', 2, 50, 6);
INSERT INTO `sep_score` VALUES (1244, 'stu_job', 5, 50, 7);
INSERT INTO `sep_score` VALUES (1245, 'stu_job', 8, 50, 8);
INSERT INTO `sep_score` VALUES (1246, 'stu_job', 9, 50, 9);
INSERT INTO `sep_score` VALUES (1247, 'stu_job', 10, 50, 10);
INSERT INTO `sep_score` VALUES (1248, 'stu_job', 11, 50, 11);
INSERT INTO `sep_score` VALUES (1249, 'stu_job', 12, 50, 12);
INSERT INTO `sep_score` VALUES (1250, 'stu_job', 13, 50, 13);
INSERT INTO `sep_score` VALUES (1251, 'stu_job', 14, 50, 14);
INSERT INTO `sep_score` VALUES (1252, 'stu_job', 15, 50, 15);
INSERT INTO `sep_score` VALUES (1253, 'stu_cheat', 1, 200, 1);
INSERT INTO `sep_score` VALUES (1254, 'stu_cheat', 2, 200, 2);
INSERT INTO `sep_score` VALUES (1255, 'stu_cheat', 3, 200, 3);
INSERT INTO `sep_score` VALUES (1256, 'stu_cheat', 4, 200, 4);
INSERT INTO `sep_score` VALUES (1257, 'stu_cheat', 5, 200, 5);
INSERT INTO `sep_score` VALUES (1258, 'stu_cheat', 6, 200, 6);
INSERT INTO `sep_score` VALUES (1259, 'stu_cheat', 7, 200, 7);
INSERT INTO `sep_score` VALUES (1260, 'stu_cheat', 8, 200, 8);
INSERT INTO `sep_score` VALUES (1261, 'stu_cheat', 9, 200, 9);
INSERT INTO `sep_score` VALUES (1262, 'stu_cheat', 10, 200, 10);
INSERT INTO `sep_score` VALUES (1263, 'stu_cheat', 11, 200, 11);
INSERT INTO `sep_score` VALUES (1264, 'stu_cheat', 12, 200, 12);
INSERT INTO `sep_score` VALUES (1265, 'stu_cheat', 13, 200, 13);
INSERT INTO `sep_score` VALUES (1266, 'stu_cheat', 14, 200, 14);
INSERT INTO `sep_score` VALUES (1267, 'stu_cheat', 15, 200, 15);
INSERT INTO `sep_score` VALUES (1268, 'stu_c', 4, 200, 1);
INSERT INTO `sep_score` VALUES (1269, 'stu_c', 5, 200, 2);
INSERT INTO `sep_score` VALUES (1270, 'stu_c', 6, 200, 3);
INSERT INTO `sep_score` VALUES (1271, 'stu_c', 7, 200, 4);
INSERT INTO `sep_score` VALUES (1272, 'stu_c', 8, 200, 5);
INSERT INTO `sep_score` VALUES (1273, 'stu_c', 9, 200, 6);
INSERT INTO `sep_score` VALUES (1274, 'stu_c', 11, 200, 7);
INSERT INTO `sep_score` VALUES (1275, 'stu_c', 12, 200, 8);
INSERT INTO `sep_score` VALUES (1276, 'stu_c', 13, 200, 9);
INSERT INTO `sep_score` VALUES (1277, 'stu_c', 14, 200, 10);
INSERT INTO `sep_score` VALUES (1278, 'stu_c', 15, 200, 11);
INSERT INTO `sep_score` VALUES (1279, 'stu_c', 1, 100, 12);
INSERT INTO `sep_score` VALUES (1280, 'stu_c', 2, 100, 13);
INSERT INTO `sep_score` VALUES (1281, 'stu_c', 3, 100, 14);
INSERT INTO `sep_score` VALUES (1282, 'stu_c', 10, 87, 15);
INSERT INTO `sep_score` VALUES (1283, 'stu_credit', 13, 160, 1);
INSERT INTO `sep_score` VALUES (1284, 'stu_credit', 2, 140, 2);
INSERT INTO `sep_score` VALUES (1285, 'stu_credit', 12, 140, 3);
INSERT INTO `sep_score` VALUES (1286, 'stu_credit', 1, 120, 4);
INSERT INTO `sep_score` VALUES (1287, 'stu_credit', 3, 120, 5);
INSERT INTO `sep_score` VALUES (1288, 'stu_credit', 4, 120, 6);
INSERT INTO `sep_score` VALUES (1289, 'stu_credit', 5, 120, 7);
INSERT INTO `sep_score` VALUES (1290, 'stu_credit', 8, 120, 8);
INSERT INTO `sep_score` VALUES (1291, 'stu_credit', 11, 120, 9);
INSERT INTO `sep_score` VALUES (1292, 'stu_credit', 6, 100, 10);
INSERT INTO `sep_score` VALUES (1293, 'stu_credit', 7, 100, 11);
INSERT INTO `sep_score` VALUES (1294, 'stu_credit', 9, 100, 12);
INSERT INTO `sep_score` VALUES (1295, 'stu_credit', 10, 100, 13);
INSERT INTO `sep_score` VALUES (1296, 'stu_credit', 14, 100, 14);
INSERT INTO `sep_score` VALUES (1297, 'stu_credit', 15, 100, 15);
INSERT INTO `sep_score` VALUES (1298, 'stu_penalty', 2, 200, 1);
INSERT INTO `sep_score` VALUES (1299, 'stu_penalty', 3, 200, 2);
INSERT INTO `sep_score` VALUES (1300, 'stu_penalty', 4, 200, 3);
INSERT INTO `sep_score` VALUES (1301, 'stu_penalty', 5, 200, 4);
INSERT INTO `sep_score` VALUES (1302, 'stu_penalty', 6, 200, 5);
INSERT INTO `sep_score` VALUES (1303, 'stu_penalty', 7, 200, 6);
INSERT INTO `sep_score` VALUES (1304, 'stu_penalty', 8, 200, 7);
INSERT INTO `sep_score` VALUES (1305, 'stu_penalty', 9, 200, 8);
INSERT INTO `sep_score` VALUES (1306, 'stu_penalty', 10, 200, 9);
INSERT INTO `sep_score` VALUES (1307, 'stu_penalty', 11, 200, 10);
INSERT INTO `sep_score` VALUES (1308, 'stu_penalty', 12, 200, 11);
INSERT INTO `sep_score` VALUES (1309, 'stu_penalty', 13, 200, 12);
INSERT INTO `sep_score` VALUES (1310, 'stu_penalty', 14, 200, 13);
INSERT INTO `sep_score` VALUES (1311, 'stu_penalty', 15, 200, 14);
INSERT INTO `sep_score` VALUES (1312, 'stu_penalty', 1, 190, 15);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `stu_id` int(255) NOT NULL AUTO_INCREMENT,
  `stu_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `stu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `stu_year` year NULL DEFAULT NULL,
  `major_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `money` int(255) NULL DEFAULT NULL,
  `stu_edu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `bed_id` int(255) NULL DEFAULT NULL,
  `dorm_id` int(255) NULL DEFAULT NULL,
  `instructor_id` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`stu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '000', 'yyh', 2015, '1', 7096, '本科', 101, 1, 1);
INSERT INTO `student` VALUES (2, '000', 'xxc', 2015, '1', 411, '本科', 201, 2, 1);
INSERT INTO `student` VALUES (3, '000', 'tjy', 2015, '1', 2799, '本科', 102, 1, 1);
INSERT INTO `student` VALUES (4, '000', 'ljh', 2015, '1', 100, '本科', 202, 2, 1);
INSERT INTO `student` VALUES (5, '000', 'Sam', 2015, '2', 100, '本科', NULL, NULL, 1);
INSERT INTO `student` VALUES (6, '000', 'Chris', 2015, '2', 100, '本科', NULL, NULL, 2);
INSERT INTO `student` VALUES (7, '000', 'Peter', 2015, NULL, 100, '本科', NULL, NULL, 2);
INSERT INTO `student` VALUES (8, '000', 'Ben', 2015, NULL, 800, '本科', NULL, NULL, 2);
INSERT INTO `student` VALUES (9, '000', 'Alice', 2016, NULL, 100, '本科', NULL, NULL, 3);
INSERT INTO `student` VALUES (10, '000', 'Adam', 2016, NULL, -9598, '本科', NULL, NULL, 1);
INSERT INTO `student` VALUES (11, '000', 'Arthur', 2016, NULL, 100, '本科', NULL, NULL, 2);
INSERT INTO `student` VALUES (12, '000', 'Bill', 2015, NULL, 100, '本科', NULL, NULL, 3);
INSERT INTO `student` VALUES (13, '000', 'Bruce', 2016, NULL, 1100, '本科', NULL, NULL, 3);
INSERT INTO `student` VALUES (14, '000', 'Dennis', 2016, NULL, 100, '本科', NULL, NULL, 1);
INSERT INTO `student` VALUES (15, '000', 'Gabriel', 2016, NULL, 100, '本科', NULL, NULL, 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_choice
-- ----------------------------
INSERT INTO `student_choice` VALUES (29, 33, 80, 1, 1, 0);
INSERT INTO `student_choice` VALUES (30, 34, 85, 1, 3, 0);
INSERT INTO `student_choice` VALUES (31, 35, 78, 1, 2, 0);
INSERT INTO `student_choice` VALUES (32, 37, 95, 1, 4, 1);
INSERT INTO `student_choice` VALUES (33, 33, 90, 2, 1, 1);
INSERT INTO `student_choice` VALUES (34, 34, 98, 2, 3, 1);
INSERT INTO `student_choice` VALUES (35, 35, 70, 2, 2, 0);
INSERT INTO `student_choice` VALUES (36, 39, 87, 2, 9, 0);
INSERT INTO `student_choice` VALUES (37, 43, 89, 3, 11, 0);
INSERT INTO `student_choice` VALUES (38, 42, 66, 3, 10, 0);
INSERT INTO `student_choice` VALUES (39, 40, 100, 3, 5, 1);
INSERT INTO `student_choice` VALUES (40, 38, 60, 3, 7, 0);
INSERT INTO `student_choice` VALUES (41, 36, 88, 4, 6, 0);
INSERT INTO `student_choice` VALUES (42, 37, 92, 4, 4, 1);
INSERT INTO `student_choice` VALUES (43, 38, 65, 4, 7, 0);
INSERT INTO `student_choice` VALUES (44, 39, 78, 4, 9, 0);
INSERT INTO `student_choice` VALUES (45, 39, 90, 5, 9, 1);
INSERT INTO `student_choice` VALUES (46, 38, 80, 5, 7, 0);
INSERT INTO `student_choice` VALUES (47, 41, 50, 5, 8, 0);
INSERT INTO `student_choice` VALUES (48, 42, 87, 5, 10, 0);
INSERT INTO `student_choice` VALUES (49, 35, 88, 6, 2, 0);
INSERT INTO `student_choice` VALUES (50, 34, 66, 6, 3, 0);
INSERT INTO `student_choice` VALUES (51, 38, 78, 6, 7, 0);
INSERT INTO `student_choice` VALUES (52, 40, 87, 6, 5, 0);
INSERT INTO `student_choice` VALUES (53, 33, 60, 7, 1, 0);
INSERT INTO `student_choice` VALUES (54, 35, 78, 7, 2, 0);
INSERT INTO `student_choice` VALUES (55, 43, 86, 7, 11, 0);
INSERT INTO `student_choice` VALUES (56, 40, 83, 7, 5, 0);
INSERT INTO `student_choice` VALUES (57, 34, 83, 8, 3, 0);
INSERT INTO `student_choice` VALUES (58, 38, 87, 8, 7, 0);
INSERT INTO `student_choice` VALUES (59, 33, 89, 8, 1, 0);
INSERT INTO `student_choice` VALUES (60, 40, 91, 8, 5, 1);
INSERT INTO `student_choice` VALUES (61, 34, 96, 9, 3, 0);
INSERT INTO `student_choice` VALUES (62, 38, 70, 9, 7, 0);
INSERT INTO `student_choice` VALUES (63, 41, 78, 9, 8, 0);
INSERT INTO `student_choice` VALUES (64, 39, 66, 9, 9, 0);
INSERT INTO `student_choice` VALUES (65, 39, 70, 10, 9, 0);
INSERT INTO `student_choice` VALUES (66, 40, 87, 10, 5, 0);
INSERT INTO `student_choice` VALUES (67, 34, 78, 10, 3, 0);
INSERT INTO `student_choice` VALUES (68, 43, 66, 10, 11, 0);
INSERT INTO `student_choice` VALUES (69, 34, 90, 11, 3, 1);
INSERT INTO `student_choice` VALUES (70, 35, 87, 11, 2, 0);
INSERT INTO `student_choice` VALUES (71, 41, 80, 11, 8, 0);
INSERT INTO `student_choice` VALUES (72, 42, 78, 11, 10, 0);
INSERT INTO `student_choice` VALUES (73, 35, 90, 12, 2, 1);
INSERT INTO `student_choice` VALUES (74, 36, 99, 12, 6, 1);
INSERT INTO `student_choice` VALUES (75, 37, 78, 12, 4, 0);
INSERT INTO `student_choice` VALUES (76, 38, 60, 12, 7, 0);
INSERT INTO `student_choice` VALUES (77, 39, 96, 13, 9, 1);
INSERT INTO `student_choice` VALUES (78, 41, 95, 13, 8, 1);
INSERT INTO `student_choice` VALUES (79, 40, 96, 13, 5, 1);
INSERT INTO `student_choice` VALUES (80, 42, 66, 13, 10, 0);
INSERT INTO `student_choice` VALUES (81, 35, 76, 14, 2, 0);
INSERT INTO `student_choice` VALUES (82, 36, 83, 14, 6, 0);
INSERT INTO `student_choice` VALUES (83, 38, 87, 14, 7, 0);
INSERT INTO `student_choice` VALUES (84, 39, 85, 14, 9, 0);
INSERT INTO `student_choice` VALUES (85, 41, 86, 15, 8, 0);
INSERT INTO `student_choice` VALUES (86, 42, 83, 15, 10, 0);
INSERT INTO `student_choice` VALUES (87, 39, 88, 15, 9, 0);
INSERT INTO `student_choice` VALUES (88, 37, 65, 15, 4, 0);
INSERT INTO `student_choice` VALUES (102, 36, NULL, 1, 6, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 'zxd', 1, '000');
INSERT INTO `teacher` VALUES (2, 'nj', 1, '000');
INSERT INTO `teacher` VALUES (3, 'lc', 1, '000');
INSERT INTO `teacher` VALUES (4, 'yp', 1, '000');

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
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher_choice
-- ----------------------------
INSERT INTO `teacher_choice` VALUES (33, 3, 1, 2019, 0, '周一下午', 1);
INSERT INTO `teacher_choice` VALUES (34, 3, 3, 2019, 0, '周一上午', 0);
INSERT INTO `teacher_choice` VALUES (35, 3, 2, 2019, 0, '周三上午', 1);
INSERT INTO `teacher_choice` VALUES (36, 3, 6, 2019, 0, 'xx', 0);
INSERT INTO `teacher_choice` VALUES (37, 2, 4, 2019, 0, '周五上午', 0);
INSERT INTO `teacher_choice` VALUES (38, 2, 7, 2019, 0, 'xx', 0);
INSERT INTO `teacher_choice` VALUES (39, 2, 9, 2019, 0, 'xx', 0);
INSERT INTO `teacher_choice` VALUES (40, 1, 5, 2019, 0, 'xxx', 1);
INSERT INTO `teacher_choice` VALUES (41, 1, 8, 2019, 0, 'x', 1);
INSERT INTO `teacher_choice` VALUES (42, 1, 10, 2019, 0, 'x', 0);
INSERT INTO `teacher_choice` VALUES (43, 1, 11, 2019, 0, 'xx', 1);

SET FOREIGN_KEY_CHECKS = 1;
