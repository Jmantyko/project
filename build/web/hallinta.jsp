<%-- 
    Document   : hallinta
    Created on : 25-Oct-2016, 13:14:07
    Author     : Jaakko
--%>

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
            String email = null;

            if (session.getAttribute("email") == null) {

                response.sendRedirect("etusivu.jsp");

            } else {
                email = (String) session.getAttribute("email");
            }

            String userEmail = null;
            String sessionID = null;
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
        %>    
        <h1>Olet kirjautunut sisään</h1>
        <p>Sinun userEmail on <strong><%=InputOutputCleaner.clean(userEmail)%></strong> ja email on <strong><%=InputOutputCleaner.clean(email)%></strong><br><br>
            Session ID on <strong><%=sessionID%></strong><br></p>
        <form action="CreateUser" method="POST">
            <label for="email">Anna käyttäjän sähköpostiosoite:</label>
            <input type="text" class="form-control" name="email" value="" placeholder="Syötä sähköpostiosoite" /><br>
            <label for="email">Luo käyttäjälle salasana:</label>
            <input type="password" class="form-control" name="password" value="" placeholder="Luo salasana" /><br>
            <input type="submit" class="btn btn-success" value="Lisää käyttäjä" /> 
        </form><br>
        <form action="Logout" method="POST">
            <input type="submit" class="btn btn-danger" value="Kirjaudu ulos" />
        </form>
    </body>
</html>
