<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>UniMarina</title>
		
		<!-- Global Stylesheets -->
    <link rel="shortcut icon" href="<c:url value='/resources/users/img/favicon.ico'/>">

    <!-- Global Stylesheets -->
    <link href="<c:url value='https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i'/>" rel="stylesheet">
    <link href="<c:url value='/resources/users/css/bootstrap/bootstrap.min.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/resources/users/font-awesome-4.7.0/css/font-awesome.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/users/css/animate/animate.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/users/css/owl-carousel/owl.carousel.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/users/css/owl-carousel/owl.theme.default.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/users/css/style.css'/>">
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
                  <li><a href="#" class="log-top" data-toggle="modal" data-target="#login-modal">Accedi/Registrati</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-light" id="mainNav" data-toggle="affix">
        <div class="container">
          <a class="navbar-brand smooth-scroll" href="index.html">
            <img src="<c:url value='/resources/img/logo.png'/>" alt="logo">
          </a>
		  <p>
<br><br>
<br><br>
<br><br>
<p>

          <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item" ><a class="nav-link smooth-scroll" href="index.html">Home</a></li>

				<li class="nav-item dropdown" >
                <a class="nav-link dropdown-toggle smooth-scroll" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Chi siamo</a>
                  <div class="dropdown-menu dropdown-cust" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="about.html">I nostri servizi</a>
                    <a class="dropdown-item" href="about.html">I nostri Docenti</a>
                  </div>
                </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>



<!--====================================================
                       HOME-P
======================================================-->
    <div id="home-p" class="home-p pages-head3 text-center">
      <div class="container">
        <h1 class="wow fadeInUp" data-wow-delay="0.1s">Crea il tuo piano di studi</h1>
      </div><!--/end container-->
    </div>




<!--====================================================
                        STUDY PLAN
======================================================-->
<br>
<br>
<br>
    <section id="cart" class="cart">
      <div class="container">
        <form id="login-form" action="studyPlan" method="post">
					<div class="modal-body">
						<!-- List of selectable exams. -->
						<table class="table table-striped table-bordered" id="examTable" align="center">
							<thead>
							<tr>
								<th>Name</th>
								<th>Description</th>
								<th>Credits</th>
								<th><!--Mark--></th>
							</tr>
							</thead>
						<tbody id="examBodyTable">
							<!-- Empty body. -->
						</tbody>
						</table>
					</div>
					<div class="modal-footer text-center">
						<div>
							<button id="submitButton" type="submit" class="btn btn-general btn-white" disabled="true">
							Save
							</button>
						</div>
					</div>
				</form>
		</div>
	</body>

	<script type="text/javascript">
		// Get the table to be filled.
		let table = document.getElementById( "examBodyTable" );
		
		//document.getElementById("submitButton").addEventListener("click", function() { alert( "PREMUTO" ); } );

		let selectedCredits = 0;
		const CREDITS_THRESHOLD = 60;

		function addEventHandlerCheckboxer( index, credits )
		{
			function changeBoxStatus( index, disable )
			{
				let checkBoxes = document.getElementsByClassName( "checkBoxClass" );
				for (let i = 0; i < checkBoxes.length; i++) {
					if (i != index) {
						let cb = checkBoxes[i];
						if (!cb['checked']) {
							if (disable) {
								cb['disabled'] = true;
							} else {
								cb['disabled'] = false;
							}
						}
					}
				}
			}

			return function() {
			    if (this.checked) {
					selectedCredits += credits;
					console.log( "PREMUTO: " + index + ", CREDITS: " + credits + ", TOTAL_CREDITS: " + selectedCredits );
					if (selectedCredits == CREDITS_THRESHOLD) {
                    	// Disables all the enabled checkboxes.
						changeBoxStatus( index - 1, true );
						document.getElementById( "submitButton" )["disabled"] = false;
              		}
				} else {
					if (selectedCredits == CREDITS_THRESHOLD) {
						// Re-enables all the disabled checkboxes.
						changeBoxStatus( index - 1, false );
						document.getElementById( "submitButton" )["disabled"] = true;
					}

					selectedCredits -= credits;
					console.log( "NON PREMUTO: " + index + ", CREDITS: " + credits + ", TOTAL_CREDITS: " + selectedCredits );
				}
			}
		}

		function createCheckboxer( row, index, idExam, credits )
		{
			let igm    = document.createElement( 'div' );
			igm.classList.add( "input-group" );
			igm.classList.add( "mb-3" );
			row.appendChild( igm );

			let igp    = document.createElement( 'div' );
			igp.classList.add( "input-group-prepend" );
			igm.appendChild( igp );

			let igt    = document.createElement( 'div' );
			igt.classList.add( "input-group-text" );
			igp.appendChild( igt );

			let input  = document.createElement( 'input' );
			input.id   = "cb_exam_" + index;
			input.type = "checkbox";
			input.name = "exam";
	        input.value = idExam;
			igt.appendChild( input );
			input.setAttribute( 'aria-label', "Checkbox for exam" );
			input.classList.add( "checkBoxClass" );
			input.addEventListener( "click", addEventHandlerCheckboxer( index, credits ) );
		}

		let jsonExams = '<%= request.getAttribute( "exams" ) %>';
		console.log( "JSON_EXAMS: " + jsonExams );
		let exams = JSON.parse( jsonExams );
		let index = 0;
		for (let exam of exams) {
			let row  = table.insertRow( index++ );
			let nameRow      = row.insertCell( 0 );
			//let professorRow = row.insertCell( 1 );
			let descriptionRow = row.insertCell( 1 );
			let creditsRow   = row.insertCell( 2 );
			let checkRow     = row.insertCell( 3 );
			
			let credits = exam['credits'];
			nameRow.innerHTML      = exam['name'];
			//let professorName      = exam['user_list'][0]['name'];
			//let professorSurname   = exam['user_list'][0]['surname'];
			//professorRow.innerHTML = professorName + " " + professorSurname;
			descriptionRow.innerHTML = exam['description'];
			creditsRow.innerHTML   = credits;
			
			createCheckboxer( checkRow, index, exam['id_exam'], credits );
		}
	</script>

	<p>
	<br></br>
	<br></br>
	<br></br>
	</p>


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
