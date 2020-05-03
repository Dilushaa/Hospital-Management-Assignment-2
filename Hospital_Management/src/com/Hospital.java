package com;

import java.sql.Connection;
import java.sql.DriverManager;

public class Hospital {

	public Connection connect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver"); 
			con= DriverManager.getConnection("jdbc:mysql://127.0.0.1/hospital","root", ""); 
			
			//for testing purposes
			System.out.print("Successfully connected");
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
			
		}
		
		return con;
		
		
	}
	
	
	
}
