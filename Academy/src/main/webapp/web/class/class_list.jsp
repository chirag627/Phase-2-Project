<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Classes Master List</title>
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
		<a>Learner's Academy</a> <a
			href="./AcademyStudentServlet?action=doRead">Student</a> <a
			href="./AcademyClassServlet?action=doRead">Class</a> <a
			href="./AcademyTeacherServlet?action=doRead">Teacher</a> <a
			href="./AcademySubjectServlet?action=doRead">Subjects</a> <a
			href="./web/class_details.jsp">View Class Reports</a>
	</div>
	<div style="padding-left: 16px">
		<h2>Classes Section</h2>
		<p>View Classes in table form</p>
	</div>
	<div style="margin-left: 16px">
		<%
		if (request.getParameter("n") != null) {
			out.println("<h4 style=\"color:red\">" + request.getParameter("n") + "</h4>");
		}
		%>

		<a href="./web/class/class_add.jsp">Click here to add a new class</a>
		<br> <br>
		<table>
			<tr>
				<th>Id</th>
				<th>Class Name</th>
				<th>update</th>
				<th>delete</th>
			</tr>
			<c:forEach var="cclass" items="${READ_CLASS}">
				<tr>
					<td>${cclass.class_id}</td>
					<td>${cclass.class_name}</td>

					<td><a
						href="./web/class/class_update.jsp?class_id=${cclass.class_id}&&class_name=${cclass.class_name}">Update</a></td>
					<td><a
						href="./AcademyClassServlet?action=doDelete&&class_id=${cclass.class_id}">Delete</a></td>

				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>