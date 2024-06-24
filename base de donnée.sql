-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour recipe_demo
CREATE DATABASE IF NOT EXISTS `recipe_demo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recipe_demo`;

-- Listage de la structure de table recipe_demo. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recipe_demo.categorie : ~3 rows (environ)
INSERT INTO `categorie` (`id_categorie`, `nomCategorie`) VALUES
	(1, 'Entrée'),
	(2, 'Plat'),
	(3, 'Dessert');

-- Listage de la structure de table recipe_demo. composant
CREATE TABLE IF NOT EXISTS `composant` (
  `quantite` float NOT NULL,
  `id_ingredient` int NOT NULL,
  `id_recette` int NOT NULL,
  KEY `id_ingredient` (`id_ingredient`),
  KEY `id_recette` (`id_recette`),
  CONSTRAINT `FK_composant_ingredient` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`),
  CONSTRAINT `FK_composant_recette` FOREIGN KEY (`id_recette`) REFERENCES `recette` (`id_recette`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recipe_demo.composant : ~4 rows (environ)
INSERT INTO `composant` (`quantite`, `id_ingredient`, `id_recette`) VALUES
	(8, 3, 1),
	(5, 4, 2),
	(5, 9, 2),
	(5, 7, 2);

-- Listage de la structure de table recipe_demo. ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `nomIngredient` varchar(100) NOT NULL DEFAULT '0',
  `uniteMesure` varchar(100) NOT NULL DEFAULT '0',
  `prix` float NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recipe_demo.ingredient : ~12 rows (environ)
INSERT INTO `ingredient` (`id_ingredient`, `nomIngredient`, `uniteMesure`, `prix`) VALUES
	(1, 'Boeuf', 'g', 10),
	(2, 'Oeuf', 'unité', 0.5),
	(3, 'Chocolat', 'g', 5),
	(4, 'Poulet', 'g', 10),
	(5, 'Farine', 'g', 2),
	(6, 'Poivre', 'g', 1),
	(7, 'Tomate', 'kg', 4),
	(8, 'Lait', 'kg', 2),
	(9, 'Laitue', 'kg', 1.5),
	(10, 'Pomme', 'kg', 4),
	(11, 'Fraise', 'kg', 7),
	(12, 'Banane', 'kg', 4);

-- Listage de la structure de table recipe_demo. recette
CREATE TABLE IF NOT EXISTS `recette` (
  `id_recette` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `tempsPreparation` int NOT NULL DEFAULT '0',
  `instructions` text,
  `id_categorie` int NOT NULL,
  PRIMARY KEY (`id_recette`),
  KEY `id_categorie` (`id_categorie`),
  CONSTRAINT `FK_recette_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recipe_demo.recette : ~2 rows (environ)
INSERT INTO `recette` (`id_recette`, `nom`, `tempsPreparation`, `instructions`, `id_categorie`) VALUES
	(1, 'Gâteau au chocolat', 30, 'Mélanger les ingrédients', 3),
	(2, 'Salade césar', 10, 'Coupez le poulet et les tomates ', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
