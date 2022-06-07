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

 Date: 07/06/2022 22:24:18
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
  `year_of_production` year NOT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_cars
-- ----------------------------
INSERT INTO `t_cars` VALUES (1, 200000, 'Mazda', 'RX-7', 2002, '100000', 'petrol', '20', 'silver', 1308, 1, 1);
INSERT INTO `t_cars` VALUES (2, 185000, 'Mitsubishi', 'Lancer EVO X', 2008, '110000', 'petrol', '13', 'white', 1998, 3, 2);
INSERT INTO `t_cars` VALUES (3, 55900, 'Ford', 'Focus', 2016, '17000', 'petrol', '8', 'dark blue', 1596, 2, 4);
INSERT INTO `t_cars` VALUES (4, 73500, 'Kia', 'Sportage', 2017, '47000', 'petrol', '8', 'white', 1591, 4, 3);
INSERT INTO `t_cars` VALUES (5, 26000, 'Opel', 'Astra', 2013, '230570', 'diesel', '6,5', 'red', 1956, 2, 2);
INSERT INTO `t_cars` VALUES (6, 31700, 'Mazda', '5', 2011, '134000', 'petrol', '9', 'silver', 1999, 1, 1);
INSERT INTO `t_cars` VALUES (7, 219900, 'Mercedes-Benz', 'Klasa G', 2010, '72000', 'petrol', '21', 'black', 5439, 4, 1);
INSERT INTO `t_cars` VALUES (8, 68500, 'Ford', 'Mondeo', 2018, '165888', 'diesel', 'no information', 'black', 1997, 2, 3);

-- ----------------------------
-- Table structure for t_cart_cars
-- ----------------------------
DROP TABLE IF EXISTS `t_cart_cars`;
CREATE TABLE `t_cart_cars`  (
  `id_cart` int UNSIGNED NOT NULL,
  `id_car` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_cart`, `id_car`) USING BTREE,
  INDEX `fk_cart_car`(`id_car` ASC) USING BTREE,
  CONSTRAINT `fk_cart_car` FOREIGN KEY (`id_car`) REFERENCES `t_cars` (`ID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_cart_cart` FOREIGN KEY (`id_cart`) REFERENCES `t_carts` (`ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_cart_cars
-- ----------------------------
INSERT INTO `t_cart_cars` VALUES (1, 2);
INSERT INTO `t_cart_cars` VALUES (1, 3);

-- ----------------------------
-- Table structure for t_carts
-- ----------------------------
DROP TABLE IF EXISTS `t_carts`;
CREATE TABLE `t_carts`  (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int UNSIGNED NOT NULL,
  `total_price` int NOT NULL,
  `car_amount` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fk_customer_cart`(`customer_id` ASC) USING BTREE,
  INDEX `ID`(`ID` ASC, `total_price` ASC) USING BTREE,
  INDEX `total_price`(`total_price` ASC) USING BTREE,
  CONSTRAINT `fk_customer_cart` FOREIGN KEY (`customer_id`) REFERENCES `t_customers` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_carts
-- ----------------------------
INSERT INTO `t_carts` VALUES (1, 50, 240900, 2);

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
  `nickname` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `car_id`(`car_id` ASC) USING BTREE,
  CONSTRAINT `car_id` FOREIGN KEY (`car_id`) REFERENCES `t_cars` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_customers
-- ----------------------------
INSERT INTO `t_customers` VALUES (1, 'Jan', 'Nowak', 'Krakow', NULL, '');
INSERT INTO `t_customers` VALUES (2, 'Dave', 'Kowalsky', 'Warszawa', NULL, '');
INSERT INTO `t_customers` VALUES (3, 'Maciej', 'Rozek', 'Warszawa', 1, '');
INSERT INTO `t_customers` VALUES (4, 'Michal', 'Czeresniak', 'Poznan', NULL, '');
INSERT INTO `t_customers` VALUES (5, 'Filip', 'Maria - Rokita', 'Gdansk', NULL, '');
INSERT INTO `t_customers` VALUES (6, 'Pawel', 'Zlotousty', 'Katowice', NULL, '');
INSERT INTO `t_customers` VALUES (50, 'Michał', 'Warchoł', 'Kraków', NULL, 'm_warchoł');
INSERT INTO `t_customers` VALUES (51, 'Mikołaj', 'Warchoł', 'Gdańsk', NULL, 'm_warchoł_1');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_previous_owners
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_shops
-- ----------------------------
INSERT INTO `t_shops` VALUES (1, 'Krakow', 'Bociana 22A', 'YES', 'Sklepopon.com');
INSERT INTO `t_shops` VALUES (2, 'Warszawa', 'Cieślewskich 25d', 'NO', 'Berlux Premio');
INSERT INTO `t_shops` VALUES (3, 'Poznan', 'Chyżańska 11', 'YES', 'GUMAR');
INSERT INTO `t_shops` VALUES (4, 'Krakow', 'Prądnicka 36', 'NO', 'Opony 36');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_tires
-- ----------------------------
INSERT INTO `t_tires` VALUES (1, 1125, 'Yokohama', '40', 19, 285);
INSERT INTO `t_tires` VALUES (2, 142, 'Debica', '	80', 13, 135);
INSERT INTO `t_tires` VALUES (3, 360, 'Continental', '	55', 16, 205);
INSERT INTO `t_tires` VALUES (4, 3460, 'Goodyear', '	40', 21, 255);

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
-- Triggers structure for table t_cart_cars
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_update_cart_INSERT`;
delimiter ;;
CREATE TRIGGER `tr_update_cart_INSERT` AFTER INSERT ON `t_cart_cars` FOR EACH ROW BEGIN

DECLARE var_total_price int;
DECLARE var_car_amount int;

SET var_total_price = (SELECT sum(price) FROM t_cart_cars LEFT JOIN t_cars ON id_car = t_cars.ID WHERE id_cart = NEW.id_cart);
SET var_car_amount = (SELECT count(*) FROM t_cart_cars WHERE id_cart = NEW.id_cart);

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

UPDATE t_carts set total_price=var_total_price, car_amount=var_car_amount WHERE ID=OLD.id_cart;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table t_customers
-- ----------------------------
DROP TRIGGER IF EXISTS `tr_create_login`;
delimiter ;;
CREATE TRIGGER `tr_create_login` BEFORE INSERT ON `t_customers` FOR EACH ROW BEGIN

DECLARE amount INT;
DECLARE baseNick VARCHAR(60);
DECLARE nick VARCHAR(60);
DECLARE isInDb INT;

IF NEW.nickname IS NOT NULL THEN
	SET baseNick = NEW.nickname;
ELSE
	SET baseNick = concat(LOWER(left(NEW.first_name, 1)), "_", LOWER(NEW.last_name));
END IF;

SET isInDB = (SELECT count(*) FROM t_customers WHERE nickname LIKE baseNick);

IF isInDb = 0 THEN
	SET NEW.nickname = baseNick;
ELSE
	SET amount = 0;

	WHILE (isInDb > 0) DO
		SET amount = amount + 1;
		SET nick = concat(baseNick, "_", amount);
		SET isInDB = (SELECT count(*) FROM t_customers WHERE nickname LIKE nick);
	END WHILE;
	SET NEW.nickname = concat(baseNick, "_", amount);
END IF;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
