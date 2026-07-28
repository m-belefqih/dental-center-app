# Stage 1 : construire l'application avec Maven et JDK 17
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

# Copier le fichier pom.xml et telecharger les dependances Maven
COPY pom.xml .
RUN mvn -B dependency:go-offline

# Copier le reste des sources et construire le WAR
COPY src ./src
RUN mvn -B clean package -DskipTests

# Stage 2 : exécuter l'application avec Tomcat et JDK 17
FROM tomcat:9.0-jdk17-temurin

# Supprimer l'application par défaut et copier le WAR construit dans le répertoire webapps de Tomcat
# Deploye sous /dental-center-app/ (et non a la racine) car plusieurs JSP
# contiennent des liens/formulaires en dur vers "/dental-center-app/..."
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY --from=build /app/target/dental-center-app-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/dental-center-app.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
