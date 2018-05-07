<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${requestScope['nameE']}-Upload Material</title>
<script type='text/javascript'>
	var counterSlide = 1;
	var counterVideo = 1;
	var limitSlide = 1;
	var limitVideo = 1;
	function addInput(divNameS) {

		if (counterSlide == limitSlide) {

			alert("You have reached the limit of adding " + counterSlide + " inputs");

		}

		else {

			var newdiv = document.createElement('p');
			newdiv.style.float="left";
			//newdiv.style.width="50%";
			newdiv.innerHTML = "Slide " + (counterSlide + 1)
					+ "<input type='text' name='nomeSlide'><input type='file' name='myInputsS'>";

			document.getElementById(divNameS).appendChild(newdiv);

			counterSlide++;

		}

	}


	function addInput1(divNameV) {

		if (counterVideo == limitVideo) {

			alert("You have reached the limit of adding " + counterVideo + " inputs");

		}

		else {

			var newdiv = document.createElement('p');
			newdiv.style.float="right";
			//newdiv.style.width="50%";
			newdiv.innerHTML = "Video " + (counterVideo + 1)
					+ " <input type='text' name='nomeVideo'><input type='file' name='myInputsV'>";

			document.getElementById(divNameV).appendChild(newdiv);

			counterVideo++;

		}

	}
</script>
</head>

<body>
	<h1>${requestScope['nameE']}</h1>
	<script language="Javascript" type="text/javascript"></script>

	

		<form action="/insertMaterialController" method="POST">

<div id="dynamicInput" style="float: left; width: 50%;">
			<p name='p'>Dispense</p>
			<p>Nome:<input type='text' name='nomeSlide' id='nomeSlide' required></p>
			<p>File:<input type="file" name="myInputsS" id="myInputsS" accept="application/pdf" required></p>
	</div>
<div id="dynamicInput" style="float: left; width: 50%;">
			<p name='p'>Video</p>
			<p>Nome:<input type='text' name='nomeVideo' id='nomeVideo' required></p>
			<p>Link:<input type="text" name="myInputsV" required> </p>
			</div>	
			<div style="float:right">
			<!--  <p><input type="button" value="Carica altra slide" onClick="addInput('dynamicInput');"></p>-->
			<!-- <p><input type="button" value="Carica altro video" onClick="addInput1('dynamicInput');"></p>-->
			<p><button type="submit" id="uploadButton">Upload All</button></p>
			
 			</div>	
 		
		</form>
	


	

</body>
</html>