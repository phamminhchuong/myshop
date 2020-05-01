package model.bean;

public class Cat {
private int id_cat;
private String namec;
private int id_parent;
public int getId_cat() {
	return id_cat;
}
public void setId_cat(int id_cat) {
	this.id_cat = id_cat;
}
public String getNamec() {
	return namec;
}
public void setNamec(String namec) {
	this.namec = namec;
}
public int getId_parent() {
	return id_parent;
}
public void setId_parent(int id_parent) {
	this.id_parent = id_parent;
}
public Cat(int id_cat, String namec, int id_parent) {
	super();
	this.id_cat = id_cat;
	this.namec = namec;
	this.id_parent = id_parent;
}
public Cat() {
	super();
}


}
