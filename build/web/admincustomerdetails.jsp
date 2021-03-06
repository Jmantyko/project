<%-- 
    Document   : admincustomerdetails
    Created on : 17-Nov-2016, 14:49:27
--%>

<%@page import="Arjenhallinta.Memo3"%>
<%@page import="Arjenhallinta.Memo2"%>
<%@page import="Arjenhallinta.Memo1"%>
<%@page import="Arjenhallinta.Message"%>
<%@page import="Arjenhallinta.Detail"%>
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
    
    .topBuffer {
        margin-top: 20px;
    }
	
    </style>
	
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    <!-- jQuery Version 1.11.1 -->
    <script src="js/jquery.js"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/9.3.2/bootstrap-slider.js"></script>
    <script type="text/javascript" https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/9.3.2/bootstrap-slider.min.js</script>

    <!-- Clockpicker Javascript -->

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
        

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    
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
    <a class="navbar-brand" style="color:#f2f2f2" href="etusivu.jsp">Arjenhallinta.fi</a>
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
    int userID = Integer.parseInt(stringUserID);

    String userName = Database.getUserNameUsingID(userID);
    String userSurname = Database.getUserSurnameUsingID(userID);
    %>
    
    <h3><%=InputOutput.clean(userName)%> <%=InputOutput.clean(userSurname)%></h3>
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
                            //Variables for tasks
                            ArrayList<Task> tasks = new ArrayList<Task>();
                            tasks = Database.getUserTasks(userID);
                            int taskID = 0;
                            int taskTypeID = 0;
                            String taskContent = "";
                            boolean taskIsReturned;
                            boolean taskIsClosed;
                            
                            //Variables for messages
                            ArrayList<Message> messages = new ArrayList<Message>();
                            messages = Database.getTaskMessages(taskID);
                            int messageID = 0;
                            String messageUserType = "";
                            String messageContent = "";
                            String messageDate = "";
                            
                            if(tasks.size() == 0){
                        %>
                        <p><strong>Ei aikaisempia harjoituksia.</strong></p>
                        <%
                            }

                            if(tasks.size() != 0){
                        %>
                        <p><strong>Avoimet harjoitukset:</strong></p>
                        <%
                            }

                            //In this for loop we will print all user
                            //tasks and make each print to be
                            //a separate link which admin can press
                            //to get more details later below
                            for (int i = 0; i < tasks.size(); i++) {

                                taskID = ((Task) tasks.get(i)).getTaskID();
                                taskTypeID = ((Task) tasks.get(i)).getTaskTypeID();
                                taskIsReturned = ((Task) tasks.get(i)).getTaskIsReturned();
                                taskIsClosed = ((Task) tasks.get(i)).getTaskIsClosed();
                                if(taskIsReturned == false && taskIsClosed == false){
                        %>
                        <a href='#tab-content<%=taskID%>' data-toggle="tab">Monitorointiharjoitus <%=taskTypeID%>.</a><br>
                        <%
                                }
                            }

                            if(tasks.size() != 0){
                        %>
                        <br><p><strong>Palautetut harjoitukset:</strong></p>
                        <%
                            }

                            for (int i = 0; i < tasks.size(); i++) {

                                taskID = ((Task) tasks.get(i)).getTaskID();
                                taskTypeID = ((Task) tasks.get(i)).getTaskTypeID();
                                taskIsReturned = ((Task) tasks.get(i)).getTaskIsReturned();
                                taskIsClosed = ((Task) tasks.get(i)).getTaskIsClosed();
                                if(taskIsReturned == true && taskIsClosed == false){
                        %>
                        <a href='#tab-content<%=taskID%>' data-toggle="tab">Monitorointiharjoitus <%=taskTypeID%>.</a><br>
                        <%
                                }
                            }

                            if(tasks.size() != 0){
                        %>
                        <br><p><strong>Suljetut harjoitukset:</strong></p>
                        <%
                            }

                            for (int i = 0; i < tasks.size(); i++) {

                                taskID = ((Task) tasks.get(i)).getTaskID();
                                taskTypeID = ((Task) tasks.get(i)).getTaskTypeID();
                                taskIsClosed = ((Task) tasks.get(i)).getTaskIsClosed();
                                if(taskIsClosed == true){
                        %>
                        <a href='#tab-content<%=taskID%>' data-toggle="tab">Monitorointiharjoitus <%=taskTypeID%>.</a><br>
                        <%
                                }
                            }
                        %>
                    
                    </div>
                </div>
                <div class="tab-pane fade" id="tab-contentB">
                    <div>
                        <h4>Lähetä asiakkaalle uusi monitorointiharjoitus valitsemalla harjoitus ja klikkaamalla Lähetä-painiketta.</h4>
                        <h6>Huom. jos asiakkaalla on jo avoinna olevissa tai palautetuissa harjoituksissa sama harjoitus, uutta harjoitusta
                            ei avata ennen kuin edellinen on suljettu</h6>
                        <form action="OpenNewTask" method="POST">
                            <div class="radio">
                                <label><input type="radio" name="tasktypeid" value="1"><strong>Monitorointiharjoitus 1</strong></label>
                            </div>
                            <div class="radio">
                                <label><input type="radio" name="tasktypeid" value="2"><strong>Monitorointiharjoitus 2</strong></label>
                            </div>
                            <div class="radio">
                                <label><input type="radio" name="tasktypeid" value="3"><strong>Monitorointiharjoitus 3</strong></label>
                            </div>
                            <input type="hidden" name="userid" value="<%=userID%>">
                            <input type="submit" class="btn btn-info" value="Lähetä">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="tab-content">
                <div class="tab-pane fade" id="tab-contentC">
                    <hr>
                    <div class="col-sm-6">
                        <!-- taustatiedot alkaa -->
                        <%
                            //These can be moved up
                            String customerUserEmail = "";
                            userName = "";
                            userSurname = "";
                            String userPhonenumber = "";
                            String userAddress = "";
                            String userPostalcode = "";
                            String userPostoffice = "";

                            int detailID = 0;
                            String detailAge = "";
                            String detailResidencemodel = "";
                            String detailLifestyle = "";
                            String detailHealthservices = "";
                            String detailProblems = "";

                            //Instead getting each user detail one at a time
                            //we could get them as arraylist and go them
                            //through in for loop
                            customerUserEmail = Database.getUserEmail(userID);
                            userName = Database.getUserName(customerUserEmail);
                            userSurname = Database.getUserSurname(customerUserEmail);
                            userPhonenumber = Database.getUserPhonenumber(customerUserEmail);
                            userAddress = Database.getUserAddress(customerUserEmail);
                            userPostalcode = Database.getUserPostalcode(customerUserEmail);
                            userPostoffice = Database.getUserPostoffice(customerUserEmail);

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

                        <br>

                        <div class="row">
                            <div class="well">
                            <h2>Ilmaisen kokeiluohjelman taustatiedot</h2>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Etunimi</label>
                                    <p><%=InputOutput.clean(userName)%></p>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Sukunimi</label>
                                    <p><%=InputOutput.clean(userSurname)%></p>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Asuinosoite</label>
                                    <p><%=InputOutput.clean(userAddress)%></p>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Postinumero</label>
                                    <p><%=InputOutput.clean(userPostalcode)%></p>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Postitoimipaikka</label>
                                    <p><%=InputOutput.clean(userPostoffice)%></p>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Puhelin</label>
                                    <p><%=InputOutput.clean(userPhonenumber)%></p>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Sähköpostiosoite</label>
                                    <p><%=InputOutput.clean(customerUserEmail)%></p>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Ikä</label>
                                    <p><%=InputOutput.clean(detailAge)%></p>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Asuinmuoto: asun yksin / ystävän, avopuolison kanssa/ vanhempieni, ystävän taloudessa/ avioliitossa/ asuinmuotoni ja -paikkani vaihtelee jatkuvasti, ei siis ole vakituista kotina pidettävää asuinpaikkaa</label>
                                    <p><%=InputOutput.clean(detailResidencemodel)%></p>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Nykyinen viikoittainen tai muutoin säännöllinen elämäntapasi: työtön, eläkkeellä, sairausturva/ elän epäsäännöllisten ja tilapäisten tukien ja tulojen avulla/ opiskelen pääasiallisesti/ työssä, työkokeilussa, ammatillisessa työsuhteessa/ ei säännönmukaista elämäntapaa</label>
                                    <p><%=InputOutput.clean(detailLifestyle)%></p>
                                </div>

                                <br>
                                <%
                                    if ("A".equals(detailHealthservices)) {
                                %>
                                <label class="control control--radio">Käytän suhteellisen säännöllisesti päivittäistä sosiaalista elämääni tukevia terveys- ja kuntoutuspalveluita
                                    <input type="radio" name="radio" checked="checked"/>
                                    <div class="control__indicator"></div>
                                </label>
                                <%
                                } else {
                                %>
                                <label class="control control--radio">Käytän suhteellisen säännöllisesti päivittäistä sosiaalista elämääni tukevia terveys- ja kuntoutuspalveluita
                                    <input type="radio" name="radio"/>
                                    <div class="control__indicator"></div>
                                </label>
                                <%
                                    }
                                    if ("B".equals(detailHealthservices)) {
                                %>
                                <label class="control control--radio">En ole varsinaisesti missään pitempikestoisessa elämääni tukevassa kuntoutus- ja palvelumuotojen piirissä
                                    <input type="radio" name="radio" checked="checked"/>
                                    <div class="control__indicator"></div>
                                </label>
                                <%
                                } else {
                                %>
                                <label class="control control--radio">En ole varsinaisesti missään pitempikestoisessa elämääni tukevassa kuntoutus- ja palvelumuotojen piirissä
                                    <input type="radio" name="radio"/>
                                    <div class="control__indicator"></div>
                                </label>
                                <%
                                    }
                                    if ("C".equals(detailHealthservices)) {
                                %>
                                <label class="control control--radio">Saamani palvelut ovat epämääräisiä ja johonkin päivittäiseen ongelman ratkaisuun, 
                                    kuten lääkitykseen, rahallisten tukien saamiseen keskittyneitä, tilanteeni yleistä seurantaa
                                    <input type="radio" name="radio" checked="checked"/>
                                    <div class="control__indicator"></div>
                                </label>
                                <%
                                } else {
                                %>
                                <label class="control control--radio">Saamani palvelut ovat epämääräisiä ja johonkin päivittäiseen ongelman ratkaisuun, 
                                    kuten lääkitykseen, rahallisten tukien saamiseen keskittyneitä, tilanteeni yleistä seurantaa
                                    <input type="radio" name="radio"/>
                                    <div class="control__indicator"></div>
                                </label>
                                <%
                                    }
                                %>
                                <br>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Nimeä ja luetteloi lyhyesti ongelmia, sekä elämistäsi vaikeuttavia asioita kuten mielenterveydellisiä vaikeuksiasi omin sanoin</label>
                                    <p><%=InputOutput.clean(detailProblems)%></p>
                                </div>
                            </div>
                        </div>
                        <!-- taustatiedot päättyy -->
                    </div>
                    <div class="col-sm-6">
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
                                    <form action="SendMessage" method="POST">
                                        <input type="text" name="message" class="form-control"><br>
                                        <input type="hidden" name="detailid" value="<%=detailID%>">
                                        <input type="hidden" name="usertype" value="admin">
                                        <input type="hidden" name="messagetype" value="D">
                                        <input type="hidden" name="userid" value="<%=userID%>">
                                        <input type="submit" class="btn btn-primary" value="Lähetä">
                                    </form>    
                            </ul>
                        </div> <!-- end chat -->

                    </div>
                </div>
                <% 
                //Here we print all content of each task in three (3) steps
                // (1) starting with the content
                for (int i = 0; i < tasks.size(); i++){

                    taskID = ((Task) tasks.get(i)).getTaskID();
                    taskTypeID = ((Task) tasks.get(i)).getTaskTypeID();
                    taskContent = ((Task) tasks.get(i)).getTaskContent();
                    taskIsClosed = ((Task) tasks.get(i)).getTaskIsClosed();
                %>
                <!-- printing task starts -->
                <div class="tab-pane fade" id="tab-content<%=taskID%>">
                    <hr>
                    <div class="col-sm-6">
                        <div>
                            <p><strong>Monitorointiharjoitus: <%=taskTypeID%>, arkistointitunnus <%=taskID%>.</strong><br><br></p>
                        </div>
                        <!-- Here we print all memos of one task -->
                        <%
                            if(taskTypeID == 1){

                                ArrayList<Memo1> memos = new ArrayList<Memo1>();
                                memos = Database.getTaskMemos1(taskID);

                                int memoID;
                                String memoTime = "";
                                String memoDoing = "";
                                String memoSuojaPercentage = "";
                                String memoTehtPercentage = "";

                        %>
                            <div>
                                <table class="table">
                                    <thead>
                                        <th>Ajankohta</th>
                                        <th>Tekeminen</th>
                                        <th>Suojatoiminta</th>
                                        <th>Tehtävään s. suojatoiminta</th>
                                    </thead>
                                    <tbody>
                        <%        
                                for(int j = 0; j < memos.size(); j++){

                                    memoID = ((Memo1) memos.get(j)).getMemoID();
                                    memoTime = ((Memo1) memos.get(j)).getMemoTime();
                                    memoDoing = ((Memo1) memos.get(j)).getMemoDoing();
                                    memoSuojaPercentage = ((Memo1) memos.get(j)).getMemoSuojaPercentage();
                                    memoTehtPercentage = ((Memo1) memos.get(j)).getMemoTehtPercentage();
                        %>
                                    <tr>
                                        <td><%=InputOutput.clean(memoTime)%></td>
                                        <td><%=InputOutput.clean(memoDoing)%></td>
                                        <td><%=InputOutput.clean(memoSuojaPercentage)%>%</td>
                                        <td><%=InputOutput.clean(memoTehtPercentage)%>%</td>
                                    </tr>
                        <%
                                }
                        %>
                                    </tbody>
                                </table>
                            </div>
                            <%
                            }//Printing taskTypeID = 1 memos end
                            if(taskTypeID == 2){
                                ArrayList<Memo2> memos = new ArrayList<Memo2>();
                                memos = Database.getTaskMemos2(taskID);

                                int memoID;
                                String memoTime = "";
                                String memoDoing = "";
                                String memoPositivePercentage = "";
                                String memoNegativePercentage = "";

                        %>
                            <div>
                                <table class="table">
                                    <thead>
                                        <th>Ajankohta</th>
                                        <th>Tekeminen</th>
                                        <th>Positiivinen vireytyminen</th>
                                        <th>Negatiivinen vireytyminen</th>
                                    </thead>
                                    <tbody>
                        <%        
                                for(int j = 0; j < memos.size(); j++){

                                    memoID = ((Memo2) memos.get(j)).getMemoID();
                                    memoTime = ((Memo2) memos.get(j)).getMemoTime();
                                    memoDoing = ((Memo2) memos.get(j)).getMemoDoing();
                                    memoPositivePercentage = ((Memo2) memos.get(j)).getMemoPositivePercentage();
                                    memoNegativePercentage = ((Memo2) memos.get(j)).getMemoNegativePercentage();
                        %>
                                    <tr>
                                        <td><%=InputOutput.clean(memoTime)%></td>
                                        <td><%=InputOutput.clean(memoDoing)%></td>
                                        <td><%=InputOutput.clean(memoPositivePercentage)%>%</td>
                                        <td><%=InputOutput.clean(memoNegativePercentage)%>%</td>
                                    </tr>
                        <%
                                }
                        %>
                                    </tbody>
                                </table>
                            </div>
                        <%
                            }//Printing taskTypeID = 2 memos end
                            if(taskTypeID == 3){
                                ArrayList<Memo3> memos3 = new ArrayList<Memo3>();
                                memos3 = Database.getTaskMemos3(taskID);

                                int memoID;
                                String memoTime = "";
                                String memoDoing = "";
                                String memoPositivePercentage = "";
                                String memoNegativePercentage = "";
                                String memoTehtPercentage = "";

                        %>
                            <div>
                                <table class="table">
                                    <thead>
                                        <th>Ajankohta</th>
                                        <th>Tekeminen</th>
                                        <th>Positiivinen suojatoiminta</th>
                                        <th>Negatiivinen suojatoiminta</th>
                                        <th>Tehtävään/olemiseen suuntautunut toiminta</th>
                                    </thead>
                                    <tbody>
                        <%        
                                for(int j = 0; j < memos3.size(); j++){

                                    memoID = ((Memo3) memos3.get(j)).getMemoID();
                                    memoTime = ((Memo3) memos3.get(j)).getMemoTime();
                                    memoDoing = ((Memo3) memos3.get(j)).getMemoDoing();
                                    memoPositivePercentage = ((Memo3) memos3.get(j)).getMemoPositivePercentage();
                                    memoNegativePercentage = ((Memo3) memos3.get(j)).getMemoNegativePercentage();
                                    memoTehtPercentage = ((Memo3) memos3.get(j)).getMemoTehtPercentage();
                        %>
                                    <tr>
                                        <td><%=InputOutput.clean(memoTime)%></td>
                                        <td><%=InputOutput.clean(memoDoing)%></td>
                                        <td><%=InputOutput.clean(memoPositivePercentage)%>%</td>
                                        <td><%=InputOutput.clean(memoNegativePercentage)%>%</td>
                                        <td><%=InputOutput.clean(memoTehtPercentage)%>%</td>
                                    </tr>
                        <%
                                }
                        %>
                                    </tbody>
                                </table>
                            </div>
                        <%
                            }//Printing taskTypeID = 3 memos end

                            //(2) Adding "Close task" button for tasks which are not closed yet 
                            if(taskIsClosed == false){
                        %>
                            <form action="CloseTask" method="POST">
                                <input type="hidden" name="taskid" value="<%=taskID%>">
                                <input type="hidden" name="userid" value="<%=userID%>">
                                <input type="submit" class="btn btn-danger" value="Sulje harjoitus">
                            </form>
                        <%
                            }
                        %>
                        </div>
                        <div class="col-sm-6">
                            <div class="chat"> <!-- printing chat for specific task starts -->
                                <ul class="chat-ul">
                                <h4>Tehtävän viestit</h4>
                                <%
                                    // (3) and finally we add the chat for that specific task
                                    messages = Database.getTaskMessages(taskID);

                                    for(int j = 0; j<messages.size(); j++){

                                        messageID = ((Message) messages.get(j)).getMessageID();
                                        messageUserType = ((Message) messages.get(j)).getMessageUserType();
                                        messageContent = ((Message) messages.get(j)).getMessageContent();
                                        messageDate = ((Message) messages.get(j)).getMessageDate();

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

                                    if(taskIsClosed == false){
                                %>
                                        <form action="SendMessage" method="POST">
                                            <input type="text" name="message" class="form-control"><br>
                                            <input type="hidden" name="taskid" value="<%=taskID%>">
                                            <input type="hidden" name="usertype" value="admin">
                                            <input type="hidden" name="messagetype" value="C">
                                            <input type="hidden" name="userid" value="<%=userID%>">
                                            <input type="submit" class="btn btn-primary" value="Lähetä">
                                        </form>
                                <%
                                    }
                                %>
                            </ul>
                        </div> <!-- end chat -->
                    </div>
                </div><!-- printing complete task with chat ends -->
                <%
                }
                %>
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
