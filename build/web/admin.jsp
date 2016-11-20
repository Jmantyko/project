<%-- 
    Document   : admin
    Created on : 05-Nov-2016, 15:53:14
    Author     : Jaakko
--%>

<%@page import="Arjenhallinta.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Arjenhallinta.Database"%>
<%@page import="Arjenhallinta.InputOutput"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fi">
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
            //String content1 = Database.getFrontPageContent(1);
            //String content2 = Database.getFrontPageContent(2);

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
<script>
        //jQuery(document).ready(function($) {
        //    $(".clickable-row").click(function() {
        //        window.document.location = $(this).data("href");
        //    });
       // });
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
      <li class=""><a href="#tab1" data-toggle="tab">Etusivu</a></li>
       <li class=""><a href="#tab11" data-toggle="tab">Asiakastilien hallinta</a></li>
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

<!-- tab content -->
<div class="tab-content">
<div class="tab-pane active text-style" id="tab1">
<div class="container">
  <h3>Etusivu</h3>
  
  </br>
  
<div class="row">
        
  
          <!--  <table class="table table-bordered">
  <thead>
    <tr class="bg-primary">
      <th>Ilmoitukset</th>
    </tr>
  </thead>
  <tbody>
    <tr>
        <td>
            <div style="float:left;">
                <div>Timo Tikkanen</a></div>
                <div><a href="#tab2" data-toggle="tab">Harjoitus 1</a></div>
            </div>
            
            <div style="float:right;">
                <div>12.9.2016</div>
                <div>klo 13:00</div>
            </div> 
        </td>
        
    </tr>
     <tr>
        <td>
            <div style="float:left;">
                <div>Martti Mielikäinen</div>
                <div>Harjoitus 2</div>
            </div>
            
            <div style="float:right;">
                <div>25.8.2016</div>
                <div>klo 12:35</div>
            </div> 
        </td>
        
    </tr>
     <tr>
        <td>
            <div style="float:left;">
                <div>Anu Saukko</div>
                <div>Harjoitus 3</div>
            </div>
            
            <div style="float:right;">
                <div>25.8.2016</div>
                <div>klo 12:35</div>
            </div> 
        </td>
        
    </tr>
     <tr>
        <td>
            <div style="float:left;">
                <div>Pelle Svensson</div>
                <div>Taustatiedot</div>
            </div>
            
            <div style="float:right;">
                <div>23.8.2016</div>
                <div>klo 15:25</div>
            </div> 
        </td>
        
    </tr>
     <tr>
        <td>
            <div style="float:left;">
                <div>Pentti Virtanen</div>
                <div>Harjoitus 5</div>
            </div>
            
            <div style="float:right;">
                <div>17.8.2016</div>
                <div>klo 11:21</div>
            </div> 
        </td>
        
    </tr>
  </tbody>
</table>--> 
                  
 
  <div class="col-md-12">
     <div class="row">
        

<div class="col-md-12">
  <h3>Asiakkaiden terapiatiedot</h3>
  <table class="table">
    <thead>
      <tr>
	<th>#</th>
        <th>Asiakas</th>
	<th>Viimeisin harjoitus</th>
      </tr>
    </thead>
    <tbody>
        <% 
            ArrayList<Customer> customers = new ArrayList<Customer>();
            customers = Database.getCustomers();
            int customerID;
            String customerEmail = "";
            String customerName = "";
            String customerSurname = "";
            String customerPhonenumber = "";
            String customerAddress = "";
            String customerPostalcode = "";
            String customerPostoffice = "";
            
            //In this for loop we will print each customer
            //for a separate table row
            for(int i=0; i<customers.size();i++){
                
                customerID = ((Customer)customers.get(i)).getID();
                customerEmail = ((Customer)customers.get(i)).getEmail();
                customerName = ((Customer)customers.get(i)).getName();
                customerSurname = ((Customer)customers.get(i)).getSurname();
                customerPhonenumber = ((Customer)customers.get(i)).getPhonenumber();
                customerAddress = ((Customer)customers.get(i)).getAddress();
                customerPostalcode = ((Customer)customers.get(i)).getPostalcode();
                customerPostoffice = ((Customer)customers.get(i)).getPostoffice();
        %>
      <tr>
	<td><%=customerID%></td>
        <td>
            <form action="admincustomerdetails.jsp" method="GET">
                <input type="hidden" name="customerid" value="<%=customerID%>">
                <button type="submit" class="btn btn-primary btn-block"><%=InputOutput.clean(customerName)%> <%=InputOutput.clean(customerSurname)%> (<%=InputOutput.clean(customerEmail)%>)</button>
            </form>
        </td>
        <td>
            <form action="admincustomerdetails.jsp" method="GET">
                <input type="hidden" name="customerid" value="<%=customerID%>">
                <button type="submit" class="btn btn-primary btn-block">13.09.2016 klo 18:30</button>
            </form>
        </td>
        
      </tr>
        <%
            }
        %>
    </tbody>
  </table>
</div>
         
  </div>
</div>
    
</div>
  	</br>

</div>
</div>

<div class="tab-pane text-style" id="tab2">
<div class="container">
  
    <div class="row">
            <div class="col-xs-12 col-md-8">
                <div class="tab-pane text-style" id="tab6">
<h2 class="text-center">Timo Tikkanen</h2>
<h2 class="text-center">Monitorointiharjoitus 1</h2>

</br>

<div class="container-fluid">

<table class="table">
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
      <td><input id="ex2" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
    </tr>
  </tbody>
</table>
<a id="add_row" class="btn btn-default pull-left">Lisää rivi</a><a id='delete_row' class="pull-right btn btn-default">Poista rivi</a>

</br>
</br>
</br>

<table class="table">
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
      <td><input id="ex5" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
      <td><input id="ex6" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
    </tr>
  </tbody>
</table>
<a id="add_row" class="btn btn-default pull-left">Lisää rivi</a><a id='delete_row' class="pull-right btn btn-default">Poista rivi</a>

</br>
</br>
</br>

<table class="table">
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
      <td><input id="ex7" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
      <td><input id="ex8" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
    </tr>
  </tbody>
</table>

<a id="add_row" class="btn btn-default pull-left">Lisää rivi</a><a id='delete_row' class="pull-right btn btn-default">Poista rivi</a>

</br>
</br>
</br>

<table class="table">
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
      <td><input id="ex9" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
      <td><input id="ex10" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
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

</br>

<div class="row">
            <div class="col-xs-12 col-md-12">
                        <div class="row">
        <div class="col-md-5">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-comment"></span> Chat
                    <div class="btn-group pull-right">
                        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-chevron-down"></span>
                        </button>
                        <ul class="dropdown-menu slidedown">
                            <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-refresh">
                            </span>Refresh</a></li>
                            <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-ok-sign">
                            </span>Available</a></li>
                            <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-remove">
                            </span>Busy</a></li>
                            <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-time"></span>
                                Away</a></li>
                            <li class="divider"></li>
                            <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-off"></span>
                                Sign Out</a></li>
                        </ul>
                    </div>
                </div>
                <div class="panel-body">
                    <ul class="chat">
                        <li class="left clearfix"><span class="chat-img pull-left">
                            <img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" />
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="primary-font">Jack Sparrow</strong> <small class="pull-right text-muted">
                                        <span class="glyphicon glyphicon-time"></span>12 mins ago</small>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
                                    dolor, quis ullamcorper ligula sodales.
                                </p>
                            </div>
                        </li>
                        <li class="right clearfix"><span class="chat-img pull-right">
                            <img src="http://placehold.it/50/FA6F57/fff&text=ME" alt="User Avatar" class="img-circle" />
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <small class=" text-muted"><span class="glyphicon glyphicon-time"></span>13 mins ago</small>
                                    <strong class="pull-right primary-font">Martti Puttonen</strong>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
                                    dolor, quis ullamcorper ligula sodales.
                                </p>
                            </div>
                        </li>
                        <li class="left clearfix"><span class="chat-img pull-left">
                            <img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" />
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="primary-font">Jack Sparrow</strong> <small class="pull-right text-muted">
                                        <span class="glyphicon glyphicon-time"></span>14 mins ago</small>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
                                    dolor, quis ullamcorper ligula sodales.
                                </p>
                            </div>
                        </li>
                        <li class="right clearfix"><span class="chat-img pull-right">
                            <img src="http://placehold.it/50/FA6F57/fff&text=ME" alt="User Avatar" class="img-circle" />
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <small class=" text-muted"><span class="glyphicon glyphicon-time"></span>15 mins ago</small>
                                    <strong class="pull-right primary-font">Bhaumik Patel</strong>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
                                    dolor, quis ullamcorper ligula sodales.
                                </p>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="panel-footer">
                    <div class="input-group">
                        <input id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here..." />
                        <span class="input-group-btn">
                            <button class="btn btn-warning btn-sm" id="btn-chat">
                                Send</button>
                        </span>
                    </div>
                </div>
        </div>
    </div>
                </div> 
            
            </div>
    </div>

       <hr>
</div>

            </div>
        
        
    </div>
    
</div>
</div>
  
<div class="tab-pane text-style" id="tab6">
<div class="container"></div>
<h2 class="text-center">Monitorointiharjoitus 1</h2>
<div class="container">

<table class="table">
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
      <td><input id="ex2" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
    </tr>
  </tbody>
</table>
<a id="add_row" class="btn btn-default pull-left">Lisää rivi</a><a id='delete_row' class="pull-right btn btn-default">Poista rivi</a>

</br>
</br>
</br>

<table class="table">
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
      <td><input id="ex5" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
      <td><input id="ex6" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
    </tr>
  </tbody>
</table>
<a id="add_row" class="btn btn-default pull-left">Lisää rivi</a><a id='delete_row' class="pull-right btn btn-default">Poista rivi</a>

</br>
</br>
</br>

<table class="table">
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
      <td><input id="ex7" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
      <td><input id="ex8" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
    </tr>
  </tbody>
</table>

<a id="add_row" class="btn btn-default pull-left">Lisää rivi</a><a id='delete_row' class="pull-right btn btn-default">Poista rivi</a>

</br>
</br>
</br>

<table class="table">
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
      <td><input id="ex9" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
      <td><input id="ex10" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="14"/></td>
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




<div class="tab-pane text-style" id="tab11">
    <div class ="container">       
	<div class="customer-main-container">
            <div class="customer-actions-container">
                <h3>Asiakastilien hallinta</h3>
                <button type="button" class="btn btn-success" href='#tab-content0' data-toggle="tab">Lisää uusi asiakastili</button>
                <table class="table topBuffer">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Etunimi</th>
                        <th>Sukunimi</th>
                        <th>Sähköposti</th>
                    </tr>
                </thead>
     <tbody>
        <% 
            /* 
            ArrayList<Customer> customers = new ArrayList<Customer>();
            customers = Database.getCustomers();
            int customerID;
            String customerEmail = "";
            String customerName = "";
            String customerSurname = "";
            String customerPhonenumber = "";
            String customerAddress = "";
            String customerPostalcode = "";
            String customerPostoffice = "";
            */
            //In this for loop we will print each customer
            //for a separate table row
            for(int i=0; i<customers.size();i++){
                
                customerID = ((Customer)customers.get(i)).getID();
                customerEmail = ((Customer)customers.get(i)).getEmail();
                customerName = ((Customer)customers.get(i)).getName();
                customerSurname = ((Customer)customers.get(i)).getSurname();
                customerPhonenumber = ((Customer)customers.get(i)).getPhonenumber();
                customerAddress = ((Customer)customers.get(i)).getAddress();
                customerPostalcode = ((Customer)customers.get(i)).getPostalcode();
                customerPostoffice = ((Customer)customers.get(i)).getPostoffice();
        %>
        <tr class='clickable-row' href='#tab-content<%=customerID%>' data-toggle="tab">
            <td><%=customerID%></td>
            <td><%=InputOutput.clean(customerName)%></td>
            <td><%=InputOutput.clean(customerSurname)%></td>
            <td><%=InputOutput.clean(customerEmail)%></td>
        </tr>
        <%
            }
        %>
    </tbody>
  </table>                    
            </div>
    
<div class="customer-display-container">
    <div class="container-fluid">
        <div class="col-md-12">
            <div class="tab-content">
                <div class="tab-pane fade" id="tab-content0">
                    <h3>Uuden asiakkastilin luonti</h3>
                    <form action="CreateUser" method="POST" class="topBuffer">
                    <label for="email">Anna käyttäjän sähköpostiosoite:</label>
                    <input type="email" class="form-control" name="email" value="" placeholder="esim. esimerkki@esimerkki.fi" /><br>
                    <label for="password">Luo käyttäjälle salasana:</label>
                    <input type="password" class="form-control" name="password" value="" placeholder="esim. w895aRQ3gByx" /><br>
                    <label for="name">Anna käyttäjän etunimi:</label>
                    <input type="text" class="form-control" name="name" value="" placeholder="esim. Pekka" /><br>
                    <label for="name">Anna käyttäjän sukunimi:</label>
                    <input type="text" class="form-control" name="surname" value="" placeholder="esim. Meikäläinen" /><br>
                    <label for="phonenumber">Anna käyttäjän puhelinnumero:</label>
                    <input type="text" class="form-control" name="phonenumber" value="" placeholder="esim. 04012345678" /><br>
                    <label for="address">Anna käyttäjän osoite:</label>
                    <input type="text" class="form-control" name="address" value="" placeholder="esim. Torikatu 7" /><br>
                    <label for="postalcode">Anna käyttäjän postinumero:</label>
                    <input type="text" class="form-control" name="postalcode" value="" placeholder="esim. 10101" /><br>
                    <label for="postoffice">Anna käyttäjän postitoimipaikka:</label>
                    <input type="text" class="form-control" name="postoffice" value="" placeholder="esim. Oulu" /><br>
                    <input type="submit" class="btn btn-success" value="Lisää asiakastili" /> 
                    </form>
                </div> 
            <%
                for(int i=0; i<customers.size();i++){
                    customerID = ((Customer)customers.get(i)).getID();
                    customerEmail = ((Customer)customers.get(i)).getEmail();
                    customerName = ((Customer)customers.get(i)).getName();
                    customerSurname = ((Customer)customers.get(i)).getSurname();
                    customerPhonenumber = ((Customer)customers.get(i)).getPhonenumber();
                    customerAddress = ((Customer)customers.get(i)).getAddress();
                    customerPostalcode = ((Customer)customers.get(i)).getPostalcode();
                    customerPostoffice = ((Customer)customers.get(i)).getPostoffice();
            %>
                <div class="tab-pane fade" id="tab-content<%=customerID%>">
                    <p><strong>Asiakasnumero:</strong> <%=customerID%></p>
                    <p><strong>Nimi:</strong> <%=InputOutput.clean(customerName)%></p>
                    <p><strong>Sukunimi:</strong> <%=InputOutput.clean(customerSurname)%></p>
                    <p><strong>Sähköposti:</strong> <%=InputOutput.clean(customerEmail)%></p>
                    <p><strong>Puhelin:</strong> <%=InputOutput.clean(customerPhonenumber)%></p>
                    <p><strong>Osoite:</strong> <%=InputOutput.clean(customerAddress)%></p>
                    <p><strong>Postinumero:</strong> <%=InputOutput.clean(customerPostalcode)%></p>
                    <p><strong>Postitoimipaikka:</strong> <%=InputOutput.clean(customerPostoffice)%></p>
                    <form action="DeleteUser" method="POST">
                        <input type="hidden" name="customerid" value="<%=customerID%>">
                        <input type="submit" class="btn btn-danger" value="Poista asiakastili" /> 
                    </form>
                </div> 
            <%
                }
            %>
            </div>
        </div>
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
