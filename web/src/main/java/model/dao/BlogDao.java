package model.dao;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Defines.Defines;
import model.bean.Blog;
import model.bean.Cat;
import model.bean.ViewBlog;

@Repository
public class BlogDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	public List<Blog> getallBlog(int offset,String str){
		String sql ="SELECT * FROM blog WHERE namebl LIKE ? LIMIT ?,?";
		return jdbcTemplate.query(sql,new Object[] {"%"+str+"%",offset,Defines.ROW_COUNT}, new BeanPropertyRowMapper<Blog>(Blog.class));
		
	}
	
	public List<Blog> getBlogforPublic(int offset, int numBlog){
		String sql ="SELECT * FROM blog LIMIT ?,?";
		return jdbcTemplate.query(sql,new Object[] {offset,numBlog}, new BeanPropertyRowMapper<Blog>(Blog.class));
		
	}
	
	public int addBlog(Blog obj) {
		String sql = "INSERT INTO blog(namebl,image,content,count_view,count_like) VALUE(?,?,?,0,0)";
		return jdbcTemplate.update(sql, new Object[] {obj.getNamebl(),obj.getImage(),obj.getContent()});
	}
	public int editBlog(Blog obj) {
		String sql = "UPDATE blog SET namebl = ?,image = ?,content = ? WHERE id_blog = ?";
		return jdbcTemplate.update(sql, new Object[] {obj.getNamebl(),obj.getImage(),obj.getContent(),obj.getId_blog()});
	}
	public Blog getobjBlogbyID(int id) {
		String sql = "SELECT * FROM blog WHERE id_blog = ?";
		try{
		return jdbcTemplate.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<Blog>(Blog.class));
		}catch (Exception e) {
			return null;
		}
	}
	public int countBlog(String search) {
		String sql ="SELECT COUNT(*) FROM blog WHERE namebl LIKE ?";
		return jdbcTemplate.queryForObject(sql,new Object[]{"%"+search+"%"}, Integer.class);
	}
	public int delBlog(int id) {
		String sql = "DELETE FROM blog WHERE id_blog = ?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}

	public int upViewBlogID(int id_blog) {
		String sql = "UPDATE blog SET count_view = count_view+1 WHERE id_blog = ?";
		return jdbcTemplate.update(sql, new Object[] {id_blog});
	}

	public List<Blog> getallblogmostView(int offset,String str) {
		String sql ="SELECT * FROM blog WHERE namebl LIKE ? ORDER BY count_view DESC LIMIT ?,?";
		return jdbcTemplate.query(sql,new Object[] {"%"+str+"%",offset,Defines.ROW_COUNT}, new BeanPropertyRowMapper<Blog>(Blog.class));
	}

	public List<Blog> getallblogmostComment(int offset,String str) {
		String sql="SELECT b.id_blog,b.namebl,b.image,b.content,b.date_create,b.count_view,c.count "
				+ "FROM blog as b "
				+ "LEFT JOIN (SELECT id_blog,COUNT(*) as count FROM comment GROUP BY id_blog ORDER BY count DESC) as c "
				+ "ON b.id_blog = c.id_blog WHERE namebl LIKE ? LIMIT ?,?";
		return jdbcTemplate.query(sql,new Object[] {"%"+str+"%",offset,Defines.ROW_COUNT}, new BeanPropertyRowMapper<Blog>(Blog.class));
	}

	public List<Blog> search(int offset,String search) {
		String sql= "SELECT *FROM blog WHERE namebl LIKE ? LIMIT ?,?";
		return jdbcTemplate.query(sql,new Object[] {"%"+search+"%",offset,Defines.ROW_COUNT}, new BeanPropertyRowMapper<Blog>(Blog.class));
	}

	public double countbyMonthViewAllBlog(String now) {
		String sql="SELECT SUM(amount) FROM viewblog WHERE month(date_view) = month(?) AND year(date_view) = year(?)";
		return jdbcTemplate.queryForObject(sql,new Object[] {now,now},Integer.class);
		
	}
	
	public int countbyMonthViewAllBlog(String now,int month) {
		
		String sql="SELECT SUM(amount) FROM viewblog WHERE month(date_view) = ? AND year(date_view) = year(?)";
		try {
			return jdbcTemplate.queryForObject(sql,new Object[] {month,now},Integer.class);
		} catch (Exception e) {
			return 0;
		}
		
	}
	
	public double countPreviousbyMonthViewAllBlog(String now) {
		String sql="SELECT SUM(amount) FROM viewblog WHERE "
				+ "YEAR(date_view) = YEAR(? - INTERVAL 1 MONTH) "
				+ "AND MONTH(date_view) = MONTH(? - INTERVAL 1 MONTH)";
		return jdbcTemplate.queryForObject(sql,new Object[] {now,now},Integer.class);
		
	}
	public int updateViewBlogByView(int id_blog) {
		String sql = "UPDATE viewblog SET amount = amount + 1 WHERE id_blog = ?";
		return jdbcTemplate.update(sql,new Object[] {id_blog});
	}

	public ViewBlog checkViewBlogIsHaveViewer(LocalDate now, int id_blog) {
		String sql ="SELECT * FROM viewblog WHERE id_blog = ? AND date_view = ?";
		try {
			return jdbcTemplate.queryForObject(sql,new Object[] {id_blog,now},new BeanPropertyRowMapper<ViewBlog>(ViewBlog.class));
		} catch (Exception e) {
			return null;
		}
	}

	public int addViewBlogByView(ViewBlog objvb) {
		String sql = "INSERT INTO viewblog(id_blog,amount,date_view) VALUE (?,?,?)";
		return jdbcTemplate.update(sql,new Object[] {objvb.getId_blog(),objvb.getAmount(),objvb.getDate_view()});
	}

	public int countAllView() {
		String sql ="SELECT SUM(amount) FROM viewblog";
		try {
			return jdbcTemplate.queryForObject(sql,Integer.class);
		} catch (Exception e) {
			return 0;
		}
	}

	public int countbyDayViewAllBlog(String now, int i) {
		
		String sql="SELECT SUM(amount) FROM viewblog WHERE day(date_view)= ? "
				+ "AND month(date_view) = month(?) AND year(date_view) = year(?)";
		try {
		return jdbcTemplate.queryForObject(sql,new Object[] {i,now,now},Integer.class);
		}catch (Exception e) {
			return 0;
		}
	}

	public int downLikeBlog(int id_blogg) {
		String sql="UPDATE blog SET count_like = count_like - 1 WHERE id_blog = ?";
		return jdbcTemplate.update(sql, new Object[] {id_blogg});
	}

	public int upLikeBlog(int id_blogg) {
		String sql="UPDATE blog SET count_like = count_like + 1 WHERE id_blog = ?";
		return jdbcTemplate.update(sql, new Object[] {id_blogg});
	}
	
}
