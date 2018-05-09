<!--
author: Boostraptheme
author URL: https://boostraptheme.com
License: Creative Commons Attribution 4.0 Unported
License URL: https://creativecommons.org/licenses/by/4.0/
-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>UniMarina</title>
    <link rel="shortcut icon" href="<c:url value='/resources/users/img/favicon.ico'/>">

    <!-- Global Stylesheets -->
    <link href="<c:url value='https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i'/>" rel="stylesheet">
    <link href="<c:url value='/resources/users/css/bootstrap/bootstrap.min.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/resources/users/font-awesome-4.7.0/css/font-awesome.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/users/css/animate/animate.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/users/css/owl-carousel/owl.carousel.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/users/css/owl-carousel/owl.theme.default.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/users/css/style.css'/>">
    <script src="<c:url value='http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'/>"></script>
    
  </head>

  <body id="page-top">

<!--====================================================
                         HEADER
======================================================--> 

    <header>

      <!-- Top Navbar  -->
      <div class="top-menubar">
        <div class="topmenu">
          <div class="container">
            <div class="row">
              <div class="col-md-7">
                <ul class="list-intline top-contacts">
					<li>
						<i class="fa fa-envelope"></i> Email:<a href="mail to:info@unimarina.it">info@unimarina.it</a>
					</li>
				</ul>	
              </div> 
              <div class="col-md-5">
                <ul class="list-inline top-data">
                  <li><a href="#" class="log-top" data-toggle="modal" data-target="#login-modal">Disconnetti</a></li>  
                </ul>
              </div>
            </div>
          </div>
        </div> 
      </div> 
  
      <!-- Navbar -->
	  <br>
	  <br>
      <nav class="navbar navbar-expand-lg navbar-light" id="mainNav" data-toggle="affix">
        <div class="container">
          <a class="navbar-brand smooth-scroll" href="../../index.jsp">
            <img src="<c:url value='/resources/img/logo.png'/>" alt="logo">
          </a> 
          <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"> 
                <span class="navbar-toggler-icon"></span>
          </button>  
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item" ><a class="nav-link smooth-scroll" href="../../index.jsp">Home</a></li>
            </ul>  
          </div>
        </div>
      </nav>
	  <br>
    </header>      
 
<!--====================================================
                       HOME-P
======================================================-->
    <div id="home-p" class="home-p pages-head3 text-center">
      <div class="container">
        <h1 class="wow fadeInUp" data-wow-delay="0.1s">Bacheca docente</h1>
      </div><!--/end container-->
    </div> 

<!--====================================================
                        EXAMS
======================================================-->
    <section id="cart" class="cart">
      <div class="container">
        <table id="table_exams" class="table table-hover table-condensed" align="center">
          <thead>
            <tr>
				<th style="width:20%"class="text-center">Nome esame</th>
				<th style="width:20%"class="text-center">Video</th>
				<th style="width:20%"class="text-center">Dispensa</th>
				<th style="width:20%"class="text-center">Test</th>
				<th style="width:20%"class="text-center"><!-- SAVE BUTTON --></th>
            </tr>
          </thead>
          <tbody id="table_body_exams">
        </table>
      </div>
    </section> 
	
<!--====================================================
                      JAVA SCRIPT
======================================================-->
	
	<script type='text/javascript'>
	const LIMIT_VIDEO    = 3;
	const LIMIT_DISPENSA = 3;
	
	let examClass = class {
  		constructor( exam, counterDispensa, counterVideo ) {
  			this.exam = exam;
  			this.counterDispensa = counterDispensa;
			this.counterVideo    = counterVideo;
  		}
	};
	let examsList = [];
	
	// Get the table to be filled.
    let table = document.getElementById( "table_body_exams" );
    
    let jsonUser = '<%= request.getAttribute( "user" ) %>';
    let user = JSON.parse( jsonUser );
    let exams = user["exam_list"];
	
	let index = 0;
	for (let exam of exams) {
		let row  = table.insertRow( index++ );
        let nameRow     = row.insertCell( 0 );
        let videoRow    = row.insertCell( 1 );
        let dispensaRow = row.insertCell( 2 );
        let testRow     = row.insertCell( 3 );
        let saveRow		= row.insertCell( 4 );
        
        nameRow.innerHTML     = "<div class='row'><div class='col-sm-10 prod-desc'><h6 class='nomargin' align='center'>" + exam["name"] + "</h6></div></div>";
        videoRow.innerHTML    = "<div id='div_adder_" + index + "'><input type='text' id='video_form_" + index + "_1' class='form-control text-center'></form></div><p><input type='button' align='right' value='Aggiungi video' onclick=addVideo('" + index + "')></p>";
        dispensaRow.innerHTML = "<div><form id='dispensa_adder_" + index + "' action='upload.asp' name='p' method='post'> <input id='dispensa_form_" + index + "_1' type='file' class='form-control text-center'></form></div><div style='float:right'><p><input type='button' align='right' value='Aggiungi dispensa' onclick=addDispensa('" + index + "')></p></div>";
        testRow.innerHTML     = "<center><div><br><a href='createTest.jsp' class='btn btn-general btn-green' >Gestione Test</a></div> </center>";
		saveRow.innerHTML     = "<center><br><button id='save_btn_" + index + "' class='btn btn-general btn-green'>Save</button></center>"
		
		// TODO mancano le informazioni delle dispense e dei video di questo esame in modo da aggiornare i controlli (se mai ci saranno)
		examsList.push( new examClass( exam, 1, 1 ) );
		
		let index_btn = index;
		let save_btn = document.getElementById( 'save_btn_' + index );
		save_btn.addEventListener( "click", function() {
			let exam = examsList[index_btn - 1];
			
			console.log( "INDEX: " + index_btn );
			// Get all the videos.
			let videos = [];
			for (let i = 1; i <= exam["counterVideo"]; i++) {
				let video_form = document.getElementById( "video_form_" + index_btn + "_" + i );
				let video_url  = video_form["value"];
				videos.push( video_url );
			}
			
			// Get all the notes.
			let notes = [];
			for (let i = 1; i <= exam["counterDispensa"]; i++) {
				let dispensa_form = document.getElementById( "dispensa_form_" + index_btn + "_" + i );
				let note = dispensa_form["value"].split(/(\\|\/)/g).pop();
				console.log( "DISPENSA: " + note );
				notes.push( note );
			}
			
			$.ajax({
				url:"http://localhost:8080/Project2/uploadController",
				data:{
					"idE":exam["exam"]["id_exam"],
					"nameE":exam["exam"]["name"],
					"videos":JSON.stringify( {'videos':videos} ),
					"notes":JSON.stringify( {'notes':notes} )
				},
				type:'POST',
				//dataType : 'json',   /* use 'json' for cross domain*/
				success:function( data, textStatus, jqXHR ) {
					// access response data
					alert( 'All files saved!' );
				},
				error:function( data, textStatus, jqXHR ) {
					console.log( 'Service call failed!' );
				}
			});
		} );
	}
	
	function addVideo( index )
	{
		let exam = examsList[index-1];
		if (exam["counterVideo"] == LIMIT_VIDEO) {
			alert( "You have reached the limit!" );
		} else {
			let next = exam["counterVideo"] + 1;
			let video_form = document.getElementById( "div_adder_" + index );
			let nextVideo  = document.createElement( "input" );
			nextVideo.classList.add( "form-control" );
			nextVideo.classList.add( "text-center" );
			nextVideo.type = "text";
			nextVideo.setAttribute( "id", "video_form_" + index + "_" + next );
			video_form.appendChild( nextVideo );

			exam["counterVideo"]++;
		}
	}


	function addDispensa( index )
	{
		let exam = examsList[index-1];
		if (exam["counterDispensa"] == LIMIT_DISPENSA) {
			alert( "You have reached the limit!" );
		} else {
			let next = exam["counterDispensa"] + 1;
			let dispensa_form = document.getElementById( "dispensa_adder_" + index );
			let nextDispensa  = document.createElement( "input" );
			nextDispensa.classList.add( "form-control" );
			nextDispensa.classList.add( "text-center" );
			nextDispensa.type = "file";
			nextDispensa.setAttribute( "id", "dispensa_form_" + index + "_" + next );
			
			dispensa_form.appendChild( nextDispensa );
			
			exam["counterDispensa"]++;
		}
	}
</script>
<!--====================================================
                      FOOTER
======================================================--> 
    <footer> 
	
        <div id="footer-s1" class="footer-s1">
          <div class="footer">
            <div class="container">
              <div class="row">
                <!-- About Us -->
                <div class="col-md-3 col-sm-6 ">
                  <div><img src="<c:url value='/resources/img/logo-w.png'/>" alt="" class="img-fluid"></div>
                  <ul class="list-unstyled comp-desc-f">
                     <li><p>      Investi sul tuo futuro! <br>
					 Iscriviti al nostro corso di laurea online </p></li> 
                  </ul><br> 
                </div>
                <!-- End About Us -->

                
                <!-- End Recent list -->

                <!-- Recent Blog Entries -->
                <div class="col-md-3 col-sm-6 ">
                  
                </div>
                <!-- End Recent Blog Entries -->
<!-- Recent News -->
                <div class="col-md-3 col-sm-6 ">
                  <div class="heading-footer"><h2>Link utili</h2></div>
                  <ul class="list-unstyled link-list">

                    <li><a href="about.html">Chi siamo</a></li> 
                    <li><a href="project.html">Esami</a></li> 
                    
                  </ul>
                </div>
                <!-- Latest Tweets -->
                <div class="col-md-3 col-sm-6">
                  <div class="heading-footer"><h2>Ci trovi qui</h2></div>
                  <address class="address-details-f">
                    Giovanni Pezzotti, 8 Milano (IT)<br>
                    Telefono: 02 123 3456 <br>
                    
                    Email: <a href="mailto:info@unimarina.it" class="">info@unimarina.it</a>
                  </address>  
                  
                </div>
                <!-- End Latest Tweets -->
              </div>
            </div><!--/container -->
          </div> 
        </div>

        <div id="footer-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div id="footer-copyrights">
                            <p>Copyrights &copy; 2018 All Rights Reserved by Unimarina. <a href="#">Privacy Policy</a> <a href="#">Terms of Services</a></p>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
        <a href="#home" id="back-to-top" class="btn btn-sm btn-green btn-back-to-top smooth-scrolls hidden-sm hidden-xs" title="home" role="button">
            <i class="fa fa-angle-up"></i>
        </a>
    </footer>

    <!--Global JavaScript -->
    <script src="<c:url value='/resources/users/js/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/resources/users/js/popper/popper.min.js'/>"></script>
    <script src="<c:url value='/resources/users/js/bootstrap/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/users/js/wow/wow.min.js'/>"></script>
    <script src="<c:url value='/resources/users/js/owl-carousel/owl.carousel.min.js'/>"></script>

    <!-- Plugin JavaScript -->
    <script src="<c:url value='/resources/users/js/jquery-easing/jquery.easing.min.js'/>"></script> 
    <script src="<c:url value='/resources/users/js/custom.js'/>"></script>
  </body>

</html>
