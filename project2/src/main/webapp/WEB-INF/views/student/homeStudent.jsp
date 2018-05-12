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
  </head>

  <body id="page-top">
	<header>
		 <nav class="navbar navbar-expand-lg navbar-light" id="mainNav" data-toggle="affix">
        <div class="container">
          <a class="navbar-brand smooth-scroll" href="welcomeStudente.html">
            <img src="<c:url value='/resources/img/logo.png'/>" alt="logo">
          </a> 
          <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"> 
                <span class="navbar-toggler-icon"></span>
          </button>  
		  <p> Universita' Telematica per eccellenza </p>
		  <a class="navbar-brand smooth-scroll" href="welcomeStudente.html">
            <img src="<c:url value='/resources/img/logo.png'/>" alt="logo">
          </a>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item" ><a class="nav-link smooth-scroll" href="welcomeStudente.html">Home</a></li>
				<a class="dropdown-item" href="index.html">Logout</a>
            </ul>  
          </div>
	    </div>
      </nav>
	</header>
	<p><br></br></p>
	<h2 style="color: SlateBlue; font-size:150%"> Benvenuto ${requestScope['user'].name}. </h2>
	<p><br></br></p>
    <li class="nav-item dropdown" >
        <a class="nav-link dropdown-toggle smooth-scroll" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Menu</a> 
		<div class="dropdown-menu dropdown-cust" aria-labelledby="navbarDropdownMenuLink"> 
			<form id="login-form" action="viewBooklet" method="post">
            	<div class="modal-body">
					<div>
						<button type="submit" class="btn btn-general btn-white">Visualizza Libretto</button>
					</div>
				</div>
            </form>
            <a class="dropdown-item"  target="_empty" >Segui Lezioni Online</a>
        </div>
	</li>
	<ul style="position: absolute;top: 200px; right: 100px;">
		<h5> ${requestScope['user'].name} ${requestScope['user'].surname} </h5>
		<h5> ${requestScope['user'].id_user}</h5>
		<p style="font-size:120%"> Informazioni sullo studente:</p>
		<ul>
			<li>Email Istituzionale: ${requestScope['user'].istitutional_email}</li>
			<li>Data di Nascita: ${requestScope['user'].date_of_birth}</li>
			<li>Corso di studio: Economia e Management
			<li>Email Personale: ${requestScope['user'].personal_email}</li>
		</ul>
	</ul>
    
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