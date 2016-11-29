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
        
        if(memoIDs != null){
            
            for(int i = 0; i < memoIDs.length; i++){
                System.out.println("MEMO ID: " + memoIDs[i]);
                System.out.println(memoTimes[i]);
                System.out.println(memoDoings[i]);
                System.out.println(memoSuojaPercentages[i]);
                System.out.println(memoTehtPercentages[i]);
                System.out.println("----------");
                
                //Here we either make new ArrayList<Memo1> and send it
                //as a parameter to database OR we go one by one updating
                //each row to database
            }
        }
        
        System.out.println("NEW DATA FOR TASK: " + taskID);
        System.out.println("TIME" + memoTime);
        System.out.println("DOING" + memoDoing);
        System.out.println("SUOJA" + memoSuojaPercentage);
        System.out.println("TEHT" + memoTehtPercentage);
        
        //Here we need to update the new row to database
        
        //Here we finally update UserActivityEvent in Users table
        
        response.sendRedirect(request.getContextPath() + "/customer.jsp");
    }
}
