CREATE TABLE sport (
    id_sport INT PRIMARY KEY,
    nom_sport VARCHAR(100),
    type_sport VARCHAR(50),
    nombre_joueurs INT
);

CREATE TABLE stade (
    id_stade INT PRIMARY KEY,
    nom_stade VARCHAR(100),
    ville VARCHAR(100),
    capacite INT,
    certification_ecologique BOOLEAN
);

CREATE TABLE tournoi (
    id_tournoi INT PRIMARY KEY,
    nom_tournoi VARCHAR(100),
    annee INT,
    pays_hote VARCHAR(100)
);

CREATE TABLE equipe (
    id_equipe INT PRIMARY KEY,
    nom_equipe VARCHAR(100),
    pays VARCHAR(100),
    sponsor_principal VARCHAR(100),
    id_sport INT,
    foreign KEY (id_sport) references sport(id_sport)
);

CREATE TABLE match (
    id_match INT PRIMARY KEY,
    date_match DATE,
    phase_tournoi VARCHAR(50),
    id_stade INT,
    id_tournoi INT,
    foreign KEY (id_tournoi) references tournoi(id_tournoi),
    foreign KEY (id_stade) references stade(id_stade)
);

CREATE TABLE joueur (
    id_joueur INT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    date_naissance DATE,
    nationalite VARCHAR(100),
    poste VARCHAR(100),
    id_equipe INT,
    foreign KEY (id_equipe) references equipe(id_equipe)
);

CREATE TABLE participe(
    id_equipe INT,
    id_match INT,                                                                  
    distance_km NUMERIC,                                                            --2
    transport VARCHAR(50),
    empreinte_carbone_par_km NUMERIC,                                               --5
    score INT,
    nb_point INT,
    PRIMARY KEY (id_equipe, id_match),
    foreign KEY (id_match) references match(id_match),
    foreign KEY (id_equipe) references equipe(id_equipe)
);

CREATE TABLE competition_sport(
    id_sport INT,
    id_tournoi INT,
    PRIMARY KEY (id_sport, id_tournoi),
    foreign KEY (id_sport) references sport(id_sport),
    foreign KEY (id_tournoi) references tournoi(id_tournoi)
);

INSERT INTO sport (id_sport, nom_sport, type_sport, nombre_joueurs) VALUES
(1,'Football','collectif',11),
(2,'Basketball','collectif',5);

--stade
INSERT INTO stade VALUES
(1,'Stade de France','Paris',80000,true),
(2,'Camp Nou','Barcelone',99000,false),
(3,'Wembley','Londres',90000,true),
(4,'Madison Square Garden','New York',20000,true);

--tournoi
INSERT INTO tournoi VALUES
(1,'Coupe Internationale',2024,'France'),
(2,'Championnat Basket',2024,'USA');
--competion_sport
INSERT INTO competition_sport(id_sport, id_tournoi) VALUES
(1,1),
(2,2);

--equipe foot
INSERT INTO equipe VALUES
(1,'France','France','Nike',1),
(2,'Espagne','Espagne','Adidas',1),
(3,'Allemagne','Allemagne','Adidas',1),
(4,'Italie','Italie','Puma',1);

--equipe basket
INSERT INTO equipe VALUES
(5,'Lakers','USA','Nike',2),
(6,'Bulls','USA','Nike',2),
(7,'Warriors','USA','Rakuten',2),
(8,'Celtics','USA','Nike',2);

--match
INSERT INTO match VALUES
(1,'2024-06-01','demi',1,1),
(2,'2024-06-02','demi',2,1),
(3,'2024-06-05','finale',3,1),
(4,'2024-07-01','groupe',4,2),
(5,'2024-07-02','groupe',4,2),
(6,'2024-07-05','finale',4,2);

--participe
INSERT INTO participe VALUES
-- FRANCE vs ESPAGNE à Paris
(1,1,15,'bus electrique',1,2,3),
(2,1,1050,'avion',15,1,0),
-- ANGLETERRE vs ALLEMAGNE à Barcelone
(3,2,1150,'avion',15,2,3),
(4,2,1350,'avion',15,1,0),
-- FRANCE vs ANGLETERRE à Londres
(1,3,450,'train',2,1,0),
(3,3,20,'bus',3,2,3),
-- LAKERS vs BULLS à New York
(5,4,4500,'avion',15,100,3),
(6,4,1200,'avion',15,90,0),
-- CELTICS vs WARRIORS à Los Angeles
(7,5,4500,'avion',15,110,3),
(8,5,20,'bus',3,105,0),
-- FINALE à Chicago
(5,6,2800,'avion',15,120,3),
(7,6,1500,'avion',15,115,0);

--joueurs foot France
INSERT INTO joueur VALUES
(1,'Mbappe','Kylian','1998-12-20','FR','Attaquant',1),
(2,'Griezmann','Antoine','1991-03-21','FR','Attaquant',1),
(3,'Giroud','Olivier','1986-09-30','FR','Ailier',1),
(4,'Dembele','Ousmane','1997-05-15','FR','Ailier',1),
(5,'Tchouameni','Aurelien','2000-01-27','FR','Milieu',1),
(6,'Rabiot','Adrien','1995-04-03','FR','Milieu',1),
(7,'Kounde','Jules','1998-11-12','FR','Defense',1),
(8,'Varane','Raphael','1993-04-25','FR','Defense',1),
(9,'Hernandez','Theo','1997-10-06','FR','Defense',1),
(10,'Upamecano','Dayot','1998-10-27','FR','Defense',1),
(11,'Maignan','Mike','1995-07-03','FR','Gardien',1);
--joueur foot Espagne
INSERT INTO joueur VALUES
(12,'Morata','Alvaro','1992-10-23','ES','Attaquant',2),
(13,'Pedri','Pedro','2002-11-25','ES','Milieu',2),
(14,'Gavi','Pablo','2004-08-05','ES','Milieu',2),
(15,'Rodri','Hernandez','1996-06-22','ES','Milieu',2),
(16,'Olmo','Dani','1998-05-07','ES','Ailier',2),
(17,'Laporte','Aymeric','1994-05-27','ES','Defense',2),
(18,'Carvajal','Dani','1992-01-11','ES','Defense',2),
(19,'Alba','Jordi','1989-03-21','ES','Defense',2),
(20,'Torres','Pau','1997-01-16','ES','Defense',2),
(21,'Simon','Unai','1997-06-11','ES','Gardien',2),
(22,'Fati','Ansu','2002-10-31','ES','Attaquant',2);
--joueur foot Allemagne
INSERT INTO joueur VALUES
(23,'Muller','Thomas','1989-09-13','DE','Attaquant',3),
(24,'Kimmich','Joshua','1995-02-08','DE','Milieu',3),
(25,'Goretzka','Leon','1995-02-06','DE','Milieu',3),
(26,'Sane','Leroy','1996-01-11','DE','Ailier',3),
(27,'Gnabry','Serge','1995-07-14','DE','Ailier',3),
(28,'Rudiger','Antonio','1993-03-03','DE','Defense',3),
(29,'Sule','Niklas','1995-09-03','DE','Defense',3),
(30,'Schlotterbeck','Nico','1999-12-01','DE','Defense',3),
(31,'Havertz','Kai','1999-06-11','DE','Milieu',3),
(32,'Neuer','Manuel','1986-03-27','DE','Gardien',3),
(33,'Werner','Timo','1996-03-06','DE','Attaquant',3);
--joueur foot Italie
INSERT INTO joueur VALUES
(34,'Immobile','Ciro','1990-02-20','IT','Attaquant',4),
(35,'Chiesa','Federico','1997-10-25','IT','Ailier',4),
(36,'Barella','Nicolo','1997-02-07','IT','Milieu',4),
(37,'Verratti','Marco','1992-11-05','IT','Milieu',4),
(38,'Jorginho','Jorge','1991-12-20','IT','Milieu',4),
(39,'Bonucci','Leonardo','1987-05-01','IT','Defense',4),
(40,'Chiellini','Giorgio','1984-08-14','IT','Defense',4),
(41,'DiLorenzo','Giovanni','1993-08-04','IT','Defense',4),
(42,'Spinazzola','Leonardo','1993-03-25','IT','Defense',4),
(43,'Donnarumma','Gianluigi','1999-02-25','IT','Gardien',4),
(44,'Raspadori','Giacomo','2000-02-18','IT','Attaquant',4);
--joueur basket
INSERT INTO joueur VALUES
(45,'James','LeBron','1984-12-30','US','Ailier',5),
(46,'Davis','Anthony','1993-03-11','US','Pivot',5),
(47,'Reaves','Austin','1998-05-29','US','Arriere',5),
(48,'Russell','Dangelo','1996-02-23','US','Meneur',5),
(49,'Hachimura','Rui','1998-02-08','JP','Ailier',5),

(50,'Jordan','Michael','1963-02-17','US','Arriere',6),
(51,'Pippen','Scottie','1965-09-25','US','Ailier',6),
(52,'Rose','Derrick','1988-10-04','US','Meneur',6),
(53,'Noah','Joakim','1985-02-25','FR','Pivot',6),
(54,'Butler','Jimmy','1989-09-14','US','Ailier',6),

(55,'Curry','Stephen','1988-03-14','US','Meneur',7),
(56,'Thompson','Klay','1990-02-08','US','Arriere',7),
(57,'Green','Draymond','1990-03-04','US','Pivot',7),
(58,'Wiggins','Andrew','1995-02-23','CA','Ailier',7),
(59,'Paul','Chris','1985-05-06','US','Meneur',7),

(60,'Tatum','Jayson','1998-03-03','US','Ailier',8),
(61,'Brown','Jaylen','1996-10-24','US','Arriere',8),
(62,'Holiday','Jrue','1990-06-12','US','Meneur',8),
(63,'Porzingis','Kristaps','1995-08-02','LV','Pivot',8),
(64,'White','Derrick','1994-07-02','US','Arriere',8);

SELECT * FROM sport;
SELECT * FROM stade;
SELECT * FROM tournoi;
SELECT * FROM equipe;
SELECT * FROM match;
SELECT * FROM joueur;
SELECT * FROM participe;
SELECT * FROM competition_sport;



--1) Empreinte carbone pour le match au stade 1
SELECT 
    e.nom_equipe,
    p.distance_km * p.empreinte_carbone_par_km AS empreinte_carbone
FROM participe p
JOIN equipe e ON e.id_equipe = p.id_equipe
JOIN match m ON m.id_match = p.id_match
WHERE m.id_stade = 1;

--2) Seulement une équipe (ex France)  pour le match au stade 1
SELECT 
    e.nom_equipe,
    p.distance_km * p.empreinte_carbone_par_km AS empreinte_totale
FROM participe p
JOIN equipe e ON e.id_equipe = p.id_equipe
JOIN match m ON m.id_match = p.id_match
WHERE m.id_stade = 1
AND e.nom_equipe = 'France';

--3) Empreinte totale de toutes les équipes au stade 1
SELECT 
    SUM(p.distance_km * p.empreinte_carbone_par_km) AS empreinte_totale
FROM participe p
JOIN match m ON m.id_match = p.id_match
WHERE m.id_stade = 1;

--4)Distance totale parcourue par chaque équipe + cout carbone totale
SELECT 
    e.nom_equipe,
    SUM(p.distance_km) AS distance_totale,
    SUM(p.distance_km * p.empreinte_carbone_par_km) AS carbone_total
FROM participe p
JOIN equipe e ON p.id_equipe = e.id_equipe
GROUP BY e.nom_equipe
ORDER BY carbone_total DESC;



--5)Information joueur 
SELECT nom, prenom, poste, equipe.pays FROM joueur
JOIN equipe ON joueur.id_equipe = equipe.id_equipe
WHERE equipe.pays = 'France';

--6)Joueurs avec leur équipe et leur sport
SELECT j.nom, j.prenom, e.nom_equipe, s.nom_sport
FROM joueur j
JOIN equipe e ON j.id_equipe = e.id_equipe
JOIN sport s ON e.id_sport = s.id_sport
ORDER BY e.nom_equipe;


--7)Nombre de joueurs par équipe
SELECT e.nom_equipe, COUNT(j.id_joueur) AS nb_joueurs
FROM equipe e
JOIN joueur j ON e.id_equipe = j.id_equipe
GROUP BY e.nom_equipe
ORDER BY nb_joueurs DESC;

--8)les equipes qui on jouer contre 
SELECT 
    m.id_match,
    e1.nom_equipe AS equipe1,
    e2.nom_equipe AS equipe2
FROM match m
JOIN participe p1 ON m.id_match = p1.id_match
JOIN participe p2 ON m.id_match = p2.id_match
JOIN equipe e1 ON p1.id_equipe = e1.id_equipe
JOIN equipe e2 ON p2.id_equipe = e2.id_equipe
WHERE p1.id_equipe < p2.id_equipe;

--9)Matchs avec stade + tournoi + équipes
SELECT 
    m.id_match,
    t.nom_tournoi,
    s.nom_stade,
    e.nom_equipe,
    p.score,
    p.nb_point
FROM match m
JOIN tournoi t ON m.id_tournoi = t.id_tournoi
JOIN stade s ON m.id_stade = s.id_stade
JOIN participe p ON m.id_match = p.id_match
JOIN equipe e ON p.id_equipe = e.id_equipe
ORDER BY m.id_match;

--10)Grand vainqueur de la finale seulement + point gagner
SELECT 
    e.nom_equipe,
    SUM(p.nb_point) AS total_points
FROM participe p
JOIN equipe e ON p.id_equipe = e.id_equipe
WHERE e.id_equipe IN (

    SELECT p2.id_equipe
    FROM match m2
    JOIN participe p2 ON m2.id_match = p2.id_match
    WHERE m2.phase_tournoi = 'finale'
    AND p2.nb_point = (
        SELECT MAX(p3.nb_point)
        FROM participe p3
        WHERE p3.id_match = m2.id_match
    )

)
GROUP BY e.nom_equipe
ORDER BY total_points DESC;



