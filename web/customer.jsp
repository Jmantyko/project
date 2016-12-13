<%-- 
    Document   : customer
    Created on : 25-Oct-2016, 13:14:07
    Author     : Jaakko
--%>

<%@page import="Arjenhallinta.Memo3"%>
<%@page import="Arjenhallinta.Memo2"%>
<%@page import="Arjenhallinta.Memo1"%>
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
	
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	
    <!-- Bootstrap slider CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/9.3.2/css/bootstrap-slider.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/9.3.2/css/bootstrap-slider.min.css">
    
    <link rel="stylesheet" href="style.css" type="text/css">
    
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
    
    .table-hover {
        border: 2px solid #F5F5F5;
    }
    
    .table-hover thead {
    border-radius: 10px;
    -moz-border-radius: 10px;
    border-radius: 5px;
    background-color: whitesmoke;
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

                System.out.println("CUSTOMER SESSION email NULL: " + session.getAttribute("email"));
                response.sendRedirect("etusivu.jsp");

            } else {
                email = (String) session.getAttribute("email");
                System.out.println("CUSTOMER SESSION email NOT NULL: " + session.getAttribute("email"));

                String userType = Database.userType(email);
                
                if ("customer".equals(userType)) {

                    Cookie[] cookies = request.getCookies();

                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals("email")) {
                                userEmail = cookie.getValue();
                                System.out.println("CUSTOMER COOKIE email: " + userEmail);
                            }
                            if (cookie.getName().equals("JSESSIONID")) {
                                sessionID = cookie.getValue();
                                System.out.println("CUSTOMER COOKIE jsessionid: " + sessionID);
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
            <li class="active"><a href="customer.jsp#tab1" data-toggle="tab">Etusivu</a></li>
            <li><a href="#tab2" data-toggle="tab">Taustatiedot</a></li>
            <li class=""><a href="etusivu.jsp#martti">Martti Puttonen</a></li>
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
                        <input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">
                            <i class="glyphicon glyphicon-lock"></i> Salasana
                        </label> 
                        <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
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
        <div class="tab-pane active text-style min-height" id="tab1">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
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
                                <br><p>Terapeuttisi ei vielä ole avannut sinulle harjoituksia.</p>
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
                                <button type="button" class="btn btn-group btn-group-justified btn-primary" data-toggle="tab" href="#tab-display-harjoitus<%=taskID%>">Harjoitus <%=taskTypeID%>.</button>
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
                                        taskClosed = ((Task) tasks.get(k)).getTaskIsClosed();
                                        
                                        if(taskClosed != true){
                                        %>
                                        <button type="button" class="btn btn-group btn-group-justified btn-primary" data-toggle="tab" href="#tab-display-viestit<%=taskID%>">Harjoitus <%=taskTypeID%>. viestit</button>
                                        <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab-display-welcome">
                            <h2>Tervetuloa Arjenhallinta -sovellukseen!</h2>
                            <p>Pääset täyttämään Harjoituksiasi ja lukemaan Terapeuttisi lähettämää palautetta sivun vasemman reunan ikkunasta.</p>
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
                            <%
                                //Printing task that has taskTypeID = 1 other tasks (2, 3 etc.) need their own if-check
                                if (taskClosed != true && taskTypeID == 1){
                                    
                                    ArrayList<Memo1> memos = new ArrayList<Memo1>();
                                    memos = Database.getTaskMemos1(taskID);
                                    
                                    int idForNewMemo = 0;
                                    int memoID;
                                    String memoTime = "";
                                    String memoDoing = "";
                                    String memoSuojaPercentage = "";
                                    String memoTehtPercentage = "";
                            %>
                            <div class="tab-pane text-style" id="tab6">
                            <div class="TaskType">
                            <h3 class="text-center">Monitorointiharjoitus <%=taskTypeID%></h3>

                            <div class="panel-group">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#ohje1">Ohje</a>
                                    </h4>
                                </div>
                                <div id="ohje1" class="panel-collapse collapse">
                                    <div>
                                        <p>
                                            Palauta mieleesi vapaavalintaisen lähimenneisyyden päivän tapahtumia. Kirjoita ylös tapahtuman ajankohta, (esim. numeroin 8:00) tai sanallisesti. Arvioi kyseiseen tehtävään käytettyä keskittymisen tasoa kohdassa Tehtävään suuntautunut toiminta ja Suojatoiminnan (esim. torjuminen, kieltäminen, siirtäminen) vahvuutta kyseisessä toiminnassa. 
                                            Ei haittaa, vaikka et täyttäisi harjoitusta täydellisesti, sillä myös vajaasi jäänyt vastaus on arvokas.  
                                            <br><br>
                                            Tallentaessasi harjoituksen Terapeuttisi antaa palautetta vastauksestasi 1-3 päivän kuluessa. Kiitokset etukäteen vastauksestasi!
                                        </p>
                                    </div>
                                </div>
                           </div>
                            
                            
                            <form action="UpdateMemos" method="POST">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Ajankohta <a style="cursor:help;" data-toggle="tooltip" title="Ajankohta on aikaväli noin 10 minuutista 2 tuntiin" class="tooltipLink" data-original-title="Tooltip text goes here">
                                                <span class="glyphicon glyphicon-info-sign"></span>
                                            </a>
                                        </th>
                                        <th>Tekeminen <a style="cursor:help;" data-toggle="tooltip" title="Tekeminen tarkoittaa jotakin toimintatilanteesi vaihetta, esim. aamupala, lehden luku, television katselu, työ tai opiskelutehtävän tekeminen, siistiminen, ruoan valmistus, ruokailu, jne. käytä omia sanoja" class="tooltipLink" data-original-title="Tooltip text goes here">
                                                <span class="glyphicon glyphicon-info-sign"></span>
                                            </a>
                                        </th>
                                        <th>Suojatoiminta % <a style="cursor:help;" data-toggle="tooltip" title="Suojatoimintasi on vähäistä keskittymistäsi kyseisessä tilanteessa, kuten tehtävän torjumista mielessäsi, käsillä olevien haasteiden tukahduttamista kuten keskittymistä oheistoimintaan, keinotekoista mielihyvän tavoittelua, jne." class="tooltipLink" data-original-title="Tooltip text goes here">
                                                <span class="glyphicon glyphicon-info-sign"></span>
                                            </a></th>
                                        <th>Tehtävään s. toiminta % <a style="cursor:help;" data-toggle="tooltip" title="Tehtävään suuntautunut toiminta. Ongelmanratkaisutoimintasi on tilanteessa sopivaa keskittymisen tasoa, sopivaa voimiesi jakamista, tilanteessasi toteuttamasi toiminnan tai olemisen tavan arvioivaa tunnistamista, tietoisuutta, miten hyvin tai vahvasti etenet tämän kyseisen toiminnan toteuttamisessa, jne." class="tooltipLink" data-original-title="Tooltip text goes here">
                                                <span class="glyphicon glyphicon-info-sign"></span>
                                            </a>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    for(int i = 0; i < memos.size(); i++){
                                        
                                        //Here we get all the small details about each task (time, doing, two percentage values)
                                        //and print all those details
                                        memoID = ((Memo1) memos.get(i)).getMemoID();
                                        memoTime = ((Memo1) memos.get(i)).getMemoTime();
                                        memoDoing = ((Memo1) memos.get(i)).getMemoDoing();
                                        memoSuojaPercentage = ((Memo1) memos.get(i)).getMemoSuojaPercentage();
                                        memoTehtPercentage = ((Memo1) memos.get(i)).getMemoTehtPercentage();
                                        
                                        idForNewMemo = memoID;
                                    %>
                                    <script>
                                        $(function(){
                                            $('#ex<%=memoID%>').slider({
                                                formater: function(value) {
                                                    return 'Current value: ' + value;
                                                }
                                            });
                                        });
                                        
                                        $(function(){
                                            $('#exx<%=memoID%>').slider({
                                                formater: function(value) {
                                                    return 'Current value: ' + value;
                                                }
                                            });
                                        });
                                    </script>
                                    <input name="memoid" type="hidden" value="<%=memoID%>">
                                    <tr>
                                        <td><input name="memotime" id="id<%=memoID%>" type="text" class="form-control" value="<%=InputOutput.clean(memoTime)%>" placeholder="Syötä aika"></td>
                                        <td><input name="memodoing" id="id<%=memoID%>" type="text" class="form-control" value="<%=InputOutput.clean(memoDoing)%>" placeholder="Syötä jokin tekeminen"></td>
                                        <td><input name="memosuojapercentage" id="ex<%=memoID%>" data-slider-id='exSlider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="<%=InputOutput.clean(memoSuojaPercentage)%>"></td>
                                        <td><input name="memotehtpercentage" id="exx<%=memoID%>" data-slider-id='exSlider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="<%=InputOutput.clean(memoTehtPercentage)%>"></td>
                                    </tr>
                                    <%
                                    }
                                    
                                    idForNewMemo = idForNewMemo + 1;
                                    %>
                                    <script>
                                        $(function(){
                                            $('#ex<%=idForNewMemo%>').slider({
                                                formater: function(value) {
                                                    return 'Current value: ' + value;
                                                }
                                            });
                                        });
                                        
                                        $(function(){
                                            $('#exx<%=idForNewMemo%>').slider({
                                                formater: function(value) {
                                                    return 'Current value: ' + value;
                                                }
                                            });
                                        });
                                    </script>
                                    <input name="memotaskid" type="hidden" value="<%=taskID%>">
                                    <input name="userid" type="hidden" value="<%=userID%>">
                                    <tr>
                                        <td><input name="newmemotime" id="id<%=idForNewMemo%>" type="text" class="form-control" placeholder="Syötä aika"></td>
                                        <td><input name="newmemodoing" id="id<%=idForNewMemo%>" type="text" class="form-control" placeholder="Syötä jokin tekeminen"></td>
                                        <td><input name="newmemosuojapercentage" id="ex<%=idForNewMemo%>" data-slider-id='exSlider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="0"></td>
                                        <td><input name="newmemotehtpercentage" id="exx<%=idForNewMemo%>" data-slider-id='exSlider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="0"></td>
                                    </tr>
                                </tbody>
                            </table>
                                <input type="submit" class="btn btn-primary" value="Tallenna muutokset">
                            </form> 
                                </br>
                                </br>
                                </div>
                            </div>
                            <%
                                }
                                if (taskClosed != true && taskTypeID == 2){
                                    
                                    ArrayList<Memo2> memos2 = new ArrayList<Memo2>();
                                    memos2 = Database.getTaskMemos2(taskID);
                                    
                                    int idForNewMemo = 0;
                                    int memoID;
                                    String memoTime = "";
                                    String memoDoing = "";
                                    String memoPositivePercentage = "";
                                    String memoNegativePercentage = "";
                            %>
                            <div class="tab-pane text-style" id="tab6">
                            <div class="TaskType">
                            <h3 class="text-center">Monitorointiharjoitus <%=taskTypeID%></h3>
                            <div class="panel-group">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                      <a data-toggle="collapse" href="#ohje2">Ohje</a>
                                    </h4>
                                </div>
                                <div id="ohje2" class="panel-collapse collapse">
                                    <div>
                                        <p>
                                            Merkitse harjoitukseen edellisen tai kuluvan päivän tapahtumia ja niissä ilmenevien tunnekokemusten laatua ja määrää. yri kattavaan vastaukseen, mutta muista ettei vastauksen tarvi olla täydellinen. Keskity erityisesti tekemisen kohteeseen joka voi olla täysin arkinen toiminta, pelkkä oleminen tai jokin erityinen tapahtuma.
                                            <br><br>
                                            Tallentaessasi harjoituksen Terapeuttisi antaa palautetta vastauksestasi 1-3 päivän kuluessa. Kiitokset etukäteen vastauksestasi!
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <form action="UpdateMemos2" method="POST">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Ajankohta <a style="cursor:help;" data-toggle="tooltip" title="Aikaväli on 10 minuutista 2 tuntiin tai enemmän" class="tooltipLink" data-original-title="Tooltip text goes here">
                                                <span class="glyphicon glyphicon-info-sign"></span>
                                            </a>
                                        </th>
                                        <th>Tekeminen tai oleminen <a style="cursor:help;" data-toggle="tooltip" title="Tekemisesi ja tai olemisesi luonne on jotenkin nimetty, esim. aamupala, aamutoimet, työmatka, siistiminen, soittaminen äidille, työvoimatoimistossa käynti" class="tooltipLink" data-original-title="Tooltip text goes here">
                                                <span class="glyphicon glyphicon-info-sign"></span>
                                            </a>
                                        </th>
                                        <th>Positiivinen <br> vireytyminen % <a style="cursor:help;" data-toggle="tooltip" title="Positiivinen vireytyminen tarkoittaa hallintakokemuksesi positiivista astetta; esim. koet myönteisiä tuntemuksia, saat hallintakokemusta, että teet sitä mitä sinun mielestäsi tulikin tilanteessa tehdä" class="tooltipLink" data-original-title="Tooltip text goes here">
                                                <span class="glyphicon glyphicon-info-sign"></span>
                                            </a></th>
                                        <th>Negatiivinen <br> vireytyminen % <a style="cursor:help;" data-toggle="tooltip" title="Negatiivinen vireytyminen tarkoittaa astetta, missä määrin keskittymisesi hajoaa epäoleellisuuksiin, sinulle tulee tarpeetonta tunnekuormaa joka vie keskittymistäsi, siirrytkin tekemään jotakin mielihyvätoimintaa, esim. katselet televisiota, surffaat, siirryt tauolle, kaljan juontiin, panikoimaan, murehtimaan, vaivut epätoivoon, masentaviin ajatuksiin" class="tooltipLink" data-original-title="Tooltip text goes here">
                                                <span class="glyphicon glyphicon-info-sign"></span>
                                            </a>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    for(int i = 0; i < memos2.size(); i++){
                                        
                                        //Here we get all the small details about each task (time, doing, two percentage values)
                                        //and print all those details
                                        memoID = ((Memo2) memos2.get(i)).getMemoID();
                                        memoTime = ((Memo2) memos2.get(i)).getMemoTime();
                                        memoDoing = ((Memo2) memos2.get(i)).getMemoDoing();
                                        memoPositivePercentage = ((Memo2) memos2.get(i)).getMemoPositivePercentage();
                                        memoNegativePercentage = ((Memo2) memos2.get(i)).getMemoNegativePercentage();
                                        
                                        idForNewMemo = memoID;
                                    %>
                                    <script>
                                        $(function(){
                                            $('#2ex<%=memoID%>').slider({
                                                formater: function(value) {
                                                    return 'Current value: ' + value;
                                                }
                                            });
                                        });
                                        
                                        $(function(){
                                            $('#2exx<%=memoID%>').slider({
                                                formater: function(value) {
                                                    return 'Current value: ' + value;
                                                }
                                            });
                                        });
                                    </script>
                                    <input name="memoid" type="hidden" value="<%=memoID%>">
                                    <tr>
                                        <td><input name="memotime" id="id<%=memoID%>" type="text" class="form-control" value="<%=InputOutput.clean(memoTime)%>" placeholder="Syötä aika"></td>
                                        <td><input name="memodoing" id="id<%=memoID%>" type="text" class="form-control" value="<%=InputOutput.clean(memoDoing)%>" placeholder="Syötä jokin tekeminen"></td>
                                        <td><input name="memopositivepercentage" id="2ex<%=memoID%>" data-slider-id='exSlider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="<%=InputOutput.clean(memoPositivePercentage)%>"></td>
                                        <td><input name="memonegativepercentage" id="2exx<%=memoID%>" data-slider-id='exSlider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="<%=InputOutput.clean(memoNegativePercentage)%>"></td>
                                    </tr>
                                    <%
                                    }
                                    
                                    idForNewMemo = idForNewMemo + 1;
                                    %>
                                    <script>
                                        $(function(){
                                            $('#2ex<%=idForNewMemo%>').slider({
                                                formater: function(value) {
                                                    return 'Current value: ' + value;
                                                }
                                            });
                                        });
                                        
                                        $(function(){
                                            $('#2exx<%=idForNewMemo%>').slider({
                                                formater: function(value) {
                                                    return 'Current value: ' + value;
                                                }
                                            });
                                        });
                                    </script>
                                    <input name="memotaskid" type="hidden" value="<%=taskID%>">
                                    <input name="userid" type="hidden" value="<%=userID%>">
                                    <tr>
                                        <td><input name="newmemotime" id="id<%=idForNewMemo%>" type="text" class="form-control" placeholder="Syötä aika"></td>
                                        <td><input name="newmemodoing" id="id<%=idForNewMemo%>" type="text" class="form-control" placeholder="Syötä jokin tekeminen"></td>
                                        <td><input name="newmemopositivepercentage" id="2ex<%=idForNewMemo%>" data-slider-id='exSlider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="0"></td>
                                        <td><input name="newmemonegativepercentage" id="2exx<%=idForNewMemo%>" data-slider-id='exSlider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="0"></td>
                                    </tr>
                                </tbody>
                            </table>
                                <input type="submit" class="btn btn-primary" value="Tallenna muutokset">
                            </form> 
                                </br>
                                </br>
                                </div>
                            </div>
                            <%
                                }
                                if (taskClosed != true && taskTypeID == 3){
                                    
                                    ArrayList<Memo3> memos3 = new ArrayList<Memo3>();
                                    memos3 = Database.getTaskMemos3(taskID);
                                    
                                    int idForNewMemo = 0;
                                    int memoID;
                                    String memoTime = "";
                                    String memoDoing = "";
                                    String memoPositivePercentage = "";
                                    String memoNegativePercentage = "";
                                    String memoTehtPercentage = "";
                            %>
                            <div class="tab-pane text-style" id="tab6">
                            <div class="TaskType">
                            <h3 class="text-center">Monitorointiharjoitus <%=taskTypeID%></h3>
                            
                            <div class="panel-group">
                               <div class="panel-heading">
                                 <h4 class="panel-title">
                                   <a data-toggle="collapse" href="#ohje3">Ohje</a>
                                 </h4>
                               </div>
                               <div id="ohje3" class="panel-collapse collapse">
                                   <div>
                                        <p>
                                        Merkitse harjoitukseen tavallista tunteikkaimmat tapahtumat edellisiltä tai kuluvalta päivältä. Arvioi tapahtuman tai tekemisen suojatoiminnan laatua sekä tekemiseen suuntautunutta toimintaa tai ongelmanratkaisua. Tavoitteena on tunnistaa arjessa esiintyvät voimakkaat tunteet sekä jäsentää niitä osana suojatoimintaa tai tekemistä.
                                        <br><br>
                                        Tallentaessasi harjoituksen Terapeuttisi antaa palautetta vastauksestasi 1-3 päivän kuluessa. Kiitokset etukäteen vastauksestasi!
                                        </p>
                                   </div>
                               </div>
                           </div>
                            
                            <form action="UpdateMemos3" method="POST">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Ajankohta <a style="cursor:help;" data-toggle="tooltip" title="Aikaväli on 10 minuutista 2 tuntiin tai enemmän" class="tooltipLink" data-original-title="Tooltip text goes here">
                                                <span class="glyphicon glyphicon-info-sign"></span>
                                            </a>
                                        </th>
                                        <th>Tekeminen tai oleminen <a style="cursor:help;" data-toggle="tooltip" title="Tekemisesi ja tai olemisesi luonne on jotenkin nimetty, esim. aamupala, aamutoimet, työmatka, siistiminen, soittaminen äidille, työvoimatoimistossa käynti" class="tooltipLink" data-original-title="Tooltip text goes here">
                                                <span class="glyphicon glyphicon-info-sign"></span>
                                            </a>
                                        </th>
                                        <th>Positiivinen suojatoiminta % <a style="cursor:help;" data-toggle="tooltip" title="Positiivinen vireytyminen tarkoittaa hallintakokemuksesi positiivista astetta; esim. koet myönteisiä tuntemuksia, saat hallintakokemusta, että teet sitä mitä sinun mielestäsi tulikin tilanteessa tehdä" class="tooltipLink" data-original-title="Tooltip text goes here">
                                                <span class="glyphicon glyphicon-info-sign"></span>
                                            </a></th>
                                        <th>Negatiivinen suojatoiminta % <a style="cursor:help;" data-toggle="tooltip" title="Negatiivinen vireytyminen tarkoittaa astetta, missä määrin keskittymisesi hajoaa epäoleellisuuksiin, sinulle tulee tarpeetonta tunnekuormaa joka vie keskittymistäsi, siirrytkin tekemään jotakin mielihyvätoimintaa, esim. katselet televisiota, surffaat, siirryt tauolle, kaljan juontiin, panikoimaan, murehtimaan, vaivut epätoivoon, masentaviin ajatuksiin" class="tooltipLink" data-original-title="Tooltip text goes here">
                                                <span class="glyphicon glyphicon-info-sign"></span>
                                            </a>
                                        </th>
                                        <th>Tehtävään s. toiminta % <a style="cursor:help;" data-toggle="tooltip" title="Tehtävään suuntautunut toiminta. Ongelmanratkaisutoimintasi on tilanteessa sopivaa keskittymisen tasoa, sopivaa voimiesi jakamista, tilanteessasi toteuttamasi toiminnan tai olemisen tavan arvioivaa tunnistamista, tietoisuutta, miten hyvin tai vahvasti etenet tämän kyseisen toiminnan toteuttamisessa, jne." class="tooltipLink" data-original-title="Tooltip text goes here">
                                                <span class="glyphicon glyphicon-info-sign"></span>
                                            </a>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    for(int i = 0; i < memos3.size(); i++){
                                        
                                        //Here we get all the small details about each task (time, doing, two percentage values)
                                        //and print all those details
                                        memoID = ((Memo3) memos3.get(i)).getMemoID();
                                        memoTime = ((Memo3) memos3.get(i)).getMemoTime();
                                        memoDoing = ((Memo3) memos3.get(i)).getMemoDoing();
                                        memoPositivePercentage = ((Memo3) memos3.get(i)).getMemoPositivePercentage();
                                        memoNegativePercentage = ((Memo3) memos3.get(i)).getMemoNegativePercentage();
                                        memoTehtPercentage = ((Memo3) memos3.get(i)).getMemoTehtPercentage();
                                        
                                        idForNewMemo = memoID;
                                    %>
                                    <script>
                                        $(function(){
                                            $('#3ex<%=memoID%>').slider({
                                                formater: function(value) {
                                                    return 'Current value: ' + value;
                                                }
                                            });
                                        });
                                        
                                        $(function(){
                                            $('#3exx<%=memoID%>').slider({
                                                formater: function(value) {
                                                    return 'Current value: ' + value;
                                                }
                                            });
                                        });
                                        
                                        $(function(){
                                            $('#3exxx<%=memoID%>').slider({
                                                formater: function(value) {
                                                    return 'Current value: ' + value;
                                                }
                                            });
                                        });
                                    </script>
                                    <input name="memoid" type="hidden" value="<%=memoID%>">
                                    <tr>
                                        <td><input name="memotime" id="id<%=memoID%>" type="text" class="form-control" value="<%=InputOutput.clean(memoTime)%>" placeholder="Syötä aika"></td>
                                        <td><input name="memodoing" id="id<%=memoID%>" type="text" class="form-control" value="<%=InputOutput.clean(memoDoing)%>" placeholder="Syötä jokin tekeminen"></td>
                                        <td><input name="memopositivepercentage" id="3ex<%=memoID%>" data-slider-id='exSlider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="<%=InputOutput.clean(memoPositivePercentage)%>"></td>
                                        <td><input name="memonegativepercentage" id="3exx<%=memoID%>" data-slider-id='exSlider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="<%=InputOutput.clean(memoNegativePercentage)%>"></td>
                                        <td><input name="memotehtpercentage" id="3exxx<%=memoID%>" data-slider-id='exSlider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="<%=InputOutput.clean(memoTehtPercentage)%>"></td>
                                    </tr>
                                    <%
                                    }
                                    
                                    idForNewMemo = idForNewMemo + 1;
                                    %>
                                    <script>
                                        $(function(){
                                            $('#3ex<%=idForNewMemo%>').slider({
                                                formater: function(value) {
                                                    return 'Current value: ' + value;
                                                }
                                            });
                                        });
                                        
                                        $(function(){
                                            $('#3exx<%=idForNewMemo%>').slider({
                                                formater: function(value) {
                                                    return 'Current value: ' + value;
                                                }
                                            });
                                        });
                                        
                                        $(function(){
                                            $('#3exxx<%=idForNewMemo%>').slider({
                                                formater: function(value) {
                                                    return 'Current value: ' + value;
                                                }
                                            });
                                        });
                                    </script>
                                    <input name="memotaskid" type="hidden" value="<%=taskID%>">
                                    <input name="userid" type="hidden" value="<%=userID%>">
                                    <tr>
                                        <td><input name="newmemotime" id="id<%=idForNewMemo%>" type="text" class="form-control" placeholder="Syötä aika"></td>
                                        <td><input name="newmemodoing" id="id<%=idForNewMemo%>" type="text" class="form-control" placeholder="Syötä jokin tekeminen"></td>
                                        <td><input name="newmemopositivepercentage" id="3ex<%=idForNewMemo%>" data-slider-id='exSlider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="0"></td>
                                        <td><input name="newmemonegativepercentage" id="3exx<%=idForNewMemo%>" data-slider-id='exSlider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="0"></td>
                                        <td><input name="newmemotehtpercentage" id="3exxx<%=idForNewMemo%>" data-slider-id='exSlider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="0"></td>
                                    </tr>
                                </tbody>
                            </table>
                                <input type="submit" class="btn btn-primary" value="Tallenna muutokset">
                            </form> 
                                </br>
                                </br>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div> <!-- printing task details ends here -->
                        
                        <div class="tab-pane fade" id="tab-display-viestit<%=taskID%>">
                            <div class="chat">
                                <ul class="chat-ul">
                                <h4><strong>Monitorointiharjoitus <%=taskTypeID%>. viestit</strong></h4>
                                <%
                                    messages = Database.getTaskMessages(taskID);

                                    //In here we will load and print chat
                                    for (int j = 0; j<messages.size();j++){

                                        messageID = ((Message) messages.get(j)).getMessageID();
                                        messageUserType = ((Message) messages.get(j)).getMessageUserType();
                                        messageContent = ((Message) messages.get(j)).getMessageContent();
                                        messageDate = ((Message) messages.get(j)).getMessageDate();

                                        if("admin".equals(messageUserType)){
                                %>
                                <li>
                                    <div class="message-data">
                                        <span class="message-data-name"><i class="fa fa-circle you"></i>Martti Puttonen <%=InputOutput.clean(messageDate)%></span>
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
                                        <span class="message-data-name float-right"><%=InputOutput.clean(userName)%> <%=InputOutput.clean(userSurname)%> <%=InputOutput.clean(messageDate)%></span>
                                    </div>
                                    <div class="message me-message"> 
                                        <p><%=InputOutput.clean(messageContent)%></p>
                                    </div>
                                </li><br>
                                <%
                                    }
                                }
                                %>
                                <form action="SendMessage" method="POST">
                                    <input type="text" name="message" class="form-control"><br>
                                    <input type="hidden" name="taskid" value="<%=taskID%>">
                                    <input type="hidden" name="usertype" value="customer">
                                    <input type="hidden" name="messagetype" value="A">
                                    <input type="hidden" name="userid" value="<%=userID%>">
                                    <input type="submit" class="btn btn-primary" value="Lähetä">
                                </form>
                                    
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
                <div class="row">
                <div class="col-sm-6">
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
                
                <div class="col-md-6">
                    <div class="chat">
                                <ul class="chat-ul">
                                <h3>Keskustelu taustatiedoista</h3>
                                <%
                                    messages = Database.getDetailMessages(detailID);

                                    //In here we will load and print chat
                                    for (int j = 0; j<messages.size();j++){

                                        messageID = ((Message) messages.get(j)).getMessageID();
                                        messageUserType = ((Message) messages.get(j)).getMessageUserType();
                                        messageContent = ((Message) messages.get(j)).getMessageContent();
                                        messageDate = ((Message) messages.get(j)).getMessageDate();

                                        if("admin".equals(messageUserType)){
                                %>
                                <li>
                                    <div class="message-data">
                                        <span class="message-data-name"><i class="fa fa-circle you"></i>Martti Puttonen <%=InputOutput.clean(messageDate)%></span>
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
                                        <span class="message-data-name float-right"><%=InputOutput.clean(userName)%> <%=InputOutput.clean(userSurname)%> <%=InputOutput.clean(messageDate)%></span>
                                    </div>
                                    <div class="message me-message"> 
                                        <p><%=InputOutput.clean(messageContent)%></p>
                                    </div>
                                </li><br>
                                <%
                                    }
                                }
                                %>
                                <form action="SendMessage" method="POST">
                                    <input type="text" name="message" class="form-control"><br>
                                    <input type="hidden" name="detailid" value="<%=detailID%>">
                                    <input type="hidden" name="usertype" value="customer">
                                    <input type="hidden" name="messagetype" value="B">
                                    <input type="hidden" name="userid" value="<%=userID%>">
                                    <input type="submit" class="btn btn-primary" value="Lähetä">
                                </form>
                                    
                                </ul>
                            </div> <!-- end chat -->
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
