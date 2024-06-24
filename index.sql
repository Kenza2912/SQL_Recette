-- 1 Afficher toutes les recettes disponibles (nom de la recette, catégorie et temps de préparation) triées de façon décroissante sur la durée de réalisation 


SELECT recette.nom, categorie.nomCategorie AS categorie, recette.tempsPreparation 
FROM recette 
JOIN categorie
ON recette.id_categorie = categorie.id_categorie
ORDER BY recette.tempsPreparation DESC;



-- 2 En modifiant la requête précédente, faites apparaître le nombre d’ingrédients nécessaire par recette.

SELECT recette.nom, categorie.nomCategorie AS categorie, recette.tempsPreparation, 
COUNT(composant.id_ingredient) AS nombre_ingredients
FROM recette 
JOIN categorie
ON recette.id_categorie = categorie.id_categorie
LEFT JOIN composant
ON recette.id_recette = composant.id_recette
GROUP BY recette.id_recette
ORDER BY recette.tempsPreparation DESC;

-- 3 Afficher les recettes qui nécessitent au moins 30 min de préparation

SELECT recette.nom, categorie.nomCategorie AS categorie, recette.tempsPreparation 
FROM recette 
JOIN categorie
ON recette.id_categorie = categorie.id_categorie
WHERE recette.tempsPreparation >=30;


-- 4 Afficher les recettes dont le nom contient le mot « Salade » (peu importe où est situé le mot en question)

SELECT recette.nom, categorie.nomCategorie, recette.tempsPreparation
FROM recette 
JOIN categorie
ON recette.id_categorie = categorie.id_categorie
WHERE recette.nom LIKE '%Salade%';


-- 5- Insérer une nouvelle recette : « Pâtes à la carbonara » dont la durée de réalisation est de 20 min avec les instructions de votre choix. Pensez à alimenter votre base de données en conséquence afin de pouvoir lister les détails de cette recettes (ingrédients)

	INSERT INTO recette (nom, tempsPreparation, instructions, id_categorie) 
	VALUES ('Pâtes à la carbonara', 20,'Faire bouillir les pâtes', 2);
	
	INSERT INTO composant (id_ingredient, id_recette, quantite)
	VALUES (13, LAST_INSERT_ID(),2),(4, LAST_INSERT_ID(),2)


-- supprimer car j'ai rajouter plus ligne de pâtes 
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

SELECT ingredient.nomIngredient, ingredient.prix, ingredient.uniteMesure, composant.quantite
FROM composant
JOIN ingredient ON composant.id_ingredient = ingredient.id_ingredient
WHERE composant.id_recette = 3

-- 10- Ajouter un ingrédient en base de données : Poivre, unité : cuillère à café, prix : 2.5 €

SELECT ingredient.nomIngredient, ingredient.prix, composant.quantitel
FROM composant
JOIN ingredient ON composant.id_ingredient= ingredient.id_ingredient
WHERE composant.id_recette = 3;

-- 11- Modifier le prix de l’ingrédient n°12 (prix à votre convenance)

UPDATE ingredient
SET prix = 3.5
WHERE id_ingredient = 12;

-- 12- Afficher le nombre de recettes par catégories : X entrées, Y plats, Z desserts

SELECT categorie.nomCategorie,
COUNT(recette.id_recette) AS nb_recettes
FROM recette
JOIN categorie ON recette.id_categorie = categorie.id_categorie
GROUP BY categorie.nomCategorie;


-- 13- Afficher les recettes qui contiennent l’ingrédient « Poulet »

SELECT recette.nom
FROM recette
JOIN composant ON recette.id_recette = composant.id_recette
JOIN ingredient ON composant.id_ingredient = ingredient.id_ingredient
WHERE ingredient.nomIngredient ='Poulet';


-- 14- Mettez à jour toutes les recettes en diminuant leur temps de préparation de 5 minutes

UPDATE recette
SET tempsPreparation = tempsPreparation -5;


-- 15- Afficher les recettes qui ne nécessitent pas d’ingrédients coûtant plus de 2€ par unité de mesure



-- 16- Afficher la / les recette(s) les plus rapides à préparer




-- 17- Trouver les recettes qui ne nécessitent aucun ingrédient (par exemple la recette de la tasse d’eau chaude qui consiste à verser de l’eau chaude dans une tasse)