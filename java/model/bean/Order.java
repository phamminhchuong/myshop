package model.bean;

public class Order {
private int id_order;
private int id_user;
private boolean	confirm;
private int id_payment;
private boolean paid;
private String date;
private int payship;
private int Tongtien;
private int sendaddress;
private int id_status;

public int getId_order() {
	return id_order;
}

public void setId_order(int id_order) {
	this.id_order = id_order;
}

public int getId_user() {
	return id_user;
}

public void setId_user(int id_user) {
	this.id_user = id_user;
}

public boolean isConfirm() {
	return confirm;
}

public void setConfirm(boolean confirm) {
	this.confirm = confirm;
}

public int getId_payment() {
	return id_payment;
}

public void setId_payment(int id_payment) {
	this.id_payment = id_payment;
}

public boolean isPaid() {
	return paid;
}

public void setPaid(boolean paid) {
	this.paid = paid;
}

public String getDate() {
	return date;
}

public void setDate(String date) {
	this.date = date;
}

public int getPayship() {
	return payship;
}

public void setPayship(int payship) {
	this.payship = payship;
}


public int getId_status() {
	return id_status;
}

public void setId_status(int id_status) {
	this.id_status = id_status;
}


public Order() {
	super();
}

public int getSendaddress() {
	return sendaddress;
}

public void setSendaddress(int sendaddress) {
	this.sendaddress = sendaddress;
}



public Order(int id_order, int id_user, boolean confirm, int id_payment, boolean paid, String date, int payship,
		int tongtien, int sendaddress, int id_status) {
	super();
	this.id_order = id_order;
	this.id_user = id_user;
	this.confirm = confirm;
	this.id_payment = id_payment;
	this.paid = paid;
	this.date = date;
	this.payship = payship;
	Tongtien = tongtien;
	this.sendaddress = sendaddress;
	this.id_status = id_status;
}

public int getTongtien() {
	return Tongtien;
}

public void setTongtien(int tongtien) {
	Tongtien = tongtien;
}


}
