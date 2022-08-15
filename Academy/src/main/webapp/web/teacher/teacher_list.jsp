<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Master List</title>
</head>
<style>
td, th {
	padding-left: 25px;
	padding-right: 25px;
	padding-top: 8px;
	padding-bottom: 8px;
	border: 1px solid black;
}

table {
	border: 1px solid black;
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
		<p>View Teachers in table form</p>
	</div>
	<div style="margin-left: 16px">
		<%
		if (request.getParameter("n") != null) {
			out.println("<h4 style=\"color:red\">" + request.getParameter("n") + "</h4>");
		}
		%>

		<a href="./web/teacher/teacher_add.jsp">Click here to add a new
			teacher</a> <br> <br>
		<table>
			<tr>
				<th>Id</th>
				<th>Teacher Name</th>
				<th>Teacher Phone</th>
				<th>update</th>
				<th>delete</th>
			</tr>
			<c:forEach var="teacher" items="${READ_TEACHER}">
				<tr>
					<td>${teacher.teacher_id}</td>
					<td>${teacher.teacher_name}</td>
					<td>${teacher.teacher_phone}</td>
					<td><a
						href="./web/teacher/teacher_update.jsp?teacher_id=${teacher.teacher_id}&&teacher_name=${teacher.teacher_name}&&teacher_phone=${teacher.teacher_phone}">Update</a></td>
					<td><a
						href="./AcademyTeacherServlet?action=doDelete&&teacher_id=${teacher.teacher_id}">Delete</a></td>


				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>