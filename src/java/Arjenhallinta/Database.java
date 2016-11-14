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
            ps = conn.prepareStatement("INSERT INTO Users (UserEmail, UserPassword, UserType,"
                    + " UserName, UserSurname, UserAddress, UserPostalcode, UserPostoffice)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, "customer");
            ps.setString(4, "");
            ps.setString(5, "");
            ps.setString(6, "");
            ps.setString(7, "");
            ps.setString(8, "");
            ps.execute();
            
            addedUser = true; //I might refactor this later...

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            closeDatabaseConnections();
            
        }

        return addedUser;
    }
    
    //This feature is still in WIP
    //Idea is that user details are rewritten with information
    //that can not be used to identify certain user.
    //Furthermore, UserIsDeleted is set to TRUE
    //so that when someone is trying to login with deleted
    //account, we can deny that access if UserIsDeleted = TRUE
    public static void removeUser(int UserID) {

        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("UPDATE Users SET UserEmail=UserID, UserName=?, UserSurname=?,"
                    + " UserAddress=?, UserPostalcode=?, UserPostoffice=?, UserIsDeleted=? WHERE UserID=?");
            ps.setString(1, "");
            ps.setString(2, "");
            ps.setString(3, "");
            ps.setString(4, "");
            ps.setString(5, "");
            ps.setBoolean(6, true);
            ps.setInt(7, UserID);
            
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            closeDatabaseConnections();
            
        }

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
    
    public static int getLargestID() {
        
        int userID = 0;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT MAX(UserID) FROM Users");
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
    
    public static String getUserEmail(int userID) {
        
        String userEmail = "";
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT UserEmail FROM Users WHERE UserID=?");
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            
            if(rs.next()){
                userEmail = rs.getString(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            closeDatabaseConnections();
            
        }
        
        return userEmail;
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
    
    public static String getUserTypeUsingID(int userID) {
        
        String userType = "";
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT UserType FROM Users WHERE UserID=?");
            ps.setInt(1, userID);
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
    
    public static String getUserNameUsingID(int userID) {
        
        String userName = "";
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT UserName FROM Users WHERE UserID=?");
            ps.setInt(1, userID);
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
    
    public static String getUserSurnameUsingID(int userID) {
        
        String userSurname = "";
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT UserSurname FROM Users WHERE UserID=?");
            ps.setInt(1, userID);
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
    
    public static void updateUserPassword(String newPassword, String email) {
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("UPDATE Users SET UserPassword=? WHERE UserEmail=?");
            ps.setString(1, newPassword);
            ps.setString(2, email);
            
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
