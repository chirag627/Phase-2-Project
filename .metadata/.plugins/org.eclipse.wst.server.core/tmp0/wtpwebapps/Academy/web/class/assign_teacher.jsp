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
		<a>Learner's Academy</a> <a
			href="./AcademyStudentServlet?action=doRead">Student</a> <a
			href="./AcademyClassServlet?action=doRead">Class</a> <a
			href="./AcademyTeacherServlet?action=doRead">Teacher</a> <a
			href="./AcademySubjectServlet?action=doRead">Subjects</a> <a
			href="./web/class_details.jsp">View Class Reports</a>
	</div>
	<div style="padding-left: 16px">
		<h2>Assign Teacher to a class</h2>
		<p></p>
	</div>
	<div style="margin-left: 16px">
		<%
		if (request.getParameter("n") != null) {
			out.println("<h4 style=\"color:red\">" + request.getParameter("n") + "</h4>");
		}
		%>

		<form action="./AcademyAssignTeacher" method="get">
			<table>
				<input type="hidden" name="action" value="tcAssign">

				<tr>
					<th>Subject Name</th>
					<th><select name="subject_name" required>
							<option>Choose a subject</option>
							<c:forEach var="subject" items="${READ_SUBJECT}">
								<option value=${subject.subject_id}>${subject.subject_name}</option>
							</c:forEach>
					</select></th>
				</tr>
				<tr>
					<th>Teacher name</th>
					<th><select name="teacher_name" required>
							<option>Choose a Teacher</option>
							<c:forEach var="teacher" items="${READ_TEACHER}">
								<option value=${teacher.teacher_id}>${teacher.teacher_name}</option>
							</c:forEach>
					</select></th>
				</tr>
				<tr>
					<th><input type="submit" name="submit" value="submit">

					</th>
				</tr>

			</table>
		</form>
	</div>
</body>
</html>
