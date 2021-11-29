# SQL : Tables

------

b) type décimal

nombre à virgule
connais le nombre de chiffres, ex : PrixHT DECIMAL (5.2) : 5 signifie qu'il prend un chiffre devant la virgule et le 2 correspond à 2 chiffres après la virgule.
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