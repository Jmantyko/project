<%-- 
    Document   : etusivu
    Created on : 25-Oct-2016, 13:10:52
    Author     : Jaakko
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Arjenhallinta.Content"%>
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
        background: #000 url("Images/flower.jpg") center center;
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
    
        .form-login{
        padding: 1em;
        min-width: 280px; /* change width as per your requirement */
        }
        
        /* Image gallery */
        
        .gallery{
        margin-top: 25px;
        }
        
        .gallery-item{
	margin-bottom: 30px;
        }
        
        .modal-footer{
                text-align: center;
        }
        .pagination{
                margin: 0;
        }
        a.hidden{
            display:none;}
        
        .form-group {
            font-size: 14px;
        }
        
        .margintop {
            
            margin-top: 50px;
        }
        
        /* Carousel base class */
        .carousel {
          max-height: 100%;
          max-height: 360px;
          margin-bottom: 60px;
          height:auto;
        }
        /* Since positioning the image, we need to help out the caption */
        .carousel-caption {
          z-index: 10;
          background: rgba(0, 0, 0, 0.45);
        }

        /* Declare heights because of positioning of img element */
        .carousel .item {
          max-height: 100%;
          max-height: 360px;
          background-color: whitesmoke;
        }
        .carousel-inner > .item > img {
         /*  position: absolute;*/
          top: 0;
          left: 0;
          min-width: 40%;
          max-width: 100%;
          max-height: 360px;
          width: auto;
          margin-right:auto;
          margin-left:auto;
          height:auto;

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
         
         <script>
         
         $(document).ready(function(){
    $('.link-gallery').click(function(){
		var galleryId = $(this).attr('data-target');
		var currentLinkIndex = $(this).index('a[data-target="'+ galleryId +'"]');

		createGallery(galleryId, currentLinkIndex);
		createPagination(galleryId, currentLinkIndex);

		$(galleryId).on('hidden.bs.modal', function (){
			destroyGallry(galleryId);
			destroyPagination(galleryId);
		});

		$(galleryId +' .carousel').on('slid.bs.carousel', function (){
			var currentSlide = $(galleryId +' .carousel .item.active');
			var currentSlideIndex = currentSlide.index(galleryId +' .carousel .item');

			setTitle(galleryId, currentSlideIndex);
			setPagination(++currentSlideIndex, true);
		})
	});

	function createGallery(galleryId, currentSlideIndex){
		var galleryBox = $(galleryId + ' .carousel-inner');

		$('a[data-target="'+ galleryId +'"]').each(function(){
			var img = $(this).html();
			var galleryItem = $('<div class="item">'+ img +'</div>');

			galleryItem.appendTo(galleryBox);
		});

		galleryBox.children('.item').eq(currentSlideIndex).addClass('active');
		setTitle(galleryId, currentSlideIndex);
	}

	function destroyGallry(galleryId){
		$(galleryId + ' .carousel-inner').html("");
	}

	function createPagination(galleryId, currentSlideIndex){
		var pagination = $(galleryId + ' .pagination');
		var carouselId = $(galleryId).find('.carousel').attr('id');
		var prevLink = $('<li><a href="#'+ carouselId +'" data-slide="prev">«</a></li>');
		var nextLink = $('<li><a href="#'+ carouselId +'" data-slide="next">»</a></li>');

		prevLink.appendTo(pagination);
		nextLink.appendTo(pagination);

		$('a[data-target="'+ galleryId +'"]').each(function(){
			var linkIndex = $(this).index('a[data-target="'+ galleryId +'"]');
			var paginationLink = $('<li><a data-target="#carouselGallery" data-slide-to="'+ linkIndex +'">'+ (linkIndex+1) +'</a></li>');

			paginationLink.insertBefore('.pagination li:last-child');
		});

		setPagination(++currentSlideIndex);
	}

	function setPagination(currentSlideIndex, reset = false){
		if (reset){
			$('.pagination li').removeClass('active');
		}

		$('.pagination li').eq(currentSlideIndex).addClass('active');
	}

	function destroyPagination(galleryId){
		$(galleryId + ' .pagination').html("");
	}

	function setTitle(galleryId, currentSlideIndex){
		var imgAlt = $(galleryId + ' .item').eq(currentSlideIndex).find('img').attr('alt');

		$('.modal-title').text(imgAlt);
	}
});
         
         </script>
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
	
        
</head>
    <body>
        <%
            //Fetching data from database
            ArrayList<Content> content = new ArrayList<Content>();
            content = Database.getAllFrontPageContent();
            
            String contentMainos = "";
            String contentMartti = "";
            String contentLiity = "";
            String contentTietoa = "";
            String contentPsykoterapiapalvelut = "";
            String contentYhteystiedot = "";
            
            if(content.size() != 0){
                contentMainos = ((Content)content.get(0)).getContent();
                contentMartti = ((Content)content.get(1)).getContent();
                contentLiity = ((Content)content.get(2)).getContent();
                contentTietoa = ((Content)content.get(3)).getContent();
                contentPsykoterapiapalvelut = ((Content)content.get(4)).getContent();
                contentYhteystiedot = ((Content)content.get(5)).getContent();
            }

            String email = (String) session.getAttribute("email");
            String userType = "";
            String userName = "";
            String userSurname = "";
                    
            if(email != null){
                userType = Database.userType(email);
                userName = Database.getUserName(email);
                userSurname = Database.getUserSurname(email);
            }
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
    <a class="navbar-brand" style="color:#f2f2f2" href="etusivu.jsp">Arjenhallinta.fi</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <%
            if ("customer".equals(userType)){
        %>
        <ul class="nav navbar-nav">
              <li><a href="customer.jsp">Etusivu</a></li>
        </ul>
        <%
            }else if ("admin".equals(userType)){
        %>
        <ul class="nav navbar-nav">
            <li><a href="admin.jsp">Etusivu</a></li>
            <li><a href="admin.jsp#tab11">Asiakastilien hallinta</a></li>
        </ul>
        <%
            }
        %>
    <ul class="nav navbar-nav">
        <li class="s"><a href="#martti" data-toggle="tab">Martti Puttonen</a></li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Nettiterapia <b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li><a href="#tietoa" data-toggle="tab"><h4>Tietoa <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></h4></a></li>
                <li><a href="#liity" data-toggle="tab"><h4>Liity <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></h4></a></a></li>
                <li><a href="#psykoterapiapalvelut" data-toggle="tab"><h4>Psykoterapiapalvelut <span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span></h4></a></a></li>
            </ul>
        </li>
        <li class=""><a href="#yhteystiedot" data-toggle="tab">Yhteystiedot</a></li>
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
        %>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
            <i class="glyphicon glyphicon-user"></i> <%=InputOutput.clean(userName)%> <%=InputOutput.clean(userSurname)%>
        </a>
        <form action="Logout" method="POST" class="dropdown-menu form-login stop-propagation" role="menu"> 
            <div class="form-group">
                <a class="btn btn-info form-control" href="profile.jsp">Asetukset</a>
            </div>
            <%
                
                if("customer".equals(userType)){
            %>
            <div class="form-group">
                <a class="btn btn-info form-control" href="customer.jsp#tab2">Taustatiedot</a>
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
            <div class="jumbotron">
                <h2>Psykoterapiapalvelut Martti Puttonen</h2>
                <p>Kognitiivisen käyttäytymisterapian toteutukset opetukseen ja psykoterapiapraktiikkaan</p>
            </div>

        </div>
        
        <div class="container">
            <h2>Tab 1</h2>
            <p><%=InputOutput.clean(contentMainos)%></p>
        </div>
    </div>
        
        
    <div class="tab-pane text-style" id="martti">
        
        <div class="margintop"></div>

                <div class="container">
                    
                    <div class="col-sm-6">
                    <h2>Tab martti</h2>

                    <div class="gallery">
                        <div class="container">
                                <div class="row">
                        <div class="col-xs-3 gallery-item">
                            <a href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery">
                                <img src="Images/kuva1.jpg" class="img-responsive img-gallery" alt="First image">
                            </a>
                        </div> <!-- /.col -->
                        
                        <div class="col-sm-8">
                            <p><%=InputOutput.clean(contentMartti)%></p>
                        </div>

                        <div class="col-xs-3 gallery-item">
                            <a class="hidden" href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery">
                                <img src="Images/kuva2.jpg" class="img-responsive img-gallery" alt="Second image">
                            </a>
                        </div> <!-- /.col -->

                        <div class="col-xs-3 gallery-item">
                            <a class="hidden" href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery">
                                <img src="Images/kuva3.jpg" class="img-responsive img-gallery" alt="Third image">
                            </a>
                        </div> <!-- /.col -->

                        <div class="col-xs-3 gallery-item">
                            <a class="hidden"  href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery">
                                <img src="Images/kuva4.jpg" class="img-responsive img-gallery" alt="Fourth image">
                            </a>
                        </div> <!-- /.col -->
                        
                        <div class="col-xs-3 gallery-item">
                            <a class="hidden"  href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery">
                                <img src="Images/kuva5.jpg" class="img-responsive img-gallery" alt="Fifth image">
                            </a>
                        </div> <!-- /.col -->
                        
                        <div class="col-xs-3 gallery-item">
                            <a class="hidden"  href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery">
                                <img src="Images/kuva6.jpg" class="img-responsive img-gallery" alt="Sixth image">
                            </a>
                        </div> <!-- /.col -->
                        
                        <div class="col-xs-3 gallery-item">
                            <a class="hidden"  href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery">
                                <img src="Images/kuva7.jpg" class="img-responsive img-gallery" alt="Seventh image">
                            </a>
                        </div> <!-- /.col -->
                        
                         <div class="col-xs-3 gallery-item">
                            <a class="hidden"  href="#galleryImg1" class="link-gallery" data-toggle="modal" data-target="#modalGallery">
                                <img src="Images/kuva8.JPG" class="img-responsive img-gallery" alt="Eighth image">
                            </a>
                        </div> <!-- /.col -->
                                
                        
                    </div> <!--/.row  -->
                        </div> <!-- /.container -->
                </div> <!-- /.gallery -->
                
                <div class="modal fade" id="modalGallery" tabindex="-1" role="dialog" aria-labelledby="modalGalleryLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="modalGalleryLabel">Gallery</h4>
				</div> <!-- /.modal-header -->

				<div class="modal-body">
					<div id="carouselGallery" class="carousel slide" data-ride="carousel" data-interval="false">
						<div class="carousel-inner">
						</div> <!-- /.carousel-inner -->
					</div> <!-- /.carousel -->
				</div> <!-- /.modal-body -->

				<div class="modal-footer">
					<ul class="pagination">
					</ul>
				</div> <!-- /.modal-footer -->
			</div> <!-- /.modal-content -->
		</div> <!-- /.modal-dialog -->
	</div> <!-- /.modal -->

            </div>
            
    </div>
      
        
    </div>  
        
         
     
        

    <div class="tab-pane text-style" id="tietoa">
        <div class="container">
            <h2>Tab tietoa</h2>
            <p><%=InputOutput.clean(contentTietoa)%></p>
        </div>
    </div>

    <div class="tab-pane text-style" id="liity">
        <div class="container">
            <h2>Tab Liity</h2>

            <p><%=InputOutput.clean(contentLiity)%></p>
            <button type="button" class="btn btn-primary btn-lg btn-block" onclick="window.open('https://docs.google.com/forms/d/e/1FAIpQLSeDdLYM9hpigr-oP5WjN0wOEYcGAotWX0VSXhNFY3SA0JQSVg/viewform')">Linkki nettiterapian ja istuntopainotteisen terapian asennemittariin </button>
            <a class="btn btn-default btn-lg btn-block" href="#tab7" data-toggle="tab">Linkki ilmaisen harjoitusohjelman taustatietojen täyttöön </a>

            <button type="button" class="btn btn-primary btn-lg btn-block" onclick="window.open('https://docs.google.com/forms/d/1UqlGeUD4sdHlPWMlt_w6wJteREAttMO5I5chXV93S3c/edit')"> Linkki maksullisen harjoitusohjelman taustatietojen täyttöön </button>
        </div>
    </div>
            
    <div class="tab-pane text-style" id="tab7">
        
        <div class="container">
            <div class="col-sm-9">
            <button class="btn btn-default" href="#liity" data-toggle="tab">Takaisin</button><br>
            <div class="well">    
                
            <h2>Ilmaisen kokeiluohjelman taustatiedot</h2>
            
            
            <p>VASTAA SEURAAVIIN KYSYMYKSIIN ELÄMÄNTILANTEESTASI JA YLEISESTÄ HENKISESTÄ TILANTEESTASI 
                (ilmaisen kokeiluohjelman tiedot henkilöstäsi ja tilanteestasi ovat yleisluontoisia, anna
                kuitenkin todelliset tiedot henkilöstäsi, kuten nimi, osoite, ikätiedot):   
                Näitä taustatietoja päivittäisestä elämäsi laadusta tarvitsen arvioidessani
                tässä seuraavassa tekemiäsi päivittäisten toimintojen rekistereistäsi saamiani
                tietoja arjen henkisen toimintasi luonteesta. Myös tässä kysytyt taustatiedot
                auttavat minua tarkentamaan palautteitani ja tarpeellisia jatkokysymyksiä
                mahdollisiin jatkokeskusteluihimme tässä yhteistyöalustassa, joiden asioiden
                selvittämistä on kenties tarpeellista jatkaa toisella tai kolmannella 
                monitorointitehtävällä jotka sinulla mahdollisesti lähetän.
                Pyri vastaamaan nykyisen tilanteesi etkä toiveittesi mukaan,
                jotta yhteistyömme perustuu tosiasioille, jos pyrit kaunistelemaan
                tai muutoin vääristämään taustatietoja, tiedät että psykoterapiayhteistyö
                ei perustu vääristelyyn, toisaalta meille voi olla vaikeaa huomata tiettyjä
                tosiasioita.  Pyydän varsinkin että keskityt antamaan iästäsi ja muista
                perustiedoista, kuten painosta ja terveydentilastasi samoin kuin muista
                saamistasi hoitopalveluista ja hoitokeinoista tosiasiallista tilannettasi
                vastaavat tiedot, tiedäthän että nämä tässä antamasi tiedot ovat täysin
                luottamuksellisia eivätkä tule kenenkään kuten muiden lähihenkilöiden
                tai muiden ammattilaisten tai minun kanssani yhteistyötä tekevien
                asiakkaiden tietoon.  Sitä vaitiolovelvollisuutta ja yksityisyytesi
                suojaamisen turvaaminen myös laillistetun psykoterapeutin työskentely
                edellyttää olipa kyse istuntopainotteisesta tai internetissä toteutetusta
                psykoterapeuttisesta asiakasyhteistyöstä. </p>
            
              <form>
                  
              <div class="form-group">
                <label for="exampleInputEmail1">Nimi</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Oma vastauksesi">
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">Asuinosoite, virallinen postiosoite</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Oma vastauksesi">
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">Puhelin</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Oma vastauksesi">
              </div>
               <div class="form-group">
                <label for="exampleInputEmail1">Sähköpostiosoite</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Oma vastauksesi">
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">Ikä</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Oma vastauksesi">
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">Asuinmuoto: asun yksin / ystävän, avopuolison kanssa/ vanhempieni, ystävän taloudessa/ avioliitossa/ asuinmuotoni ja -paikkani vaihtelee jatkuvasti, ei siis ole vakituista kotina pidettävää asuinpaikkaa</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Oma vastauksesi">
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">Nykyinen viikoittainen tai muutoin säännöllinen elämäntapasi: työtön, eläkkeellä, sairausturva/ elän epäsäännöllisten ja tilapäisten tukien ja tulojen avulla/ opiskelen pääasiallisesti/ työssä, työkokeilussa, ammatillisessa työsuhteessa/ ei säännönmukaista elämäntapaa</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Oma vastauksesi">
              </div>
        
                  <br>
                  
                  
                 
              <label class="control control--radio">Käytän suhteellisen säännöllisesti päivittäistä sosiaalista elämääni tukevia terveys- ja kuntoutuspalveluita
                <input type="radio" name="radio" checked="checked"/>
                <div class="control__indicator"></div>
              </label>
              <label class="control control--radio">En ole varsinaisesti missään pitempikestoisessa elämääni tukevassa kuntoutus- ja palvelumuotojen piirissä
                <input type="radio" name="radio"/>
                <div class="control__indicator"></div>
              </label>
              <label class="control control--radio">Saamani palvelut ovat epämääräisiä ja johonkin päivittäiseen ongelman ratkaisuun, kuten lääkitykseen, rahallisten tukien saamiseen keskittyneitä, tilanteeni yleistä seurantaa
                <input type="radio" name="radio"/>
                <div class="control__indicator"></div>
              </label>
                  
                   <br>
              
                <div class="form-group">
                <label for="exampleInputEmail1">Nimeä ja luetteloi lyhyesti ongelmia, sekä elämistäsi vaikeuttavia asioita kuten mielenterveydellisiä vaikeuksiasi omin sanoin</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Oma vastauksesi">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Nimeä ja luetteloi lyhyesti ongelmia, sekä elämistäsi vaikeuttavia asioita kuten mielenterveydellisiä vaikeuksiasi omin sanoin</label>
                  <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Oma vastauksesi">
                </div>

        
              <button type="submit" class="btn btn-primary">Lähetä</button>
            </form>
            
        </div>
        </div>        
        </div>
    </div>


        <div class="tab-pane text-style" id="tab8">
     

    </div>

    <div class="tab-pane text-style" id="psykoterapiapalvelut">

        <div class="container">
            <h2>Tab psykoterapiapalvelut</h2>
            <p><%=InputOutput.clean(contentPsykoterapiapalvelut)%></p>
        </div>
    </div>

    <div class="tab-pane text-style" id="yhteystiedot">
        <div class="container">
            <h2>Tab yhteystiedot</h2>
            <p><%=InputOutput.clean(contentYhteystiedot)%></p>
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