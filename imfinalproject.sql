-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: imfinalproject
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addons`
--

DROP TABLE IF EXISTS `addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons` (
  `addon_id` int NOT NULL AUTO_INCREMENT,
  `category_id` varchar(255) DEFAULT NULL,
  `basefood_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `image_url` varchar(255) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`addon_id`),
  KEY `basefood_id` (`basefood_id`),
  CONSTRAINT `addons_ibfk_1` FOREIGN KEY (`basefood_id`) REFERENCES `base_foods` (`basefood_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons`
--

LOCK TABLES `addons` WRITE;
/*!40000 ALTER TABLE `addons` DISABLE KEYS */;
INSERT INTO `addons` VALUES (1,NULL,14,'Egg',17.00,NULL,1,'2025-05-22 16:01:14','2025-05-22 16:01:14'),(2,NULL,14,'Egg',17.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(3,NULL,14,'Tokwat Baboy',25.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(4,NULL,14,'Tokwa',15.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(5,NULL,14,'Spring Onion',0.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(6,NULL,14,'Fried Garlic',0.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(7,NULL,14,'Chili Garlic',0.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(8,NULL,14,'Lumpiang Toge',10.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(9,NULL,14,'Chicken',15.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(10,NULL,14,'Laman Loob',15.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(11,NULL,15,'Egg',17.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(12,NULL,15,'Spring Onion',0.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(13,NULL,15,'Fried Garlic',0.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(14,NULL,15,'Chili Garlic',0.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(15,NULL,15,'Soup',0.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(16,NULL,15,'Lumpiang Toge',10.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(17,NULL,15,'Chicken',15.00,NULL,1,'2025-05-22 16:25:58','2025-05-23 13:22:18'),(18,NULL,15,'Beef',15.00,NULL,1,'2025-05-22 16:25:58','2025-05-23 13:22:18'),(19,NULL,16,'Garlic Rice',15.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(20,NULL,16,'Spring Onion',0.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(21,NULL,16,'Fried Garlic',0.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(22,NULL,16,'Chili Garlic',0.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(23,NULL,16,'Soup',0.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(24,NULL,17,'Egg',17.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(25,NULL,17,'Spring Onion',0.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(26,NULL,17,'Fried Garlic',0.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(27,NULL,17,'Chili Garlic',0.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(28,NULL,17,'Tokwa',15.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(29,NULL,17,'Lumpiang Toge',10.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(30,NULL,17,'Chicharon Bits',17.00,NULL,1,'2025-05-22 16:25:58','2025-05-22 16:25:58'),(31,'2',19,'skdd ayoko NA',123.00,'media/menu/1748027148_b9616f2990a5a30444516d3e724e26ed.jpg',1,'2025-05-23 19:05:48','2025-05-23 19:05:48'),(32,'2',19,'try',0.00,'media/menu/1748027348_en3.jpg',1,'2025-05-23 19:09:08','2025-05-23 19:09:08');
/*!40000 ALTER TABLE `addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','123','2025-05-03 06:52:37','2025-05-03 06:52:37');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_foods`
--

DROP TABLE IF EXISTS `base_foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_foods` (
  `basefood_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`basefood_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `base_foods_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_foods`
--

LOCK TABLES `base_foods` WRITE;
/*!40000 ALTER TABLE `base_foods` DISABLE KEYS */;
INSERT INTO `base_foods` VALUES (14,1,'Lugaw','Warm rice porridge.',20.00,'',1,'2025-05-22 13:58:24','2025-05-22 15:23:40'),(15,1,'Mami','Rich broth with stringy noodles.',20.00,'',1,'2025-05-22 14:01:09','2025-05-22 15:25:36'),(16,1,'Pares','Sweet and savory beef stew.',50.00,'',1,'2025-05-22 14:01:09',NULL),(17,1,'Lomi','Toppings symphony.',50.00,'',1,'2025-05-22 14:01:09','2025-05-22 15:25:36'),(18,1,'asasassa','dcfdfd',134.00,'media/menu/1747934977_Screenshot 2025-04-29 235944.png',1,'2025-05-22 17:29:37',NULL),(19,1,'test','test',100.00,'media/menu/1748009282_Screenshot (1).png',1,'2025-05-23 14:08:02',NULL),(20,1,'qefefe','qqwqwqw',12.00,'media/menu/1748022366_2ab22e96ea519a672d90b7904dacb1c9.jpg',1,'2025-05-23 17:46:06',NULL);
/*!40000 ALTER TABLE `base_foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beverages`
--

DROP TABLE IF EXISTS `beverages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beverages` (
  `beverage_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`beverage_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `beverages_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beverages`
--

LOCK TABLES `beverages` WRITE;
/*!40000 ALTER TABLE `beverages` DISABLE KEYS */;
INSERT INTO `beverages` VALUES (1,3,'Bottled Water',15.00,NULL,1,'2025-05-03 06:43:36','2025-05-03 06:43:36'),(2,3,'Coke',25.00,NULL,1,'2025-05-03 06:43:36','2025-05-03 06:43:36'),(3,3,'Royal',25.00,NULL,1,'2025-05-03 06:43:36','2025-05-03 06:43:36'),(4,3,'Mountain Dew',25.00,NULL,1,'2025-05-03 06:43:36','2025-05-03 06:43:36'),(5,3,'Sprite',25.00,NULL,1,'2025-05-03 06:43:36','2025-05-03 06:43:36'),(6,3,'Iced Tea',25.00,NULL,1,'2025-05-03 06:43:36','2025-05-03 06:43:36'),(7,3,'yogurt',100.00,'media/menu/1747934291_Screenshot (1).png',1,'2025-05-22 17:18:11',NULL),(8,3,'qefefe',12.00,'media/menu/1748022384_2ab22e96ea519a672d90b7904dacb1c9.jpg',1,'2025-05-23 17:46:24',NULL);
/*!40000 ALTER TABLE `beverages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `quantity` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `base_foods` (`basefood_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Base Foods','Lugaw, Pare, Lomi, Mami','2025-05-03 05:37:09','2025-05-03 05:37:09'),(2,'Add-Ons','Additional food items for base foods','2025-05-03 05:37:45','2025-05-03 05:37:45'),(3,'Beverages','Drink options','2025-05-03 05:38:29','2025-05-03 05:38:29');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `base_foods` (`basefood_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_method` enum('Cash on Delivery','Paypal') NOT NULL,
  `payment_status` enum('Pending','Paid') DEFAULT 'Pending',
  `order_status` enum('Pending','Preparing','On the Way','Delivered','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_zones`
--

DROP TABLE IF EXISTS `shipping_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_zones` (
  `shipping_id` int NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(100) NOT NULL,
  `location_keywords` text NOT NULL,
  `shipping_fee` decimal(10,2) NOT NULL,
  PRIMARY KEY (`shipping_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_zones`
--

LOCK TABLES `shipping_zones` WRITE;
/*!40000 ALTER TABLE `shipping_zones` DISABLE KEYS */;
INSERT INTO `shipping_zones` VALUES (1,'Within Cavite','General Trias,Dasmariñas,Silang,Trece Martires,Bacoor,Tanza,Imus,Tagaytay',50.00),(2,'Outside Cavite','Manila,Quezon City,Makati,Pasay,Pasig,Laguna',100.00),(3,'Other Areas','',150.00);
/*!40000 ALTER TABLE `shipping_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text,
  `status` enum('active','blocked') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Polar','Yogurt','polaryogurt@gmail.com','65e84be33532fb784c48129675f9eff3a682b27168c0ea744b2cf58ee02337c5','0909','gentri','active','2025-05-22 11:26:03','2025-05-22 11:26:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-24 13:24:50

ALTER TABLE admin ADD email varchar(100) after password;
ALTER TABLE admin ADD role varchar(50) default "admin" after email;
update admin set email = "Admin@gmail.com" WHERE admin_id = 1;