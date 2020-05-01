package model.bean;

public class Color {
private int id_color;
private String namecolor;
public int getId_color() {
	return id_color;
}
public void setId_color(int id_color) {
	this.id_color = id_color;
}
public String getNamecolor() {
	return namecolor;
}
public void setNamecolor(String namecolor) {
	this.namecolor = namecolor;
}
public Color(int id_color, String namecolor) {
	super();
	this.id_color = id_color;
	this.namecolor = namecolor;
}
public Color() {
	super();
	// TODO Auto-generated constructor stub
}


}
