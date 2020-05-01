package model.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class Blog {
private int id_blog;
private String namebl;
private String image;
private String content;
private String date_create;
private String count_view;
private String count_like;
public int getId_blog() {
	return id_blog;
}
public void setId_blog(int id_blog) {
	this.id_blog = id_blog;
}
public String getNamebl() {
	return namebl;
}
public void setNamebl(String namebl) {
	this.namebl = namebl;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}

public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}


public String getDate_create() {
	SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
	String dateString = "";
	try {
		Date date = format.parse(date_create);
		dateString = format.format(date);
	} catch (ParseException e) {
		e.printStackTrace();
	}
	return dateString;
}
public void setDate_create(String date_create) {
	this.date_create = date_create;
}



public Blog(int id_blog, String namebl, String image, String content, String date_create, String count_view,
		String count_like) {
	super();
	this.id_blog = id_blog;
	this.namebl = namebl;
	this.image = image;
	this.content = content;
	this.date_create = date_create;
	this.count_view = count_view;
	this.count_like = count_like;
}
public Blog() {
	super();
	// TODO Auto-generated constructor stub
}
public int getDay() {
	DateTimeFormatter formatter =  DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
	LocalDateTime dateTime = LocalDateTime.parse(date_create, formatter);
	return dateTime.getDayOfMonth();
}
public int getMonth() {
	LocalDateTime dateTime = LocalDateTime.parse(date_create, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S"));
	return dateTime.getMonthValue();
}
public int getYear() {
	LocalDateTime dateTime = LocalDateTime.parse(date_create, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S"));
	return dateTime.getYear();
}
public String getCount_view() {
	return count_view;
}
public void setCount_view(String count_view) {
	this.count_view = count_view;
}
public String getCount_like() {
	return count_like;
}
public void setCount_like(String count_like) {
	this.count_like = count_like;
}
}
