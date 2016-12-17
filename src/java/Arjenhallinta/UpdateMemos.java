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
 * Servlet used to save possible changes made in exercise 1.
 * Updating existing memos is done first and if the final memo
 * has some content it will also be saved into database using
 * methods provided by Database-class
 */
public class UpdateMemos extends HttpServlet {

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
        
        //Here we get all the data from existing memo rows
        String[] memoIDs = request.getParameterValues("memoid");
        String[] memoTimes = request.getParameterValues("memotime");
        String[] memoDoings = request.getParameterValues("memodoing");
        String[] memoSuojaPercentages = request.getParameterValues("memosuojapercentage");
        String[] memoTehtPercentages = request.getParameterValues("memotehtpercentage");
        
        //Here we collect all the data from one new memo row
        String taskID = request.getParameter("memotaskid");
        String memoTime = request.getParameter("newmemotime");
        String memoDoing = request.getParameter("newmemodoing");
        String memoSuojaPercentage = request.getParameter("newmemosuojapercentage");
        String memoTehtPercentage = request.getParameter("newmemotehtpercentage");
        
        String stringUserID = request.getParameter("userid");
        int intUserID = Integer.parseInt(stringUserID);
        
        if(memoIDs != null){
            
            //Updating each existing row
            for(int i = 0; i < memoIDs.length; i++){
                
                Database.updateMemo1(memoIDs[i], memoTimes[i], memoDoings[i], memoSuojaPercentages[i], memoTehtPercentages[i]);
            }
        }
        
        //Here we need to update the new row to database
        if(!"".equals(memoDoing)){
            Database.addNewMemo1(memoTime, memoDoing, memoSuojaPercentage, memoTehtPercentage, taskID);
        }
        
        //Here we set TaskIsReturned true so that task is correctly shown in admin view
        int intTaskID = Integer.parseInt(taskID);
        Database.setTaskReturned(intTaskID);
        
        //Here we finally update UserActivityEvent in Users table
        Database.updateUserActivityDate(intUserID, "Harjoitus 1. täyttäminen");
        
        response.sendRedirect(request.getContextPath() + "/customer.jsp");
    }
}
