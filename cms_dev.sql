/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : cms_dev

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 13/12/2020 21:49:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classes_infos
-- ----------------------------
DROP TABLE IF EXISTS `classes_infos`;
CREATE TABLE `classes_infos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class_id` varchar(32) DEFAULT NULL,
  `school_id` int DEFAULT NULL COMMENT '學校ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '班級名稱',
  `teacher_id` int DEFAULT NULL COMMENT '帶班教師ID',
  `teacher_assistant_id` int DEFAULT NULL COMMENT '助教ID',
  `substitute_teacher_id` int DEFAULT NULL COMMENT '代課教師ID',
  `teaching_material_1` int DEFAULT NULL COMMENT '教材1_ID',
  `teaching_material_2` int DEFAULT NULL COMMENT '教材2_ID',
  `teaching_material_3` int DEFAULT NULL COMMENT '教材3_ID',
  `teaching_material_4` int DEFAULT NULL COMMENT '教材4_ID',
  `period_start_date` date DEFAULT NULL COMMENT '本期開始日',
  `period_end_date` date DEFAULT NULL COMMENT '本期結束日',
  `calss_start_date` date DEFAULT NULL COMMENT '上課開始日',
  `class_schedule` varchar(255) DEFAULT NULL COMMENT '上課時段',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '建立日期',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最後更新日期',
  `status` int DEFAULT '1' COMMENT '狀態:1啟用2關閉',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes_infos
-- ----------------------------
BEGIN;
INSERT INTO `classes_infos` VALUES (1, NULL, NULL, 'test1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-01', '2020-12-23', '2020-12-09', '早上', '2020-12-13 07:40:32', '2020-12-13 08:47:38', 1);
INSERT INTO `classes_infos` VALUES (2, NULL, NULL, 'test2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-01', '2020-12-08', '2020-12-23', '下午', '2020-12-13 08:34:44', '2020-12-13 08:47:52', 1);
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (5, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (6, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (7, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (8, '2020_11_27_094012_create_user_roles_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for schools_branch_info
-- ----------------------------
DROP TABLE IF EXISTS `schools_branch_info`;
CREATE TABLE `schools_branch_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `main_school_id` int DEFAULT NULL COMMENT '主校',
  `name` varchar(255) DEFAULT NULL COMMENT '學校名稱',
  `address` varchar(255) DEFAULT NULL COMMENT '學校地址',
  `telephone` varchar(255) DEFAULT NULL COMMENT '學校電話',
  `principal` int DEFAULT NULL COMMENT '校長',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '建立日期',
  `expired_at` timestamp NULL DEFAULT NULL COMMENT '到期日期',
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最後更新日期',
  `status` int DEFAULT '1' COMMENT '狀態:1啟用2關閉',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schools_branch_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for schools_main_info
-- ----------------------------
DROP TABLE IF EXISTS `schools_main_info`;
CREATE TABLE `schools_main_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '學校名稱',
  `address` varchar(255) DEFAULT NULL COMMENT '學校地址',
  `telephone` varchar(255) DEFAULT NULL COMMENT '學校電話',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '建立日期',
  `expired_at` timestamp NULL DEFAULT NULL COMMENT '到期日期',
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最後更新日期',
  `status` int DEFAULT '1' COMMENT '狀態:1啟用2關閉',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schools_main_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
BEGIN;
INSERT INTO `user_roles` VALUES (1, '超級管理員', NULL, NULL);
INSERT INTO `user_roles` VALUES (2, '管理員', NULL, NULL);
INSERT INTO `user_roles` VALUES (3, '會員', NULL, NULL);
INSERT INTO `user_roles` VALUES (4, '分校校長', NULL, NULL);
INSERT INTO `user_roles` VALUES (5, '教師', NULL, NULL);
INSERT INTO `user_roles` VALUES (6, '助教', NULL, NULL);
INSERT INTO `user_roles` VALUES (7, '家長', NULL, NULL);
INSERT INTO `user_roles` VALUES (8, '學生', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int NOT NULL DEFAULT '3',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'SuperAdmin', 'tophet0929@gmail.com', NULL, '$2y$10$4D6lD.8JaRnszDKs9P5eYOnVbfVwR4T9ok0QgAv0hI5nR60VQmf9q', 1, NULL, NULL, NULL);
INSERT INTO `users` VALUES (26, 'linba', 'linba2@gmail.com', NULL, '$2y$10$MD.97UvlXsh1FxbxM4QbMO.Twvba22ER7HQRG6q40DXg.AIz9JsMe', 7, NULL, '2020-12-13 21:39:06', '2020-12-13 21:39:06');
INSERT INTO `users` VALUES (27, 'linma', 'linma2@gmail.com', NULL, '$2y$10$p7qXQe0iiAPZpVpR.eEM0.ghjQYN25G7ymeAMSmNJIkE0CswutC8W', 7, NULL, '2020-12-13 21:39:06', '2020-12-13 21:39:06');
INSERT INTO `users` VALUES (28, 'linbo', 'linbo@gmail.com', NULL, '$2y$10$Tcbx0Vk4ZgL84eY4IeyRVOFwo90ett7Cq0eArS9oEms2BPRxRjDTu', 8, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for users_parent_infos
-- ----------------------------
DROP TABLE IF EXISTS `users_parent_infos`;
CREATE TABLE `users_parent_infos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL COMMENT '使用者ID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '家長姓名_1',
  `line` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Line',
  `telephone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '電話',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '建立日期',
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最後更新日期',
  `status` int DEFAULT '1' COMMENT '狀態:1啟用2關閉',
  `email` varchar(255) DEFAULT NULL COMMENT '家長信箱_1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_parent_infos
-- ----------------------------
BEGIN;
INSERT INTO `users_parent_infos` VALUES (15, 26, '林爸Yo', 'linbaLine', '0912345678', NULL, '2020-12-13 21:39:06', 1, 'linba2@gmail.com');
INSERT INTO `users_parent_infos` VALUES (16, 27, '林媽Yo', 'linmaLine', '0987654321', NULL, '2020-12-13 21:39:06', 1, 'linma2@gmail.com');
COMMIT;

-- ----------------------------
-- Table structure for users_student_infos
-- ----------------------------
DROP TABLE IF EXISTS `users_student_infos`;
CREATE TABLE `users_student_infos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL COMMENT '使用者ID',
  `class_id` int DEFAULT NULL COMMENT '班級ID',
  `chinese_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '中文姓名',
  `english_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '英文姓名',
  `line` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Line',
  `parent_1_id` int DEFAULT NULL COMMENT '家長_1_ID',
  `parent_2_id` int DEFAULT NULL COMMENT '家長_2_ID',
  `other` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '備註',
  `start_date` date DEFAULT NULL COMMENT '入學日',
  `expire_date` date DEFAULT NULL COMMENT '退學日',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '建立日期',
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最後更新日期',
  `status` int DEFAULT '1' COMMENT '狀態:1啟用2關閉',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_student_infos
-- ----------------------------
BEGIN;
INSERT INTO `users_student_infos` VALUES (2, 28, NULL, '林學生', 'Linbo', 'linboLine', 15, 16, 'p', '2020-12-14', '2020-12-31', NULL, '2020-12-13 21:39:06', 1);
COMMIT;

-- ----------------------------
-- Table structure for users_teacher_info
-- ----------------------------
DROP TABLE IF EXISTS `users_teacher_info`;
CREATE TABLE `users_teacher_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL COMMENT '使用者ID',
  `chinese_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '中文名字',
  `english_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '英文名字',
  `address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `telephone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '電話',
  `line` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Line',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '建立日期',
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最後更新日期',
  `status` int DEFAULT '1' COMMENT '狀態:1啟用2關閉',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_teacher_info
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
