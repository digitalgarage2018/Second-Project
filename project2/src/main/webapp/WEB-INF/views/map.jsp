<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>WebImmobiliare</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="" />


<!-- css -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700"
	rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/bootstrap-responsive.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="css/jcarousel.css" rel="stylesheet" />
<link href="css/flexslider.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<link rel="stylesheet" href="css/bootstrap-slider.min.css"
	type="text/css" />
<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet" />
<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="ico/apple-touch-icon-144-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="ico/apple-touch-icon-114-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="ico/apple-touch-icon-72-precomposed.png" />
<link rel="apple-touch-icon-precomposed"
	href="ico/apple-touch-icon-57-precomposed.png" />
<link rel="shortcut icon" href="ico/favicon.png" />

<style>
#map {
	height: 550px;
	width: 550px;
	float: none;
}
</style>

<!-- =======================================================
    Theme Name: Flattern
    Theme URL: https://bootstrapmade.com/flattern-multipurpose-bootstrap-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>

<body>
	<div id="wrapper">
		<!-- toggle top area -->
		<div class="hidden-top">
			<div class="hidden-top-inner container">
				<div class="row">
					<div class="span12">
						<ul>
							<li><strong>We are available for any custom works
									this month</strong></li>
							<li>Main office: Milano, via Larga 20122</li>
							<li>Call us <i class="icon-phone"></i> (+39) 02 0000 - (+39)
								333 0000
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- end toggle top area -->
		<!-- start header -->
		<header>
			<div class="container">
				<!-- hidden top area toggle link -->
				<div id="header-hidden-link">
					<a href="#" class="toggle-link"
						title="Click me you'll get a surprise" data-target=".hidden-top"><i></i>Open</a>
				</div>
				<!-- end toggle link -->
				<div class="row nomargin">
					<div class="span12">
						<div class="headnav">
							<ul>
								<li><a href="logOutController"><i class="icon-user"></i> Log
										out</a></li>

							</ul>
						</div>

					</div>
				</div>
				<div class="row">
					<div class="span4">
						<div class="logo">
							<a href="/Project2/"><img src="img/logo.png" alt="" class="logo" /></a>
						</div>
					</div>
					<div class="span8">
						<div class="navbar navbar-static-top">
							<div class="navigation">
								<nav>
									<ul class="nav topnav">
										<li class="dropdown"><a>Profile <i
												class="icon-angle-down"></i></a>
											<ul class="dropdown-menu">
												<li><a href="resources/workInProgress.html">My Profile</a></li>
											</ul></li>
							</div>
						</div>
					</div>
				</div>
		</header>
		<!-- end header -->

		<section id="content">
			<div class="container">
				<div style="width: 100%;">
					<div style="float: left; width: 50%">

						<form id="search" action="houseSelectionController" method="get">
							<div class="form-group">
								<label id="city" for="city">Seleziona città di partenza:</label>
								<select name="city" style="width: 100%"><br>
									<option value="">Città</option>
									<option value="Roma">Roma</option>
									<option value="Milano">Milano</option>
								</select>
							</div>
							<div class="form-group">
								<small id="rangeHelp" class="form-text text-muted">Nel
									raggio di <span id="rangeOutput">${range}</span> Km.
								</small>
								<div>
									<input id="range" name="range" data-slider-id='range'
										type="text" data-slider-min="0" data-slider-max="20"
										data-slider-step="1" data-slider-value="${range}" />
								</div>
							</div>
							<div class="form-group">
								<label for="price">Prezzo:</label>
								<div>
									<b>€0</b> <input id="price" name="price" type="text"
										class="form-control" value="" data-slider-min="10000"
										data-slider-max="1000000" data-slider-step="1000"
										data-slider-value="[${minPrice},${maxPrice}]"/> <b>€1000000</b>
								</div>
							</div>
							<div class="form-group">
								<label for="area">Area:</label>
								<div>
									<b>0mq</b> <input id="area" name="area" type="text"
										class="form-control" value="" data-slider-min="20"
										data-slider-max="1000" data-slider-step="1"
										data-slider-value="[${minArea},${maxArea}]"/> <b> 1000mq</b>
								</div>
							</div>
							<div class="form-group">
								<select name="type" style="width: 100%">
									<option value="">Tipo</option>
									<option value="Bilocale" <c:if test = "${type=='Bilocale'}">selected</c:if>>Bilocale</option>
									<option value="Trilocale"<c:if test = "${type=='Trilocale'}">selected</c:if>>Trilocale</option>
									<option value="Quadrilocale"<c:if test = "${type=='Quadrilocale'}">selected</c:if>>Quadrilocale</option>
									<option value="Plurilocale"<c:if test = "${type=='Plurilocale'}">selected</c:if>>Plurilocale</option>
									<option value="Loft"<c:if test = "${type=='Loft'}">selected</c:if>>Loft</option>
								</select>
							</div>
							<div class="form-group">
								<select name="E_class" style="width: 100%"><br>
									<option value="">Classe Energetica</option>
									<option value="A"<c:if test = "${E_class=='A'}">selected</c:if>>A</option>
									<option value="B"<c:if test = "${E_class=='B'}">selected</c:if>>B</option>
									<option value="C"<c:if test = "${E_class=='C'}">selected</c:if>>C</option>
									<option value="D"<c:if test = "${E_class=='D'}">selected</c:if>>D</option>
									<option value="E"<c:if test = "${E_class=='E'}">selected</c:if>>E</option>
									<option value="F"<c:if test = "${E_class=='F'}">selected</c:if>>F</option>
									<option value="G"<c:if test = "${E_class=='G'}">selected</c:if>>G</option>
								</select>
							</div>
							<div class="form-group">
								<input type="submit" class="btn btn-block btn-primary"
									value="Search" style="width: 100%"/>
							</div>
							<input id="lat" type="hidden" name="latitude" value="${lat}" />
							<input id="lng" type="hidden" name="longitude" value="${lng}" />
						</form>

						<table class="table table-dark" style="width: 100%">
							<thead>
								<tr>
									<th scope="col">Nome</th>
									<th scope="col">Prezzo</th>
									<th scope="col">Area</th>
									<th scope="col">Classe</th>
									<th scope="col">Tipo</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${houses}" var="house">

									<tr>
										<td>${house.name}</td>
										<td>${house.price}</td>
										<td>${house.area}</td>
										<td>${house.e_class}</td>
										<td>${house.type}</td>
									</tr>

								</c:forEach>
							</tbody>
						</table>



					</div>
					<div style="float: right;">
						<div id="map"></div>

					</div>
				</div>

						<div style="display: none;" id="places">${requestScope['places']}</div>

				<!-- divider -->
				<div class="row">
					<div class="span12">
						<div class="solidline"></div>
					</div>
				</div>
				<!-- end divider -->


				<div id="sub-footer">
					<div class="container">
						<div class="row">
							<div class="span6">
								<div class="copyright">
									<p>
										<strong>WebImmobiliare.it</strong><br>
										<address>Milano, via Larga 20122</address>
									<br> <i class="icon-phone"></i> (+39) 02 0000 - (+39) 333
									0000 <br> <i class="icon-envelope-alt"></i>
									webimmobiliare@gmail.com
									</p>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<a href="#" class="scrollup"><i
				class="icon-chevron-up icon-square icon-32 active"></i></a>
			<!-- javascript
          ================================================== -->
			<!-- Placed at the end of the document so the pages load faster -->
			<script src="js/jquery.js"></script>
			<script src="js/jquery.easing.1.3.js"></script>
			<script src="js/bootstrap.js"></script>
			<script src="js/jcarousel/jquery.jcarousel.min.js"></script>
			<script src="js/jquery.fancybox.pack.js"></script>
			<script src="js/jquery.fancybox-media.js"></script>
			<script src="js/google-code-prettify/prettify.js"></script>
			<script src="js/portfolio/jquery.quicksand.js"></script>
			<script src="js/portfolio/setting.js"></script>
			<script src="js/jquery.flexslider.js"></script>
			<script src="js/jquery.nivo.slider.js"></script>
			<script src="js/modernizr.custom.js"></script>
			<script src="js/jquery.ba-cond.min.js"></script>
			<script src="js/jquery.slitslider.js"></script>
			<script src="js/animate.js"></script>

			<script src="js/bootstrap-slider.min.js"></script>

			<!-- Template Custom JavaScript File -->
			<script src="js/custom.js"></script>

			<script>

					
			
    function initMap() {
    	
    	var infoWindow = new google.maps.InfoWindow;
    	
    	
    	
        var map = new google.maps.Map(document.getElementById('map'), 
        		{
            		center: new google.maps.LatLng(${lat},${lng}),
            		//center: new google.maps.LatLng(45,-122),
            		zoom: 12
            	}
        );

        var mapCenter = new google.maps.Marker({
            map: map,
            position: new google.maps.LatLng(${lat},${lng}),
            icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png'
		});

        var circle = new google.maps.Circle({
            map: map,
            radius: ${range * 1000},    //need the value from filters - get method multiplied per 1000 (km)
            fillColor: '#d6d6d5',
            clickable: false
        });
        circle.bindTo('center', mapCenter, 'position');
        

        map.addListener('click', function(evt) {
          var lat = document.getElementById("lat");
          var lng = document.getElementById("lng");
          lat.value = evt.latLng.lat();
          lng.value = evt.latLng.lng();
          //var baseMarker = new google.maps.Marker({
      	//	position: new google.maps.LatLng(${lat},${lng}),
      	//	map: map
      	//  });
          document.getElementById("search").submit();
        });

        
        //filtered places:
        var filteredPlaces = JSON.parse(document.getElementById('places').innerHTML);

        console.log(filteredPlaces);
        //all places:
       <%--var list1 = '<%=json%>';--%>
       // var places = JSON.parse(list1);

	for (var i = 0; i < filteredPlaces.length; i++) {
		(function () {
			var id = filteredPlaces[i].id;
			var name = filteredPlaces[i].name;
			var address = filteredPlaces[i].address;
			var city = filteredPlaces[i].city;
			var type = filteredPlaces[i].type;
			var price = filteredPlaces[i].price;
			var area = filteredPlaces[i].area;
			var E_class = filteredPlaces[i].E_class;
			var lat = filteredPlaces[i].latitude;
			var lng = filteredPlaces[i].longitude;
			var point = new google.maps.LatLng(lat, lng);

			/*
			Gianmarco:

			laying out the pop up window with basic specs on map, for each building.
			The construction is pretty simple: append children as you would do in a
			xml document construction. You oughta append every graphical tag you want,
			in order to get a graphically satisfying result.
			*/


			var infowincontent = document.createElement('div');
			//link to image icon: 'http://delltelephone.com/wp-content/uploads/2017/03/House-Icon.png'
			var picture = document.createElement("img");
			picture.setAttribute('src', 'http://delltelephone.com/wp-content/uploads/2017/03/House-Icon.png');
			picture.setAttribute('alt', 'na');
			picture.setAttribute('height', '50px');
			picture.setAttribute('width', '50px');
			infowincontent.appendChild(picture);
			//title
			infowincontent.appendChild((document.createElement('br')));
			var strong = document.createElement('strong');
			strong.textContent = name;
			infowincontent.appendChild(strong);
			//address
			infowincontent.appendChild((document.createElement('br')));
			var text = document.createElement('text');
			text.textContent = address;
			infowincontent.appendChild(text);
			//city
			infowincontent.appendChild((document.createElement('br')));
			var text1 = document.createElement('text');
			text1.textContent = city;
			infowincontent.appendChild(text1);
			//type
			infowincontent.appendChild((document.createElement('br')));
			var text2 = document.createElement('text');
			text2.textContent = type;
			infowincontent.appendChild(text2);
			//price
			infowincontent.appendChild((document.createElement('br')));
			var text3 = document.createElement('text');
			text3.textContent = price + " €";
			infowincontent.appendChild(text3);
			//area
			infowincontent.appendChild((document.createElement('br')));
			var text4 = document.createElement('text');
			text4.textContent = area + " mq2";
			infowincontent.appendChild(text4);
			//energetic class
			infowincontent.appendChild((document.createElement('br')));
			var text5 = document.createElement('text');
			text5.textContent = "Classe energetica " + E_class;
			infowincontent.appendChild(text5);
			infowincontent.appendChild((document.createElement('br')));
			infowincontent.appendChild((document.createElement('br')));


			//Gianmarco: creating the hidden form to pass infos...
			var hiddenForm = document.createElement('form');
			hiddenForm.name='myForm';
			hiddenForm.method='GET';
			hiddenForm.action='specsController';
			infowincontent.appendChild(hiddenForm);

			var input1 = document.createElement('input');
			input1.type='HIDDEN';
			input1.name='name';
			input1.value=name;
			hiddenForm.appendChild(input1);

			var input2 = document.createElement('input');
			input2.type='HIDDEN';
			input2.name='address';
			input2.value=address;
			hiddenForm.appendChild(input2);

			var input3 = document.createElement('input');
			input3.type='HIDDEN';
			input3.name='city';
			input3.value=city;
			hiddenForm.appendChild(input3);

			var input4 = document.createElement('input');
			input4.type='HIDDEN';
			input4.name='type';
			input4.value=type;
			hiddenForm.appendChild(input4);

			var input5 = document.createElement('input');
			input5.type='HIDDEN';
			input5.name='price';
			input5.value=price;
			hiddenForm.appendChild(input5);

			var input6 = document.createElement('input');
			input6.type='HIDDEN';
			input6.name='area';
			input6.value=area;
			hiddenForm.appendChild(input6);

			var input7 = document.createElement('input');
			input7.type='HIDDEN';
			input7.name='eclass';
			input7.value=E_class;
			hiddenForm.appendChild(input7);

			//var button = document.createElement('button');
			//button.type='submit';

			//button.onclick = function() {
			//    hiddenForm.submit();
			//};
			//hiddenForm.appendChild(button);

			//var text6 = document.createElement('strong');
			var text6 = document.createElement('a');
			//text6.href=//"house_template.jsp?housename=" + name + "&houseaddress=" + address + "&housecity=" + city +
			//		"&housetype=" + type + "&houseprice=" + price + "&housearea=" + area + "&houseclass=" + E_class;
			//			"";
			text6.textContent = "Request an Appointment";
			hiddenForm.appendChild(text6);
			text6.onclick = function() {
				hiddenForm.submit();
			}
			//you can even customize an icon -- I'm staying with the standard here...


			var marker = new google.maps.Marker({
				map: map,
				position: point
				//later I shall add a custom label, maybe iterate over an array just to number each occurrence
			});

			/* var myOptions = {
			content: infowincontent,
			disableAutoPan: false,
			maxWidth: 0,
			pixelOffset: new google.maps.Size(-140, 0),
			zIndex: null,
			boxStyle: {
			background: "url('tipbox.gif') no-repeat",
			opacity: 0.75,
			width: "280px"
			},
			closeBoxMargin: "10px 2px 2px 2px",
			closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif",
			infoBoxClearance: new google.maps.Size(1, 1),
			isHidden: false,
			pane: "floatPane",
			enableEventPropagation: false
			};*/

			//var ib = new InfoBox(myOptions);


			

			marker.addListener('click', function () {
				//show info here
				infoWindow.setContent(infowincontent);
				infoWindow.open(map, marker);
				//ib.open(theMap, marker);
			});

			}())
		}
	}

    /*
    Gianmarco: implement the downloadURL function -- signature: standard, from googlemapsAPI
     */
 /*   function downloadUrl(url, callback) {
        var request = window.ActiveXObject ?
            new ActiveXObject('Microsoft.XMLHTTP') :
            new XMLHttpRequest;

        request.onreadystatechange = function() {
            if (request.readyState == 4) {      //don't know what that 4 means...
                request.onreadystatechange = doNothing;
                callback(request, request.status);
            }
        };

        request.open('GET', url, true);
        request.send(null);
    } */

    function doNothing() {}



</script>
										<script async defer
											src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAeZarnT-wYAMc6IZpwls-P6Cf90H_SVRk&callback=initMap">
</script>
			<script>
        $("#range").slider({});
        
        $("#range").on("slide", function(slideEvt) {
        	$("#rangeOutput").text(slideEvt.value);
        });
        
        $("#price").slider({});	
        
        $("#area").slider({});
    </script>

									</body>
</html>

<!-- <div style="display: none;" id="places">${requestScope['places']}</div> -->

