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
		<h2>Subjects Section</h2>
		<p>View Subjects in table form</p>
	</div>
	<div style="margin-left: 16px">
		<%
		if (request.getParameter("n") != null) {
			out.println("<h4 style=\"color:red\">" + request.getParameter("n") + "</h4>");
		}
		%>

		<a href="./web/subject/subject_add.jsp">Click here to add a new
			Subject</a> <br> <br>
		<table>
			<tr>
				<th>Id</th>
				<th>Subject Name</th>
				<th>Subject Code</th>
				<th>update</th>
				<th>delete</th>

			</tr>
			<c:forEach var="subject" items="${READ_SUBJECTS}">
				<tr>
					<td>${subject.subject_id}</td>
					<td>${subject.subject_name}</td>
					<td>${subject.subject_code}</td>
					

					<td><a
						href="./web/subject/subject_update.jsp?subject_id=${subject.subject_id}&&subject_name=${subject.subject_name}&&subject_code=${subject.subject_code}">Update</a></td>
					<td><a
						href="./AcademySubjectServlet?action=doDelete&&subject_id=${subject.subject_id}">Delete</a></td>

				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>