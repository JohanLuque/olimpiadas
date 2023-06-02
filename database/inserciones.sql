USE olimpiadas; 

INSERT INTO delegaciones (nombreDelegacion) VALUES 
	 ('Chachapoyas'),
	 ('Huaraz'),
	 ('Abancay'),
	 ('Arequipa'),
	 ('Sucre'),
	 ('Cajamarca'),
	 ('Callao'),
	 ('Cuzco'),
	 ('Huancavelica'),
	 ('Huánuco'),
	 ('Chincha'),
	 ('Chupaca'),
	 ('Trujillo'),
	 ('Chiclayo'),
	 ('Lima'),
	 ('Ucayali'),
	 ('Manu'),
	 ('Llo'),
	 ('Pasco'),
	 ('Piura'),
	 ('Puno'),
	 ('Tocache'),
	 ('Tacna'),
	 ('Tumbes'),
	 ('Atalaya');
INSERT INTO disciplinas (nombreDisciplina) VALUES	
('Fútbol'),
('Volley'),
('Balon Mano'),
('Atletismo Relevo'),
('Baloncesto'),
('Béisbol'),
('Fútbol americano '),
('Hockey'),
('Water Polo');


INSERT INTO personas (apellidos, nombres, dni, correo, clave) VALUES
('Luque', 'Johan','71789712', 'luquejohan194@gmail.com', '12345'),
('Quispe', 'Piero','11111112', 'quispe36@gmail.com', '12345'),
('Polo', 'Andy','11111113', 'polo24@gmail.com', '12345'),
('Urruti', 'Luis','11111114', 'urruti11@gmail.com', '12345'),
('Carvallo', 'Aurelio', '11111115', 'carvallo1@gmail.com', '12345'),
('Corzo', 'Aldo','11111116', 'corzo29@gmail.com', '12345'),
('Riveros', 'Wilian','11111117', 'riveros3@gmail.com', '12345'),
('Di benedetto', 'Mathias','11111118', 'mathias4@gmail.com', '12345'),
('Cabanillas', 'Nelson','11111119', 'cabanillas27@gmail.com', '12345'),
('Calcaterra', 'Horacio','11111120', 'calcaterra10@gmail.com', '12345'),
('Perez', 'Matin','11111121', 'martin16@gmail.com', '12345'),
('Ureña', 'Rodrigo','11111122', 'rodrigo18@gmail.com', '12345'),
('Valera', 'Alex','11111123', 'valera20@gmail.com', '12345'),
('Herrera', 'Emanuel', '21111148', 'herrera15@gmail.com', '12345');

UPDATE personas SET clave= '$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK';


INSERT INTO olimpiadas (fechainicio, fechafin,nombre, lugar) VALUES
('2023-05-29', '2023-06-7','Copa Perú', 'Lima'),
('2022-05-29',  '2022-05-29','Olimpiadas juveniles', 'Pisco'),
('2021-01-11', '2021-01-28', 'Juegos olimpicos', 'Ica'),
('2020-02-26', '2020-002-27','Amigos del barrio', 'Chincha'),
('2019-12-29', '2023-12-31', 'Juegos provinciales', 'Loreto');

INSERT INTO det_disciplinas (idolimpiada, iddisciplina) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 9),
(3, 5),
(4, 1),
(4, 8),
(4, 7),
(5, 4),
(5, 3),
(5, 2);

/*select iddet,olimpiadas.`nombre`, disciplinas.`nombreDisciplina` 
from det_disciplinas
inner join disciplinas on disciplinas.`iddisciplina` = det_disciplinas.`iddisciplina`
inner join olimpiadas on olimpiadas.`idolimpiada` = det_disciplinas.`idolimpiada`
order by iddet*/

INSERT INTO equipos (iddelegacion, idparticipante) VALUES
(11,1),-- futbol
(11,2),
(10,4),
(3,7),
(3,8), -- futbol
(4,11), -- volley 6
(4,12),
(7,5),
(7,6),
(8,7),
(8,8),
(9,9),-- volley 12
(1,10),-- balon mano
(1,11),
(5,12), -- balon mano 15
(2,1), -- Atletismo relevado
(2,3), 
(6,4),
(6,5), -- Atletismo relevado 19
(24,9), -- Baloncesto
(24,10),
(23,3),
(23,7),
(23,8); -- Baloncesto 24

INSERT INTO integrantes (idequipo, iddet) VALUES
(1,1),-- futboll
(2,1),
(3,1),
(4,1),
(5,1),-- futboll 5
(6,1),-- volley
(7,2),
(8,2),
(9,2),
(10,2),
(11,2),
(12,2),-- volley 12
(13,3),-- valon mano
(14,3),
(15,3),-- valon mano 15
(16,4),-- atletismo
(17,4),
(18,4),
(19,4),-- atletismo 19
(20,5),-- Baloncesto 
(21,5),
(22,5),
(23,5),
(24,5);-- Baloncesto 24


/*select personas.`apellidos`, personas.`nombres`, delegaciones.`nombreDelegacion` from equipos
inner join personas on personas.`idpersona` = equipos.`idparticipante`
inner join delegaciones on delegaciones.`iddelegacion` = equipos.`iddelegacion`*/


INSERT INTO medalleros (idintegrante, puesto, estado)VALUES
(1,1,'1'), -- futbol
(3,2,'1'),-- futbol
(5,3,'1'),-- futbol
(7,1,'1'),-- volley
(9,2,'1'),-- volley
(11,3,'1'),-- volley
(12,4,'1'),-- volley
(13,1,'1'),-- balon
(15,2,'1');-- balon

INSERT INTO medalleros (idintegrante) VALUES
(16),
(18),
(20),
(22);