<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css">
    <script src="js/jquery/jQuery.js"></script>
    <script src="js/bootstrap/bootstrap.min.js"></script>
		<title>Test Creation</title>
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

		<h1>
			<p align="center">
				<strong> Study Plan </strong>
			</p>
		</h1>

		<div class="container">
      <!-- List of selected exams. -->
  		<table class="table table-striped table-bordered" id="examTable", align="center">
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

  		<!-- JavaScript will populate it with the achieved credits. -->
  		<p id="credits"/>
  		<!-- JavaScript will populate it with the average mark. -->
  		<p id="averageMark"/>

			<!--<ul class="buttons">
				<li class="mb-2"><button id="save_btn" class="border btn btn-success" type="button">Save</button></li>
				<li><button type="button" class="border btn btn-danger">Paris</button></li>
				<li><button type="button">Tokio</button></li>
			</ul>-->

			<div class="col-md-* text-center">
				<button id="save_btn" class="border btn btn-success" align="center" type="button">Save</button>
				<button type="button" class="border btn btn-danger" align="center">Cancel</button>
			</div>

		</div>
	</body>

	<script type="text/javascript">
		let save_btn = document.getElementById( 'save_btn' );
		save_btn.addEventListener( "click", function() {
			console.log( "PREMUTO!!" );
			$.ajax({
			    url:"http://localhost:8080/Project1/UniversityBookletController",
			    data:{"key1":"value1","key2":"value2"},
			    type:'POST',
			    dataType : 'json',   /* use 'json' for cross domain*/
			    success:function(data, textStatus, jqXHR){
			        // access response data
			    },
			    error:function(data, textStatus, jqXHR){
			        console.log('Service call failed!');
			    }
			});
		} );

		// Get the table to be filled.
		let table = document.getElementById( "examBodyTable" );

		for (let i = 1; i <= 5; i++) {
			$('#cb_exam_' + i).change( addEventHandlerCheckboxer( i ));
			let row  = table.insertRow( i - 1 );
			let nameRow      = row.insertCell( 0 );
			let professorRow = row.insertCell( 1 );
			let creditsRow   = row.insertCell( 2 );
			let markRow      = row.insertCell( 3 );

			nameRow.innerHTML      = "Prova Esame";
			professorRow.innerHTML = "Tommaso II";
			creditsRow.innerHTML   = 9;

			createCheckboxer( markRow, i, 9 );
		}

		let selectedCredits = 0;
		const CREDITS_THRESHOLD = 18;

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
              }
					} else {
						  if (selectedCredits == CREDITS_THRESHOLD) {
									// Re-enables all the disabled checkboxes.
									changeBoxStatus( index - 1, false );
							}

							selectedCredits -= credits;
							console.log( "NON PREMUTO: " + index + ", CREDITS: " + credits + ", TOTAL_CREDITS: " + selectedCredits );
					}
			}
		}

		function createCheckboxer( row, index, credits )
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
			igt.appendChild( input );
			input.setAttribute( 'aria-label', "Checkbox for following text input" );
			input.classList.add( "checkBoxClass" );
			input.addEventListener( "click", addEventHandlerCheckboxer( index, credits ) );
		}

		let jsonExams = '<%= request.getAttribute( "examsPlan" ) %>';
		console.log( "JSON_EXAMS: " + jsonExams );
		let exams = JSON.parse( jsonExams )['exams'];
		let totalCredits = 0.0;
		let totalMarks   = 0.0;
		let index = 0;
		for (let i in exams) {
			exam = exams[i];
			let row  = table.insertRow( index++ );
			let nameRow      = row.insertCell( 0 );
			let professorRow = row.insertCell( 1 );
			let creditsRow   = row.insertCell( 2 );
			let markRow      = row.insertCell( 3 );

			let credits = exam['credits'];
			let mark    = exam['mark'];
			nameRow.innerHTML      = exam['name'];
			professorRow.innerHTML = exam['professor'];
			creditsRow.innerHTML   = credits;

			if (mark > 0) {
				markRow.innerHTML  = mark;
				totalCredits += credits;
				totalMarks   += mark * credits;
			}

			createCheckboxer( markRow, index, credits );
		}

		let avgMark = 0;
		if (totalCredits > 0) {
			avgMark = Math.trunc( ((totalMarks / totalCredits) / 30.0) * 110.0 );
		}
		document.getElementById( "averageMark" ).innerHTML = "Average Mark: " + avgMark + "/110";
		document.getElementById( "credits" ).innerHTML = "Credits: " +totalCredits + "/60";
	</script>
</html>
