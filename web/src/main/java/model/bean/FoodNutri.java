package model.bean;

public class FoodNutri {
private int id_foodNutri;
private String namefoodvn;
private String namefooden;
private float water;
private float energy;
private float protein;
private float lipid;
public int getId_foodNutri() {
	return id_foodNutri;
}
public void setId_foodNutri(int id_foodNutri) {
	this.id_foodNutri = id_foodNutri;
}
public String getNamefoodvn() {
	return namefoodvn;
}
public void setNamefoodvn(String namefoodvn) {
	this.namefoodvn = namefoodvn;
}
public String getNamefooden() {
	return namefooden;
}
public void setNamefooden(String namefooden) {
	this.namefooden = namefooden;
}
public float getWater() {
	return water;
}
public void setWater(float water) {
	this.water = water;
}
public float getEnergy() {
	return energy;
}
public void setEnergy(float energy) {
	this.energy = energy;
}
public float getProtein() {
	return protein;
}
public void setProtein(float protein) {
	this.protein = protein;
}
public float getLipid() {
	return lipid;
}
public void setLipid(float lipid) {
	this.lipid = lipid;
}
public FoodNutri(int id_foodNutri, String namefoodvn, String namefooden, float water, float energy, float protein,
		float lipid) {
	super();
	this.id_foodNutri = id_foodNutri;
	this.namefoodvn = namefoodvn;
	this.namefooden = namefooden;
	this.water = water;
	this.energy = energy;
	this.protein = protein;
	this.lipid = lipid;
}
public FoodNutri() {
	super();
	// TODO Auto-generated constructor stub
}


}
