/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Arjenhallinta;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * Servlet used to update content in the frontpage. 
 * All new content is first saved to strings, then by
 * using Content class, each piece of content is made to be
 * an object. Finally all objects are packed into ArrayList
 * which is sent to method provided by Database-class to update
 * new content
 */
@WebServlet(name = "UpdateFrontPage", urlPatterns = {"/UpdateFrontPage"})
public class UpdateFrontPage extends HttpServlet {

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
        
        String contentmainos = request.getParameter("contentmainos");
        String contentmartti = request.getParameter("contentmartti");
        String contentliity = request.getParameter("contentliity");
        String contenttietoa = request.getParameter("contenttietoa");
        String contentpsykoterapiapalvelut = request.getParameter("contentpsykoterapiapalvelut");
        String contentyhteystiedot = request.getParameter("contentyhteystiedot");
        
        Content contentAd = new Content(contentmainos);
        Content contentTherapist = new Content(contentmartti);
        Content contentJoin = new Content(contentliity);
        Content contentInfo = new Content(contenttietoa);
        Content contentServices = new Content(contentpsykoterapiapalvelut);
        Content contentContact = new Content(contentyhteystiedot);

        ArrayList<Content> content = new ArrayList<Content>();
        content.add(contentAd);
        content.add(contentTherapist);
        content.add(contentJoin);
        content.add(contentInfo);
        content.add(contentServices);
        content.add(contentContact);
        
        Database.updateAllFrontPageContent(content);
        
        response.sendRedirect(request.getContextPath() + "/profile.jsp");
    }
}
