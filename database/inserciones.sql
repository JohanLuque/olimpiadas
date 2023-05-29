USE olimpiadas; 

INSERT INTO delegaciones (departamento, provincia) VALUES 
	 ('Amazonas', 'Chachapoyas'),
	 ('Ancash', 'Huaraz'),
	 ('Apurimac', 'Abancay'),
	 ('Arequipa', 'Arequipa'),
	 ('ayacucho', 'Sucre'),
	 ('Cajamarca', 'Cajamarca'),
	 ('Callao', 'Callao'),
	 ('Cusco', 'Cuzco'),
	 ('Huancavelica', 'Huancavelica'),
	 ('Huánuco', 'Huánuco'),
	 ('Ica', 'Chincha'),
	 ('Junin', 'Chupaca'),
	 ('La Libertad', 'Trujillo'),
	 ('Lambayeque', 'Chiclayo'),
	 ('Lima', 'Lima'),
	 ('loreto', 'Ucayali'),
	 (' Madre de Dios', 'Manu'),
	 ('Moquegua', 'Llo'),
	 ('Pasco', 'Pasco'),
	 ('Piura', 'Piura'),
	 ('Puno', 'Puno'),
	 ('San Martin', 'Tocache'),
	 ('Tacna', 'Tacna'),
	 ('Tumbres', 'Tumbres'),
	 ('Ucayali', 'Atalaya');
INSERT INTO disciplinas (tipo, nombreDisciplina) VALUES	
('I', 'Curling'),
('I', 'Patinaje artístico sobre hielo'),
('I', 'Skeleton'),
('V', 'Atletismo'),
('V', 'Baloncesto'),
('V', 'Béisbol'),
('V', 'BMX'),
('V', 'Lucha'),
('V', 'Natacion');

INSERT INTO sedes (nombreSede, direccion, tipo) VALUES
('Mauro Mina', 'Av. Bombon Coronado', 'U'),       
('Bombon Coronado', 'Chincha Alta 11701', 'P'),       
('Balconcito', 'Sunampe 11703', 'U'),
('Polideportivo de Chincha', 'Av. Santos Nagaro 299', 'P'),
('Los pinos', 'Guillermo Dansey 2270, Lima 15081', 'P'),
('Héctor Chumpitaz', 'Av. Morales Duárez 1540, Lima 07006', 'P'),
('Estadio Monumental U Marathon', 'Av. Javier Prado Este 7700, Ate 15026', 'U');

INSERT INTO personas (apellidos, nombres, documentoIdentidad, nroDoId, correo, telefono) VALUES
('Luque', 'Johan', 'N', '71789712', 'luquejohan194@gmail.com', NULL),
('Quispe', 'Piero', 'N', '11111112', 'quispe36@gmail.com', NULL),
('Polo', 'Andy', 'N', '11111113', 'polo24@gmail.com', NULL),
('Urruti', 'Luis', 'E', '111111144444', 'urruti11@gmail.com', NULL),
('Carvallo', 'Aurelio', 'N', '11111115', 'carvallo1@gmail.com', NULL),
('Corzo', 'Aldo', 'N', '11111116', 'corzo29@gmail.com', NULL),
('Riveros', 'Wilian', 'E', '111111177777', 'riveros3@gmail.com', NULL),
('Di benedetto', 'Mathias', 'E', '111111188888', 'mathias4@gmail.com', NULL),
('Cabanillas', 'Nelson', 'N', '11111119', 'cabanillas27@gmail.com', '903164785'),
('Calcaterra', 'Horacio', 'E', '111111202020', 'calcaterra10@gmail.com', NULL),
('Perez', 'Matin', 'N', '11111121', 'martin16@gmail.com', NULL),
('Ureña', 'Rodrigo', 'E', '111111222222', 'rodrigo18@gmail.com', NULL),
('Valera', 'Alex', 'N', '11111123', 'valera20@gmail.com', NULL),
('Herrera', 'Emanuel', 'E', '111111242424', 'herrera15@gmail.com', NULL);

INSERT INTO usuarios (idpersona, usuario, clave) VALUES
(7, 'RiveroWily', '$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK'),
(9, 'CabaNel', '$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK'),
(1, 'LuJo', '$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK'),
(3, 'PoAn', '$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK'),
(5, 'Carau', '$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK');

INSERT INTO participantes (idpersona, iddelegacion) VALUES
(1, 2),
(2, 11),
(3, 1),
(4, 4),
(5, 15),
(6, 9),
(7, 10),
(8, 25),
(9, 14),
(10, 20),
(11, 6),
(12, 7),
(13, 18),
(14, 13);

-- select * from participantes

INSERT INTO eventos (nombreEvento, idsede, fecharealizada, iddisciplina, oro, plata, bronce) VALUES
('Copa peru', 2, '2021',1, 1, 3, 5),
('Olimpiadas juveniles', 1, '2020',4, 6, 2, 5),
('Juegos olimpicos', 4, '2019',6, 9, 14, 11),
('Amigos del barrio', 7, '2018',8, 8, 13, 10),
('Juegos provinciales', 5, '2017',3, 3, 11, 9);

INSERT INTO det_eventos (idevento, idparticipante) VALUES
(1,1),
(1,2),
(1,4),
(2,2),
(2,3),
(2,4),
(3,1),
(3,4),
(3,5),
(4,5),
(4,3),
(4,1),
(5,5),
(5,2),
(5,4),
(5,1),
(5,3);


