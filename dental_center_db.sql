-- phpMyAdmin SQL
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 30 mai 2024 à 19:41
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13
--
-- Auteur : Mohammed Belefqih

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- ---------------------------------------------------------------------------------

--
-- Base de données :  `dental_center_db`
-- 

CREATE DATABASE IF NOT EXISTS dental_center_db;

USE dental_center_db;

-- ----------------------------------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
    `id` int NOT NULL AUTO_INCREMENT UNIQUE,
    `email` varchar(100) DEFAULT NULL,
    `password` varchar(100) DEFAULT NULL,
    `cin` varchar(100) DEFAULT NULL,
    `prenom` varchar(100) DEFAULT NULL,
    `nom` varchar(100) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `cin`, `prenom`, `nom`) VALUES
(1, 'admin@gmail.com', 'admin', 'LK6HQ81', 'Mohammed', 'Belefqih');

-- ---------------------------------------------------------------------------------

--
-- Structure de la table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
    `id` int NOT NULL AUTO_INCREMENT UNIQUE,
    `email` varchar(100) DEFAULT NULL,
    `password` varchar(100) DEFAULT NULL,
    `cin` varchar(100) DEFAULT NULL,
    `prenom` varchar(100) DEFAULT NULL,
    `nom` varchar(100) DEFAULT NULL,
    `birthDate` varchar(100) DEFAULT NULL,
    `sexe` varchar(100) DEFAULT NULL,
    `telephone` varchar(100) DEFAULT NULL,
    `adresse` varchar(100) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`id`, `email`, `password`, `cin`, `prenom`, `nom`, `birthDate`, `sexe`, `telephone`, `adresse`) VALUES
(1, 'omar@gmail.com', 'omar1234', 'LB6TY29', 'Omar', 'El Khayatti', '2002-12-01', 'Homme', '07 72 05 21 27', 'HAY ANDALOUS RUE 12'),
(2, 'amane@gmail.com', 'amane1234', 'JHT9I', 'Amane', 'Stitou', '1997-07-14', 'Femme', '06 44 23 21 10', 'HAY ANDALOUS RUE 14'),
(3, 'ahmed@gmail.com', 'ahmed1234', 'YJIO14', 'Ahmed', 'Hlimi', '2000-09-17', 'Homme', '07 89 12 43 33', 'HAY ANDALOUS RUE 21'),
(4, 'chaimae@gmail.com', 'chaimae1234', 'JK120B', 'Chaimae', 'Saloui', '1999-02-11', 'Femme', '07 77 77 55 33', 'SOUK SBAT RUE 2'),
(5, 'badr@gmail.com', 'badr1234', 'Q3JN0A', 'Badr', 'Slimani', '2004-10-07', 'Homme', '06 66 12 23 35', 'HAY LALA RAHMA RUE 13');

-- ---------------------------------------------------------------------------------

--
-- Structure de la table `dentiste`
--

DROP TABLE IF EXISTS `dentiste`;
CREATE TABLE IF NOT EXISTS `dentiste` (
    `id` int NOT NULL AUTO_INCREMENT UNIQUE,
    `email` varchar(100) DEFAULT NULL,
    `password` varchar(100) DEFAULT NULL,
    `cin` varchar(100) DEFAULT NULL,
    `prenom` varchar(100) DEFAULT NULL,
    `nom` varchar(100) DEFAULT NULL,
    `specialty` varchar(100) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `dentiste`
--

INSERT INTO `dentiste` (`id`, `email`, `password`, `cin`, `prenom`, `nom`, `specialty`) VALUES
(1, 'hamza@gmail.com', 'hamza1234', 'LQJ2X4', 'Hamza', 'Kentri', 'Orthodontie'),
(2, 'asmae@gmail.com', 'asmae1234', 'BH83SD', 'Asmae', 'Zyani', 'dentisterie-esthétique'),
(3, 'aymane@gmail.com', 'aymane1234', 'LP12OF', 'Aymane', 'Mahmoudi', 'Parodontologie');

-- ---------------------------------------------------------------------------------

--
-- Structure de la table `plannification`
--

DROP TABLE IF EXISTS `plannification`;
CREATE TABLE IF NOT EXISTS `plannification` (
    `id` int NOT NULL AUTO_INCREMENT UNIQUE,
    `jour` varchar(100) DEFAULT NULL,
    `from_T` varchar(150) DEFAULT NULL,
    `to_T` varchar(150) DEFAULT NULL,
    `id_dentiste` int DEFAULT NULL,
    `id_admin` int DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `plannification_fk1` (`id_dentiste`),
    KEY `plannification_fk2` (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `plannification`
--

INSERT INTO `plannification` (`id`, `jour`, `from_T`, `to_T`, `id_dentiste`, `id_admin`) VALUES
(1, '2024-07-12', '08h00', '12h00', 2, 1),
(2, '2024-07-25', '14h00', '18h00', 3, 1),
(3, '2024-08-05', '08h00', '12h00', 1, 1);

-- ---------------------------------------------------------------------------------

--
-- Structure de la table `rendezvous`
--

DROP TABLE IF EXISTS `rendezvous`;
CREATE TABLE IF NOT EXISTS `rendezvous` (
    `id` int NOT NULL AUTO_INCREMENT UNIQUE,
    `dateRDV` varchar(100) DEFAULT NULL,
    `motifRDV` varchar(150) DEFAULT NULL,
    `actes` varchar(150) DEFAULT NULL,
    `examensRadio` varchar(150) DEFAULT NULL,
    `traitements` varchar(150) DEFAULT NULL,
    `id_patient` int DEFAULT NULL,
    `id_plannification` int DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `rendezvous_fk1` (`id_patient`),
    KEY `rendezvous_fk2` (`id_plannification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `rendezvous`
--

INSERT INTO `rendezvous` (`id`, `dateRDV`, `motifRDV`, `actes`, `examensRadio`, `traitements`, `id_patient`, `id_plannification`) VALUES
(1, '2024-07-12', 'Consultation', NULL, NULL, NULL, 2, 1),
(2, '2024-07-25', 'Douleur dentaire', 'Carie profonde détectée', 'Présence de carie profonde sur la dent 18', 'Doliprane', 5, 2),
(3, '2024-08-05', 'Douleur dentaire', 'Carie profonde détectée', 'Présence de carie profonde sur la dent 10', 'Doliprane', 2, 3);

-- ---------------------------------------------------------------------------------

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `plannification`
--
ALTER TABLE `plannification`
  ADD CONSTRAINT `plannification_fk1` FOREIGN KEY (`id_dentiste`) REFERENCES `dentiste` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `plannification_fk2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  ADD CONSTRAINT `rendezvous_fk1` FOREIGN KEY (`id_patient`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rendezvous_fk2` FOREIGN KEY (`id_plannification`) REFERENCES `plannification` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;