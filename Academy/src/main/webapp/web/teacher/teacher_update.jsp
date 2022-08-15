<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update teacher Details</title>
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

	<div style="padding-left: 16px">
		<h2>Teachers Section</h2>
		<p>Update teacher details in the database</p>
	</div>

	<div style="padding-left: 16px">
		<%
		if (request.getParameter("n") != null) {
			out.println("<h4 style=\"color:red\">" + request.getParameter("n") + "</h4>");
		}
		%>
		<form action="../../AcademyTeacherServlet?action=doUpdate"
			method="get">
			<input type="hidden" name="action" value="doUpdate"> <input
				type="hidden" name="teacher_id"
				value=<%out.print(request.getParameter("teacher_id"));%>>
				

			<table>
				<tr>
					<th>Teacher name</th>
					<th><input type="text" required name="teacher_name"
						value=<%out.print(request.getParameter("teacher_name"));%>></th>
				</tr>

				<tr>
					<th>Teacher Phone</th>
					<th><input type="text" required name="teacher_phone"
						value=<%out.print(request.getParameter("teacher_phone"));%>></th>
				</tr>

				<tr>
					<td><input type="submit" name="submit" value="submit"></td>
				</tr>
			</table>
		</form>

	</div>
</body>
</html>