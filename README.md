# ***Application Web JEE pour un Centre de Chirurgie Dentaire***

Application web full-stack pour la gestion d'un centre de chirurgie dentaire (patients, dentistes, rendez-vous, dossiers médicaux), avec un backend Java EE sécurisé et une interface responsive.

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
![AngularJS 1.6](https://img.shields.io/badge/AngularJS%201.6-E23237?style=for-the-badge&logo=angularjs&logoColor=white)
![Google Charts](https://img.shields.io/badge/Google%20Charts-4285F4?style=for-the-badge)

**Base de données**<br>
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)

**Conception & maquettage**<br>
![StarUML](https://img.shields.io/badge/StarUML-4B0082?style=for-the-badge)
![draw.io](https://img.shields.io/badge/draw.io-F08705?style=for-the-badge&logo=diagramsdotnet&logoColor=white)
![Balsamiq Wireframes](https://img.shields.io/badge/Balsamiq%20Wireframes-CE472A?style=for-the-badge)

**Environnement de développement**<br>
![Eclipse IDE for Java EE Developers](https://img.shields.io/badge/Eclipse%20IDE-2C2255?style=for-the-badge&logo=eclipseide&logoColor=white)
![VS Code](https://img.shields.io/badge/VS%20Code-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white)
![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white)

**Autres**<br>
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)

---

## 🔧 Fonctionnalités principales

- 🔐 Authentification et inscription sécurisée avec vérification par code OTP envoyé par email
- 👥 Trois espaces dédiés : Administrateur, Dentiste et Patient
- 🧑‍⚕️ Gestion des patients et des dentistes (ajout, modification, suppression)
- 📅 Planification et prise de rendez-vous en ligne
- 🩺 Dossier médical par patient, avec ses rendez-vous
- 👤 Consultation du profil utilisateur
- 📊 Tableaux de bord avec statistiques
- ❓ FAQ dédiée à chaque type d'utilisateur

---

## 🖼️ Interfaces de l'application

<table>
  <tr>
    <td align="center"><img src="images/Home.png" width="420"/><br/><b>Accueil</b></td>
    <td align="center"><img src="images/Login.png" width="420"/><br/><b>Connexion</b></td>
  </tr>
  <tr>
    <td align="center"><img src="images/Dashboard.png" width="420"/><br/><b>Tableau de bord (Admin)</b></td>
    <td align="center"><img src="images/Patients.png" width="420"/><br/><b>Liste des patients</b></td>
  </tr>
  <tr>
    <td align="center"><img src="images/Appointments.png" width="420"/><br/><b>Prise de rendez-vous</b></td>
    <td align="center"><img src="images/Medical Record.png" width="420"/><br/><b>Dossier médical du patient</b></td>
  </tr>
  <tr>
    <td align="center"><img src="images/Profil.png" width="420"/><br/><b>Profil utilisateur</b></td>
    <td align="center"><img src="images/History.png" width="420"/><br/><b>Historique de rendez-vous</b></td>
  </tr>
  <tr>
    <td align="center"><img src="images/My-RDV.png" width="420"/><br/><b>Rendez-vous de dentiste</b></td>
    <td align="center"><img src="images/FAQ.png" width="420"/><br/><b>FAQ</b></td>
</table>


---

## 🏗️ Architecture MVC

![Architecture du projet](images/architecture.png)

L'application est structurée en trois couches, avec séparation stricte des responsabilités :

- **Couche Présentation** : Servlets (contrôleurs) et JSP (vues), point d'entrée des requêtes utilisateur.
- **Couche Métier** : logique applicative de l'application, appelée par les Servlets.
- **Couche DAO** : accès aux données via JDBC, exécution des opérations CRUD sur la base MySQL.

---

## 🚀 Utilisation du projet

Deux façons de lancer le projet, au choix.

### Option 1 — ☕ Manuellement

**Prérequis :**

- [Java JDK 17](https://adoptium.net/)
- [Eclipse IDE for Enterprise Java Developers](https://www.eclipse.org/downloads/packages/release/kepler/sr2/eclipse-ide-java-ee-developers)
- [Apache Tomcat 9](https://tomcat.apache.org/download-90.cgi)
- [MySQL 8](https://dev.mysql.com/downloads/mysql/)
- [Git](https://git-scm.com/)

**Étapes :**

1. Cloner le projet :
   ```bash
   git clone https://github.com/m-belefqih/dental-center-app.git
   cd dental-center-app
   ```

2. Créer une base de données MySQL nommée `dental_center_db`, puis importer son schéma à partir du fichier [dental_center_db.sql](dental_center_db.sql) situé à la racine du projet.

3. Créer le fichier de configuration : dans `src/main/resources`, copier le fichier `application.properties.example` vers un nouveau fichier `application.properties`, puis y renseigner vos identifiants MySQL et un [mot de passe d'application Gmail](https://support.google.com/accounts/answer/185833) pour l'envoi des codes OTP.

4. Importer le projet dans Eclipse (`File > Import > Existing Maven Projects`), ajouter un serveur Tomcat 9 dans l'onglet **Servers** (clic droit > New > Server), puis démarrer le projet sur ce serveur (`Run As > Run on Server`).

5. Accéder à l'application via `http://localhost:8080/dental-center-app/`.

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

---

## 🎓 Contexte académique

Ce projet a été réalisé dans le cadre du Projet de Fin d'Études (PFE), en vue de l'obtention du Diplôme de Licence Fondamentale en Sciences Mathématiques et Informatiques (LF-SMI).

**Réalisé par :** Mohammed Belefqih 
**Supervisé par :** Pr. Zyad Elkhadir

Le travail a couvert la **conception**, le **maquettage** et le **développement** de l'application.
