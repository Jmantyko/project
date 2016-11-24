/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Arjenhallinta;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jaakko
 */
public class SendMessage extends HttpServlet {

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
        
        String messageType = request.getParameter("messagetype");
        String message = request.getParameter("message");
        String userType = request.getParameter("usertype");
        
        switch (messageType){
            case "A":
                String stringTaskID = request.getParameter("taskid");
                int intTaskID = Integer.parseInt(stringTaskID);
                Database.sendTaskMessage(intTaskID, userType, message);
                response.sendRedirect(request.getContextPath() + "/customer.jsp");
                break;
                
            case "B":
                String stringDetailID = request.getParameter("detailid");
                int intDetailID = Integer.parseInt(stringDetailID);
                Database.sendDetailMessage(intDetailID, userType, message);
                response.sendRedirect(request.getContextPath() + "/customer.jsp");
                break;
            default:
                System.out.println("ERROR IN SENDING MESSAGE");
                break;
        }
    }
}
