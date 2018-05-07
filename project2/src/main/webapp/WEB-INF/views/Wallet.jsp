<%@ page import="com.project.dao.EthereumDao" %>
<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Massaggi e saune</title>
    <link href="<c:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" media="all" >

    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="<c:url value="resources/css/style.css" />" rel="stylesheet" type="text/css" media="all" >
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Mattress Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <!--fonts-->
    <link href='//fonts.googleapis.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'><!--//fonts-->
    <!-- start menu -->
    <link href="<c:url value="resources/css/memenu.css" />" rel="stylesheet" type="text/css" media="all" >
    <link href="<c:url value="resources/css/wallet.css" />" rel="stylesheet" type="text/css" media="all" >

</head>
<body>



<!--header-->
<div class="header">
    <div class="header-top">
        <div class="container">
            <div class="social">
                <ul>
                    <li><a href="#"><i class="facebok"> </i></a></li>
                    <li><a href="#"><i class="twiter"> </i></a></li>
                    <li><a href="#"><i class="inst"> </i></a></li>
                    <li><a href="#"><i class="goog"> </i></a></li>
                </ul>
            </div>
            <div class="header-left">

     <!--           <div class="search-box">
                    <div id="sb-search" class="sb-search">
                        <form action="#" method="post">
                            <input class="sb-search-input" placeholder="Enter your search term..." type="search"  id="search">
                            <input class="sb-search-submit" type="submit" value="">
                            <span class="sb-icon-search"> </span>
                        </form>
                    </div>
                </div>  -->

                <!-- search-scripts -->

                <!-- //search-scripts -->

                <div class="ca-r">
                    <div class="cart box_1">
                        <a href="index.jsp">
                                 <div class="total">
                                <span class="simpleCart_total"></span> </div>
                                <img src="/resources/images/cart.png" alt=""/></h3>
                        </a>
                        <p><a class="simpleCart_empty">Carrello Vuoto</a></p>

                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>

        </div>
    </div>
    <div class="container">
        <div class="head-top">
            <div class="logo">
                <h1><a href="index.jsp">Super Relax</a></h1>
            </div>
            <div class=" h_menu4">
                <ul class="memenu skyblue">
                    <li><a class="color1" href="productController">Prodotti</a>

                    </li>
                    <li class="grid"><a class="color2" href="serviceController">Servizi</a>

                    </li>


                    <li class="grid"><a class="color2" href="logoutController" onclick="if (!confirm('Sei sicuro di voler uscire? ')) return false" action="">Logout</a>
					
					<li class="grid"><a class="color2" href="ethereumController">Wallet</a>
                </ul>
            </div>

            </div>


    </div>
</div>




<img src="resources/images/ethereum.png" alt="" class="ethereum"/>

<h3 class="text-center" id="address"> <div class="wallets">Indirizzo</div> ${requestScope['walletAddress']}</h3>
<h3 class="text-center" id="balance"> <div class="wallets">Saldo</div> 
 						<%
						if (request.getAttribute("wei") == null) {
						%>
						 <h4 align="center" style="color:red;">L'indirizzo inserito non � valido oppure vi � stato un problema di connessione. Prego riprovare tra poco.</h4> 
                        <%}
						else {
						%>
                    ${requestScope['wei']} eth</h3>
                        <%
						}
						%>



</body>
</html>
