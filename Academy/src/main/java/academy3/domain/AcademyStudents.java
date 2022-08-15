package academy3.domain;

public class AcademyStudents {

	private int student_id;
	private String student_name;
	private String student_phone;
private String student_class;
	public AcademyStudents(int student_id, String student_name, String student_phone, String student_class) {
		super();
		this.student_id = student_id;
		this.student_name = student_name;
		this.student_phone = student_phone;
		this.student_class=student_class;
	}

	public int getStudent_id() {
		return student_id;
	}

	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}

	public String getStudent_class() {
		return student_class;
	}

	public void setStudent_class(String student_class) {
		this.student_class = student_class;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getStudent_phone() {
		return student_phone;
	}

	public void setStudent_phone(String student_phone) {
		this.student_phone = student_phone;
	}

	@Override
	public String toString() {
		return "AcademyStudents [student_id=" + student_id + ", student_name=" + student_name + ", student_phone="
				+ student_phone + "]";
	}

}
