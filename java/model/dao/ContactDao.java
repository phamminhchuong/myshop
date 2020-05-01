package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Contact;

@Repository
public class ContactDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Contact> getallContact() {
		String sql="SELECT * FROM contact";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Contact>(Contact.class));
	}

	public Contact getContactById(int id_contact) {
		String sql="SELECT * FROM contact WHERE id_ct = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {id_contact},new BeanPropertyRowMapper<Contact>(Contact.class));
	}

	public int updateViewContactById(int id_contact) {
		String sql="UPDATE contact SET view = true WHERE id_ct = ?";
		return jdbcTemplate.update(sql,new Object[] {id_contact});
		
	}

	public int delContactById(int id_contact) {
		String sql="DELETE FROM contact WHERE id_ct = ?";
		return jdbcTemplate.update(sql,new Object[] {id_contact});
	}

	public int countContactIsNotSeen() {
			String sql="SELECT COUNT(*) FROM contact WHERE view = false";
			return jdbcTemplate.queryForObject(sql,Integer.class);
	}

	public int addContact(Contact contact) {
		String sql ="INSERT INTO contact(name,email,phonect,tieude,noidung,view) VALUE(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,new Object[] {contact.getName(),contact.getEmail(),contact.getPhonect(),contact.getTieude(),contact.getNoidung(),contact.isView()});
	}
}
