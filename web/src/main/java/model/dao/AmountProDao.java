package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.AmountPro;
import model.bean.OrderDetail;

@Repository
public class AmountProDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	public AmountPro isHaveEnoughAmount(OrderDetail obj) {
		String sql = "SELECT * FROM amountproduct WHERE id_product = ? AND id_color = ? AND size =? AND ? <= amount";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] {obj.getId_product(),obj.getId_color(),obj.getSize(),obj.getAmount()},new BeanPropertyRowMapper<AmountPro>(AmountPro.class));
		} catch (Exception e) {
			return null;
		}
		
	}
	public AmountPro getobjbyID(OrderDetail obj) {
		String sql = "SELECT * FROM amountproduct WHERE id_product = ? AND id_color = ? AND size =?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] {obj.getId_product(),obj.getId_color(),obj.getSize()},new BeanPropertyRowMapper<AmountPro>(AmountPro.class));
		} catch (Exception e) {
			return null;
		}
	}
	public Object isHaveEnoughAmount(OrderDetail obj, int sl) {
		String sql = "SELECT * FROM amountproduct WHERE id_product = ? AND id_color = ? AND size =? AND ? <= amount";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] {obj.getId_product(),obj.getId_color(),obj.getSize(),sl},new BeanPropertyRowMapper<AmountPro>(AmountPro.class));
		} catch (Exception e) {
			return null;
		}
	}
	public int reduceAmountProduct(OrderDetail obj) {
		String sql = "UPDATE amountproduct SET amount = amount - ? WHERE id_product = ? AND id_color = ? AND size =?";
		return jdbcTemplate.update(sql, new Object[] {obj.getAmount(),obj.getId_product(),obj.getId_color(),obj.getSize()});
	}
	public int addAmountForProduct(AmountPro obj) {
		String sql ="INSERT INTO amountproduct(id_product,id_color,size,amount) VALUE(?,?,?,?)";
		return jdbcTemplate.update(sql,new Object[] {obj.getId_product(),obj.getId_color(),obj.getSize(),obj.getAmount()});
	}
	public List<AmountPro> getAmountByIdAmount(int id_product) {
		String sql="SELECT * FROM amountproduct WHERE id_product = ?";
		return jdbcTemplate.query(sql, new Object[] {id_product},new BeanPropertyRowMapper<AmountPro>(AmountPro.class));
		
		
	}
	public int setAmountProById(int id_amountPro, int amount) {
		String sql = "UPDATE amountproduct SET amount = ? WHERE id_amountPro = ?";
		return jdbcTemplate.update(sql, new Object[] {amount,id_amountPro});
		
	}
	public int delAllAmountProbyIdPro(int id_product) {
		String sql = "DELETE FROM amountproduct WHERE id_product = ?";
		return jdbcTemplate.update(sql, new Object[] {id_product});
		
	}
	public int countAllProduct() {
		try {
			String sql="SELECT SUM(amount) FROM amountproduct";
			return jdbcTemplate.queryForObject(sql,Integer.class);
		} catch (Exception e) {
			return 0;
		}
		
		
	}
}
