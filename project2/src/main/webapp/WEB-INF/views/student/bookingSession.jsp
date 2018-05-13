<%--
  Created by IntelliJ IDEA.
  User: maestro
  Date: 10/05/18
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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
<body>
<!-- Student name. -->
<p>${requestScope['user'].username}</p>
<!-- List of exams chose. -->
<table id="examTable" border="1">
    <tr>
        <th> Nome </th>
        <th> Crediti </th>
        <th> Data Inizio Appello </th>
        <th> Data Fine Appello </th>
    </tr>
</table>
</body>

<!--Global JavaScript -->
<script src="<c:url value='/resources/users/js/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/users/js/popper/popper.min.js'/>"></script>
<script src="<c:url value='/resources/users/js/bootstrap/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/users/js/wow/wow.min.js'/>"></script>
<script src="<c:url value='/resources/users/js/owl-carousel/owl.carousel.min.js'/>"></script>

<!-- Plugin JavaScript -->
<script src="<c:url value='/resources/users/js/jquery-easing/jquery.easing.min.js'/>"></script>
<script src="<c:url value='/resources/users/js/custom.js'/>"></script>

<script type="text/javascript">

    let table = document.getElementById( "examTable" );

    let jsonExams = '<%= request.getAttribute( "exams" ) %>';
    console.log( "JSON_EXAMS: " + jsonExams );
    let exams = JSON.parse( jsonExams );

    let index = 1;
    for (let exam of exams) {
        for (let session of exam['session_list']) {
            if (session['open'] === true) {

                let row = table.insertRow(index++);

                let nameRow = row.insertCell(0);
                let creditsRow = row.insertCell(1);
                let startRow = row.insertCell(2);
                let endRow = row.insertCell(3);
                let bookRow = row.insertCell(4);

                nameRow.innerHTML = exam['name'];
                creditsRow.innerHTML = exam['credits'];
                startRow.innerHTML = session['date_start'];
                endRow.innerHTML = session['date_end'];
                bookRow.innerHTML = "<center><br><button id='save_btn_" + index + "' class='btn btn-general btn-green'>Prenota Appello</button></center>"


                let index_btn = index;
                let save_btn1 = document.getElementById('save_btn_' + index);
                save_btn1.addEventListener("click", function () {
                    //let exam = examsList[index_btn - 1];

                    console.log("INDEX: " + index_btn);
                    console.log( "SESSION: " + session );

                    $.ajax({
                        url: "http://localhost:8080/insertBookedSession",
                        data: {
                            "id_session": session['id_session'],
                            "id_exam": exam["id_exam"]
                        },
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            // access response data
                            alert('Appello prenotato con successo !');
                        },
                        error: function (data, textStatus, jqXHR) {
                            console.log('Service call failed!');
                        }
                    });
                });
            }
        }
    }

</script>
</html>
