/*
 Navicat Premium Data Transfer

 Source Server         : mariadb
 Source Server Type    : MariaDB
 Source Server Version : 100608
 Source Host           : localhost:3307
 Source Schema         : project

 Target Server Type    : MariaDB
 Target Server Version : 100608
 File Encoding         : 65001

 Date: 18/06/2022 12:21:03
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
  `automatic_gearbox` tinyint(1) NULL DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `VAT` int(11) NOT NULL DEFAULT 23,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `id_tires`(`id_tires`) USING BTREE,
  CONSTRAINT `t_cars_ibfk_1` FOREIGN KEY (`id_tires`) REFERENCES `t_tires` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cars
-- ----------------------------
INSERT INTO `t_cars` VALUES (1, 200000, 'Mazda', 'RX-7', 2002, '100000', '20', 'silver', 1, '', NULL, 0, 23);
INSERT INTO `t_cars` VALUES (2, 185000, 'Mitsubishi', 'Lancer EVO X', 2008, '110000', '13', 'white', 3, '', NULL, 0, 23);
INSERT INTO `t_cars` VALUES (3, 55900, 'Ford', 'Focus', 2016, '17000', '8', 'dark blue', 2, '', NULL, 1, 23);
INSERT INTO `t_cars` VALUES (4, 73500, 'Kia', 'Sportage', 2017, '47000', '8', 'white', 4, '1,2', NULL, 1, 23);
INSERT INTO `t_cars` VALUES (5, 26000, 'Opel', 'Astra', 2013, '230570', '6,5', 'red', 2, '', NULL, 1, 23);
INSERT INTO `t_cars` VALUES (6, 31700, 'Mazda', '5', 2011, '134000', '9', 'silver', 1, '', NULL, 1, 23);
INSERT INTO `t_cars` VALUES (7, 219900, 'Mercedes-Benz', 'Klasa G', 2010, '72000', '21', 'black', 4, '', NULL, 3, 23);
INSERT INTO `t_cars` VALUES (8, 68500, 'Ford', 'Mondeo', 2018, '165888', 'no information', 'black', 2, '', NULL, 3, 23);

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
  CONSTRAINT `fk_cart_car` FOREIGN KEY (`id_car`) REFERENCES `t_cars` (`ID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_cart_cart` FOREIGN KEY (`id_cart`) REFERENCES `t_carts` (`ID`) ON DELETE CASCADE ON UPDATE RESTRICT
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
  `total_price` int(11) NULL DEFAULT NULL,
  `car_amount` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fk_customer_cart`(`customer_id`) USING BTREE,
  INDEX `ID`(`ID`, `total_price`) USING BTREE,
  INDEX `total_price`(`total_price`) USING BTREE,
  CONSTRAINT `fk_customer_cart` FOREIGN KEY (`customer_id`) REFERENCES `t_customers` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_carts
-- ----------------------------
INSERT INTO `t_carts` VALUES (1, 50, 0, 0);

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
  INDEX `order_number`(`order_number`) USING BTREE,
  CONSTRAINT `fk_car` FOREIGN KEY (`car_id`) REFERENCES `t_cars` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart` FOREIGN KEY (`cart_id`) REFERENCES `t_carts` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_num` FOREIGN KEY (`order_number`) REFERENCES `t_invoices` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_carts_archive
-- ----------------------------
INSERT INTO `t_carts_archive` VALUES (19, 1, 2, 2, 'd9f497dc-ee88-11ec-acf7-fcaa140ffb45', 0, 0);
INSERT INTO `t_carts_archive` VALUES (20, 1, 5, 1, 'df68bac0-eee8-11ec-acfd-fcaa140ffb45', 26000, 23);
INSERT INTO `t_carts_archive` VALUES (21, 1, 3, 1, 'f706faea-eeea-11ec-acfd-fcaa140ffb45', 55900, 23);
INSERT INTO `t_carts_archive` VALUES (22, 1, 6, 2, 'f706faea-eeea-11ec-acfd-fcaa140ffb45', 31700, 23);

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
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customers
-- ----------------------------
INSERT INTO `t_customers` VALUES (1, 'Jan', 'Nowak', '', '', '', '', '');
INSERT INTO `t_customers` VALUES (2, 'Dave', 'Kowalsky', '', '', '', '', '');
INSERT INTO `t_customers` VALUES (3, 'Maciej', 'Rozek', '', '', '', '', '');
INSERT INTO `t_customers` VALUES (4, 'Michal', 'Czeresniak', '', '', '', '', '');
INSERT INTO `t_customers` VALUES (5, 'Filip', 'Maria - Rokita', '', '', '', '', '');
INSERT INTO `t_customers` VALUES (6, 'Pawel', 'Zlotousty', '', '', '', '', '');
INSERT INTO `t_customers` VALUES (50, 'Michał', 'Warchoł', 'm_warchoł', '', '', '', '');
INSERT INTO `t_customers` VALUES (51, 'Mikołaj', 'Warchoł', 'm_warchoł_1', '', '', '', '');
INSERT INTO `t_customers` VALUES (52, 'majkel', 'warchol', 'snafu', '*196BDEDE2AE4F84CA44C47D54D78478C7E2BD7B7', '', '', '');
INSERT INTO `t_customers` VALUES (53, 'Szymon', 'Twardowski', '_1', '*83153E7C2E43C960F2C5F51BD6EDCFA2E86097F1', 'Zielone Maki 52', 'Kraków', '69-420');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_engines
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_invoices
-- ----------------------------
INSERT INTO `t_invoices` VALUES (17, '2022-06-17', 50, '8724a085-ee82-11ec-acf7-fcaa140ffb45', 'bank transfer', '2022-06-17', '2022-06-17');
INSERT INTO `t_invoices` VALUES (18, '2022-06-17', 50, 'ac12769f-ee84-11ec-acf7-fcaa140ffb45', 'bank transfer', '2022-06-17', '2022-06-17');
INSERT INTO `t_invoices` VALUES (19, '2022-06-17', 50, 'f38f9c52-ee84-11ec-acf7-fcaa140ffb45', 'bank transfer', '2022-06-17', '2022-06-17');
INSERT INTO `t_invoices` VALUES (20, '2022-06-18', 50, 'd9f497dc-ee88-11ec-acf7-fcaa140ffb45', 'bank transfer', '2022-06-18', '2022-06-18');
INSERT INTO `t_invoices` VALUES (21, '2022-06-18', 50, 'f950fa96-eee7-11ec-acfd-fcaa140ffb45', 'bank transfer', '2022-06-18', '2022-06-18');
INSERT INTO `t_invoices` VALUES (22, '2022-06-18', 50, '35991065-eee8-11ec-acfd-fcaa140ffb45', 'bank transfer', '2022-06-18', '2022-06-18');
INSERT INTO `t_invoices` VALUES (23, '2022-06-18', 50, '3795ca20-eee8-11ec-acfd-fcaa140ffb45', 'bank transfer', '2022-06-18', '2022-06-18');
INSERT INTO `t_invoices` VALUES (24, '2022-06-18', 50, '69006e98-eee8-11ec-acfd-fcaa140ffb45', 'bank transfer', '2022-06-18', '2022-06-18');
INSERT INTO `t_invoices` VALUES (25, '2022-06-18', 50, '89dd2ce3-eee8-11ec-acfd-fcaa140ffb45', 'bank transfer', '2022-06-18', '2022-06-18');
INSERT INTO `t_invoices` VALUES (26, '2022-06-18', 50, 'df68bac0-eee8-11ec-acfd-fcaa140ffb45', 'bank transfer', '2022-06-18', '2022-06-18');
INSERT INTO `t_invoices` VALUES (27, '2022-06-18', 50, 'f706faea-eeea-11ec-acfd-fcaa140ffb45', 'bank transfer', '2022-06-18', '2022-06-18');

-- ----------------------------
-- Table structure for t_orders
-- ----------------------------
DROP TABLE IF EXISTS `t_orders`;
CREATE TABLE `t_orders`  (
  `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` enum('IN PROGRESS','PAID','DELIVERED') CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `order_number` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fk_invoice`(`invoice_id`) USING BTREE,
  CONSTRAINT `fk_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `t_invoices` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_orders
-- ----------------------------
INSERT INTO `t_orders` VALUES (2, 'IN PROGRESS', '2022-06-17 23:14:52', 17, '8724a085-ee82-11ec-acf7-fcaa140ffb45');
INSERT INTO `t_orders` VALUES (3, 'IN PROGRESS', '2022-06-17 23:30:13', 18, 'ac12769f-ee84-11ec-acf7-fcaa140ffb45');
INSERT INTO `t_orders` VALUES (4, 'IN PROGRESS', '2022-06-17 23:32:13', 19, 'f38f9c52-ee84-11ec-acf7-fcaa140ffb45');
INSERT INTO `t_orders` VALUES (5, 'IN PROGRESS', '2022-06-18 00:00:08', 20, 'd9f497dc-ee88-11ec-acf7-fcaa140ffb45');
INSERT INTO `t_orders` VALUES (6, 'IN PROGRESS', '2022-06-18 11:27:30', 26, 'df68bac0-eee8-11ec-acfd-fcaa140ffb45');
INSERT INTO `t_orders` VALUES (7, 'IN PROGRESS', '2022-06-18 11:42:29', 27, 'f706faea-eeea-11ec-acfd-fcaa140ffb45');

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

select brand, mode, year_of_production, profile as tire_profile, diameter as tire_diameter, width as tire_width from t_cars, t_tires where t_cars.id_tires = t_tires.ID ;

-- ----------------------------
-- View structure for v_car_price_by_fuel
-- ----------------------------
DROP VIEW IF EXISTS `v_car_price_by_fuel`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_car_price_by_fuel` AS select `t_cars`.`fuel` AS `fuel`,avg(`t_cars`.`price`) AS `average_price` from `t_cars` group by `t_cars`.`fuel`; ;

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
	SET isInDB = (SELECT count(*) FROM t_cart_cars WHERE car_id=vCarID);
	
	IF isInDB > 0 THEN
		UPDATE t_cart_cars SET amount=isInDb+1 WHERE cart_id=vCartID AND car_id=vCarID;
	ELSE
		INSERT INTO t_cart_cars (cart_id, car_id, amount) VALUES (vCartID, vCarID, 1);
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
CREATE PROCEDURE `p_delete_car_from_cart`(IN `vCartID` int,IN `vCarID` int)
BEGIN
	DELETE FROM t_cart_cars WHERE cart_id=vCartID AND car_id=vCarID;

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
CREATE PROCEDURE `p_make_order`(IN `vCartID` int)
BEGIN
	DECLARE canCommit int;
	DECLARE ORDERID VARCHAR(36);
	DECLARE customerID int;
	DECLARE invoiceID int;
	START TRANSACTION;
		SET canCommit = (SELECT count(*) FROM t_cart_cars LEFT JOIN t_cars ON id_car=t_cars.ID WHERE id_cart=vCartID AND t_cart_cars.amount > t_cars.amount);
		
		IF canCommit > 0 THEN
			SELECT "Brak samochodów na stanie!" AS "Komunikat";
			ROLLBACK;
		ELSE
			SET ORDERID = UUID();
			SELECT customer_id INTO customerID from t_carts WHERE ID=vCartID;
			
			#tworzenie faktury
			INSERT INTO t_invoices (date_of_invoice, customer_id, order_id, date_of_payment, date_of_purchase) VALUES (CURRENT_DATE(), customerID, ORDERID, CURRENT_DATE(), CURRENT_DATE());

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
EVERY '1' SECOND STARTS '2022-06-11 00:00:02'
ON COMPLETION PRESERVE
DO update t_cars set price = price + 1000 where ID = 1
;;
delimiter ;

-- ----------------------------
-- Event structure for update_price
-- ----------------------------
DROP EVENT IF EXISTS `update_price`;
delimiter ;;
CREATE EVENT `update_price`
ON SCHEDULE
EVERY '1' SECOND STARTS '2022-06-11 00:04:15'
DO update t_cars set price = price + 1
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

SET FOREIGN_KEY_CHECKS = 1;
