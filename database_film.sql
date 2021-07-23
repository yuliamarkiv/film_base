

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`type` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`film` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `age_category` INT NOT NULL,
  `rating` DECIMAL(4) NOT NULL,
  `director` VARCHAR(45) NOT NULL,
  `writer` VARCHAR(45) NOT NULL,
  `date_of_release` VARCHAR(45) NOT NULL,
  `category_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_film_category1_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_film_type1_idx` (`type_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `mydb`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_film_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `mydb`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`actor` (
  `name` VARCHAR(45) NOT NULL,
  `last-name` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`country` (
  `name` VARCHAR(45) NOT NULL,
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cash_fee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cash_fee` (
  `money` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `film_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cash_fee_film1_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_cash_fee_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `mydb`.`film` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `last-name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `comment` VARCHAR(200) NULL,
  `given_point` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_has_film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_has_film` (
  `user_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `film_id`),
  INDEX `fk_user_has_film_film1_idx` (`film_id` ASC) VISIBLE,
  INDEX `fk_user_has_film_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_film_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_film_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `mydb`.`film` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`country_has_film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`country_has_film` (
  `country_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  PRIMARY KEY (`country_id`, `film_id`),
  INDEX `fk_country_has_film_film1_idx` (`film_id` ASC) VISIBLE,
  INDEX `fk_country_has_film_country1_idx` (`country_id` ASC) VISIBLE,
  CONSTRAINT `fk_country_has_film_country1`
    FOREIGN KEY (`country_id`)
    REFERENCES `mydb`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_country_has_film_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `mydb`.`film` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`actor_has_film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`actor_has_film` (
  `actor_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  PRIMARY KEY (`actor_id`, `film_id`),
  INDEX `fk_actor_has_film_film1_idx` (`film_id` ASC) VISIBLE,
  INDEX `fk_actor_has_film_actor1_idx` (`actor_id` ASC) VISIBLE,
  CONSTRAINT `fk_actor_has_film_actor1`
    FOREIGN KEY (`actor_id`)
    REFERENCES `mydb`.`actor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actor_has_film_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `mydb`.`film` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
