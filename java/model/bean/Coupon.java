package model.bean;

public class Coupon {
private int id_salecode;
private String namecode;
private int percent;
private String expiry_date;
private int amount;
private int id_product;
public int getId_salecode() {
	return id_salecode;
}
public void setId_salecode(int id_salecode) {
	this.id_salecode = id_salecode;
}
public String getNamecode() {
	return namecode;
}
public void setNamecode(String namecode) {
	this.namecode = namecode;
}
public int getPercent() {
	return percent;
}
public void setPercent(int percent) {
	this.percent = percent;
}

public String getExpiry_date() {
	return expiry_date;
}
public void setExpiry_date(String expiry_date) {
	this.expiry_date = expiry_date;
}
public int getAmount() {
	return amount;
}
public void setAmount(int amount) {
	this.amount = amount;
}
public int getId_product() {
	return id_product;
}
public void setId_product(int id_product) {
	this.id_product = id_product;
}

public Coupon(int id_salecode, String namecode, int percent, String expiry_date, int amount, int id_product) {
	super();
	this.id_salecode = id_salecode;
	this.namecode = namecode;
	this.percent = percent;
	this.expiry_date = expiry_date;
	this.amount = amount;
	this.id_product = id_product;
}
public Coupon() {
	super();
	// TODO Auto-generated constructor stub
}


}
