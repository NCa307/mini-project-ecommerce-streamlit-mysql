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
-- Table `ecommerce_db`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_db`.`products` (
  `idproducts` INT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `stock` INT NOT NULL,
  PRIMARY KEY (`idproducts`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce_db`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_db`.`customers` (
  `idcustomers` INT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`idcustomers`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce_db`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_db`.`orders` (
  `idorders` INT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `order_date` DATETIME NULL,
  `total_order_amount` DECIMAL(10,2) NOT NULL,
  `billing_address` VARCHAR(45) NULL,
  `payment_method` VARCHAR(45) NULL,
  `customers_idcustomers` INT NOT NULL,
  `customers_idcustomers1` INT NOT NULL,
  PRIMARY KEY (`idorders`, `customers_idcustomers`),
  INDEX `fk_orders_customers1_idx` (`customers_idcustomers1` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customers1`
    FOREIGN KEY (`customers_idcustomers1`)
    REFERENCES `ecommerce_db`.`customers` (`idcustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce_db`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_db`.`order_items` (
  `idorder_items` INT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `unit_price` DECIMAL(10,2) NOT NULL,
  `orders_idorders` INT NOT NULL,
  `orders_customers_idcustomers` INT NOT NULL,
  `products_idproducts1` INT NOT NULL,
  PRIMARY KEY (`idorder_items`, `orders_idorders`, `orders_customers_idcustomers`),
  INDEX `fk_order_items_orders1_idx` (`orders_idorders` ASC, `orders_customers_idcustomers` ASC) VISIBLE,
  INDEX `fk_order_items_products2_idx` (`products_idproducts1` ASC) VISIBLE,
  CONSTRAINT `fk_order_items_orders1`
    FOREIGN KEY (`orders_idorders` , `orders_customers_idcustomers`)
    REFERENCES `ecommerce_db`.`orders` (`idorders` , `customers_idcustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_items_products2`
    FOREIGN KEY (`products_idproducts1`)
    REFERENCES `ecommerce_db`.`products` (`idproducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
