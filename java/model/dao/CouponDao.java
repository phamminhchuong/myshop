package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Coupon;
import model.bean.Users;

@Repository
public class CouponDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public Coupon getCuoponbyID(int id_salecode) {
		String sql ="SELECT * FROM salecode WHERE id_salecode = ?";
		try{
			return jdbcTemplate.queryForObject(sql, new Object[] {id_salecode},new BeanPropertyRowMapper<Coupon>(Coupon.class));
			}catch(Exception e){
				return null;
			}
		}
	public Coupon getCuoponbyName(String namecodesale) {
		String sql ="SELECT * FROM salecode WHERE namecode = ?";
		try{
			return jdbcTemplate.queryForObject(sql, new Object[] {namecodesale},new BeanPropertyRowMapper<Coupon>(Coupon.class));
			}catch(Exception e){
				return null;
			}
	}
	public Coupon checkexpiryDate(String namecodesale) {
		String sql ="SELECT * FROM salecode WHERE namecode = ? AND expiry_date > CURRENT_DATE";
		try{
			return jdbcTemplate.queryForObject(sql, new Object[] {namecodesale},new BeanPropertyRowMapper<Coupon>(Coupon.class));
			}catch(Exception e){
				return null;
			}
	}
	public List<Coupon> getAllCoupon() {
		String sql ="SELECT * FROM salecode ORDER BY id_salecode DESC";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Coupon>(Coupon.class));
	}
	public int addCoupon(Coupon obj) {
		String sql ="INSERT INTO salecode(namecode,percent,expiry_date,id_product) VALUE(?,?,?,?)";
		return jdbcTemplate.update(sql,new Object[] {obj.getNamecode(),obj.getPercent(),obj.getExpiry_date(),obj.getId_product()});
	}
	public List<Coupon> getAllCouponbyIdPro(int id_product) {
		String sql ="SELECT * FROM salecode WHERE id_product = ? ORDER BY id_salecode DESC";
		return jdbcTemplate.query(sql,new Object[] {id_product},new BeanPropertyRowMapper<Coupon>(Coupon.class));
	
	}
	public Coupon getCouponbyId(int id_coupon) {
		String sql ="SELECT * FROM salecode WHERE id_salecode = ? ";
		try{
			return jdbcTemplate.queryForObject(sql, new Object[] {id_coupon},new BeanPropertyRowMapper<Coupon>(Coupon.class));
			}catch(Exception e){
				return null;
			}
	}
	public int editCoupon(Coupon obj) {
		String sql="UPDATE salecode SET namecode = ?,percent = ?,expiry_date = ? WHERE id_salecode = ?";
		return jdbcTemplate.update(sql,new Object[] {obj.getNamecode(),obj.getPercent(),obj.getExpiry_date(),obj.getId_salecode()});
	}
	public int delCoupon(int id_coupon) {
		String sql="DELETE FROM salecode WHERE id_salecode = ?";
		return jdbcTemplate.update(sql,new Object[] {id_coupon});
	}
}
