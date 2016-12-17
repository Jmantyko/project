/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Arjenhallinta;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * servlet provides part of the logic that is required
 * to authenticate each user. If email and password combination
 * is correct, we create new cookie which contains user's email.
 * When user tries to access certain page, check is done to verify
 * sessionid has correct email address attached to it.
 */
public class Login extends HttpServlet {

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
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (Database.authenticateUser(email, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);

            //Session expires in 60mins
            session.setMaxInactiveInterval(60 * 60);
            Cookie userEmail = new Cookie("email", email);
            userEmail.setMaxAge(60 * 60);
            response.addCookie(userEmail);
            
            String userType = Database.userType(email);

            if("admin".equals(userType)){
                response.sendRedirect(request.getContextPath() + "/admin.jsp");
                
            }else if("customer".equals(userType)){
                response.sendRedirect(request.getContextPath() + "/customer.jsp");
                
            }
            
            System.out.println("ACCESS GRANTED, USERTYPE IS: " + userType);

        } else {
            response.sendRedirect(request.getContextPath() + "/etusivu.jsp");
            System.out.println("ACCESS DENIED");

        }
    }
}
