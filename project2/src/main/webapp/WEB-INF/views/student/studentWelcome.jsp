<%--
  Created by IntelliJ IDEA.
  User: maestro
  Date: 26/04/18
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>HOME PAGE - Studente</title>
</head>
<body>
    <h1 style="color: SlateBlue; text-align: center; font-size:300%"> UniMarina </h1>
    <ul style="position: absolute;top: 100px; right: 100px;">
        <li>Matricola: ${requestScope['user'].id_user}</li>
        <li>Nome: ${requestScope['user'].name}</li>
        <li>Cognome: ${requestScope['user'].surname}</li>
        <li>Email Istituzionale: ${requestScope['user'].istitutional_email}</li>
        <li>Email Personale: ${requestScope['user'].personal_email}</li>
        <li>Data di Nascita: ${requestScope['user'].date_of_birth}</li>
    </ul>
    <table style="position: absolute;top: 100px; left: 20px;">
        <tr><td>Menu</td></tr>
        <tr><td><button>Modifica Piano di Studi</button></td></tr>
        <tr><td><form action="viewBooklet" method="get">
            <input type="submit" value="Visualizza Libretto" />
        </form></td></tr>
        <tr><td><button>Segui Lezione Online</button></td></tr>
        <tr><td><button>Logout</button></td></tr>
    </table>
    <p style="color: SlateBlue;position: absolute; bottom:100px; right: 50px; font-size:260%"> Benvenuto ${requestScope['student'].name}. </p>
</body>
</html>
