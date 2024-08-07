-- MySQL Script generated by MySQL Workbench
-- Wed Aug  7 16:10:03 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ecommerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ecommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ecommerce` DEFAULT CHARACTER SET utf8 ;
USE `Ecommerce` ;

-- -----------------------------------------------------
-- Table `Ecommerce`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Address` (
  `idAddress` INT NULL AUTO_INCREMENT,
  `Address` LONGTEXT NULL,
  `address_is_active` INT NULL,
  `createdDate` DATETIME NULL,
  `deletedDate` DATETIME NULL,
  PRIMARY KEY (`idAddress`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`User` (
  `idUser` INT NULL AUTO_INCREMENT,
  `Name` VARCHAR(55) NULL,
  `Email` VARCHAR(220) NULL,
  `Phone` VARCHAR(15) NULL,
  `Password` VARCHAR(255) NULL,
  `Salt` VARCHAR(255) NULL,
  `user_is_active` INT NULL,
  `Address_idAddress` INT NULL,
  `createdDate` DATETIME NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  INDEX `fk_User_Address1_idx` (`Address_idAddress` ASC) VISIBLE,
  CONSTRAINT `fk_User_Address1`
    FOREIGN KEY (`Address_idAddress`)
    REFERENCES `Ecommerce`.`Address` (`idAddress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Admin` (
  `idAdmin` INT NULL AUTO_INCREMENT,
  `AdminUserName` VARCHAR(45) NULL,
  `AdminPassword` VARCHAR(45) NULL,
  `createdDate` DATETIME NULL,
  PRIMARY KEY (`idAdmin`),
  UNIQUE INDEX `AdminUserName_UNIQUE` (`AdminUserName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Category` (
  `idCategory` INT NULL AUTO_INCREMENT,
  `nameCategory` VARCHAR(45) NULL,
  `category_is_delete` INT NULL,
  `Admin_created` INT NOT NULL,
  `Admin_deleted` INT NOT NULL,
  `createdDate` DATETIME NULL,
  `deletedDate` DATETIME NULL,
  PRIMARY KEY (`idCategory`),
  INDEX `fk_Category_Admin1_idx` (`Admin_created` ASC) VISIBLE,
  INDEX `fk_Category_Admin2_idx` (`Admin_deleted` ASC) VISIBLE,
  CONSTRAINT `fk_Category_Admin1`
    FOREIGN KEY (`Admin_created`)
    REFERENCES `Ecommerce`.`Admin` (`idAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Category_Admin2`
    FOREIGN KEY (`Admin_deleted`)
    REFERENCES `Ecommerce`.`Admin` (`idAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Sub_Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Sub_Category` (
  `idSubcategory` INT NULL AUTO_INCREMENT,
  `nameSubCategory` VARCHAR(100) NULL,
  `Category_idCategory` INT NOT NULL,
  `Sub_Category_is_delete` INT NULL,
  `Admin_isCreated` INT NOT NULL,
  `Admin_isDeleted` INT NOT NULL,
  `createdDate` DATETIME NULL,
  `deletedDate` DATETIME NULL,
  PRIMARY KEY (`idSubcategory`),
  INDEX `fk_Sub_Category_Category_idx` (`Category_idCategory` ASC) VISIBLE,
  INDEX `fk_Sub_Category_Admin1_idx` (`Admin_isCreated` ASC) VISIBLE,
  INDEX `fk_Sub_Category_Admin2_idx` (`Admin_isDeleted` ASC) VISIBLE,
  CONSTRAINT `fk_Sub_Category_Category`
    FOREIGN KEY (`Category_idCategory`)
    REFERENCES `Ecommerce`.`Category` (`idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sub_Category_Admin1`
    FOREIGN KEY (`Admin_isCreated`)
    REFERENCES `Ecommerce`.`Admin` (`idAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sub_Category_Admin2`
    FOREIGN KEY (`Admin_isDeleted`)
    REFERENCES `Ecommerce`.`Admin` (`idAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Products` (
  `idProducts` INT NULL AUTO_INCREMENT,
  `nameProduct` VARCHAR(55) NULL,
  `Description` VARCHAR(255) NULL,
  `Price` INT NULL,
  `Sub_Category_idSubcategory` VARCHAR(100) NOT NULL,
  `product_is_active` INT NULL,
  `admin_Created` INT NULL,
  `admin_deleted` INT NULL,
  `productImage_idproductImage` INT NOT NULL,
  `createdDate` INT NULL,
  `deletedDate` DATETIME NULL,
  PRIMARY KEY (`idProducts`),
  INDEX `fk_Products_Sub_Category1_idx` (`Sub_Category_idSubcategory` ASC) VISIBLE,
  INDEX `fk_Products_Admin1_idx` (`admin_Created` ASC) VISIBLE,
  INDEX `fk_Products_Admin2_idx` (`admin_deleted` ASC) VISIBLE,
  CONSTRAINT `fk_Products_Sub_Category1`
    FOREIGN KEY (`Sub_Category_idSubcategory`)
    REFERENCES `Ecommerce`.`Sub_Category` (`idSubcategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Products_Admin1`
    FOREIGN KEY (`admin_Created`)
    REFERENCES `Ecommerce`.`Admin` (`idAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Products_Admin2`
    FOREIGN KEY (`admin_deleted`)
    REFERENCES `Ecommerce`.`Admin` (`idAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Rating` (
  `idRating` INT NULL,
  `productRating` INT NULL,
  `Products_idProducts` INT NOT NULL,
  `rated_time` DATETIME NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idRating`),
  INDEX `fk_Rating_Products1_idx` (`Products_idProducts` ASC) VISIBLE,
  INDEX `fk_Rating_User1_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_Rating_Products1`
    FOREIGN KEY (`Products_idProducts`)
    REFERENCES `Ecommerce`.`Products` (`idProducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rating_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `Ecommerce`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`OrderIdTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`OrderIdTable` (
  `orderId` INT NULL,
  `Order_date` DATETIME NULL,
  `User_idUser` INT NOT NULL,
  `Address_idAddress` INT NOT NULL,
  PRIMARY KEY (`orderId`),
  INDEX `fk_OrderIdTable_User1_idx` (`User_idUser` ASC) VISIBLE,
  INDEX `fk_OrderIdTable_Address1_idx` (`Address_idAddress` ASC) VISIBLE,
  CONSTRAINT `fk_OrderIdTable_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `Ecommerce`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderIdTable_Address1`
    FOREIGN KEY (`Address_idAddress`)
    REFERENCES `Ecommerce`.`Address` (`idAddress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`OrderDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`OrderDetails` (
  `idOrderDetails` INT NULL AUTO_INCREMENT,
  `OrderIdTable_orderId` INT NULL,
  `Products_idProducts` INT NULL,
  `quantity` INT NULL,
  `totalPrice` INT NULL,
  PRIMARY KEY (`idOrderDetails`),
  INDEX `fk_OrderDetails_OrderIdTable1_idx` (`OrderIdTable_orderId` ASC) VISIBLE,
  INDEX `fk_OrderDetails_Products1_idx` (`Products_idProducts` ASC) VISIBLE,
  CONSTRAINT `fk_OrderDetails_OrderIdTable1`
    FOREIGN KEY (`OrderIdTable_orderId`)
    REFERENCES `Ecommerce`.`OrderIdTable` (`orderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderDetails_Products1`
    FOREIGN KEY (`Products_idProducts`)
    REFERENCES `Ecommerce`.`Products` (`idProducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`productImage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`productImage` (
  `idproductImage` INT NULL,
  `imageName` VARCHAR(100) NULL,
  `Products_idProducts` INT NOT NULL,
  `createdDate` DATETIME NULL,
  PRIMARY KEY (`idproductImage`),
  INDEX `fk_productImage_Products1_idx` (`Products_idProducts` ASC) VISIBLE,
  CONSTRAINT `fk_productImage_Products1`
    FOREIGN KEY (`Products_idProducts`)
    REFERENCES `Ecommerce`.`Products` (`idProducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Cart` (
  `idCart` INT NULL,
  `quantity` INT NULL,
  `Products_idProducts` INT NOT NULL,
  `User_idUser` INT NOT NULL,
  `createdDate` DATETIME NULL,
  `sessionId` VARCHAR(100) NULL,
  PRIMARY KEY (`idCart`),
  INDEX `fk_Cart_Products1_idx` (`Products_idProducts` ASC) VISIBLE,
  INDEX `fk_Cart_User1_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_Cart_Products1`
    FOREIGN KEY (`Products_idProducts`)
    REFERENCES `Ecommerce`.`Products` (`idProducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cart_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `Ecommerce`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
