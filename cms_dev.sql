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

 Date: 21/12/2020 20:32:35
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
-- Table structure for email_template
-- ----------------------------
DROP TABLE IF EXISTS `email_template`;
CREATE TABLE `email_template` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of email_template
-- ----------------------------
BEGIN;
INSERT INTO `email_template` VALUES (1, NULL, NULL, '<!DOCTYPE html>\n                <html lang=\"en\">\n                <head>\n                    <meta charset=\"utf-8\">\n                    <meta name=\"viewport\" content=\"width=device-width\">\n                    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"> \n                    <meta name=\"x-apple-disable-message-reformatting\">\n                    <title>Example</title>\n                    <style>\n                        body {\n                            background-color:#fff;\n                            color:#222222;\n                            margin: 0px auto;\n                            padding: 0px;\n                            height: 100%;\n                            width: 100%;\n                            font-weight: 400;\n                            font-size: 15px;\n                            line-height: 1.8;\n                        }\n                        .continer{\n                            width:400px;\n                            margin-left:auto;\n                            margin-right:auto;\n                            background-color:#efefef;\n                            padding:30px;\n                        }\n                        .btn{\n                            padding: 5px 15px;\n                            display: inline-block;\n                        }\n                        .btn-primary{\n                            border-radius: 3px;\n                            background: #0b3c7c;\n                            color: #fff;\n                            text-decoration: none;\n                        }\n                        .btn-primary:hover{\n                            border-radius: 3px;\n                            background: #4673ad;\n                            color: #fff;\n                            text-decoration: none;\n                        }\n                    </style>\n                </head>\n                <body>\n                    <div class=\"continer\">\n                        <h1>Lorem ipsum dolor</h1>\n                        <h4>Ipsum dolor cet emit amet</h4>\n                        <p>\n                            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea <strong>commodo consequat</strong>. \n                            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \n                            Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n                        </p>\n                        <h4>Ipsum dolor cet emit amet</h4>\n                        <p>\n                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod <a href=\"#\">tempor incididunt ut labore</a> et dolore magna aliqua.\n                            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n                        </p>\n                        <h4>Ipsum dolor cet emit amet</h4>\n                        <p>\n                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n                            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n                        </p>\n                        <a href=\"#\" class=\"btn btn-primary\">Lorem ipsum dolor</a>\n                        <h4>Ipsum dolor cet emit amet</h4>\n                        <p>\n                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n                            Ut enim ad minim veniam, quis nostrud exercitation <a href=\"#\">ullamco</a> laboris nisi ut aliquip ex ea commodo consequat. \n                            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \n                            Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n                        </p>\n                    </div>\n                </body>\n                </html>', 'Example E-mail', 'Example E-mail');
COMMIT;

-- ----------------------------
-- Table structure for example
-- ----------------------------
DROP TABLE IF EXISTS `example`;
CREATE TABLE `example` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of example
-- ----------------------------
BEGIN;
INSERT INTO `example` VALUES (1, NULL, NULL, 'Distinctio voluptatem non.', 'Et consequatur quod et molestias.', 3);
INSERT INTO `example` VALUES (2, NULL, NULL, 'Accusamus ipsam ut eveniet ipsa iusto.', 'Eligendi sed possimus magnam repudiandae. Libero voluptates amet aut sunt qui.', 2);
INSERT INTO `example` VALUES (3, NULL, NULL, 'Dolores ullam quasi nemo excepturi.', 'Cum voluptatum libero quibusdam tempora mollitia facere omnis.', 2);
INSERT INTO `example` VALUES (4, NULL, NULL, 'Eveniet quo iure incidunt aspernatur.', 'Omnis qui enim corrupti.', 3);
INSERT INTO `example` VALUES (5, NULL, NULL, 'Aliquid doloremque officia placeat.', 'Dolores laborum consequatur hic ex. Et occaecati distinctio aut explicabo totam ut quo iusto.', 1);
INSERT INTO `example` VALUES (6, NULL, NULL, 'Impedit repellendus dolor totam.', 'Fugit inventore ullam consequatur consectetur. Sequi quaerat sed omnis ut.', 3);
INSERT INTO `example` VALUES (7, NULL, NULL, 'Molestiae repellendus quam aut qui autem.', 'Quia distinctio assumenda error aut.', 3);
INSERT INTO `example` VALUES (8, NULL, NULL, 'Alias ea est hic.', 'Ut consequatur aut ab at. Maiores eveniet dolorem et architecto vel.', 4);
INSERT INTO `example` VALUES (9, NULL, NULL, 'Aut velit quos in.', 'Sequi id est magni aut in. Expedita sunt dolor animi incidunt.', 3);
INSERT INTO `example` VALUES (10, NULL, NULL, 'Voluptas quidem ratione quidem ipsam.', 'Maxime sequi ipsam autem quaerat pariatur omnis.', 4);
INSERT INTO `example` VALUES (11, NULL, NULL, 'Modi possimus quia.', 'Quisquam commodi aut ad ea consequuntur.', 2);
INSERT INTO `example` VALUES (12, NULL, NULL, 'Veritatis consequatur quia.', 'Temporibus nihil dolorum dolore fugit.', 4);
INSERT INTO `example` VALUES (13, NULL, NULL, 'Nulla suscipit laborum provident et.', 'Iure voluptas impedit provident earum voluptates eligendi repellendus.', 1);
INSERT INTO `example` VALUES (14, NULL, NULL, 'Facilis et consequatur eum iure quo.', 'Fuga rem et velit at eos et. Sapiente sed facere quos esse quia aut inventore.', 1);
INSERT INTO `example` VALUES (15, NULL, NULL, 'Qui non dolores dolor earum recusandae.', 'Corrupti possimus expedita dolores error esse rerum iure fugiat.', 1);
INSERT INTO `example` VALUES (16, NULL, NULL, 'Laboriosam nostrum praesentium ad aut.', 'Libero consequatur ut aliquam nihil voluptatem aut alias.', 4);
INSERT INTO `example` VALUES (17, NULL, NULL, 'Dolorem saepe saepe.', 'Est cum suscipit qui odit earum.', 1);
INSERT INTO `example` VALUES (18, NULL, NULL, 'In voluptatem ipsa distinctio molestias.', 'Ex vel ullam id.', 3);
INSERT INTO `example` VALUES (19, NULL, NULL, 'Quas dolore cupiditate.', 'Et aut qui animi labore. Non perspiciatis eveniet et repellat.', 3);
INSERT INTO `example` VALUES (20, NULL, NULL, 'Molestiae nisi qui.', 'Cumque rem corrupti magni laboriosam consequuntur et. Rerum iure qui dolore dolores.', 3);
INSERT INTO `example` VALUES (21, NULL, NULL, 'Necessitatibus aliquid modi non reprehenderit dolores.', 'Ipsum laborum et accusantium veniam non soluta consequatur. Recusandae tempore error occaecati magni omnis.', 1);
INSERT INTO `example` VALUES (22, NULL, NULL, 'Quis qui necessitatibus quo.', 'Reprehenderit molestiae aut labore totam.', 3);
INSERT INTO `example` VALUES (23, NULL, NULL, 'Atque et officiis exercitationem.', 'At repellendus distinctio molestias magnam alias sequi.', 1);
INSERT INTO `example` VALUES (24, NULL, NULL, 'Sed ab reprehenderit voluptas enim.', 'Est ab laudantium voluptatem velit.', 3);
INSERT INTO `example` VALUES (25, NULL, NULL, 'Fugiat autem quaerat omnis dolor eos.', 'Quo expedita eum est vitae sit aut pariatur pariatur.', 1);
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
-- Table structure for folder
-- ----------------------------
DROP TABLE IF EXISTS `folder`;
CREATE TABLE `folder` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int unsigned DEFAULT NULL,
  `resource` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of folder
-- ----------------------------
BEGIN;
INSERT INTO `folder` VALUES (1, NULL, NULL, 'root', NULL, NULL);
INSERT INTO `folder` VALUES (2, NULL, NULL, 'resource', 1, 1);
INSERT INTO `folder` VALUES (3, NULL, NULL, 'documents', 1, NULL);
INSERT INTO `folder` VALUES (4, NULL, NULL, 'graphics', 1, NULL);
INSERT INTO `folder` VALUES (5, NULL, NULL, 'other', 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for form
-- ----------------------------
DROP TABLE IF EXISTS `form`;
CREATE TABLE `form` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL,
  `edit` tinyint(1) NOT NULL,
  `add` tinyint(1) NOT NULL,
  `delete` tinyint(1) NOT NULL,
  `pagination` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of form
-- ----------------------------
BEGIN;
INSERT INTO `form` VALUES (1, NULL, NULL, 'Example', 'example', 1, 1, 1, 1, 5);
COMMIT;

-- ----------------------------
-- Table structure for form_field
-- ----------------------------
DROP TABLE IF EXISTS `form_field`;
CREATE TABLE `form_field` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browse` tinyint(1) NOT NULL,
  `read` tinyint(1) NOT NULL,
  `edit` tinyint(1) NOT NULL,
  `add` tinyint(1) NOT NULL,
  `relation_table` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation_column` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_id` int unsigned NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of form_field
-- ----------------------------
BEGIN;
INSERT INTO `form_field` VALUES (1, NULL, NULL, 'Title', 'text', 1, 1, 1, 1, NULL, NULL, 1, 'name');
INSERT INTO `form_field` VALUES (2, NULL, NULL, 'Description', 'text_area', 1, 1, 1, 1, NULL, NULL, 1, 'description');
INSERT INTO `form_field` VALUES (3, NULL, NULL, 'Status', 'relation_select', 1, 1, 1, 1, 'status', 'name', 1, 'status_id');
COMMIT;

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint unsigned NOT NULL,
  `uuid` bigint unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of media
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menus_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
BEGIN;
INSERT INTO `menu_role` VALUES (4, 'admin', 2);
INSERT INTO `menu_role` VALUES (5, 'admin', 3);
INSERT INTO `menu_role` VALUES (6, 'admin', 4);
INSERT INTO `menu_role` VALUES (7, 'admin', 5);
INSERT INTO `menu_role` VALUES (8, 'admin', 6);
INSERT INTO `menu_role` VALUES (9, 'admin', 7);
INSERT INTO `menu_role` VALUES (10, 'admin', 8);
INSERT INTO `menu_role` VALUES (11, 'admin', 9);
INSERT INTO `menu_role` VALUES (12, 'admin', 10);
INSERT INTO `menu_role` VALUES (15, 'user', 13);
INSERT INTO `menu_role` VALUES (16, 'admin', 13);
INSERT INTO `menu_role` VALUES (17, 'user', 14);
INSERT INTO `menu_role` VALUES (18, 'admin', 14);
INSERT INTO `menu_role` VALUES (19, 'user', 15);
INSERT INTO `menu_role` VALUES (20, 'admin', 15);
INSERT INTO `menu_role` VALUES (21, 'user', 16);
INSERT INTO `menu_role` VALUES (22, 'admin', 16);
INSERT INTO `menu_role` VALUES (23, 'user', 17);
INSERT INTO `menu_role` VALUES (24, 'admin', 17);
INSERT INTO `menu_role` VALUES (25, 'user', 18);
INSERT INTO `menu_role` VALUES (26, 'admin', 18);
INSERT INTO `menu_role` VALUES (27, 'user', 19);
INSERT INTO `menu_role` VALUES (28, 'admin', 19);
INSERT INTO `menu_role` VALUES (29, 'user', 20);
INSERT INTO `menu_role` VALUES (30, 'admin', 20);
INSERT INTO `menu_role` VALUES (31, 'user', 21);
INSERT INTO `menu_role` VALUES (32, 'admin', 21);
INSERT INTO `menu_role` VALUES (33, 'user', 22);
INSERT INTO `menu_role` VALUES (34, 'admin', 22);
INSERT INTO `menu_role` VALUES (35, 'user', 23);
INSERT INTO `menu_role` VALUES (36, 'admin', 23);
INSERT INTO `menu_role` VALUES (37, 'user', 24);
INSERT INTO `menu_role` VALUES (38, 'admin', 24);
INSERT INTO `menu_role` VALUES (39, 'user', 25);
INSERT INTO `menu_role` VALUES (40, 'admin', 25);
INSERT INTO `menu_role` VALUES (41, 'user', 26);
INSERT INTO `menu_role` VALUES (42, 'admin', 26);
INSERT INTO `menu_role` VALUES (43, 'user', 27);
INSERT INTO `menu_role` VALUES (44, 'admin', 27);
INSERT INTO `menu_role` VALUES (45, 'user', 28);
INSERT INTO `menu_role` VALUES (46, 'admin', 28);
INSERT INTO `menu_role` VALUES (47, 'user', 29);
INSERT INTO `menu_role` VALUES (48, 'admin', 29);
INSERT INTO `menu_role` VALUES (49, 'user', 30);
INSERT INTO `menu_role` VALUES (50, 'admin', 30);
INSERT INTO `menu_role` VALUES (51, 'user', 31);
INSERT INTO `menu_role` VALUES (52, 'admin', 31);
INSERT INTO `menu_role` VALUES (53, 'user', 32);
INSERT INTO `menu_role` VALUES (54, 'admin', 32);
INSERT INTO `menu_role` VALUES (55, 'user', 33);
INSERT INTO `menu_role` VALUES (56, 'admin', 33);
INSERT INTO `menu_role` VALUES (57, 'user', 34);
INSERT INTO `menu_role` VALUES (58, 'admin', 34);
INSERT INTO `menu_role` VALUES (59, 'user', 35);
INSERT INTO `menu_role` VALUES (60, 'admin', 35);
INSERT INTO `menu_role` VALUES (61, 'user', 36);
INSERT INTO `menu_role` VALUES (62, 'admin', 36);
INSERT INTO `menu_role` VALUES (63, 'user', 37);
INSERT INTO `menu_role` VALUES (64, 'admin', 37);
INSERT INTO `menu_role` VALUES (65, 'user', 38);
INSERT INTO `menu_role` VALUES (66, 'admin', 38);
INSERT INTO `menu_role` VALUES (67, 'user', 39);
INSERT INTO `menu_role` VALUES (68, 'admin', 39);
INSERT INTO `menu_role` VALUES (69, 'user', 40);
INSERT INTO `menu_role` VALUES (70, 'admin', 40);
INSERT INTO `menu_role` VALUES (71, 'user', 41);
INSERT INTO `menu_role` VALUES (72, 'admin', 41);
INSERT INTO `menu_role` VALUES (73, 'user', 42);
INSERT INTO `menu_role` VALUES (74, 'admin', 42);
INSERT INTO `menu_role` VALUES (75, 'user', 43);
INSERT INTO `menu_role` VALUES (76, 'admin', 43);
INSERT INTO `menu_role` VALUES (77, 'user', 44);
INSERT INTO `menu_role` VALUES (78, 'admin', 44);
INSERT INTO `menu_role` VALUES (79, 'user', 45);
INSERT INTO `menu_role` VALUES (80, 'admin', 45);
INSERT INTO `menu_role` VALUES (81, 'user', 46);
INSERT INTO `menu_role` VALUES (82, 'admin', 46);
INSERT INTO `menu_role` VALUES (83, 'user', 47);
INSERT INTO `menu_role` VALUES (84, 'admin', 47);
INSERT INTO `menu_role` VALUES (85, 'user', 48);
INSERT INTO `menu_role` VALUES (86, 'admin', 48);
INSERT INTO `menu_role` VALUES (87, 'user', 49);
INSERT INTO `menu_role` VALUES (88, 'admin', 49);
INSERT INTO `menu_role` VALUES (93, 'user', 52);
INSERT INTO `menu_role` VALUES (94, 'admin', 52);
INSERT INTO `menu_role` VALUES (95, 'user', 53);
INSERT INTO `menu_role` VALUES (96, 'admin', 53);
INSERT INTO `menu_role` VALUES (106, 'guest', 57);
INSERT INTO `menu_role` VALUES (107, 'user', 57);
INSERT INTO `menu_role` VALUES (108, 'admin', 57);
INSERT INTO `menu_role` VALUES (109, 'user', 58);
INSERT INTO `menu_role` VALUES (110, 'admin', 58);
INSERT INTO `menu_role` VALUES (111, 'admin', 59);
INSERT INTO `menu_role` VALUES (112, 'admin', 60);
INSERT INTO `menu_role` VALUES (113, 'admin', 61);
INSERT INTO `menu_role` VALUES (114, 'admin', 62);
INSERT INTO `menu_role` VALUES (115, 'admin', 63);
INSERT INTO `menu_role` VALUES (116, 'admin', 64);
INSERT INTO `menu_role` VALUES (117, 'admin', 65);
INSERT INTO `menu_role` VALUES (120, 'admin', 66);
INSERT INTO `menu_role` VALUES (121, 'mywayAdmin', 66);
INSERT INTO `menu_role` VALUES (122, 'schoolAdmin', 66);
INSERT INTO `menu_role` VALUES (123, 'admin', 67);
INSERT INTO `menu_role` VALUES (124, 'mywayAdmin', 67);
INSERT INTO `menu_role` VALUES (125, 'schoolAdmin', 67);
INSERT INTO `menu_role` VALUES (126, 'admin', 68);
INSERT INTO `menu_role` VALUES (127, 'mywayAdmin', 68);
INSERT INTO `menu_role` VALUES (128, 'schoolAdmin', 68);
INSERT INTO `menu_role` VALUES (132, 'admin', 56);
INSERT INTO `menu_role` VALUES (133, 'admin', 1);
COMMIT;

-- ----------------------------
-- Table structure for menulist
-- ----------------------------
DROP TABLE IF EXISTS `menulist`;
CREATE TABLE `menulist` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menulist
-- ----------------------------
BEGIN;
INSERT INTO `menulist` VALUES (1, 'sidebar menu');
INSERT INTO `menulist` VALUES (2, 'top menu');
INSERT INTO `menulist` VALUES (3, '邁威選單');
COMMIT;

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `href` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `menu_id` int unsigned NOT NULL,
  `sequence` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------
BEGIN;
INSERT INTO `menus` VALUES (1, 'Dashboard', '/', 'cil-speedometer', 'link', NULL, 1, 1);
INSERT INTO `menus` VALUES (2, 'Settings', NULL, 'cil-calculator', 'dropdown', NULL, 1, 2);
INSERT INTO `menus` VALUES (3, 'Notes', '/notes', NULL, 'link', 2, 1, 3);
INSERT INTO `menus` VALUES (4, 'Users', '/users', NULL, 'link', 2, 1, 4);
INSERT INTO `menus` VALUES (5, 'Edit menu', '/menu/menu', NULL, 'link', 2, 1, 5);
INSERT INTO `menus` VALUES (6, 'Edit menu elements', '/menu/element', NULL, 'link', 2, 1, 6);
INSERT INTO `menus` VALUES (7, 'Edit roles', '/roles', NULL, 'link', 2, 1, 7);
INSERT INTO `menus` VALUES (8, 'Media', '/media', NULL, 'link', 2, 1, 8);
INSERT INTO `menus` VALUES (9, 'BREAD', '/bread', NULL, 'link', 2, 1, 9);
INSERT INTO `menus` VALUES (10, 'Email', '/mail', NULL, 'link', 2, 1, 10);
INSERT INTO `menus` VALUES (13, 'Theme', NULL, NULL, 'title', NULL, 1, 13);
INSERT INTO `menus` VALUES (14, 'Colors', '/colors', 'cil-drop1', 'link', NULL, 1, 14);
INSERT INTO `menus` VALUES (15, 'Typography', '/typography', 'cil-pencil', 'link', NULL, 1, 15);
INSERT INTO `menus` VALUES (16, 'Base', NULL, 'cil-puzzle', 'dropdown', NULL, 1, 16);
INSERT INTO `menus` VALUES (17, 'Breadcrumb', '/base/breadcrumb', NULL, 'link', 16, 1, 17);
INSERT INTO `menus` VALUES (18, 'Cards', '/base/cards', NULL, 'link', 16, 1, 18);
INSERT INTO `menus` VALUES (19, 'Carousel', '/base/carousel', NULL, 'link', 16, 1, 19);
INSERT INTO `menus` VALUES (20, 'Collapse', '/base/collapse', NULL, 'link', 16, 1, 20);
INSERT INTO `menus` VALUES (21, 'Forms', '/base/forms', NULL, 'link', 16, 1, 21);
INSERT INTO `menus` VALUES (22, 'Jumbotron', '/base/jumbotron', NULL, 'link', 16, 1, 22);
INSERT INTO `menus` VALUES (23, 'List group', '/base/list-group', NULL, 'link', 16, 1, 23);
INSERT INTO `menus` VALUES (24, 'Navs', '/base/navs', NULL, 'link', 16, 1, 24);
INSERT INTO `menus` VALUES (25, 'Pagination', '/base/pagination', NULL, 'link', 16, 1, 25);
INSERT INTO `menus` VALUES (26, 'Popovers', '/base/popovers', NULL, 'link', 16, 1, 26);
INSERT INTO `menus` VALUES (27, 'Progress', '/base/progress', NULL, 'link', 16, 1, 27);
INSERT INTO `menus` VALUES (28, 'Scrollspy', '/base/scrollspy', NULL, 'link', 16, 1, 28);
INSERT INTO `menus` VALUES (29, 'Switches', '/base/switches', NULL, 'link', 16, 1, 29);
INSERT INTO `menus` VALUES (30, 'Tables', '/base/tables', NULL, 'link', 16, 1, 30);
INSERT INTO `menus` VALUES (31, 'Tabs', '/base/tabs', NULL, 'link', 16, 1, 31);
INSERT INTO `menus` VALUES (32, 'Tooltips', '/base/tooltips', NULL, 'link', 16, 1, 32);
INSERT INTO `menus` VALUES (33, 'Buttons', NULL, 'cil-cursor', 'dropdown', NULL, 1, 33);
INSERT INTO `menus` VALUES (34, 'Buttons', '/buttons/buttons', NULL, 'link', 33, 1, 34);
INSERT INTO `menus` VALUES (35, 'Buttons Group', '/buttons/button-group', NULL, 'link', 33, 1, 35);
INSERT INTO `menus` VALUES (36, 'Dropdowns', '/buttons/dropdowns', NULL, 'link', 33, 1, 36);
INSERT INTO `menus` VALUES (37, 'Brand Buttons', '/buttons/brand-buttons', NULL, 'link', 33, 1, 37);
INSERT INTO `menus` VALUES (38, 'Charts', '/charts', 'cil-chart-pie', 'link', NULL, 1, 38);
INSERT INTO `menus` VALUES (39, 'Icons', NULL, 'cil-star', 'dropdown', NULL, 1, 39);
INSERT INTO `menus` VALUES (40, 'CoreUI Icons', '/icon/coreui-icons', NULL, 'link', 39, 1, 40);
INSERT INTO `menus` VALUES (41, 'Flags', '/icon/flags', NULL, 'link', 39, 1, 41);
INSERT INTO `menus` VALUES (42, 'Brands', '/icon/brands', NULL, 'link', 39, 1, 42);
INSERT INTO `menus` VALUES (43, 'Notifications', NULL, 'cil-bell', 'dropdown', NULL, 1, 43);
INSERT INTO `menus` VALUES (44, 'Alerts', '/notifications/alerts', NULL, 'link', 43, 1, 44);
INSERT INTO `menus` VALUES (45, 'Badge', '/notifications/badge', NULL, 'link', 43, 1, 45);
INSERT INTO `menus` VALUES (46, 'Modals', '/notifications/modals', NULL, 'link', 43, 1, 46);
INSERT INTO `menus` VALUES (47, 'Widgets', '/widgets', 'cil-calculator', 'link', NULL, 1, 47);
INSERT INTO `menus` VALUES (48, 'Extras', NULL, NULL, 'title', NULL, 1, 48);
INSERT INTO `menus` VALUES (49, 'Pages', NULL, 'cil-star', 'dropdown', NULL, 1, 49);
INSERT INTO `menus` VALUES (52, 'Error 404', '/404', NULL, 'link', 49, 1, 52);
INSERT INTO `menus` VALUES (53, 'Error 500', '/500', NULL, 'link', 49, 1, 53);
INSERT INTO `menus` VALUES (56, 'Pages', NULL, NULL, 'dropdown', NULL, 2, 56);
INSERT INTO `menus` VALUES (57, 'Dashboard', '/', NULL, 'link', 56, 2, 57);
INSERT INTO `menus` VALUES (58, 'Notes', '/notes', NULL, 'link', 56, 2, 58);
INSERT INTO `menus` VALUES (59, 'Users', '/users', NULL, 'link', 56, 2, 59);
INSERT INTO `menus` VALUES (60, 'Settings', NULL, '', 'dropdown', NULL, 2, 60);
INSERT INTO `menus` VALUES (61, 'Edit menu', '/menu/menu', NULL, 'link', 60, 2, 61);
INSERT INTO `menus` VALUES (62, 'Edit menu elements', '/menu/element', NULL, 'link', 60, 2, 62);
INSERT INTO `menus` VALUES (63, 'Edit roles', '/roles', NULL, 'link', 60, 2, 63);
INSERT INTO `menus` VALUES (64, 'Media', '/media', NULL, 'link', 60, 2, 64);
INSERT INTO `menus` VALUES (65, 'BREAD', '/bread', NULL, 'link', 60, 2, 65);
INSERT INTO `menus` VALUES (66, '使用者設定', NULL, 'cil-user', 'dropdown', NULL, 3, 1);
INSERT INTO `menus` VALUES (67, '新增使用者', '/users/create', NULL, 'link', 66, 3, 2);
INSERT INTO `menus` VALUES (68, '使用者列表', '/users', NULL, 'link', 66, 3, 3);
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (8, '2020_11_27_094012_create_user_roles_table', 1);
INSERT INTO `migrations` VALUES (9, '2014_10_12_000000_create_users_table', 2);
INSERT INTO `migrations` VALUES (10, '2014_10_12_100000_create_password_resets_table', 2);
INSERT INTO `migrations` VALUES (11, '2019_08_19_000000_create_failed_jobs_table', 2);
INSERT INTO `migrations` VALUES (12, '2019_10_11_085455_create_notes_table', 2);
INSERT INTO `migrations` VALUES (13, '2019_10_12_115248_create_status_table', 2);
INSERT INTO `migrations` VALUES (14, '2019_11_08_102827_create_menus_table', 2);
INSERT INTO `migrations` VALUES (15, '2019_11_13_092213_create_menurole_table', 2);
INSERT INTO `migrations` VALUES (16, '2019_12_10_092113_create_permission_tables', 2);
INSERT INTO `migrations` VALUES (17, '2019_12_11_091036_create_menulist_table', 2);
INSERT INTO `migrations` VALUES (18, '2019_12_18_092518_create_role_hierarchy_table', 2);
INSERT INTO `migrations` VALUES (19, '2020_01_07_093259_create_folder_table', 2);
INSERT INTO `migrations` VALUES (20, '2020_01_08_184500_create_media_table', 2);
INSERT INTO `migrations` VALUES (21, '2020_01_21_161241_create_form_field_table', 2);
INSERT INTO `migrations` VALUES (22, '2020_01_21_161242_create_form_table', 2);
INSERT INTO `migrations` VALUES (23, '2020_01_21_161243_create_example_table', 2);
INSERT INTO `migrations` VALUES (24, '2020_03_12_111400_create_email_template_table', 2);
COMMIT;

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
BEGIN;
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 1);
INSERT INTO `model_has_roles` VALUES (9, 'App\\Models\\User', 1);
INSERT INTO `model_has_roles` VALUES (9, 'App\\Models\\User', 2);
INSERT INTO `model_has_roles` VALUES (9, 'App\\Models\\User', 3);
COMMIT;

-- ----------------------------
-- Table structure for notes
-- ----------------------------
DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applies_to_date` date NOT NULL,
  `users_id` int unsigned NOT NULL,
  `status_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of notes
-- ----------------------------
BEGIN;
INSERT INTO `notes` VALUES (1, 'Et perspiciatis dolorum.', 'Sapiente pariatur hic numquam. Autem sed exercitationem voluptatem culpa quae. Voluptatibus neque error quos.', 'voluptatibus est', '1999-06-16', 2, 1, NULL, NULL);
INSERT INTO `notes` VALUES (2, 'Facere quidem inventore aut.', 'Sequi sed exercitationem molestias repellendus. Consequuntur et adipisci expedita. Modi consequatur asperiores et delectus iste. Consequatur consequatur et incidunt dolore consequatur.', 'non', '1979-01-16', 2, 4, NULL, NULL);
INSERT INTO `notes` VALUES (3, 'Qui adipisci ipsam ut.', 'Omnis vitae eos labore voluptatem animi. Quia sunt necessitatibus consequatur sequi iste unde voluptate quia. Assumenda molestiae ut saepe ex rerum rerum omnis.', 'rem sint', '1995-06-27', 2, 4, NULL, NULL);
INSERT INTO `notes` VALUES (4, 'Saepe commodi consequatur necessitatibus harum.', 'Aspernatur nulla et reiciendis. Officiis aut ipsum voluptate. Omnis cupiditate voluptates sed reprehenderit voluptates sed est. Tempore molestiae incidunt praesentium sint dolor cum.', 'a facilis', '2012-09-03', 2, 4, NULL, NULL);
INSERT INTO `notes` VALUES (5, 'Consequatur sed quo nemo et molestiae.', 'Distinctio eveniet at veniam totam. Qui dolor voluptatem occaecati sit nulla. Pariatur repellat laborum eos nulla dolor.', 'consequatur', '1978-03-16', 2, 4, NULL, NULL);
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
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
INSERT INTO `permissions` VALUES (1, 'browse bread 1', 'web', '2020-12-15 03:38:22', '2020-12-15 03:38:22');
INSERT INTO `permissions` VALUES (2, 'read bread 1', 'web', '2020-12-15 03:38:22', '2020-12-15 03:38:22');
INSERT INTO `permissions` VALUES (3, 'edit bread 1', 'web', '2020-12-15 03:38:22', '2020-12-15 03:38:22');
INSERT INTO `permissions` VALUES (4, 'add bread 1', 'web', '2020-12-15 03:38:22', '2020-12-15 03:38:22');
INSERT INTO `permissions` VALUES (5, 'delete bread 1', 'web', '2020-12-15 03:38:22', '2020-12-15 03:38:22');
INSERT INTO `permissions` VALUES (6, 'browse bread 2', 'web', '2020-12-15 06:51:07', '2020-12-15 06:51:07');
INSERT INTO `permissions` VALUES (7, 'read bread 2', 'web', '2020-12-15 06:51:07', '2020-12-15 06:51:07');
INSERT INTO `permissions` VALUES (8, 'edit bread 2', 'web', '2020-12-15 06:51:07', '2020-12-15 06:51:07');
INSERT INTO `permissions` VALUES (9, 'add bread 2', 'web', '2020-12-15 06:51:07', '2020-12-15 06:51:07');
INSERT INTO `permissions` VALUES (10, 'delete bread 2', 'web', '2020-12-15 06:51:07', '2020-12-15 06:51:07');
COMMIT;

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
BEGIN;
INSERT INTO `role_has_permissions` VALUES (6, 1);
INSERT INTO `role_has_permissions` VALUES (7, 1);
INSERT INTO `role_has_permissions` VALUES (8, 1);
INSERT INTO `role_has_permissions` VALUES (9, 1);
INSERT INTO `role_has_permissions` VALUES (10, 1);
INSERT INTO `role_has_permissions` VALUES (6, 2);
INSERT INTO `role_has_permissions` VALUES (7, 2);
INSERT INTO `role_has_permissions` VALUES (8, 2);
INSERT INTO `role_has_permissions` VALUES (9, 2);
INSERT INTO `role_has_permissions` VALUES (10, 2);
INSERT INTO `role_has_permissions` VALUES (6, 3);
INSERT INTO `role_has_permissions` VALUES (7, 3);
INSERT INTO `role_has_permissions` VALUES (8, 3);
INSERT INTO `role_has_permissions` VALUES (9, 3);
INSERT INTO `role_has_permissions` VALUES (10, 3);
INSERT INTO `role_has_permissions` VALUES (1, 10);
INSERT INTO `role_has_permissions` VALUES (2, 10);
INSERT INTO `role_has_permissions` VALUES (3, 10);
INSERT INTO `role_has_permissions` VALUES (4, 10);
INSERT INTO `role_has_permissions` VALUES (5, 10);
COMMIT;

-- ----------------------------
-- Table structure for role_hierarchy
-- ----------------------------
DROP TABLE IF EXISTS `role_hierarchy`;
CREATE TABLE `role_hierarchy` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int unsigned NOT NULL,
  `hierarchy` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_hierarchy
-- ----------------------------
BEGIN;
INSERT INTO `role_hierarchy` VALUES (1, 1, 1);
INSERT INTO `role_hierarchy` VALUES (2, 2, 2);
INSERT INTO `role_hierarchy` VALUES (3, 3, 3);
INSERT INTO `role_hierarchy` VALUES (4, 4, 4);
INSERT INTO `role_hierarchy` VALUES (5, 5, 5);
INSERT INTO `role_hierarchy` VALUES (6, 6, 6);
INSERT INTO `role_hierarchy` VALUES (7, 7, 7);
INSERT INTO `role_hierarchy` VALUES (8, 8, 8);
INSERT INTO `role_hierarchy` VALUES (9, 9, 9);
INSERT INTO `role_hierarchy` VALUES (10, 10, 10);
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES (1, 'admin', 'web', '2020-12-15 03:38:21', '2020-12-15 03:38:21');
INSERT INTO `roles` VALUES (2, 'mywayAdmin', 'web', '2020-12-15 03:38:21', '2020-12-15 03:38:21');
INSERT INTO `roles` VALUES (3, 'schoolAdmin', 'web', '2020-12-15 03:38:21', '2020-12-15 03:38:21');
INSERT INTO `roles` VALUES (4, 'principal', 'web', '2020-12-15 03:38:21', '2020-12-15 03:38:21');
INSERT INTO `roles` VALUES (5, 'teacher', 'web', '2020-12-15 03:38:21', '2020-12-15 03:38:21');
INSERT INTO `roles` VALUES (6, 'assistant', 'web', '2020-12-15 03:38:21', '2020-12-15 03:38:21');
INSERT INTO `roles` VALUES (7, 'parent', 'web', '2020-12-15 03:38:21', '2020-12-15 03:38:21');
INSERT INTO `roles` VALUES (8, 'student', 'web', '2020-12-15 03:38:21', '2020-12-15 03:38:21');
INSERT INTO `roles` VALUES (9, 'user', 'web', '2020-12-15 03:38:21', '2020-12-15 03:38:21');
INSERT INTO `roles` VALUES (10, 'guest', 'web', '2020-12-15 03:38:21', '2020-12-15 03:38:21');
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
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of status
-- ----------------------------
BEGIN;
INSERT INTO `status` VALUES (1, 'ongoing', 'badge badge-pill badge-primary');
INSERT INTO `status` VALUES (2, 'stopped', 'badge badge-pill badge-secondary');
INSERT INTO `status` VALUES (3, 'completed', 'badge badge-pill badge-success');
INSERT INTO `status` VALUES (4, 'expired', 'badge badge-pill badge-warning');
COMMIT;

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `english_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menuroles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'admin', NULL, NULL, NULL, NULL, 'admin@admin.com', '2020-12-15 03:38:21', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 'j0qbKXmiI6FFMr1q5DtX8BPoKS2ASimjPXcHM7OBI0aPICvttlZstbs0vXAE', '2020-12-15 03:38:21', '2020-12-15 03:38:21', NULL, 1);
INSERT INTO `users` VALUES (6, 'test', NULL, NULL, NULL, NULL, 'tophet0929@gmail.com', NULL, '$2y$10$2zdhLPnCTLn0K/zihJBiz.1A5xHnlFCu07wrpuJLIlNB4g5F5SD5W', 'mywayAdmin', NULL, '2020-12-15 10:34:21', '2020-12-15 10:34:21', NULL, 1);
INSERT INTO `users` VALUES (19, 'teachera', NULL, NULL, NULL, NULL, 'test@gmail.com', NULL, '$2y$10$ApZ2vlv1bixjyb9180oMHefnKt1fF7SQRjZLObJuhVHZA/zR6bDIW', 'teacher', NULL, NULL, '2020-12-16 15:09:08', NULL, 1);
INSERT INTO `users` VALUES (23, 'linba', NULL, '0912345678', 'linba', NULL, 'linba@gmail.com', NULL, '$2y$10$RzpGqnPx3ipAQJmhhx451.27j6VhoCUSpBuXz/Zm0jxm7jcuyeTSS', 'parent', NULL, '2020-12-16 16:26:04', NULL, NULL, 1);
INSERT INTO `users` VALUES (24, 'linma', 'linma', '0912345678', 'linma', 'ss', 'linma@gmail.com', NULL, '$2y$10$d9uz1Z5HNK/5oyYhLiTrxe/.S/VMoi9LGB1993coxPTaKx4UzEQD2', 'parent', NULL, '2020-12-16 16:26:04', '2020-12-21 11:33:58', NULL, 1);
INSERT INTO `users` VALUES (25, '林寶', 'linbo', NULL, 'linbo', NULL, 'linbo@gmail.com', NULL, '$2y$10$xkJc3fqvsIwejWr3fRNnLOpExLh4eddWAY2dzTr2CMdhvWetGQz9e', 'student', NULL, '2020-12-16 16:26:04', '2020-12-21 11:51:44', NULL, 1);
INSERT INTO `users` VALUES (26, 'Q爸', NULL, '0912345678', 'qba', NULL, 'qba@gmail.com', NULL, '$2y$10$r6a55yCQJumWUtyabVMwsO.L6tZir1iHak/DnMIeD6CJBxfKUUlni', 'parent', NULL, '2020-12-21 12:31:53', NULL, NULL, 1);
INSERT INTO `users` VALUES (27, 'Q媽', NULL, '0987654321', 'qma', NULL, 'qma@gmail.com', NULL, '$2y$10$jvT43le9mr8zJA3SVONJ1ObVVKR3/bKBcWTf1XNfzf4dKwE38ouQy', 'parent', NULL, '2020-12-21 12:31:53', NULL, NULL, 1);
INSERT INTO `users` VALUES (28, 'Q寶', 'QQ', NULL, 'qbo', NULL, 'qbo@gmail.com', NULL, '$2y$10$iAuDWo1ogI9/0lQdcHHvOO3kcajlKNX4RpXaYz/MncaWEqf0AKWpO', 'student', NULL, '2020-12-21 12:31:53', NULL, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for users_student_infos
-- ----------------------------
DROP TABLE IF EXISTS `users_student_infos`;
CREATE TABLE `users_student_infos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL COMMENT '使用者ID',
  `class_id` int DEFAULT NULL COMMENT '班級ID',
  `parent_1_id` int DEFAULT NULL COMMENT '家長_1_ID',
  `parent_2_id` int DEFAULT NULL COMMENT '家長_2_ID',
  `other` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '備註',
  `start_date` date DEFAULT NULL COMMENT '入學日',
  `expire_date` date DEFAULT NULL COMMENT '退學日',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '建立日期',
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最後更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_student_infos
-- ----------------------------
BEGIN;
INSERT INTO `users_student_infos` VALUES (4, 25, NULL, 23, 24, 'otherss', '2020-12-18', '2020-12-31', '2020-12-16 16:26:04', '2020-12-21 20:25:41');
INSERT INTO `users_student_infos` VALUES (5, 28, NULL, 26, 27, 'p', '2020-12-22', '2020-12-31', '2020-12-21 12:31:53', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
