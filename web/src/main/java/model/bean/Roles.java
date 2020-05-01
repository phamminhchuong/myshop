package model.bean;

public class Roles {
private int roles_id;
private String nameR;
public int getRoles_id() {
	return roles_id;
}
public void setRoles_id(int roles_id) {
	this.roles_id = roles_id;
}

public String getNameR() {
	return nameR;
}
public void setNameR(String nameR) {
	this.nameR = nameR;
}

public Roles(int roles_id, String nameR) {
	super();
	this.roles_id = roles_id;
	this.nameR = nameR;
}
public Roles() {
	super();
	// TODO Auto-generated constructor stub
}


}
