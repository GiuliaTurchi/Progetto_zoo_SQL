CREATE DATABASE elenco_zoo_italia;  -- creo un nuovo DB chiamato 'elenco_zoo_italia'
USE elenco_zoo_italia;              -- prima di creare tabelle, seleziono DB su cui lavorare
-- creo tabella 'citta'
CREATE TABLE citta (     
  ID_citta INT AUTO_INCREMENT NOT NULL,
  Nome VARCHAR(30) NOT NULL,
  Cap VARCHAR(5) NOT NULL DEFAULT '00000',
  CONSTRAINT PK_Citta PRIMARY KEY (ID_citta)
  );
-- inserisco valori dentro la tabella 'citta'  
INSERT INTO citta (Nome, Cap) VALUES 
('Fasano','72015'),('Cumiana','10040'),('Bussolengo','37012'),('Riccione','47838'),('Valbrembo','24030'),
('Lignano Sabbiadoro','33054'),('Ravenna','48125'),('Pistoia','51100'),('Roma','00197'),('Pombia','28050'),
('Jesolo','30016'),('Pesco Sannita','82020'),('Napoli','80125'),('Cecina','57023'),('Falconara Marittima','60015'),
('Genova','16128'),('Napoli','80121');
-- creo tabella 'zoo'
CREATE TABLE zoo (     
  ID_zoo INT AUTO_INCREMENT NOT NULL ,
  Nome VARCHAR(40) NOT NULL,
  Indirizzo VARCHAR(40) NOT NULL,
  Telefono VARCHAR(15),
  ID_citta INT NOT NULL,
  CONSTRAINT PK_zoo PRIMARY KEY (ID_zoo),
  CONSTRAINT FK_zoo_citta FOREIGN KEY (ID_citta) REFERENCES citta (ID_citta)
  );
-- inserisco valori dentro la tabella 'zoo'   
INSERT INTO zoo (Nome, Indirizzo, Telefono, ID_citta) VALUES 
('Zoosafari','Via Dello Zoosafari ','0804414455',1),('Zoom Torino','Strada Piscina 36','0119070318',2),
('Parco Natura Viva','Localita Quercia','0456770033',3),('Oltremare','Via Ascoli Piceno 6','05414271',4),
('Parco Faunistico Le Cornelle','Via Cornelle 16','035527640',5),
('Parco Zoo Punta Verde','Via Giorgio Scerbanenco 19/1','0431428775',6),
('Safari Ravenna','Via dei Tre Lati 2/X','0544690020',7),
('Giardino Zoologico di Pistoia','Via Pieve a Celle Nuova 160/A','0573911219',8),
('Bioparco di Roma','Viale del Giardino Zoologico 20','063608211',9),('Safari Park','Via Larino 3','0321956431',10),
('Tropicarium Park','Via Aquileia 123',NULL,11),('Zoo delle Maitine','Via Fontana dell Occhio 1','0824981084',12),
('Lo Zoo di Napoli','Via John Fitzgerald Kennedy 76','08119363154',13),
('Parco Gallorose','Via Aurelia Sud 65','3488883778',14),
('Parco Zoo Falcolanara','Via Castello di Barcaglione 10','071911312',15),
('Acquario di Genova','Ponte Spinola','01023451',16),
('Acquario di Napoli','Via Comunale','0815833442',17);
-- creo tabella 'recinto'
CREATE TABLE recinto (     
  ID_recinto INT AUTO_INCREMENT NOT NULL,
  Habitat VARCHAR(10) NOT NULL,
  ID_zoo INT NOT NULL,
  CONSTRAINT PK_recinto PRIMARY KEY (ID_recinto),
  CONSTRAINT FK_recinto_zoo FOREIGN KEY (ID_zoo) REFERENCES zoo (ID_zoo)
  );
-- inserisco valori dentro la tabella 'recinto' 
INSERT INTO recinto (Habitat, ID_zoo) VALUES 
('Savana',1),('Giungla',1),('Savana',2),('Polare',2),('Mare',2),('Savana',3),('Giungla',3),('Mare',4),('Ghiaccio',4),
('Savana',5),('Giungla',5),('Savana',6),('Savana',6),('Savana',7),('Savana',7),('Giungla',8),('Mare',8),('Giungla',9),
('Savana',9),('Savana',9),('Ghiaccio',9),('Savana',10),('Giungla',10),('Giungla',11),('Giungla',11),('Giungla',12),
('Ghiaccio',12),('Giungla',13),('Savana',13),('Giungla',13),('Savana',14),('Ghiaccio',14),('Ghiaccio',15),('Ghiaccio',15),
('Mare',16),('Mare',16),('Ghiaccio',16),('Mare',17),('Mare',17);
-- creo tabella 'animale'
CREATE TABLE animale (
  Chip INT AUTO_INCREMENT NOT NULL ,
  Tipo_specie VARCHAR(15) NOT NULL,
  Nome VARCHAR(15) NOT NULL,
  Peso INT NOT NULL,
  Eta INT NOT NULL,
  ID_recinto INT NOT NULL,
  CONSTRAINT PK_animale PRIMARY KEY (Chip),
  CONSTRAINT FK_animale_recinto FOREIGN KEY (ID_recinto) REFERENCES recinto (ID_recinto) 
  );
-- inserisco valori dentro la tabella 'animale' 
INSERT INTO animale (Tipo_specie, Nome, Peso, Eta, ID_recinto) VALUES 
('Giraffa','Pimpa',200,5,1),('Giraffa','Luisa',210,9,1),('Giraffa','Gioconda',215,11,1),('Tigre','Mario',150,9,2),
('Tigre','Maria',152,10,2),('Leone','Pippo',147,11,3),('Leone','Pluto',145,8,3),('Leone','Topolino',143,7,3),
('Leone','Ugo',98,3,3),('Orso Polare','Calogero',450,12,4),('Squalo','Teresa',320,8,5),('Squalo','Cosimo',322,10,5),
('Elefante','Riccardo',350,3,6),('Elefante','Enrico',710,7,6),('Elefante','Erminio',710,7,6),('Bradipo','Flash',15,11,7),
('Bradipo','Sonic',18,15,7),('Delfino','Ettore',130,9,8),('Pinguino','Filiberto',10,4,9),('Pinguino','Umberto',9,6,9),
('Pinguino','Lamberto',12,7,9),('Pinguino','Roberto',11,11,9),('Pinguino','Luigi',8,5,9),('Giraffa','Superman',230,15,10),
('Giraffa','Wonderwoman',212,14,10),('Giraffa','Catwoman',210,7,10),('Giraffa','Acquaman',235,16,10),
('Elefante','Spiderman',750,9,10),('Elefante','Batman',746,5,10),('Bradipo','Frodo',13,8,11),('Bradipo','Pipino',14,11,11),
('Bradipo','Sam',14,13,11),('Leone','Augusta',166,7,12),('Leone','Peppe',156,9,12),('Elefante','Goku',766,15,13),
('Elefante','Ignazio',699,9,14),('Elefante','Marilu',689,6,14),('Giraffa','Antonietta',453,7,14),('Giraffa','Marzia',452,9,14),
('Leone','Karim',163,8,15),('Leone','Maya',154,11,15),('Boa','Secco',23,9,16),('Priranha','Eminem',4,9,17),
('Priranha','Tupac',5,7,17),('Priranha','Ice-Cube',2,1,17),('Priranha','Akon',4,3,17),('Priranha','Fedez',4,9,17),
('Tigre','Massimo',215,7,18),('Leone','Emilio',198,11,19),('Leone','Elisa',165,12,19),('Giraffa','Alessandra',462,9,20),
('Elefante','Ciro',723,7,20),('Orso Polare','Achille',596,9,21),('Leone','Vaniglia',215,11,22),('Leone','Cannella',210,10,22),
('Tigre','Kashmir',230,5,23),('Boa','Riccardo',21,8,24),('Bradipo','Mario',13,15,25),('Bradipo','Albano',12,6,26),
('Bradipo','Romina',15,6,26),('Pinguino','Luca',10,6,27),('Bradipo','Cristino',12,5,28),('Leone','Zucchero',215,3,29),
('Boa','Sguiscido',13,2,30),('Elefante','Melchiorre',746,16,31),('Foca','Monaca',215,7,32),('Foca','Matilde',206,6,33),
('Foca','Ester',210,6,33),('Orso Polare','Orso',596,14,34),('Delfino','Azzurrina',230,11,35),('Delfino','Nerina',216,8,35),
('Squalo','Sdentato',350,15,36),('Pinguino','Aldo',12,7,37),('Pinguino','Giovanni',13,7,37),('Pinguino','Giacomo',10,7,37),
('Squalo','Joker',215,12,38),('Piranha','Ave',6,2,39),('Piranha','Maria',7,4,39);
-- creo tabella 'specie'
CREATE TABLE specie (
  ID_zoo INT NOT NULL,
  Tipo_specie VARCHAR(15) NOT NULL,
  Quantita INT NOT NULL,
  ID_recinto INT NOT NULL,
  CONSTRAINT PK_specie PRIMARY KEY (ID_zoo,Tipo_specie),
  CONSTRAINT FK_specie_recinto FOREIGN KEY (ID_recinto) REFERENCES recinto (ID_recinto) 
  );
-- inserisco valori dentro la tabella 'specie'
INSERT INTO specie VALUES 
(1,'Giraffa',3,1),(1,'Tigre',2,2),(2,'Leone',4,3),(2,'Orso Polare',1,4),(2,'Squalo',2,5),(3,'Elefante',3,6),(3,'Bradipo',2,7),
(4,'Delfino',1,8),(4,'Pinguino',5,9),(5,'Giraffa',4,10),(5,'Elefante',2,10),(5,'Bradipo',3,11),(6,'Leone',2,12),
(6,'Elefante',1,13),(7,'Elefante',2,14),(7,'Giraffa',2,14),(7,'Leone',2,15),(8,'Boa',1,16),(8,'Priranha',5,17),(9,'Tigre',1,18),
(9,'Leone',2,19),(9,'Giraffa',1,20),(9,'Elefante',1,20),(9,'Orso Polare',1,21), (10,'Leone',2,22),(10,'Tigre',1,23),(11,'Boa',1,24),
(11,'Bradipo',1,25),(12,'Bradipo',2,26),(12,'Pinguino',1,27),(13,'Bradipo',1,28),(13,'Leone',1,29),(13,'Boa',1,30),
(14,'Elefante',1,31),(14,'Foca',1,32),(15,'Foca',2,33),(15,'Orso Polare',1,34),(16,'Delfino',2,35), (16,'Squalo',1,36),
(16,'Pinguino',3,37),(17,'Squalo',1,38), (17,'Piranha',2,39);
-- DB completato