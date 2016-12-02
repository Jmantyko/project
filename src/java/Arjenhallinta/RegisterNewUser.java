/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Arjenhallinta;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jaakko
 */
public class RegisterNewUser extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String userEmail = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordAgain = request.getParameter("passwordagain");
        
        //Checking that same email does not exist and both passwords are the same
        if(Database.userExists(userEmail) == false && (password == null ? passwordAgain == null : password.equals(passwordAgain))){
            
            String userName = request.getParameter("name");
            String userSurname = request.getParameter("surname");
            String userAddress = request.getParameter("address");
            String userPostalcode = request.getParameter("postalcode");
            String userPostoffice = request.getParameter("postoffice");
            String userPhonenumber = request.getParameter("phonenumber");
            
            //Adding new user to database with basic user details
            Database.addUser(userEmail, password, userName, userSurname, userPhonenumber,
                    userAddress, userPostalcode, userPostoffice);
        
            int userID = Database.getUserID(userEmail);
            
            //Making details-entry for our new user
            Database.addUserDetails(userID);

            String customerAge = request.getParameter("age");
            String customerResidencemodel = request.getParameter("residencemodel");
            String customerLifestyle = request.getParameter("lifestyle");
            String customerHealthservices = request.getParameter("healthservices");
            String customerProblems = request.getParameter("problems");

            Database.updateUserCureDetails(customerAge, customerResidencemodel,
                    customerLifestyle, customerHealthservices, customerProblems, userID);

            Database.updateUserActivityDate(userID, "Rekisteröityminen");
            
        }else{
            System.out.println("Email address already exist or passwords don't match!");
        }

        //Finally we return to front page
        response.sendRedirect(request.getContextPath() + "/etusivu.jsp");
    }
}
