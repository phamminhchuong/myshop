package model.bean;

public class Ward {
private int id;
private String _name;
private String _prefix;
private int _province_id;
private int _district_id;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String get_name() {
	return _name;
}
public void set_name(String _name) {
	this._name = _name;
}
public String get_prefix() {
	return _prefix;
}
public void set_prefix(String _prefix) {
	this._prefix = _prefix;
}
public int get_province_id() {
	return _province_id;
}
public void set_province_id(int _province_id) {
	this._province_id = _province_id;
}
public int get_district_id() {
	return _district_id;
}
public void set_district_id(int _district_id) {
	this._district_id = _district_id;
}
public Ward(int id, String _name, String _prefix, int _province_id, int _district_id) {
	super();
	this.id = id;
	this._name = _name;
	this._prefix = _prefix;
	this._province_id = _province_id;
	this._district_id = _district_id;
}
public Ward() {
	super();
	// TODO Auto-generated constructor stub
}


}
