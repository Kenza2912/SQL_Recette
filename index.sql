-- 1 Afficher toutes les recettes disponibles (nom de la recette, catégorie et temps de préparation) triées de façon décroissante sur la durée de réalisation 


SELECT r.nom, c.nomCategorie AS categorie, r.tempsPreparation 
FROM recette r
JOIN categorie c
ON r.id_categorie = c.id_categorie
ORDER BY r.tempsPreparation DESC;



-- 2 En modifiant la requête précédente, faites apparaître le nombre d’ingrédients nécessaire par recette.

SELECT r.nom, c.nomCategorie AS categorie, r.tempsPreparation, 
COUNT(cp.id_ingredient) AS nombre_ingredients
FROM recette r
JOIN categorie c
ON r.id_categorie = c.id_categorie
JOIN composant cp
ON r.id_recette = cp.id_recette
GROUP BY r.id_recette
ORDER BY r.tempsPreparation DESC;

-- 3 Afficher les recettes qui nécessitent au moins 30 min de préparation

SELECT r.nom, c.nomCategorie AS categorie, r.tempsPreparation 
FROM recette r
JOIN categorie c
ON r.id_categorie = c.id_categorie
WHERE r.tempsPreparation >=30;


-- 4 Afficher les recettes dont le nom contient le mot « Salade » (peu importe où est situé le mot en question)

SELECT r.nom, c.nomCategorie, r.tempsPreparation
FROM recette r
JOIN categorie c
ON r.id_categorie = c.id_categorie
WHERE r.nom LIKE '%Salade%';


-- 5- Insérer une nouvelle recette : « Pâtes à la carbonara » dont la durée de réalisation est de 20 min avec les instructions de votre choix. Pensez à alimenter votre base de données en conséquence afin de pouvoir lister les détails de cette recettes (ingrédients)

	INSERT INTO recette (nom, tempsPreparation, instructions, id_categorie) 
	VALUES ('Pâtes à la carbonara', 20,'Faire bouillir les pâtes', 2);
	
	INSERT INTO composant (id_ingredient, id_recette, quantite)
	VALUES (13, LAST_INSERT_ID(),2),(4, LAST_INSERT_ID(),2)


-- supprimer car j'ai rajouté trop de ligne de pâtes 
SELECT id_recette
FROM recette
WHERE nom = 'Pâtes à la carbonara';

DELETE FROM composant
WHERE id_recette >= 7;
	

DELETE FROM recette
WHERE nom = 'Pâtes à la carbonara';


-- 6 Modifier le nom de la recette ayant comme identifiant id_recette = 3 (nom de la recette à votre convenance)

UPDATE recette 
SET nom = 'Salade exotique'
WHERE id_recette = 3



-- 7- Supprimer la recette n°2 de la base de données

DELETE FROM recette 
WHERE id_recette = 2


-- 8- Afficher le prix total de la recette n°5
SELECT SUM(composant.quantite * ingredient.prix) AS prix_total
FROM composant
JOIN ingredient ON composant.id_ingredient= ingredient.id_ingredient
WHERE composant.id_recette = 3;


-- 9- Afficher le détail de la recette n°5 (liste des ingrédients, quantités et prix)

SELECT i.nomIngredient, i.prix, i.uniteMesure, c.quantite
FROM composant c
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE c.id_recette = 3

-- 10- Ajouter un ingrédient en base de données : Poivre, unité : cuillère à café, prix : 2.5 €

SELECT i.nomIngredient, i.prix, cp.quantitel
FROM composant cp
JOIN ingredient i ON cp.id_ingredient= i.id_ingredient
WHERE cp.id_recette = 3;

-- 11- Modifier le prix de l’ingrédient n°12 (prix à votre convenance)

UPDATE ingredient
SET prix = 3.5
WHERE id_ingredient = 12;

-- 12- Afficher le nombre de recettes par catégories : X entrées, Y plats, Z desserts

SELECT c.nomCategorie,
COUNT(r.id_recette) AS nb_recettes
FROM recette r
JOIN categorie c ON r.id_categorie = c.id_categorie
GROUP BY c.nomCategorie;


-- 13- Afficher les recettes qui contiennent l’ingrédient « Poulet »

SELECT r.nom
FROM recette r
JOIN composant c  ON r.id_recette = c.id_recette
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE i.nomIngredient ='Poulet';


-- 14- Mettez à jour toutes les recettes en diminuant leur temps de préparation de 5 minutes

UPDATE recette
SET tempsPreparation = tempsPreparation -5;


-- 15- Afficher les recettes qui ne nécessitent pas d’ingrédients coûtant plus de 2€ par unité de mesure

SELECT r.nom
FROM recette r
JOIN composant c ON r.id_recette = c.id_recette
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
GROUP BY r.id_recette
HAVING MAX(i.prix)<=2;


-- 16- Afficher la / les recette(s) les plus rapides à préparer

SELECT r.nom 
FROM recette r
WHERE r.tempsPreparation =(SELECT MIN(tempsPreparation) FROM recette);


-- 17- Trouver les recettes qui ne nécessitent aucun ingrédient (par exemple la recette de la tasse d’eau chaude qui consiste à verser de l’eau chaude dans une tasse)

SELECT r.nom 
FROM recette r
LEFT JOIN composant cp ON r.id_recette = cp.id_recette
WHERE cp.id_ingredient IS NULL;


-- 18- Trouver les ingrédients qui sont utilisés dans au moins 3 recettes

SELECT i.nomIngredient
FROM composant c
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
GROUP BY c.id_ingredient
HAVING COUNT(c.id_recette) >=2;


-- 19- Ajouter un nouvel ingrédient à une recette spécifique

INSERT INTO composant(id_ingredient, id_recette, quantite)
VALUES (14,2,1);


-- 20- Bonus : Trouver la recette la plus coûteuse de la base de données (il peut y avoir des ex aequo, il est donc exclu d’utiliser la clause LIMIT)





