<%-- 
    Document   : admin
    Created on : 05-Nov-2016, 15:53:14
    Author     : Jaakko
--%>

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
            //Fetching data from database
            String content1 = Database.getFrontPageContent(1);
            String content2 = Database.getFrontPageContent(2);

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
        
        <head>
    <meta http-equiv="content-type" content="text/html;charset=ISO-8859-1"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

  
    <title>Psykoterapiapalvelut Martti Puttonen</title>
	
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
    <a class="navbar-brand" href="#tab1" data-toggle="tab">Arjenhallinta.fi</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
      <li class="active"><a href="#tab7" data-toggle="tab">Etusivu</a></li>
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
        <div class="col-md-4">
  
            <table class="table table-bordered">
  <thead>
    <tr class="bg-primary">
      <th>Ilmoitukset</th>
    </tr>
  </thead>
  <tbody>
    <tr>
        <td>
            <div style="float:left;">
                <div>Timo Tikkanen</div>
                <div>Harjoitus 1</div>
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
</table>
                  
    </div>
  <div class="col-md-8">
     <div class="row">
        <div class="col-xs-4 col-md-4">
             <div class="input-group">
              <input type="text" class="form-control" placeholder="Hae asiakkaista...">
              <span class="input-group-btn">
              <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
            </span>
    </div>
   </div>
         <div class="col-xs-4 col-md-4">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Näytä...">
            <div class="input-group-btn">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="caret"></span></button>
              <ul class="dropdown-menu dropdown-menu-right">
                <li><a href="#">Kaikki asiakkaat</a></li>
                <li><a href="#">Aktiiviset asiakkaat</a></li>
                <li><a href="#">Inaktiiviset asiakkaat</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Separated link</a></li>
              </ul>
      </div><!-- /btn-group -->
    </div><!-- /input-group -->
   </div>
             <div class="col-xs-4 col-md-4">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Järjestä...">
            <div class="input-group-btn">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="caret"></span></button>
              <ul class="dropdown-menu dropdown-menu-right">
                <li><a href="#">Nimen mukaan (Ö-A)</a></li>
                <li><a href="#">Viimeisen toiminnan mukaan</a></li>
                <li><a href="#">Asiakasnumeron mukaan</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Separated link</a></li>
              </ul>
      </div><!-- /btn-group -->
    </div><!-- /input-group -->
   </div>
        
         </br>
         </br>

          <div class="col-md-12">
  <h3>Asiakastilit</h3>
  <table class="table">
    <thead>
      <tr>
		<th>#</th>
        <th>Etunimi</th>
        <th>Sukunimi</th>
        <th>Tunnus</th>
		<th>Viimeisin toiminto</th>
      </tr>
    </thead>
    <tbody>
      <tr>
		<td>1</td>
        <td>Erkki</td>
        <td>Esimerkki</td>
        <td>e.esimerkki@email.com</td>
		<td>13.09.2016 klo 18:30</td>
      </tr>
      <tr>
		<td>2</td>
        <td>Anssi</td>
        <td>Asiakas</td>
        <td>suternööri@gmail.com</td>
		<td>25.08.2016 klo 08:16</td>
      </tr>
      <tr>
		<td>3</td>
        <td>Lizard</td>
        <td>Squad</td>
        <td>anonymous@missingno.com</td>
		<td>23.08.2016 klo 10.31</td>
      </tr>
      <tr>
		<td>3</td>
        <td>Pentti</td>
        <td>Arajärvinen</td>
        <td>penttia@mail.com</td>
		<td>22.08.2016 klo 11.35</td>
      </tr>
      <tr>
		<td>3</td>
        <td>Mauri</td>
        <td>Esterinen</td>
        <td>sahkoposti@404.com</td>
		<td>19.08.2016 klo 15.04</td>
      </tr>
    </tbody>
  </table>
</div>
         
  </div>
</div>
    
</div>
  	</br>

  
		 <div class="container-bottom">
			<div class="row">
				<hr>
				<div class="col-lg-12">
					<div class="col-md-8">
						<p class="muted pull-right">© 2016 Martti Puttonen. All rights reserved.</p>
					</div>
				</div>
			</div>
		</div>
       <hr>
</div>
</div>

<div class="tab-pane text-style" id="tab2">
<div class="container">
  <h2>Dolor asit amet</h2>
   <p>Dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt 
    ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo 
    dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. 
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore 
    et dolore magna aliquyam erat, sed diam voluptua.</p>
	
	<h2>16:9 Responsive Aspect Ratio</h2>
	<div class="embed-responsive embed-responsive-16by9">
				<iframe class="embed-responsive-item" style="max-width:660px; max-height:415px;"
				src="https://www.youtube.com/embed/FTQbiNvZqaY">
				</iframe>
				</div>
	</br>
	<h2>16:9 Responsive Aspect Ratio</h2>
	<div class="embed-responsive embed-responsive-16by9">
				<iframe class="embed-responsive-item" style="max-width:660px; max-height:415px;"
				src="https://www.youtube.com/embed/bch1_Ep5M1s">
				</iframe>
				</div>
	</br>
	<h2>16:9 Responsive Aspect Ratio</h2>
	<div class="embed-responsive embed-responsive-16by9">
				<iframe class="embed-responsive-item" style="max-width:660px; max-height:415px;"
				src="https://www.youtube.com/embed/N-aK6JnyFmk">
				</iframe>
				</div>
	</br>
	
     <div class="container-bottom">
			<div class="row">
				<hr>
				<div class="col-lg-12">
					<div class="col-md-8">
						<p class="muted pull-right">© 2016 Martti Puttonen. All rights reserved.</p>
					</div>
				</div>
			</div>
		</div>
		<hr>
</div>
</div>

<div class="tab-pane text-style" id="tab3">
<div class="container">
  <h2>Tilanteesi arviointi ja toteutus</h2>
  <p>Psykoterapia internettiä käyttäen, kirjaudu ensin palveluun 
	Vapaasti ja yksityissuojasi säilyttäen voit tutustua 
	tämän linkin kautta Tässä yhteistyössä aluksi selvitämme 
	soveltuuko sinulle jopa paremmin internetissä toteutettu psykoterapiapalvelu 
	kuin kalliimpi ja aikaa vievä istuntopainotteinen psykoterapia. 
	Toteutan molempia tarpeesi mukaan ja sen mukaan miten itse toivot. 
	Voit siirtyä joko suoraan maksulliseen arjen hallinnan ongelmien 
	arviointiohjelmaan  tai voit tutustua arjen hallinnan harjoitusten 
	soveltuvuuteen sinulle tässä elämäntilanteessasi. Internetin kautta 
	toteutettava psykoterapia on joskus tehokkaampaa jos se vain soveltuu 
	asiakkaalle ja asiakas oppii oivaltamaan luonnollista ja tarpeellista 
	päivittäistä epävarmuutta eikä odota niin voimakkaasti tunne-elämyskekustelua. 
	Käyttäytymisen rekisteröintien ja nettiyhteistyön palautteen avulla voit 
	työskennellä netissä omilla yhteyksilläsi, silloin yhteistyö on 
	täysin yksityisyyssuojattua, muut eivät pääse seuraamaan toteutettua 
	nettiyhteistyötä.Tutustuaksesi nopeasti tähän internetpsykoterapian toteutukseen, 
	sinun on tarpeen hankkia yksityisen tietosuojasi turvaavat käyttötunnus ja salasana 
	ensin e-mailin tai puhelin soiton avulla allekirjoittaneelta. Myös maksulliseen 
	nettiyhteistyön ohjelmaan osallistuaksesi omassa tahdissasi sinun on tarpeen 
	maksaa alkuvaiheen osallistumismaksu, joka oikeuttaa sinuta toteuttamaan 
	sumuiseen ja monitasoiseen henkiseen päivittäiseen toimintaan suuntautuvia 
	monitorointiharjoituksia. Myös ilmaiseen kokeiluohjelmaan päivittäisten 
	toimintojen harjoituksiin pyydän sinua antamaan henkilötietosi jotta voin 
	seurata monitorointiharjoiitteluasi. Voit luottaa siihen että antamasi tiedot 
	ovat luottamuksellisia, eivätkä tule muiden tätä palvelualustaa käyttävien tietoon. 
	Psykoterapeuttista toimintaa säätelevät yksityissuojan säädökset ja lait. </p>
	
    <div class="container-bottom">
			<div class="row">
				<hr>
				<div class="col-lg-12">
					<div class="col-md-8">
						<p class="muted pull-right">© 2016 Martti Puttonen. All rights reserved.</p>
					</div>
				</div>
			</div>
		</div>
       <hr>
  
  </div>
  </div>
  
  <div class="tab-pane text-style" id="tab4">
  <div class="container">
  <h2>Toteutustapa</h2>
  <h3>Selvitä käyttäytymisen voimavarasi ja mahdollisten toimintaongelmien taso ja luonne samalla kertaa</h3>
 
  <p>Käytettäessä arjen toimintojen rekisteröintimenetelmiä arjen hallintasi ongelmien ja voimavarojen selvittämisessä 
  yhteistyössä ei ajauduta kapeaan ongelmien tarkasteluun tai pinnalliseen elämän pohdintaan ja erittelyyn. Eikä rajata 
  yhteistyötä ennakkoon esim. terapiaistunnoiksi tai yleiseksi nettiterapiaksi, sen sijaan yhteistyössämme toimitaan 
  tilanteen mukaan todellista arkesi toimintaa yhdessä selvittäen arjen hallinnan rekistereiden kautta saadun lisätiedon 
  avulla. Sinä asiakkaana sekä minä laillistettuna psykoterapeuttina toimimme luottamussuhdetta, keskinäisen luottamuksen 
  ja ymmärryksen tasolla. Ja jos antamasi taustatiedot ja lähettämäsi arjen hallinnan harjoitukset olet toteuttanut 
  yhteistyöhömme edes hieman luottaen, etkä ole asioitasi tarkoituksellisesti vääristänyt, etkä siten psykoterapeuttiasi 
  tässä harhaannuttanut, yhteistyömme on sinulle hedelmällistä.</p>
  
  <p>Tätä ensimmäisen vaiheen yhteistyön harjoitusten ja keskustelumme toteutusta toteutamma noin kolme viikkoa tai vähintään noin yhden viikon ajan.</p>
  
  <p>Työskentelymme nopeus tai tahti riippuu enemmän luullakseni sinusta kuin minusta, silllä sinulla menee jonkin aikaa harjoitusten tekemiseen tutustuaksesi 
  lähettämistäni ohjeista. Minä puolestani vastaan sinulle harjoituksen tai kysymyksen tai kommentin sinulta saatuani viimeistään seuraavana päivänä. </p>
  
  <p>Ensimmäisen harjoitusvaiheen aloitus on tarpeen aloittaa lähtötietojesi lomakkeen täyttämällä, mene seuraavaan alalinkkiin.</p>
  
  <p>Tämän jälkeen lähetän sinulle ensimmäisen käyttäytymisen monitorointiharjoituksen ehdotuksen sen mukaan miten olen sinun 
  tilanteesi nähnyt taustatiedoistasi. Muita tietoja minulla ei sinusta ole, en siis tee yhteistyötä kenenkään muun ammattilaisen 
  tai sinut tuntevan henkilön kanssa, jos sellaista yhteistyötä ehdottaisin pyytäisin sinulta siihen kirjallisen luvan.</p>
  
  <h3>taustatiedot lomakkeelle</h3>
	
    <div class="container-bottom">
			<div class="row">
				<hr>
				<div class="col-lg-12">
					<div class="col-md-8">
						<p class="muted pull-right">© 2016 Martti Puttonen. All rights reserved.</p>
					</div>
				</div>
			</div>
		</div>
       <hr>
  </div>
  
</div>

<div class="tab-pane text-style" id="tab5">
<div class="container">
  <h2>Taustatiedot</h2>
  
  <h4>Selvitä käyttäytymisen voimavarasi ja mahdollisten toimintaongelmien taso ja luonne samalla kertaa</h4>
 
	 <p>Olet aloittanut ensimmäisen yhteistyövaiheen toteutuksen, jota toteutamme noin kolmen harjoituksen ja 
	 niissä toteuttamiemme keskustelujen avulla. Eli tämä yhteistyövaihe kestää enintään parisen viikkoa, mutta riippuu 
	 lähinnä sinun työskentelystäsi eli kuinka usein ja nopeasti reagoit tehtävät saatuasi, ja miten onnistut keskusteluamme 
	 hyödyntämään.</p>
	 
	 <p>Minun puoleltani työskentelyni on joustavaa, mutta yleensä lähes poikkeuksetta annan palautetta tai ehdotan jatkototeutusta
	 jo seuraavana päivänä lähetettyäsi harjoituksen tai sen tehtävän. </p>
  
	 <h4>taustatiedot lomakkeelle</h4>
	
    <div class="container-bottom">
			<div class="row">
				<hr>
				<div class="col-lg-10">
					<div class="col-md-8">
						<p class="muted pull-right">© 2016 Martti Puttonen. All rights reserved.</p>
					</div>
				</div>
			</div>
		</div>
       <hr>
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


 <div class="container-bottom">
			<div class="row">
				<hr>
				<div class="col-lg-12">
					<div class="col-md-8">
						<p class="muted pull-right">© 2016 Martti Puttonen. All rights reserved.</p>
					</div>
				</div>
			</div>
		</div>
       <hr>
</div>

<div class="tab-pane text-style" id="tab7">
<div class="container">
  <h2>Martti Puttonen</h2>
	<p>Olen toteuttanut jo kymmenen vuoden ajan kognitiiivisen käyttäytymisterapian työskentelyä kansainvälisen
		viimeaikaisen tutkimuksen sekä asiakaspraktiikkani toimivuuden tutkivan kehittämisen avulla.</p>
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
    <div class="container-bottom">
			<div class="row">
				<hr>
				<div class="col-lg-10">
					<div class="col-md-8">
						<p class="muted pull-right">© 2016 Martti Puttonen. All rights reserved.</p>
					</div>
				</div>
			</div>
		</div>
       <hr>
  </div>
  
</div>

<div class="tab-pane text-style" id="tab8">
  <div class="container">
  <h2>Kuvia</h2>
  
<div class="container-fluid">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
	  <li data-target="#myCarousel" data-slide-to="4"></li>
      <li data-target="#myCarousel" data-slide-to="5"></li>
      <li data-target="#myCarousel" data-slide-to="6"></li>
	  <li data-target="#myCarousel" data-slide-to="7"></li>
      <li data-target="#myCarousel" data-slide-to="8"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="martti1.jpg" alt="Chania" width="460" height="345">
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>

      <div class="item">
        <img src="martti2.jpg" alt="Chania" width="460" height="345">
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>
    
      <div class="item">
        <img src="martti3.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>

      <div class="item">
        <img src="martti4.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>
	  
	  <div class="item">
        <img src="martti5.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>
	  
	  <div class="item">
        <img src="martti6.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>
	  
	  <div class="item">
        <img src="martti7.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>
	  
	  <div class="item">
        <img src="martti8.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
	
    <div class="container-bottom">
			<div class="row">
				<hr>
				<div class="col-lg-12">
					<div class="col-md-8">
						<p class="muted pull-right">© 2016 Martti Puttonen. All rights reserved.</p>
					</div>
				</div>
			</div>
		</div>
       <hr>
  </div>
  
</div>

<div class="tab-pane text-style" id="tab9">
<div class="container">
  <h2>Taustatiedot</h2>
  
  <h4>Selvitä käyttäytymisen voimavarasi ja mahdollisten toimintaongelmien taso ja luonne samalla kertaa</h4>
 
	 <p>Olet aloittanut ensimmäisen yhteistyövaiheen toteutuksen, jota toteutamme noin kolmen harjoituksen ja 
	 niissä toteuttamiemme keskustelujen avulla. Eli tämä yhteistyövaihe kestää enintään parisen viikkoa, mutta riippuu 
	 lähinnä sinun työskentelystäsi eli kuinka usein ja nopeasti reagoit tehtävät saatuasi, ja miten onnistut keskusteluamme 
	 hyödyntämään.</p>
	 
	 <p>Minun puoleltani työskentelyni on joustavaa, mutta yleensä lähes poikkeuksetta annan palautetta tai ehdotan jatkototeutusta
	 jo seuraavana päivänä lähetettyäsi harjoituksen tai sen tehtävän. </p>
  
	 <h4>taustatiedot lomakkeelle</h4>
	
    <div class="container-bottom">
			<div class="row">
				<hr>
				<div class="col-lg-10">
					<div class="col-md-8">
						<p class="muted pull-right">© 2016 Martti Puttonen. All rights reserved.</p>
					</div>
				</div>
			</div>
		</div>
       <hr>
  </div>
  
</div>


<div class="tab-pane text-style" id="tab10">
<div class="container">
  <h2>Yhteystiedot</h2>
 
	 <p>Martti Puttonen
		psykologian tohtori
		psykoterapeutti,
		kognitiivinen käyttäytymisterapia
		VET, laillistettu</p>
	 
	 <p>Puhelin: 050 533 5698 tai 0447103413 
		e-mail: maputto(at)saunalahti.fi
		Vastaanotto: Satakunnankatu 13 as 25 Pori (tai kotikäynti)  </p>
  
	 <h4>taustatiedot lomakkeelle</h4>
	
    <div class="container-bottom">
			<div class="row">
				<hr>
				<div class="col-lg-10">
					<div class="col-md-8">
						<p class="muted pull-right">© 2016 Martti Puttonen. All rights reserved.</p>
					</div>
				</div>
			</div>
		</div>
       <hr>
  </div>
  
</div>

<div class="tab-pane text-style" id="tab11">
<div class="container">
  <h2>Asiakastilit</h2>
  <table class="table">
    <thead>
      <tr>
		<th>#</th>
        <th>Etunimi</th>
        <th>Sukunimi</th>
        <th>Tunnus</th>
		<th>Atiivisuus</th>
		<th><a>valitse kaikki</a></th>
      </tr>
    </thead>
    <tbody>
      <tr>
		<td>1</td>
        <td>Erkki</td>
        <td>Esimerkki</td>
        <td>e.esimerkki@email.com</td>
		<td><label><input type="checkbox" value=""></label></td>
		<td><label><input type="checkbox" value=""></label></td>
      </tr>
      <tr>
		<td>2</td>
        <td>Anssi</td>
        <td>Asiakas</td>
        <td>suternööri@gmail.com</td>
		<td><label><input type="checkbox" value=""></label></td>
		<td><label><input type="checkbox" value=""></label></td>
      </tr>
      <tr>
		<td>3</td>
        <td>Lizard</td>
        <td>Squad</td>
        <td>anonymous@missingno.com</td>
		<td><label><input type="checkbox" value=""></label></td>
		<td><label><input type="checkbox" value=""></label></td>
      </tr>
    </tbody>
  </table>
      <div class="container-bottom">
			<div class="row">
				<hr>
				<div class="col-lg-10">
					<div class="col-md-8">
						<p class="muted pull-right">© 2016 Martti Puttonen. All rights reserved.</p>
					</div>
				</div>
			</div>
		</div>
       <hr>
</div>
</div>    

<script type="text/javascript" src="addrow.js"></script>
    </body>
</html>
