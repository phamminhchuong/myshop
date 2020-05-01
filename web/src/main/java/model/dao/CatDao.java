package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Cat;
@Repository
public class CatDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<Cat> getallCat(){
		String sql ="SELECT * FROM category";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Cat>(Cat.class)); 
	}

	public int addCat(Cat obj) {
		String sql = "INSERT INTO category(namec,id_parent) VALUE(?,?)";
		return jdbcTemplate.update(sql, new Object[] {obj.getNamec(),obj.getId_parent()});
	}
	
	
	public int editCat(Cat obj) {
		String sql = "UPDATE category SET namec = ?,id_parent = ? WHERE id_cat = ?";
		return jdbcTemplate.update(sql, new Object[] {obj.getNamec(),obj.getId_parent(),obj.getId_cat()});
	}

	public Cat getobjCatbyID(int id) {
		String sql = "SELECT * FROM category WHERE id_cat = ?";
		try{
		return jdbcTemplate.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<Cat>(Cat.class));
		}catch (Exception e) {
			return null;
		}
	}

	public int delCat(int id) {
		String sql = "DELETE FROM category WHERE id_cat = ?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}
	}
