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
		<a>Learner's Academy</a> <a href="../AcademyStudentServlet?action=doRead">Student</a>
		<a href="../AcademyClassServlet?action=doRead">Class</a> <a href="../AcademyTeacherServlet?action=doRead">Teacher</a>
		<a href="../AcademySubjectServlet?action=doRead">Subjects</a> <a href="class_details.jsp">View
			Class Reports</a>
	</div>

	<div style="padding-left: 16px">
		<h2>View Class Report</h2>
		<p>View Classes in table form</p>
	</div>
	<div style="margin-left: 16px">
		<%
		if (request.getParameter("n") != null) {
			out.println("<h4 style=\"color:red\">" + request.getParameter("n") + "</h4>");
		}
		%>

		<br> <br>
		<h3>Subject Details</h3>
		<table>
			<tr>
				<th>Id</th>
				<th>Subject Name</th>
				<th>Subject Code</th>
				
			</tr>
			<c:forEach var="subject" items="${READ_SUBJECT}">
				<tr>
					<td>${subject.subject_id}</td>
					<td>${subject.subject_name}</td>
					<td>${subject.subject_code}</td>

				</tr>
			</c:forEach>
		</table>
				<br> <br>
		<h3>Student Details</h3>
		<table>
			<tr>
				<th>Id</th>
				<th>Student Name</th>
				<th>Student Phone</th>
				
			</tr>
			<c:forEach var="student" items="${READ_STUDENT}">
				<tr>
					<td>${student.student_id}</td>
					<td>${student.student_name}</td>
					<td>${student.student_phone}</td>

				</tr>
			</c:forEach>
		</table>
		
						<br> <br>
		<h3>Teacher Details</h3>
		<table>
			<tr>
				<th>Id</th>
				<th>Teacher Name</th>
				<th>Teacher Phone</th>
				
			</tr>
			<c:forEach var="teacher" items="${READ_TEACHER}">
				<tr>
					<td>${teacher.teacher_id}</td>
					<td>${teacher.teacher_name}</td>
					<td>${teacher.teacher_phone}</td>

				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>