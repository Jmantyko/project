<%-- 
    Document   : etusivu
    Created on : 25-Oct-2016, 13:10:52
    Author     : Jaakko
--%>

<%@page import="Arjenhallinta.Database"%>
<%@page import="Arjenhallinta.InputOutput"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
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
	
	
            .nav-pills > li.active > a, .nav-pills > li.active > a:focus {
            color: white;
            background-color: #76A5FF;
                    letter-spacing: 2px;
                    text-shadow:
                    -1px -1px 0 #000,  
                     1px -1px 0 #000,
                    -1px 1px 0 #000,
                     1px 1px 0 #000;
        }

            .nav-pills > li.active > a:hover {
                background-color: #0073A3;
                color:white;
                            letter-spacing: 2px;
                            text-shadow:
                            -0.5px -0.5px 0 #000,  
                             0.5px -0.5px 0 #000,
                            -0.5px 0.5px 0 #000,
                             0.5px 0.5px 0 #000;
            }
	
            a.my-tool-tip, a.my-tool-tip:hover, a.my-tool-tip:visited {

        color: blue;
            }
	
             .carousel-inner > .item > img,
         .carousel-inner > .item > a > img {
          width: 70%;
          margin: auto;
	  
             }
	 
            <!-- Navbar CSS -->
	
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
            $(function () {
                $('#ex1').slider({
                    formater: function (value) {
                        return 'Current value: ' + value;
                    }
                });

            });
        </script>

        <script>
            $(function () {
                $('#ex2').slider({
                    formater: function (value) {
                        return 'Current value: ' + value;
                    }
                });

            });
        </script>

        <script>
            $(function () {
                $('#ex3').slider({
                    formater: function (value) {
                        return 'Current value: ' + value;
                    }
                });

            });
        </script>

        <script>
            $(function () {
                $('#ex4').slider({
                    formater: function (value) {
                        return 'Current value: ' + value;
                    }
                });

            });
        </script>

        <script>
            $(function () {
                $('#ex5').slider({
                    formater: function (value) {
                        return 'Current value: ' + value;
                    }
                });

            });
        </script>

        <script>
            $(function () {
                $('#ex6').slider({
                    formater: function (value) {
                        return 'Current value: ' + value;
                    }
                });

            });
        </script>

        <script>
            $(function () {
                $('#ex7').slider({
                    formater: function (value) {
                        return 'Current value: ' + value;
                    }
                });

            });
        </script>

        <script>
            $(function () {
                $('#ex8').slider({
                    formater: function (value) {
                        return 'Current value: ' + value;
                    }
                });

            });
        </script>

        <script>
            $(function () {
                $('#ex9').slider({
                    formater: function (value) {
                        return 'Current value: ' + value;
                    }
                });

            });
        </script>

        <script>
            $(function () {
                $('#ex10').slider({
                    formater: function (value) {
                        return 'Current value: ' + value;
                    }
                });

            });
        </script>

        <!-- Bootstrap row adding js --> 
        <script src="addrow.js"></script>

        <script>   $(document).ready(function () {
                var i = 1;
                $("#add_row").click(function () {
                    $('#addr' + i).html("<td>" + (i + 1) + "</td><td><input name='name" + i + "' type='text' placeholder='Name' class='form-control input-md'  /> </td><td><input  name='mail" + i + "' type='text' placeholder='Mail'  class='form-control input-md'></td><td><input  name='mobile" + i + "' type='text' placeholder='Mobile'  class='form-control input-md'></td>");

                    $('#tab_logic').append('<tr id="addr' + (i + 1) + '"></tr>');
                    i++;
                });
                $("#delete_row").click(function () {
                    if (i > 1) {
                        $("#addr" + (i - 1)).html('');
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
            //Fetching data from database
            String content1 = Database.getFrontPageContent(1);
            String content2 = Database.getFrontPageContent(2);

            String email = (String) session.getAttribute("email");
            String userType = Database.userType(email);
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
                    <a class="navbar-brand" href="#tab1" data-toggle="tab">Arjenhallinta.fi</a>

                    <body>


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
                                    <%
                                        if ("customer".equals(userType)) {
                                    %>
                                    <ul class="nav navbar-nav">
                                        <li><a href="customer.jsp">Etusivu</a></li>
                                    </ul>
                                    <%
                                    } else if ("admin".equals(userType)) {
                                    %>
                                    <ul class="nav navbar-nav">
                                        <li><a href="admin.jsp">Etusivu</a></li>
                                        <li><a href="admin.jsp?#11">Asiakastilien hallinta</a></li>
                                    </ul>
                                    <%
                                        }
                                    %>
                                    <ul class="nav navbar-nav">
                                        <li class=""><a href="#tab7" data-toggle="tab">Martti Puttonen</a></li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Nettiterapia <b class="caret"></b></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="#tab4"data-toggle="tab"><h4>Tietoa <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></h4></a></li>
                                                <li><a href="#tab5"data-toggle="tab"><h4>Liity <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></h4></a></a></li>
                                                <li><a href="#tab3"data-toggle="tab"><h4>Psykoterapiapalvelut <span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span></h4></a></a></li>
                                            </ul>
                                        </li>
                                        <li class=""><a href="#tab10" data-toggle="tab">Yhteystiedot</a></li>
                                    </ul>
                                    <ul class="nav navbar-nav navbar-right">
                                        <li class="dropdown">
                                            <%
                                                if (session.getAttribute("email") == null) {

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
                                            <%        } else {

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

                                                <!-- Collect the nav links, forms, and other content for toggling -->
                                                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                                    <%
                                                        if ("customer".equals(userType)) {
                                                    %>
                                                    <ul class="nav navbar-nav">
                                                        <li><a href="customer.jsp">Etusivu</a></li>
                                                    </ul>
                                                    <%
                                                    } else if ("admin".equals(userType)) {
                                                    %>
                                                    <ul class="nav navbar-nav">
                                                        <li><a href="admin.jsp">Etusivu</a></li>
                                                        <li><a href="admin.jsp?activeTab=tab11">Asiakastilien hallinta</a></li>
                                                    </ul>
                                                    <%
                                                        }
                                                    %>
                                                    <ul class="nav navbar-nav">
                                                        <li class="active"><a href="#tab7" data-toggle="tab">Martti Puttonen</a></li>
                                                        <li class="dropdown">
                                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Nettiterapia <b class="caret"></b></a>
                                                            <ul class="dropdown-menu">
                                                                <li><a href="#tab4"data-toggle="tab"><h4>Tietoa <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></h4></a></li>
                                                                <li><a href="#tab5"data-toggle="tab"><h4>Liity <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></h4></a></a></li>
                                                                <li><a href="#tab3"data-toggle="tab"><h4>Psykoterapiapalvelut <span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span></h4></a></a></li>
                                                            </ul>
                                                        </li>
                                                        <li class=""><a href="#tab10" data-toggle="tab">Yhteystiedot</a></li>
                                                    </ul>
                                                    <ul class="nav navbar-nav navbar-right">
                                                        <li class="dropdown">
                                                            <%
                                                                if (session.getAttribute("email") == null) {

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
                                                            <%                        } else {
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

                                                <div class="container">
                                                    <div class="jumbotron">
                                                        <h2>Psykoterapiapalvelut Martti Puttonen</h2>
                                                        <p>Kognitiivisen käyttäytymisterapian toteutukset opetukseen ja psykoterapiapraktiikkaan</p>
                                                    </div>

                                                </div>

                                                <!-- tab content -->
                                                <div class="tab-content">
                                                    <div class="tab-pane active text-style" id="tab1">
                                                        <div class="container">
                                                            <h3>Tab 1</h3>
                                                            <p><%=InputOutput.clean(content1)%></p>
                                                        </div>
                                                    </div>

                                                    <div class="tab-pane text-style" id="tab3">
                                                        <div class="container">
                                                            <h2>Tab 3</h2>
                                                            <p><%=InputOutput.clean(content1)%></p>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane text-style" id="tab4">
                                                        <div class="container">
                                                            <h2>Tab 4</h2>
                                                            <p><%=InputOutput.clean(content1)%></p>
                                                        </div>
                                                    </div>

                                                    <div class="tab-pane text-style" id="tab5">
                                                        <div class="container">
                                                            <h2>Tab 5</h2>

                                                            <p><%=InputOutput.clean(content1)%></p>

                                                            <button type="button" class="btn btn-default btn-lg btn-block" onclick="window.open('https://docs.google.com/forms/d/1OtY_WaS4OtJbdcV8xlOLyHtf4dAIknrdML82-EVaQx8/edit?usp=drive_web')">Linkki ilmaisen harjoitusohjelman taustatietojen täyttöön </button>

                                                            <button type="button" class="btn btn-primary btn-lg btn-block" onclick="window.open('https://docs.google.com/forms/d/1UqlGeUD4sdHlPWMlt_w6wJteREAttMO5I5chXV93S3c/edit')"> Linkki maksullisen harjoitusohjelman taustatietojen täyttöön </button>
                                                        </div>
                                                    </div>

                                                    <div class="tab-pane text-style" id="tab7">
                                                        <div class="container">
                                                            <h2>Tab 7</h2>
                                                            <p><%=InputOutput.clean(content1)%></p>
                                                        </div>

                                                    </div>
                                                    <div class="tab-pane text-style" id="tab9">
                                                        <div class="container">
                                                            <h2>Tab 9</h2>
                                                            <p><%=InputOutput.clean(content1)%></p>
                                                        </div>
                                                    </div>

                                                    <div class="tab-pane text-style" id="tab10">
                                                        <div class="container">
                                                            <h2>Tab 10</h2>
                                                            <p><%=InputOutput.clean(content1)%></p>
                                                        </div>
                                                    </div>

                                                    <script type="text/javascript" src="addrow.js"></script>

                                                    </body>

                                                    </html>
