package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Payment;

@Repository

public class PaymentDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public Payment getpaymentbyID(int id_payment){
		String sql ="SELECT * FROM payment WHERE id_payment = ? ";
		try {
			return jdbcTemplate.queryForObject(sql,  new Object[] {id_payment},new BeanPropertyRowMapper<Payment>(Payment.class)); 
		} catch (Exception e) {
			return null;
		}
	}


}
