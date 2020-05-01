package model.bean;

public class ProductSize {
private int id_productsize;
private String namesize;
private int id_product;
public int getId_productsize() {
	return id_productsize;
}
public void setId_productsize(int id_productsize) {
	this.id_productsize = id_productsize;
}
public String getNamesize() {
	return namesize;
}
public void setNamesize(String namesize) {
	this.namesize = namesize;
}
public int getId_product() {
	return id_product;
}
public void setId_product(int id_product) {
	this.id_product = id_product;
}
public ProductSize(int id_productsize, String namesize, int id_product) {
	super();
	this.id_productsize = id_productsize;
	this.namesize = namesize;
	this.id_product = id_product;
}
public ProductSize() {
	super();
}

}
