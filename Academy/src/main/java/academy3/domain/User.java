package academy3.domain;

public class User {

	private String email;
	private String password;

	public User() {

	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;

	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean authenticate() {
		if (email.equals("chirag@gmail.com") && password.equals("12341234")) {
			return true;
		} else {
			return false;
		}

	}

}