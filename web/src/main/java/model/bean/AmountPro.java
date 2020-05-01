package model.bean;


public class AmountPro {
	private int id_amountPro;
	private int id_product;
	private int id_color;
	private String size;
	private int amount;
	public int getId_amountPro() {
		return id_amountPro;
	}
	public void setId_amountPro(int id_amountPro) {
		this.id_amountPro = id_amountPro;
	}
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
	public AmountPro(int id_amountPro, int id_product, int id_color, String size, int amount) {
		super();
		this.id_amountPro = id_amountPro;
		this.id_product = id_product;
		this.id_color = id_color;
		this.size = size;
		this.amount = amount;
	}
	public AmountPro() {
		super();
	}
	
}
