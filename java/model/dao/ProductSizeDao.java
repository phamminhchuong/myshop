package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.ProductColor;
import model.bean.ProductSize;
@Repository
public class ProductSizeDao {
@Autowired
private JdbcTemplate jdbcTemplate;

public List<ProductSize> getallproductsize(){
	String sql ="SELECT * FROM productsize";
	return jdbcTemplate.query(sql, new BeanPropertyRowMapper<ProductSize>(ProductSize.class)); 
}
public int addProductSize(ProductSize obj) {
	String sql = "INSERT INTO productsize(id_product,namesize) VALUE(?,?)";
	return jdbcTemplate.update(sql, new Object[] {obj.getId_product(),obj.getNamesize()});
}


public int delproductsizebyIDPro(int id_product) {
	String sql = "DELETE FROM productsize WHERE id_product = ?";
	return jdbcTemplate.update(sql, new Object[] {id_product});
}


public ProductSize getproductbysize(String namesize) {
	String sql = "SELECT * FROM productsize WHERE namesize = ?";
	try{
	return jdbcTemplate.queryForObject(sql, new Object[]{namesize}, new BeanPropertyRowMapper<ProductSize>(ProductSize.class));
	}catch (Exception e) {
		return null;
	}
}

public List<ProductSize> getsizebyProduct(int id_product) {
	String sql = "SELECT * FROM productsize WHERE id_product = ?";
	try{
	return jdbcTemplate.query(sql, new Object[]{id_product}, new BeanPropertyRowMapper<ProductSize>(ProductSize.class));
	}catch (Exception e) {
		return null;
	}
}
}
