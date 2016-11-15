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
public class UpdateUserDetails extends HttpServlet {

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
        
        String userName = request.getParameter("name");
        String userSurname = request.getParameter("surname");
        String userAddress = request.getParameter("address");
        String userPostalcode = request.getParameter("postalcode");
        String userPostoffice = request.getParameter("postoffice");
        String userEmail = request.getParameter("email");
        
        Database.updateUserDetails(userName, userSurname, userAddress, userPostalcode, userPostoffice, userEmail);
        response.sendRedirect(request.getContextPath() + "/profile.jsp");
        
    }
}
