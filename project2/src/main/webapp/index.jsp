<!--
author: Boostraptheme
author URL: https://boostraptheme.com
License: Creative Commons Attribution 4.0 Unported
License URL: https://creativecommons.org/licenses/by/4.0/
-->

<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Unimarina - Universita'�Telematica di Economia</title>
    <link href="<c:url value='/resources/img/logo.png'/>" rel="shortcut icon">

    <!-- Global Stylesheets -->
    <link href="<c:url value='https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/bootstrap/bootstrap.min.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/resources/font-awesome-4.7.0/css/font-awesome.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/animate/animate.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/owl-carousel/owl.carousel.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/owl-carousel/owl.theme.default.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
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
                    LOGIN OR REGISTER
======================================================-->
    <section id="login">
      <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header" align="center">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span class="fa fa-times" aria-hidden="true"></span>
                      </button>
                  </div>
                  <div id="div-forms">
                      <form id="login-form" action="loginController" method="post">
                          <h3 class="text-center">Accedi</h3>
                          <div class="modal-body">
                              <label for="login_username">Email istituzionale</label>
                              <input id="login_username" class="form-control" type="text" placeholder="" name="username" required>
                              <label for="login_password">Password</label>
                              <input id="login_password" class="form-control" type="password" placeholder="" name="password" required>
                              <div class="checkbox">
                                  <label>
                                      <input type="checkbox"> Remember me
                                  </label>
                              </div>
                          </div>
                          <div class="modal-footer text-center">
                              <div>
                                  <button type="submit" class="btn btn-general btn-white">Accedi</button>
                              </div>
                              <div>
                                  <button id="login_register_btn" type="button" class="btn btn-link">Registrati</button>
                              </div>
                          </div>
                      </form>
                      <form id="register-form" style="display:none;" action="registerController" method="post">
                          <h3 class="text-center">Registrati</h3>
                          <div class="modal-body"> 
                              <label for="register_name">Nome</label>
                              <input id="register_name" class="form-control" name="name" type="text" placeholder="" required maxlength="32" pattern="[A-Za-z]*$">

                              <label for="register_cognome">Cognome</label>
                              <input id="register_cognome" class="form-control" name="surname" type="text" placeholder="" required maxlength="32" pattern="[A-Za-z]*$">

                              <label for="register_data_di_nascita">Data di nascita</label>
                              <input id="register_data_di_nascita" class="form-control" name="dateOfBirth" type="date" placeholder="" required>

							  <label for="register_email_personale">Email personale</label>
                              <input id="register_email_personale" class="form-control" name="personalEmail" type="email" placeholder="" required maxlength="28">

                              <label for="register_password">Password</label> 
                              <input id="register_password" class="form-control" name="password" type="password" placeholder="" required maxlength="8">
                          </div>
                          <div class="modal-footer">
                              <div>
                                  <button type="submit" class="btn btn-general btn-white">Registrati</button>
                              </div>
                              <div>
                                  <button id="register_login_btn" type="button" class="btn btn-link">Accedi</button>
                              </div>
                          </div>
                      </form>
                  </div>
              </div>
          </div>
      </div>
    </section>      

	

<!--====================================================
                         HOME
======================================================-->
    <section id="home">
      <div id="carousel" class="carousel slide carousel-fade" data-ride="carousel"> 
        <!-- Carousel items -->
        <div class="carousel-inner">
            <div class="carousel-item active slides">
              <div class="overlay"></div>
              <div class="slide-1"></div>
                <div class="hero ">
                  <hgroup class="wow fadeInUp">
                      <h1>UniMarina e' per <span ><a href="" class="typewrite" data-period="2000" data-type='[ " Tutti", " Giovani e non solo"]'>
                        <span class="wrap"></span></a></span> </h1>        
                      <h3>Ti aspettiamo per iniziare questo percorso insieme</h3>
                  </hgroup>
                </div>           
            </div> 
        </div> 
      </div> 
    </section>	


<!--====================================================
                        ABOUT
======================================================-->
    <section id="about" class="about">
      <div class="container">
        <div class="row title-bar">
          <div class="col-md-12">
		   <center>
		   <img src="<c:url value='/resources/img/logo.png'/>">
		   </center>
        
            <p class="wow fadeInUp" data-wow-delay="0.4s">L'universita' telematica di Economia e Management, con la sua offerta didattica, mira a rispondere alla esigenza di formazione professionale e scientifica della società e del mercato del lavoro relativamente ai settori aziendale, economico in senso lato e statistico. Gli studenti possono approfondire le proprie conoscenze nell'ambito di quattro aree principali: economica, economico-aziendale, statistico-matematica e giuridica.</p>
            
          </div>
        </div>
      </div>  
      <!-- About right side withBG parallax -->
      <div class="container-fluid">
        <div class="row"> 
          <div class="col-md-4 bg-starship">
            <div class="about-content-box wow fadeInUp" data-wow-delay="0.3s">
              <i class="fa fa-user-plus"></i>
              <h5>Effettua la registazione</h5>
              <p class="desc">Inserisci i tuoi dati personali, una email e una password</p>
			  <p class="desc">Ti verrà fornita una email istituzionale</p>
			  <div>
			  
				<a href="#" class="log-top" data-toggle="modal" data-target="#login-modal2"><button>Registrati</button></a>
				</div>
            </div>
          </div> 
          <div class="col-md-4 bg-chathams">
            <div class="about-content-box wow fadeInUp" data-wow-delay="0.5s">
              <i class="fa fa-user-circle-o">
			  </i>
              <h5>Effettua il login</h5>
              <p class="desc">Assicurati di aver correttamente inserito i dati</p>
			  <p class="desc">Al primo accesso dovrai creare il tuo piano di studi</p>				
				<div>
				<a href="#" class="log-top" data-toggle="modal" data-target="#login-modal1"><button>Accedi</button></a>
				</div>
			</div>
          </div> 
          <div class="col-md-4 bg-matisse">
            <div class="about-content-box wow fadeInUp" data-wow-delay="0.7s">
              <i class="fa fa-list-ul"></i>
              <h5>Crea il tuo piano di studi</h5>
              <p class="desc">Scegli 10 esami tra i 30 disponibili</p>
            </div>
          </div> 
        </div> 
      </div>       
    </section> 


	
<!--====================================================
                    LOGIN OR REGISTER
======================================================-->
    <section id="login">
      <div class="modal fade" id="login-modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header" align="center">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span class="fa fa-times" aria-hidden="true"></span>
                      </button>
                  </div>
                  <div id="div-forms">
                      <form id="login-form-2">
                          <h3 class="text-center">Accedi</h3>
                          <div class="modal-body">
                              <label for="login_username_2">Email istituzionale</label>
                              <input id="login_username_2" class="form-control" type="text" placeholder="" required>
                              <label for="login_password_2">Password</label>
                              <input id="login_password_2" class="form-control" type="password" placeholder="" required>
                              <div class="checkbox">
                                  <label>
                                      <input type="checkbox"> Remember me
                                  </label>
                              </div>
                          </div>
                          <div class="modal-footer text-center">
                              <div>
                                  <button type="submit" class="btn btn-general btn-white">Accedi</button>
                              </div>
                              

                              </div>
                          </div>
                      </form>
                  </div>
              </div>
          </div>
      </div>
    </section>
	
<!--====================================================
                    LOGIN OR REGISTER
======================================================-->
    <section id="login">
      <div class="modal fade" id="login-modal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header" align="center">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span class="fa fa-times" aria-hidden="true"></span>
                      </button>
                  </div>
                  <div id="div-forms">
                      
                          <h3 class="text-center">Registrati</h3>
                          <div class="modal-body"> 
                              <label for="register_name_2">Nome</label>
                              <input id="register_name_2" class="form-control" type="text" placeholder="" required>
                              <label for="register_cognome_2">Cognome</label>
                              <input id="register_cognome_2" class="form-control" type="text" placeholder="" required>
                              <label for="register_data_di_nascita_2">Data di nascita</label>
                              <input id="register_data_di_nascita_2" class="form-control" type="date" placeholder="" required>
							  <label for="register_email_personale_2">Email personale</label>
                              <input id="register_email_personale_2" class="form-control" type="text" placeholder="" required>
                              <label for="register_password">Password</label> 
                              <input id="register_password_2" class="form-control" type="password" placeholder="" required>
                          </div>
                          <div class="modal-footer">
                              <div>
                                  <button type="submit" class="btn btn-general btn-white">Registrati</button>
                              </div>
                              
                          </div>
                       </div>
              </div>
          </div>
      </div>
    </section>

	

<p>
<br></br>
<br></br>
<br></br>
</p>

<!--====================================================
                     WHAT WE DO
======================================================-->
    <section class="what-we-do bg-gradiant">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">
		  <center>
		  <br> </br>
		   <br> </br>
            <h3>Devo spostarmi<br>
			di sede per iscrivermi <br>
			a unimarina?</h3>
            </center>
			<center>
            <p class="desc">Assolutamente NO! Potrai seguire da casa i corsi online ed effettuare i relativi test comodamente da casa.</p>
			</center>
		  </div>
          <div class="col-md-9">
            <div class="row">
			 
			 
			<div class="col-md-4  col-sm-6">
				 <br> </br>
				 
			 <div class="what-we-desc">
				  <i class="fa fa-list-ul"></i>
                  <h6>Piano di studi</h6>
                  <p class="desc">Dopo aver effettuato il primo login crea il piano di studi e scegli 10 esami tra quelli proposti.</p>
                </div>
             </div>
		 
			<div class="col-md-4  col-sm-6">
				 <br> </br>
			 <div class="what-we-desc">
                  <i class="fa fa-video-camera"></i>
                  <h6>Lezioni online</h6>
                  <p class="desc">Ogni docente carica video lezione e il relativo materiale didattico sul sito web. </p>
                </div>
            </div>
	
              <div class="col-md-4  col-sm-6">
                 <br> </br>
				<div class="what-we-desc">
                  <i class="fa fa-file-text"></i>
                  <h6>Sessione d'esami</h6>
                  <p class="desc">Timestralmente avrai la possibilità di prenotarti agli appelli nella tua area riservata ed effettuare i test.</p>
                </div>
              </div>
              
			  <div class="col-md-4  col-sm-6">
                 <br> </br>
				<div class="what-we-desc">
                  <i class="fa fa-exclamation-circle"></i>
                  <h6>Limite bocciature</h6>
                  <p class="desc">Per ogni sessione, puoi ripetere lo stesso esame al massimo tre volte! Altrimenti resti bloccato per 3 mesi.</p>
                </div>
              </div>
			  
			  <div class="col-md-4  col-sm-6">
                 <br> </br>
				<div class="what-we-desc">
                  <i class="fa fa-graduation-cap"></i>
                  <h6>Seduta di Laurea</h6>
                  <p class="desc">Sostenuti 10 esami, potrai prenotarti alla seduta di Laurea e sostenere la prova finale.</p>
                </div>
              </div>
			  
			  <div class="col-md-4  col-sm-6">
                 <br> </br>
				<div class="what-we-desc">
                  <i class="fa fa-trophy"></i>
                  <h6>Buona Fortuna!</h6>
                  <p class="desc">Grazie ai nostri corsi e all'impegno messo da te potrai diventare un ottimo professionista!</p>
                </div>
              </div>
    </section>
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
    <script src="<c:url value='/resources/js/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/resources/js/popper/popper.min.js'/>"></script>
    <script src="<c:url value='/resources/js/bootstrap/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/js/wow/wow.min.js'/>"></script>
    <script src="<c:url value='/resources/js/owl-carousel/owl.carousel.min.js'/>"></script>

    <!-- Plugin JavaScript -->
    <script src="<c:url value='/resources/js/jquery-easing/jquery.easing.min.js'/>"></script> 
    <script src="<c:url value='/resources/js/custom.js'/>"></script> 
  </body>

</html>
