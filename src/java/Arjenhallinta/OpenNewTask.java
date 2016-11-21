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
        
        String selection = request.getParameter("selection");
        int taskTypeID = Integer.parseInt(selection);
        String userID = request.getParameter("userid");
        int intuserID = Integer.parseInt(userID);
        boolean taskActive = false;
        
        if(null == selection){
            System.out.println("EMPTY SELECTION ERROR");
        }else switch (selection) {
            case "1":
                taskActive = Database.isTaskActive(taskTypeID, intuserID);
                //Checking if custoer already has existing task active
                //if there is no same task active, we open new one.
                if(taskActive == false){
                    Database.openNewTask(taskTypeID, intuserID);
                    System.out.println("TASK WAS NOT ACTIVE, NEW TASK OPENED");
                }else{
                    System.out.println("TASK WAS ACTIVE, NO NEW TASK OPENED");
                }
                break;
            case "2":
                taskActive = Database.isTaskActive(taskTypeID, intuserID);
                //Checking if custoer already has existing task active
                //if there is no same task active, we open new one.
                if(taskActive == false){
                    Database.openNewTask(taskTypeID, intuserID);
                    System.out.println("TASK WAS NOT ACTIVE, NEW TASK OPENED");
                }else{
                    System.out.println("TASK WAS ACTIVE, NO NEW TASK OPENED");
                }
                break;
            case "3":
                taskActive = Database.isTaskActive(taskTypeID, intuserID);
                //Checking if custoer already has existing task active
                //if there is no same task active, we open new one.
                if(taskActive == false){
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
