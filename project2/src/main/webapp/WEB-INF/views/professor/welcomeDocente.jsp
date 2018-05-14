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
                  <li><a href="<c:url value='index.jsp'/>" class="log-top" data-target="#login-modal">Disconnetti</a></li>
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
          <a class="navbar-brand smooth-scroll" href="<c:url value='index.jsp'/>">
            <img src="<c:url value='/resources/img/logo.png'/>" alt="logo">
          </a> 
          <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"> 
                <span class="navbar-toggler-icon"></span>
          </button>  
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item" ><a class="nav-link smooth-scroll" href="<c:url value='index.jsp'/>">Home</a></li>
            </ul>  
          </div>
          <form action="uploadSession" method="get" id="login-form">
              <div class="modal-footer text-center">
                  <div>
                      <button type="submit" class="btn btn-general btn-white">Carica appello</button>
                  </div>
                 </div>
          </form>
        </div>
      </nav>
	  <br>
    </header>

<!--=====================================================
					  CREATION TEST
======================================================-->

<section id="create_test">
      <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header" align="center">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span class="fa fa-times" aria-hidden="true"></span>
                      </button>
                  </div>
                  <div id="div-forms">
                      <form id="login-form">
                          <h3 class="text-center">Create Test</h3>
                          <div class="modal-body">
                              <div class="container">
		                        <div class="row">
	                            <div class="col-10">
	                              <div id="questions_list" style="margin-bottom: 10px;"></div>
	                            </div>
	                            <div class="col">
				                        <div class="row">
				                          <div class="col">
						                        <div>
							                        <button id="add_question" class="border btn btn-success" onclick="addQuestion()" type="button">ADD</button>
						                        </div>
					                        </div>
				                          <div class="w-100"></div>
				                          <div class="col">
						                        <div>
							                        <button id="remove_question" class="border btn btn-danger" onclick="removeQuestion()" disabled="true" type="button">DELETE</button>
						                        </div>
					                        </div>
				                        </div>
	                            </div>
	                          </div>

		                        <div class="row" style="margin-top: 15px;">
			                        <div class="col-10">
				                        <label>Question:</label>
				                        <div class="form-group">
				                          <textarea type="text" class="form-control" rows="1" id="questionArea"></textarea>
				                        </div>
			                        </div>
			                        <div class="col">
				                        <label>Weight:</label>
				                        <select class="form-control" id="weightArea">
				                          <option>1</option>
				                          <option>3</option>
				                          <option>5</option>
				                        </select>
			                        </div>
		                        </div>

		                        <!-- List of selected exams. -->
                      		<table class="table table-bordered" id="questionTable" align="center">
                            <thead>
                        			<tr>
                        				<th>Answer</th>
                        				<th>Correct Answer</th>
                        			</tr>
                            </thead>
			                        <tbody id="questionBodyTable">
					                        <!-- Empty body. -->
			                        </tbody>
                      		</table>

                        </div>
                          </div>
                          <div class="modal-footer text-center">
                              <div class="col-md-* text-center">
			                        <button id="save_btn" class="border btn btn-success" align="center" type="button">Save</button>
			                        <button type="button" class="border btn btn-danger" align="center" onclick=closeDialogCreateTest()>Cancel</button>
	                          </div>
                          </div>
                      </form>
                  </div>
              </div>
          </div>
      </div>
    </section>
 
<!--=====================================================
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
	
	<script>
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
        
        let index_btn = index;
        
        nameRow.innerHTML     = "<div class='row'><div class='col-sm-10 prod-desc'><h6 class='nomargin' align='center'>" + exam["name"] + "</h6></div></div>";
        videoRow.innerHTML    = "<div id='div_adder_" + index_btn + "'><input type='text' id='video_form_" + index_btn + "_1' class='form-control text-center'></form></div><p><input type='button' align='right' value='Aggiungi video' onclick=addVideo('" + index_btn + "')></p>";
        dispensaRow.innerHTML = "<div id='dispensa_adder_" + index_btn + "'><form action='upload.asp' name='p' method='post'> <input id='dispensa_form_" + index_btn + "_1' type='file' class='form-control text-center' style='display: none;'><input type='button' value='Browse' onclick=document.getElementById('dispensa_form_" + index_btn + "_1').click(); /></form><input type='text' id='dispensa_text_" + index_btn + "_1' class='form-control text-center' readOnly='true'></form></div><div style='float:right'><input type='button' align='right' value='Aggiungi dispensa' onclick=addDispensa('" + index_btn + "')></div>";
        testRow.innerHTML     = "<center><div><br><a href='#' class='log-top btn btn-general btn-green' data-toggle='modal' data-target='#login-modal'>Gestione Test</a></div> </center>";
		//testRow.innerHTML     = "<center><div><br><input type='button' id='test_button_" + index_btn + "' class='btn btn-general btn-green' value='Gestione Test'></div> </center>";
		saveRow.innerHTML     = "<center><br><button id='save_btn_" + index_btn + "' class='btn btn-general btn-green'>Save</button></center>"
		
		examsList.push( new examClass( exam, 1, 1 ) );
		
		document.getElementById( "dispensa_form_" + index_btn + "_1" ).onchange = function () {
			let dispensa_text = document.getElementById( "dispensa_text_" + index_btn + "_" + 1 );
  			dispensa_text["value"] = this.value.split(/(\\|\/)/g).pop();
		};
		
		let idx_video = 0;
		let idx_note  = 0;
		let materials = exam["material_list"];
		for (let material of materials) {
			let name = material["file"];
			let type = material["type"];
			if (type.localeCompare( "V" ) == 0) {
				if (idx_video == 0) {
					let video_adder = document.getElementById( "video_form_" + index_btn + "_" + 1 );
					video_adder.value = name;
					idx_video = 1;
				} else {
					addVideo( index_btn, name );
				}
			} else {
				if (idx_note == 0) {
					let note_adder = document.getElementById( "dispensa_text_" + index_btn + "_" + 1 );
					note_adder.value = name;
					idx_note = 1;
				} else {
					addDispensa( index_btn, name );
				}
			}
		}
		
		let save_btn1 = document.getElementById( 'save_btn_' + index_btn );
		save_btn1.addEventListener( "click", function() {
			let exam = examsList[index_btn - 1];
			
			console.log( "INDEX: " + index_btn );
			// Get all the videos.
			let videos = [];
			for (let i = 1; i <= exam["counterVideo"]; i++) {
				let video_form = document.getElementById( "video_form_" + index_btn + "_" + i );
				let video_url  = video_form["value"];
				if (video_url.length > 0) {
					videos.push( video_url );
				}
			}
			
			// Get all the notes.
			let notes = [];
			for (let i = 1; i <= exam["counterDispensa"]; i++) {
				let dispensa_form = document.getElementById( "dispensa_text_" + index_btn + "_" + i );
				let note = dispensa_form["value"];
				console.log( "DISPENSA: " + note );
				if (note.length > 0) {
					notes.push( note );
				}
			}
			
			$.ajax({
				url:"http://localhost:8080/uploadController",
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
	
	function addVideo( index, value )
	{
		let exam = examsList[index-1];
		if (exam["counterVideo"] == LIMIT_VIDEO) {
			alert( "You have reached the limit!" );
		} else {
			let next = exam["counterVideo"] + 1;
			let video_form  = document.getElementById( "div_adder_" + index );
			let nextVideo   = document.createElement( "input" );
			nextVideo.classList.add( "form-control" );
			nextVideo.classList.add( "text-center" );
			nextVideo.type  = "text";
			if (typeof value != 'undefined') {
				nextVideo.value = value;
			}
			nextVideo.setAttribute( "id", "video_form_" + index + "_" + next );
			video_form.appendChild( nextVideo );

			exam["counterVideo"]++;
		}
	}

	function addDispensa( index, value )
	{
		let exam = examsList[index-1];
		if (exam["counterDispensa"] == LIMIT_DISPENSA) {
			alert( "You have reached the limit!" );
		} else {
			let next = exam["counterDispensa"] + 1;
			let dispensa_form  = document.getElementById( "dispensa_adder_" + index );
			
			let nextDispensa   = document.createElement( "input" );
			nextDispensa.classList.add( "form-control" );
			nextDispensa.classList.add( "text-center" );
			nextDispensa.type  = "file";
			nextDispensa.setAttribute( "id", "dispensa_form_" + index + "_" + next );
			nextDispensa.setAttribute( "style", "display : none;" );
			
			nextDispensa.onchange = function () {
				let dispensa_text = document.getElementById( "dispensa_text_" + index + "_" + next );
  				dispensa_text["value"] = this.value.split(/(\\|\/)/g).pop();
  			};
  			
  			let buttonBrowser      = document.createElement( "input" );
			buttonBrowser.type     = "button";
			buttonBrowser.value    = "Browse";
			buttonBrowser.addEventListener( "click", function() { document.getElementById( "dispensa_form_" + index + "_" + next ).click(); } );
			dispensa_form.appendChild( buttonBrowser );
			
			let nextDispensaText   = document.createElement( "input" );
			nextDispensaText.classList.add( "form-control" );
			nextDispensaText.classList.add( "text-center" );
			nextDispensaText.setAttribute( "id", "dispensa_text_" + index + "_" + next );
			nextDispensaText.setAttribute( "readOnly", "true" );
			
			if (typeof value != 'undefined') {
				nextDispensaText.value = value;
			}
			
			dispensa_form.appendChild( nextDispensa );
			dispensa_form.appendChild( nextDispensaText );
			
			exam["counterDispensa"]++;
		}
	}
	
	/*======================================================
				 		  CREATE TEST
	======================================================*/
	
	let qList = [];
	let numQuestions    = 0;
	let currentQuestion = 0;
	let questionList    = document.getElementById( "questions_list" );
	const MAX_ANSWERS   = 4;
	
	let Question = class {
		constructor( question, weight, answers, correct )
		{
			this.question = question;
			this.weight   = weight;
			this.answers  = answers;
			this.correct  = correct;
		}
		
	    isCompleted()
		{
			if (this.question == "" ||
				!this.answers.every( function( e ) { return e != ""; } ) ||
				this.correct == -1) {
				return false;
	        } else {
				return true;
			}
		}
	}
	
	// Get the table to be filled.
	let testTable = document.getElementById( "questionBodyTable" );
	
	function selectQuestion( index )
	{
		//console.log( "INDEX: " + index + ", CURRENT: " + currentQuestion );
		// Change the style of the button to let it appears as always selected.
		let oldButton = questionList.childNodes[currentQuestion];
		oldButton.classList.remove( "btn-primary" );
		oldButton.classList.add( "btn-outline-primary" );
	
		let button = questionList.childNodes[index];
		button.classList.remove( "btn-outline-primary" );
		button.classList.add( "btn-primary" );
	
		let currentQ = qList[currentQuestion];
		let question = document.getElementById( "questionArea" );
		currentQ["question"] = question["value"];
		let weight = document.getElementById( "weightArea" );
		currentQ["weight"] = weight["value"];
	
		let nextQ = qList[index];
		question["value"] = nextQ["question"];
		weight["value"]   = nextQ["weight"];
	
		for (let i = 0; i < MAX_ANSWERS; i++) {
			// Load the answer and save it on the question object.
			let answer = document.getElementById( "answer_area_" + i );
			currentQ["answers"][i] = answer["value"];
			answer["value"] = nextQ["answers"][i];
	
			// Save the correct answer.
			let correct = document.getElementById( "correct_answer_" + i );
			if (correct["checked"]) {
				currentQ["correct"] = i;
				correct["checked"] = false;
			}
		}
	
		for (let i = 0; i < MAX_ANSWERS; i++) {
			// Save the correct answer.
			let correct = document.getElementById( "correct_answer_" + i );
			if (i == nextQ["correct"]) {
				correct["checked"] = true;
			}
		}
	
		currentQuestion = index;
	}
	
	function addQuestion()
	{
		let q = new Question( "", 1, ["","","",""], -1 );
		qList.push( q );
	
		numQuestions++;
		let qButton       = document.createElement( "button" );
		qButton.classList.add( "btn" );
		qButton.classList.add( "btn-outline-primary" );
		qButton.value     = numQuestions;
		qButton.innerHTML = numQuestions;
		qButton.setAttribute( "onclick", "selectQuestion( " + (numQuestions - 1) + " )" );
		qButton.setAttribute( "style", "margin-right: 5px; margin-bottom: 5px;" );
		questionList.appendChild( qButton );
	
		selectQuestion( numQuestions - 1 );
	
		if (numQuestions > 1) {
			document.getElementById( "remove_question" )["disabled"] = false;
		}
	}
	
	function addFilledQuestion( question, weight, answer1, answer2, answer3, answer4, correct )
	{
		let q = new Question( question, weight, [answer1,answer2,answer3,answer4], correct );
		qList.push( q );
	
		numQuestions++;
		let qButton       = document.createElement( "button" );
		qButton.classList.add( "btn" );
		qButton.classList.add( "btn-outline-primary" );
		qButton.value     = numQuestions;
		qButton.innerHTML = numQuestions;
		qButton.setAttribute( "onclick", "selectQuestion( " + (numQuestions - 1) + " )" );
		qButton.setAttribute( "style", "margin-right: 5px; margin-bottom: 5px;" );
		questionList.appendChild( qButton );
	
		selectQuestion( numQuestions - 1 );
		
		let correctQ = document.getElementById( "correct_answer_" + correct );
		correctQ["checked"] = true;
		
		document.getElementById( "questionArea" ).value = question;
		
		document.getElementById( "answer_area_0" ).value = answer1;
		document.getElementById( "answer_area_1" ).value = answer2;
		document.getElementById( "answer_area_2" ).value = answer3;
		document.getElementById( "answer_area_3" ).value = answer4;
	
		if (numQuestions > 1) {
			document.getElementById( "remove_question" )["disabled"] = false;
		}
	}
	
	function removeQuestion()
	{
		qList.splice( currentQuestion - 1, 1 );
		//console.log( "CURRENT: " + currentQuestion + ", NUM: " + numQuestions );
		if (currentQuestion == numQuestions - 1) {
			currentQuestion--;
		}
		numQuestions--;
		let questionList = document.getElementById( "questions_list" );
		questionList.removeChild( questionList.childNodes[currentQuestion] );
		for (let i = 0; i < questionList.childElementCount; i++) {
			let q = questionList.childNodes[i];
			if (q["value"] > currentQuestion) {
				q["value"]--;
				q.innerHTML = q["value"];
			}
		}
		selectQuestion( currentQuestion );
	
		if (numQuestions == 1) {
			document.getElementById( "remove_question" )["disabled"] = true;
		}
	}
	
	for (let i = 0; i < MAX_ANSWERS; i++) {
		addTableEntry( i + 1 );
	}
	
	function addTableEntry( index )
	{
		let row  = testTable.insertRow( index - 1 );
		let answerRow  = row.insertCell( 0 );
		let correctRow = row.insertCell( 1 );
	
		answerRow.innerHTML  = "<textarea class='form-control' rows='1' id='answer_area_" + (index - 1) + "'></textarea>";
		correctRow.innerHTML = "<label><input type='radio' name='optradio' id='correct_answer_" + (index - 1) + "' value=''></label>";
	}
	
	//let jsonUser = '<%= request.getAttribute( "user" ) %>';
	//let user = JSON.parse( jsonUser );
	console.log( user );
	
	for (_exam of exams) {
	    let questions = _exam["question_list"];
	    console.log( "EXAM: " + _exam + ", QUESTIONS: " + questions );
	 	if (questions.length == 0) {
			// Add an empty question.
			addQuestion();
		} else {
			for (let q of questions) {
				addFilledQuestion( q["question"], q["weight"], q["answer1"], q["answer2"],
								   q["answer3"], q["answer4"], q["correct_answer"] );
			}
		}
	}
	
	let save_btn = document.getElementById( 'save_btn' );
	save_btn.addEventListener( "click", function() {
		// Save the values inserted for the current question.
		selectQuestion( currentQuestion );
	
		// Firstly check if all the fields are not empty.
		let completed = true;
		for (let index = 0; index < qList.length; index++) {
			let question = qList[index];
			if (!question.isCompleted()) {
				completed = false;
				alert( "Question " + (index + 1) + " is incomplete!" );
				break;
			}
		}
	
		if (completed) {
			$.ajax({
			    url:"http://localhost:8080/uploadQuestions",
			    data:{
			    	"exam_id":user["exam_list"][0]["id_exam"],
					"questions":JSON.stringify( {'questions':qList} )
				},
			    type:'POST',
			    //dataType : 'json',   // use 'json' for cross domain
			    success:function( data, textStatus, jqXHR ) {
			        // access response data
					console.log( 'SEND: ' + data );
			    },
			    error:function( data, textStatus, jqXHR ) {
			        console.log( 'Service call failed!' );
			    }
			});
			
			closeDialogCreateTest();
		}
	} );
	
	function closeDialogCreateTest() {
		$('#login-modal').modal( "hide" );
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
