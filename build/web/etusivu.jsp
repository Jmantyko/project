<%-- 
    Document   : etusivu
    Created on : 25-Oct-2016, 13:10:52
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
            //Fetching data from database
            String content1 = Database.getFrontPageContent(1);
            String content2 = Database.getFrontPageContent(2);
        %>
        <h1>Etusivu</h1>
        <div>
            <%=InputOutputCleaner.clean(content1)%><br><br>
        </div>
        <form action="Login" method="POST">
            <label for="email">Sähköpostiosoite:</label>
            <input type="text" class="form-control" name="email" value="" placeholder="Syötä sähköpostiosoite" /><br>
            <label for="email">Salasana:</label>
            <input type="password" class="form-control" name="password" value="" placeholder="Syötä salasana" /><br>
            <input type="submit" class="btn btn-primary" value="Kirjaudu sisään" />
        </form><br><br>
        <%=InputOutputCleaner.clean(content2)%><br><br>
    </body>
</html>
