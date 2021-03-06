-- MySQL Script generated by MySQL Workbench
-- Fri Oct  2 14:39:02 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CRS-Tulcan
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CRS-Tulcan
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CRS-Tulcan` DEFAULT CHARACTER SET utf8 ;
USE `CRS-Tulcan` ;

-- -----------------------------------------------------
-- Table `CRS-Tulcan`.`pabellon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CRS-Tulcan`.`pabellon` ;

CREATE TABLE IF NOT EXISTS `CRS-Tulcan`.`pabellon` (
  `idpabellon` INT NOT NULL AUTO_INCREMENT,
  `pabellon` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpabellon`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRS-Tulcan`.`celda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CRS-Tulcan`.`celda` ;

CREATE TABLE IF NOT EXISTS `CRS-Tulcan`.`celda` (
  `idcelda` INT NOT NULL AUTO_INCREMENT,
  `celda` VARCHAR(45) NOT NULL,
  `pabellon_idpabellon` INT NOT NULL,
  PRIMARY KEY (`idcelda`),
  INDEX `fk_celda_pabellon1_idx` (`pabellon_idpabellon` ASC) VISIBLE,
  CONSTRAINT `fk_celda_pabellon1`
    FOREIGN KEY (`pabellon_idpabellon`)
    REFERENCES `CRS-Tulcan`.`pabellon` (`idpabellon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRS-Tulcan`.`nacionalidades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CRS-Tulcan`.`nacionalidades` ;

CREATE TABLE IF NOT EXISTS `CRS-Tulcan`.`nacionalidades` (
  `idnacionalidades` INT NOT NULL AUTO_INCREMENT,
  `nacionalidad` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `continente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idnacionalidades`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRS-Tulcan`.`ppl`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CRS-Tulcan`.`ppl` ;

CREATE TABLE IF NOT EXISTS `CRS-Tulcan`.`ppl` (
  `idppl` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `cedula` INT NOT NULL,
  `condena` VARCHAR(45) NULL,
  `pabellon_idpabellon` INT NOT NULL,
  `celda_idcelda` INT NOT NULL,
  `nacionalidades_idnacionalidades` INT NOT NULL,
  PRIMARY KEY (`idppl`),
  INDEX `fk_ppl_pabellon1_idx` (`pabellon_idpabellon` ASC) VISIBLE,
  INDEX `fk_ppl_celda1_idx` (`celda_idcelda` ASC) VISIBLE,
  INDEX `fk_ppl_nacionalidades1_idx` (`nacionalidades_idnacionalidades` ASC) VISIBLE,
  CONSTRAINT `fk_ppl_pabellon1`
    FOREIGN KEY (`pabellon_idpabellon`)
    REFERENCES `CRS-Tulcan`.`pabellon` (`idpabellon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ppl_celda1`
    FOREIGN KEY (`celda_idcelda`)
    REFERENCES `CRS-Tulcan`.`celda` (`idcelda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ppl_nacionalidades1`
    FOREIGN KEY (`nacionalidades_idnacionalidades`)
    REFERENCES `CRS-Tulcan`.`nacionalidades` (`idnacionalidades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `CRS-Tulcan`.`ingreso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CRS-Tulcan`.`ingreso` ;

CREATE TABLE IF NOT EXISTS `CRS-Tulcan`.`ingreso` (
  `idingreso` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `hora` DATETIME NOT NULL,
  `boleta` VARCHAR(20) NOT NULL,
  `auDispone` VARCHAR(45) NOT NULL,
  `procedencia` VARCHAR(45) NOT NULL,
  `conduce` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `observaciones` TEXT NOT NULL,
  `ppl_idppl` INT NOT NULL,
  PRIMARY KEY (`idingreso`),
  INDEX `fk_ingreso_ppl_idx` (`ppl_idppl` ASC) VISIBLE,
  CONSTRAINT `fk_ingreso_ppl`
    FOREIGN KEY (`ppl_idppl`)
    REFERENCES `CRS-Tulcan`.`ppl` (`idppl`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRS-Tulcan`.`dewey`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CRS-Tulcan`.`dewey` ;

CREATE TABLE IF NOT EXISTS `CRS-Tulcan`.`dewey` (
  `iddewey` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(45) NULL,
  `dewey` VARCHAR(45) NULL,
  PRIMARY KEY (`iddewey`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRS-Tulcan`.`estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CRS-Tulcan`.`estado` ;

CREATE TABLE IF NOT EXISTS `CRS-Tulcan`.`estado` (
  `idestado` INT NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NULL,
  PRIMARY KEY (`idestado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRS-Tulcan`.`libro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CRS-Tulcan`.`libro` ;

CREATE TABLE IF NOT EXISTS `CRS-Tulcan`.`libro` (
  `idlibro` INT NOT NULL AUTO_INCREMENT,
  `nombreLibro` VARCHAR(45) NULL,
  `autor` VARCHAR(45) NULL,
  `edicion` VARCHAR(45) NULL,
  `ibsn` VARCHAR(45) NULL,
  `cutter` VARCHAR(45) NULL,
  `anoFabricacion` INT NULL,
  `fechaIngreso` DATE NULL,
  `codigo` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  `editorial` VARCHAR(45) NULL,
  `dewey_iddewey` INT NOT NULL,
  `numeroLibros` INT NULL,
  `paginas` INT NULL,
  `estado_idestado` INT NOT NULL,
  PRIMARY KEY (`idlibro`),
  INDEX `fk_libro_dewey1_idx` (`dewey_iddewey` ASC) VISIBLE,
  INDEX `fk_libro_estado1_idx` (`estado_idestado` ASC) VISIBLE,
  CONSTRAINT `fk_libro_dewey1`
    FOREIGN KEY (`dewey_iddewey`)
    REFERENCES `CRS-Tulcan`.`dewey` (`iddewey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libro_estado1`
    FOREIGN KEY (`estado_idestado`)
    REFERENCES `CRS-Tulcan`.`estado` (`idestado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRS-Tulcan`.`prestamoLibro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CRS-Tulcan`.`prestamoLibro` ;

CREATE TABLE IF NOT EXISTS `CRS-Tulcan`.`prestamoLibro` (
  `idprestamoLibro` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `ppl_idppl` INT NOT NULL,
  `libro_idlibro` INT NOT NULL,
  PRIMARY KEY (`idprestamoLibro`),
  INDEX `fk_prestamoLibro_ppl1_idx` (`ppl_idppl` ASC) VISIBLE,
  INDEX `fk_prestamoLibro_libro1_idx` (`libro_idlibro` ASC) VISIBLE,
  CONSTRAINT `fk_prestamoLibro_ppl1`
    FOREIGN KEY (`ppl_idppl`)
    REFERENCES `CRS-Tulcan`.`ppl` (`idppl`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prestamoLibro_libro1`
    FOREIGN KEY (`libro_idlibro`)
    REFERENCES `CRS-Tulcan`.`libro` (`idlibro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRS-Tulcan`.`devLibro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CRS-Tulcan`.`devLibro` ;

CREATE TABLE IF NOT EXISTS `CRS-Tulcan`.`devLibro` (
  `iddevLibro` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `prestamoLibro_idprestamoLibro` INT NOT NULL,
  PRIMARY KEY (`iddevLibro`),
  INDEX `fk_devLibro_prestamoLibro1_idx` (`prestamoLibro_idprestamoLibro` ASC) VISIBLE,
  CONSTRAINT `fk_devLibro_prestamoLibro1`
    FOREIGN KEY (`prestamoLibro_idprestamoLibro`)
    REFERENCES `CRS-Tulcan`.`prestamoLibro` (`idprestamoLibro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRS-Tulcan`.`subdewey`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CRS-Tulcan`.`subdewey` ;

CREATE TABLE IF NOT EXISTS `CRS-Tulcan`.`subdewey` (
  `idsubdewey` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(45) NULL,
  `subdewey` VARCHAR(45) NULL,
  `dewey_iddewey` INT NOT NULL,
  PRIMARY KEY (`idsubdewey`),
  INDEX `fk_subdewey_dewey1_idx` (`dewey_iddewey` ASC) VISIBLE,
  CONSTRAINT `fk_subdewey_dewey1`
    FOREIGN KEY (`dewey_iddewey`)
    REFERENCES `CRS-Tulcan`.`dewey` (`iddewey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
