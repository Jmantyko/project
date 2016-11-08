<%-- 
    Document   : profile
    Created on : 06-Nov-2016, 22:35:19
    Author     : Jaakko
--%>

<%@page import="Arjenhallinta.Database"%>
<%@page import="Arjenhallinta.InputOutputCleaner"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>Arjenhallinta</title>
        <!-- Bootstrap CDN -->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <body> 
        <%
            //allow access only if session exists
            //and userType is appropriate for the page
            String email = null;
            String userEmail = null;
            String sessionID = null;

            if (session.getAttribute("email") == null) {

                response.sendRedirect("etusivu.jsp");

            } else {
                email = (String) session.getAttribute("email");

                String userType = Database.userType(email);
                
                if ("admin".equals(userType) || "customer".equals(userType)) {

                    Cookie[] cookies = request.getCookies();

                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals("email")) {
                                userEmail = cookie.getValue();
                            }
                            if (cookie.getName().equals("JSESSIONID")) {
                                sessionID = cookie.getValue();
                            }
                        }
                    }
                } else {
                    response.sendRedirect("etusivu.jsp");
                }
            }
            
            int userID = Database.getUserID(email);
            String userName = Database.getUserName(email);
            String userSurname = Database.getUserSurname(email);
            String userAddress = Database.getUserAddress(email);
            String userPostalcode = Database.getUserPostalcode(email);
            String userPostoffice = Database.getUserPostoffice(email);
            // use =sessionID to get session id

        %>    
        <h1>Profiilisi</h1>
        <p>Muokkaa tietojasi <strong><%=userName%></strong></p>
        <p>Alla olevat tiedot on noudettu tietokannasta</p>
        <p>Asiakasnro: <strong><%=userID%></strong></p>
        <p>Etunimi: <strong><%=userName%></strong></p>
        <p>Sukunimi: <strong><%=userSurname%></strong></p>
        <p>Sähköposti: <strong><%=userEmail%></strong></p>
        <p>Osoite: <strong><%=userAddress%></strong></p>
        <p>Postinro: <strong><%=userPostalcode%></strong></p>
        <p>Postitoimipaikka: <strong><%=userPostoffice%></strong></p>
    </body>
</html>
