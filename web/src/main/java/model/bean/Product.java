package model.bean;

import java.util.Set;

public class Product {
private int id_pro;
private int id_cat;
private String namepro;
private int gia;
private int giakm;
private String decription;
private int soluong;
private Set<Color> lmau;
private float medium_rating;
public int getId_pro() {
	return id_pro;
}
public void setId_pro(int id_pro) {
	this.id_pro = id_pro;
}
public int getId_cat() {
	return id_cat;
}
public void setId_cat(int id_cat) {
	this.id_cat = id_cat;
}

public String getNamepro() {
	return namepro;
}
public void setNamepro(String namepro) {
	this.namepro = namepro;
}
public int getGia() {
	return gia;
}
public void setGia(int gia) {
	this.gia = gia;
}
public int getGiakm() {
	return giakm;
}
public void setGiakm(int giakm) {
	this.giakm = giakm;
}



public int getSoluong() {
	return soluong;
}
public void setSoluong(int soluong) {
	this.soluong = soluong;
}
public Product() {
	super();
	// TODO Auto-generated constructor stub
}

public String getDecription() {
	return decription;
}
public void setDecription(String decription) {
	this.decription = decription;
}
public Set<Color> getLmau() {
	return lmau;
}
public void setLmau(Set<Color> lmau) {
	this.lmau = lmau;
}

public float getMedium_rating() {
	return medium_rating;
}
public void setMedium_rating(float medium_rating) {
	this.medium_rating = medium_rating;
}
public Product(int id_pro, int id_cat, String namepro, int gia, int giakm, String decription, int soluong,
		Set<Color> lmau, float medium_rating) {
	super();
	this.id_pro = id_pro;
	this.id_cat = id_cat;
	this.namepro = namepro;
	this.gia = gia;
	this.giakm = giakm;
	this.decription = decription;
	this.soluong = soluong;
	this.lmau = lmau;
	this.medium_rating = medium_rating;
}

}
