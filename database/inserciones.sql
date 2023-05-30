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
	 ('Tumbres'),
	 ('Atalaya');
INSERT INTO disciplinas (nombreDisciplina) VALUES	
('Futbol'),
('Volley'),
('Skeleton'),
('Atletismo'),
('Baloncesto'),
('Béisbol'),
('BMX'),
('Lucha'),
('Natacion');


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
(3, 4),
(3, 3),
(3, 2),
(4, 1),
(4, 8),
(4, 7),
(4, 9),
(4, 5),
(5, 4),
(5, 3),
(5, 2),
(5, 1),
(5, 6),
(5, 5),
(5, 7),
(5, 8);

INSERT INTO integrantes (iddelegacion, idparticipante, iddet) VALUES
(11,1,1),
(10,2,1),
(9,3,1),
(8,4,1),
(7,5,2),
(7,6,2),
(7,7,2),
(7,8,2),
(7,9,2);



INSERT INTO medalleros (idintegrante, puesto)VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,1),
(7,2),
(8,3),
(9,4);

