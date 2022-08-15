package academy3.domain;

public class AcademyTeachers {
	private int teacher_id;
	private String teacher_name;
	private String teacher_phone;

	public AcademyTeachers(int teacher_id, String teacher_name, String teacher_phone) {
		super();
		this.teacher_id = teacher_id;
		this.teacher_name = teacher_name;
		this.teacher_phone = teacher_phone;
	}

	public int getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(int teacher_id) {
		this.teacher_id = teacher_id;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public String getTeacher_phone() {
		return teacher_phone;
	}

	public void setTeacher_phone(String teacher_phone) {
		this.teacher_phone = teacher_phone;
	}

	@Override
	public String toString() {
		return "AcademyTeachers [teacher_id=" + teacher_id + ", teacher_name=" + teacher_name + ", teacher_phone="
				+ teacher_phone + "]";
	}

}
