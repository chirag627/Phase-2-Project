<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Subjects Master List</title>
</head>
<style>
td, th {
	padding-left: 25px;
	padding-right: 25px;
	padding-top: 8px;
	padding-bottom: 8px;
}

body {
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
}

.topnav {
	overflow: hidden;
	background-color: #333;
}

.topnav a {
	float: left;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

ul li a {
	color: black;
}
</style>
<body>
	<div class="topnav">
		<a>Learner's Academy</a> <a href="./AcademyStudentServlet">Student</a>
		<a href="classAction.html">Class</a> <a href="teaAction.html">Teacher</a>
		<a href="subAction.html">Subjects</a> <a href="viewClassReports.html">View
			Class Reports</a>
	</div>



	<% if(request.getParameter("n")!=null){
	out.print("<h2 style=\"text-align:center\">"+request.getParameter("n")+"</h2>");
	}
	%>
	
	<p style="text-align:center"><a href="./home.jsp">Back</a></p>
	

</body>
</html>