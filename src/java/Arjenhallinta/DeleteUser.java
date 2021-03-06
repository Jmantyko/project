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
 * Servlet removes the user by using the
 * requested parameter and accessing deleteUser-method
 * which Database class provides.
 */
public class DeleteUser extends HttpServlet {

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
        
        String stringCustomerID = request.getParameter("customerid");
        int intCustomerID = Integer.parseInt(stringCustomerID);
        
        Database.deleteUser(intCustomerID);
        
        response.sendRedirect(request.getContextPath() + "/admin.jsp#tab11");
    }
}
