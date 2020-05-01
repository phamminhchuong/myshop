package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Image;
@Repository
public class ImageDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<Image> getallImage(){
		String sql ="SELECT * FROM image";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Image>(Image.class)); 
	}

	public int addImage(Image obj) {
		String sql = "INSERT INTO image(nameimg,id_product) VALUE(?,?)";
		return jdbcTemplate.update(sql, new Object[] {obj.getNameimg(),obj.getId_product()});
	}
	
	
	public int editCat(Image obj) {
		String sql = "UPDATE image SET nameimg = ?,id_product = ? WHERE id_image = ?";
		return jdbcTemplate.update(sql, new Object[] {obj.getNameimg(),obj.getId_product(),obj.getId_image()});
	}

	public Image getobjImagebyID(int id) {
		String sql = "SELECT * FROM image WHERE id_image = ?";
		try{
		return jdbcTemplate.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<Image>(Image.class));
		}catch (Exception e) {
			return null;
		}
}
	public List<Image> getimagebyidProduct(int id_product){
		String sql = "SELECT * FROM image WHERE id_product= ?";
		try{
		return jdbcTemplate.query(sql, new Object[] {id_product}, new BeanPropertyRowMapper<Image>(Image.class));
		}catch (Exception e) {
			return null;
		}
	}
	
	public int delimagebyID(int id_image){
		String sql = "DELETE FROM image WHERE id_image = ?";
		return jdbcTemplate.update(sql, new Object[] {id_image});
	}

	public int delimagebyidProduct(int id_product) {
		String sql = "DELETE FROM image WHERE id_product = ?";
		return jdbcTemplate.update(sql, new Object[] {id_product});
	}

	public List<Image> getallImage1by1() {
		String sql = "SELECT COUNT(id_product),id_image,id_product,nameimg FROM image GROUP BY id_product";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Image>(Image.class));
	}
	
	public Image getallImage1by1byIdproduct(int id_product) {
		String sql = "SELECT COUNT(id_product),id_image,id_product,nameimg FROM image WHERE id_product = ? GROUP BY id_product";
		return jdbcTemplate.queryForObject(sql,new Object[] {id_product} ,new BeanPropertyRowMapper<Image>(Image.class));
	}
}
