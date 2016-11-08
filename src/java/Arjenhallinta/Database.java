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
    
    public static int getUserID(String email) {
        
        int userID = 0;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT UserID FROM Users WHERE UserEmail=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            
            if(rs.next()){
                userID = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            closeDatabaseConnections();
            
        }
        
        return userID;
    }
    
    public static String getUserName(String email) {
        
        String userName = "";
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT UserName FROM Users WHERE UserEmail=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            
            if(rs.next()){
                userName = rs.getString(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            closeDatabaseConnections();
            
        }
        
        return userName;
    }
    
    public static String getUserSurname(String email) {
        
        String userSurname = "";
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT UserSurname FROM Users WHERE UserEmail=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            
            if(rs.next()){
                userSurname = rs.getString(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            closeDatabaseConnections();
            
        }
        
        return userSurname;
    }
    
    public static String getUserAddress(String email) {
        
        String userAddress = "";
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT UserAddress FROM Users WHERE UserEmail=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            
            if(rs.next()){
                userAddress = rs.getString(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            closeDatabaseConnections();
            
        }
        
        return userAddress;
    }
    
    public static String getUserPostalcode(String email) {
        
        String userPostalcode = "";
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT UserPostalcode FROM Users WHERE UserEmail=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            
            if(rs.next()){
                userPostalcode = rs.getString(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            closeDatabaseConnections();
            
        }
        
        return userPostalcode;
    }
    
    public static String getUserPostoffice(String email) {
        
        String userPostoffice = "";
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT UserPostoffice FROM Users WHERE UserEmail=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            
            if(rs.next()){
                userPostoffice = rs.getString(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            closeDatabaseConnections();
            
        }
        
        return userPostoffice;
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
                    
    public static void updateUserDetails(String userName, String userSurname,
            String userAddress, String userPostalcode, String userPostoffice, String userEmail) {
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("UPDATE Users SET UserName=?, UserSurname=?,"
                    + " UserAddress=?, UserPostalcode=?, UserPostoffice=? WHERE UserEmail=?");
            ps.setString(1, userName);
            ps.setString(2, userSurname);
            ps.setString(3, userAddress);
            ps.setString(4, userPostalcode);
            ps.setString(5, userPostoffice);
            ps.setString(6, userEmail);
            
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            closeDatabaseConnections();
            
        }
        
    }
    
    public static String getFrontPageContent(int content) {
        
        String contentToBeRendered = "";
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT PageContent FROM Frontpage WHERE PageID=?");
            ps.setInt(1, content);
            rs = ps.executeQuery();
            
            if(rs.next()){
                contentToBeRendered = rs.getString(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            closeDatabaseConnections();
            
        }
        
        return contentToBeRendered;
    }
    
    public static void updateFrontPageContent(String content, int id) {
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("UPDATE Frontpage SET Pagecontent=? WHERE PageID=?");
            ps.setString(1, content);
            ps.setInt(2, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            closeDatabaseConnections();
            
        }
        
    }
    
    public static void closeDatabaseConnections(){
        try { rs.close(); } catch (Exception e) { /* ignoring */ }
        try { ps.close(); } catch (Exception e) { /* ignoring */ }
        try { conn.close(); } catch (Exception e) { /* ignoring */ }
        
    }
    
}
