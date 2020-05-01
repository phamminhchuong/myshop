package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;

import model.bean.Color;
@Repository
public class ColorDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<Color> getallColor(){
		String sql ="SELECT * FROM color";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Color>(Color.class)); 
	}

	public int addColor(Color obj) {
		String sql = "INSERT INTO color(namecolor) VALUE(?)";
		return jdbcTemplate.update(sql, new Object[] {obj.getNamecolor()});
	}
	
	public int editColor(Color obj) {
		String sql = "UPDATE color SET namecolor = ? WHERE id_color = ?";
		return jdbcTemplate.update(sql, new Object[] {obj.getNamecolor(),obj.getId_color()});
	}

	public Color getobjColorbyID(int id) {
		String sql = "SELECT * FROM color WHERE id_color = ?";
		try{
		return jdbcTemplate.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<Color>(Color.class));
		}catch (Exception e) {
			return null;
		}
}

	public List<Color> getallcolorofProduct(int id_product) {
		String sql = "SELECT c.id_color,c.namecolor FROM color as c INNER JOIN productcolor as p ON c.id_color = p.id_color WHERE id_product = ?";
		return jdbcTemplate.query(sql,new Object[] {id_product}, new BeanPropertyRowMapper<Color>(Color.class)); 
	}
}