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
  `address_id` INT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `profile_pic` VARCHAR(5000) NULL,
  `email` VARCHAR(150) NULL,
  `created_at` DATETIME NULL,
  `last_update` VARCHAR(45) NULL,
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
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  `address_id` INT NULL,
  `capacity` INT NULL,
  `description` TEXT NULL,
  `logo` VARCHAR(5000) NULL,
  `manager_id` INT(11) NULL,
  `created_at` DATETIME NULL,
  `last_update` DATETIME NULL,
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
  `max_capacity` INT NULL DEFAULT NULL,
  `number_of_tickets` INT(11) NULL DEFAULT NULL,
  `venue_id` INT(11) NOT NULL,
  `title` VARCHAR(300) NULL,
  `image` VARCHAR(5000) NULL,
  `event_date` DATE NULL,
  `created_at` DATETIME NULL,
  `last_update` DATETIME NULL,
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
  `amenity_id` INT(11)  NOT NULL ,
  `venue_id` INT(11)   NULL ,
  `description` TEXT NULL,
  PRIMARY KEY (`amenity_id`),
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
  `comment_date` DATETIME NULL,
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
-- Table `artist_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `artist_event` ;

CREATE TABLE IF NOT EXISTS `artist_event` (
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


-- -----------------------------------------------------
-- Table `user_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_event` ;

CREATE TABLE IF NOT EXISTS `user_event` (
  `user_id` INT(11) NOT NULL,
  `event_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `event_id`),
  INDEX `fk_user_has_event_event1_idx` (`event_id` ASC),
  INDEX `fk_user_has_event_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_event_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_event_event1`
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

-- -----------------------------------------------------
-- Data for table `amenity`
-- -----------------------------------------------------
START TRANSACTION;
USE `goatdb`;
INSERT INTO `amenity` (`id`, `name`, `description`) VALUES (1, 'baby changing stations', 'baby changing stations somewhere in the restrooms');
INSERT INTO `amenity` (`id`, `name`, `description`) VALUES (2, 'smoking', 'smoking section');
INSERT INTO `amenity` (`id`, `name`, `description`) VALUES (3, 'alcohol', 'alcohol allowed to be consumed');
INSERT INTO `amenity` (`id`, `name`, `description`) VALUES (4, 'WiFi', 'WiFi');
INSERT INTO `amenity` (`id`, `name`, `description`) VALUES (5, 'Wheel Chair Accessable', 'Wheel Chair assesable');
INSERT INTO `amenity` (`id`, `name`, `description`) VALUES (6, 'pet friendly', 'Bring your spouse');

COMMIT;


-- -----------------------------------------------------
-- Data for table `artist`
-- -----------------------------------------------------
START TRANSACTION;
USE `goatdb`;
INSERT INTO `artist` (`id`, `artist_type`, `artist_name`) VALUES (1, 'high pitch singer', 'Cristina Mile High Pitch');
INSERT INTO `artist` (`id`, `artist_type`, `artist_name`) VALUES (2, 'indie rock ', 'Bombay Bicycle Club');
INSERT INTO `artist` (`id`, `artist_type`, `artist_name`) VALUES (3, 'yoga teacher', 'Luna');
INSERT INTO `artist` (`id`, `artist_type`, `artist_name`) VALUES (4, 'indie rock', 'Local Natives');
INSERT INTO `artist` (`id`, `artist_type`, `artist_name`) VALUES (5, 'sad boy hip hop', 'Coopertown');
INSERT INTO `artist` (`id`, `artist_type`, `artist_name`) VALUES (6, 'spoken word poetry', 'Edward I Have No Hands To Hold My Scissors');
INSERT INTO `artist` (`id`, `artist_type`, `artist_name`) VALUES (7, 'dj group', 'Now That\'s What I Call Pop Punk!');
INSERT INTO `artist` (`id`, `artist_type`, `artist_name`) VALUES (8, 'indie rock', 'Goth Babe');
INSERT INTO `artist` (`id`, `artist_type`, `artist_name`) VALUES (9, 'bad indie rock', 'the Java Coders');

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `goatdb`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (1, '123 Sesame St.', 'Denver', 'CO', '80014', '303-555-1267');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (2, '688 Cherry Dr.', 'Denver', 'CO', '80019', '303-123-9876');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (3, '1098 Horse St', 'Greensboro', 'NC', '27401', '234-987-6789');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (4, '12 Franklyn blvd', 'Austin', 'TX', '73896', '839-081-7483');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (5, '198 Willow Rd', 'Seattle', 'WA', '16245', '231-135-4124');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (6, '176 S. Mesa', 'New York City', 'NY', '19357', '435-452-5262');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (7, '945 Hill Rd', 'Miami', 'FL', '16379', '321-313-5541');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (8, '1509 Tank ln.', 'Phoneix', 'AZ', '84689', '847-098-3675');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (9, '10 Sigmon Ct', 'Los Angeles', 'CA', '75893', '628-012-0290');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (10, '1500 Blair Rd', 'San Francisco', 'CA', '65384', '213-098-1235');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (11, '1898 Saks 5th Ave', 'Dallas', 'TX', '36575', '153-209-0393');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (12, '1567 Broncos Blvd', 'Houston', 'TX', '75843', '357-987-0293');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `goatdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `first_name`, `last_name`, `profile_pic`, `email`, `created_at`, `last_update`) VALUES (1, 'dFresh', '123456', 1, 'Vendor', 1, 'Douglas', 'Sigmon', NULL, 'dfresh@SD.com', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `first_name`, `last_name`, `profile_pic`, `email`) VALUES (2, 'cpShawty', '654321', 1, 'Vendor', 2, 'Cristina', 'Pitch', NULL, 'highPitch@SD.com');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `first_name`, `last_name`, `profile_pic`, `email`) VALUES (3, 'RyanNoRona', '98765', 1, 'Vendor', 3, 'Ryan', 'Miskoviak ', NULL, 'ryMiskovi@SD');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `first_name`, `last_name`, `profile_pic`, `email`) VALUES (4, 'KeepItCoolAC', '890765', 1, 'Vendor', 4, 'Aaron', 'Cottrell', NULL, 'ACdc@SD.com');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `first_name`, `last_name`, `profile_pic`, `email`) VALUES (5, 'DeeDizzle', '1234879', 1, 'User', 5, 'Denise', 'Dizzle', NULL, 'saucin@SD.com');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `first_name`, `last_name`, `profile_pic`, `email`) VALUES (6, 'RobbyRoundHouse', '847602', 1, 'User', 6, 'Rob', 'Rose', NULL, 'RickyRobby@SD.com');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `first_name`, `last_name`, `profile_pic`, `email`) VALUES (7, 'eagleEyeJ', '1209844', 1, 'User', 7, 'Jeremy', 'Acuity', NULL, 'EyeSeeYew@SD.com');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `first_name`, `last_name`, `profile_pic`, `email`) VALUES (8, 'AntMan', '75839', 1, 'User', 8, 'Anthony ', 'Soprano', NULL, 'slimJenkins@SD.com');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `first_name`, `last_name`, `profile_pic`, `email`) VALUES (9, '1', '1', 1, 'Administrator', 8, 'Scooby ', 'DotDo', NULL, 'DotDo@SD.com');
COMMIT;


-- -----------------------------------------------------
-- Data for table `venue`
-- -----------------------------------------------------
START TRANSACTION;
USE `goatdb`;
INSERT INTO `venue` (`id`, `name`, `address_id`, `capacity`, `description`, `logo`, `manager_id`, `created_at`, `last_update`) VALUES (1, 'Doug\'s Mega Venue', 9, 50000, 'Mega venue that can be used to hold huge events or sectioned off to hold many different small events', NULL, 1, NULL, NULL);
INSERT INTO `venue` (`id`, `name`, `address_id`, `capacity`, `description`, `logo`, `manager_id`, `created_at`, `last_update`) VALUES (2, 'Christinas  Venue', 10, 1000, 'venue for small and niche events', NULL, 2, NULL, NULL);
INSERT INTO `venue` (`id`, `name`, `address_id`, `capacity`, `description`, `logo`, `manager_id`, `created_at`, `last_update`) VALUES (3, 'Cat Playground', 11, 50, 'A venue for all the cool cats and kittens. (Note: \"cool cats and kittens\" is a saying for people. Health restrictions do not allow actual cats into this venue)', NULL, 3, NULL, NULL);
INSERT INTO `venue` (`id`, `name`, `address_id`, `capacity`, `description`, `logo`, `manager_id`, `created_at`, `last_update`) VALUES (4, 'SadGirl Station', 12, 100, 'A venue with sad vibes. Includes a lounge area and a small concert type area for bigger events/balls/galas.', NULL, 4, NULL, NULL);
INSERT INTO `venue` (`id`, `name`, `address_id`, `capacity`, `description`, `logo`, `manager_id`, `created_at`, `last_update`) VALUES (5, 'Yoga Magic', 1, 35, 'A fun yoga studio with live music during yoga classes, and special events', NULL, 5, NULL, NULL);
INSERT INTO `venue` (`id`, `name`, `address_id`, `capacity`, `description`, `logo`, `manager_id`, `created_at`, `last_update`) VALUES (6, 'Vegan Van ', 2, 30, 'A van that has special events while you drive around. Come get inside this van, there isnt any candy inside!', NULL, 6, NULL, NULL);
INSERT INTO `venue` (`id`, `name`, `address_id`, `capacity`, `description`, `logo`, `manager_id`, `created_at`, `last_update`) VALUES (7, 'Xtra Sports', 3, 4000, 'A sporting event center that hosts sporting events.', NULL, 7, NULL, NULL);
INSERT INTO `venue` (`id`, `name`, `address_id`, `capacity`, `description`, `logo`, `manager_id`, `created_at`, `last_update`) VALUES (8, 'This Is A Cool Bar', 4, 400, 'You don\'t have to say that twice, but we will. This is a cool bar. Hosts game events, speed dating events, other special events.', NULL, 8, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `goatdb`;
INSERT INTO `event` (`id`, `description`, `start_time`, `end_time`, `max_capacity`, `number_of_tickets`, `venue_id`, `title`, `image`, `event_date`, `created_at`, `last_update`) VALUES (1, 'various beer and bacon vendors', '20:00:00', '22:00:00', 3000, 3000, 1, 'Beer and Bacon Fest', 'https://betterbegrilled.com/wp-content/uploads/2017/02/Grilled_BeerCandiedBacon_9834-520x520.jpg', '2020-11-06', NULL, NULL);
INSERT INTO `event` (`id`, `description`, `start_time`, `end_time`, `max_capacity`, `number_of_tickets`, `venue_id`, `title`, `image`, `event_date`, `created_at`, `last_update`) VALUES (2, 'music festival with 50000 people  at Dougs mega venue', '12:00:00', NULL, 50000, 50000, 1, 'Big Robs music fest', 'https://s29745.pcdn.co/wp-content/uploads/2019/10/Music-Festivals-2020-845x321.jpg.webp', '2020-12-29', NULL, NULL);
INSERT INTO `event` (`id`, `description`, `start_time`, `end_time`, `max_capacity`, `number_of_tickets`, `venue_id`, `title`, `image`, `event_date`, `created_at`, `last_update`) VALUES (3, 'a group of tiny violen artist playing a sad violen song for the tears of sadness', '21:00:00', '23:00:00', 400, 400, 2, 'Crybaby Violen ', 'https://ninebuzz.practicalmusicianblog.com/wp-content/uploads/2016/01/SadViolinPlayer.jpg', '2020-11-20', NULL, NULL);
INSERT INTO `event` (`id`, `description`, `start_time`, `end_time`, `max_capacity`, `number_of_tickets`, `venue_id`, `title`, `image`, `event_date`, `created_at`, `last_update`) VALUES (4, 'An emo poetry reading night with vegan snacks. Everybody is welcome!', '19:00:00', '22:00:00', 55, 55, 5, 'Emo Poetry', 'https://www.shortlist.com/media/images/2019/05/this-creepy-emo-poetry-was-written-by-a-google-ai-2-1556726230-Dsir-column-width-inline.jpg', '2020-11-26', NULL, NULL);
INSERT INTO `event` (`id`, `description`, `start_time`, `end_time`, `max_capacity`, `number_of_tickets`, `venue_id`, `title`, `image`, `event_date`, `created_at`, `last_update`) VALUES (5, 'A one hour yoga class to all the hits of female rock and roll artists.', '17:00:00', '19:00:00', 35, 35, 3, 'Rock and Roll Yoga', 'https://i.pinimg.com/564x/a8/4f/7b/a84f7b31360ce86e26f5a5f7e33e575c.jpg', '2020-11-20', NULL, NULL);
INSERT INTO `event` (`id`, `description`, `start_time`, `end_time`, `max_capacity`, `number_of_tickets`, `venue_id`, `title`, `image`, `event_date`, `created_at`, `last_update`) VALUES (6, 'A stand up comedy focusing on self deprecating and really dark humor. Happy people not allowed.', '17:00:00', '19:00:00', 55, 55, 4, 'Laugh At My Life - A Comedy Tour', 'https://i1.wp.com/www.lifeofanarchitect.com/wp-content/uploads/2010/10/Sad-Clown.jpg?w=500&ssl=1', '2020-11-21', NULL, NULL);
INSERT INTO `event` (`id`, `description`, `start_time`, `end_time`, `max_capacity`, `number_of_tickets`, `venue_id`, `title`, `image`, `event_date`, `created_at`, `last_update`) VALUES (7 , 'Teaching kids who live in landlocked states the useless skill of surfboarding and wakeboarding.', '16:00:00', '19:00:00', 20, 20, 7, 'Useless Surf Lessons For Kids', 'https://www.surfertoday.com/images/stories/surfingquotes.jpg', '2020-11-20', NULL, NULL);
INSERT INTO `event` (`id`, `description`, `start_time`, `end_time`, `max_capacity`, `number_of_tickets`, `venue_id`, `title`, `image`, `event_date`, `created_at`, `last_update`) VALUES (8, 'Pop Punk music playing all night long with sh*tty watered down beer. Skateboards and teenage angst welcome!', '20:00:00', '22:00:00', 2000, 2000, 3, 'Pop Punk Concert', 'https://images.squarespace-cdn.com/content/v1/563761eae4b0df458aa0929b/1517479566128-WLMJME4MWFX0N5HGPGHW/ke17ZwdGBToddI8pDm48kM92qaEInPRgHHeE4slqO5tZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZamWLI2zvYWH8K3-s_4yszcp2ryTI0HqTOaaUohrI8PIX_nEH5US_0xjPAh8JvCafs-2nCBXRWq9ujg-4y6lu-UKMshLAGzx4R3EDFOm1kBS/NECK+DEEP+COVER.jpg?format=1500w', '2020-11-26', NULL, NULL);
INSERT INTO `event` (`id`, `description`, `start_time`, `end_time`, `max_capacity`, `number_of_tickets`, `venue_id`, `title`, `image`, `event_date`, `created_at`, `last_update`) VALUES (9, 'A special one hour session of yoga with cats roaming around the class! Come get flexible with some feline friends, meow!', '21:00:00', '22:00:00', 30, 30, 5, 'Feline Friend Yoga', 'https://s3fs.bestfriends.org/s3fs-public/styles/main_subpage/public/news/16/07/11/NKLA-Yoga-Cats-6195LF.jpg?itok=IUm7NoS_', '2020-11-23', NULL, NULL);
INSERT INTO `event` (`id`, `description`, `start_time`, `end_time`, `max_capacity`, `number_of_tickets`, `venue_id`, `title`, `image`, `event_date`, `created_at`, `last_update`) VALUES (10, 'This special adoption event is hosted by The Dumb Friends League in Denver, CO. Come adopt some of our less appealing dogs - they are sweethearts, but are kind of ugly!', '22:00:00', '02:00:00', 100, 100, 4, 'Ugly Dog Adoption', 'https://i.insider.com/5b30f02c5e48ec41008b4582?width=1200&format=jpeg&auto=webp', '2020-11-29', NULL, NULL);
INSERT INTO `event` (`id`, `description`, `start_time`, `end_time`, `max_capacity`, `number_of_tickets`, `venue_id`, `title`, `image`, `event_date`, `created_at`, `last_update`) VALUES (11, 'A concert for Bombay Bicycle Club! Christina\'s favorite band! Hey! Everybody come and have fun! They were supposed to play on her birthday this year but then covid cancelled it! Hahah @ her life!', '11:00:00', '19:00:00', 5000, 5000, 6, 'Bombay Bicycle Club in Concert', 'https://media.stubhubstatic.com/stubhub-catalog/d_defaultLogo.jpg/t_f-fs-0fv,q_auto:low,f_auto,c_fill,dpr_2.0,$w_280,$h_180/performer/494648/cy3jlhdusp2uzdgahlyt', '2020-11-25', NULL, NULL);
INSERT INTO `event` (`id`, `description`, `start_time`, `end_time`, `max_capacity`, `number_of_tickets`, `venue_id`, `title`, `image`, `event_date`, `created_at`, `last_update`) VALUES (12, 'A book club where one lady reads books starting from the last page all the way to the front page. Current book for this week is: The Lion, The Witch, & The Wardrobe.', '08:00:00', '14:00:00', 1250, 1250, 7, 'Backwards Book Club', 'https://www.thewomensbusinessschool.com/wp-content/uploads/et_temp/17021857_10154167286966010_5207112544431232751_n-143479_960x675.jpg', '2020-11-22', NULL, NULL);
INSERT INTO `event` (`id`, `description`, `start_time`, `end_time`, `max_capacity`, `number_of_tickets`, `venue_id`, `title`, `image`, `event_date`, `created_at`, `last_update`) VALUES (13, 'A daylight savings time party. We will do lots of weird things between the hours of 2-3 am, but then it will go back to 2 am and it\'ll be like what we did never happened. But it did. Or it didnt?', '19:00:00', '23:00:00', 1400, 1400, 6, 'Daylight Savings Time Party', 'https://imgix.bustle.com/rehost/2016/9/13/7b5a1016-1dfb-43b8-97f5-e06aa3ad33af.jpg?w=614&auto=format%2Ccompress&cs=srgb&q=70&fit=crop&crop=faces&dpr=2', '2020-11-10', NULL, NULL);
INSERT INTO `event` (`id`, `description`, `start_time`, `end_time`, `max_capacity`, `number_of_tickets`, `venue_id`, `title`, `image`, `event_date`, `created_at`, `last_update`) VALUES (14, 'A vintage video game party! All the classics - Sega Dreamcast, N64, GameCube, old video game machines. Skeeball too.', '08:00:00', '10:00:00', 900, 900, 5, 'Vintage Video Games', 'https://www.thepackagingcompany.us/knowledge-sharing/wp-content/uploads/sites/2/2018/09/5supplies_retrovideogames-blog.jpg', '2020-11-15', NULL, NULL);
INSERT INTO `event` (`id`, `description`, `start_time`, `end_time`, `max_capacity`, `number_of_tickets`, `venue_id`, `title`, `image`, `event_date`, `created_at`, `last_update`) VALUES (15, 'A meme exchange speed dating event. Bring your favorite memes and try to find your perfect partner by being compatible- meme compatible, that is!', '20:00:00', '19:00:00', 40, 40, 6, 'Show Me Ur Memes- A Speed Dating Event', 'https://i.chzbgr.com/full/8375985152/h8D84CC5A/surprise-speed-dating', '2020-11-12', NULL, NULL);
INSERT INTO `event` (`id`, `description`, `start_time`, `end_time`, `max_capacity`, `number_of_tickets`, `venue_id`, `title`, `image`, `event_date`, `created_at`, `last_update`) VALUES (DEFAULT, 'A lovely afternoon where we talk about Java, with a cup of java.', '19:00:00', '22:00:00', 50, 50, 2, 'Java over Java', 'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/flat-white-3402c4f.jpg?webp=true&quality=90&resize=500%2C454', '2020-11-05', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `goatdb`;
INSERT INTO `event_type` (`id`, `category`) VALUES (1, 'comedy');
INSERT INTO `event_type` (`id`, `category`) VALUES (2, 'music');
INSERT INTO `event_type` (`id`, `category`) VALUES (3, 'sports');
INSERT INTO `event_type` (`id`, `category`) VALUES (4, 'food');
INSERT INTO `event_type` (`id`, `category`) VALUES (5, 'costume');
INSERT INTO `event_type` (`id`, `category`) VALUES (6, 'Technology');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_venue`
-- -----------------------------------------------------
START TRANSACTION;
USE `goatdb`;
INSERT INTO `user_venue` (`user_id`, `venue_id`) VALUES (1, 1);
INSERT INTO `user_venue` (`user_id`, `venue_id`) VALUES (2, 2);
INSERT INTO `user_venue` (`user_id`, `venue_id`) VALUES (3, 3);
INSERT INTO `user_venue` (`user_id`, `venue_id`) VALUES (4, 4);
INSERT INTO `user_venue` (`user_id`, `venue_id`) VALUES (5, 5);
INSERT INTO `user_venue` (`user_id`, `venue_id`) VALUES (6, 6);
INSERT INTO `user_venue` (`user_id`, `venue_id`) VALUES (7, 7);
INSERT INTO `user_venue` (`user_id`, `venue_id`) VALUES (8, 8);

COMMIT;

-- -----------------------------------------------------
-- Data for table `user_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `goatdb`;
INSERT INTO `user_event` (`user_id`, `event_id`) VALUES (1, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `event_type_has_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `goatdb`;
INSERT INTO `event_type_has_event` (`event_type_id`, `event_id`) VALUES (1, 1);
INSERT INTO `event_type_has_event` (`event_type_id`, `event_id`) VALUES (2, 2);
INSERT INTO `event_type_has_event` (`event_type_id`, `event_id`) VALUES (3, 3);
INSERT INTO `event_type_has_event` (`event_type_id`, `event_id`) VALUES (4, 4);
INSERT INTO `event_type_has_event` (`event_type_id`, `event_id`) VALUES (5, 5);
INSERT INTO `event_type_has_event` (`event_type_id`, `event_id`) VALUES (6, 6);
INSERT INTO `event_type_has_event` (`event_type_id`, `event_id`) VALUES (1, 7);
INSERT INTO `event_type_has_event` (`event_type_id`, `event_id`) VALUES (2, 8);
INSERT INTO `event_type_has_event` (`event_type_id`, `event_id`) VALUES (3, 9);
INSERT INTO `event_type_has_event` (`event_type_id`, `event_id`) VALUES (4, 10);
INSERT INTO `event_type_has_event` (`event_type_id`, `event_id`) VALUES (5, 11);
INSERT INTO `event_type_has_event` (`event_type_id`, `event_id`) VALUES (6, 12);
INSERT INTO `event_type_has_event` (`event_type_id`, `event_id`) VALUES (1, 13);
INSERT INTO `event_type_has_event` (`event_type_id`, `event_id`) VALUES (2, 14);
INSERT INTO `event_type_has_event` (`event_type_id`, `event_id`) VALUES (3, 15);

COMMIT;


-- -----------------------------------------------------
-- Data for table `venue_amenity`
-- -----------------------------------------------------
START TRANSACTION;
USE `goatdb`;
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (1, 1, '8 bathrooms');
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (2, 1, NULL);
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (3, 1, NULL);
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (4, 1, NULL);
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (5, 1, NULL);
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (6, 1, NULL);
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (1, 2, NULL);
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (4, 2, NULL);
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (2, 3, NULL);
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (3, 3, NULL);
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (4, 3, NULL);
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (5, 4, NULL);
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (6, 4, NULL);
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (1, 5, NULL);
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (4, 5, NULL);
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (3, 5, NULL);
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (2, 6, NULL);
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (4, 6, NULL);
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (5, 7, NULL);
INSERT INTO `venue_amenity` (`amenity_id`, `venue_id`, `description`) VALUES (2, 8, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `goatdb`;
INSERT INTO `comment` (`id`, `event_id`, `user_id`, `comment_date`, `content`, `rating`) VALUES (1, 1, 1, NULL, 'Dude the beer and bacon were of GOD!!', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `artist_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `goatdb`;
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (1, 1);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (2, 1);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (3, 1);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (1, 4);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (5, 6);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (3, 4);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (4, 8);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (6, 12);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (4, 3);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (9, 3);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (4, 11);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (5, 14);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (7, 1);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (8, 13);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (9, 12);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (9, 14);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (6, 15);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (8, 5);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (2, 2);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (1, 6);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (9, 7);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (4, 1);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (7, 9);
INSERT INTO `artist_event` (`artist_id`, `event_id`) VALUES (4, 10);

COMMIT;