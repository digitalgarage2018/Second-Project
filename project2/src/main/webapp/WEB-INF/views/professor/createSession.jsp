<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
	<form action="uploadControllerSession" method="post">
		<p>Inserisci i dati per la registrazione</p>

		<p>
			Da : <input type="date" name="begindate" required>
		</p>
		<p>
			A : <input type="date" name="finaldate" required>
		</p>
		<p>
			Esame : 
			<select id="examChosen" name="exams" required>
			
			</select>
		<input type="submit" value="Crea Appello" />

	</form>
	
	<script> 
			//qui con la session di spring possiamo avere l'intero array degli esami del prof in questione, ciclando
			//su essi e considerando l'identificativo come value e il nome stampato nel menu a tendina
			//	prelevo i dati da server
			let jsonExam = '<%=request.getAttribute("exam")%>';
			console.log(jsonExam);
			let exams = JSON.parse( jsonExam );
			
			let examChosen = document.getElementById("examChosen");
			for(var ex of exams) {
				  examChosen.innerHTML += "<option value='"+ex["id_exam"]+"'>"+ex["name"]+"</option>";//parametri da modificare
			}
			</script>

</body>
</html>