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
 * @author Jaakko
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

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

            //Session expires in 30mins
            session.setMaxInactiveInterval(30 * 60);
            Cookie userEmail = new Cookie("email", email);
            userEmail.setMaxAge(30 * 60);
            response.addCookie(userEmail);
            
            String userType = Database.userType(email);

            if("admin".equals(userType)){
                //admin sivu
                response.sendRedirect(request.getContextPath() + "/admin.jsp");
                
            }else if("customer".equals(userType)){
                //customer sivu
                response.sendRedirect(request.getContextPath() + "/customer.jsp");
                
            }
            
            System.out.println("ACCESS GRANTED, USERTYPE IS: " + userType);

        } else {
            response.sendRedirect(request.getContextPath() + "/etusivu.jsp");
            System.out.println("ACCESS DENIED");

        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
