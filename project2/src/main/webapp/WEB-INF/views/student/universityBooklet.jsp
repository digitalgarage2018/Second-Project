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
        <th>Name</th>
        <th>Credits</th>
        <th>Mark</th>
    </tr>
</table>

<!-- JavaScript will fill this with the achieved credits. -->
<p id="credits"/>
<!-- JavaScript will fill this with the average mark. -->
<p id="averageMark"/>
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
    // Get the table to be filled.
    let table = document.getElementById( "examTable" );

    let jsonExams = '<%= request.getAttribute( "exams" ) %>';
    console.log( "JSON_EXAMS: " + jsonExams );
    let exams = JSON.parse( jsonExams );
    let totalCredits = 0.0;
    let totalMarks   = 0.0;
    let index = 1;
    for (let i in exams) {
        exam = exams[i];
        let row  = table.insertRow( index++ );
        let nameRow      = row.insertCell( 0 );
        let creditsRow   = row.insertCell( 1 );
        let markRow      = row.insertCell( 2 );

        let credits = exam['credits'];
        let mark    = exam['mark'];

        nameRow.innerHTML      = exam['name'];
        creditsRow.innerHTML   = credits;
        if (mark > 0) {
            markRow.innerHTML  = mark;
            totalCredits += credits;
            totalMarks   += mark * credits;
        }
    }
	
    let avgMark = 0;
    if (totalCredits > 0) {
        avgMark = Math.trunc( ((totalMarks / totalCredits) / 30.0) * 110.0 );
    }
    document.getElementById( "averageMark" ).innerHTML = "Average Mark: " + avgMark + "/110";
    document.getElementById( "credits" ).innerHTML = "Credits: " +totalCredits + "/60";
</script>
</html>
