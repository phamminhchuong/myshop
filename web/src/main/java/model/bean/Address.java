package model.bean;

public class Address {
private int id_address;
private int id_user;
private int id_province;
private int id_district;
private int id_ward;
private String namestreet;
private boolean defaul;
public int getId_address() {
	return id_address;
}
public void setId_address(int id_address) {
	this.id_address = id_address;
}
public int getId_user() {
	return id_user;
}
public void setId_user(int id_user) {
	this.id_user = id_user;
}
public int getId_province() {
	return id_province;
}
public void setId_province(int id_province) {
	this.id_province = id_province;
}
public int getId_district() {
	return id_district;
}
public void setId_district(int id_district) {
	this.id_district = id_district;
}
public int getId_ward() {
	return id_ward;
}
public void setId_ward(int id_ward) {
	this.id_ward = id_ward;
}
public String getNamestreet() {
	return namestreet;
}
public void setNamestreet(String namestreet) {
	this.namestreet = namestreet;
}
public boolean isDefaul() {
	return defaul;
}
public void setDefaul(boolean defaul) {
	this.defaul = defaul;
}
public Address(int id_address, int id_user, int id_province, int id_district, int id_ward, String namestreet,
		boolean defaul) {
	super();
	this.id_address = id_address;
	this.id_user = id_user;
	this.id_province = id_province;
	this.id_district = id_district;
	this.id_ward = id_ward;
	this.namestreet = namestreet;
	this.defaul = defaul;
}
public Address() {
	super();
	// TODO Auto-generated constructor stub
}


}
