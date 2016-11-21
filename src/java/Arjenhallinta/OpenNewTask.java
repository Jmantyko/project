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
public class OpenNewTask extends HttpServlet {

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
        
        String stringTaskTypeID = request.getParameter("tasktypeid");
        int taskTypeID = Integer.parseInt(stringTaskTypeID);
        String userID = request.getParameter("userid");
        int intuserID = Integer.parseInt(userID);
        boolean activeTaskExist = false;
        
        //Checking first if similar active task exist in database
        activeTaskExist = Database.activeTaskExist(taskTypeID, intuserID);
        
        if(null == stringTaskTypeID){
            System.out.println("EMPTY SELECTION ERROR");
        }else switch (stringTaskTypeID) {
            case "1":
                
                if(activeTaskExist == false){
                    Database.openNewTask(taskTypeID, intuserID);
                    System.out.println("TASK WAS NOT ACTIVE, NEW TASK OPENED");
                }else{
                    System.out.println("TASK WAS ACTIVE, NO NEW TASK OPENED");
                }
                break;
            case "2":
                
                if(activeTaskExist == false){
                    Database.openNewTask(taskTypeID, intuserID);
                    System.out.println("TASK WAS NOT ACTIVE, NEW TASK OPENED");
                }else{
                    System.out.println("TASK WAS ACTIVE, NO NEW TASK OPENED");
                }
                break;
            case "3":
                
                if(activeTaskExist == false){
                    Database.openNewTask(taskTypeID, intuserID);
                    System.out.println("TASK WAS NOT ACTIVE, NEW TASK OPENED");
                }else{
                    System.out.println("TASK WAS ACTIVE, NO NEW TASK OPENED");
                }
                break;
            default:
                System.out.println("SELECTION ERROR");
                break;
        }
        
        response.sendRedirect(request.getContextPath() + "/admincustomerdetails.jsp?customerid=" + userID);
    }
}
