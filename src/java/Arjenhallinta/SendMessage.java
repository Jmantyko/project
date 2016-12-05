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
        String stringUserID = request.getParameter("userid");
        int intUserID = Integer.parseInt(stringUserID);
        String stringTaskID;
        int intTaskID;
        String stringDetailID;
        int intDetailID;
        
        //Case A is for customer who sends message related to certain task
        //Case B is for customer who sends message related to background details
        //Case C is for admin who sends message related to certain task
        //Case D is for admin who sends message related to background details
        switch (messageType){
            case "A":
                stringTaskID = request.getParameter("taskid");
                intTaskID = Integer.parseInt(stringTaskID);
                Database.sendTaskMessage(intTaskID, userType, message);
                Database.updateUserActivityDate(intUserID, "Viesti harjoitukseen");
                response.sendRedirect(request.getContextPath() + "/customer.jsp#tab-content-2");
                break;
            case "B":
                stringDetailID = request.getParameter("detailid");
                intDetailID = Integer.parseInt(stringDetailID);
                Database.sendDetailMessage(intDetailID, userType, message);
                Database.updateUserActivityDate(intUserID, "Viesti taustatietoihin");
                response.sendRedirect(request.getContextPath() + "/customer.jsp#tab2");
                break;
            case "C":
                stringTaskID = request.getParameter("taskid");
                intTaskID = Integer.parseInt(stringTaskID);
                Database.sendTaskMessage(intTaskID, userType, message);
                response.sendRedirect(request.getContextPath() + "/admincustomerdetails.jsp?customerid=" + intUserID);
                break;    
            case "D":
                stringDetailID = request.getParameter("detailid");
                intDetailID = Integer.parseInt(stringDetailID);
                Database.sendDetailMessage(intDetailID, userType, message);
                response.sendRedirect(request.getContextPath() + "/admincustomerdetails.jsp?customerid=" + intUserID);
                break;
            default:
                System.out.println("ERROR IN SENDING MESSAGE");
                break;
        }
    }
}
