use happyhouse22;

CREATE TABLE IF NOT EXISTS `happyhouse22`.`academy` (
  `shopNo` INT NOT NULL,
  `shopName` VARCHAR(45) NULL,
  `category` VARCHAR(45) NULL,
  `dongCode` VARCHAR(10) NULL,
  `dongName` VARCHAR(30) NULL,
  `address` VARCHAR(45) NULL,
  `lng` VARCHAR(45) NULL,
  `lat` VARCHAR(45) NULL,
  PRIMARY KEY (`shopNo`),
  INDEX `fk_academy_dongcode1_idx` (`dongCode` ASC) VISIBLE,
  CONSTRAINT `fk_academy_dongcode1`
    FOREIGN KEY (`dongCode`)
    REFERENCES `happyhouse22`.`dongcode` (`dongCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `happyhouse22`.`user` (
  `id` VARCHAR(20) NOT NULL,
  `pw` VARCHAR(20) NULL,
  `email` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `age` INT NULL,
  `prefer_dongCode` VARCHAR(10) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_dongcode1_idx` (`prefer_dongCode` ASC) VISIBLE,
  CONSTRAINT `fk_user_dongcode1`
    FOREIGN KEY (`prefer_dongCode`)
    REFERENCES `happyhouse22`.`dongcode` (`dongCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `happyhouse22`.`school` (
  `schoolType` VARCHAR(10) NULL,
  `build` VARCHAR(10) NULL,
  `schoolName` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL,
  `normal` VARCHAR(45) NULL,
  `special` VARCHAR(45) NULL,
  PRIMARY KEY (`schoolName`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `happyhouse22`.`board` (
  `No` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `text` VARCHAR(2000) NOT NULL,
  `writer` VARCHAR(45) NOT NULL,
  `date` DATE NULL,
  PRIMARY KEY (`No`),
  INDEX `fk_board_user1_idx` (`writer` ASC) VISIBLE,
  CONSTRAINT `fk_board_user1`
    FOREIGN KEY (`writer`)
    REFERENCES `happyhouse22`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

drop table test;

select *
from useruser;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\school.csv'
into table school character set utf8mb4
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\seoul.txt' 
into table academy character set utf8mb4 
fields terminated by ',' 
lines terminated by '\r\n' 
ignore 1 rows;





