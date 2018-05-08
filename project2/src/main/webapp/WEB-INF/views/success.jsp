<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
		<title>Registrazione avvenuta con successo</title>
	</head>
	<body>

		Welcome ${requestScope['user'].istitutional_email}.
		<br>
		${requestScope['user'].name}
		<br>
		${requestScope['user'].surname}
		<br>
		${requestScope['user'].password}

		Benvenuto : <b>${requestScope['user'].surname} ${requestScope['user'].name} </b>
		<br>
		Le credenziali per l'accesso alla piattaforma sono le seguenti:
		<br>
		<ul>
			<li>Email Istituzionale: ${requestScope['user'].istitutional_email}</li>
			<li>Matricola: ${requestScope['user'].id_user}</li>
		</ul>
		<br>
		<p> <a href="index.jsp">Effettua il Login</a> </p>


	</body>
</html>
