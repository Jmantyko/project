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
public class CreateUser extends HttpServlet {

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
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String phonenumber = request.getParameter("phonenumber");
        String address = request.getParameter("address");
        String postalcode = request.getParameter("postalcode");
        String postoffice = request.getParameter("postoffice");
        
        int userID = 0;
        
        if(Database.userExists(email) || email.equals("")){
            System.out.println("CREATING NEW USER FAILED - USER ALREADY EXISTS");
        }else{
            Database.addUser(email, password, name, surname, phonenumber,
                    address, postalcode, postoffice);
            System.out.println("CREATING NEW USER SUCCEEDED");
            
            //In here we get userid based on useremail
            userID = Database.getUserID(email);
            //In here we make a new row for Details table for our user
            Database.addUserDetails(userID);
        }
        
        response.sendRedirect(request.getContextPath() + "/admin.jsp#tab11");
    }
}
