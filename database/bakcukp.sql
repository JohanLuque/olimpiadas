/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.24-MariaDB : Database - olimpiadas
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`olimpiadas` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `olimpiadas`;

/*Table structure for table `delegaciones` */

DROP TABLE IF EXISTS `delegaciones`;

CREATE TABLE `delegaciones` (
  `iddelegacion` int(11) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(50) NOT NULL,
  `provincia` varchar(50) NOT NULL,
  PRIMARY KEY (`iddelegacion`),
  UNIQUE KEY `uk_delegaciones` (`departamento`,`provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

/*Data for the table `delegaciones` */

insert  into `delegaciones`(`iddelegacion`,`departamento`,`provincia`) values 
(1,'Amazonas','Chachapoyas'),
(2,'Ancash','Huaraz'),
(3,'Apurimac','Abancay'),
(4,'Arequipa','Arequipa'),
(5,'ayacucho','Sucre'),
(6,'Cajamarca','Cajamarca'),
(7,'Callao','Callao'),
(8,'Cusco','Cuzco'),
(9,'Huancavelica','Huancavelica'),
(10,'Huánuco','Huánuco'),
(11,'Ica','Chincha'),
(12,'Junin','Chupaca'),
(13,'La Libertad','Trujillo'),
(14,'Lambayeque','Chiclayo'),
(15,'Lima','Lima'),
(16,'loreto','Ucayali'),
(17,'Madre de Dios','Manu'),
(18,'Moquegua','Llo'),
(19,'Pasco','Pasco'),
(20,'Piura','Piura'),
(21,'Puno','Puno'),
(22,'San Martin','Tocache'),
(23,'Tacna','Tacna'),
(24,'Tumbres','Tumbes'),
(25,'Ucayali','Atalaya');

/*Table structure for table `det_eventos` */

DROP TABLE IF EXISTS `det_eventos`;

CREATE TABLE `det_eventos` (
  `iddetevento` int(11) NOT NULL AUTO_INCREMENT,
  `idevento` int(11) NOT NULL,
  `idparticipante` int(11) NOT NULL,
  PRIMARY KEY (`iddetevento`),
  KEY `fk_ideve_eve` (`idevento`),
  KEY `fk_idpar_eve` (`idparticipante`),
  CONSTRAINT `fk_ideve_eve` FOREIGN KEY (`idevento`) REFERENCES `eventos` (`idevento`),
  CONSTRAINT `fk_idpar_eve` FOREIGN KEY (`idparticipante`) REFERENCES `participantes` (`idparticipante`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `det_eventos` */

insert  into `det_eventos`(`iddetevento`,`idevento`,`idparticipante`) values 
(1,1,1),
(2,2,1),
(3,3,2),
(4,4,5),
(5,5,4),
(6,1,1),
(7,2,1),
(8,3,2),
(9,4,5),
(10,5,4);

/*Table structure for table `disciplinas` */

DROP TABLE IF EXISTS `disciplinas`;

CREATE TABLE `disciplinas` (
  `iddisciplina` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` char(1) NOT NULL,
  `nombreDisciplina` varchar(50) NOT NULL,
  PRIMARY KEY (`iddisciplina`),
  UNIQUE KEY `uk_disciplinas` (`tipo`,`nombreDisciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `disciplinas` */

insert  into `disciplinas`(`iddisciplina`,`tipo`,`nombreDisciplina`) values 
(1,'I','Curling'),
(2,'I','Patinaje artístico sobre hielo'),
(3,'I','Skeleton'),
(4,'V','Atletismo'),
(5,'V','Baloncesto'),
(6,'V','Béisbol'),
(7,'V','BMX'),
(9,'V','Lucha'),
(8,'V','Natacion');

/*Table structure for table `eventos` */

DROP TABLE IF EXISTS `eventos`;

CREATE TABLE `eventos` (
  `idevento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEvento` varchar(50) NOT NULL,
  `idsede` int(11) NOT NULL,
  `fecharealizada` char(4) NOT NULL,
  PRIMARY KEY (`idevento`),
  UNIQUE KEY `uk_eventos` (`nombreEvento`),
  KEY `fk_id_eve` (`idsede`),
  CONSTRAINT `fk_id_eve` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`idsede`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `eventos` */

insert  into `eventos`(`idevento`,`nombreEvento`,`idsede`,`fecharealizada`) values 
(1,'Copa peru',2,'2021'),
(2,'Olimpiadas juveniles',1,'2020'),
(3,'Juegos olimpicos',4,'2019'),
(4,'Amigos del barrio',7,'2018'),
(5,'Juegos provinciales',5,'2017');

/*Table structure for table `participantes` */

DROP TABLE IF EXISTS `participantes`;

CREATE TABLE `participantes` (
  `idparticipante` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `iddelegacion` int(11) NOT NULL,
  `iddisciplina` int(11) NOT NULL,
  PRIMARY KEY (`idparticipante`),
  KEY `fk_idper_par` (`idpersona`),
  KEY `fk_iddel_par` (`iddelegacion`),
  KEY `fk_iddis_usu` (`iddisciplina`),
  CONSTRAINT `fk_iddel_par` FOREIGN KEY (`iddelegacion`) REFERENCES `delegaciones` (`iddelegacion`),
  CONSTRAINT `fk_iddis_usu` FOREIGN KEY (`iddisciplina`) REFERENCES `disciplinas` (`iddisciplina`),
  CONSTRAINT `fk_idper_par` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `participantes` */

insert  into `participantes`(`idparticipante`,`idpersona`,`iddelegacion`,`iddisciplina`) values 
(1,7,15,1),
(2,3,11,3),
(3,5,2,5),
(4,9,4,2),
(5,1,8,6);

/*Table structure for table `personas` */

DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(50) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `documentoIdentidad` char(1) NOT NULL,
  `nroDoId` varchar(12) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` char(9) DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idpersona`),
  UNIQUE KEY `uk_docId_per` (`documentoIdentidad`,`nroDoId`,`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Data for the table `personas` */

insert  into `personas`(`idpersona`,`apellidos`,`nombres`,`documentoIdentidad`,`nroDoId`,`correo`,`telefono`,`estado`) values 
(1,'Luque','Johan','N','71789712','luquejohan194@gmail.com',NULL,'1'),
(2,'Quispe','Piero','N','11111112','quispe36@gmail.com',NULL,'1'),
(3,'Polo','Andy','N','11111113','polo24@gmail.com','963258746','1'),
(4,'Urruti','Luis','E','111111144444','urruti11@gmail.com',NULL,'1'),
(5,'Carvallo','Aurelio','N','11111115','carvallo1@gmail.com',NULL,'1'),
(6,'Corzo','Aldo','N','11111116','corzo29@gmail.com',NULL,'1'),
(7,'Riveros','Wilian','E','111111177777','riveros3@gmail.com',NULL,'1'),
(8,'Di benedetto','Mathias','E','111111188888','mathias4@gmail.com',NULL,'1'),
(9,'Cabanillas','Nelson','N','11111119','cabanillas27@gmail.com',NULL,'1'),
(10,'Calcaterra','Horacio','E','111111202020','calcaterra10@gmail.com','903164785','1'),
(11,'Perez','Matin','N','11111121','martin16@gmail.com',NULL,'1'),
(12,'Ureña','Rodrigo','E','111111222222','rodrigo18@gmail.com',NULL,'1'),
(13,'Valera','Alex','N','11111123','valera20@gmail.com',NULL,'1'),
(14,'Herrera','Emanuel','E','111111242424','herrera15@gmail.com',NULL,'1');

/*Table structure for table `sedes` */

DROP TABLE IF EXISTS `sedes`;

CREATE TABLE `sedes` (
  `idsede` int(11) NOT NULL AUTO_INCREMENT,
  `nombreSede` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `tipo` char(1) NOT NULL,
  PRIMARY KEY (`idsede`),
  UNIQUE KEY `uk_nombreSede_sed` (`nombreSede`,`direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sedes` */

insert  into `sedes`(`idsede`,`nombreSede`,`direccion`,`tipo`) values 
(1,'Mauro Mina','Av. Bombon Coronado','U'),
(2,'Bombon Coronado','HVHF+2VP, Chincha Alta 11701','P'),
(3,'Balconcito','HVQ3+9WR, Sunampe 11703','U'),
(4,'Polideportivo Chincha','Av. Santos Nagaro 299','P'),
(5,'Complejo Deportivo de Los pinos','Guillermo Dansey 2270, Lima 15081','P'),
(6,'Complejo Deportivo Héctor Chumpitaz','Av. Morales Duárez 1540, Lima 07006','U'),
(7,'Estadio Monumental U Marathon','Av. Javier Prado Este 7700, Ate 15026','U');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `uk_usuarios` (`idpersona`,`usuario`),
  CONSTRAINT `fk_id_usu` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`idpersona`,`usuario`,`clave`,`estado`) values 
(1,7,'RiveroWily','12345','1'),
(2,9,'CabaNel','12345','1'),
(3,1,'LuJo','$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK','1'),
(4,3,'PoAn','12345','1'),
(5,5,'Carau','12345','1');

/* Procedure structure for procedure `spu_login_corre` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_login_corre` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_login_corre`(
	in _correo varchar(50)
)
begin 
	select idusuario,personas.`apellidos` 'apellidos', personas.`nombres` 'nombres', personas.`correo` 'correo', usuario, clave
	from usuarios
	inner join personas on personas.`idpersona` = usuarios.`idpersona`
	where personas.`correo` = _correo; 
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
