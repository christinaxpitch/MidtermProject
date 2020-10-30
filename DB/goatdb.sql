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
-- Table `amenity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amenity` ;

CREATE TABLE IF NOT EXISTS `amenity` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `artist` ;

CREATE TABLE IF NOT EXISTS `artist` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `artist_type` VARCHAR(45) NULL DEFAULT NULL,
  `artist_name` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(200) NULL,
  `city` VARCHAR(150) NULL,
  `state` CHAR(2) NULL,
  `zip` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `enabled` TINYINT(4) NOT NULL DEFAULT '1',
  `role` VARCHAR(45) NULL DEFAULT NULL,
  `address_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `profile_pic` VARCHAR(5000) NULL,
  `email` VARCHAR(150) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `venue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `venue` ;

CREATE TABLE IF NOT EXISTS `venue` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(150) NOT NULL,
  `address_id` INT NOT NULL,
  `capacity` INT NULL,
  `description` TEXT NULL,
  `logo` VARCHAR(5000) NULL,
  `manager_id` INT(11) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_venue_address1_idx` (`address_id` ASC),
  INDEX `fk_venue_user1_idx` (`manager_id` ASC),
  CONSTRAINT `fk_venue_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venue_user1`
    FOREIGN KEY (`manager_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `description` TEXT NULL DEFAULT NULL,
  `start_time` TIME NOT NULL,
  `end_time` TIME NULL DEFAULT NULL,
  `max_capacity` VARCHAR(45) NULL DEFAULT NULL,
  `number_of_tickets` INT(11) NULL DEFAULT NULL,
  `venue_id` INT(11) NOT NULL,
  `title` VARCHAR(300) NULL,
  `image` VARCHAR(5000) NULL,
  `event_date` DATE NULL,
  `created_at` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_venue1_idx` (`venue_id` ASC),
  CONSTRAINT `fk_event_venue1`
    FOREIGN KEY (`venue_id`)
    REFERENCES `venue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `event_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_type` ;

CREATE TABLE IF NOT EXISTS `event_type` (
  `id` INT(11) NOT NULL,
  `category` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user_venue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_venue` ;

CREATE TABLE IF NOT EXISTS `user_venue` (
  `user_id` INT(11) NOT NULL,
  `venue_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `venue_id`),
  INDEX `fk_user_has_Venue_Venue1_idx` (`venue_id` ASC),
  INDEX `fk_user_has_Venue_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_Venue_Venue1`
    FOREIGN KEY (`venue_id`)
    REFERENCES `venue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_Venue_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `event_type_has_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_type_has_event` ;

CREATE TABLE IF NOT EXISTS `event_type_has_event` (
  `event_type_id` INT(11) NOT NULL,
  `event_id` INT(11) NOT NULL,
  PRIMARY KEY (`event_type_id`, `event_id`),
  INDEX `fk_event_type_has_event_event1_idx` (`event_id` ASC),
  INDEX `fk_event_type_has_event_event_type1_idx` (`event_type_id` ASC),
  CONSTRAINT `fk_event_type_has_event_event_type1`
    FOREIGN KEY (`event_type_id`)
    REFERENCES `event_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_type_has_event_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `venue_amenity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `venue_amenity` ;

CREATE TABLE IF NOT EXISTS `venue_amenity` (
  `amenity_id` INT(11) NOT NULL,
  `venue_id` INT(11) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`amenity_id`, `venue_id`),
  INDEX `fk_amenity_has_venue_venue1_idx` (`venue_id` ASC),
  INDEX `fk_amenity_has_venue_amenity1_idx` (`amenity_id` ASC),
  CONSTRAINT `fk_amenity_has_venue_amenity1`
    FOREIGN KEY (`amenity_id`)
    REFERENCES `amenity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_amenity_has_venue_venue1`
    FOREIGN KEY (`venue_id`)
    REFERENCES `venue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `event_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `comment_date` DATETIME NOT NULL,
  `content` TEXT NULL,
  `rating` SMALLINT(5) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_event1_idx` (`event_id` ASC),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_comment_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `artist_has_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `artist_has_event` ;

CREATE TABLE IF NOT EXISTS `artist_has_event` (
  `artist_id` INT(11) NOT NULL,
  `event_id` INT(11) NOT NULL,
  PRIMARY KEY (`artist_id`, `event_id`),
  INDEX `fk_artist_has_event_event1_idx` (`event_id` ASC),
  INDEX `fk_artist_has_event_artist1_idx` (`artist_id` ASC),
  CONSTRAINT `fk_artist_has_event_artist1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `artist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artist_has_event_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SET SQL_MODE = '';
DROP USER IF EXISTS goatuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'goatuser'@'localhost' IDENTIFIED BY 'goatuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'goatuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
