package model.bean;

public class PasswordReset {
	private int id_token;
	private String token;
	private int id_user;
	private String time_request;
	private boolean all_done;
	public int getId_token() {
		return id_token;
	}
	public void setId_token(int id_token) {
		this.id_token = id_token;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public String getTime_request() {
		return time_request;
	}
	public void setTime_request(String time_request) {
		this.time_request = time_request;
	}
	public boolean isAll_done() {
		return all_done;
	}
	public void setAll_done(boolean all_done) {
		this.all_done = all_done;
	}
	
	public PasswordReset() {
		super();
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public PasswordReset(int id_token, String token, int id_user, String time_request, boolean all_done) {
		super();
		this.id_token = id_token;
		this.token = token;
		this.id_user = id_user;
		this.time_request = time_request;
		this.all_done = all_done;
	}
	
	
	
}
