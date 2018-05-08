<!--
author: Boostraptheme
author URL: https://boostraptheme.com
License: Creative Commons Attribution 4.0 Unported
License URL: https://creativecommons.org/licenses/by/4.0/
-->


<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
    <title>Business Bootstrap Responsive Template</title>
    <link rel="shortcut icon" href="img/favicon.ico">

    <!-- Global Stylesheets -->
    
    <link href="css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/animate/animate.min.css">
    <link rel="stylesheet" href="css/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css">
    
    <!-- Core Stylesheets -->
    <link rel="stylesheet" href="css/shop.css">
    
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
          <a class="navbar-brand smooth-scroll" href="../index.html">
            <img src="../img/logo.png" alt="logo">
          </a> 
          <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"> 
                <span class="navbar-toggler-icon"></span>
          </button>  
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item" ><a class="nav-link smooth-scroll" href="../index.html">Home</a></li>
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
        <h1 class="wow fadeInUp" data-wow-delay="0.1s">Crea Test</h1>
      </div><!--/end container-->
    </div> 

<!--====================================================
                        CART
======================================================-->
   <br>
   <br>
   <br>
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
  		<table class="table table-bordered" id="questionTable", align="center">
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

			<div class="col-md-* text-center">
				<button id="save_btn" class="border btn btn-success" align="center" type="button">Save</button>
				<button type="button" class="border btn btn-danger" align="center">Cancel</button>
			</div>

    </div>
	</body>
<br>
	<script type="text/javascript">
			let qList = [];
			let numQuestions    = 0;
			let currentQuestion = 0;
			let questionList    = document.getElementById( "questions_list" );
			const MAX_ANSWERS   = 4;

			// Get the table to be filled.
			let table = document.getElementById( "questionBodyTable" );

			// Add an empty question when the window is loaded.
			window.onload = function() {
					addQuestion();
			}

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
					let row  = table.insertRow( index - 1 );
					let answerRow  = row.insertCell( 0 );
					let correctRow = row.insertCell( 1 );

					answerRow.innerHTML  = "<textarea class='form-control' rows='1' id='answer_area_" + (index - 1) + "'></textarea>";
					correctRow.innerHTML = "<label><input type='radio' name='optradio' id='correct_answer_" + (index - 1) + "' value=''></label>";
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
							// FIXME Send a message using an ajax request.
							$.ajax({
							    url:"http://localhost:8080/Project1/createTestController",
							    data:{
											"key1":"value1",
											"key2":"value2"
									},
							    type:'POST',
							    dataType : 'json',   /* use 'json' for cross domain*/
							    success:function( data, textStatus, jqXHR ) {
							        // access response data
											console.log( 'Service call success!' );
							    },
							    error:function( data, textStatus, jqXHR ) {
							        console.log( 'Service call failed!' );
							    }
							});
						}
				} );
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
                  <div><img src="img/logo-w.png" alt="" class="img-fluid"></div>
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
    <script src="js/jquery/jquery.min.js"></script>
    <script src="js/popper/popper.min.js"></script>
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <script src="js/wow/wow.min.js"></script>
    <script src="js/owl-carousel/owl.carousel.min.js"></script>
		

    <!-- Plugin JavaScript -->
    <script src="js/jquery-easing/jquery.easing.min.js"></script> 
    <script src="js/custom.js"></script> 
	<script src="js/question.js"></script>
  </body>

</html>
