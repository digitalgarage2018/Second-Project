<%--
  Created by IntelliJ IDEA.
  User: maestro
  Date: 02/05/18
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Registrazione UniMarina</title>
</head>
<body>
<form action="/registerController" method="post">
    <p>Inserisci i dati per la registrazione</p>

    <p>Nome : <input type="text" name="name" required maxlength="32" pattern="[A-Za-z]*$"> </p>
    <p>Cognome : <input type="text" name="surname" required maxlength="32" pattern="[A-Za-z]*$"> </p>
    <p>Data di nascita : <input type="date" name="dateOfBirth" required > </p>
    <p>Email personale : <input type="email" name="personalEmail" required maxlength="128"> </p>
    <p>Password : <input type="password" name="password" required maxlength="8"> </p>
    <input type="submit" value="Registrati" />

</form>
<p> Se sei gi&agrave registrato <a href="index.jsp">effettua il login</a> </p>

</body>
</html></html>
