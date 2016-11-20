<%-- 
    Document   : admincustomerdetails
    Created on : 17-Nov-2016, 14:49:27
    Author     : Jaakko
--%>

<%@page import="Arjenhallinta.Task"%>
<%@page import="Arjenhallinta.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Arjenhallinta.Database"%>
<%@page import="Arjenhallinta.InputOutput"%>
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
                
                if ("admin".equals(userType)) {

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
    <meta http-equiv="content-type" content="text/html;charset=ISO-8859-1"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

  
    <title>Arjenhallinta</title>
    
    <link rel="stylsheet" href="style.css" type="text/css" >

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	
    <!-- Bootstrap slider CSS -->

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/9.3.2/css/bootstrap-slider.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/9.3.2/css/bootstrap-slider.min.css">

    <!-- Bootstrap Clockpicker-->

    <link rel="stylesheet" type="text/css" href="dist/jquery-clockpicker.css">

        
    <!-- Custom CSS -->
    <style>
	
    body {
        padding-top: 45px;
        /* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */	
    }
        
    .jumbotron {
        font-color:  #76A5FF;
        background:  #76A5FF;
        width: 100%;
        height: 100%;
        background-size: cover;
        overflow: hidden;

    }

    .jumbotron h2 {
        color: white;
        text-shadow:
        -1px -1px 0 #000,  
         1px -1px 0 #000,
        -1px 1px 0 #000,
         1px 1px 0 #000;
     }

    .jumbotron p {
        color: #fff;
        text-shadow:
        -1px -1px 0 #000,  
         1px -1px 0 #000,
        -1px 1px 0 #000,
         1px 1px 0 #000;
    }

    .navbar-default .navbar-nav > li > a:hover, .navbar-default .navbar-nav > li > a:focus {
        color: #000;  /*Sets the text hover color on navbar*/
    }

    .navbar-default .navbar-nav > .active > a, .navbar-default .navbar-nav > .active >   
    a:hover, .navbar-default .navbar-nav > .active > a:focus {
        color: white; /*BACKGROUND color for active*/
        background-color: #0073A3;
    }

    .navbar-default {
        background-color: #76A5FF;
        border-color: #B9B7B8;
    }

    .dropdown-menu > li > a:hover,
    .dropdown-menu > li > a:focus {
        color: #262626;
       text-decoration: none;
       background-color: #66CCFF;  /*change color of links in drop down here*/
    }

    .nav > li > a:hover,
    .nav > li > a:focus {
        text-decoration: none;
        background-color: silver; /*Change rollover cell color here*/
    }


    .navbar-default .navbar-nav > li > a {
        background-color: #0073A3;
        color: white;
        background-color: #76A5FF;
        letter-spacing: 2px;
        text-shadow:
        -0.5px -0.5px 0 #000,  
         0.5px -0.5px 0 #000,
        -0.5px 0.5px 0 #000,
         0.5px 0.5px 0 #000;
    }
    
    .form-login {
        padding: 1em;
        min-width: 280px; /* change width as per your requirement */
    }
    
    .chat {
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .chat li {
        margin-bottom: 10px;
        padding-bottom: 5px;
        border-bottom: 1px dotted #B3A9A9;
    }

    .chat li.left .chat-body {
        margin-left: 60px;
    }

    .chat li.right .chat-body {
        margin-right: 60px;
    }


    .chat li .chat-body p {
        margin: 0;
        color: #777777;
    }

    .panel .slidedown .glyphicon, .chat .glyphicon {
        margin-right: 5px;
    }

    .panel-body {
        overflow-y: scroll;
        height: 250px;
    }

    ::-webkit-scrollbar-track {
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
        background-color: #F5F5F5;
    }

    ::-webkit-scrollbar {
        width: 12px;
        background-color: #F5F5F5;
    }

    ::-webkit-scrollbar-thumb {
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
        background-color: #555;
    }
    
    /* Form radio button and checkbox styles */
        
    .control-group {
    display: inline-block;
    vertical-align: top;
    background: #fff;
    text-align: left;
    box-shadow: 0 1px 2px rgba(0,0,0,0.1);
    padding-top: 30px;
    padding-left: 30px;
    padding-right: 30px;
    padding-bottom: 30px;
    width: 450px;
    height: 360px;
    margin: 0px;
    }
    .control {
      display: block;
      position: relative;
      padding-left: 30px;
      margin-bottom: 15px;
      cursor: pointer;
      font-size: 14px;
    }
    .control input {
      position: absolute;
      z-index: -1;
      opacity: 0;
    }
    .control__indicator {
      position: absolute;
      top: 2px;
      left: 0;
      height: 20px;
      width: 20px;
      background: #e6e6e6;
    }
    .control--radio .control__indicator {
      border-radius: 50%;
    }
    .control:hover input ~ .control__indicator,
    .control input:focus ~ .control__indicator {
      background: #ccc;
    }
    .control input:checked ~ .control__indicator {
      background: #2aa1c0;
    }
    .control:hover input:not([disabled]):checked ~ .control__indicator,
    .control input:checked:focus ~ .control__indicator {
      background: #0e647d;
    }
    .control input:disabled ~ .control__indicator {
      background: #e6e6e6;
      opacity: 0.6;
      pointer-events: none;
    }
    .control__indicator:after {
      content: '';
      position: absolute;
      display: none;
    }
    .control input:checked ~ .control__indicator:after {
      display: block;
    }
    .control--checkbox .control__indicator:after {
      left: 8px;
      top: 4px;
      width: 3px;
      height: 8px;
      border: solid #fff;
      border-width: 0 2px 2px 0;
      transform: rotate(45deg);
    }
    .control--checkbox input:disabled ~ .control__indicator:after {
      border-color: #7b7b7b;
    }
    .control--radio .control__indicator:after {
      left: 7px;
      top: 7px;
      height: 6px;
      width: 6px;
      border-radius: 50%;
      background: #fff;
    }
    .control--radio input:disabled ~ .control__indicator:after {
      background: #7b7b7b;
    }
    .select {
      position: relative;
      display: inline-block;
      margin-bottom: 15px;
      width: 100%;
    }
    .select select {
      display: inline-block;
      width: 100%;
      cursor: pointer;
      padding: 10px 15px;
      outline: 0;
      border: 0;
      border-radius: 0;
      background: #e6e6e6;
      color: #7b7b7b;
      appearance: none;
      -webkit-appearance: none;
      -moz-appearance: none;
    }
    .select select::-ms-expand {
      display: none;
    }
    .select select:hover,
    .select select:focus {
      color: #000;
      background: #ccc;
    }
    .select select:disabled {
      opacity: 0.5;
      pointer-events: none;
    }
    .select__arrow {
      position: absolute;
      top: 16px;
      right: 15px;
      width: 0;
      height: 0;
      pointer-events: none;
      border-style: solid;
      border-width: 8px 5px 0 5px;
      border-color: #7b7b7b transparent transparent transparent;
    }
    .select select:hover ~ .select__arrow,
    .select select:focus ~ .select__arrow {
      border-top-color: #000;
    }
    .select select:disabled ~ .select__arrow {
      border-top-color: #ccc;
    }
    
    .topBuffer {
        margin-top: 20px;
    }
	
    </style>
	
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    <!-- jQuery Version 1.11.1 -->
    <script src="js/jquery.js"></script>
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/9.3.2/bootstrap-slider.js"></script>
    <script type="text/javascript" https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/9.3.2/bootstrap-slider.min.js</script>

    <!-- Clockpicker Javascript -->

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <script type="text/javascript" src="dist/bootstrap-clockpicker.min.js"></script>
        

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
    <!-- Bootstrap Slider Javascript -->
    
        <script>
        $(function(){
            var hash = window.location.hash;
            hash && $('ul.nav a[href="' + hash + '"]').tab('show');

            $('.nav-tabs a').click(function (e) {
              $(this).tab('show');
              var scrollmem = $('body').scrollTop();
              window.location.hash = this.hash;
              $('html,body').scrollTop(scrollmem);
            });
        });
        </script>

    <script>
$(function(){
   $('#ex1').slider({
	formater: function(value) {
		return 'Current value: ' + value;
	}
});

 });
     </script>
	 
	  <script>
$(function(){
   $('#ex2').slider({
	formater: function(value) {
		return 'Current value: ' + value;
	}
});

 });
     </script>
	 
	  <script>
$(function(){
   $('#ex3').slider({
	formater: function(value) {
		return 'Current value: ' + value;
	}
});

 });
     </script>
	 
	  <script>
$(function(){
   $('#ex4').slider({
	formater: function(value) {
		return 'Current value: ' + value;
	}
});

 });
     </script>
	 
	 <script>
$(function(){
   $('#ex5').slider({
	formater: function(value) {
		return 'Current value: ' + value;
	}
});

 });
     </script>
	 
	 <script>
$(function(){
   $('#ex6').slider({
	formater: function(value) {
		return 'Current value: ' + value;
	}
});

 });
     </script>
	 
	  <script>
$(function(){
   $('#ex7').slider({
	formater: function(value) {
		return 'Current value: ' + value;
	}
});

 });
     </script>
	 
	  <script>
$(function(){
   $('#ex8').slider({
	formater: function(value) {
		return 'Current value: ' + value;
	}
});

 });
     </script>
	 
	 <script>
$(function(){
   $('#ex9').slider({
	formater: function(value) {
		return 'Current value: ' + value;
	}
});

 });
     </script>
	 
	 <script>
$(function(){
   $('#ex10').slider({
	formater: function(value) {
		return 'Current value: ' + value;
	}
});

 });
     </script>
	 
	 <!-- Bootstrap row adding js --> 
     <script src="addrow.js"></script>
	 
	 <script>   $(document).ready(function(){
      var i=1;
     $("#add_row").click(function(){
      $('#addr'+i).html("<td>"+ (i+1) +"</td><td><input name='name"+i+"' type='text' placeholder='Name' class='form-control input-md'  /> </td><td><input  name='mail"+i+"' type='text' placeholder='Mail'  class='form-control input-md'></td><td><input  name='mobile"+i+"' type='text' placeholder='Mobile'  class='form-control input-md'></td>");

      $('#tab_logic').append('<tr id="addr'+(i+1)+'"></tr>');
      i++; 
  });
     $("#delete_row").click(function(){
    	 if(i>1){
		 $("#addr"+(i-1)).html('');
		 i--;
		 }
	 });

});
	 
	 </script>
         
         <script>
         
         $('.stop-propagation').on('click', function (e) {
          e.stopPropagation();
         });
         
         </script>

<div class="container">
<nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="etusivu.jsp">Arjenhallinta.fi</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
      <li class=""><a href="admin.jsp">Etusivu</a></li>
       <li class=""><a href="admin.jsp#tab11">Asiakastilien hallinta</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
     <li class="dropdown">
        <%
          
            if (session.getAttribute("email") == null){

        %>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
            <i class="glyphicon glyphicon-user"></i> Kirjaudu sisään
        </a>
        <form action="Login" method="POST" class="dropdown-menu form-login stop-propagation" role="menu">
            <div class="form-group">
                <label for="exampleInputEmail1">
                    <i class="glyphicon glyphicon-envelope"></i> Sähköpostiosoite
                </label> 
                <input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" />
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">
                    <i class="glyphicon glyphicon-lock"></i> Salasana
                </label> 
                <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password" />
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-success btn-block">Kirjaudu</button>
            </div>
        </form>
        <%
            }else{
                String userName = Database.getUserName(email);
                String userSurname = Database.getUserSurname(email);
        %>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
            <i class="glyphicon glyphicon-user"></i> <%=InputOutput.clean(userName)%> <%=InputOutput.clean(userSurname)%>
        </a>
        <form action="Logout" method="POST" class="dropdown-menu form-login stop-propagation" role="menu"> 
            <div class="form-group">
                <a class="btn btn-info form-control" href="profile.jsp">Asetukset</a>
            </div>
            <%
                String userType = Database.userType(email);
                if ("customer".equals(userType)) {
            %>
            <div class="form-group">
                <a class="btn btn-info form-control" data-toggle="tab" href="#tab2">Taustatiedot</a>
            </div>
            <%
                }
            %>
            <div class="form-group">
                <button type="submit" class="btn btn-success btn-block">Kirjaudu ulos</button>
            </div>                
        </form>
        <%
            }
        %>
    </li>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>

</div>

<!-- container -->
<div class="container">
    <%
    String stringUserID = request.getParameter("customerid");
    int userid = Integer.parseInt(stringUserID);

    String userName = Database.getUserNameUsingID(userid);
    String userSurname = Database.getUserSurnameUsingID(userid);
    %>
    
    <h2><%=InputOutput.clean(userName)%> <%=InputOutput.clean(userSurname)%></h2>
    <div class="row">
        <div class="col-sm-3">
            <button type="button" class="btn btn-default btn-block" href='#tab-contentA' data-toggle="tab">Harjoitukset</button><br>
            <button type="button" class="btn btn-default btn-block" href='#tab-contentB' data-toggle="tab">Avaa uusi harjoitus</button><br>
            <button type="button" class="btn btn-default btn-block" href='#tab-contentC' data-toggle="tab">Taustatiedot</button><br>
        </div>
        <div class="col-sm-9">
            <!-- tab content -->
            <div class="tab-content">
                <div class="tab-pane fade" id="tab-contentA">
                    <div class="col-sm-3">
                        <%
                            ArrayList<Task> tasks = new ArrayList<Task>();
                            tasks = Database.getUserTasks(userid);
                            int taskID = 0;
                            int taskTypeID = 0;
                            String taskContent = "";
                            
                            if(tasks.size() == 0){
                        %>
                        <p>Ei aikaisempia harjoituksia.</p>
                        <%
                            }
                            //In this for loop we will print all user
                            //tasks and make each print to be
                            //a separate link which admin can press
                            //to get more details later below
                            for (int i = 0; i < tasks.size(); i++) {

                                taskID = ((Task) tasks.get(i)).getTaskID();
                                taskTypeID = ((Task) tasks.get(i)).getTaskTypeID();
                        %>
                        <a href='#tab-content<%=taskTypeID%>' data-toggle="tab">Monitorointiharjoitus <%=taskTypeID%>.</a><br>
                        <%
                            }
                        %>
                    </div>
                    <div class="col-sm-6">
                        <div class="tab-content">
                            <% 
                            //Here we print all content of each task
                            for (int i = 0; i < tasks.size(); i++){
                                
                                taskID = ((Task) tasks.get(i)).getTaskID();
                                taskTypeID = ((Task) tasks.get(i)).getTaskTypeID();
                                taskContent = ((Task) tasks.get(i)).getTaskContent();
                            %>
                            <div class="tab-pane fade" id="tab-content<%=taskTypeID%>">
                                <div>
                                    <p>Monitorointiharjoitus: <%=taskTypeID%>, arkistointitunnus <%=taskID%>.<br><br> Harjoituksen sisältö: <%=InputOutput.clean(taskContent)%></p>
                                </div>
                            </div>
                            <%
                            }
                            %>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="tab-contentB">
                    <div>
                        <div class="control-group">
                            <h4>Checkboxeja, joilla voi valita uuden harjoituksen asiakkaalle.</h4>
                            <br>
                            <label class="control control--checkbox">Monitorointiharjoitus 1
                              <input type="checkbox"/>
                              <div class="control__indicator"></div>
                            </label>
                            <label class="control control--checkbox">Monitorointiharjoitus 2
                              <input type="checkbox"/>
                              <div class="control__indicator"></div>
                            </label>
                            <label class="control control--checkbox">Monitorointiharjoitus 3
                              <input type="checkbox" />
                              <div class="control__indicator"></div>
                            </label>
                            <br>
                        <button type="submit" class="btn btn-info">Lähetä
                            <span class="glyphicon glyphicon-send" aria-hidden="true"></span>
                        </button>
                    </div>
                </div>
                </div>
                  
                <div class="tab-pane fade" id="tab-contentC">
                    <div>
                        <p>Yhteenveto taustatiedoista, ei muokkaus mahdollisuutta terapeutilla.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-bottom">
        <hr>
        <p class="muted">© 2016 Martti Puttonen. All rights reserved.</p>
        <hr>
</div> 
<script type="text/javascript" src="addrow.js"></script>
    </body>
</html>
