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
import academy3.domain.AcademyTeachers;

public class AcademyTeacherServlet extends HttpServlet {
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
		case "doUpdate":
			doUpdate(request, response);
			break;
		case "doDelete":
			doDel(request, response);
			break;
		}
	}

	/*
	 * delete Teacher
	 */
	private void doDel(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int rowDeleted;

		try {
			int teacher_id = Integer.parseInt(request.getParameter("teacher_id"));

			myStmt = myConn.createStatement();
			rowDeleted = myStmt.executeUpdate("delete from teacher where teacher_id=\"" + teacher_id + "\" ");

			if (rowDeleted > 0) {
				response.sendRedirect("web/success.jsp?n=Teacher%20Deleted%20from%20the%20database");
			}

		} catch (SQLException e) {
			response.sendRedirect("web/teacher/teacher_list.jsp?n=Something%20went%20wrong");
		} catch (NumberFormatException e) {
			response.sendRedirect("web/teacher/teacher_list.jsp?n=Teacher%20does%20not%20exists");

		}
	}

	/*
	 * update Teacher
	 */
	private void doUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int rowUpdated;
		try {
			int teacher_id = Integer.parseInt(request.getParameter("teacher_id"));
			String teacher_name = request.getParameter("teacher_name");
			String teacher_phone = request.getParameter("teacher_phone");
			if (teacher_name != null && teacher_phone != null) {
				try {
					myStmt = myConn.createStatement();
					rowUpdated = myStmt.executeUpdate("update teacher set teacher_name=\"" + teacher_name
							+ "\",teacher_phone=\"" + teacher_phone + "\" where teacher_id=" + teacher_id + "");

					if (rowUpdated > 0) {
						response.sendRedirect("web/success.jsp?n=Teacher%20Updated%20to%20the%20database");
					}

				} catch (SQLException e) {
					response.sendRedirect("web/teacher/teacher_update.jsp?n=Something%20went%20wrong");
				}
			}
		} catch (NumberFormatException e) {

		}
	}

	/*
	 * Writing teacher
	 */
	private void doWrite(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int rowAdded;

		String teacher_name = request.getParameter("teacher_name");
		String teacher_phone = request.getParameter("teacher_phone");
		if (teacher_name != "" && teacher_phone != null) {
			try {
				myStmt = myConn.createStatement();
				rowAdded = myStmt.executeUpdate("insert into teacher (teacher_name,teacher_phone) values (\""
						+ teacher_name + "\",\"" + teacher_phone + "\")");
				if (rowAdded > 0) {
					response.sendRedirect("web/success.jsp?n=Teacher%20Added%20to%20the%20database");
				}

			} catch (SQLException e) {
				response.sendRedirect("web/teacher/teacher_add.jsp?n=Something%20went%20wrong");
			}
		}
	}

	/*
	 * Reading teacher
	 */
	private void doRead(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<AcademyTeachers> read_teachers = new ArrayList<>();
		try {
			myStmt = myConn.createStatement();
			myRs = myStmt.executeQuery("select * from teacher");
			while (myRs.next()) {
				int tea_id = myRs.getInt(1);
				String tea_name = myRs.getString(2);
				String tea_phone = myRs.getString(3);
				read_teachers.add(new AcademyTeachers(tea_id, tea_name, tea_phone));
			}
			request.setAttribute("READ_TEACHER", read_teachers);
			RequestDispatcher rd = request.getRequestDispatcher("web/teacher/teacher_list.jsp");
			rd.include(request, response);
		} catch (SQLException e) {
			System.out.println("Something went wrong");
		}
	}

}
