package model.bean;

public class OrderDetail {
private int id_orderdetail;
private int id_product;
private int id_ordercat;
private int id_color;
private int id_salecode;
private String size;
private int amount;
public int getId_orderdetail() {
	return id_orderdetail;
}
public void setId_orderdetail(int id_orderdetail) {
	this.id_orderdetail = id_orderdetail;
}
public int getId_product() {
	return id_product;
}
public void setId_product(int id_product) {
	this.id_product = id_product;
}
public int getId_ordercat() {
	return id_ordercat;
}
public void setId_ordercat(int id_ordercat) {
	this.id_ordercat = id_ordercat;
}
public int getId_color() {
	return id_color;
}
public void setId_color(int id_color) {
	this.id_color = id_color;
}
public String getSize() {
	return size;
}
public void setSize(String size) {
	this.size = size;
}
public int getAmount() {
	return amount;
}
public void setAmount(int amount) {
	this.amount = amount;
}

public OrderDetail() {
	super();
	// TODO Auto-generated constructor stub
}
public int getId_salecode() {
	return id_salecode;
}
public void setId_salecode(int id_salecode) {
	this.id_salecode = id_salecode;
}
public OrderDetail(int id_orderdetail, int id_product, int id_ordercat, int id_color, int id_salecode, String size,
		int amount) {
	super();
	this.id_orderdetail = id_orderdetail;
	this.id_product = id_product;
	this.id_ordercat = id_ordercat;
	this.id_color = id_color;
	this.id_salecode = id_salecode;
	this.size = size;
	this.amount = amount;
}


}
