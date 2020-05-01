package model.bean;

public class ViewBlog {
private int id_viewBlog;
private int id_blog;
private int amount;
private String date_view;
public int getId_viewBlog() {
	return id_viewBlog;
}
public void setId_viewBlog(int id_viewBlog) {
	this.id_viewBlog = id_viewBlog;
}
public int getId_blog() {
	return id_blog;
}
public void setId_blog(int id_blog) {
	this.id_blog = id_blog;
}
public int getAmount() {
	return amount;
}
public void setAmount(int amount) {
	this.amount = amount;
}
public String getDate_view() {
	return date_view;
}
public void setDate_view(String date_view) {
	this.date_view = date_view;
}
public ViewBlog(int id_viewBlog, int id_blog, int amount, String date_view) {
	super();
	this.id_viewBlog = id_viewBlog;
	this.id_blog = id_blog;
	this.amount = amount;
	this.date_view = date_view;
}
public ViewBlog() {
	super();
	// TODO Auto-generated constructor stub
}


}
