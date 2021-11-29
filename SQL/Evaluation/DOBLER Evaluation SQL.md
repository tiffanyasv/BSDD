# Evaluation SQL

------

R1 : Quel est l'ouvrage n°5 ? Le tout en poche : Linux

```sql
SELECT numOuvrage, titreOuvrage 
FROM `Ouvrages` 
WHERE numOuvrage = 5; 
```

R2 : Quels sont les ouvrages dont le titre commence par la lettre « F » ? Il y en a qu'un : Formation à Visual C ++

```sql
SELECT numOuvrage, titreOuvrage 
FROM `Ouvrages` 
WHERE titreOuvrage LIKE "F%"; 
```

R3 : Quels sont les titres et années de parution des ouvrages traitant du Registre (dans Windows) ? Le tout en poche : La base de registres (W5 & NT4) en 1998 et La base de registres Windows XP en 2003

```sql
SELECT anneeParution, titreOuvrage 
FROM `Ouvrages`
WHERE titreOuvrage LIKE "%registre%";
```

R4 : Quels sont les ouvrages qui traitent de Visual Basic à partir de l’année 1999 ? Visual Basic - Guide de référence en 1999, Visual Basic 6 - Bases de données et SQL Server 7 en 2000, Visual Basic 6 - Le guide du programmeur en 1999

```sql
SELECT anneeParution, titreOuvrage 
FROM `Ouvrages`
WHERE anneeParution >= 1999
AND (titreOuvrage LIKE "Visual Basic%");
```

R5 : Quels sont tous les lecteurs qui s’appellent « Bernard » de toutes les façons possibles ? BERNARD Claude, INAUD Bernard, AUAROT Bernard et URBAIN Jean-Bernard

```sql
SELECT * 
FROM `Lecteurs`
WHERE nomLecteur LIKE "BERNARD" OR prenomLecteur LIKE "%Bernard";
```

R6 : Quels sont les ouvrages ayant été empruntés au moins une fois depuis le début de l’année 2015 ? 

```sql
SELECT * 
FROM `Emprunter`
INNER JOIN Ouvrages
ON Emprunter.numOuvrage=Ouvrages.numOuvrage
WHERE dateEmprunt LIKE "2015%";
```

R7 : Quels sont les ouvrages (titre et dates) non rendus par le lecteur « SPAGUETTI » ?

```sql
SELECT *
FROM `Emprunter`
 INNER JOIN Ouvrages
 ON Emprunter.numOuvrage=Ouvrages.numOuvrage
   INNER JOIN Lecteurs
   ON Emprunter.numLecteur=Lecteurs.numLecteur
WHERE nomLecteur LIKE "SPAGHETTI"
AND dateEmprunt IS NULL;
```

R8 : Quel est le nombre d’emprunts déjà rendus enregistrés à ce jour ?

```sql
SELECT COUNT(dateEmprunt)AS "nombre emprunt"
FROM Emprunter
WHERE dateRetour IS NOT NULL
ou
SELECT dateEmprunt,COUNT(dateEmprunt)AS "nombre emprunt"
FROM Emprunter
WHERE dateRetour IS NOT NULL
GROUP BY dateEmprunt;
```

R9 : Quels sont les titres des ouvrages empruntés durant la première année d'emprunts dans la bibliothèque ? 

```sql
SELECT titreOuvrage
FROM Ouvrages
INNER JOIN Emprunter
ON Ouvrages.numOuvrage=Emprunter.numOuvrage
WHERE YEAR(dateEmprunt) = (SELECT MIN(YEAR(dateEmprunt))
                           FROM Emprunter);
```

Question bonus : comment afficher les ouvrages disponibles qui n’ont jamais été empruntés ?

```sql
SELECT titreOuvrage
FROM Ouvrages
WHERE Ouvrages.numOuvrage NOT IN (SELECT numOuvrage
                                  FROM Emprunter);
```

R10 : Quel est le nombre total d’emprunts réalisés par lecteur et par année, mais non régularisés ?

```sql
SELECT dateEmprunt,nomLecteur, COUNT(dateEmprunt) AS "nombre total d'emprunt"
FROM `Emprunter`
INNER JOIN Lecteurs
ON Emprunter.numLecteur=Lecteurs.numLecteur
GROUP by nomLecteur, dateEmprunt;
```

R11 : Ajouter le lecteur suivant dans la base :
            Nom : « TATA »,
            Prénom : « Arthur »

```sql
INSERT INTO Lecteurs(numLecteur,nomLecteur,prenomLecteur) 
VALUES (0,"TATA","Arthur"); 
```

R12 : Supprimer tous les emprunts de Bertrand INAUD de l’année 2013, restitués depuis.
Aucun demi-point possible sur cette question

```sql
INSERT INTO Emprunter(numLecteur,numOuvrage,dateEmprunt,dateRetour) 
VALUES (10,17,2013.10.01,2013.11.01); 
```

```sql
DELETE
FROM E
```

