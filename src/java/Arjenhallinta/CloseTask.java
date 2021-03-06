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
 * Servlet closes task by requesting the parameter
 * which contains the id of that tasks and uses
 * closeTask method provided by Database-class
 */
public class CloseTask extends HttpServlet {
    
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
        
        String stringTaskID = request.getParameter("taskid");
        int intTaskID = Integer.parseInt(stringTaskID);
        String stringUserID = request.getParameter("userid");
        int intUserID = Integer.parseInt(stringUserID);
        
        Database.closeTask(intTaskID);
        
        response.sendRedirect(request.getContextPath() + "/admincustomerdetails.jsp?customerid=" + intUserID);
        
    }
}
