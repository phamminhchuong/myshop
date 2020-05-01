package model.bean;

public class Favorite {
	private int id_favorite;
	private int id_user;
	private int id_blog;
	private int id_product;
	public int getId_favorite() {
		return id_favorite;
	}
	public void setId_favorite(int id_favorite) {
		this.id_favorite = id_favorite;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public int getId_blog() {
		return id_blog;
	}
	public void setId_blog(int id_blog) {
		this.id_blog = id_blog;
	}
	public int getId_product() {
		return id_product;
	}
	public void setId_product(int id_product) {
		this.id_product = id_product;
	}
	public Favorite(int id_favorite, int id_user, int id_blog, int id_product) {
		super();
		this.id_favorite = id_favorite;
		this.id_user = id_user;
		this.id_blog = id_blog;
		this.id_product = id_product;
	}
	public Favorite() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
