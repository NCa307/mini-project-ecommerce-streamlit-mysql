-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ecommerce_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ecommerce_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecommerce_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ecommerce_db` ;

-- -----------------------------------------------------
-- Table `ecommerce_db`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_db`.`customers` (
  `idcustomers` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idcustomers`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommerce_db`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_db`.`orders` (
  `idorders` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATETIME NULL DEFAULT NULL,
  `total_order_amount` DECIMAL(10,2) NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`idorders`),
  INDEX `fk_orders_customers1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `ecommerce_db`.`customers` (`idcustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommerce_db`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_db`.`products` (
  `idproducts` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `stock` INT NOT NULL,
  PRIMARY KEY (`idproducts`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommerce_db`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_db`.`order_items` (
  `order_item_id` INT NOT NULL AUTO_INCREMENT,
  `orders_idorders` INT NOT NULL,
  `products_idproducts` INT NOT NULL,
  `quantity` INT NULL,
  `unit_price` DECIMAL(6,2) NULL,
  INDEX `fk_orders_has_products_products1_idx` (`products_idproducts` ASC) VISIBLE,
  INDEX `fk_orders_has_products_orders1_idx` (`orders_idorders` ASC) VISIBLE,
  PRIMARY KEY (`order_item_id`),
  CONSTRAINT `fk_orders_has_products_orders1`
    FOREIGN KEY (`orders_idorders`)
    REFERENCES `ecommerce_db`.`orders` (`idorders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_has_products_products1`
    FOREIGN KEY (`products_idproducts`)
    REFERENCES `ecommerce_db`.`products` (`idproducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
