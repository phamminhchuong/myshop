package model.bean;

public class District {
private int id;
private String _name;
private int _province_id;


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


public int get_province_id() {
	return _province_id;
}


public void set_province_id(int _province_id) {
	this._province_id = _province_id;
}


public District() {
	super();
	// TODO Auto-generated constructor stub
}


public District(int id, String _name, int _province_id) {
	super();
	this.id = id;
	this._name = _name;
	this._province_id = _province_id;
}

}
