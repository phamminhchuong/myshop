package model.bean;

public class Payment {
private int id_payment;
private String namepayment;
public int getId_payment() {
	return id_payment;
}
public void setId_payment(int id_payment) {
	this.id_payment = id_payment;
}
public String getNamepayment() {
	return namepayment;
}
public void setNamepayment(String namepayment) {
	this.namepayment = namepayment;
}
public Payment(int id_payment, String namepayment) {
	super();
	this.id_payment = id_payment;
	this.namepayment = namepayment;
}
public Payment() {
	super();
}


}
