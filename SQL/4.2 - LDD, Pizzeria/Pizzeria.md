# Pizzeria : création d'une base de données à partir d'un modèle relationnel



## 1. Création de la base

Le but du travail est d'implémenter le Système d'information d'une pizzeria. Celui-ci gère des commandes de pizzas, qui sont livrées par des employés.

> **Travail à faire**
>
> Composer le script de création de base de donnée Pizzeria en utilisant les commandes SQL adéquates, à partir du modèle relationnel fourni.
>
> Compléter ensuite le script pour insérer les données nécessaires au fonctionnement du système de gestion de la pizzeria. Les principales données sont fournies ci-après. Les données nécessaires aux commandes sont à composer librement.



### 1.1. Modèle relationnel de la base de données Pizzeria

- Ingredients (<u>idIngredient</u>, nomIngredient, prixUnitaireIngredient, #symboleUnite)
- Unites (<u>symboleUnite</u>, libelleUnite)
- Compositions (<u>idComposition</u>, #idPizza, #idIngredient, quantite)
- Pizzas (<u>idPizza</u>, nomPizza, prixVentePizza)
- LignesCommande (<u>idLigneCommande</u>, #idPizza, #idCommande, quantite)
- Commandes (<u>idCommande</u>, dateCommande, heureCommande, heureLivraison, #idEmploye)
- Employes (<u>idEmploye</u>, nomEmploye, prenomEmploye, dateNaissance, salaireMensuel, dateEmbauche)



### 1.2. Les ingrédients

| **Ingrédients** | **Tarif** |
| --------------- | --------- |
| Sauce tomate    | 3 €/L     |
| Champignons     | 5 €/Kg    |
| Pâte à pizza    | 1 €/pâte  |
| Chorizo         | 7 €/Kg    |
| Emmental        | 4 €/Kg    |
| Roquefort       | 5 €/Kg    |
| Chèvre          | 6 €/Kg    |
| Mozzarella      | 5 €/Kg    |
| Parmesan        | 6 €/Kg    |
| Lardons         | 1,5 €/Kg  |
| Crème fraîche   | 2 €/L     |
| Oignons         | 1 €/Kg    |
| Olives noires   | 3 €/Kg    |
| Jambon          | 2 €/Kg    |



### 1.3. Les Pizzas proposées

Deux pizzas sont proposées, d'autres pourront être ajoutées.

| **La pizza 4 fromages à 14 €** | **La pizza royale à 16 €** |
| ------------------------------ | -------------------------- |
| 1 pâte à pizza                 | 1 pâte à pizza             |
| 100 ml de sauce tomate         | 100 ml de sauce tomate     |
| 150 g de lardons               | 10 g d'oignon              |
| 130 g de crème fraîche épaisse | 50 g de champignons        |
| 100 g de roquefort             | 25 g d'emmenthal râpé      |
| 130 g de chèvre                | 30 g de mozzarella         |
| 80 g de mozzarella             | 40 g d'olives noires       |
| 30 g de parmesan               | 100 g de jambon            |



### 1.4. Les employés

- Julien MARTIN, embauché à 1 150 €/mois,
- Ludovic DURAND, embauché à 1 200 €/mois.



## 2. Requêtes

> **Travail à faire**
>
> Construire les requêtes suivantes. Adapter les données pour permettre la vérification du fonctionnement des différentes requêtes.



### 2.1. SQL standard

**R1** : *« Quelle est la liste des nom et prix de chaque pizza, triée par ordre de prix croissant ? »*

```sql
SELECT nomPizza, prixVentePizza
From Pizzas
ORDER BY prixVentePizza ASC; 
```

**R2** : *« Quel est le nom des pizzas qui coutent plus de 13€, triés par ordre décroissant du prix ? »*

```sql
SELECT nomPizza
FROM Pizzas
WHERE prixVentePizza > 13
ORDER BY prixVentePizza DESC;
```

**R3** : *« Quelle est la liste de nom et prénom des employés qui gagnent entre 1 200 € et 1 300 € ? »*

```sql
SELECT nomEmploye, prenomEmploye
FROM Employes
WHERE salairemensuel BETWEEN 1200 AND 1300;
```

**R4** : *« Quel est l'identifiant des commandes passées courant de l’année 2011(**where year**), entre 15h et 16h de l’après midi, qui n’ont pas été livrées par l’employé numéro 1 ? »*

```sql
SELECT idCommande
FROM `Commandes`
WHERE YEAR (dateCommande) = 2011
AND heureCommande BETWEEN "15:00:00" AND "16:00:00"
AND idEmploye <> 1;
```

![image-20220110100201876](C:\Users\Tiffany Dobler\AppData\Roaming\Typora\typora-user-images\image-20220110100201876.png)

![image-20220110100225237](C:\Users\Tiffany Dobler\AppData\Roaming\Typora\typora-user-images\image-20220110100225237.png)

**R5** : *« Quel est le nom des ingrédients qui se terminent par la lettre « a » ? »*

```sql
SELECT nomIngredient
FROM `Ingredients`
WHERE nomIngredient LIKE "%a";
```

**R6** : *« Quelle est la liste des identifiants de pizzas qui contiennent au moins 100 g de champignons ou 100 g de chorizo ? »*

```sql
SELECT idPizza
FROM `Compositions`
INNER JOIN Ingredients
ON Compositions.idIngredient=Ingredients.idIngredient
WHERE (nomIngredient LIKE "Champignons" AND quantite >= 0.10)
OR (nomIngredient LIKE "Chorizo" AND quantite >= 0.10);
```

Les autres possibilités :

![image-20220110102206057](C:\Users\Tiffany Dobler\AppData\Roaming\Typora\typora-user-images\image-20220110102206057.png)

![image-20220110102243142](C:\Users\Tiffany Dobler\AppData\Roaming\Typora\typora-user-images\image-20220110102243142.png)

![image-20220110102325124](C:\Users\Tiffany Dobler\AppData\Roaming\Typora\typora-user-images\image-20220110102325124.png)

**R7** : *« Quelle est la liste avec nom et quantité des ingrédients de la pizza 4 fromages ? »*

```sql
SELECT nomPizza, nomIngredient, quantite
FROM `Ingredients`
INNER JOIN Compositions
ON Ingredients.idIngredient=Compositions.idIngredient
INNER JOIN Pizzas
ON Compositions.idPizza=Pizzas.idPizza
WHERE Pizzas.nomPizza LIKE "4 fromages";
```

**R8** : *« Quels sont les noms des pizzas qui contiennent des olives ou du chorizo ? »*

```sql
SELECT nomPizza, nomIngredient
FROM `Ingredients`
INNER JOIN Compositions
ON Ingredients.idIngredient=Compositions.idIngredient
INNER JOIN Pizzas
ON Compositions.idPizza=Pizzas.idPizza
WHERE Ingredients.nomIngredient LIKE "Choriso" 
OR (Ingredients.nomIngredient LIKE "olives%");
```

![image-20220110110813350](C:\Users\Tiffany Dobler\AppData\Roaming\Typora\typora-user-images\image-20220110110813350.png)

**R9** : *« Quel est le nom et prénom de l’employé qui a traité la commande 3 ? »*

```sql
SELECT nomEmploye, prenomEmploye
FROM `Employes`
INNER JOIN Commandes
ON Employes.idEmploye=Commandes.idEmploye
WHERE Commandes.idCommande = 3;
```

**R10** : *« Quels sont les noms des employés ayant livré les commandes du 23 juin 2011 ? »*

```sql
SELECT DISTINCT nomEmploye 
FROM `Commandes`
INNER JOIN Employes
ON Commandes.idEmploye=Employes.idEmploye
WHERE Commandes.dateCommande LIKE "2011-06-23" 
AND Commandes.heureLivraison IS NOT NULL;
```

**R11** : *« Quels sont le ou les employés qui gagnent le plus ? »*  Ce type de requête (MAX réduit à une seule ligne) demande une requête imbriquée.

```sql
SELECT nomEmploye
FROM Employes
WHERE salaireMensuel = (SELECT MAX(salaireMensuel)
                        FROM Employes);
```

**R12** : *« Quels sont, sans doublon, les ingrédients contenus dans les pizzas de la commande 2 ? »*

**R13** : *« Quels sont les ingrédients qui ne sont utilisés dans aucune pizza ? »*



### 2.2. SQL avancé

**R14** : *« Quelle est la liste des commandes qui ont été livrées moins de 10 minutes après avoir été commandées ? »*

**R15** : *« Quel est la liste des commandes qui ont été commandées le mois de naissance de Julien MARTIN, en précisant le nom et le prénom des livreurs qui ont livrés chacune de ces commandes ? »*

**R16** : *« Quels sont les noms des pizzas qui contiennent au moins un ingrédient en commun avec la 4 fromages, sauf la pâte ? »*

**R17** : *« Quelle est la listes des pizzas plus chères que la pizza royale ? »*

**R18** : *« Quelle est la liste des commandes livrées cette année, en précisant le nom et le prénom des livreurs qui ont livrés chacune de ces commandes ? »*

**R19** : *« Donner le contenu de chaque commande, en précisant le nom de la pizza et la quantité. »*

**R20** : *« Quelles sont les commandes qui ne contiennent pas de pizza 4 fromages ? »*

**R21** : *« Quelles sont les pizzas qui ne contiennent pas de chorizo ? »*

**R22** : *« Quelles sont les pizzas qui ne contiennent pas de chorizo et qui ont été livrées dans au moins une commande du 23 juin 2011 ? »*

**R23** : *« Quels sont les employés (nom et prénom) qui ont livrés plus de 2 commandes le 23 juin 2011 entre 16h et 17h ? »*

**R24** : *« Quelle est la pizza qui contient le moins de chorizo, mais en contient, en précisant combien elle en contient ? »*

**R25** : *« Quelles sont les pizzas ayant été livrées par le livreur de la commande 12, qui contiennent au moins autant de chorizo que la pizza Royale et qui coûtent moins de 13 € ? »*

**R26** : *« Quelle est la pizza qui contient le plus d’ingrédients différents ? »*

**R27** : *« Afficher la liste des pizzas avec une 2e colonne indiquant selon la quantité de champignons le message "Plus de 100g", "Moins de 100g" ou "Aucun". »*
