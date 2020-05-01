package model.bean;

public class Users {
	private int id_user;
	private String name;
	private String username;
	private String password;
	private int phone;
	private String email;
	private boolean gioitinh;
	private String ngaysinh;
	private int roles_id;
	private boolean enable;
	private String nameImage;
	private String id_google;
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isGioitinh() {
		return gioitinh;
	}
	public void setGioitinh(boolean gioitinh) {
		this.gioitinh = gioitinh;
	}
	public String getNgaysinh() {
		return ngaysinh;
	}
	public void setNgaysinh(String ngaysinh) {
		this.ngaysinh = ngaysinh;
	}
	public int getRoles_id() {
		return roles_id;
	}
	public void setRoles_id(int roles_id) {
		this.roles_id = roles_id;
	}
	public boolean isEnable() {
		return enable;
	}
	public void setEnable(boolean enable) {
		this.enable = enable;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getNameImage() {
		return nameImage;
	}
	public void setNameImage(String nameImage) {
		this.nameImage = nameImage;
	}
	public Users(int id_user, String name, String username, String password, int phone, String email, boolean gioitinh,
			String ngaysinh, int roles_id, boolean enable, String nameImage) {
		super();
		this.id_user = id_user;
		this.name = name;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.gioitinh = gioitinh;
		this.ngaysinh = ngaysinh;
		this.roles_id = roles_id;
		this.enable = enable;
		this.nameImage = nameImage;
	}
	public String getId_google() {
		return id_google;
	}
	public void setId_google(String id_google) {
		this.id_google = id_google;
	}
	public Users(int id_user, String name, String username, String password, int phone, String email, boolean gioitinh,
			String ngaysinh, int roles_id, boolean enable, String nameImage, String id_google) {
		super();
		this.id_user = id_user;
		this.name = name;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.gioitinh = gioitinh;
		this.ngaysinh = ngaysinh;
		this.roles_id = roles_id;
		this.enable = enable;
		this.nameImage = nameImage;
		this.id_google = id_google;
	}
	
	
}
