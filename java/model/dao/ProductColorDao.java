package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Cat;
import model.bean.ProductColor;
@Repository
public class ProductColorDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<ProductColor> getallproductColor(){
		String sql ="SELECT * FROM productcolor";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<ProductColor>(ProductColor.class)); 
	}

	public int addProductColor(ProductColor obj) {
		String sql = "INSERT INTO productcolor(id_product,id_color) VALUE(?,?)";
		return jdbcTemplate.update(sql, new Object[] {obj.getId_product(),obj.getId_color()});
	}
	
	
	public int editProductbyColor(ProductColor obj) {
		String sql = "UPDATE productcolor SET id_product = ?,id_color = ?";
		return jdbcTemplate.update(sql, new Object[] {obj.getId_product(),obj.getId_color()});
	}

	public int delproductcolorbyIDPro(int id_product) {
		String sql = "DELETE FROM productcolor WHERE id_product = ?";
		return jdbcTemplate.update(sql, new Object[] {id_product});
	}
	
	
	public ProductColor getproductbyColor(int id_color) {
		String sql = "SELECT * FROM productcolor WHERE id_color = ?";
		try{
		return jdbcTemplate.queryForObject(sql, new Object[]{id_color}, new BeanPropertyRowMapper<ProductColor>(ProductColor.class));
		}catch (Exception e) {
			return null;
		}
}
	
	public List<ProductColor> getcolorbyProduct(int id_product) {
		String sql = "SELECT * FROM productcolor WHERE id_product = ?";
		try{
		return jdbcTemplate.query(sql, new Object[]{id_product}, new BeanPropertyRowMapper<ProductColor>(ProductColor.class));
		}catch (Exception e) {
			return null;
		}
}
	
}