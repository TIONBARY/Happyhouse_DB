use happyhouse22;

CREATE TABLE `baseaddress` (
  `no` int NOT NULL AUTO_INCREMENT,
  `sidoName` varchar(30) DEFAULT NULL,
  `gugunName` varchar(30) DEFAULT NULL,
  `dongName` varchar(30) DEFAULT NULL,
  `dongCode` varchar(10) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `lng` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `dongCode` (`dongCode`),
  CONSTRAINT `baseaddress_ibfk_1` FOREIGN KEY (`dongCode`) REFERENCES `dongcode` (`dongCode`)
) ENGINE=InnoDB AUTO_INCREMENT=3597 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `dongcode` (
  `dongCode` varchar(10) NOT NULL,
  `sidoName` varchar(30) DEFAULT NULL,
  `gugunName` varchar(30) DEFAULT NULL,
  `dongName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`dongCode`),
  KEY `sidoName` (`sidoName`),
  CONSTRAINT `dongcode_ibfk_1` FOREIGN KEY (`sidoName`) REFERENCES `sidocode` (`sidoName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `guguncode` (
  `gugunCode` varchar(10) NOT NULL,
  `gugunName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`gugunCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `housedeal` (
  `no` int NOT NULL AUTO_INCREMENT,
  `aptCode` int DEFAULT NULL,
  `dealAmount` varchar(20) DEFAULT NULL,
  `dealYear` int DEFAULT NULL,
  `dealMonth` int DEFAULT NULL,
  `dealDay` int DEFAULT NULL,
  `area` varchar(30) DEFAULT NULL,
  `floor` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `rentMoney` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `aptCode` (`aptCode`),
  CONSTRAINT `housedeal_ibfk_1` FOREIGN KEY (`aptCode`) REFERENCES `houseinfo` (`aptCode`)
) ENGINE=InnoDB AUTO_INCREMENT=68865 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `houseinfo` (
  `aptCode` int NOT NULL,
  `aptName` varchar(50) DEFAULT NULL,
  `dongCode` varchar(10) DEFAULT NULL,
  `dongName` varchar(30) DEFAULT NULL,
  `buildYear` int DEFAULT NULL,
  `jibun` varchar(30) DEFAULT NULL,
  `lat` varchar(30) DEFAULT NULL,
  `lng` varchar(30) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`aptCode`),
  KEY `dongCode` (`dongCode`),
  CONSTRAINT `houseinfo_ibfk_1` FOREIGN KEY (`dongCode`) REFERENCES `dongcode` (`dongCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sidocode` (
  `sidoCode` varchar(10) NOT NULL,
  `sidoName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sidoCode`),
  UNIQUE KEY `sidoName` (`sidoName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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





