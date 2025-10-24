package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * This class is responsible for establishing a connection to the MySQL database.
 * It uses JDBC (Java Database Connectivity) to connect to the database.
 * Make sure to include the MySQL JDBC Driver in your project dependencies.
 * 
 * @author BELEFQIH MOHAMMED
 * @version 1.0
 */

public class DBConnexion {
	
	private static Connection connexion = null;
	
	public static Connection getConnection() {
		
		System.out.println("Start getConnection ...");  // Logger : Log4j
		
		try {
			String url = "jdbc:mysql://localhost:3306/dental_center_db?useSSL=false";
			String login = "";
			String passwd = "";
			
			// Load JDBC Driver
			Class.forName("com.mysql.cj.jdbc.Driver"); // MySql Driver Class Name
			
			// Get connection to database
			connexion = DriverManager.getConnection(url, login, passwd);
			
			// Condition to make sure connection is established.
			if (connexion != null) {
				System.out.println("Connection successful !");
			} else {
				System.out.println("Connection failure !");
			}
			
			// Return the established connection
			return connexion;
			
		} catch (ClassNotFoundException | SQLException e) {  // You can replace it by Exception
			System.out.println("Connexion failure ... " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	
	public static void main(String[] args) {
		DBConnexion.getConnection();
	}
}