DROP DATABASE olimpiadas;
CREATE DATABASE olimpiadas;
USE olimpiadas;


CREATE TABLE delegaciones
(
	iddelegacion	INT PRIMARY KEY AUTO_INCREMENT,
	nombreDelegacion	VARCHAR(50) NOT NULL,
	CONSTRAINT 	uk_delegaciones UNIQUE (nombreDelegacion)
) ENGINE = INNODB; 

CREATE TABLE disciplinas
(
	iddisciplina		INT PRIMARY KEY AUTO_INCREMENT,
	nombreDisciplina	VARCHAR(50) NOT NULL,
	CONSTRAINT uk_disciplinas UNIQUE (nombreDisciplina)
) ENGINE = INNODB;

CREATE TABLE personas
(
	idpersona 				INT PRIMARY KEY AUTO_INCREMENT,
	apellidos				VARCHAR(50) NOT NULL,
	nombres					VARCHAR(50) NOT NULL,
	dni						CHAR(8) NOT NULL,
	correo 					VARCHAR(50) NOT NULL,
	clave						VARCHAR(100) NOT NULL,
	estado					CHAR(1) NOT NULL DEFAULT '1',
	CONSTRAINT uk_ddni_per UNIQUE (dni,apellidos, nombres,correo)
) ENGINE = INNODB;


CREATE TABLE olimpiadas
(
	idolimpiada 		INT PRIMARY KEY AUTO_INCREMENT,
	nombre				VARCHAR(50) NOT NULL,
	fechainicio			DATE NOT NULL,
	fechafin				DATE NULL,
	lugar					VARCHAR(50) NOT NULL,
	CONSTRAINT uk_year_oli UNIQUE(fechainicio)
) ENGINE = INNODB;

CREATE TABLE det_disciplinas
(
	iddet 					INT PRIMARY KEY AUTO_INCREMENT,
	idolimpiada				INT NOT NULL,
	iddisciplina			INT NOT NULL,
	CONSTRAINT fk_idolim_det FOREIGN KEY (idolimpiada) REFERENCES olimpiadas (idolimpiada),
	CONSTRAINT fk_iddis_det FOREIGN KEY (iddisciplina) REFERENCES disciplinas (iddisciplina)
) ENGINE = INNODB;

CREATE TABLE equipos
(
	idequipo 			INT PRIMARY KEY AUTO_INCREMENT,
	iddelegacion 		INT NOT NULL,
	idparticipante 	INT NOT NULL,
	CONSTRAINT fk_idpar_equ FOREIGN KEY (idparticipante) REFERENCES personas (idpersona),
	CONSTRAINT fk_iddel_equ FOREIGN KEY (iddelegacion) REFERENCES delegaciones (iddelegacion)
) ENGINE = INNODB;

CREATE TABLE integrantes
(
	idintegrante			INT PRIMARY KEY AUTO_INCREMENT,
	idequipo					INT NOT NULL,
	iddet 					INT NOT NULL,
	CONSTRAINT fk_idequ_int FOREIGN KEY (idequipo) REFERENCES equipos (idequipo),
	CONSTRAINT fk_iddet_int FOREIGN KEY (iddet) REFERENCES det_disciplinas (iddet)
) ENGINE = INNODB;

CREATE TABLE medalleros
(
	idmedallero			INT PRIMARY KEY AUTO_INCREMENT,
	idintegrante			INT NOT NULL,
	puesto 				TINYINT NULL,
	estado				CHAR(1) NOT NULL DEFAULT '0',
	CONSTRAINT fk_id_med FOREIGN KEY (idintegrante) REFERENCES integrantes (idintegrante)
) ENGINE = INNODB;