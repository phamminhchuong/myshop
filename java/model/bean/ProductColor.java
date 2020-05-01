package model.bean;

public class ProductColor {
private int id_product;
private int id_color;
public int getId_product() {
	return id_product;
}
public void setId_product(int id_product) {
	this.id_product = id_product;
}
public int getId_color() {
	return id_color;
}
public void setId_color(int id_color) {
	this.id_color = id_color;
}
public ProductColor(int id_product, int id_color) {
	super();
	this.id_product = id_product;
	this.id_color = id_color;
}
public ProductColor() {
	super();
	// TODO Auto-generated constructor stub
}


}
