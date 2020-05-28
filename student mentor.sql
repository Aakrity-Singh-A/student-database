-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema student_mentor
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema student_mentor
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `student_mentor` DEFAULT CHARACTER SET utf8 ;
USE `student_mentor` ;

-- -----------------------------------------------------
-- Table `student_mentor`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_mentor`.`department` (
  `Dname` VARCHAR(45) NOT NULL,
  `Dnumber` INT(11) NOT NULL,
  `course_id` INT(11) NOT NULL,
  `course` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`course_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `student_mentor`.`mentor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_mentor`.`mentor` (
  `MID` INT(11) NOT NULL,
  `MFname` VARCHAR(45) NOT NULL,
  `MLname` VARCHAR(45) NOT NULL,
  `Phone_no` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `department_course_id` INT(11) NOT NULL,
  PRIMARY KEY (`MID`),
  INDEX `fk_mentor_department1_idx` (`department_course_id` ASC),
  CONSTRAINT `fk_mentor_department1`
    FOREIGN KEY (`department_course_id`)
    REFERENCES `student_mentor`.`department` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `student_mentor`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_mentor`.`student` (
  `SID` INT(11) NOT NULL,
  `SFname` VARCHAR(45) NOT NULL,
  `SLname` VARCHAR(45) NOT NULL,
  `DOB` DATE NOT NULL,
  `Year` VARCHAR(45) NOT NULL,
  `Phone_no` INT(11) NULL DEFAULT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `department_course_id` INT(11) NOT NULL,
  PRIMARY KEY (`SID`),
  INDEX `fk_student_department1_idx` (`department_course_id` ASC),
  CONSTRAINT `fk_student_department1`
    FOREIGN KEY (`department_course_id`)
    REFERENCES `student_mentor`.`department` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `student_mentor`.`student_has_mentor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_mentor`.`student_has_mentor` (
  `student_SID` INT(11) NOT NULL,
  `Mentor_MID` INT(11) NOT NULL,
  `Remarks` VARCHAR(45) NOT NULL,
  `Date` DATE NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`student_SID`, `Mentor_MID`),
  INDEX `fk_student_has_Mentor_Mentor1_idx` (`Mentor_MID` ASC),
  INDEX `fk_student_has_Mentor_student1_idx` (`student_SID` ASC),
  CONSTRAINT `fk_student_has_Mentor_Mentor1`
    FOREIGN KEY (`Mentor_MID`)
    REFERENCES `student_mentor`.`mentor` (`MID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_Mentor_student1`
    FOREIGN KEY (`student_SID`)
    REFERENCES `student_mentor`.`student` (`SID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
