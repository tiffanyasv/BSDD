SET AUTOCOMMIT = 0;
START TRANSACTION;
-- ---------------------------------------------------------------------------------------
DROP DATABASE
    IF EXISTS aeroport;
CREATE DATABASE aeroport
    DEFAULT CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;
USE aeroport;
--
-- Base de données : aeroport
--
-- ---------------------------------------------------------------------------------------
-- Structure de la table Avions
--
DROP TABLE IF EXISTS Avions;
CREATE TABLE Avions (
  numAvion int(11) NOT NULL DEFAULT '0' PRIMARY KEY,
  nomAvion varchar(30) DEFAULT NULL,
  capacite int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Contenu de la table Avions
--
INSERT INTO Avions (numAvion, nomAvion, capacite) VALUES
(1, 'A340-300', 295),
(2, 'ATR72', 70),
(3, 'B747-400', 420),
(4, 'A319', 120),
(5, 'ATR42/72', 50),
(6, 'B747-400', 420);
--
-- ---------------------------------------------------------------------------------------
-- Structure de la table Pilotes
--
DROP TABLE IF EXISTS Pilotes;
CREATE TABLE Pilotes (
  numPilote int(11) NOT NULL DEFAULT '0',
  nomPilote varchar(30) DEFAULT NULL,
  adresse varchar(80) DEFAULT NULL,
  salaire smallint(6) DEFAULT NULL,
  bonus smallint(6) DEFAULT NULL,
  PRIMARY KEY (numPilote)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Contenu de la table Pilotes
--
INSERT INTO Pilotes (numPilote, nomPilote, adresse, salaire, bonus) VALUES
(1, 'TOTO', '97438 SAINTE-MARIE', 100, 1100),
(2, 'PAYET', '97487 SAINT-DENIS', 3000, 800),
(3, 'HOAREAU', '97420 LE PORT', 3300, 950),
(4, 'DUPUIS', '75130 PARIS', 3200, 950),
(5, 'DUPOND', '75150 PARIS', 3500, 1000),
(6, 'PETIT', '34000 MONTPELLIER', 2000, 500),
(7, 'VITRI', '34070 MONTPELLIER', 4463, NULL),
(8, 'GRAND', '94410 SAINT-MAURICE', 2100, 400),
(9, 'TATA', '97420 LE PORT', 4463, 100),
(10, 'TITI', '97420 LE PORT', 3000, 100),
(11, 'TUTU', '75150 PARIS', 2300, NULL),
(12, 'ARTHUR', '67000 STRASBOURG', 3200, 0),
(13, 'MARTY', '97438 SAINTE-MARIE', 2500, 800),
(14, 'LUCAS', '97487 SAINT-DENIS', 4463, 1200),
(15, 'ROGER', '94410 SAINT-MAURICE', 1200, 1200);


--
-- ---------------------------------------------------------------------------------------
-- Structure de la table Vols
--
DROP TABLE IF EXISTS Vols;
CREATE TABLE Vols (
  numVol varchar(10) NOT NULL DEFAULT '',
  numAvion int(11) NOT NULL DEFAULT '0',
  numPilote int(11) DEFAULT NULL,
  villeDepart varchar(30) DEFAULT NULL,
  villeArrivee varchar(30) DEFAULT NULL,
  heureDepart time DEFAULT NULL,
  heureArrivee time DEFAULT NULL,
  PRIMARY KEY (numVol),
  KEY numAvion (numAvion),
  KEY numPilote (numPilote)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Contenu de la table Vols
--
INSERT INTO Vols (numVol, numAvion, numPilote, villeDepart, villeArrivee, heureDepart, heureArrivee) VALUES
('AF 380', 3, 1, 'PARIS ORLY', 'GILLOT', '21:00:00', '10:45:00'),
('AF 598', 5, 8, 'PARIS CDG', 'STRASBOURG', '05:22:00', '11:08:00'),
('AF 7684', 4, 6, 'PARIS CDG', 'MONTPELLIER', '20:45:00', '22:10:00'),
('MK 203', 5, 4, 'GILLOT', 'MAURICE', '07:30:00', '08:45:00'),
('MK 230', 2, 3, 'GILLOT', 'MAURICE', '11:40:00', '12:25:00'),
('MK 40', 6, 2, 'MAURICE', 'PARIS CDG', '09:40:00', '19:05:00'),
('MK 45', 1, 7, 'PARIS CDG', 'GILLOT', '11:40:00', '12:25:00');
--
-- ---------------------------------------------------------------------------------------
-- Contraintes pour les tables
--
ALTER TABLE Vols
  ADD CONSTRAINT fk_vols_numpilote FOREIGN KEY (numPilote) REFERENCES Pilotes (numPilote),
  ADD CONSTRAINT fk_vols_numavion FOREIGN KEY (numAvion) REFERENCES Avions (numAvion);
-- ---------------------------------------------------------------------------------------
COMMIT;
SET AUTOCOMMIT = 1;
