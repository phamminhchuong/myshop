package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.List;

import org.apache.velocity.app.event.ReferenceInsertionEventHandler.referenceInsertExecutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.thymeleaf.standard.expression.OrExpression;

import Defines.Defines;
import model.bean.Order;
import model.bean.OrderDetail;
@Repository
public class OrderDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<OrderDetail> getallOrderDetail(){
		String sql ="SELECT * FROM orderdetail ";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<OrderDetail>(OrderDetail.class)); 
	}
	
	public int addOrder(final Order obj) {
		final String sql = "INSERT INTO ordercat(id_user,confirm,id_payment,paid,sendaddress,payship,tongtien,id_status) VALUE(?,?,?,?,?,?,0,?)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		int a = jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				
				PreparedStatement ps =(PreparedStatement) con.prepareStatement( sql, Statement.RETURN_GENERATED_KEYS);
				ps.setInt(1, obj.getId_user());
				ps.setBoolean(2, obj.isConfirm());
				ps.setInt(3, obj.getId_payment());
				ps.setBoolean(4, obj.isPaid());
				ps.setInt(5, obj.getSendaddress());
				ps.setInt(6, obj.getPayship());
				ps.setInt(7, obj.getId_status());
				return ps;
				
			}
		},keyHolder);
		return keyHolder.getKey().intValue();
	}
	
	public int addOrderDetail(OrderDetail obj) {
		String sql = "INSERT INTO orderdetail(id_product,id_ordercat,id_color,size,id_salecode,amount) VALUE(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,new Object[] {obj.getId_product(),obj.getId_ordercat(),obj.getId_color(),
				obj.getSize(),obj.getId_salecode(),obj.getAmount()});
	}

	public List<Order> getOrderByIdUser(int id_user) {
		String sql = "SELECT * FROM ordercat WHERE id_user = ?";
		return jdbcTemplate.query(sql, new Object[] {id_user},new BeanPropertyRowMapper<Order>(Order.class));
	}

	public List<OrderDetail> getlistOrderDetailByIdOrder(int id_order) {
		String sql="SELECT * FROM orderdetail WHERE id_ordercat = ?";
		return jdbcTemplate.query(sql, new Object[] {id_order},new BeanPropertyRowMapper<OrderDetail>(OrderDetail.class));
	}

	public int setTongtienfoOrder(int tongtien,int id_order) {
		String sql="UPDATE ordercat SET tongtien = ? WHERE id_order = ?";
		return jdbcTemplate.update(sql,new Object[] {tongtien,id_order});
		
	}

	public Order getobjOrderByIdorder(Integer id_order) {
		String sql = "SELECT * FROM ordercat WHERE id_order = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] {id_order},new BeanPropertyRowMapper<Order>(Order.class));
		} catch (Exception e) {
			return null;
		}
	}

	public int delOrder(int id_order) {
		String sql = "DELETE FROM ordercat WHERE id_order = ? AND confirm = false";
		return jdbcTemplate.update(sql, new Object[] {id_order});
	}

	public int delOrderdetail(int id_order) {
		String sql = "DELETE FROM orderdetail WHERE id_ordercat = ?";
		return jdbcTemplate.update(sql, new Object[] {id_order});
		
	}

	public List<Order> getAllOrderByOfset(int offset) {
		String sql = "SELECT * FROM ordercat ORDER BY id_order DESC LIMIT ?,?";
		return jdbcTemplate.query(sql, new Object[] {Defines.ROW_COUNT,offset},new BeanPropertyRowMapper<Order>(Order.class));
	}

	public List<Order> getAllOrder() {
		String sql = "SELECT * FROM ordercat ORDER BY id_order DESC";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Order>(Order.class));
	}

	public int setcomfirmTrue(int id_order) {
		String sql = "UPDATE ordercat SET confirm = true WHERE id_order = ?";
		return jdbcTemplate.update(sql, new Object[] {id_order});
		
	}

	public double countTongTienByMonth(String now) {
		try {
			String sql="SELECT SUM(tongtien) FROM ordercat WHERE month(date) = month(?) AND year(date) = year(?)";
			return jdbcTemplate.queryForObject(sql, new Object[] {now,now},Integer.class);
		
		} catch (Exception e) {
			return 0;
		}
	}
	
	public double countTongTienByMonthPre(String now) {
		try {
			String sql="SELECT SUM(tongtien) FROM ordercat WHERE month(date) = month(? - INTERVAL 1 MONTH) AND year(date) = year(? - INTERVAL 1 MONTH)";
			return jdbcTemplate.queryForObject(sql, new Object[] {now,now},Integer.class);
			
		} catch (Exception e) {
			return 0;
		}
		}

	public double countTongOrderByMonth(String now) {
			String sql="SELECT COUNT(*) FROM ordercat WHERE month(date) = month(?) AND year(date) = year(?)";
			return jdbcTemplate.queryForObject(sql, new Object[] {now,now},Integer.class);
	}

	public double countTongOrderByMonthPre(String now) {
		String sql="SELECT COUNT(*) FROM ordercat WHERE month(date) = month(? - INTERVAL 1 MONTH) AND year(date) = year(? - INTERVAL 1 MONTH)";
		return jdbcTemplate.queryForObject(sql, new Object[] {now,now},Integer.class);
		
	}

	public double countAmountProSellByMonth(String now) {
		try {
			String sql="SELECT SUM(amount) FROM orderdetail os INNER JOIN ordercat oc ON os.id_ordercat = oc.id_order WHERE month(date) = month(?) AND year(date) = year(?)";
			return jdbcTemplate.queryForObject(sql, new Object[] {now,now},Integer.class);
		} catch (Exception e) {
			return 0;
		}
	}

	public double countPreAmountProSellByMonth(String now) {
		try {
			String sql="SELECT SUM(amount) FROM orderdetail os INNER JOIN ordercat oc ON os.id_ordercat = oc.id_order WHERE month(date) = month(? - INTERVAL 1 MONTH) AND year(date) = year(? - INTERVAL 1 MONTH)";
			return jdbcTemplate.queryForObject(sql, new Object[] {now,now},Integer.class);
		
		} catch (Exception e) {
			return 0;
		}
	}

	public int getMoneyOfOrderByDay(String now, int i) {
		try {
			String sql="SELECT SUM(tongtien) FROM ordercat WHERE day(date) = ? AND month(date) = month(?) AND year(date) = year(?)";
			return jdbcTemplate.queryForObject(sql, new Object[] {i,now,now},Integer.class);
		} catch (Exception e) {
			return 0;
		}
		
	}

	public int countOrderIsNotSeen() {
		String sql="SELECT COUNT(*) FROM ordercat WHERE confirm = false";
		return jdbcTemplate.queryForObject(sql,Integer.class);
	}

	public int getMoneyOfOrderByMonth(String now, int i) {
		try {
			String sql="SELECT SUM(tongtien) FROM ordercat WHERE month(date) = ? AND year(date) = year(?)";
			return jdbcTemplate.queryForObject(sql, new Object[] {i,now},Integer.class);
		} catch (Exception e) {
			return 0;
		}
	}

	
}
