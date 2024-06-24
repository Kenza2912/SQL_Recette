-- Afficher toutes les recettes disponibles (nom de la recette, catégorie et temps de préparation) triées de façon décroissante sur la durée de réalisation 


SELECT recette.nom, categorie.nomCategorie AS categorie, recette.tempsPreparation 
FROM recette 
JOIN categorie
ON recette.id_categorie = categorie.id_categorie
ORDER BY recette.tempsPreparation DESC;



