<%-- 
    Document   : customer
    Created on : 25-Oct-2016, 13:14:07
    Author     : Jaakko
--%>

<%@page import="Arjenhallinta.Message"%>
<%@page import="Arjenhallinta.Detail"%>
<%@page import="Arjenhallinta.Task"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Arjenhallinta.Database"%>
<%@page import="Arjenhallinta.InputOutput"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fi">
    <head>
        <meta http-equiv="content-type" content="text/html;charset=ISO-8859-1"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

  
    <title>Arjenhallinta</title>
	
    <link rel="stylesheet" href="style.css" type="text/css">
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
        color: #ccccff;  /*Sets the text hover color on navbar*/
    }

    .navbar-default .navbar-nav > .active > a, .navbar-default .navbar-nav > .active >   
    a:hover, .navbar-default .navbar-nav > .active > a:focus {
    color: white; /*BACKGROUND color for active*/
    background-color: #76A5FF; 
    }

    .navbar-default {
    background-color: #0073A3;
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
    background-color: #0073A3;
    letter-spacing: 2px;
    text-shadow:
    -0.5px -0.5px 0 #000,  
     0.5px -0.5px 0 #000,
    -0.5px 0.5px 0 #000,
     0.5px 0.5px 0 #000;
    }
    
    .navbar-brand {
    background-color: #0073A3;
    color: white;
    background-color: #0073A3;
    letter-spacing: 2px;
    text-shadow:
    -0.5px -0.5px 0 #000,  
     0.5px -0.5px 0 #000,
    -0.5px 0.5px 0 #000,
     0.5px 0.5px 0 #000;
    }

    .form-login{
    padding: 1em;
    min-width: 280px; /* change width as per your requirement */
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
	 
	 <!-- Bootstrap row adding js --> 
        <script src="addrow.js"></script>
	 
        <script>   
        $(document).ready(function(){
            
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
    </head>
    <body> 
        <%
            //allow access only if session exists
            //and userType is appropriate for the page
            String email = null;
            String userEmail = null;
            String sessionID = null;
            int userID = 0;

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
            
            userID = Database.getUserID(email);
        %>    
        

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
            <a class="navbar-brand" style="color:#f2f2f2" href="etusivu.jsp" >Arjenhallinta.fi</a>
          </div>

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
            <li class="active"><a href="customer.jsp">Etusivu</a></li>
            <li class="s"><a href="etusivu.jsp#martti">Martti Puttonen</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Nettiterapia <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="etusivu.jsp#tietoa"><h4>Tietoa <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></h4></a></li>
                    <li><a href="etusivu.jsp#liity"><h4>Liity <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></h4></a></a></li>
                    <li><a href="etusivu.jsp#psykoterapiapalvelut"><h4>Psykoterapiapalvelut <span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span></h4></a></a></li>
                </ul>
            </li>
            <li class=""><a href="etusivu.jsp#yhteystiedot">Yhteystiedot</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
             <li class="dropdown">
                <%
                    String userName = "";
                    String userSurname = "";
                    String userPhonenumber = "";
                    String userAddress = "";
                    String userPostalcode = "";
                    String userPostoffice = "";
                    String userType = "";
                    
                    int taskID = 0;
                    int taskTypeID = 0;
                    boolean taskClosed;
                    String taskContent = "";
                    
                    int detailID = 0;
                    String detailAge = "";
                    String detailResidencemodel = "";
                    String detailLifestyle = "";
                    String detailHealthservices = "";
                    String detailProblems = "";
                    
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
                        
                        //Instead getting each user detail one at a time
                        //we could get them as arraylist and go them
                        //through in for loop
                        userName = Database.getUserName(email);
                        userSurname = Database.getUserSurname(email);
                        userPhonenumber = Database.getUserPhonenumber(email);
                        userAddress = Database.getUserAddress(email);
                        userPostalcode = Database.getUserPostalcode(email);
                        userPostoffice = Database.getUserPostoffice(email);
                        userType = Database.userType(email);
                %>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                    <i class="glyphicon glyphicon-user"></i> <%=InputOutput.clean(userName)%> <%=InputOutput.clean(userSurname)%>
                </a>
                <form action="Logout" method="POST" class="dropdown-menu form-login stop-propagation" role="menu"> 
                    <div class="form-group">
                        <a class="btn btn-info form-control" href="profile.jsp">Asetukset</a>
                    </div>
                    <%
                        
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
        <!-- tab content -->
        <div class="tab-content">
        <div class="tab-pane active text-style" id="tab1">
            <div class="container">
                <div class="customer-main-container">
                    <div class="customer-actions-container">
                        <ul class="nav nav-tabs nav-justified">
                            <li class="active"><a data-toggle="tab" href="#tab-content-1">Harjoitukset</a></li>
                            <li><a data-toggle="tab" href="#tab-content-2">Viestit</a></li>
                        </ul>
                        <div class="tab-content">
                            
                            <div id="tab-content-1" class="tab-pane fade in active">
                                <%
                                    ArrayList<Task> tasks = new ArrayList<Task>();
                                    tasks = Database.getUserTasks(userID);
                            
                                    if(tasks.size() == 0){
                                %>
                                <br><p>Sinulle ei ole vielä lähetetty monitorointiharjoituksia.</p>
                                <%
                                    }

                                    

                                    int messageID = 0;
                                    String messageUserType = "";
                                    String messageContent = "";
                                    String messageDate = "";

                                    //In this for loop we will print all user
                                    //tasks and make each print to be
                                    //a separate link which customer can press
                                    //to get more details later below
                                    for (int i = 0; i < tasks.size(); i++) {

                                        taskID = ((Task) tasks.get(i)).getTaskID();
                                        taskTypeID = ((Task) tasks.get(i)).getTaskTypeID();
                                        taskClosed = ((Task) tasks.get(i)).getTaskIsClosed();
                                        
                                        if(taskClosed != true){
                                %>
                                <button type="button" class="btn btn-group btn-group-justified btn-primary" data-toggle="collapse" data-target="#harjoitukset<%=taskID%>">Harjoitus <%=taskTypeID%>.</button>
                                <div id="harjoitukset<%=taskID%>" class="collapse">
                                    <a class="btn btn-success pull-left" href="#tab-display-harjoitus<%=taskID%>" data-toggle="tab">Lisää uusi merkintä</a>
                                    <a class="btn btn-info pull-right" href="#tab-display-harjoitus<%=taskID%>" data-toggle="tab">Yhteenveto</a>
                                </div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                            <div id="tab-content-2" class="tab-pane fade">
                            <%
                                    //In this for loop we will print all user
                                    //conversations and make each print to be
                                    //a separate link which customer can press
                                    //to get whole conversation to show below
                                    ArrayList<Message> messages = new ArrayList<Message>();
                                    messages = Database.getTaskMessages(taskID);
                                    
                                    for (int k = 0; k < tasks.size(); k++) {

                                        taskID = ((Task) tasks.get(k)).getTaskID();
                                        taskTypeID = ((Task) tasks.get(k)).getTaskTypeID();
                                        
                                        //messageID = ((Message) messages.get(k)).getMessageID();
                                        //messageUserType = ((Message) messages.get(k)).getMessageUserType();
                                        //messageContent = ((Message) messages.get(k)).getMessageContent();
                                        //messageDate = ((Message) messages.get(k)).getMessageDate();
                                %>
                                <button type="button" class="btn btn-group btn-group-justified btn-info" data-toggle="tab" href="#tab-display-viestit<%=taskID%>">Harjoitus <%=taskTypeID%>. viestit</button>
                            <%
                                    }
                            %>
                            </div>
                        </div>
                    </div>

                    <div class="customer-display-container">
                        <div class="tab-pane fade in active" id="tab-display-welcome">
                            <h2>Tervetuloa!</h2>
                            <p>tähän vähän esittelytekstiä ja Martin broadcastaukset</p>
                        </div>
                        <%
                            //Here we print all content of each task
                            for (int z = 0; z < tasks.size(); z++){
                                
                                taskID = ((Task) tasks.get(z)).getTaskID();
                                taskTypeID = ((Task) tasks.get(z)).getTaskTypeID();
                                taskContent = ((Task) tasks.get(z)).getTaskContent();
                                taskClosed = ((Task) tasks.get(z)).getTaskIsClosed();
                        %>
                        <div class="tab-pane fade" id="tab-display-harjoitus<%=taskID%>">
                            <p><%=InputOutput.clean(taskContent)%></p>
                            <%
                                //Printing task that has taskTypeID = 1 other tasks (2, 3 etc.) need their own if-check
                                if (taskClosed != true && taskTypeID == 1){
                            %>
                            <div class="row">
                            <div class="col-xs-12 col-md-8">
                            <div class="tab-pane text-style" id="tab6">
                            <div class="TaskType">
                            <h2 class="text-center"><%=InputOutput.clean(userName)%> <%=InputOutput.clean(userSurname)%></h2>
                            <h2 class="text-center">Monitorointiharjoitus <%=taskTypeID%></h2>

                            </br>

                            <table class="table harjoitus1-form">
                                <thead>
                                    <tr>
                                        <th>Ajankohta <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></th>
                                        <th>Tekeminen <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></th>
                                        <th>Suojatoiminta % <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></th>
                                        <th>Tehtävään s. toiminta % <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr bgcolor="#FFFFA0">
                                        <th>Aamu</th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <th scope="row"><div class="input-group clockpicker">
                                                <input type="text" class="form-control" value="09:30">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
                                            <script type="text/javascript">
                                            $('.clockpicker').clockpicker();
                                            </script>
                                        </th>
                                        <td><input type="text" class="form-control"></td>
                                        <td><input id="ex1" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
                                        <td><input id="ex1" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
                                    </tr>
                                </tbody>
                                                                <tbody>
                                    <tr bgcolor="#FFFFA0">
                                        <th>Päivä</th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <th scope="row"><div class="input-group clockpicker">
                                                <input type="text" class="form-control" value="09:30">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
                                            <script type="text/javascript">
                                            $('.clockpicker').clockpicker();
                                            </script>
                                        </th>
                                        <td><input type="text" class="form-control"></td>
                                        <td><input id="ex1" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
                                        <td><input id="ex2" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
                                    </tr>
                                </tbody>
                                                                <tbody>
                                    <tr bgcolor="#FFFFA0">
                                        <th>Ilta</th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <th scope="row"><div class="input-group clockpicker">
                                                <input type="text" class="form-control" value="09:30">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
                                            <script type="text/javascript">
                                            $('.clockpicker').clockpicker();
                                            </script>
                                        </th>
                                        <td><input type="text" class="form-control"></td>
                                        <td><input id="ex1" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
                                        <td><input id="ex2" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr bgcolor="#FFFFA0">
                                        <th>Yö</th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <th scope="row"><div class="input-group clockpicker">
                                                <input type="text" class="form-control" value="09:30">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
                                            <script type="text/javascript">
                                            $('.clockpicker').clockpicker();
                                            </script>
                                        </th>
                                        <td><input type="text" class="form-control"></td>
                                        <td><input id="ex1" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
                                        <td><input id="ex2" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
                                    </tr>
                                </tbody>
                            </table>
                                <a id="add_row" class="btn btn-default pull-left">Lisää rivi</a><a id='delete_row' class="pull-right btn btn-default">Poista rivi</a>

                                </br>
                                </br>

                                <table class="table-bottom">
                                    <tbody>
                                        </br>
                                        <tr>
                                            <th><button type="button" class="btn btn-primary btn-lg pull-left">Tallenna <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span></button></th>

                                            <th><button type="button" class="btn btn-secondary btn-lg pull-right">Lähetä <span class="glyphicon glyphicon-send" aria-hidden="true"></span></button></th>
                                        </tr>
                                    </tbody>
                                </table>
                                </div>
                            </div>
                            </div>
                            </div>
                            <%
                                }
                            %>
                        </div> <!-- printing task details ends here -->
                        
                        <div class="tab-pane fade" id="tab-display-viestit<%=taskID%>">
                            <div class="chat">
                                <ul class="chat-ul">
                                <h4><strong>Harjoitus <%=taskTypeID%>. viestit</strong></h4>
                                <%
                                    messages = Database.getTaskMessages(taskID);

                                    //In here we will load and print chat
                                    for (int j = 0; j<messages.size();j++){

                                        messageID = ((Message) messages.get(j)).getMessageID();
                                        messageUserType = ((Message) messages.get(j)).getMessageUserType();
                                        messageContent = ((Message) messages.get(j)).getMessageContent();
                                        messageDate = ((Message) messages.get(j)).getMessageDate();

                                        //these could be swapped to make chat more intuitive
                                        if("customer".equals(messageUserType)){
                                %>
                                <li>
                                    <div class="message-data">
                                        <span class="message-data-name"><i class="fa fa-circle you"></i><%=InputOutput.clean(userName)%> <%=InputOutput.clean(userSurname)%> <%=InputOutput.clean(messageDate)%></span>
                                    </div>
                                    <div class="message you-message">
                                        <p><%=InputOutput.clean(messageContent)%></p>
                                    </div>
                                </li><br>
                                <%
                                    }else{
                                %>
                                <li class="clearfix">
                                    <div class="message-data">
                                        <span class="message-data-name float-right">Martti Puttonen <%=InputOutput.clean(messageDate)%></span>
                                    </div>
                                    <div class="message me-message"> 
                                        <p><%=InputOutput.clean(messageContent)%></p>
                                    </div>
                                </li><br>
                                <%
                                    }
                                }
                                %>
                                </ul>
                            </div> <!-- end chat -->
                        </div>
                        
                        <%
                            }//ends printing all the stuff of one task
                        %>
                        
                    </div>

                </div>  

            </div>
        </div>
        <%
            ArrayList<Detail> details = new ArrayList<Detail>();
            details = Database.getUserCareDetails(userID);

            for(int i = 0; i<details.size(); i++){
                detailID = ((Detail) details.get(i)).getDetailID();
                detailAge = ((Detail) details.get(i)).getDetailAge();
                detailResidencemodel = ((Detail) details.get(i)).getDetailResidencemodel();
                detailLifestyle = ((Detail) details.get(i)).getDetailLifestyle();
                detailHealthservices = ((Detail) details.get(i)).getDetailHealthservices();
                detailProblems = ((Detail) details.get(i)).getDetailProblems();
            }
        %>
        <div class="tab-pane text-style" id="tab2">
            <div class="container">
                <div class="customer-main-container">
                <div class="customer-actions-container">
                    <div class="well">
                    <h2>Ilmaisen kokeiluohjelman taustatiedot</h2>
                    <form action="UpdateUserDetails" method="POST">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Etunimi</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="name" aria-describedby="emailHelp" value="<%=InputOutput.clean(userName)%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Sukunimi</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="surname" aria-describedby="emailHelp" value="<%=InputOutput.clean(userSurname)%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Asuinosoite</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="address" aria-describedby="emailHelp" value="<%=InputOutput.clean(userAddress)%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Postinumero</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="postalcode" aria-describedby="emailHelp" value="<%=InputOutput.clean(userPostalcode)%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Postitoimipaikka</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="postoffice" aria-describedby="emailHelp" value="<%=InputOutput.clean(userPostoffice)%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Puhelin</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="phonenumber" aria-describedby="emailHelp" value="<%=InputOutput.clean(userPhonenumber)%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Sähköpostiosoite</label>
                            <input type="hidden" name="email" value="<%=InputOutput.clean(userEmail)%>">
                            <p><%=InputOutput.clean(userEmail)%></p>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Ikä</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="age" aria-describedby="emailHelp" value="<%=InputOutput.clean(detailAge)%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Asuinmuoto: asun yksin / ystävän, avopuolison kanssa/ vanhempieni, ystävän taloudessa/ avioliitossa/ asuinmuotoni ja -paikkani vaihtelee jatkuvasti, ei siis ole vakituista kotina pidettävää asuinpaikkaa</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="residencemodel" aria-describedby="emailHelp" value="<%=InputOutput.clean(detailResidencemodel)%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Nykyinen viikoittainen tai muutoin säännöllinen elämäntapasi: työtön, eläkkeellä, sairausturva/ elän epäsäännöllisten ja tilapäisten tukien ja tulojen avulla/ opiskelen pääasiallisesti/ työssä, työkokeilussa, ammatillisessa työsuhteessa/ ei säännönmukaista elämäntapaa</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="lifestyle" aria-describedby="emailHelp" value="<%=InputOutput.clean(detailLifestyle)%>">
                        </div>

                        <br>
                        <%
                            if("A".equals(detailHealthservices)){
                        %>
                        <label class="control control--radio">Käytän suhteellisen säännöllisesti päivittäistä sosiaalista elämääni tukevia terveys- ja kuntoutuspalveluita
                            <input type="radio" name="healthservices" value="A" checked="checked"/>
                            <div class="control__indicator"></div>
                        </label>
                        <%
                            }else{
                        %>
                        <label class="control control--radio">Käytän suhteellisen säännöllisesti päivittäistä sosiaalista elämääni tukevia terveys- ja kuntoutuspalveluita
                            <input type="radio" value="A" name="healthservices"/>
                            <div class="control__indicator"></div>
                        </label>
                        <%
                            }
                            if("B".equals(detailHealthservices)){
                        %>
                        <label class="control control--radio">En ole varsinaisesti missään pitempikestoisessa elämääni tukevassa kuntoutus- ja palvelumuotojen piirissä
                            <input type="radio" name="healthservices" value="B" checked="checked"/>
                            <div class="control__indicator"></div>
                        </label>
                        <%
                            }else{
                        %>
                        <label class="control control--radio">En ole varsinaisesti missään pitempikestoisessa elämääni tukevassa kuntoutus- ja palvelumuotojen piirissä
                            <input type="radio" name="healthservices" value="B"/>
                            <div class="control__indicator"></div>
                        </label>
                        <%
                            }
                            if("C".equals(detailHealthservices)){
                        %>
                        <label class="control control--radio">Saamani palvelut ovat epämääräisiä ja johonkin päivittäiseen ongelman ratkaisuun, 
                            kuten lääkitykseen, rahallisten tukien saamiseen keskittyneitä, tilanteeni yleistä seurantaa
                            <input type="radio" name="healthservices" value="C" checked="checked"/>
                            <div class="control__indicator"></div>
                        </label>
                        <%
                            }else{
                        %>
                        <label class="control control--radio">Saamani palvelut ovat epämääräisiä ja johonkin päivittäiseen ongelman ratkaisuun, 
                            kuten lääkitykseen, rahallisten tukien saamiseen keskittyneitä, tilanteeni yleistä seurantaa
                            <input type="radio" name="healthservices" value="C"/>
                            <div class="control__indicator"></div>
                        </label>
                        <%
                            }
                        %>
                        <br>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Nimeä ja luetteloi lyhyesti ongelmia, sekä elämistäsi vaikeuttavia asioita kuten mielenterveydellisiä vaikeuksiasi omin sanoin</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="problems" aria-describedby="emailHelp" value="<%=InputOutput.clean(detailProblems)%>">
                        </div>
                        <input type="hidden" name="userid" value="<%=userID%>">
                        <input type="submit" class="btn btn-primary" value="Päivitä muutokset">
                    </form>
                    </div>

                </div>
                
                <div class="customer-display-container">
                    <p>Tähän terapeutin palaute</p>
                </div>
            
            </div>    
        </div>
        </div>
    </div>
        <div class="container-bottom">
            <hr>
            <p class="muted">© 2016 Martti Puttonen.</p>
            <hr>
        </div>
        <script type="text/javascript" src="addrow.js"></script>

    </body>
</html>
