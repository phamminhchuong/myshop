package model.bean;

public class Comment {
private int id_comment;
private int id_user;
private int id_product;
private int id_blog;
private String content;
private String date_create;
private int id_parent;
private int rating;
private boolean active;
public int getId_comment() {
	return id_comment;
}
public void setId_comment(int id_comment) {
	this.id_comment = id_comment;
}
public int getId_user() {
	return id_user;
}
public void setId_user(int id_user) {
	this.id_user = id_user;
}
public int getId_product() {
	return id_product;
}
public void setId_product(int id_product) {
	this.id_product = id_product;
}
public int getId_blog() {
	return id_blog;
}
public void setId_blog(int id_blog) {
	this.id_blog = id_blog;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getDate_create() {
	return date_create;
}
public void setDate_create(String date_create) {
	this.date_create = date_create;
}
public int getId_parent() {
	return id_parent;
}
public void setId_parent(int id_parent) {
	this.id_parent = id_parent;
}

public int getRating() {
	return rating;
}
public void setRating(int rating) {
	this.rating = rating;
}

public Comment() {
	super();
}
public boolean isActive() {
	return active;
}
public void setActive(boolean active) {
	this.active = active;
}
public Comment(int id_comment, int id_user, int id_product, int id_blog, String content, String date_create,
		int id_parent, int rating, boolean active) {
	super();
	this.id_comment = id_comment;
	this.id_user = id_user;
	this.id_product = id_product;
	this.id_blog = id_blog;
	this.content = content;
	this.date_create = date_create;
	this.id_parent = id_parent;
	this.rating = rating;
	this.active = active;
}

}
