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
    
    public Customer(int userID, String userEmail, String userName, String userSurname) {
        id = userID;
        email = userEmail;
        name = userName;
        surname = userSurname;
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
    
    @Override
    public String toString() {
        return name;
    }
}
