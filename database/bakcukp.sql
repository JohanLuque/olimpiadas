/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - olimpiadas
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`olimpiadas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `olimpiadas`;

/*Table structure for table `delegaciones` */

DROP TABLE IF EXISTS `delegaciones`;

CREATE TABLE `delegaciones` (
  `iddelegacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDelegacion` varchar(50) NOT NULL,
  PRIMARY KEY (`iddelegacion`),
  UNIQUE KEY `uk_delegaciones` (`nombreDelegacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `delegaciones` */

/*Table structure for table `det_disciplinas` */

DROP TABLE IF EXISTS `det_disciplinas`;

CREATE TABLE `det_disciplinas` (
  `iddet` int(11) NOT NULL AUTO_INCREMENT,
  `idolimpiada` int(11) NOT NULL,
  `iddisciplina` int(11) NOT NULL,
  PRIMARY KEY (`iddet`),
  KEY `fk_idolim_det` (`idolimpiada`),
  KEY `fk_iddis_det` (`iddisciplina`),
  CONSTRAINT `fk_iddis_det` FOREIGN KEY (`iddisciplina`) REFERENCES `disciplinas` (`iddisciplina`),
  CONSTRAINT `fk_idolim_det` FOREIGN KEY (`idolimpiada`) REFERENCES `olimpiadas` (`idolimpiada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `det_disciplinas` */

/*Table structure for table `disciplinas` */

DROP TABLE IF EXISTS `disciplinas`;

CREATE TABLE `disciplinas` (
  `iddisciplina` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDisciplina` varchar(50) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`iddisciplina`),
  UNIQUE KEY `uk_disciplinas` (`nombreDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `disciplinas` */

/*Table structure for table `equipos` */

DROP TABLE IF EXISTS `equipos`;

CREATE TABLE `equipos` (
  `idequipo` int(11) NOT NULL AUTO_INCREMENT,
  `iddelegacion` int(11) NOT NULL,
  `idparticipante` int(11) NOT NULL,
  PRIMARY KEY (`idequipo`),
  KEY `fk_idpar_equ` (`idparticipante`),
  KEY `fk_iddel_equ` (`iddelegacion`),
  CONSTRAINT `fk_iddel_equ` FOREIGN KEY (`iddelegacion`) REFERENCES `delegaciones` (`iddelegacion`),
  CONSTRAINT `fk_idpar_equ` FOREIGN KEY (`idparticipante`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `equipos` */

/*Table structure for table `integrantes` */

DROP TABLE IF EXISTS `integrantes`;

CREATE TABLE `integrantes` (
  `idintegrante` int(11) NOT NULL AUTO_INCREMENT,
  `idequipo` int(11) NOT NULL,
  `iddet` int(11) NOT NULL,
  PRIMARY KEY (`idintegrante`),
  KEY `fk_idequ_int` (`idequipo`),
  KEY `fk_iddet_int` (`iddet`),
  CONSTRAINT `fk_iddet_int` FOREIGN KEY (`iddet`) REFERENCES `det_disciplinas` (`iddet`),
  CONSTRAINT `fk_idequ_int` FOREIGN KEY (`idequipo`) REFERENCES `equipos` (`idequipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `integrantes` */

/*Table structure for table `medalleros` */

DROP TABLE IF EXISTS `medalleros`;

CREATE TABLE `medalleros` (
  `idmedallero` int(11) NOT NULL AUTO_INCREMENT,
  `idintegrante` int(11) NOT NULL,
  `puesto` tinyint(4) DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmedallero`),
  KEY `fk_id_med` (`idintegrante`),
  CONSTRAINT `fk_id_med` FOREIGN KEY (`idintegrante`) REFERENCES `integrantes` (`idintegrante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `medalleros` */

/*Table structure for table `olimpiadas` */

DROP TABLE IF EXISTS `olimpiadas`;

CREATE TABLE `olimpiadas` (
  `idolimpiada` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `fechainicio` date NOT NULL,
  `fechafin` date DEFAULT NULL,
  `lugar` varchar(50) NOT NULL,
  PRIMARY KEY (`idolimpiada`),
  UNIQUE KEY `uk_year_oli` (`fechainicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `olimpiadas` */

/*Table structure for table `personas` */

DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(50) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `dni` char(8) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idpersona`),
  UNIQUE KEY `uk_ddni_per` (`dni`,`apellidos`,`nombres`,`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `personas` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
