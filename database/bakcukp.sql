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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `delegaciones` */

insert  into `delegaciones`(`iddelegacion`,`nombreDelegacion`) values 
(3,'Abancay'),
(4,'Arequipa'),
(25,'Atalaya'),
(6,'Cajamarca'),
(7,'Callao'),
(1,'Chachapoyas'),
(14,'Chiclayo'),
(11,'Chincha'),
(12,'Chupaca'),
(8,'Cuzco'),
(9,'Huancavelica'),
(10,'Huánuco'),
(2,'Huaraz'),
(15,'Lima'),
(18,'Llo'),
(17,'Manu'),
(19,'Pasco'),
(20,'Piura'),
(21,'Puno'),
(5,'Sucre'),
(23,'Tacna'),
(22,'Tocache'),
(13,'Trujillo'),
(24,'Tumbes'),
(16,'Ucayali');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `det_disciplinas` */

insert  into `det_disciplinas`(`iddet`,`idolimpiada`,`iddisciplina`) values 
(1,1,1),
(2,1,2),
(3,1,3),
(4,1,4),
(5,2,6),
(6,2,7),
(7,3,9),
(8,4,1),
(9,4,8),
(10,4,7),
(11,5,4),
(12,5,3),
(13,5,2),
(14,6,9),
(15,6,2);

/*Table structure for table `disciplinas` */

DROP TABLE IF EXISTS `disciplinas`;

CREATE TABLE `disciplinas` (
  `iddisciplina` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDisciplina` varchar(50) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`iddisciplina`),
  UNIQUE KEY `uk_disciplinas` (`nombreDisciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `disciplinas` */

insert  into `disciplinas`(`iddisciplina`,`nombreDisciplina`,`estado`) values 
(1,'Fútbol','1'),
(2,'Volley','1'),
(3,'Balon Mano','1'),
(4,'Atletismo Relevo','1'),
(5,'Baloncesto','1'),
(6,'Béisbol','1'),
(7,'Fútbol americano ','1'),
(8,'Hockey','1'),
(9,'Water Polo','1');

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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `equipos` */

insert  into `equipos`(`idequipo`,`iddelegacion`,`idparticipante`) values 
(1,11,1),
(2,11,2),
(3,10,4),
(4,3,7),
(5,3,8),
(6,4,11),
(7,4,12),
(8,7,5),
(9,7,6),
(10,8,7),
(11,8,8),
(12,9,9),
(13,1,10),
(14,1,11),
(15,5,12),
(16,2,1),
(17,2,3),
(18,6,4),
(19,6,5),
(20,24,9),
(21,24,10),
(22,23,3),
(23,23,7),
(24,23,8),
(25,11,1),
(26,11,2),
(27,20,3),
(28,20,4),
(29,15,6),
(30,15,1),
(31,15,10),
(32,15,11),
(33,22,1),
(34,22,3),
(35,23,5),
(36,23,7),
(37,24,9),
(38,24,10),
(39,11,11),
(40,12,8),
(41,8,12),
(42,8,13),
(43,17,14),
(44,1,1),
(45,1,2),
(46,2,5),
(47,2,7),
(48,3,4),
(49,3,3),
(50,5,6),
(51,5,8),
(52,6,9),
(53,6,10),
(54,7,11),
(55,7,12),
(56,8,13),
(57,8,14);

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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `integrantes` */

insert  into `integrantes`(`idintegrante`,`idequipo`,`iddet`) values 
(1,1,1),
(2,2,1),
(3,3,1),
(4,4,1),
(5,5,1),
(6,6,2),
(7,7,2),
(8,8,2),
(9,9,2),
(10,10,2),
(11,11,2),
(12,12,2),
(13,13,3),
(14,14,3),
(15,15,3),
(16,16,4),
(17,17,4),
(18,18,4),
(19,19,4),
(20,20,5),
(21,21,5),
(22,22,5),
(23,23,5),
(24,24,5),
(25,25,6),
(26,26,6),
(27,27,6),
(28,28,6),
(29,29,7),
(30,30,7),
(31,31,7),
(32,32,7),
(33,33,8),
(34,34,8),
(35,35,8),
(36,36,8),
(37,37,9),
(38,38,9),
(39,39,9),
(40,40,9),
(41,41,10),
(42,42,10),
(43,43,10),
(44,44,11),
(45,45,11),
(46,46,11),
(47,47,11),
(48,48,12),
(49,49,12),
(50,50,12),
(51,51,12),
(52,52,12),
(53,53,12),
(54,54,13),
(55,55,13),
(56,56,13),
(57,57,13),
(58,18,15),
(59,13,15),
(60,1,15),
(61,8,15);

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `medalleros` */

insert  into `medalleros`(`idmedallero`,`idintegrante`,`puesto`,`estado`) values 
(1,1,1,'1'),
(2,3,2,'1'),
(3,4,3,'1'),
(4,6,1,'1'),
(5,8,2,'1'),
(6,10,3,'1'),
(7,13,1,'1'),
(8,15,2,'1'),
(9,16,NULL,'0'),
(10,18,NULL,'0'),
(11,20,NULL,'0'),
(12,22,NULL,'0'),
(13,25,NULL,'0'),
(14,27,NULL,'0'),
(15,29,NULL,'0'),
(16,33,NULL,'0'),
(17,35,NULL,'0'),
(18,37,NULL,'0'),
(19,39,NULL,'0'),
(20,40,NULL,'0'),
(21,41,NULL,'0'),
(22,43,NULL,'0'),
(23,44,NULL,'0'),
(24,46,NULL,'0'),
(25,48,NULL,'0'),
(26,50,NULL,'0'),
(27,52,NULL,'0'),
(28,54,NULL,'0'),
(29,56,NULL,'0'),
(30,58,2,'1'),
(31,59,NULL,'1'),
(32,60,3,'1'),
(33,61,1,'1');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `olimpiadas` */

insert  into `olimpiadas`(`idolimpiada`,`nombre`,`fechainicio`,`fechafin`,`lugar`) values 
(1,'Copa Perú','2023-05-29','2023-06-07','Lima'),
(2,'Olimpiadas juveniles','2022-05-29','2022-05-29','Pisco'),
(3,'Juegos olimpicos','2021-01-11','2021-01-28','Ica'),
(4,'Amigos del barrio','2020-02-26','2020-02-27','Chincha'),
(5,'Juegos provinciales','2019-12-29','2023-12-31','Loreto'),
(6,'Peru 2024','2024-02-01','2024-02-06','1');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `personas` */

insert  into `personas`(`idpersona`,`apellidos`,`nombres`,`dni`,`correo`,`clave`,`estado`) values 
(1,'Luque','Johan','71789712','luquejohan194@gmail.com','$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK','1'),
(2,'Quispe','Piero','11111112','quispe36@gmail.com','$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK','1'),
(3,'Polo','Andy','11111113','polo24@gmail.com','$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK','1'),
(4,'Urruti','Luis','11111114','urruti11@gmail.com','$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK','1'),
(5,'Carvallo','Aurelio','11111115','carvallo1@gmail.com','$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK','1'),
(6,'Corzo','Aldo','11111116','corzo29@gmail.com','$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK','1'),
(7,'Riveros','Wilian','11111117','riveros3@gmail.com','$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK','1'),
(8,'Di benedetto','Mathias','11111118','mathias4@gmail.com','$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK','1'),
(9,'Cabanillas','Nelson','11111119','cabanillas27@gmail.com','$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK','1'),
(10,'Calcaterra','Horacio','11111120','calcaterra10@gmail.com','$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK','1'),
(11,'Perez','Matin','11111121','martin16@gmail.com','$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK','1'),
(12,'Ureña','Rodrigo','11111122','rodrigo18@gmail.com','$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK','1'),
(13,'Valera','Alex','11111123','valera20@gmail.com','$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK','1'),
(14,'Herrera','Emanuel','21111148','herrera15@gmail.com','$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK','1');

/* Procedure structure for procedure `spu_disciplinas_fecha_grafico` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_disciplinas_fecha_grafico` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_disciplinas_fecha_grafico`()
BEGIN 
	SELECT YEAR(olimpiadas.`fechainicio`),COUNT(disciplinas.`nombreDisciplina`)
	FROM det_disciplinas
	INNER JOIN disciplinas ON disciplinas.`iddisciplina` = det_disciplinas.`iddisciplina`
	INNER JOIN olimpiadas ON olimpiadas.`idolimpiada` = det_disciplinas.`idolimpiada`
	GROUP BY olimpiadas.`fechainicio`
	ORDER BY olimpiadas.`fechainicio` DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_editar_disciplinas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_editar_disciplinas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_editar_disciplinas`(
IN _iddisciplina INT,
IN _nombreDisciplina VARCHAR(50)
)
BEGIN
	UPDATE disciplinas SET
		nombreDisciplina = _nombreDisciplina
	WHERE iddisciplina = _iddisciplina;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_eliminar_disciplinas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_eliminar_disciplinas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_eliminar_disciplinas`(
IN _iddisciplina INT
)
BEGIN
	UPDATE disciplinas SET
		estado = '0'
	WHERE iddisciplina = _iddisciplina;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_integrantes_fecha_grafico` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_integrantes_fecha_grafico` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_integrantes_fecha_grafico`()
BEGIN 
	SELECT olimpiadas.nombre, COUNT(olimpiadas.idolimpiada)
	FROM integrantes
	INNER JOIN  det_disciplinas ON det_disciplinas.iddet = integrantes.iddet
	INNER JOIN olimpiadas ON olimpiadas.idolimpiada =  det_disciplinas.idolimpiada
	GROUP BY olimpiadas.nombre
	ORDER BY olimpiadas.`nombre`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_detDisciplinas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_detDisciplinas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_detDisciplinas`(
IN _idolimpiada INT
)
BEGIN
	SELECT disciplinas.iddisciplina , disciplinas.`nombreDisciplina`
	FROM det_disciplinas
	INNER JOIN  disciplinas ON disciplinas.`iddisciplina` = det_disciplinas.`iddisciplina`
	INNER JOIN olimpiadas ON olimpiadas.`idolimpiada` = det_disciplinas.`idolimpiada`
	WHERE olimpiadas.`idolimpiada` = _idolimpiada;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_disciplinas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_disciplinas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_disciplinas`()
BEGIN 
	SELECT iddisciplina, nombreDisciplina FROM disciplinas
	WHERE estado = '1'
	ORDER BY iddisciplina DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_equipos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_equipos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_equipos`()
BEGIN
	SELECT idequipo, delegaciones.`nombreDelegacion` 
	FROM equipos
	INNER JOIN delegaciones ON delegaciones.`iddelegacion` = equipos.`iddelegacion`
	GROUP BY delegaciones.`nombreDelegacion`
	ORDER BY delegaciones.`nombreDelegacion`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_olimpiadas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_olimpiadas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_olimpiadas`()
BEGIN
	SELECT idolimpiada, YEAR(fechainicio),CONCAT(nombre, ' - ',
	YEAR(fechainicio)) AS modal 
	FROM olimpiadas
	ORDER BY fechainicio DESC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_lista_medallero` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_lista_medallero` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_lista_medallero`(
IN _iddisciplina INT ,
IN _idolimpiada INT, 
IN _estado CHAR(1)
)
BEGIN
	SELECT idmedallero,
	disciplinas.`nombreDisciplina`, delegaciones.`nombreDelegacion` AS equipo,
	puesto, 
	YEAR(olimpiadas.`fechainicio`) AS fecha,
	olimpiadas.`lugar` AS lugar
	FROM medalleros
	INNER JOIN integrantes ON integrantes.idintegrante = medalleros.idintegrante
	INNER JOIN equipos ON equipos.`idequipo` = integrantes.`idequipo`
	INNER JOIN delegaciones ON delegaciones.iddelegacion = equipos.`iddelegacion`
	INNER JOIN det_disciplinas ON det_disciplinas.`iddet` = integrantes.`iddet`
	INNER JOIN olimpiadas ON olimpiadas.idolimpiada = det_disciplinas.idolimpiada
	INNER JOIN disciplinas ON disciplinas.iddisciplina = det_disciplinas.iddisciplina
	WHERE disciplinas.`iddisciplina` = _iddisciplina  AND olimpiadas.`idolimpiada` =  _idolimpiada
	AND medalleros.estado = _estado
		-- GROUP BY disciplinas.`nombreDisciplina`
	ORDER BY CASE WHEN puesto IS NULL THEN 1 ELSE 0 END, puesto;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_login_corre` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_login_corre` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_login_corre`(
	IN _correo VARCHAR(50)
)
BEGIN 
	SELECT idpersona,apellidos,nombres, correo, clave
	FROM personas
	WHERE correo = _correo; 
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_obtener_disciplinas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_obtener_disciplinas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_obtener_disciplinas`(IN _iddisciplina INT)
BEGIN
	SELECT * FROM disciplinas
		WHERE iddisciplina = _iddisciplina;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_premiar_medallero` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_premiar_medallero` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_premiar_medallero`(
IN _idmedallero INT,
IN _puesto TINYINT 
)
BEGIN 
	IF _puesto = '' THEN SET _puesto = NULL;  END IF;

	UPDATE medalleros SET
		puesto  = _puesto,
		estado = '1'
	WHERE idmedallero = _idmedallero;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registar_Detdisciplina` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registar_Detdisciplina` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registar_Detdisciplina`(
IN _idolimpiada INT, 
IN _iddisciplina INT
)
BEGIN
	INSERT INTO det_disciplinas (idolimpiada, iddisciplina) VALUES
	(_idolimpiada, _iddisciplina);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_disciplina` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_disciplina` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_disciplina`(IN _nombreDisciplina VARCHAR(50))
BEGIN 
	INSERT INTO disciplinas (nombreDisciplina) VALUE
	(_nombreDisciplina);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_integrantes` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_integrantes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_integrantes`(
IN _idequipo INT,
IN _iddet INT 
)
BEGIN 
	DECLARE _nuevo int;
	INSERT INTO integrantes(idequipo, iddet) VALUES
	(_idequipo, _iddet);
	set _nuevo  = LAST_INSERT_ID();
	insert into medalleros (idintegrante) value
	(_nuevo);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_olimpiadas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_olimpiadas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_olimpiadas`(	
IN _nombre VARCHAR(50),
IN _fechainicio DATE,
IN _fechafin DATE,
IN _lugar VARCHAR(50)
)
BEGIN 
	IF _fechainicio = '' THEN SET _fechainicio = NULL;  END IF;
	
	INSERT INTO olimpiadas(nombre, fechainicio, fechafin, lugar) VALUES
	(_nombre, _fechainicio, _fechafin, _lugar);
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
