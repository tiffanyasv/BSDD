# SQL : Tables

------

b) type décimal

nombre à virgule
connais le nombre de chiffres, ex : PrixHT DECIMAL (5.2) : 5 (5 chiffres complet) signifie qu'il prend un chiffre devant la virgule et le 2 correspond à 2 chiffres après la virgule, ex : 999.99
Les types permettent de déterminer si les données sont : un entier, un varchar ou autre.

c) type numérique 

E+38 : signifie qu'il a possibilité d'avoir 38 zéros derrière une virgule

d) type chaînes de caractères

varchar : s'adapte à la taille, 1 octect = 1 + 1ou 5 octect = 5 + 1
ex : nom de famille, mettre un varchar (20)
On essaye de se rapprocher de la taille dont on va avoir besoin => certains cas où on pourra s'appuyer sur la taille max

Char (M) on va bloquer pour chaque enregistrement M octets.

La limite est de 255 pour les champs ou on pouvait chercher rapidement mais aujourd'hui on peut avoir plus.

> Chaque champs aura son type

TEXT :la limite est beaucoup plus élevé puisqu'elle correspond aux textes = bcp de caractères. Renvoie le texte exploitable

BLOB : lecture binaire, ne convertie pas en lettres exploitable. Besoin de stocker un fichier son par exemple.

La taille de caractères possible dépend de la taille du disque sur la base de données. * par le nombre d'enregistrement dans la table pour définir la taille.

e) type temporels

-> ressemble à des chaînes caractères (AAAA-MM-JJ)
lac onséquence : peu être rechercher avec LIKE "2021%"

TIMESTAMP : homogène à un entier, nombre de seconde depuis une date (4 octets)

## Création base de données

------

![image-20211129085806148](C:\Users\Tiffany Dobler\AppData\Roaming\Typora\typora-user-images\image-20211129085806148.png)

La commande ci-dessus, permet de créer une base de données. [if not exist] = créer la page mais si elle existe => erreur et le script s'arrête.

a) Création de tables

![image-20211129090030315](C:\Users\Tiffany Dobler\AppData\Roaming\Typora\typora-user-images\image-20211129090030315.png)

Type = c'est ce qu'on a vu avant
Auto-increment : insérer un champs auto-incrémental
Primary : on peut déclarer un champs clé primaire
Possibilité de mettre des commentaires

EX :

![image-20211129090238896](C:\Users\Tiffany Dobler\AppData\Roaming\Typora\typora-user-images\image-20211129090238896.png)

> **on peut également regarder dans le dossier ressources : le prof à mis le code des tables "avions" et "bibliothèques"**

Intégrité référentielles : vérifier si une valeur donnée à un champ dans une clé étrangère existe bien dans la table liée. Vérifier si des commandes sont associés, si oui alors tu ne peux pas supprimer le client :

![image-20211129090745187](C:\Users\Tiffany Dobler\AppData\Roaming\Typora\typora-user-images\image-20211129090745187.png)

- mécanisme de protection de la base

SHOW CREATE TABLE : permet de voir la commande qui aurait pu servir (recréer la commande qui aurait pu créer la table)