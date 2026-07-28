# ***Application Web JEE pour un Centre de Chirurgie Dentaire***

Application web full-stack pour la gestion d'un centre de chirurgie dentaire (patients, dentistes, rendez-vous, dossiers médicaux), avec un backend Java EE sécurisé et une interface responsive.

---

### 🎓 Projet de fin d'études

Réalisé par **Mohammed Belefqih**

**Supervisé par :** Pr. Zyad Elkhadir

---

## 🎯 Objectif du projet

Concevoir et développer une application permettant la gestion complète d'un centre dentaire : prise de rendez-vous en ligne, gestion des patients et des dentistes, suivi des dossiers médicaux, et authentification sécurisée — le tout avec la plateforme Java EE.

---

## 🛠️ Outils utilisés

**Backend**<br>
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white)
![JSP/Servlets](https://img.shields.io/badge/JSP%2FServlets-Java%20EE-orange?style=for-the-badge)
![Apache Maven](https://img.shields.io/badge/apache%20maven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white)
![Apache Tomcat](https://img.shields.io/badge/apache%20tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black)

**Frontend**<br>
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)
![Bootstrap](https://img.shields.io/badge/bootstrap-%23563D7C.svg?style=for-the-badge&logo=bootstrap&logoColor=white)

**Base de données**<br>
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)

**Autres**<br>
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)

---

## 🔧 Fonctionnalités principales

- 🔐 Authentification sécurisée avec vérification par code OTP envoyé par email
- 👥 Trois espaces dédiés : Administrateur, Dentiste et Patient
- 🧑‍⚕️ Gestion des patients et des dentistes (ajout, modification, suppression)
- 📅 Planification et prise de rendez-vous en ligne
- 🩺 Dossier médical par patient, avec calcul automatique de l'âge à partir de la date de naissance
- 📊 Tableaux de bord avec statistiques
- ❓ FAQ dédiée à chaque type d'utilisateur

---

## 🏗️ Architecture

Le projet suit une architecture **MVC** avec une couche **DAO** pour l'accès aux données :

- **Couche Web** : interface utilisateur avec JSP, complétée par des Servlets pour gérer les requêtes.
- **Couche Métier** : logique applicative (gestion des rendez-vous, des patients, des dentistes...).
- **Couche DAO** : accès aux données via JDBC, pour des échanges fiables avec la base MySQL.

---

## 🚀 Utilisation du projet

Deux façons de lancer le projet, au choix.

### Option 1 — Installation manuelle (Java, Tomcat, MySQL déjà installés)

**Prérequis :**

- [Java JDK 17](https://adoptium.net/)
- [Apache Maven](https://maven.apache.org/download.cgi)
- [Apache Tomcat 9](https://tomcat.apache.org/download-90.cgi)
- [MySQL 8](https://dev.mysql.com/downloads/mysql/)
- [Git](https://git-scm.com/)

**Étapes :**

1. Cloner le projet :
   ```bash
   git clone https://github.com/m-belefqih/dental-center-app.git
   cd dental-center-app
   ```

2. Créer la base de données et importer le schéma :
   ```bash
   mysql -u root -p -e "CREATE DATABASE dental_center_db;"
   mysql -u root -p dental_center_db < dental_center_db.sql
   ```

3. Configurer l'accès à la base et à l'envoi d'emails :
   ```bash
   cp src/main/resources/application.properties.example src/main/resources/application.properties
   ```
   Puis éditez `application.properties` avec vos identifiants MySQL et un [mot de passe d'application Gmail](https://support.google.com/accounts/answer/185833) pour l'envoi des codes OTP.

4. Compiler le projet :
   ```bash
   mvn clean package
   ```

5. Déployer le fichier `.war` généré dans `target/` sur votre serveur Tomcat (dossier `webapps/`), puis démarrer Tomcat.

6. Accéder à l'application via `http://localhost:8080/dental-center-app-0.0.1-SNAPSHOT/` (ou le contexte choisi lors du déploiement).

### Option 2 — 🐳 Avec Docker et Docker Compose

**Prérequis :**

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

**Étapes :**

1. Cloner le projet :
   ```bash
   git clone https://github.com/m-belefqih/dental-center-app.git
   cd dental-center-app
   ```

2. Créer le fichier `.env` à partir du modèle et le compléter (mot de passe MySQL, identifiants Gmail pour l'envoi des codes OTP) :
   ```bash
   cp .env.example .env
   ```

3. Construire les images et démarrer les conteneurs :
   ```bash
   docker compose up --build
   ```

4. Accéder à l'application : [http://localhost:8080/dental-center-app/](http://localhost:8080/dental-center-app/)

5. Pour arrêter l'application :
   ```bash
   docker compose down
   ```
