package model.bean;

public class Province {
private int id;
private String _name;
private String _code;
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

public Province(int id, String _name, String _code) {
	super();
	this.id = id;
	this._name = _name;
	this._code = _code;
}
public Province() {
	super();
}
public String get_code() {
	return _code;
}
public void set_code(String _code) {
	this._code = _code;
}


}
