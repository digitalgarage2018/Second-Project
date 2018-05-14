<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    
    <title>Business Bootstrap Responsive Template</title>
    <link rel="shortcut icon" href="<c:url value='/resources/users/img/favicon.ico'/>">

    <!-- Global Stylesheets -->
    <link href="<c:url value='https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i'/>" rel="stylesheet">
    <link href="<c:url value='/resources/users/css/bootstrap/bootstrap.min.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/resources/users/font-awesome-4.7.0/css/font-awesome.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/users/css/animate/animate.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/users/css/owl-carousel/owl.carousel.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/users/css/owl-carousel/owl.theme.default.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/users/css/style.css'/>">
	
	<title>Study Plan</title>
	</head>
	<body>
		<!-- Navigation Bar. -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
      <a class="navbar-brand" href="#">Pippo 456568</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Features</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Pricing</a>
          </li>
          <!--<li class="nav-item">
            <a class="nav-link disabled" href="#">Disabled</a>
          </li>-->
        </ul>
      </div>
    </nav>

	<div class="container">
		<form id="login-form" action="studyPlan" method="post">
			<h3 class="text-center">Study Plan</h3>
            <div class="modal-body">
            <!-- List of selectable exams. -->
  			<table class="table table-striped table-bordered" id="examTable" align="center">
        	<thead>
    			<tr>
    				<th>Name</th>
    				<th>Professor</th>
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
		for (let i in exams) {
			exam = exams[i];
			let row  = table.insertRow( index++ );
			let nameRow      = row.insertCell( 0 );
			let professorRow = row.insertCell( 1 );
			let creditsRow   = row.insertCell( 2 );
			let checkRow     = row.insertCell( 3 );
			
			let credits = exam['credits'];
			nameRow.innerHTML      = exam['name'];
			let professorName      = exam['user_list'][0]['name'];
			let professorSurname   = exam['user_list'][0]['surname'];
			professorRow.innerHTML = professorName + " " + professorSurname;
			creditsRow.innerHTML   = credits;
			
			createCheckboxer( checkRow, index, exam['id_exam'], credits );
		}
	</script>
</html>
