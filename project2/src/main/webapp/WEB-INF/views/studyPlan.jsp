<%--
  Created by IntelliJ IDEA.
  User: maestro
  Date: 28/04/18
  Time: 00:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="librettoStyle.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>${requestScope['user'].surname} Piano Di Studi</title>
</head>
<body>
<!-- Student name. -->
<p>${requestScope['user'].name}</p>
<!-- List of exams to chose. -->
<form name="input" action="StudyPlanController" method="post">

<table id="examTable", border="1">
    <tr>
        <th>Name</th>
        <th>Professor</th>
        <th>Credits</th>
        <th>Mark</th>
    </tr>
    <input type="checkbox" name="vehicle" value="Bike"><br>

</table>
</form>


</body>
<script>
    let table = document.getElementById( "examTable" );
    var exams = "{[{name:'cdod',credits:0,professor:'asdsad',description:'asfsafafaa'}]}";
    let JSONstringfy
    let totalCredits = 0.0;
    let index = 1;

    for (let i in exams) {
        exam = exams[i];
        let row  = table.insertRow( index++ );
        let nameRow      = row.insertCell( 0 );
        let codeRow      = row.insertCell( 1 );
        let professorRow = row.insertCell( 2 );
        let creditsRow   = row.insertCell( 3 );
        let descriptionRow   = row.insertCell( 4 );
        let checkboxRow   = row.insertCell( 5 );


        let credits = exam['credits'];

        nameRow.innerHTML      = exam['name'];
        professorRow.innerHTML = exam['professor'];
        creditsRow.innerHTML   = credits;
        descriptionRow.innerHTML         = exam['description'];

        var checkbox = document.createElement('input');
        checkbox.type = "checkbox";
        checkbox.name = "lol";
        checkbox.id = "pro";
        checkbox.value = "asd";
        checkboxRow.appendChild( checkbox );

    }
</script>
</html>
