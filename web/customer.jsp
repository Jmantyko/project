<%-- 
    Document   : customer
    Created on : 25-Oct-2016, 13:14:07
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
        <!-- Bootstraps Javascript requires jQuery-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
                
                if ("customer".equals(userType)) {

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
        %>    
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class ="navbar-brand" href="#">Arjenhallinta.fi</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="#">Etusivu</a></li>
                </ul>
                <ul class="nav nav-pills">
                  <li role="presentation" class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                      Dropdown <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Asetukset</a></li>
                        <li><a href="#">Taustatiedot</a></li>
                        <li><a href="#">Kirjaudu Ulos</a></li>
                    </ul>
                  </li>
                </ul>
            </div>
        </nav>
        
        <div class="customer-main-container">
            <div class="customer-actions-container">
                <p>harjoitukset ja viestit tänne</p>
            </div>

            <div class="customer-display-container">
                <h1>Olet kirjautunut sisään CUSTOMER-sivulle</h1>
                <p>Tervetuloa <strong><%=InputOutputCleaner.clean(userEmail)%></strong><br><br>
                    Session ID on <strong><%=sessionID%></strong><br></p>
                <form action="profile.jsp">
                    <input type="submit" class="btn btn-info btn-sm" value="Profiili asetukset">
                </form><br>
                <form action="Logout" method="POST"> 
                    <input type="submit" class="btn btn-danger" value="Kirjaudu ulos" />
                </form>
            </div>
        </div>      
                
        <footer>
            <p>Martti Puttonen <br> Psykoterapeutti <br> 0400 123 123 <br> Terapeutintie 3 A4, Hyvinkää</p>
        </footer>
    </body>
</html>
