package com.config;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Charge la configuration de l'application depuis le fichier
 * application.properties place dans src/main/resources (donc dans le
 * classpath : WEB-INF/classes une fois l'application deployee).
 *
 * Ce fichier est exclu de git (.gitignore) : les identifiants ne sont
 * jamais commites. Un modele application.properties.example est fourni.
 *
 * Une variable d'environnement portant le meme nom que la cle, en
 * majuscules et avec des underscores (ex : db.password -> DB_PASSWORD),
 * est prioritaire sur le fichier.
 *
 * @author BELEFQIH MOHAMMED
 */
public class AppConfig {

	private static final Properties properties = new Properties();

	static {
		try (InputStream input = AppConfig.class.getClassLoader()
				.getResourceAsStream("application.properties")) {

			if (input != null) {
				properties.load(input);
			} else {
				System.err.println("AppConfig : application.properties introuvable dans le classpath ! "
						+ "Copiez application.properties.example vers application.properties.");
			}

		} catch (IOException e) {
			System.err.println("AppConfig : erreur de lecture de application.properties");
			e.printStackTrace();
		}
	}

	private AppConfig() {
	}

	/**
	 * Retourne la valeur d'une cle de configuration.
	 * La variable d'environnement equivalente (DB_PASSWORD pour db.password)
	 * est prioritaire si elle est definie.
	 */
	public static String get(String key) {
		String envKey = key.toUpperCase().replace('.', '_');
		String envValue = System.getenv(envKey);

		if (envValue != null && !envValue.isEmpty()) {
			return envValue;
		}

		return properties.getProperty(key);
	}

}
