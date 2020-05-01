package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Address;
import model.bean.Cat;
import model.bean.District;
import model.bean.Province;
import model.bean.Ward;

@Repository
public class AddressDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<Address> getallAddress(){
		String sql ="SELECT * FROM address";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Address>(Address.class)); 
	}

	public List<Address> getlistAddressbyUser(int id_user) {
		String sql = "SELECT * FROM address WHERE id_user = ?";
		return jdbcTemplate.query(sql, new Object[] {id_user},new BeanPropertyRowMapper<Address>(Address.class));
	}
	
	
	public List<Province> getallProvince() {
		String sql = "SELECT * FROM province";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Province>(Province.class));
	}
	
	public List<District> getallDistrict() {
		String sql = "SELECT * FROM district";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<District>(District.class));
	}
	
	public List<Ward> getallWard() {
		String sql = "SELECT * FROM ward";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Ward>(Ward.class));
	}

	public List<District> getDistrictbyidProvince(int id_province) {
		String sql = "SELECT * FROM district WHERE _province_id = ?";
		return jdbcTemplate.query(sql, new Object[] {id_province},new BeanPropertyRowMapper<District>(District.class));
	}

	public List<Ward> getWardbyidDistrict(int id_district) {
		String sql = "SELECT * FROM ward WHERE _district_id = ?";
		return jdbcTemplate.query(sql, new Object[] {id_district},new BeanPropertyRowMapper<Ward>(Ward.class));
	}

	public Address getobjaddressbyidAddress(int id_address) {
		String sql = "SELECT * FROM address WHERE id_address = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] {id_address},new BeanPropertyRowMapper<Address>(Address.class));
		} catch (Exception e) {
			return null;
		}
	}

	public int removeallDefaul(int id_user) {
		String sql = "UPDATE address SET defaul = false WHERE id_user = ?";
		return jdbcTemplate.update(sql, new Object[] {id_user});
		
	}

	public int addAddress(Address address) {
		String sql ="INSERT INTO address(id_user,id_province,id_district,id_ward,namestreet,defaul) VALUE(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {address.getId_user(),address.getId_province(),address.getId_district(),address.getId_ward(),address.getNamestreet(),address.isDefaul()});
		
	}

	public int editAddress(Address address) {
		String sql ="UPDATE address SET id_province= ?,id_district = ?, id_ward =?,namestreet =?,defaul =? WHERE id_address = ?";
		return jdbcTemplate.update(sql, new Object[] {address.getId_province(),address.getId_district(),address.getId_ward(),address.getNamestreet(),address.isDefaul(),address.getId_address()});
		
		
	}

	public Address getAddressDefaulbyIdUser(int id_user) {
		String sql = "SELECT * FROM address WHERE id_user = ? AND defaul = true";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] {id_user},new BeanPropertyRowMapper<Address>(Address.class));
		} catch (Exception e) {
			return null;
		}
	}

	public Province getProvincebyID(int id_province) {
		String sql="SELECT * FROM province WHERE id = ? ";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] {id_province},new BeanPropertyRowMapper<Province>(Province.class));
		} catch (Exception e) {
			return null;
		}
	}
	
	public District getDistrictbyID(int id_district) {
		String sql="SELECT * FROM district WHERE id = ? ";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] {id_district},new BeanPropertyRowMapper<District>(District.class));
		} catch (Exception e) {
			return null;
		}
	}
	public Ward getWardbyID(int id_ward) {
		String sql="SELECT * FROM ward WHERE id = ? ";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] {id_ward},new BeanPropertyRowMapper<Ward>(Ward.class));
		} catch (Exception e) {
			return null;
		}
	}
}
