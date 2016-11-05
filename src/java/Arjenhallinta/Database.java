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
    
    private static final String dbDriver = "com.mysql.jdbc.Driver";
    private static final String dbAddress = "jdbc:mysql://localhost:3306/arjenhallinta";
    private static final String dbUsername = "root";
    private static final String dbPassword = "realforce";
    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;

    public static boolean addUser(String email, String password) {
        
        boolean addedUser = false;

        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("INSERT INTO Users (UserEmail, UserPassword, UserType) VALUES (?, ?, 1)");
            ps.setString(1, email);
            ps.setString(2, password);
            ps.execute();
            
            addedUser = true; //I might refactor this later...

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            closeDatabaseConnections();
            
        }

        return addedUser;
    }
    
    public static boolean authenticateUser(String email, String password) {

        boolean grantAccess = false;

        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT * FROM Users WHERE UserEmail=? and UserPassword=?");
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            grantAccess = rs.next();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            closeDatabaseConnections();
            
        }

        return grantAccess;

    }

    public static boolean userExists(String email) {
        
        boolean userExists = false;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT * FROM Users WHERE UserEmail=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            
            userExists = rs.next();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            closeDatabaseConnections();
            
        }
        
        return userExists;
    }
    
    public static String userType(String email) {
        
        String userType = "";
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT UserType FROM Users WHERE UserEmail=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            
            if(rs.next()){
                userType = rs.getString(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            closeDatabaseConnections();
            
        }
        
        return userType;
    }
    
    public static void closeDatabaseConnections(){
        try { rs.close(); } catch (Exception e) { /* ignoring */ }
        try { ps.close(); } catch (Exception e) { /* ignoring */ }
        try { conn.close(); } catch (Exception e) { /* ignoring */ }
        
    }
    
}
