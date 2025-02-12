-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema myDB
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema supplychaindatabase
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema supplychaindatabase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `supplychaindatabase` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `supplychaindatabase` ;

-- -----------------------------------------------------
-- Table `supplychaindatabase`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supplychaindatabase`.`product` (
  `ProductID` INT NOT NULL,
  `ProductName` VARCHAR(45) NOT NULL,
  `Dept` CHAR(17) NULL DEFAULT NULL,
  `Category` CHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE INDEX `ProductName_UNIQUE` (`ProductName` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `supplychaindatabase`.`fulfillment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supplychaindatabase`.`fulfillment` (
  `ProductID` INT NOT NULL,
  `FulfillmentDays` DOUBLE NOT NULL,
  PRIMARY KEY (`ProductID`),
  CONSTRAINT `fk_fulfillment_product1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `supplychaindatabase`.`product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `supplychaindatabase`.`geo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supplychaindatabase`.`geo` (
  `GeoID` INT NOT NULL,
  `CustMarket` VARCHAR(13) NOT NULL,
  `CustRegion` VARCHAR(15) NOT NULL,
  `CustCountry` VARCHAR(28) NOT NULL,
  PRIMARY KEY (`GeoID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `supplychaindatabase`.`Calendar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supplychaindatabase`.`Calendar` (
  `CalID` INT NOT NULL,
  `YearMonth` INT NOT NULL,
  PRIMARY KEY (`CalID`),
  UNIQUE INDEX `YearMonth_UNIQUE` (`YearMonth` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `supplychaindatabase`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supplychaindatabase`.`inventory` (
  `InvID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `WhInv` INT NOT NULL,
  `InvCostPerUnit` DOUBLE NOT NULL,
  `CalID` INT NOT NULL,
  PRIMARY KEY (`InvID`),
  INDEX `fk_inventory_product1_idx` (`ProductID` ASC) VISIBLE,
  INDEX `fk_inventory_Calendar1_idx` (`CalID` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_product1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `supplychaindatabase`.`product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_Calendar1`
    FOREIGN KEY (`CalID`)
    REFERENCES `supplychaindatabase`.`Calendar` (`CalID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `supplychaindatabase`.`warehouse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supplychaindatabase`.`warehouse` (
  `WhID` INT NOT NULL,
  `WhCountry` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`WhID`),
  UNIQUE INDEX `WhCountry_UNIQUE` (`WhCountry` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `supplychaindatabase`.`shipmode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supplychaindatabase`.`shipmode` (
  `ModeID` INT NOT NULL,
  `ModeName` CHAR(14) NOT NULL,
  PRIMARY KEY (`ModeID`),
  UNIQUE INDEX `ModeName_UNIQUE` (`ModeName` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `supplychaindatabase`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supplychaindatabase`.`order` (
  `OrderID` INT NOT NULL,
  `OrderItemID` INT NOT NULL,
  `OrderTime` DATETIME NOT NULL,
  `OrderQty` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `CustID` INT NOT NULL,
  `GeoID` INT NOT NULL,
  `WhID` INT NOT NULL,
  `ShipTime` DATE NOT NULL,
  `ModeID` INT NOT NULL,
  `ShipSchedule` INT NOT NULL,
  `GrossSales` INT NOT NULL,
  `DiscPc` DOUBLE NULL DEFAULT NULL,
  `Profit` INT NOT NULL,
  `CalID` INT NOT NULL,
  PRIMARY KEY (`OrderItemID`),
  INDEX `fk_order_geo_idx` (`GeoID` ASC) VISIBLE,
  INDEX `fk_order_warehouse1_idx` (`WhID` ASC) VISIBLE,
  INDEX `fk_order_shipmode1_idx` (`ModeID` ASC) VISIBLE,
  INDEX `fk_order_product1_idx` (`ProductID` ASC) VISIBLE,
  INDEX `fk_order_Calendar1_idx` (`CalID` ASC) VISIBLE,
  CONSTRAINT `fk_order_geo`
    FOREIGN KEY (`GeoID`)
    REFERENCES `supplychaindatabase`.`geo` (`GeoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_warehouse1`
    FOREIGN KEY (`WhID`)
    REFERENCES `supplychaindatabase`.`warehouse` (`WhID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_shipmode1`
    FOREIGN KEY (`ModeID`)
    REFERENCES `supplychaindatabase`.`shipmode` (`ModeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_product1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `supplychaindatabase`.`product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_Calendar1`
    FOREIGN KEY (`CalID`)
    REFERENCES `supplychaindatabase`.`Calendar` (`CalID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
