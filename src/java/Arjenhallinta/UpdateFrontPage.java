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
 * @author Jaakko
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
        
        //String content = request.getParameter("content");
        //int id = Integer.parseInt(request.getParameter("id"));
        
        String contentmainos = request.getParameter("contentmainos");
        String contentmartti = request.getParameter("contentmartti");
        String contentliity = request.getParameter("contentliity");
        String contenttietoa = request.getParameter("contenttietoa");
        String contentpsykoterapiapalvelut = request.getParameter("contentpsykoterapiapalvelut");
        String contentyhteystiedot = request.getParameter("contentyhteystiedot");
        
        int id1 = Integer.parseInt(request.getParameter("id1"));
        int id2 = Integer.parseInt(request.getParameter("id2"));
        int id3 = Integer.parseInt(request.getParameter("id3"));
        int id4 = Integer.parseInt(request.getParameter("id4"));
        int id5 = Integer.parseInt(request.getParameter("id5"));
        int id6 = Integer.parseInt(request.getParameter("id6"));
        
        Content contentAd = new Content(id1, contentmainos);
        Content contentTherapist = new Content(id2, contentmartti);
        Content contentJoin = new Content(id3, contentliity);
        Content contentInfo = new Content(id4, contenttietoa);
        Content contentServices = new Content(id5, contentpsykoterapiapalvelut);
        Content contentContact = new Content(id6, contentyhteystiedot);

        ArrayList<Content> content = new ArrayList<Content>();
        content.add(contentAd);
        content.add(contentTherapist);
        content.add(contentJoin);
        content.add(contentInfo);
        content.add(contentServices);
        content.add(contentContact);
        
        Database.updateAllFrontPageContent(content);
        
        //Database.updateFrontPageContent(content, id);
        response.sendRedirect(request.getContextPath() + "/profile.jsp");
        
    }
}
