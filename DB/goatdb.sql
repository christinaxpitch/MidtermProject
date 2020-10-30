-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema goatdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `goatdb` ;

-- -----------------------------------------------------
-- Schema goatdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `goatdb` DEFAULT CHARACTER SET utf8 ;
USE `goatdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Venue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Venue` ;

CREATE TABLE IF NOT EXISTS `Venue` (
  `id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `enabled` TINYINT NOT NULL,
  `role` VARCHAR(45) NULL,
  `name` VARCHAR(150) NOT NULL,
  `address` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `features` VARCHAR(200) NULL,
  `date` DATE NULL,
  `max_capacity` VARCHAR(45) NULL,
  `Venue_id` INT NOT NULL,
  `number_of_tickets` INT NULL,
  `Venue_id1` INT NOT NULL,
  PRIMARY KEY (`id`, `Venue_id`),
  INDEX `fk_event_Venue1_idx` (`Venue_id1` ASC),
  CONSTRAINT `fk_event_Venue1`
    FOREIGN KEY (`Venue_id1`)
    REFERENCES `Venue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `artist` ;

CREATE TABLE IF NOT EXISTS `artist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `artist_type` VARCHAR(45) NULL,
  `artist_name` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_venue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_venue` ;

CREATE TABLE IF NOT EXISTS `user_venue` (
  `user_id` INT NOT NULL,
  `Venue_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `Venue_id`),
  INDEX `fk_user_has_Venue_Venue1_idx` (`Venue_id` ASC),
  INDEX `fk_user_has_Venue_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_Venue_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_Venue_Venue1`
    FOREIGN KEY (`Venue_id`)
    REFERENCES `Venue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_type` ;

CREATE TABLE IF NOT EXISTS `event_type` (
  `id` INT NOT NULL,
  `category` VARCHAR(45) NULL,
  `event_id` INT NOT NULL,
  `event_Venue_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_type_event1_idx` (`event_id` ASC, `event_Venue_id` ASC),
  CONSTRAINT `fk_event_type_event1`
    FOREIGN KEY (`event_id` , `event_Venue_id`)
    REFERENCES `event` (`id` , `Venue_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amenities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amenities` ;

CREATE TABLE IF NOT EXISTS `amenities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `handicap_accesable` TINYINT NULL,
  `baby_changing_stations` TINYINT NULL,
  `public_transportation_access` TINYINT NULL,
  `gender_neutral_bathrooms` TINYINT NULL,
  `Venue_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_amenities_Venue1_idx` (`Venue_id` ASC),
  CONSTRAINT `fk_amenities_Venue1`
    FOREIGN KEY (`Venue_id`)
    REFERENCES `Venue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paynent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `paynent` ;

CREATE TABLE IF NOT EXISTS `paynent` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `billingcol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS goatuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'goatuser'@'localhost' IDENTIFIED BY 'goatuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'goatuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `goatdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`) VALUES (1, 'admin', 'admin', 1, 'ADMIN');

COMMIT;

