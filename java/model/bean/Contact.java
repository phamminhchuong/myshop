package model.bean;

public class Contact {
private int id_ct;
private String name;
private int phonect;
private String email;
private String tieude;
private String noidung;
private String ngaygui;
private boolean view;
public int getId_ct() {
	return id_ct;
}
public void setId_ct(int id_ct) {
	this.id_ct = id_ct;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getPhonect() {
	return phonect;
}
public void setPhonect(int phonect) {
	this.phonect = phonect;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getTieude() {
	return tieude;
}
public void setTieude(String tieude) {
	this.tieude = tieude;
}
public String getNoidung() {
	return noidung;
}
public void setNoidung(String noidung) {
	this.noidung = noidung;
}
public String getNgaygui() {
	return ngaygui;
}
public void setNgaygui(String ngaygui) {
	this.ngaygui = ngaygui;
}
public boolean isView() {
	return view;
}
public void setView(boolean view) {
	this.view = view;
}
public Contact(int id_ct, String name, int phonect, String email, String tieude, String noidung, String ngaygui,
		boolean view) {
	super();
	this.id_ct = id_ct;
	this.name = name;
	this.phonect = phonect;
	this.email = email;
	this.tieude = tieude;
	this.noidung = noidung;
	this.ngaygui = ngaygui;
	this.view = view;
}
public Contact() {
	super();
	// TODO Auto-generated constructor stub
}

}
