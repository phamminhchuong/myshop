package model.dao;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Cat;
import model.bean.Comment;

@Repository
public class CommentDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Comment> getallcommentofBlog(){
		String sql ="SELECT * FROM comment WHERE id_product = 0";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Comment>(Comment.class)); 
	}

	public List<Comment> getallcommentofProduct(){
		String sql ="SELECT * FROM comment WHERE id_blog = 0";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Comment>(Comment.class)); 
	}
	public List<Comment> getallcommentofProductbyID(int id_product){
		String sql ="SELECT * FROM comment WHERE id_blog = 0 AND id_product = ?";
		return jdbcTemplate.query(sql,new Object[] {id_product} ,new BeanPropertyRowMapper<Comment>(Comment.class)); 
	}
	
	public List<Comment> getallcommentProductFatherbyID(int id_product){
		String sql ="SELECT * FROM comment WHERE id_blog = 0 AND id_parent = 0 AND id_product = ? AND active = ? ORDER BY id_comment DESC";
		return jdbcTemplate.query(sql,new Object[] {id_product,true} , new BeanPropertyRowMapper<Comment>(Comment.class)); 
	}
	
	public List<Comment> getallcommentProductSonbyID(int id_product){
		String sql ="SELECT * FROM comment WHERE id_blog = 0 AND id_parent != 0 AND id_product = ? ORDER BY id_comment DESC";
		return jdbcTemplate.query(sql,new Object[] {id_product} , new BeanPropertyRowMapper<Comment>(Comment.class)); 
	}
	
	
	public List<Comment> getallcommentBlogFather(int id_blog){
		String sql ="SELECT * FROM comment WHERE id_product = 0 AND id_parent = 0 AND id_blog = ?";
		return jdbcTemplate.query(sql,new Object[] {id_blog}, new BeanPropertyRowMapper<Comment>(Comment.class)); 
	}
	
	public List<Comment> getallcommentBlogSon(int id_blog){
		String sql ="SELECT * FROM comment WHERE id_product = 0 AND id_parent != 0 AND id_blog = ?";
		return jdbcTemplate.query(sql, new Object[] {id_blog},new BeanPropertyRowMapper<Comment>(Comment.class)); 
	}
	
	public int addComment(Comment obj) {
		String sql = "INSERT INTO comment(id_user,id_product,id_blog,content,id_parent,rating,active) VALUE(?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {obj.getId_user(),obj.getId_product(),obj.getId_blog(),obj.getContent(),obj.getId_parent(),obj.getRating(),obj.isActive()});
	}
	
	
	public int delCat(int id) {
		String sql = "DELETE FROM category WHERE id_cat = ?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}

	public int countCommentbyIdBlog(int id_blog) {
		String sql = "SELECT COUNT(*) FROM comment WHERE id_product = 0 AND id_blog = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {id_blog}, Integer.class);
	}

	public float getMediumratingofProduct(int id_product) {
		String sql ="SELECT SUM(rating)/COUNT(rating) FROM comment WHERE rating != 0 AND id_blog = 0 AND id_product = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {id_product},Float.class);
	}

	public int getnumberRatingofProduct(int id_product) {
		String sql ="SELECT COUNT(*) FROM comment WHERE rating != 0 AND id_blog = 0 AND id_product = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {id_product},Integer.class);
	}

	public int delCommentById(int id_comment) {
		String sql = "DELETE FROM comment WHERE id_comment = ? OR id_parent = ?";
		return jdbcTemplate.update(sql, new Object[] {id_comment,id_comment});
	}

	public Comment getCommentById(int id_comment) {
		String sql = "SELECT * FROM comment WHERE id_comment = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] {id_comment}, new BeanPropertyRowMapper<Comment>(Comment.class));
		} catch (Exception e) {
			return null;
		}
		
	}

	public int countCommentByDay(String now, int i) {
		String sql="SELECT COUNT(*) FROM comment WHERE day(date_create) = ? "
				+ "AND month(date_create) = month(?) AND year(date_create) = year(?)";
		return jdbcTemplate.queryForObject(sql, new Object[] {i,now,now}, Integer.class);
		
	}
	
	public int countCommentByMonth(String now, int i) {
		String sql="SELECT COUNT(*) FROM comment WHERE month(date_create) = ? AND year(date_create) = year(?)";
		return jdbcTemplate.queryForObject(sql, new Object[] {i,now}, Integer.class);
		
	}
}
