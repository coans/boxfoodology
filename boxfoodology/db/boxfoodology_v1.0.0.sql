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
  `gender` ENUM('Female', 'Male') NOT NULL,
  `uuid` VARCHAR(45) NULL DEFAULT NULL,
  `created` DATETIME NOT NULL,
  `status` ENUM('Active','Inactive') NOT NULL,
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
  `title` VARCHAR(20) NOT NULL,
  `image` MEDIUMBLOB NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `boxfoodology`.`food` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NULL,
  `image` MEDIUMBLOB NOT NULL,
  `price` DECIMAL NOT NULL,
  `category_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_food_category`
  FOREIGN KEY (`category_id`)
  REFERENCES `boxfoodology`.`category` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SET GLOBAL max_allowed_packet = 1024*1024*16;