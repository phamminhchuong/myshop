package model.bean;

public class Image {
private int id_image;
private String nameimg;
private int id_product;

public int getId_image() {
	return id_image;
}
public void setId_image(int id_image) {
	this.id_image = id_image;
}

public int getId_product() {
	return id_product;
}
public void setId_product(int id_product) {
	this.id_product = id_product;
}

public Image() {
	super();
	// TODO Auto-generated constructor stub
}
public String getNameimg() {
	return nameimg;
}
public void setNameimg(String nameimg) {
	this.nameimg = nameimg;
}

public Image(int id_image, String nameimg, int id_product) {
	super();
	this.id_image = id_image;
	this.nameimg = nameimg;
	this.id_product = id_product;
}


}
