/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Arjenhallinta;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Jaakko
 */
public class Database {
    
    private static final String dbUsername = "root";
    private static final String dbPassword = "realforce";

    public static boolean addUser(String email, String password) {
        
        boolean addedUser = false;

        try {

            //loading drivers for mysql
            Class.forName("com.mysql.jdbc.Driver");

            //creating connection with the database 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/arjenhallinta", "root", "realforce");
            PreparedStatement ps = con.prepareStatement("INSERT INTO users (email, password) VALUES (?, ?)");
            ps.setString(1, email);
            ps.setString(2, password);
            ps.execute();
            
            con.close();
            addedUser = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return addedUser;
    }
    
    public static boolean authenticateUser(String email, String password) {

        boolean grantAccess = false;

        try {
            System.out.println("DATABASE AUTH");
            //loading drivers for mysql
            Class.forName("com.mysql.jdbc.Driver");

            //creating connection with the database 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/arjenhallinta", "root", "realforce");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            grantAccess = rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return grantAccess;

    }

    public static boolean userExists(String email) {
        
        boolean userExists = false;
        
        try {

            //loading drivers for mysql
            Class.forName("com.mysql.jdbc.Driver");

            //creating connection with the database 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/arjenhallinta", "root", "realforce");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            
            userExists = rs.next();
            
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return userExists;
    }
    
}
