package academy3;

import java.io.IOException;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import academy3.domain.AcademyClasses;
import academy3.domain.AcademyStudents;

public class AcademyStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "Academy")
	private DataSource datasource;

	Connection myConn = null;
	Statement myStmt = null;
	ResultSet myRs = null;

	public void init() throws ServletException {
		try {
			myConn = datasource.getConnection();
		} catch (SQLException e) {
			System.out.println("Cannot connect to the database");
		}

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		switch (action) {
		case "doRead":
			doRead(request, response);
			break;

		case "doWrite":
			doWrite(request, response);
			break;

		case "doDelete":
			doDel(request, response);
			break;
		case "doLoadAdd":
			doLoadAdd(request, response);
		}

	}

	/*
	 * delete Student
	 */
	private void doDel(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int rowDeleted;

		try {
			int student_id = Integer.parseInt(request.getParameter("student_id"));

			myStmt = myConn.createStatement();
			rowDeleted = myStmt.executeUpdate("delete from student where student_id=\"" + student_id + "\" ");

			if (rowDeleted > 0) {
				response.sendRedirect("web/success.jsp?n=Student%20Deleted%20from%20the%20database");
			}

		} catch (SQLException e) {
			response.sendRedirect("web/student/student_list.jsp?n=Something%20went%20wrong");
		} catch (NumberFormatException e) {
			response.sendRedirect("web/student/student_list.jsp?n=Student%20does%20not%20exists");

		}
	}

	/*
	 * Load class
	 */

	private void doLoadAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<AcademyClasses> read_class = new ArrayList<>();
		try {
			myStmt = myConn.createStatement();
			myRs = myStmt.executeQuery("select * from class");
			while (myRs.next()) {
				int class_id = myRs.getInt(1);
				String class_name = myRs.getString(2);


				read_class.add(new AcademyClasses(class_id, class_name));
			}
			request.setAttribute("READ_CLASS", read_class);
			RequestDispatcher rd = request.getRequestDispatcher("web/student/student_add.jsp");
			rd.include(request, response);
		} catch (SQLException e) {
			System.out.println("Something went wrong");
		}
	}

	private void doWrite(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int rowAdded;

		String student_name = request.getParameter("student_name");
		String student_phone = request.getParameter("student_phone");
		String student_class = request.getParameter("student_class");
		if (student_name != "" && student_phone != null && student_class != null) {
			try {
				myStmt = myConn.createStatement();
				rowAdded = myStmt
						.executeUpdate("insert into student (student_name,student_phone,student_class) values (\""
								+ student_name + "\",\"" + student_phone + "\",\"" + student_class + "\")");
				if (rowAdded > 0) {
					response.sendRedirect("web/success.jsp?n=Student%20Added%20to%20the%20database");
				}

			} catch (SQLException e) {
				response.sendRedirect("web/student/student_add.jsp?n=Something%20went%20wrong");
			}
		}
	}

	/*
	 * Reading student
	 */
	private void doRead(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<AcademyStudents> read_students = new ArrayList<>();
		try {
			myStmt = myConn.createStatement();
			myRs = myStmt.executeQuery("select * from student");
			while (myRs.next()) {
				int stu_id = myRs.getInt(1);
				String stu_name = myRs.getString(2);
				String stu_phone = myRs.getString(3);
				String stu_class = myRs.getString(4);

				read_students.add(new AcademyStudents(stu_id, stu_name, stu_phone, stu_class));
			}
			request.setAttribute("READ_STUDENT", read_students);
			RequestDispatcher rd = request.getRequestDispatcher("web/student/student_list.jsp");
			rd.include(request, response);
		} catch (SQLException e) {
			System.out.println("Something went wrong");
		}
	}

}
