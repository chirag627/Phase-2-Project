package academy3.domain;

public class AcademySubjects {
	private int subject_id;
	private String subject_name;
	private String subject_code;
	private String subject_class;
	private String subject_teacher;

	public AcademySubjects(int subject_id, String subject_name, String subject_code, String subject_class,
			String subject_teacher) {
		super();
		this.subject_id = subject_id;
		this.subject_name = subject_name;
		this.subject_code = subject_code;
		this.subject_class = subject_class;
		this.subject_teacher = subject_teacher;
	}

	public AcademySubjects(int subject_id, String subject_name, String subject_code) {
		super();
		this.subject_id = subject_id;
		this.subject_name = subject_name;
		this.subject_code = subject_code;
	}

	public int getSubject_id() {
		return subject_id;
	}

	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}

	public String getSubject_name() {
		return subject_name;
	}

	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}

	public String getSubject_code() {
		return subject_code;
	}

	public void setSubject_code(String subject_code) {
		this.subject_code = subject_code;
	}

	public String getSubject_class() {
		return subject_class;
	}

	public void setSubject_class(String subject_class) {
		this.subject_class = subject_class;
	}

	public String getSubject_teacher() {
		return subject_teacher;
	}

	public void setSubject_teacher(String subject_teacher) {
		this.subject_teacher = subject_teacher;
	}

	@Override
	public String toString() {
		return "AcademySubjects [subject_id=" + subject_id + ", subject_name=" + subject_name + ", subject_code="
				+ subject_code + ", subject_class=" + subject_class + ", subject_teacher=" + subject_teacher + "]";
	}

}
