/*
 Navicat Premium Data Transfer

 Source Server         : mariadb
 Source Server Type    : MariaDB
 Source Server Version : 100608
 Source Host           : localhost:3307
 Source Schema         : projekt

 Target Server Type    : MariaDB
 Target Server Version : 100608
 File Encoding         : 65001

 Date: 19/06/2022 12:59:40
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
  `year_of_production` year NOT NULL,
  `course` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `combusion` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `colour` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `id_tires` int(10) UNSIGNED NOT NULL,
  `engines` set('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL DEFAULT '',
  `automatic_gearbox` tinyint(1) NULL DEFAULT 0,
  `amount` int(11) NOT NULL,
  `VAT` int(11) NOT NULL DEFAULT 23,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `id_tires`(`id_tires`) USING BTREE,
  CONSTRAINT `t_cars_ibfk_1` FOREIGN KEY (`id_tires`) REFERENCES `t_tires` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1279 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cars
-- ----------------------------
INSERT INTO `t_cars` VALUES (1, 248000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23);
INSERT INTO `t_cars` VALUES (2, 185000, 'Mitsubishi', 'Lancer EVO X', 2008, '110000', '13', 'white', 3, '', 0, 8, 23);
INSERT INTO `t_cars` VALUES (3, 55900, 'Ford', 'Focus', 2016, '17000', '8', 'dark blue', 2, '', 0, 5, 23);
INSERT INTO `t_cars` VALUES (4, 73500, 'Kia', 'Sportage', 2017, '47000', '8', 'white', 4, '1,2', 0, 2, 23);
INSERT INTO `t_cars` VALUES (5, 26000, 'Opel', 'Astra', 2013, '230570', '6,5', 'red', 2, '', 1, 1, 23);
INSERT INTO `t_cars` VALUES (6, 31700, 'Mazda', '5', 2011, '134000', '9', 'silver', 1, '', 0, 10, 23);
INSERT INTO `t_cars` VALUES (7, 219900, 'Mercedes-Benz', 'Klasa G', 2010, '72000', '21', 'black', 4, '', 0, 4, 23);
INSERT INTO `t_cars` VALUES (8, 68500, 'Ford', 'Mondeo', 2018, '165888', 'no information', 'black', 2, '', 1, 3, 23);

-- ----------------------------
-- Table structure for t_cars_old
-- ----------------------------
DROP TABLE IF EXISTS `t_cars_old`;
CREATE TABLE `t_cars_old`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_car` int(10) NOT NULL,
  `price` int(11) NOT NULL,
  `brand` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `year_of_production` year NOT NULL,
  `course` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `combusion` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `colour` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_tires` int(11) NOT NULL,
  `engines` set('1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `automatic_gearbox` tinyint(4) NOT NULL,
  `amount` int(11) NOT NULL,
  `VAT` int(11) NOT NULL DEFAULT 23,
  `TYPE` enum('INSERT','UPDATE','DELETE') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic PARTITION BY SYSTEM_TIME (unix_timestamp(`row_end`))
PARTITIONS 2
(PARTITION `p_current` ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_history` ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Records of t_cars_old
-- ----------------------------
INSERT INTO `t_cars_old` VALUES (1, 1278, 45555, 'Ford', 'Fiesta', 2019, '0', '5', 'white', 1, '1', 1, 5, 23, 'INSERT', '2022-06-18 19:03:21');
INSERT INTO `t_cars_old` VALUES (2, 1278, 45555, 'Ford', 'Fiestaa', 2019, '0', '5', 'white', 1, '1', 1, 5, 23, 'UPDATE', '2022-06-18 19:07:42');
INSERT INTO `t_cars_old` VALUES (3, 1278, 45555, 'Ford', 'Fiestaa', 2019, '0', '5', 'white', 1, '1', 1, 5, 23, 'DELETE', '2022-06-18 19:07:54');
INSERT INTO `t_cars_old` VALUES (4, 1, 200000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 11:23:03');
INSERT INTO `t_cars_old` VALUES (5, 2, 185000, 'Mitsubishi', 'Lancer EVO X', 2008, '110000', '13', 'white', 3, '', 0, 0, 23, 'UPDATE', '2022-06-19 11:23:04');
INSERT INTO `t_cars_old` VALUES (6, 3, 55900, 'Ford', 'Focus', 2016, '17000', '8', 'dark blue', 2, '', 0, 1, 23, 'UPDATE', '2022-06-19 11:23:04');
INSERT INTO `t_cars_old` VALUES (7, 4, 73500, 'Kia', 'Sportage', 2017, '47000', '8', 'white', 4, '1,2', 0, 1, 23, 'UPDATE', '2022-06-19 11:23:05');
INSERT INTO `t_cars_old` VALUES (8, 5, 26000, 'Opel', 'Astra', 2013, '230570', '6,5', 'red', 2, '', 1, 1, 23, 'UPDATE', '2022-06-19 11:23:08');
INSERT INTO `t_cars_old` VALUES (9, 6, 31700, 'Mazda', '5', 2011, '134000', '9', 'silver', 1, '', 0, 1, 23, 'UPDATE', '2022-06-19 11:23:09');
INSERT INTO `t_cars_old` VALUES (10, 8, 68500, 'Ford', 'Mondeo', 2018, '165888', 'no information', 'black', 2, '', 1, 3, 23, 'UPDATE', '2022-06-19 11:23:11');
INSERT INTO `t_cars_old` VALUES (11, 7, 219900, 'Mercedes-Benz', 'Klasa G', 2010, '72000', '21', 'black', 4, '', 0, 3, 23, 'UPDATE', '2022-06-19 11:23:16');
INSERT INTO `t_cars_old` VALUES (12, 2, 185000, 'Mitsubishi', 'Lancer EVO X', 2008, '110000', '13', 'white', 3, '', 0, 8, 23, 'UPDATE', '2022-06-19 11:23:21');
INSERT INTO `t_cars_old` VALUES (13, 3, 55900, 'Ford', 'Focus', 2016, '17000', '8', 'dark blue', 2, '', 0, 5, 23, 'UPDATE', '2022-06-19 11:23:23');
INSERT INTO `t_cars_old` VALUES (14, 4, 73500, 'Kia', 'Sportage', 2017, '47000', '8', 'white', 4, '1,2', 0, 2, 23, 'UPDATE', '2022-06-19 11:23:24');
INSERT INTO `t_cars_old` VALUES (15, 6, 31700, 'Mazda', '5', 2011, '134000', '9', 'silver', 1, '', 0, 12, 23, 'UPDATE', '2022-06-19 11:23:28');
INSERT INTO `t_cars_old` VALUES (16, 7, 219900, 'Mercedes-Benz', 'Klasa G', 2010, '72000', '21', 'black', 4, '', 0, 4, 23, 'UPDATE', '2022-06-19 11:23:32');
INSERT INTO `t_cars_old` VALUES (17, 6, 31700, 'Mazda', '5', 2011, '134000', '9', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:19:13');
INSERT INTO `t_cars_old` VALUES (18, 1, 201000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:37');
INSERT INTO `t_cars_old` VALUES (19, 1, 202000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:38');
INSERT INTO `t_cars_old` VALUES (20, 1, 203000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:39');
INSERT INTO `t_cars_old` VALUES (21, 1, 204000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:40');
INSERT INTO `t_cars_old` VALUES (22, 1, 205000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:41');
INSERT INTO `t_cars_old` VALUES (23, 1, 206000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:42');
INSERT INTO `t_cars_old` VALUES (24, 1, 207000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:43');
INSERT INTO `t_cars_old` VALUES (25, 1, 208000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:44');
INSERT INTO `t_cars_old` VALUES (26, 1, 209000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:45');
INSERT INTO `t_cars_old` VALUES (27, 1, 210000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:46');
INSERT INTO `t_cars_old` VALUES (28, 1, 211000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:47');
INSERT INTO `t_cars_old` VALUES (29, 1, 212000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:48');
INSERT INTO `t_cars_old` VALUES (30, 1, 213000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:49');
INSERT INTO `t_cars_old` VALUES (31, 1, 214000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:50');
INSERT INTO `t_cars_old` VALUES (32, 1, 215000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:51');
INSERT INTO `t_cars_old` VALUES (33, 1, 216000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:52');
INSERT INTO `t_cars_old` VALUES (34, 1, 217000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:53');
INSERT INTO `t_cars_old` VALUES (35, 1, 218000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:54');
INSERT INTO `t_cars_old` VALUES (36, 1, 219000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:55');
INSERT INTO `t_cars_old` VALUES (37, 1, 220000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:56');
INSERT INTO `t_cars_old` VALUES (38, 1, 221000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:57');
INSERT INTO `t_cars_old` VALUES (39, 1, 222000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:58');
INSERT INTO `t_cars_old` VALUES (40, 1, 223000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:54:59');
INSERT INTO `t_cars_old` VALUES (41, 1, 224000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:00');
INSERT INTO `t_cars_old` VALUES (42, 1, 225000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:01');
INSERT INTO `t_cars_old` VALUES (43, 1, 226000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:02');
INSERT INTO `t_cars_old` VALUES (44, 1, 227000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:03');
INSERT INTO `t_cars_old` VALUES (45, 1, 228000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:04');
INSERT INTO `t_cars_old` VALUES (46, 1, 229000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:05');
INSERT INTO `t_cars_old` VALUES (47, 1, 230000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:06');
INSERT INTO `t_cars_old` VALUES (48, 1, 231000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:07');
INSERT INTO `t_cars_old` VALUES (49, 1, 232000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:08');
INSERT INTO `t_cars_old` VALUES (50, 1, 233000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:09');
INSERT INTO `t_cars_old` VALUES (51, 1, 234000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:10');
INSERT INTO `t_cars_old` VALUES (52, 1, 235000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:11');
INSERT INTO `t_cars_old` VALUES (53, 1, 236000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:12');
INSERT INTO `t_cars_old` VALUES (54, 1, 237000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:13');
INSERT INTO `t_cars_old` VALUES (55, 1, 238000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:14');
INSERT INTO `t_cars_old` VALUES (56, 1, 239000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:15');
INSERT INTO `t_cars_old` VALUES (57, 1, 240000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:16');
INSERT INTO `t_cars_old` VALUES (58, 1, 241000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:17');
INSERT INTO `t_cars_old` VALUES (59, 1, 242000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:18');
INSERT INTO `t_cars_old` VALUES (60, 1, 243000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:19');
INSERT INTO `t_cars_old` VALUES (61, 1, 244000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:20');
INSERT INTO `t_cars_old` VALUES (62, 1, 245000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:21');
INSERT INTO `t_cars_old` VALUES (63, 1, 246000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:22');
INSERT INTO `t_cars_old` VALUES (64, 1, 247000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:23');
INSERT INTO `t_cars_old` VALUES (65, 1, 248000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', 0, 10, 23, 'UPDATE', '2022-06-19 12:55:24');

-- ----------------------------
-- Table structure for t_cart_cars
-- ----------------------------
DROP TABLE IF EXISTS `t_cart_cars`;
CREATE TABLE `t_cart_cars`  (
  `id_cart` int(10) UNSIGNED NOT NULL,
  `id_car` int(10) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id_cart`, `id_car`) USING BTREE,
  INDEX `fk_cart_car`(`id_car`) USING BTREE,
  CONSTRAINT `fk_cart_car` FOREIGN KEY (`id_car`) REFERENCES `t_cars` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cart_cart` FOREIGN KEY (`id_cart`) REFERENCES `t_carts` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cart_cars
-- ----------------------------

-- ----------------------------
-- Table structure for t_carts
-- ----------------------------
DROP TABLE IF EXISTS `t_carts`;
CREATE TABLE `t_carts`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `total_price` int(11) NOT NULL DEFAULT 0,
  `car_amount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fk_customer_cart`(`customer_id`) USING BTREE,
  INDEX `ID`(`ID`, `total_price`) USING BTREE,
  INDEX `total_price`(`total_price`) USING BTREE,
  CONSTRAINT `fk_customer_cart` FOREIGN KEY (`customer_id`) REFERENCES `t_customers` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_carts
-- ----------------------------
INSERT INTO `t_carts` VALUES (3, 58, 0, 0);
INSERT INTO `t_carts` VALUES (4, 59, 0, 0);
INSERT INTO `t_carts` VALUES (5, 60, 0, 0);
INSERT INTO `t_carts` VALUES (7, 62, 0, 0);
INSERT INTO `t_carts` VALUES (8, 63, 0, 0);

-- ----------------------------
-- Table structure for t_carts_archive
-- ----------------------------
DROP TABLE IF EXISTS `t_carts_archive`;
CREATE TABLE `t_carts_archive`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) UNSIGNED NOT NULL,
  `car_id` int(10) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `order_number` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `price` int(11) NOT NULL,
  `VAT` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fk_cart`(`cart_id`) USING BTREE,
  INDEX `fk_car`(`car_id`) USING BTREE,
  INDEX `order_number`(`order_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_carts_archive
-- ----------------------------
INSERT INTO `t_carts_archive` VALUES (19, 1, 2, 2, 'd9f497dc-ee88-11ec-acf7-fcaa140ffb45', 0, 0);
INSERT INTO `t_carts_archive` VALUES (20, 1, 5, 1, 'df68bac0-eee8-11ec-acfd-fcaa140ffb45', 26000, 23);
INSERT INTO `t_carts_archive` VALUES (21, 1, 3, 1, 'f706faea-eeea-11ec-acfd-fcaa140ffb45', 55900, 23);
INSERT INTO `t_carts_archive` VALUES (22, 1, 6, 2, 'f706faea-eeea-11ec-acfd-fcaa140ffb45', 31700, 23);
INSERT INTO `t_carts_archive` VALUES (23, 5, 6, 2, '431bdbf1-efb9-11ec-abf2-fcaa140ffb45', 31700, 23);

-- ----------------------------
-- Table structure for t_customers
-- ----------------------------
DROP TABLE IF EXISTS `t_customers`;
CREATE TABLE `t_customers`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `nickname` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `postal_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customers
-- ----------------------------
INSERT INTO `t_customers` VALUES (58, 'Tadeusz', 'Nowak', 't_nowak', '*058C73C399BEFE8004B26B5D8A8A1B94D49C6397', 'ul. Hetmańska 62', 'Rzeszów', '35-046');
INSERT INTO `t_customers` VALUES (59, 'Bożena', 'Lipska', 'bozenka72', '*3CA64CBE8E2699F1A79C4763E74524741B12505A', 'ul. Jodłowa 94', 'Kraków', '30-251');
INSERT INTO `t_customers` VALUES (60, 'Mariusz', 'Pudzianowski', 'pudzian', '*4D6178C5EE3A2837A3298B5F2C62BFA3BC3417AA', 'ul. Wspólna 87', 'Poznań', '61-479');
INSERT INTO `t_customers` VALUES (62, 'Arkadiusz', 'Stępień', 'a_stępień', '*3F2002925BBF855594E3B34F613416CBB35C9E50', 'ul. Bolesława Chrobrego 41', 'Zielona Góra', '65-052');
INSERT INTO `t_customers` VALUES (63, 'Kinga', 'Zając', 'k_zając', '*B1E6AB80F4C323903B861A4450185634EEBD8282', 'ul. Lotnicza 41', 'Kwidzyn', '82-504');

-- ----------------------------
-- Table structure for t_engines
-- ----------------------------
DROP TABLE IF EXISTS `t_engines`;
CREATE TABLE `t_engines`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cylinders` int(11) NOT NULL,
  `horsepower` int(11) NOT NULL,
  `volume` int(11) NOT NULL,
  `fuel` enum('diesel','petrol','hybrid','electric','gas') CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL DEFAULT 'petrol',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_engines
-- ----------------------------
INSERT INTO `t_engines` VALUES (1, 4, 320, 1969, 'petrol');
INSERT INTO `t_engines` VALUES (2, 3, 86, 1197, 'petrol');
INSERT INTO `t_engines` VALUES (3, 4, 190, 1968, 'diesel');

-- ----------------------------
-- Table structure for t_invoices
-- ----------------------------
DROP TABLE IF EXISTS `t_invoices`;
CREATE TABLE `t_invoices`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_of_invoice` date NOT NULL,
  `customer_id` int(11) UNSIGNED NOT NULL,
  `order_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `payment_method` enum('cash','bank transfer') CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL DEFAULT 'bank transfer',
  `date_of_payment` date NOT NULL,
  `date_of_purchase` date NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fk_order_id`(`order_id`) USING BTREE,
  INDEX `fk_invoice_customer_id`(`customer_id`) USING BTREE,
  CONSTRAINT `fk_invoice_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `t_customers` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_invoices
-- ----------------------------
INSERT INTO `t_invoices` VALUES (28, '2022-06-19', 60, '431bdbf1-efb9-11ec-abf2-fcaa140ffb45', 'cash', '2022-06-19', '2022-06-19');
INSERT INTO `t_invoices` VALUES (29, '2022-06-19', 60, '73eff494-efbc-11ec-abf2-fcaa140ffb45', 'cash', '2022-06-19', '2022-06-19');
INSERT INTO `t_invoices` VALUES (30, '2022-06-19', 60, 'd8b1d3b1-efbc-11ec-abf2-fcaa140ffb45', 'cash', '2022-06-19', '2022-06-19');
INSERT INTO `t_invoices` VALUES (31, '2022-06-19', 60, '0b62f5cd-efbd-11ec-abf2-fcaa140ffb45', 'cash', '2022-06-19', '2022-06-19');

-- ----------------------------
-- Table structure for t_orders
-- ----------------------------
DROP TABLE IF EXISTS `t_orders`;
CREATE TABLE `t_orders`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `order_number` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fk_invoice`(`invoice_id`) USING BTREE,
  CONSTRAINT `fk_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `t_invoices` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_orders
-- ----------------------------
INSERT INTO `t_orders` VALUES (8, '2022-06-19 12:19:13', 28, '431bdbf1-efb9-11ec-abf2-fcaa140ffb45');
INSERT INTO `t_orders` VALUES (9, '2022-06-19 12:42:04', 29, '73eff494-efbc-11ec-abf2-fcaa140ffb45');
INSERT INTO `t_orders` VALUES (10, '2022-06-19 12:44:53', 30, 'd8b1d3b1-efbc-11ec-abf2-fcaa140ffb45');
INSERT INTO `t_orders` VALUES (11, '2022-06-19 12:46:18', 31, '0b62f5cd-efbd-11ec-abf2-fcaa140ffb45');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tires
-- ----------------------------
INSERT INTO `t_tires` VALUES (1, 1125, 'Yokohama', '40', 19, 285);
INSERT INTO `t_tires` VALUES (2, 142, 'Debica', '	80', 13, 135);
INSERT INTO `t_tires` VALUES (3, 360, 'Continental', '	55', 16, 205);
INSERT INTO `t_tires` VALUES (4, 3460, 'Goodyear', '	40', 21, 255);

-- ----------------------------
-- View structure for v_cars_tires_shops
-- ----------------------------
DROP VIEW IF EXISTS `v_cars_tires_shops`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_cars_tires_shops` AS #select brand, mode, year_of_production from t_cars

select brand, mode, year_of_production, profile as tire_profile, diameter as tire_diameter, width as tire_width from t_cars, t_tires where t_cars.id_tires = t_tires.ID ; ;

-- ----------------------------
-- Function structure for f_cars_count
-- ----------------------------
DROP FUNCTION IF EXISTS `f_cars_count`;
delimiter ;;
CREATE FUNCTION `f_cars_count`(cars_brand varchar(30))
 RETURNS int(11)
BEGIN
declare ile int;
select count(*) into ile from t_cars where brand like concat('%',cars_brand,'%');
RETURN ile;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_add_car_to_cart
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_add_car_to_cart`;
delimiter ;;
CREATE PROCEDURE `p_add_car_to_cart`(IN `vCarID` int,IN `vCartID` int)
BEGIN
	DECLARE isInDb int;
	SET isInDB = (SELECT count(*) FROM t_cart_cars WHERE id_car=vCarID AND id_cart=vCartID);
	
	IF isInDB > 0 THEN
		UPDATE t_cart_cars SET amount=isInDb+1 WHERE id_cart=vCartID AND id_car=vCarID;
	ELSE
		INSERT INTO t_cart_cars (id_cart, id_car, amount) VALUES (vCartID, vCarID, 1);
	END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_add_parameter
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_add_parameter`;
delimiter ;;
CREATE PROCEDURE `p_add_parameter`(IN `vTable` varchar(50), IN `vColumnName` varchar(50),IN `type` varchar(300))
BEGIN
	DECLARE sqlQuery VARCHAR(500);
	SET sqlQuery = CONCAT("ALTER TABLE ", vTable, " ADD ", vColumnName, " ", type, ";");
	EXECUTE IMMEDIATE sqlQuery;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_create_user
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_create_user`;
delimiter ;;
CREATE PROCEDURE `p_create_user`(IN `vFirstName` varchar(50) ,IN `vLastName` varchar(50),IN `vPassword` varchar(50),IN `vAddress` varchar(50),IN `vPostalCode` varchar(50),IN `vCity` varchar(50))
BEGIN
	INSERT INTO t_customers (first_name, last_name, password, address, postal_code, city) VALUES (vFirstName, vLastName, PASSWORD(vPassword), vAddress, vPostalCode, vCity);

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_delete_car_from_cart
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_delete_car_from_cart`;
delimiter ;;
CREATE PROCEDURE `p_delete_car_from_cart`(IN `vCarID` int,IN `vCartID` int)
BEGIN
	DECLARE isInDb int;
	SET isInDB = (SELECT count(*) FROM t_cart_cars WHERE id_car=vCarID AND id_cart=vCartID);
	
	IF isInDB > 1 THEN
		UPDATE t_cart_cars SET amount=isInDb-1 WHERE id_cart=vCartID AND id_car=vCarID;
	ELSE
		DELETE FROM t_cart_cars WHERE id_cart=vCartID AND id_car=vCarID;
	END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_delete_parameter
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_delete_parameter`;
delimiter ;;
CREATE PROCEDURE `p_delete_parameter`(IN `vTable` VARCHAR(50), IN `vColumnName` VARCHAR(50))
BEGIN
	DECLARE sqlQuery VARCHAR(200);
	SET sqlQuery = CONCAT("ALTER TABLE ", vTable, " DROP COLUMN ", vColumnName, ";");
	EXECUTE IMMEDIATE sqlQuery;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_format_tire_parameters
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_format_tire_parameters`;
delimiter ;;
CREATE PROCEDURE `p_format_tire_parameters`()
BEGIN
	select producent, concat(width, '/', profile, ' R', diameter) tire from t_tires;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_get_car_age
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_get_car_age`;
delimiter ;;
CREATE PROCEDURE `p_get_car_age`()
BEGIN
	select brand, mode, (YEAR(CURDATE()) - (YEAR(year_of_production))) age from t_cars;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_make_order
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_make_order`;
delimiter ;;
CREATE PROCEDURE `p_make_order`(IN `vCartID` int, IN vPaymentMethod VARCHAR(14))
BEGIN
	DECLARE canCommit int;
	DECLARE ORDERID VARCHAR(36);
	DECLARE customerID int;
	DECLARE invoiceID int;
	DECLARE payment VARCHAR(14);
	START TRANSACTION;
		SET canCommit = (SELECT count(*) FROM t_cart_cars LEFT JOIN t_cars ON id_car=t_cars.ID WHERE id_cart=vCartID AND t_cart_cars.amount > t_cars.amount);
		
		IF NOT EXISTS (SELECT * FROM t_cart_cars WHERE id_cart=vCartID) THEN
			SELECT "Brak produktów w koszyku!" AS "Komunikat";
			ROLLBACK;
		END IF;
		
		IF canCommit > 0 THEN
			SELECT "Brak samochodów na stanie!" AS "Komunikat";
			ROLLBACK;
		ELSE
		
			IF vPaymentMethod IS NULL THEN
				SET payment = "bank transfer";
			ELSE
				SET payment = vPaymentMethod;
			END IF;

			SET ORDERID = UUID();
			SELECT customer_id INTO customerID from t_carts WHERE ID=vCartID;
			
			#tworzenie faktury
			INSERT INTO t_invoices (date_of_invoice, customer_id, order_id, date_of_payment, date_of_purchase, payment_method) VALUES (CURRENT_DATE(), customerID, ORDERID, CURRENT_DATE(), CURRENT_DATE(), payment);

			#wstawianie zamówionych samochodów do archiwalnej tabeli
			#odejmowanie kupionych samochodów ze stanu
			FOR a IN (SELECT id_car, t_cart_cars.amount, price, VAT FROM t_cart_cars LEFT JOIN t_cars ON id_car=t_cars.ID WHERE id_cart=vCartID) DO
				INSERT INTO t_carts_archive (cart_id, car_id, amount, order_number, price, VAT) VALUES (vCartID, a.id_car, a.amount, ORDERID, a.price, a.VAT);
				UPDATE t_cars SET amount=amount-a.amount WHERE t_cars.ID = a.id_car;
			END FOR;

			SELECT ID INTO invoiceID FROM t_invoices WHERE order_id=ORDERID;

			#tworzenie zamówienia
			INSERT INTO t_orders (created_at, invoice_id, order_number) VALUES (NOW(), invoiceID, ORDERID);

			#czyszczenie koszyka
			DELETE FROM t_cart_cars WHERE id_cart=vCartID;
			
			COMMIT;
		END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_price_filter
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_price_filter`;
delimiter ;;
CREATE PROCEDURE `p_price_filter`(IN `vFrom` DOUBLE, IN `vTo` DOUBLE, IN `vOrder` CHAR(4))
BEGIN
	
IF vOrder LIKE "ASC" THEN
	SELECT * FROM t_cars WHERE price BETWEEN vFrom AND vTo ORDER BY price ASC;
ELSE
	SELECT * FROM t_cars WHERE price BETWEEN vFrom AND vTo ORDER BY price DESC;
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_search
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_search`;
delimiter ;;
CREATE PROCEDURE `p_search`(IN `vName` VARCHAR(50))
BEGIN
	SELECT mode AS "nazwa", "t_cars" AS "tabela" FROM t_cars WHERE mode LIKE concat("%", vName, "%")
	UNION ALL SELECT last_name AS "nazwa", "t_customers" AS "tabela" FROM t_customers WHERE last_name LIKE concat("%", vName, "%")
	UNION ALL SELECT producent AS "nazwa", "t_tires" AS "tabela" FROM t_tires WHERE producent LIKE concat("%", vName, "%")
	ORDER BY nazwa;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_show_cart
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_show_cart`;
delimiter ;;
CREATE PROCEDURE `p_show_cart`(IN `customer_id` int)
BEGIN

	select brand, mode from t_cart_cars left join t_cars on id_car = t_cars.ID where id_cart = customer_id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_show_invoice
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_show_invoice`;
delimiter ;;
CREATE PROCEDURE `p_show_invoice`(IN `vInvoiceID` INT)
BEGIN
	CALL p_show_invoice_customer_data(vInvoiceID);
	
	CALL p_show_invoice_records(vInvoiceID);
	
	CALL p_show_invoice_summary(vInvoiceID);

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_show_invoice_customer_data
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_show_invoice_customer_data`;
delimiter ;;
CREATE PROCEDURE `p_show_invoice_customer_data`(IN `vInvoiceID` INT)
BEGIN
	DECLARE CUSTOMERID VARCHAR(36);
	SELECT customer_id INTO CUSTOMERID FROM t_invoices WHERE ID=vInvoiceID;
	
	SELECT first_name, last_name, address, postal_code, city FROM t_customers WHERE ID=CUSTOMERID;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_show_invoice_records
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_show_invoice_records`;
delimiter ;;
CREATE PROCEDURE `p_show_invoice_records`(IN `vInvoiceID` INT)
BEGIN
	DECLARE ORDERID VARCHAR(36);
	SELECT order_id INTO ORDERID FROM t_invoices WHERE ID=vInvoiceID;

	SELECT 
		CONCAT(brand, " ", mode) AS "name",
		t_carts_archive.amount,
		t_carts_archive.price * t_carts_archive.amount AS "price",
		CONCAT(t_carts_archive.VAT, "%") AS "VAT",
		t_carts_archive.price*t_carts_archive.VAT/100 * t_carts_archive.amount AS "VAT price",
		(t_carts_archive.price+t_carts_archive.price*t_carts_archive.VAT/100) * t_carts_archive.amount AS "brutto"
	FROM t_carts_archive LEFT JOIN t_cars ON car_id=t_cars.id WHERE order_number=ORDERID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_show_invoice_summary
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_show_invoice_summary`;
delimiter ;;
CREATE PROCEDURE `p_show_invoice_summary`(IN `vInvoiceID` INT)
BEGIN
	DECLARE ORDERID VARCHAR(36);
	SELECT order_id INTO ORDERID FROM t_invoices WHERE ID=vInvoiceID;
	
	SELECT SUM(price*amount) AS "netto", SUM(price*VAT/100 * amount) AS "cena VAT", SUM((price + price*VAT/100) * amount) AS "brutto" FROM t_carts_archive WHERE order_number=ORDERID;
END
;;
delimiter ;

-- ----------------------------
-- Event structure for e_price_update
-- ----------------------------
DROP EVENT IF EXISTS `e_price_update`;
delimiter ;;
CREATE EVENT `e_price_update`
ON SCHEDULE
EVERY '1' HOUR STARTS '2022-06-19 20:45:00' ENDS '2022-06-19 22:00:00'
ON COMPLETION PRESERVE
DO update t_cars set price = price + 1000
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table t_cars
-- ----------------------------
DROP TRIGGER IF EXISTS `t_car_insert`;
delimiter ;;
CREATE TRIGGER `t_car_insert` AFTER INSERT ON `t_cars` FOR EACH ROW BEGIN

INSERT 
INTO t_cars_old (id_car, price, brand, mode, year_of_production, course, combusion, colour, id_tires, engines, automatic_gearbox, amount, VAT, TYPE, date) 
VALUES (NEW.ID, NEW.price, NEW.brand, NEW.mode, NEW.year_of_production, NEW.course, NEW.combusion, NEW.colour, NEW.id_tires, NEW.engines, NEW.automatic_gearbox, NEW.amount, NEW.VAT, 'INSERT', CURRENT_TIMESTAMP());

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table t_cars
-- ----------------------------
DROP TRIGGER IF EXISTS `t_car_update`;
delimiter ;;
CREATE TRIGGER `t_car_update` AFTER UPDATE ON `t_cars` FOR EACH ROW BEGIN

INSERT 
INTO t_cars_old (id_car, price, brand, mode, year_of_production, course, combusion, colour, id_tires, engines, automatic_gearbox, amount, VAT, TYPE, date) 
VALUES (NEW.ID, NEW.price, NEW.brand, NEW.mode, NEW.year_of_production, NEW.course, NEW.combusion, NEW.colour, NEW.id_tires, NEW.engines, NEW.automatic_gearbox, NEW.amount, NEW.VAT, 'UPDATE', CURRENT_TIMESTAMP());

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table t_cars
-- ----------------------------
DROP TRIGGER IF EXISTS `t_car_delete`;
delimiter ;;
CREATE TRIGGER `t_car_delete` AFTER DELETE ON `t_cars` FOR EACH ROW BEGIN

INSERT 
INTO t_cars_old (id_car, price, brand, mode, year_of_production, course, combusion, colour, id_tires, engines, automatic_gearbox, amount, VAT, TYPE, date) 
VALUES (OLD.ID, OLD.price, OLD.brand, OLD.mode, OLD.year_of_production, OLD.course, OLD.combusion, OLD.colour, OLD.id_tires, OLD.engines, OLD.automatic_gearbox, OLD.amount, OLD.VAT, 'DELETE', CURRENT_TIMESTAMP());

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table t_cart_cars
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_update_cart_INSERT`;
delimiter ;;
CREATE TRIGGER `tr_update_cart_INSERT` AFTER INSERT ON `t_cart_cars` FOR EACH ROW BEGIN

DECLARE var_total_price int;
DECLARE var_car_amount int;

SET var_total_price = (SELECT sum(price) FROM t_cart_cars LEFT JOIN t_cars ON id_car = t_cars.ID WHERE id_cart = NEW.id_cart);
SET var_car_amount = (SELECT count(*) FROM t_cart_cars WHERE id_cart = NEW.id_cart);

IF var_total_price IS NULL THEN
	SET var_total_price = 0;
END IF;

UPDATE t_carts set total_price=var_total_price, car_amount=var_car_amount WHERE ID=NEW.id_cart;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table t_cart_cars
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_update_cart_UPDATE`;
delimiter ;;
CREATE TRIGGER `tr_update_cart_UPDATE` AFTER UPDATE ON `t_cart_cars` FOR EACH ROW BEGIN

DECLARE var_total_price int;
DECLARE var_car_amount int;

SET var_total_price = (SELECT sum(price) FROM t_cart_cars LEFT JOIN t_cars ON id_car = t_cars.ID WHERE id_cart = NEW.id_cart);
SET var_car_amount = (SELECT count(*) FROM t_cart_cars WHERE id_cart = NEW.id_cart);

IF var_total_price IS NULL THEN
	SET var_total_price = 0;
END IF;

UPDATE t_carts set total_price=var_total_price, car_amount=var_car_amount WHERE ID=NEW.id_cart;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table t_cart_cars
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_update_cart_DELETE`;
delimiter ;;
CREATE TRIGGER `tr_update_cart_DELETE` AFTER DELETE ON `t_cart_cars` FOR EACH ROW BEGIN

DECLARE var_total_price int;
DECLARE var_car_amount int;

SET var_total_price = (SELECT sum(price) FROM t_cart_cars LEFT JOIN t_cars ON id_car = t_cars.ID WHERE id_cart = OLD.id_cart);
SET var_car_amount = (SELECT count(*) FROM t_cart_cars WHERE id_cart = OLD.id_cart);

IF var_total_price IS NULL THEN
	SET var_total_price = 0;
END IF;

UPDATE t_carts set total_price=var_total_price, car_amount=var_car_amount WHERE ID=OLD.id_cart;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table t_customers
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_hash_password`;
delimiter ;;
CREATE TRIGGER `tr_hash_password` BEFORE INSERT ON `t_customers` FOR EACH ROW BEGIN
 SET NEW.password = PASSWORD(NEW.password);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table t_customers
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_create_login`;
delimiter ;;
CREATE TRIGGER `tr_create_login` BEFORE INSERT ON `t_customers` FOR EACH ROW BEGIN

declare licznik int default 0;
declare isInDb int;
if(NEW.nickname is null OR length(NEW.nickname) = 0 OR EXISTS (SELECT nickname FROM t_customers WHERE nickname = NEW.nickname)) THEN
set NEW.nickname = concat(left(NEW.first_name, 1), "_",  NEW.last_name);
        
while(NEW.nickname in (select nickname from t_customers)) DO
set licznik = licznik+1;
        
set NEW.nickname = concat(vlogin, "_",  licznik);
end while;
end IF;
set NEW.nickname = lower(NEW.nickname);
        
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table t_customers
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_create_cart`;
delimiter ;;
CREATE TRIGGER `tr_create_cart` AFTER INSERT ON `t_customers` FOR EACH ROW BEGIN
	INSERT INTO t_carts (customer_id) VALUES (NEW.ID);
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
