CREATE DATABASE olimpiadas
USE olimpiadas

CREATE TABLE sedes
(
	idsede		INT PRIMARY KEY AUTO_INCREMENT,
	nombreSede 	VARCHAR (50) NOT NULL,
	direccion	VARCHAR(50) NOT NULL,
	tipo			CHAR(1) NOT NULL, -- polideportivo, unideportivo
	CONSTRAINT uk_nombreSede_sed UNIQUE(nombreSede, direccion)
) ENGINE = INNODB; 

CREATE TABLE delegaciones
(
	iddelegacion	INT PRIMARY KEY AUTO_INCREMENT,
	departamento	VARCHAR(50) NOT NULL,
	provincia		VARCHAR(50) NOT NULL,
	CONSTRAINT 	uk_delegaciones UNIQUE (departamento,provincia)
) ENGINE = INNODB; 

CREATE TABLE disciplinas
(
	iddisciplina		INT PRIMARY KEY AUTO_INCREMENT,
	tipo					CHAR(1) NOT NULL, -- invierno o verano
	nombreDisciplina	VARCHAR(50) NOT NULL,
	CONSTRAINT uk_disciplinas UNIQUE (tipo, nombreDisciplina)
) ENGINE = INNODB;

CREATE TABLE personas
(
	idpersona 				INT PRIMARY KEY AUTO_INCREMENT,
	apellidos				VARCHAR(50) NOT NULL,
	nombres					VARCHAR(50) NOT NULL,
	documentoIdentidad 	CHAR(1) NOT NULL, -- Dnio Extranjero
	nroDoId					VARCHAR(12) NOT NULL,
	correo 					VARCHAR(50) NOT NULL,
	telefono 				CHAR(9) NULL,
	estado					CHAR(1) NOT NULL DEFAULT '1',
	CONSTRAINT uk_docId_per UNIQUE (documentoIdentidad, nroDoId, correo)
) ENGINE = INNODB

CREATE TABLE usuarios
(
	idusuario	INT PRIMARY KEY AUTO_INCREMENT,
	idpersona	INT NOT NULL,
	usuario		VARCHAR(50) NOT NULL,
	clave			VARCHAR(100) NOT NULL,
	estado		CHAR(1) NOT NULL DEFAULT '1',
	CONSTRAINT fk_id_usu FOREIGN KEY (idpersona) REFERENCES personas (idpersona),
	CONSTRAINT uk_usuarios UNIQUE(idpersona,usuario)
)ENGINE	 = INNODB;

CREATE TABLE participantes
(
	idparticipante		INT PRIMARY KEY AUTO_INCREMENT,
	idpersona			INT NOT NULL,
	iddelegacion		INT NOT NULL,
	iddisciplina		INT NOT NULL,
	CONSTRAINT fk_idper_par FOREIGN KEY (idpersona) REFERENCES personas (idpersona),
	CONSTRAINT fk_iddel_par FOREIGN KEY (iddelegacion) REFERENCES delegaciones (iddelegacion),
	CONSTRAINT fk_iddis_usu FOREIGN KEY (iddisciplina) REFERENCES disciplinas (iddisciplina)
) ENGINE = INNODB;

CREATE TABLE eventos
(
	idevento 		INT PRIMARY KEY AUTO_INCREMENT,
	nombreEvento	VARCHAR(50) NOT NULL,
	idsede			INT NOT NULL,
	fecharealizada	DATETIME NOT NULL DEFAULT NOW(),
	CONSTRAINT fk_id_eve FOREIGN KEY (idsede) REFERENCES sedes (idsede),
	CONSTRAINT uk_eventos UNIQUE(nombreEvento)
)ENGINE = INNODB;

CREATE TABLE det_eventos
(
	iddetevento			INT PRIMARY KEY AUTO_INCREMENT,
	idevento				INT NOT NULL,
	idparticipante 	INT NOT NULL,
	CONSTRAINT fk_ideve_eve FOREIGN KEY (idevento) REFERENCES eventos (idevento),
	CONSTRAINT fk_idpar_eve FOREIGN KEY (idparticipante) REFERENCES participantes (idparticipante)
) ENGINE = INNODB;