package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.instrument.classloading.jboss.JBossLoadTimeWeaver;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import Defines.Defines;
import model.bean.Cat;
import model.bean.Favorite;
import model.bean.Product;

@Repository
public class ProDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<Product> getproductbyOffset(int offset, String search){
		String sql ="SELECT * FROM product as p INNER JOIN category as c ON p.id_cat = c.id_cat WHERE id_pro LIKE ? OR namepro LIKE ? ORDER BY id_pro DESC LIMIT ?,?";
		return jdbcTemplate.query(sql,new Object[] {"%"+search+"%","%"+search+"%",offset,Defines.ROW_COUNT},new BeanPropertyRowMapper<Product>(Product.class)); 
	}
	
	public List<Product> getproductbyOffsetPublic(int offset){
		String sql ="SELECT * FROM product as p INNER JOIN category as c ON p.id_cat = c.id_cat ORDER BY id_pro DESC LIMIT ?,?";
		return jdbcTemplate.query(sql,new Object[] {offset,Defines.ROW_COUNT_PUBLIC},new BeanPropertyRowMapper<Product>(Product.class)); 
	}
	
	public List<Product> getpromuchDiscount(int offset){
		String sql ="SELECT * FROM product as p INNER JOIN category as c ON p.id_cat = c.id_cat WHERE giakm > 0 ORDER BY (100-(giakm*100)/gia) DESC LIMIT ?,?";
		return jdbcTemplate.query(sql,new Object[] {offset,Defines.ROW_COUNT_PUBLIC},new BeanPropertyRowMapper<Product>(Product.class)); 
	}

	
	
	public int delproductbyidCat(int id) {
		String sql ="DELETE FROM product WHERE id_cat = ?";
		return jdbcTemplate.update(sql,new Object[]{id});
	}

	public int countProduct(String search) {
		String sql ="SELECT COUNT(*) FROM product WHERE id_pro LIKE ? OR namepro LIKE ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {"%"+search+"%","%"+search+"%"}, Integer.class);
	}
	
	public int countProductbyCat(int id_cat) {
		String sql ="SELECT COUNT(*) FROM product WHERE id_cat = ?";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public int addproduct(final Product obj) {
		final String sql = "INSERT INTO product(id_cat,namepro,gia,giakm,decription,soluong,medium_rating) VALUE(?,?,?,?,?,0,0)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		int a = jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				
				PreparedStatement ps =(PreparedStatement) con.prepareStatement( sql, Statement.RETURN_GENERATED_KEYS);
				ps.setInt(1, obj.getId_cat());
				ps.setString(2, obj.getNamepro());
				ps.setInt(3, obj.getGia());
				ps.setInt(4, obj.getGiakm());
				ps.setString(5, obj.getDecription());
				return ps;
				
			}
		},keyHolder);
		
		return keyHolder.getKey().intValue();
	}

	public Product getProductbyID(int id) {
		String sql ="SELECT * FROM product WHERE id_pro = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {id}, new BeanPropertyRowMapper<Product>(Product.class));
	}

	public int editProduct(Product product) {
		// TODO Auto-generated method stub
		String sql = "UPDATE product SET id_cat=?,namepro = ?,gia =?,giakm = ?,decription = ?,soluong = ? WHERE id_pro = ?";
		return jdbcTemplate.update(sql,new Object[] {product.getId_cat(),product.getNamepro(),product.getGia(),product.getGiakm(),product.getDecription(),product.getSoluong(),product.getId_pro()});
		
	}

	public int delprobyID(int id_product) {
		String sql ="DELETE FROM product WHERE id_pro = ?";
		return jdbcTemplate.update(sql,new Object[]{id_product});
	}

	public Object getlistProductAlmostOver(int offset) {
		String sql ="SELECT * FROM product as p INNER JOIN category as c ON p.id_cat = c.id_cat ORDER BY soluong ASC LIMIT ?,?";
		return jdbcTemplate.query(sql,new Object[] {offset,Defines.ROW_COUNT_PUBLIC},new BeanPropertyRowMapper<Product>(Product.class)); 
	}

	public List<Product> getproductincatbyoffset(int offset,int id_cat) {
		String sql ="SELECT * FROM product as p INNER JOIN category as c ON p.id_cat = c.id_cat WHERE id_cat = ? ORDER BY id_pro DESC LIMIT ?,?";
		return jdbcTemplate.query(sql,new Object[] {id_cat,offset,Defines.ROW_COUNT},new BeanPropertyRowMapper<Product>(Product.class));
	}

	public Product getProductByidcat(int id_cat) {
		String sql ="SELECT * FROM product WHERE id_cat = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {id_cat}, new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getallProductbyidCat(ArrayList<Cat> listChild,String search, int from, int to, String sqlsort, int offset) {
		String sqlCat = "(id_cat ="+listChild.get(listChild.size()-1).getId_cat();
		if(listChild.size() >=2) {
			for (int i = 0; i < listChild.size()-1; i++) {
				sqlCat+=" OR id_cat="+listChild.get(i).getId_cat();
			}
		}
		sqlCat+=")";
		String sqlfromto ="";
		String sqlsearch = " AND namepro LIKE \"%"+search+"%\"";
		if(from != -1 && to != -1) {
			sqlfromto = " AND ((giakm > 0 AND giakm >="+from+" AND giakm <"+to+") OR (giakm = 0 AND gia >= "+from+" AND gia <="+to+"))";
		}
		String sql ="SELECT * FROM product as p left join "
				+ "(SELECT id_product,SUM(amount) as tong FROM orderdetail as o "
				+ "INNER JOIN product as p ON o.id_product = p.id_pro GROUP BY id_product) as t "
				+ "ON p.id_pro = t.id_product "
				+ "WHERE "+sqlCat+sqlsearch+ sqlfromto+" "+sqlsort+" LIMIT ?,?";
		//System.out.println(sql);
		
		
		return jdbcTemplate.query(sql,new Object[] {offset,Defines.ROW_COUNT},new BeanPropertyRowMapper<Product>(Product.class));
	}
	
	public int countallProductbyidCat(ArrayList<Cat> listChild,String search, int from, int to, String sqlsort, int offset) {
		String sqlCat = "(id_cat ="+listChild.get(listChild.size()-1).getId_cat();
		if(listChild.size() >=2) {
			for (int i = 0; i < listChild.size()-1; i++) {
				sqlCat+=" OR id_cat="+listChild.get(i).getId_cat();
			}
		}
		sqlCat+=")";
		String sqlfromto ="";
		String sqlsearch = " AND namepro LIKE \"%"+search+"%\"";
		if(from != -1 && to != -1) {
			sqlfromto = "AND ((giakm > 0 AND giakm >="+from+" AND giakm <"+to+") OR (giakm = 0 AND gia >= "+from+" AND gia <="+to+"))";
		}
		String sql ="SELECT COUNT(*) FROM product "
				+"as p left join "
				+ "(SELECT id_product,SUM(amount) as tong FROM orderdetail as o "
				+ "INNER JOIN product as p ON o.id_product = p.id_pro GROUP BY id_product) as t "
				+ "ON p.id_pro = t.id_product "
				+ " WHERE "+sqlCat+sqlsearch+ sqlfromto+" "+sqlsort;
		//System.out.println(sql);
		
		
		return jdbcTemplate.queryForObject(sql,Integer.class);
	}

	public void addMediumRating(int m_rating, int id_product) {
		String sql ="UPDATE product SET medium_rating = ? WHERE id_pro= ?";
		jdbcTemplate.update(sql, new Object[] {m_rating,id_product});
		
	}

	public List<Product> getallProductHaveCoupon() {
		String sql ="SELECT * FROM product as p INNER JOIN salecode as s ON p.id_pro = s.id_product  ORDER BY id_pro DESC";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Product>(Product.class));
	
	}

	public List<Product> getlistProductBestSeller(int offset) {
		// TODO Auto-generated method stub
		String sql = "SELECT id_pro,p.namepro,p.id_cat,p.gia,p.giakm,p.decription,p.soluong,p.medium_rating,SUM(amount) as tong "
				+ "FROM orderdetail as o INNER JOIN"
				+ " product as p ON o.id_product = p.id_pro GROUP BY id_product order by tong DESC limit ?,?";
		return jdbcTemplate.query(sql, new Object[] {offset,Defines.ROW_COUNT_PUBLIC},new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getListProRelate(ArrayList<Cat> listChild, Integer id_product, int soluong) {
		String sqlCat = "(id_cat ="+listChild.get(listChild.size()-1).getId_cat();
		if(listChild.size() >=2) {
			for (int i = 0; i < listChild.size()-1; i++) {
				sqlCat+=" OR id_cat="+listChild.get(i).getId_cat();
			}
		}
		String sql ="SELECT * FROM product WHERE "+sqlCat +") AND id_pro != ? ORDER BY id_pro DESC LIMIT 0,?";
		return jdbcTemplate.query(sql, new Object[] {id_product,soluong},new BeanPropertyRowMapper<Product>(Product.class));
		
	}

	public double countProAddByMonth(String now) {
		String sql ="SELECT SUM(amount) FROM amountproduct as ap INNER JOIN product as p ON ap.id_product = p.id_pro WHERE month(date_created) = month(?) AND year(date_created) = year(?)";
		return jdbcTemplate.queryForObject(sql, new Object[] {now,now},Integer.class);
	}

	public double countPreProAddByMonth(String now) {
		String sql ="SELECT SUM(amount) FROM amountproduct as ap INNER JOIN product as p ON ap.id_product = p.id_pro WHERE month(date_created) = month(? - INTERVAL 1 MONTH) AND year(date_created) = year(? - INTERVAL 1 MONTH)";
		return jdbcTemplate.queryForObject(sql, new Object[] {now,now},Integer.class);
	}

	public List<Product> getlistProductBestSellerByMonth(String now, int offset) {
		String sql = "SELECT id_pro,p.namepro,p.id_cat,p.gia,p.giakm,p.decription,p.soluong,p.medium_rating,SUM(amount) as tong,oc.date "
				+ "FROM orderdetail as o INNER JOIN product as p ON o.id_product = p.id_pro  "
				+ "INNER JOIN ordercat as oc ON oc.id_order = o.id_ordercat "
				+ "WHERE month(date) = month(?) AND year(date) = year(?)"
				+ "GROUP BY id_product order by tong DESC "
				+ "limit ?,?";
		return jdbcTemplate.query(sql, new Object[] {now,now,offset,Defines.ROW_COUNT_PUBLIC},new BeanPropertyRowMapper<Product>(Product.class));
	
	}

	public List<Product> getlistProductBestSellerByYear(String now, int offset) {
		String sql = "SELECT id_pro,p.namepro,p.id_cat,p.gia,p.giakm,p.decription,p.soluong,p.medium_rating,SUM(amount) as tong,oc.date "
				+ "FROM orderdetail as o INNER JOIN product as p ON o.id_product = p.id_pro  "
				+ "INNER JOIN ordercat as oc ON oc.id_order = o.id_ordercat "
				+ "WHERE year(date) = year(?)"
				+ "GROUP BY id_product order by tong DESC "
				+ "limit ?,?";
		return jdbcTemplate.query(sql, new Object[] {now,offset,Defines.ROW_COUNT_PUBLIC},new BeanPropertyRowMapper<Product>(Product.class));
	
	}

	public int addFavoriteProduct(Favorite obj) {
		String sql= "INSERT INTO favorite(id_user,id_product,id_blog) VALUE(?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {obj.getId_user(),obj.getId_product(),obj.getId_blog()});
		
	}

	public Favorite checkHaveLikeProduct(int id_user, int id_product) {
		String sql ="SELECT * FROM favorite WHERE id_user = ? AND id_product = ?";
		try {
			return jdbcTemplate.queryForObject(sql,new Object[] {id_user,id_product}, new BeanPropertyRowMapper<Favorite>(Favorite.class));
			
		} catch (Exception e) {
			return null;
		}
	}

	public int removeFavorite(int id_favorite) {
		String sql ="DELETE FROM favorite WHERE id_favorite = ?";
		return jdbcTemplate.update(sql,new Object[] {id_favorite});
	}

	public List<Product> getlistfavoritebyuser(int id_user) {
		String sql = "SELECT * FROM favorite as f INNER JOIN product as p ON f.id_product = p.id_pro WHERE id_user = ?";
		return jdbcTemplate.query(sql, new Object[] {id_user},new BeanPropertyRowMapper<Product>(Product.class));
	}

	public int delFavoriteProduct(int id_user, int id_product) {
		String sql="DELETE FROM favorite WHERE id_user = ? AND id_product = ?";
		return jdbcTemplate.update(sql,new Object[] {id_user,id_product}); 
	}

	
	
}
