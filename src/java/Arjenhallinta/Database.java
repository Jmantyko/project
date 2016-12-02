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
import java.util.ArrayList;

/**
 *
 * @author Jaakko
 */
public class Database {
    
    private static final String dbDriver = "com.mysql.jdbc.Driver";
    private static final String dbAddress = "jdbc:mysql://localhost:3306/arjenhallinta";
    private static final String dbUsername = "root";
    private static final String dbPassword = "realforce";

    public static void addUser(String email, String password, String name, String surname, String phonenumber,
            String address, String postalcode, String postoffice) {
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("INSERT INTO Users (UserEmail, UserPassword, UserType,"
                    + " UserName, UserSurname, UserPhonenumber,"
                    + " UserAddress, UserPostalcode, UserPostoffice)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, "customer");
            ps.setString(4, name);
            ps.setString(5, surname);
            ps.setString(6, phonenumber);
            ps.setString(7, address);
            ps.setString(8, postalcode);
            ps.setString(9, postoffice);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
    }
    
    public static void addUserDetails(int userID) {
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("INSERT INTO Details (UserID) VALUES (?)");
            ps.setInt(1, userID);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
    }
    
    public static void deleteUser(int UserID) {
        
        //Idea is that user details are rewritten with empty information
        //that can not be used to identify certain user.
        //Furthermore, UserIsDeleted is set to TRUE
        //so that when someone is trying to login with deleted
        //account, we can deny that access if UserIsDeleted = TRUE
        
        String stringUserID = Integer.toString(UserID);
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("UPDATE Users SET UserEmail=?, UserPassword=?, UserName=?, UserSurname=?,"
                    + " UserPhonenumber=?, UserAddress=?, UserPostalcode=?, UserPostoffice=?,"
                    + " UserIsDeleted=? WHERE UserID=?");
            ps.setString(1, stringUserID);
            ps.setString(2, "");
            ps.setString(3, "");
            ps.setString(4, "");
            ps.setString(5, "");
            ps.setString(6, "");
            ps.setString(7, "");
            ps.setString(8, "");
            ps.setBoolean(9, true);
            ps.setInt(10, UserID);
            
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }

    }
    
    public static boolean authenticateUser(String email, String password) {

        boolean grantAccess = false;
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT * FROM Users WHERE UserEmail=? AND"
                    + " UserPassword=? AND UserIsDeleted=FALSE");
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            grantAccess = rs.next();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }

        return grantAccess;

    }

    public static boolean userExists(String email) {
        
        boolean userExists = false;
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
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
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return userExists;
    }
    
    public static int getLargestID() {
        
        int userID = 0;
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
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
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return userID;
    }
    
    public static int getUserID(String email) {
        
        int userID = 0;
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
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
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return userID;
    }
    
    public static String getUserEmail(int userID) {
        
        String userEmail = "";
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
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
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return userEmail;
    }
    
    public static String getUserName(String email) {
        
        String userName = "";
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
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
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return userName;
    }
    
    public static String getUserSurname(String email) {
        
        String userSurname = "";
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
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
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return userSurname;
    }
    
     public static String getUserPhonenumber(String email) {
        
        String userPhonenumber = "";
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT UserPhonenumber FROM Users WHERE UserEmail=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            
            if(rs.next()){
                userPhonenumber = rs.getString(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return userPhonenumber;
    }
    
    public static String getUserAddress(String email) {
        
        String userAddress = "";
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
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
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return userAddress;
    }
    
    public static String getUserPostalcode(String email) {
        
        String userPostalcode = "";
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
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
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return userPostalcode;
    }
    
    public static String getUserPostoffice(String email) {
        
        String userPostoffice = "";
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
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
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return userPostoffice;
    }
    
    public static String userType(String email) {
        
        String userType = "";
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
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
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return userType;
    }
    
    public static String getUserTypeUsingID(int userID) {
        
        String userType = "";
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
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
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return userType;
    }
    
    public static String getUserNameUsingID(int userID) {
        
        String userName = "";
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
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
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return userName;
    }
    
    public static String getUserSurnameUsingID(int userID) {
        
        String userSurname = "";
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
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
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return userSurname;
    }
    
    public static ArrayList<Customer> getCustomers() {
        
        ArrayList customers = new ArrayList();
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT UserID, UserEmail, UserName, UserSurname, "
                    + "UserPhonenumber, UserAddress, UserPostalcode, UserPostoffice, UserActivityDate, UserActivityEvent FROM Users WHERE"
                    + "(UserType='customer' AND UserIsDeleted=FALSE)");
            rs = ps.executeQuery();

            while (rs.next()) {
                customers.add(new Customer(rs.getInt("UserID"), rs.getString("UserEmail"),
                        rs.getString("UserName"), rs.getString("UserSurname"), rs.getString("UserPhonenumber"),
                rs.getString("UserAddress"), rs.getString("UserPostalcode"), rs.getString("UserPostoffice"),
                        rs.getString("UserActivityDate"), rs.getString("UserActivityEvent")));
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return customers;
    }
    
    public static ArrayList<Customer> getCustomersByDate() {
        
        ArrayList customers = new ArrayList();
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT UserID, UserEmail, UserName, UserSurname, "
                    + "UserPhonenumber, UserAddress, UserPostalcode, UserPostoffice, UserActivityDate, UserActivityEvent FROM Users WHERE"
                    + "(UserType='customer' AND UserIsDeleted=FALSE) ORDER BY UserActivityDate DESC");
            rs = ps.executeQuery();

            while (rs.next()) {
                customers.add(new Customer(rs.getInt("UserID"), rs.getString("UserEmail"),
                        rs.getString("UserName"), rs.getString("UserSurname"), rs.getString("UserPhonenumber"),
                rs.getString("UserAddress"), rs.getString("UserPostalcode"), rs.getString("UserPostoffice"),
                        rs.getString("UserActivityDate"), rs.getString("UserActivityEvent")));
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return customers;
    }
    
    public static boolean activeTaskExist(int taskTypeID, int userID) {
        
        String taskID = "";
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT TaskID FROM Tasks WHERE TaskTypeID=? AND UserID=? AND TaskIsActive=TRUE");
            ps.setInt(1, taskTypeID);
            ps.setInt(2, userID);
            rs = ps.executeQuery();
            
            while (rs.next()){
                taskID = rs.getString(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        //If taskID was empty we know that there were not same task as active
        //hence we can return false. If taskID was not empty, that means it contains
        //the id of the task that was similar and active which means we return true.
        if("".equals(taskID)){
            return false;
        }else{
            return true;
        }
    }
    
    public static void openNewTask(int taskTypeID, int userID) {
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("INSERT INTO Tasks (TaskTypeID, UserID) VALUES (?, ?)");
            ps.setInt(1, taskTypeID);
            ps.setInt(2, userID);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
    }
    
    public static void closeTask(int taskID) {
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("UPDATE Tasks SET TaskIsClosed=TRUE, TaskIsActive=FALSE WHERE TaskID=?");
            ps.setInt(1, taskID);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
    }
    
    public static ArrayList<Memo1> getTaskMemos1(int taskID) {
        
        ArrayList memos = new ArrayList();
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT MemoID, MemoTime, MemoDoing, MemoSuojaPercentage,"
                    + " MemoTehtPercentage FROM Memos WHERE TaskID=?");
            ps.setInt(1, taskID);
            rs = ps.executeQuery();

            while (rs.next()) {
                memos.add(new Memo1(rs.getInt("MemoID"), rs.getString("MemoTime"),
                        rs.getString("MemoDoing"), rs.getString("MemoSuojaPercentage"),
                        rs.getString("MemoTehtPercentage")));
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return memos;
    }
    
    public static ArrayList<Memo2> getTaskMemos2(int taskID) {
        
        ArrayList memos = new ArrayList();
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT MemoID, MemoTime, MemoDoing, MemoPositivePercentage,"
                    + " MemoNegativePercentage FROM Memos WHERE TaskID=?");
            ps.setInt(1, taskID);
            rs = ps.executeQuery();

            while (rs.next()) {
                memos.add(new Memo2(rs.getInt("MemoID"), rs.getString("MemoTime"),
                        rs.getString("MemoDoing"), rs.getString("MemoPositivePercentage"),
                        rs.getString("MemoNegativePercentage")));
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return memos;
    }
    
    public static ArrayList<Memo2> getTaskMemos3(int taskID) {
        
        ArrayList memos = new ArrayList();
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT MemoID, MemoTime, MemoDoing, MemoPositivePercentage,"
                    + " MemoNegativePercentage, MemoTehtPercentage FROM Memos WHERE TaskID=?");
            ps.setInt(1, taskID);
            rs = ps.executeQuery();

            while (rs.next()) {
                memos.add(new Memo3(rs.getInt("MemoID"), rs.getString("MemoTime"),
                        rs.getString("MemoDoing"), rs.getString("MemoPositivePercentage"),
                        rs.getString("MemoNegativePercentage"), rs.getString("MemoTehtPercentage")));
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return memos;
    }
    
    public static void updateMemo1(String memoID, String memoTime,
                String memoDoing, String memoSuojaPercentage, String memoTehtPercentage) {
        
        int intMemoID = Integer.parseInt(memoID);
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("UPDATE Memos SET MemoTime=?, MemoDoing=?,"
                    + " MemoSuojaPercentage=?, MemoTehtPercentage=? WHERE MemoID=?");
            ps.setString(1, memoTime);
            ps.setString(2, memoDoing);
            ps.setString(3, memoSuojaPercentage);
            ps.setString(4, memoTehtPercentage);
            ps.setInt(5, intMemoID);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
    }
    
    public static void addNewMemo1(String memoTime, String memoDoing,
            String memoSuojaPercentage, String memoTehtPercentage, String taskID) {
        
        int intTaskID = Integer.parseInt(taskID);
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("INSERT INTO Memos (TaskID, MemoTime, MemoDoing,"
                    + " MemoSuojaPercentage, MemoTehtPercentage) VALUES (?, ?, ?, ?, ?)");
            ps.setInt(1, intTaskID);
            ps.setString(2, memoTime);
            ps.setString(3, memoDoing);
            ps.setString(4, memoSuojaPercentage);
            ps.setString(5, memoTehtPercentage);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
    }
    
    public static void updateMemo2(String memoID, String memoTime,
                String memoDoing, String memoPositivePercentage, String memoNegativePercentage) {
        
        int intMemoID = Integer.parseInt(memoID);
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("UPDATE Memos SET MemoTime=?, MemoDoing=?,"
                    + " MemoPositivePercentage=?, MemoNegativePercentage=? WHERE MemoID=?");
            ps.setString(1, memoTime);
            ps.setString(2, memoDoing);
            ps.setString(3, memoPositivePercentage);
            ps.setString(4, memoNegativePercentage);
            ps.setInt(5, intMemoID);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
    }
    
    public static void addNewMemo2(String memoTime, String memoDoing,
            String memoPositivePercentage, String memoNegativePercentage, String taskID) {
        
        int intTaskID = Integer.parseInt(taskID);
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("INSERT INTO Memos (TaskID, MemoTime, MemoDoing,"
                    + " MemoPositivePercentage, MemoNegativePercentage) VALUES (?, ?, ?, ?, ?)");
            ps.setInt(1, intTaskID);
            ps.setString(2, memoTime);
            ps.setString(3, memoDoing);
            ps.setString(4, memoPositivePercentage);
            ps.setString(5, memoNegativePercentage);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
    }
    
    public static void updateMemo3(String memoID, String memoTime,
                String memoDoing, String memoPositivePercentage, String memoNegativePercentage, String memoTehtPercentage) {
        
        int intMemoID = Integer.parseInt(memoID);
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("UPDATE Memos SET MemoTime=?, MemoDoing=?,"
                    + " MemoPositivePercentage=?, MemoNegativePercentage=?, MemoTehtPercentage=? WHERE MemoID=?");
            ps.setString(1, memoTime);
            ps.setString(2, memoDoing);
            ps.setString(3, memoPositivePercentage);
            ps.setString(4, memoNegativePercentage);
            ps.setString(5, memoTehtPercentage);
            ps.setInt(6, intMemoID);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
    }
    
    public static void addNewMemo3(String memoTime, String memoDoing,
            String memoPositivePercentage, String memoNegativePercentage, String memoTehtPercentage, String taskID) {
        
        int intTaskID = Integer.parseInt(taskID);
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("INSERT INTO Memos (TaskID, MemoTime, MemoDoing,"
                    + " MemoPositivePercentage, MemoNegativePercentage, MemoTehtPercentage) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setInt(1, intTaskID);
            ps.setString(2, memoTime);
            ps.setString(3, memoDoing);
            ps.setString(4, memoPositivePercentage);
            ps.setString(5, memoNegativePercentage);
            ps.setString(5, memoTehtPercentage);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
    }
    
    public static ArrayList<Message> getTaskMessages(int taskID) {
        
        ArrayList messages = new ArrayList();
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT MessageID, UserType, MessageContent, MessageDate"
                    + " FROM Messages WHERE TaskID=?");
            ps.setInt(1, taskID);
            rs = ps.executeQuery();

            while (rs.next()) {
                messages.add(new Message(rs.getInt("MessageID"), rs.getString("UserType"),
                        rs.getString("MessageContent"), rs.getString("MessageDate")));
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return messages;
    }
    
    public static ArrayList<Message> getDetailMessages(int detailID) {
        
        ArrayList messages = new ArrayList();
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT MessageID, UserType, MessageContent, MessageDate"
                    + " FROM Messages WHERE DetailID=?");
            ps.setInt(1, detailID);
            rs = ps.executeQuery();

            while (rs.next()) {
                messages.add(new Message(rs.getInt("MessageID"), rs.getString("UserType"),
                        rs.getString("MessageContent"), rs.getString("MessageDate")));
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return messages;
    }
    
    public static void sendTaskMessage(int taskID, String userType, String messageContent) {
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("INSERT INTO Messages (TaskID, UserType, MessageContent) VALUES (?, ?, ?)");
            ps.setInt(1, taskID);
            ps.setString(2, userType);
            ps.setString(3, messageContent);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
    }
    
    public static void sendDetailMessage(int detailID, String userType, String messageContent) {
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("INSERT INTO Messages (DetailID, UserType, MessageContent) VALUES (?, ?, ?)");
            ps.setInt(1, detailID);
            ps.setString(2, userType);
            ps.setString(3, messageContent);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
    }
    
    public static ArrayList<Task> getUserTasks(int userID) {
        
        ArrayList tasks = new ArrayList();
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT TaskID, TaskTypeID, TaskContent, TaskIsReturned, TaskIsClosed FROM Tasks WHERE"
                    + " UserID=?");
            ps.setInt(1, userID);
            rs = ps.executeQuery();

            while (rs.next()) {
                tasks.add(new Task(rs.getInt("TaskID"), rs.getInt("TaskTypeID"), rs.getString("TaskContent"),
                        rs.getBoolean("TaskIsReturned"), rs.getBoolean("TaskIsClosed")));
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return tasks;
    }
    
    public static ArrayList<Detail> getUserCareDetails(int userID) {
        
        ArrayList details = new ArrayList();
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT DetailID, DetailAge, DetailResidencemodel,"
                    + " DetailLifestyle, DetailHealthServices, DetailProblems FROM Details WHERE"
                    + " UserID=?");
            ps.setInt(1, userID);
            rs = ps.executeQuery();

            while (rs.next()) {
                details.add(new Detail(rs.getInt("DetailID"), rs.getString("DetailAge"),
                        rs.getString("DetailResidencemodel"), rs.getString("DetailLifestyle"),
                        rs.getString("DetailHealthServices"), rs.getString("DetailProblems")));
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return details;
    }
    
    public static void updateUserActivityDate(int userID, String userActivityEvent) {
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("UPDATE Users SET UserActivityDate=now(), UserActivityEvent=? WHERE UserID=?");
            ps.setString(1, userActivityEvent);
            ps.setInt(2, userID);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
    }
         
    public static void updateUserDetails(String userName, String userSurname,
            String userAddress, String userPostalcode, String userPostoffice, String userPhonenumber, String userEmail) {
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("UPDATE Users SET UserName=?, UserSurname=?,"
                    + " UserAddress=?, UserPostalcode=?, UserPostoffice=?, UserPhonenumber=? WHERE UserEmail=?");
            ps.setString(1, userName);
            ps.setString(2, userSurname);
            ps.setString(3, userAddress);
            ps.setString(4, userPostalcode);
            ps.setString(5, userPostoffice);
            ps.setString(6, userPhonenumber);
            ps.setString(7, userEmail);
            
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
    }
    
    public static void updateUserCureDetails(String customerAge, String customerResidencemodel,
                String customerLifestyle, String customerHealthservices, String customerProblems, int userID) {
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("UPDATE Details SET DetailAge=?, DetailResidencemodel=?,"
                    + " DetailLifestyle=?, DetailHealthServices=?, DetailProblems=? WHERE UserID=?");
            ps.setString(1, customerAge);
            ps.setString(2, customerResidencemodel);
            ps.setString(3, customerLifestyle);
            ps.setString(4, customerHealthservices);
            ps.setString(5, customerProblems);
            ps.setInt(6, userID);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
    }
    
    public static void updateUserPassword(String newPassword, String email) {
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
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
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
    }
    
    public static ArrayList<Content> getAllFrontPageContent() {
        
        ArrayList allContent = new ArrayList();
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("SELECT PageContent FROM Frontpage");
            rs = ps.executeQuery();

            while (rs.next()) {
                allContent.add(new Content(rs.getString("PageContent")));
            }

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return allContent;
    }
    
    public static String getFrontPageContent(int content) {
        
        String contentToBeRendered = "";
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
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
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
        return contentToBeRendered;
    }

    public static void updateAllFrontPageContent(ArrayList<Content> content) {
        
        String contentAd = ((Content)content.get(0)).getContent();
        String contentTherapist = ((Content)content.get(1)).getContent();
        String contentJoin = ((Content)content.get(2)).getContent();
        String contentInfo = ((Content)content.get(3)).getContent();
        String contentServices = ((Content)content.get(4)).getContent();
        String contentContact = ((Content)content.get(5)).getContent();
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName(dbDriver);

            conn = DriverManager.getConnection(dbAddress, dbUsername, dbPassword);
            ps = conn.prepareStatement("INSERT INTO Frontpage (PageID, PageContent) VALUES (1, ?),"
                    + "(2, ?),(3, ?),(4, ?),(5, ?),(6, ?) ON DUPLICATE KEY UPDATE"
                    + " PageContent=VALUES(PageContent)");
            ps.setString(1, contentAd);
            ps.setString(2, contentTherapist);
            ps.setString(3, contentJoin);
            ps.setString(4, contentInfo);
            ps.setString(5, contentServices);
            ps.setString(6, contentContact);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
    }
    
    public static void updateFrontPageContent(String content, int id) {
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
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
            try { if (rs != null) rs.close(); } catch (Exception e) { /* ignoring */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* ignoring */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* ignoring */ }
            
        }
        
    }
}
