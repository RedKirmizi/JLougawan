-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema imfinalproject
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema imfinalproject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `imfinalproject` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `imfinalproject` ;

-- -----------------------------------------------------
-- Table `imfinalproject`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imfinalproject`.`categories` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 405
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `imfinalproject`.`base_foods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imfinalproject`.`base_foods` (
  `basefood_id` INT NOT NULL AUTO_INCREMENT,
  `category_id` INT NULL DEFAULT NULL,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `image_url` VARCHAR(255) NULL DEFAULT NULL,
  `is_available` TINYINT(1) NULL DEFAULT '1',
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`basefood_id`),
  INDEX `category_id` (`category_id` ASC) VISIBLE,
  CONSTRAINT `base_foods_ibfk_1`
    FOREIGN KEY (`category_id`)
    REFERENCES `imfinalproject`.`categories` (`category_id`)
    ON DELETE SET NULL)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `imfinalproject`.`addons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imfinalproject`.`addons` (
  `addon_id` INT NOT NULL AUTO_INCREMENT,
  `category_id` VARCHAR(255) NULL DEFAULT NULL,
  `basefood_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
  `image_url` VARCHAR(255) NULL DEFAULT NULL,
  `is_available` TINYINT(1) NOT NULL DEFAULT '1',
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`addon_id`),
  INDEX `basefood_id` (`basefood_id` ASC) VISIBLE,
  CONSTRAINT `addons_ibfk_1`
    FOREIGN KEY (`basefood_id`)
    REFERENCES `imfinalproject`.`base_foods` (`basefood_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `imfinalproject`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imfinalproject`.`admin` (
  `admin_id` INT NOT NULL,
  `username` VARCHAR(50) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `role` VARCHAR(50) NULL DEFAULT 'admin',
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE INDEX `username` (`username` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `imfinalproject`.`beverages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imfinalproject`.`beverages` (
  `beverage_id` INT NOT NULL AUTO_INCREMENT,
  `category_id` INT NULL DEFAULT NULL,
  `name` VARCHAR(100) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `image_url` VARCHAR(255) NULL DEFAULT NULL,
  `is_available` TINYINT(1) NULL DEFAULT '1',
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`beverage_id`),
  INDEX `category_id` (`category_id` ASC) VISIBLE,
  CONSTRAINT `beverages_ibfk_1`
    FOREIGN KEY (`category_id`)
    REFERENCES `imfinalproject`.`categories` (`category_id`)
    ON DELETE SET NULL)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `imfinalproject`.`order_item_addons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imfinalproject`.`order_item_addons` (
  `addon_entry_id` INT NOT NULL AUTO_INCREMENT,
  `order_item_id` INT NOT NULL,
  `addon_id` INT NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`addon_entry_id`),
  INDEX `idx_order_item_id` (`order_item_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `imfinalproject`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imfinalproject`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(50) NULL DEFAULT NULL,
  `lastname` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `address` TEXT NULL DEFAULT NULL,
  `status` ENUM('active', 'blocked') NULL DEFAULT 'active',
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `imfinalproject`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imfinalproject`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL DEFAULT NULL,
  `total_amount` DECIMAL(10,2) NOT NULL,
  `payment_method` ENUM('Cash on Delivery', 'Paypal') NOT NULL,
  `payment_status` ENUM('Pending', 'Paid') NULL DEFAULT 'Pending',
  `order_status` ENUM('Pending', 'Preparing', 'On the Way', 'Delivered', 'Cancelled') NULL DEFAULT 'Pending',
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `imfinalproject`.`users` (`user_id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `imfinalproject`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imfinalproject`.`order_items` (
  `order_item_id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NULL DEFAULT NULL,
  `food_id` INT NULL DEFAULT NULL,
  `quantity` INT NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  INDEX `order_id` (`order_id` ASC) VISIBLE,
  INDEX `food_id` (`food_id` ASC) VISIBLE,
  CONSTRAINT `order_items_ibfk_1`
    FOREIGN KEY (`order_id`)
    REFERENCES `imfinalproject`.`orders` (`order_id`)
    ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_2`
    FOREIGN KEY (`food_id`)
    REFERENCES `imfinalproject`.`base_foods` (`basefood_id`)
    ON DELETE SET NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `imfinalproject`.`shipping_zones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `imfinalproject`.`shipping_zones` (
  `shipping_id` INT NOT NULL AUTO_INCREMENT,
  `zone_name` VARCHAR(100) NOT NULL,
  `location_keywords` TEXT NOT NULL,
  `shipping_fee` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`shipping_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
