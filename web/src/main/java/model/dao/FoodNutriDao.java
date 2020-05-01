package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.FoodNutri;

@Repository
public class FoodNutriDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<FoodNutri> getListFoodNutri() {
		String sql = "SELECT * FROM foodnutrient";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<FoodNutri>(FoodNutri.class));
	}
}
