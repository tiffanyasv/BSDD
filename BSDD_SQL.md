**Cours_de_BDD_**

> rapport de toutes les requêtes émisses et effectuer un commit à chaque fois.

git commit -a -m "nom" en ouvrant gitbash dans le fichier mysql puis git push

**Première requête :**

Exemple de l'avion : SELECT = *; From = Avions

![image-20211018115720909](C:\Users\Tiffany Dobler\AppData\Roaming\Typora\typora-user-images\image-20211018115720909.png)

05/11/2021 

Select : ce qu'on souhaite afficher (* = pour tous les champs)
From : où

%toto = toutes les chaînes de caractères qui se terminent par "toto"
% to % = toutes les chaîne de caractères qui contiennent "to"
__%to = tout ce qui se termine par "to" avec au minimum 2 chaînes de caractères avant.
_toto = 

--> permet des comparaisons de chaînes

> En SQL, la virgule est le séparateur

**Les jointures** 

Associer l'enregistrement des vols avec l'enregistrement des avions :

```sql
SELECT * 
FROM `Vols`
INNER JOIN Avions;
```

Dès qu'on met un INNER JOIN on doit mettre derrière un ON

```sql
SELECT * 
FROM `Vols`
INNER JOIN Avions
ON Vols.numAvion=Avions.numAvion;
```

Cela permet à ce que la requête soit claire et comprise. Et évite que la base de données de fait des siennes.

Pour dire quel caractère on parle : "."
