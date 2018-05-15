-- MySQL Workbench Synchronization
-- Generated: 2015-12-16 00:47
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Milan

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE TABLE IF NOT EXISTS `boxfoodology`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(80) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(500) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `gender` ENUM('Female', 'Male') NOT NULL,
  `uuid` VARCHAR(45) NULL DEFAULT NULL,
  `created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `status` ENUM('Active','Inactive') NOT NULL,
  `role` VARCHAR(20) NOT NULL DEFAULT 'ROLE_USER',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `boxfoodology`.`post` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `message` VARCHAR(500) NOT NULL,
  `created` DATETIME NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_promise_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_promise_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `boxfoodology`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `boxfoodology`.`category` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `image` LONGBLOB NULL,
  `created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `menu` VARCHAR(45) NOT NULL,
  `deleted` TINYINT(1) NULL DEFAULT 0,
  `showOnHome` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `boxfoodology`.`food` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NULL,
  `image` MEDIUMBLOB NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `deleted` TINYINT(1) NULL DEFAULT 0,
  `category_id` INT(11) NOT NULL,
  `created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_food_category`
  FOREIGN KEY (`category_id`)
  REFERENCES `boxfoodology`.`category` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);

CREATE TABLE `boxfoodology`.`myorder` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `quantity` INT NOT NULL DEFAULT 1,
  `food_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_food_order_idx` (`food_id` ASC),
  INDEX `fk_user_order_idx` (`user_id` ASC),
  CONSTRAINT `fk_food_order`
    FOREIGN KEY (`food_id`)
    REFERENCES `boxfoodology`.`food` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_order`
    FOREIGN KEY (`user_id`)
    REFERENCES `boxfoodology`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
  
CREATE TABLE `boxfoodology`.`message` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `content` VARCHAR(800) NOT NULL,
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` INT NULL,
  `created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_message_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_message_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `boxfoodology`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `boxfoodology`.`bestseller` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `food_id` INT NOT NULL,
  `deleted` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `fk_food_bestseller_idx` (`food_id` ASC),
  CONSTRAINT `fk_food_bestseller`
    FOREIGN KEY (`food_id`)
    REFERENCES `boxfoodology`.`food` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `boxfoodology`.`careers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `position` VARCHAR(45) NOT NULL,
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cv` MEDIUMBLOB NOT NULL,
  `contentType` VARCHAR(45) NULL,
  `cvFileName` VARCHAR(50) NULL,
  PRIMARY KEY (`id`));

    
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SET GLOBAL max_allowed_packet = 1024*1024*16;
