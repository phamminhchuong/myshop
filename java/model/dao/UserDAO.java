package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Mail;
import model.bean.PasswordReset;
import model.bean.Roles;
import model.bean.Users;
@Repository
public class UserDAO {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<Users> getallUser(){
		String sql ="SELECT * FROM user AS u INNER JOIN roles AS r ON u.roles_id = r.Roles_id";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Users>(Users.class)); 
	}
	
	public Users getobjUser(String name) {
		String sql ="SELECT * FROM user AS u INNER JOIN roles AS r ON u.roles_id = r.Roles_id WHERE username = ?";
		try{
		return jdbcTemplate.queryForObject(sql,new Object[]{name}, new BeanPropertyRowMapper<Users>(Users.class)); 
		}catch(Exception e){
			return null;
		}
		
	}
	
	public Users getobjUserbyMail(String mail) {
		String sql ="SELECT * FROM user AS u INNER JOIN roles AS r ON u.roles_id = r.Roles_id WHERE email = ?";
		try{
		return jdbcTemplate.queryForObject(sql,new Object[]{mail}, new BeanPropertyRowMapper<Users>(Users.class)); 
		}catch(Exception e){
			return null;
		}
		
	}
	
	public int addToken(PasswordReset obj) {
		String sql="INSERT INTO tokenreset(id_user,token,all_done) VALUE(?,?,?)";
		return jdbcTemplate.update(sql, new Object[]{obj.getId_user(),obj.getToken(),false});
	}
	
	public Users findbyToken(String token) {
		String sql ="SELECT * FROM user AS u INNER JOIN tokenreset AS t	 ON u.id_user = t.id_user WHERE token=?";
		try{
		return jdbcTemplate.queryForObject(sql,new Object[]{token}, new BeanPropertyRowMapper<Users>(Users.class)); 
		}catch(Exception e){
			return null;
		}
		
	}

	public int updatePassUser(String email, String pass) {
		// TODO Auto-generated method stub
		String sql ="UPDATE user SET password = ? WHERE email=?";
		return jdbcTemplate.update(sql,new Object[]{pass,email});
	}
	
	
	public int deltokenbyUser(int id) {
		String sql ="DELETE FROM tokenreset WHERE id_user= ?";
		return jdbcTemplate.update(sql,new Object[]{id});
	}

	public int addUser(Users obj) {
			String sql="INSERT INTO user(name,username,password,phone,email,gioitinh,ngaysinh,roles_id,enable,nameImage,id_google) VALUE(?,?,?,?,?,?,?,?,?,?,?)";
			return jdbcTemplate.update(sql, new Object[]{obj.getName(),obj.getUsername(),obj.getPassword(),obj.getPhone(),obj.getEmail(),obj.isGioitinh(),obj.getNgaysinh(),obj.getRoles_id(),1,obj.getNameImage(),obj.getId_google()});
	}

	public Users getobjUserbyID(int id) {
		String sql ="SELECT * FROM user AS u INNER JOIN roles AS r ON u.roles_id = r.Roles_id WHERE id_user = ?";
		try{
		return jdbcTemplate.queryForObject(sql,new Object[]{id}, new BeanPropertyRowMapper<Users>(Users.class));
		}catch(Exception e){
			return null;
		}
	}

	public int editUser(Users obj) {
		String sql = "UPDATE user SET name = ?,password = ?,gioitinh = ?,ngaysinh = ?,roles_id = ?,enable = ?,nameImage = ? WHERE id_user = ?";
		return jdbcTemplate.update(sql,new Object[]{obj.getName(),obj.getPassword(),obj.isGioitinh(),obj.getNgaysinh(),obj.getRoles_id(),obj.isEnable(),obj.getNameImage(),obj.getId_user()});
	}

	public int deluserbyID(int id) {
		String sql ="DELETE FROM user WHERE id_user= ?";
		return jdbcTemplate.update(sql,new Object[]{id});
	}

	public Users checkUserLogin(String username,String pass) {
		String sql ="SELECT * FROM user AS u INNER JOIN roles AS r ON u.roles_id = r.Roles_id WHERE username = ? AND password = ?";
		try{
		return jdbcTemplate.queryForObject(sql,new Object[]{username,pass}, new BeanPropertyRowMapper<Users>(Users.class));
		}catch(Exception e){
			return null;
		}
		
	}

	public int updateUser(Users obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Roles> getAllRoles() {
		String sql = "SELECT * FROM roles";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Roles>(Roles.class));
		
	}
	
	public Roles getRolesbyId(int roles_id) {
		try {
			String sql = "SELECT * FROM roles WHERE roles_id = ?";
			return jdbcTemplate.queryForObject(sql,new Object[] {roles_id}, new BeanPropertyRowMapper<Roles>(Roles.class));
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}

	public double countPreNewCustomer(String now) {
		String sql="SELECT COUNT(*) FROM user AS u INNER JOIN roles AS r ON u.roles_id = r.Roles_id WHERE "
				+ "YEAR(u.date_created) = YEAR(? - INTERVAL 1 MONTH) "
				+ "AND MONTH(u.date_created) = MONTH(? - INTERVAL 1 MONTH) AND nameR='USER'";
		return jdbcTemplate.queryForObject(sql,new Object[] {now,now},Integer.class);
	}

	public double countNewCustomer(String now) {
		String sql ="SELECT COUNT(*) FROM user AS u INNER JOIN roles AS r ON u.roles_id = r.Roles_id "
				+ "WHERE month(date_created) = month(?) AND year(date_created) = year(?) AND nameR='USER'";
		return jdbcTemplate.queryForObject(sql,new Object[] {now,now},Integer.class);
	}

	public int countMaleInUser() {
		String sql="SELECT COUNT(*) FROM user WHERE gioitinh = true";
		return jdbcTemplate.queryForObject(sql,Integer.class);
	}

	public int countFeMaleInUser() {
		String sql="SELECT COUNT(*) FROM user WHERE gioitinh = false";
		return jdbcTemplate.queryForObject(sql,Integer.class);
	}

	public int countAllUser() {
		String sql="SELECT COUNT(*) FROM user";
		return jdbcTemplate.queryForObject(sql,Integer.class);
	}

	public int addUserWithId_goole(Users obj) {
		String sql="INSERT INTO user(name,username,password,phone,email,gioitinh,ngaysinh,roles_id,enable,nameImage) VALUE(?,?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[]{obj.getName(),obj.getUsername(),obj.getPassword(),obj.getPhone(),obj.getEmail(),obj.isGioitinh(),obj.getNgaysinh(),obj.getRoles_id(),1,obj.getNameImage(),obj.getId_google()});

	}
	
	
}
