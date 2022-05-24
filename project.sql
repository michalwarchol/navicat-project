/*
 Navicat Premium Data Transfer

 Source Server         : project
 Source Server Type    : MariaDB
 Source Server Version : 100607
 Source Host           : localhost:3306
 Source Schema         : project1

 Target Server Type    : MariaDB
 Target Server Version : 100607
 File Encoding         : 65001

 Date: 30/03/2022 20:05:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_cars
-- ----------------------------
DROP TABLE IF EXISTS `t_cars`;
CREATE TABLE `t_cars`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `price` int(10) UNSIGNED NOT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `year_of_production` int(4) UNSIGNED NOT NULL,
  `course` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `fuel` enum('diesel','petrol','hybrid','electric','gas') CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `combusion` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `colour` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `engine_capacity` int(4) UNSIGNED NOT NULL,
  `id_tires` int(10) UNSIGNED NOT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `id_tires`(`id_tires`) USING BTREE,
  INDEX `id_shop`(`id_shop`) USING BTREE,
  CONSTRAINT `t_cars_ibfk_1` FOREIGN KEY (`id_tires`) REFERENCES `t_tires` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_cars_ibfk_2` FOREIGN KEY (`id_shop`) REFERENCES `t_shops` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_shops
-- ----------------------------
DROP TABLE IF EXISTS `t_shops`;
CREATE TABLE `t_shops`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `is_open` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_tires
-- ----------------------------
DROP TABLE IF EXISTS `t_tires`;
CREATE TABLE `t_tires`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `price` int(10) UNSIGNED NOT NULL,
  `producent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `diameter` int(10) UNSIGNED NOT NULL,
  `width` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
