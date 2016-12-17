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
 * Servlet used to update user password.
 * Old password needs to be correct as well as both new
 * passwords needs to be same before change is saved
 * into database. Please note that this logic needs to
 * be partially redesigned when passwords are encrypted in database
 */
public class UpdateUserPassword extends HttpServlet {

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
        
        String oldPassword = request.getParameter("oldpassword");
        String newPassword = request.getParameter("newpassword");
        String newPasswordagain = request.getParameter("newpasswordagain");
        String email = request.getParameter("email");
        
        if(Database.authenticateUser(email, oldPassword)){
            if(newPassword.equals(newPasswordagain) && !"".equals(newPassword)
                    && InputOutput.hasNoWhitespaces(newPassword)){
                Database.updateUserPassword(newPassword, email);
                
            }else{
                System.out.println("PASSWORDS DON'T MATCH OR PASSWORD IS EMPTY");
                
            }
        }else{
            System.out.println("BAD OLD PASSWORD");
            
        }
        
        response.sendRedirect(request.getContextPath() + "/profile.jsp");
    }
}
