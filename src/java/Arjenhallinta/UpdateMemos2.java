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
public class UpdateMemos2 extends HttpServlet {

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
        String[] memoPositivePercentages = request.getParameterValues("memopositivepercentage");
        String[] memoNegativePercentages = request.getParameterValues("memonegativepercentage");
        
        //Here we collect all the data from one new memo row
        String taskID = request.getParameter("memotaskid");
        String memoTime = request.getParameter("newmemotime");
        String memoDoing = request.getParameter("newmemodoing");
        String memoPositivePercentage = request.getParameter("newmemopositivepercentage");
        String memoNegativePercentage = request.getParameter("newmemonegativepercentage");
        
        String stringUserID = request.getParameter("userid");
        int intUserID = Integer.parseInt(stringUserID);
        
        if(memoIDs != null){
            
            //Updating each existing row
            for(int i = 0; i < memoIDs.length; i++){
                
                Database.updateMemo2(memoIDs[i], memoTimes[i], memoDoings[i], memoPositivePercentages[i], memoNegativePercentages[i]);
            }
        }
        
        //Here we need to update the new row to database
        if(!"".equals(memoDoing)){
            Database.addNewMemo2(memoTime, memoDoing, memoPositivePercentage, memoNegativePercentage, taskID);
        }
        
        //Here we set TaskIsReturned true so that task is correctly shown in admin view
        int intTaskID = Integer.parseInt(taskID);
        Database.setTaskReturned(intTaskID);
        
        //Here we finally update UserActivityEvent in Users table
        Database.updateUserActivityDate(intUserID, "Harjoitus 2. täyttäminen");
        
        response.sendRedirect(request.getContextPath() + "/customer.jsp");
    }
}
