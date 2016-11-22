/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Arjenhallinta;

/**
 *
 * @author Jaakko
 */
public class Customer {
    
    private int id;
    private String email;
    private String name;
    private String surname;
    private String phonenumber;
    private String address;
    private String postalcode;
    private String postoffice;
    private String useractivitydate;
    
    public Customer(int userID, String userEmail, String userName, String userSurname, 
            String userPhonenumber, String userAddress, String userPostalcode, String userPostoffice, String userActivityDate) {
        id = userID;
        email = userEmail;
        name = userName;
        surname = userSurname;
        phonenumber = userPhonenumber;
        address = userAddress;
        postalcode = userPostalcode;
        postoffice = userPostoffice;
        useractivitydate = userActivityDate;
    }
    
    public int getID(){
        return id;
    }
    
    public String getEmail(){
        return email;
    }
    
    public String getName(){
        return name;
    }
    
    public String getSurname(){
        return surname;
    }
    
    public String getPhonenumber(){
        return phonenumber;
    }
    
    public String getAddress(){
        return address;
    }
    
    public String getPostalcode(){
        return postalcode;
    }
    
    public String getPostoffice(){
        return postoffice;
    }
    
    public String getActivityDate(){
        return useractivitydate;
    }
    
    @Override
    public String toString() {
        return name;
    }
}
