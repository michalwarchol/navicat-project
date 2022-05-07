/*
 Navicat Premium Data Transfer

 Source Server         : navicat
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : project

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 07/05/2022 20:17:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_cars
-- ----------------------------
DROP TABLE IF EXISTS `t_cars`;
CREATE TABLE `t_cars`  (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `price` int UNSIGNED NOT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `year_of_production` int UNSIGNED NOT NULL,
  `course` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `fuel` enum('diesel','petrol','hybrid','electric','gas') CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `combusion` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `colour` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `engine_capacity` int UNSIGNED NOT NULL,
  `id_tires` int UNSIGNED NOT NULL,
  `id_shop` int UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `id_tires`(`id_tires` ASC) USING BTREE,
  INDEX `id_shop`(`id_shop` ASC) USING BTREE,
  CONSTRAINT `t_cars_ibfk_1` FOREIGN KEY (`id_tires`) REFERENCES `t_tires` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_cars_ibfk_2` FOREIGN KEY (`id_shop`) REFERENCES `t_shops` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_customers
-- ----------------------------
DROP TABLE IF EXISTS `t_customers`;
CREATE TABLE `t_customers`  (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `city` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `car_id` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `car_id`(`car_id` ASC) USING BTREE,
  CONSTRAINT `car_id` FOREIGN KEY (`car_id`) REFERENCES `t_cars` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_previous_owners
-- ----------------------------
DROP TABLE IF EXISTS `t_previous_owners`;
CREATE TABLE `t_previous_owners`  (
  `customer_id` int UNSIGNED NOT NULL,
  `car_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`customer_id`, `car_id`) USING BTREE,
  INDEX `fk_car`(`car_id` ASC) USING BTREE,
  CONSTRAINT `fk_car` FOREIGN KEY (`car_id`) REFERENCES `t_cars` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_customer` FOREIGN KEY (`customer_id`) REFERENCES `t_customers` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_shops
-- ----------------------------
DROP TABLE IF EXISTS `t_shops`;
CREATE TABLE `t_shops`  (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `is_open` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_tires
-- ----------------------------
DROP TABLE IF EXISTS `t_tires`;
CREATE TABLE `t_tires`  (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `price` int UNSIGNED NOT NULL,
  `producent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `diameter` int UNSIGNED NOT NULL,
  `width` int UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
