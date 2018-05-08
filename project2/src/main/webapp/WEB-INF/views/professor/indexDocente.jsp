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

    <title>Business Bootstrap Responsive Template</title>
    <link rel="shortcut icon" href="<c:url value='/resources/img/favicon.ico'/>">

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
                  <a class="nav-link dropdown-toggle smooth-scroll" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Inserisci</a> 
                  <div class="dropdown-menu dropdown-cust" aria-labelledby="navbarDropdownMenuLink"> 
                    <a class="dropdown-item"  target="_empty" href="admin/index.html">Video</a> 
                    <a class="dropdown-item"  target="_empty" href="admin/chart.html">Pdf</a> 
                    <a class="dropdown-item"  target="_empty" href="admin/email.html">Test</a> 
                    
                  </div>
                </li>
        
                <li>
                  <i class="search fa fa-search search-btn"></i>
                  <div class="search-open">
                    <div class="input-group animated fadeInUp">
                      <input type="text" class="form-control" placeholder="Search" aria-describedby="basic-addon2">
                      <span class="input-group-addon" id="basic-addon2">Go</span>
                    </div>
                  </div>
                </li> 
                <li>
                 
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
                      <form id="login-form">
                          <h3 class="text-center">Accedi</h3>
                          <div class="modal-body">
                              <label for="username">Email istituzionale</label> 
                              <input id="login_username" class="form-control" type="text" placeholder="" required>
                              <label for="username">Password</label> 
                              <input id="login_password" class="form-control" type="password" placeholder="" required>
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
                      <form id="register-form" style="display:none;">
                          <h3 class="text-center">Registrati</h3>
                          <div class="modal-body"> 
                              <label for="nome">Nome</label> 
                              <input id="register_name" class="form-control" type="text" placeholder="" required>
                              <label for="cognome">Cognome</label> 
                              <input id="register_cognome" class="form-control" type="text" placeholder="" required>
                              <label for="data di nascita">Data di nascita</label> 
                              <input id="register_data di nascita" class="form-control" type="text" placeholder="" required>
							  <label for="register_email personale">Email personale</label> 
                              <input id="register_email personale" class="form-control" type="text" placeholder="" required>
                              <label for="register_password">Password</label> 
                              <input id="register_password" class="form-control" type="password" placeholder="" required>
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
                      TABELLA
======================================================-->

<table border="1" width=800" align="center">
<tr>
<td>esame</td>
<td>Video</td>
<td>Pdf</td>
<td>Test</td>
</tr>
<tr>
<td>esame</td>
<td>Video</td>
<td>Pdf</td>
<td>Test</td>
</tr>
<tr>
<td>esame</td>
<td>Video</td>
<td>Pdf</td>
<td>Test</td>
</tr>
<tr>
<td>esame</td>
<td>Video</td>
<td>Pdf</td>
<td>Test</td>
</tr>
<tr>
<td>esame</td>
<td>Video</td>
<td>Pdf</td>
<td>Test</td>
</tr>
<tr>
<td>esame</td>
<td>Video</td>
<td>Pdf</td>
<td>Test</td>
</tr>
<tr>
<td>esame</td>
<td>Video</td>
<td>Pdf</td>
<td>Test</td>
</tr>
<tr>
<td>esame</td>
<td>Video</td>
<td>Pdf</td>
<td>Test</td>
</tr>
<tr>
<td>esame</td>
<td>Video</td>
<td>Pdf</td>
<td>Test</td>
</tr>
<tr>
<td>esame</td>
<td>Video</td>
<td>Pdf</td>
<td>Test</td>
</tr>
</table>


 	
	

<p>
<br><br>
<br><br>
<br><br>
<p>
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
  </body>
	
	<!--Global JavaScript -->
    <script src="<c:url value='/resources/js/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/resources/js/popper/popper.min.js'/>"></script>
    <script src="<c:url value='/resources/js/bootstrap/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/js/wow/wow.min.js'/>"></script>
    <script src="<c:url value='/resources/js/owl-carousel/owl.carousel.min.js'/>"></script>

    <!-- Plugin JavaScript -->
    <script src="<c:url value='/resources/js/jquery-easing/jquery.easing.min.js'/>"></script> 
    <script src="<c:url value='/resources/js/custom.js'/>"></script> 
</html>
