-- MySQL Script generated by MySQL Workbench
-- Tue Dec 12 22:44:41 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema projeto_final
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projeto_final
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projeto_final` DEFAULT CHARACTER SET utf8 ;
USE `projeto_final` ;

-- -----------------------------------------------------
-- Table `projeto_final`.`machine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_final`.`machine` (
  `id_machine` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `model` VARCHAR(8) NOT NULL,
  `manufacture_date` YEAR NOT NULL DEFAULT (NOW()),
  `location` VARCHAR(8) NULL,
  PRIMARY KEY (`id_machine`))
ENGINE = InnoDB DEFAULT CHARSET=UTF8;


-- -----------------------------------------------------
-- Table `projeto_final`.`maint`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_final`.`maint` (
  `datetime` DATETIME NOT NULL DEFAULT (NOW()),
  `id_machine` SMALLINT UNSIGNED NOT NULL,
  `component` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`datetime`, `id_machine`, `component`),
  INDEX `fk_maint_machine1_idx` (`id_machine` ASC) VISIBLE,
  CONSTRAINT `fk_maint_machine1`
    FOREIGN KEY (`id_machine`)
    REFERENCES `projeto_final`.`machine` (`id_machine`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=UTF8;


-- -----------------------------------------------------
-- Table `projeto_final`.`telemetry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_final`.`telemetry` (
  `datetime` DATETIME NOT NULL DEFAULT (NOW()),
  `id_machine` SMALLINT UNSIGNED	NOT	NULL,
  `volt` DECIMAL(15,12) NOT NULL COMMENT '176.217853015625',
  `rotate` DECIMAL(15,12) NOT NULL,
  `pressure` DECIMAL(15,12) NOT NULL,
  `vibration` DECIMAL(15,12) NOT NULL,
  PRIMARY KEY (`datetime`, `id_machine`),
  INDEX `fk_telemetry_machine1_idx` (`id_machine` ASC) VISIBLE,
  CONSTRAINT `fk_telemetry_machine1`
    FOREIGN KEY (`id_machine`)
    REFERENCES `projeto_final`.`machine` (`id_machine`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=UTF8;


-- -----------------------------------------------------
-- Table `projeto_final`.`failure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_final`.`failure` (
  `datetime` DATETIME NOT NULL DEFAULT (NOW()),
  `id_machine` SMALLINT UNSIGNED NOT NULL,
  `failure` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`datetime`, `id_machine`, `failure`),
  INDEX `fk_failure_maint1` (`id_machine` ASC) VISIBLE,
  CONSTRAINT `fk_failure_maint1`
    FOREIGN KEY (`datetime`)
    REFERENCES `projeto_final`.`maint` (`datetime`),
    FOREIGN KEY (`id_machine`)
    REFERENCES `projeto_final`.`machine` (`id_machine`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=UTF8;


-- -----------------------------------------------------
-- Table `projeto_final`.`error`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_final`.`error` (
  `datetime` DATETIME NOT NULL DEFAULT (NOW()),
  `id_machine` SMALLINT UNSIGNED NOT NULL,
  `id_error` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`datetime`, `id_machine`, `id_error`),
  INDEX `fk_error_machine_idx` (`id_machine` ASC) VISIBLE,
  CONSTRAINT `fk_error_machine`
    FOREIGN KEY (`id_machine`)
    REFERENCES `projeto_final`.`machine` (`id_machine`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=UTF8;


-- -----------------------------------------------------
-- Table `projeto_final`.`brands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_final`.`brands` (
  `id_machine` SMALLINT UNSIGNED NOT NULL,
  `brand` VARCHAR(8) NULL,
  `motor_size` VARCHAR(8) NULL,
  PRIMARY KEY (`id_machine`),
  INDEX `fk_brands_machine_idx` (`id_machine` ASC) VISIBLE,
  CONSTRAINT `fk_brands_machine1`
    FOREIGN KEY (`id_machine`)
    REFERENCES `projeto_final`.`machine` (`id_machine`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=UTF8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;