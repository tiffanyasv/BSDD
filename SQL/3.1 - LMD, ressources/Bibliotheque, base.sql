SET AUTOCOMMIT = 0;
START TRANSACTION;
-- ---------------------------------------------------------------------------------------
DROP DATABASE
    IF EXISTS bibliotheque;
CREATE DATABASE bibliotheque
    DEFAULT CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;
USE bibliotheque;
--
-- Base de données : bibliotheque
--
-- ---------------------------------------------------------------------------------------
-- Structure de la table Emprunter
--
DROP TABLE IF EXISTS Emprunter;
CREATE TABLE Emprunter (
  numLecteur int(11) NOT NULL,
  numOuvrage int(11) NOT NULL,
  dateEmprunt date NOT NULL,
  dateRetour date default NULL,
  PRIMARY KEY  (numLecteur,numOuvrage,dateEmprunt),
  KEY FK_emprunter_numOuvrage (numOuvrage)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Contenu de la table Emprunter
--
INSERT INTO Emprunter (numLecteur, numOuvrage, dateEmprunt, dateRetour) VALUES
(3, 17, '2016-01-11', NULL),
(5, 11, '2016-01-04', '2016-01-09'),
(5, 21, '2016-01-04', NULL),
(5, 7, '2016-01-04', NULL),
(5, 12, '2017-01-04', NULL),
(11, 10, '2015-12-20', NULL),
(11, 30, '2013-05-19', '2013-05-28'),
(12, 31, '2013-06-19', '2013-06-28'),
(2, 31, '2013-04-19', '2013-04-28'),
(15, 2, '2014-10-10', '2014-11-10'),
(15, 2, '2014-11-15', '2014-11-25'),
(15, 6, '2015-12-27', NULL),
(15, 20, '2014-10-15', '2014-11-10'),
(20, 17, '2015-11-24', '2016-01-07'),
(20, 25, '2015-11-24', NULL);
--
-- --------------------------------------------------------
-- Structure de la table Lecteurs
--
DROP TABLE IF EXISTS Lecteurs;
CREATE TABLE Lecteurs (
  numLecteur int(11) NOT NULL,
  nomLecteur varchar(30) default NULL,
  prenomLecteur varchar(30) default NULL,
  PRIMARY KEY  (numLecteur)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Contenu de la table Lecteurs
--
INSERT INTO Lecteurs (numLecteur, nomLecteur, prenomLecteur) VALUES
(1, 'BERNARD', 'Claude'),
(2, 'INAUD', 'Bernard'),
(3, 'ALAMARD', 'Frédéric'),
(4, 'BERTRAND', 'Carole'),
(5, 'SPAGUETTI', 'Soisic'),
(6, 'DUPUIS', 'Laurence'),
(7, 'BRULEY', 'Isvan'),
(8, 'ELAS', 'Ludivine'),
(9, 'FOUX', 'Eric'),
(10, 'INAUD', 'Bertrand'),
(11, 'AUAROT', 'Bernard'),
(12, 'KANST', 'Judith'),
(13, 'LEROI', 'Vincent'),
(14, 'HAMSI', 'Mathieu'),
(15, 'NICOLAS', 'Louis'),
(16, 'OUATE', 'Caroline'),
(17, 'PARIS', 'Effel'),
(18, 'KOI', 'Fleur'),
(19, 'SEMIEU', 'Georges'),
(20, 'SUIE', 'Noël'),
(21, 'TAROD', 'Adage'),
(22, 'URBAIN', 'Jean-Bernard'),
(23, 'VAZI', 'Franc'),
(24, 'XEROX', 'Frank'),
(25, 'YOYO', 'Tata'),
(26, 'FAIDEUX', 'Nicolas'),
(27, 'DUPUIS', 'Marie'),
(28, 'ESTER', 'Quentin'),
(29, 'SIDAMPOULE', 'Michel'),
(30, 'SALAMON', 'Erchad');
--
-- --------------------------------------------------------
-- Structure de la table Ouvrages
--
DROP TABLE IF EXISTS Ouvrages;
CREATE TABLE Ouvrages (
  numOuvrage int(11) NOT NULL AUTO_INCREMENT,
  titreOuvrage varchar(50) DEFAULT NULL,
  anneeParution int(11) DEFAULT NULL,
  PRIMARY KEY (numOuvrage)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
--
-- Contenu de la table Ouvrages
--
INSERT INTO Ouvrages (numOuvrage, titreOuvrage, anneeParution) VALUES
(1, 'Passeport pour l''algorithmique objet', 1998),
(2, 'Technologie des ordinateurs et des réseaux', 2000),
(3, 'Instances en ADA', 1990),
(4, 'Le tout en poche : La base de registres (W5 & NT4)', 1998),
(5, 'Le tout en poche : Linux', 2000),
(6, 'Dépanner & revitaliser un PC', 1998),
(7, 'Systèmes d''exploitation', 1994),
(8, 'Assembleur facile', 1989),
(9, 'La maîtrise du MS-DOS et du BIOS', 1989),
(10, 'C Facile', 1989),
(11, 'Visual Basic - Guide de référence', 1999),
(12, 'Visual Basic 6 - Bases de données et SQL Server 7', 2000),
(13, 'Turbo Pascal 5 Manuel de référence', 1988),
(14, 'Livre d''or Visual C++ 4.0', 1995),
(15, 'Visual Basic et SQL Serveur Guide tout-terrain', 1996),
(16, 'Access 2000 Manuel du Développeur', 1999),
(17, 'Le grand livre du C++', 1993),
(18, 'Dictionnaire d''informatique', 2001),
(19, 'AMC*Designor 6 Guide de l''utilisateur', 1998),
(20, 'Ingénierie des systèmes d''information MERISE II', 1998),
(21, 'Visual Basic 6 - Le guide du programmeur', 1999),
(22, 'Technologie des ordinateurs', 1992),
(23, 'Le RNIS techniques et atouts', 1990),
(24, 'Modélisation objet avec UML', 2001),
(25, 'Formation à Visual C++', 2003),
(26, 'Manager .net', 2002),
(27, 'PHP Professionnel', 2001),
(28, 'Le guide de l''utilisateur UML', 2001),
(29, 'La base de registres Windows XP', 2003),
(30, 'Le tout en poche : Flash 5', 2001),
(31, 'JavaScript Professionnel', 2001),
(32, 'Solution .net : XML', 2001),
(34, 'Merise/2 Modèles et techniques avancés', 2000),
(35, 'Programmez en C#', 2003),
(36, 'Les outils pour Visual .NET', 2002),
(37, 'Merise Sujets corrigés', 2001),
(38, 'Intelligence artificielle 2e édition', 2006);
--
-- ---------------------------------------------------------------------------------------
-- Contraintes pour les tables
--
ALTER TABLE Emprunter
  ADD CONSTRAINT FK_emprunter_numLecteur FOREIGN KEY (numLecteur) REFERENCES Lecteurs (numLecteur),
  ADD CONSTRAINT FK_emprunter_numOuvrage FOREIGN KEY (numOuvrage) REFERENCES Ouvrages (numOuvrage);
-- ---------------------------------------------------------------------------------------
COMMIT;
SET AUTOCOMMIT = 1;
