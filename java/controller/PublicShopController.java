package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.function.ObjDoubleConsumer;

import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;
import javax.swing.text.AbstractDocument.BranchElement;

import org.apache.velocity.runtime.directive.Break;
import org.mvel2.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.util.matcher.OrRequestMatcher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Defines.Defines;
import Defines.MailDefine;
import model.bean.Address;
import model.bean.Blog;
import model.bean.Cat;
import model.bean.Color;
import model.bean.Comment;
import model.bean.Contact;
import model.bean.Coupon;
import model.bean.District;
import model.bean.Favorite;
import model.bean.Image;
import model.bean.Mail;
import model.bean.Order;
import model.bean.OrderDetail;
import model.bean.Product;
import model.bean.ProductColor;
import model.bean.ProductSize;
import model.bean.Province;
import model.bean.Users;
import model.bean.ViewBlog;
import model.bean.Ward;
import model.dao.AddressDao;
import model.dao.AmountProDao;
import model.dao.BlogDao;
import model.dao.CatDao;
import model.dao.ColorDao;
import model.dao.CommentDao;
import model.dao.ContactDao;
import model.dao.CouponDao;
import model.dao.FoodNutriDao;
import model.dao.ImageDao;
import model.dao.OrderDao;
import model.dao.PaymentDao;
import model.dao.ProDao;
import model.dao.ProductColorDao;
import model.dao.ProductSizeDao;
import model.dao.UserDAO;
import util.SlugUtil;
import util.StringUtil;
import util.function;

@Controller
@SuppressWarnings("unchecked")
public class PublicShopController {
	
@Autowired
private ProDao proDao;
@Autowired
private CatDao catDao;
@Autowired
private ImageDao imageDao;
@Autowired
private ProductColorDao productColorDao;
@Autowired
private ProductSizeDao productSizeDao;
@Autowired
private BlogDao blogDao;
@Autowired
private CommentDao commentDao;
@Autowired
private UserDAO userDao;
@Autowired
private ColorDao colorDao;
@Autowired
private CouponDao couponDao;

@Autowired
private AddressDao addressDao; 
@Autowired
private OrderDao orderDao; 

@Autowired
private AmountProDao amountProDao;
@Autowired
Service.MailService MailService;
@Autowired
private PaymentDao paymentDao;
@Autowired
private ContactDao contactDao;

@Autowired
private FoodNutriDao foodNutriDao;
@Autowired
private SlugUtil slugUtil;


int i =0;
@ModelAttribute
public void addcommonObject(ModelMap modelMap,HttpSession session) {
	List<Cat> listCat = catDao.getallCat();
	List<Cat> listCat1 = catDao.getallCat();
	ArrayList<Cat> listcatbeaty = new ArrayList<Cat>();
	//làm đẹp cat bằng đệ quy 
	
	modelMap.addAttribute("listCat", listCat1);
	getcatwithbeaty(listCat, listcatbeaty, "", 0);
	modelMap.addAttribute("listcatbeaty", listcatbeaty);
	int countPro = 0;
	if(session.getAttribute("listCart")!=null) {
		List<OrderDetail> listCart = (ArrayList<OrderDetail>) session.getAttribute("listCart");
		for (OrderDetail orderDetail : listCart) {
			countPro+=orderDetail.getAmount();
		}
	}
	modelMap.addAttribute("countCart", countPro);
	modelMap.addAttribute("slugUtil", slugUtil);
}

//hàm làm đẹp cat
		public void getcatwithbeaty(List<Cat> list,ArrayList<Cat> listResult,String str, int parent_id) {
			for (Cat cat : list) {
				if (cat.getId_parent() == parent_id) {
					cat.setNamec(str+cat.getNamec());
					listResult.add(cat);
					getcatwithbeaty(list,listResult,str+"|--->",cat.getId_cat());
				}
			}
		}

@RequestMapping("")
public String index(ModelMap modelMap) {
	List<Image> listimage = new ArrayList<Image>();
	List<Image> list  = imageDao.getallImage();
	List<Integer> id = new ArrayList<Integer>();
	for (Image image : list) {
		if(!id.contains(image.getId_product())) {
			listimage.add(image);
			id.add(image.getId_product());
		}
	}
	//SHOW NEW BLOG
	List<Blog> listBlog = blogDao.getBlogforPublic(0, 4);
	for (Blog blog : listBlog) {
		blog.setContent(SlugUtil.substringWord(blog.getContent(), 190));
	}
	//COUNT COMMENT
		Map<Integer, Integer> mapComment = new HashMap<Integer, Integer>();
		for (Blog blog : listBlog) {
			int count = commentDao.countCommentbyIdBlog(blog.getId_blog());
			mapComment.put(blog.getId_blog(), count);
		}
	//show product best seller
		List<Product> listProductBestSeller =  proDao.getlistProductBestSeller(0);
		modelMap.addAttribute("listProductBestSeller", listProductBestSeller);
	List<Product> listMostDiscountProduct = proDao.getpromuchDiscount(0);
	modelMap.addAttribute("listMostDiscountProduct",listMostDiscountProduct);
	modelMap.addAttribute("listBlog",listBlog);
	modelMap.addAttribute("listimage", listimage);
	modelMap.addAttribute("mapComment", mapComment);
	modelMap.addAttribute("listnewpro", proDao.getproductbyOffsetPublic(0));
	modelMap.addAttribute("listProductAlmostOver", proDao.getlistProductAlmostOver(0));
	return "public.index";
}
@RequestMapping(value = {"/blogs","/blogs/{i}"})
public String pageBlog(@RequestParam(value ="search",required = false) String search,@RequestParam(value = "sort", required = false) String sort,@PathVariable(value = "i", required = false) Integer i, ModelMap modelMap) {
	if(i == null || i < 1) {
		i = 1;
	}
	int offset = (i-1)*Defines.ROW_COUNT;
	List<Blog> listBlog = null;
	//SEARCHING...
	if(search == null || search.trim().equals("")) {
		search = "";
	}else if(!search.trim().equals("")){
		modelMap.addAttribute("Search", search);
	}
	//SORT BLOG
	if(sort == null) {
		sort = "newBlog";
		listBlog = blogDao.getallBlog(offset,search);
	}else {
		if(sort.equals("newBlog")) {
			listBlog = blogDao.getallBlog(offset,search);
		}else if(sort.equals("mostView")) {
			listBlog = blogDao.getallblogmostView(offset,search);
		}else if(sort.equals("mostComment")) {
			listBlog = blogDao.getallblogmostComment(offset,search);
		}else {
			//CHECK ERROR AND RETURN DEFAULT
			listBlog = blogDao.getallBlog(offset,search);
			sort = "newBlog";
		}
	}
	//CHANGE CONTENT
		for (Blog blog : listBlog) {
			blog.setContent(SlugUtil.substringWord(blog.getContent(), 150));
		}
	//COUNT COMMENT
	Map<Integer, Integer> mapComment = new HashMap<Integer, Integer>();
	for (Blog blog : listBlog) {
		int count = commentDao.countCommentbyIdBlog(blog.getId_blog());
		mapComment.put(blog.getId_blog(), count);
	}
	//PAGINATION
	int pageMin = 1;
	int pageMax = 1;
	int totalBlog = blogDao.countBlog(search);
	int totalPage =(int) Math.ceil((float) totalBlog/Defines.ROW_COUNT);
	if(i > totalPage) {
		i =totalPage;
	}
	int pageMiddle = (int) Math.ceil((float) Defines.RANGE/2);
	if(totalPage < Defines.RANGE) {
		pageMin = 1;
		pageMax = totalPage;
	}else {
		pageMin = i - pageMiddle + 1;
		pageMax = i + pageMiddle - 1;
		if(pageMin < 1) {
			pageMin = 1;
			pageMax = Defines.RANGE;
		}
		else if(pageMax >totalPage ) {
			pageMax = totalPage;
			pageMin = totalPage - Defines.RANGE;
			if(pageMin == 0) pageMin = 1;
		}
	}
	//
	modelMap.addAttribute("Sort", sort);
	modelMap.addAttribute("MapComment", mapComment);	
	modelMap.addAttribute("listBlog", listBlog);
	modelMap.addAttribute("pageMin", pageMin);
	modelMap.addAttribute("pageMax", pageMax);
	modelMap.addAttribute("curPage", i);
	return "public.blog.index";
}
@RequestMapping("/blogs/{nameblog}/{id}")
public String pageDetailBlog(@PathVariable(value = "id") int id_blog,HttpSession session,ModelMap modelMap,HttpServletResponse response
		,HttpServletRequest request) {
	//COUNT VIEW WITH COOKIE
	//SET COOKIE TIMEOUT IS 30 MINUTE
	Cookie cookie = null;
	Cookie cookies[] =request.getCookies();
	boolean check =false;
	boolean checklike =false;
	for (int i = 0; i < cookies.length; i++) {
        cookie = cookies[i];
        if(cookie.getName().equals("view"+id_blog) && cookie.getValue().equals(""+id_blog)) {
        	check =true;
        }
        if(cookie.getName().equals("Like"+id_blog)) {
        	checklike =true;
        }
    }
	
	if(checklike) {
		modelMap.addAttribute("haveLike", "OK");
	}
	
	if(!check) {
		Cookie cooki = new Cookie("view"+id_blog, ""+id_blog);
		cooki.setMaxAge(60);
		response.addCookie(cooki);
		blogDao.upViewBlogID(id_blog);
		//ADD DATA TO TABLE VIEWBLOG
		LocalDate now = LocalDate.now();
		if(blogDao.checkViewBlogIsHaveViewer(now,id_blog) == null) {
			ViewBlog objvb = new ViewBlog(0, id_blog, 1, now.toString());
			blogDao.addViewBlogByView(objvb);
		}else {
			int id_viewBlog = blogDao.checkViewBlogIsHaveViewer(now,id_blog).getAmount();
			blogDao.updateViewBlogByView(id_viewBlog);
		}
		//
	}
	//count comment
	int count = commentDao.countCommentbyIdBlog(id_blog);
	modelMap.addAttribute("count_comment", count);
	modelMap.addAttribute("objBlog", blogDao.getobjBlogbyID(id_blog));
	modelMap.addAttribute("listCommentFather", commentDao.getallcommentBlogFather(id_blog));
	modelMap.addAttribute("listCommentSon", commentDao.getallcommentBlogSon(id_blog));
	modelMap.addAttribute("listUser", userDao.getallUser());
	
	
	
	return "public.blog.detail";
}

@RequestMapping(value = "/blogs/comment",method = RequestMethod.POST)
public String processCommentBlog(@RequestParam("content") String content, @RequestParam("id_parent") int id_parent,
		@RequestParam("id_blog") int id_blog,HttpSession session,ModelMap modelMap) {
	
		if(session.getAttribute("userInfo")==null) {
			modelMap.addAttribute("errorNotLogin", "Bạn chưa đăng nhập , Vui lòng đăng nhập để bình luận");
		}else {
			Users user = (Users)session.getAttribute("userInfo");
			int id_user = user.getId_user();
			Comment obj = new Comment(0, id_user, 0, id_blog, content,"", id_parent, 0,true);
			commentDao.addComment(obj);
		}
		modelMap.addAttribute("objBlog", blogDao.getobjBlogbyID(id_blog));
		modelMap.addAttribute("listCommentFather", commentDao.getallcommentBlogFather(id_blog));
		modelMap.addAttribute("listCommentSon", commentDao.getallcommentBlogSon(id_blog));
		modelMap.addAttribute("listUser", userDao.getallUser());
	return "ajax.addcomment.blog";
}

//hàm lấy danh sách list con
	public void getchildCat(List<Cat> list,ArrayList<Cat> listcon, int parent_id) {
		for (Cat cat : list) {
			if (cat.getId_parent() == parent_id) {
				// cho danh sach con vao list
				listcon.add(cat);
				// gọi lại hàm
				getchildCat(list,listcon, cat.getId_cat());
			}
		}
	}
@RequestMapping(value = { "/san-pham/danh-muc/{id}","/san-pham/danh-muc/{id}/{i}"})
public String productdetail(ModelMap modelMap,@PathVariable("id") int id_cat,
		@PathVariable(value = "i", required = false) Integer i,@RequestParam(value = "search",required = false) String search,
		@RequestParam(value = "slidefrom",required = false) String slidefrom,@RequestParam(value = "slideto",required = false) String slideto,
		@RequestParam(value = "sort",required = false) String sort) {
	if(i ==null||i < 1) {
		i = 1;
	}
	if(search == null || search.trim().equals("")) {
		search="";
	}
	int from = -1;
	int to = -1;
	if(slidefrom !=null && slideto != null) {
		//CONVERT TO INT 
		System.out.println(slidefrom);
		System.out.println(slideto);
		from = Integer.parseInt(slidefrom.replace(".", ""));
		to = Integer.parseInt(slideto.replace(".", ""));
		//change
		if(from > to) {
			int a =0 ;
			a = from;
			from = to;
			to = a;
		}
		modelMap.addAttribute("from", from);
		modelMap.addAttribute("to", to);
	}
	//SORT
	String sqlsort = "";
	if(sort != null) {
		if(sort.equals("newItem")) {
			sqlsort="ORDER BY id_pro DESC";
		}
		else if(sort.equals("bestSell")) {
			sqlsort="ORDER BY tong DESC";
		}
		else if(sort.equals("bestSale")) {
			sqlsort="AND giakm > 0 ORDER BY (100-(giakm*100)/gia) DESC";
		}
		else if(sort.equals("lowPrice")) {
			sqlsort="ORDER BY (CASE WHEN giakm = 0 THEN gia ELSE giakm END) ASC";
		}
		else if(sort.equals("highPrice")) {
			sqlsort="ORDER BY (CASE WHEN giakm = 0 THEN gia ELSE giakm END) DESC";
			
		}else {
			sqlsort="";
		}
		
	}
	
	int offset = ((i-1)*Defines.ROW_COUNT);
	//List<Product> listpro = proDao.getproductincatbyoffset(offset,id_cat);
	List<Cat> listAllCat = catDao.getallCat();
	//GET ALL LIST CAT CHILD (IF HAVE) OF id_cat
	ArrayList<Cat> listChild = new ArrayList<Cat>();
	getchildCat(listAllCat,listChild,id_cat);
	//ADD id_cat to  listChild
	listChild.add(new Cat(id_cat, "", 0));
	//GET ALL PRODUCT HAVE id_cat in listChild
	//List<Product> listProChild = new ArrayList<Product>();

	List<Product> list = proDao.getallProductbyidCat(listChild,search,from,to,sqlsort,offset);
	
	//GET LIST PAGINATION
	List<Product> listProPagination = new ArrayList<Product>();
//	int count = 0;
//	for (Product product : listProChild) {
//			if(count >= (i-1)*Defines.ROW_COUNT && count < i*Defines.ROW_COUNT) {
//				listProPagination.add(product);
//			}
//			count ++;
//		}
	//PAGINATION
		int pageMin = 1;
		int pageMax = 1;
		int totalPro = proDao.countallProductbyidCat(listChild,search,from,to,sqlsort,offset);
		int totalPage =(int) Math.ceil((float) totalPro/Defines.ROW_COUNT);
		if(i > totalPage) {
			i =totalPage;
		}
		
		int pageMiddle = (int) Math.ceil((float) Defines.RANGE/2);
		if(totalPage < Defines.RANGE) {
			pageMin = 1;
			pageMax = totalPage;
		}else {
			pageMin = i - pageMiddle + 1;
			pageMax = i + pageMiddle - 1;
			if(pageMin < 1) {
				pageMin = 1;
				pageMax = Defines.RANGE;
			}
			else if(pageMax >totalPage ) {
				pageMax = totalPage;
				pageMin = totalPage - Defines.RANGE;
				if(pageMin == 0) pageMin = 1;
			}
		}
		modelMap.addAttribute("listimage", imageDao.getallImage1by1());
		modelMap.addAttribute("listproduct", list);
		modelMap.addAttribute("pageMin", pageMin);
		modelMap.addAttribute("pageMax", pageMax);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("totalPro", totalPro);
		modelMap.addAttribute("curPage", i);
		modelMap.addAttribute("search", search);
		modelMap.addAttribute("id_cat", id_cat);
		modelMap.addAttribute("sort", sort);
		modelMap.addAttribute("listColor", colorDao.getallColor());
	return "public.product.index";
}

@RequestMapping(value = "/san-pham/{namesp}/{id}")
public String productDetail(@PathVariable("id") Integer id_product,ModelMap modelMap,HttpSession session) {
	modelMap.addAttribute("objProduct", proDao.getProductbyID(id_product));
	List<Image> listImage = imageDao.getimagebyidProduct(id_product);
	modelMap.addAttribute("listImage", listImage);
	modelMap.addAttribute("objimage", listImage.get(0));
	modelMap.addAttribute("listComment", commentDao.getallcommentProductFatherbyID(id_product));
	modelMap.addAttribute("listCommentSon", commentDao.getallcommentProductSonbyID(id_product));
	modelMap.addAttribute("listColor", colorDao.getallcolorofProduct(id_product));
	modelMap.addAttribute("listSize",productSizeDao.getsizebyProduct(id_product));
	
	int id_cat = proDao.getProductbyID(id_product).getId_cat();
	List<Cat> listAllCat = catDao.getallCat();
	//GET ALL LIST CAT CHILD (IF HAVE) OF id_cat
	ArrayList<Cat> listChild = new ArrayList<Cat>();
	getchildCat(listAllCat,listChild,id_cat);
	//ADD id_cat to  listChild
	listChild.add(new Cat(id_cat, "", 0));
	
	
	modelMap.addAttribute("listProRelate",proDao.getListProRelate(listChild,id_product,3));
	
	modelMap.addAttribute("listimage", imageDao.getallImage1by1());
	modelMap.addAttribute("listUser", userDao.getallUser());
	modelMap.addAttribute("numberrating", commentDao.getnumberRatingofProduct(id_product));
	
	if(session.getAttribute("userInfo")!=null) {
		Users obj = (Users) session.getAttribute("userInfo");
		if(proDao.checkHaveLikeProduct(obj.getId_user(), id_product)!=null) {
			modelMap.addAttribute("haveLike", "OK");
		}
	}
	
	
	return "public.product.detail";
}

@RequestMapping(value = "/san-pham/rating",method = RequestMethod.POST)
public void rating(@RequestParam("rate") int rate,@RequestParam("id_product") int id_product,
		@RequestParam("textrating") String textRating,HttpSession session,ModelMap modelMap,HttpServletResponse response) {
	PrintWriter out =null;
	try {out = response.getWriter();} catch (IOException e1) {e1.printStackTrace();}
	Users obj = null;
	if(session.getAttribute("userInfo")!=null) {
		obj = (Users) session.getAttribute("userInfo");
	}
	if(obj == null) {
		try {
			throw new Exception();
		}catch (Exception e) {
			response.setStatus(400);
			//out.write("Tên tài khoản đã có người sử dụng");
			return;
		}
	}else {
		//kiểm tra user đã mua sản phẩm chưa có thì mới cho bình luận
		
		
		//ADD COMMENT
		Comment objComment = new Comment(0, obj.getId_user(), id_product, 0, textRating, "", 0,rate,true);
		int process = commentDao.addComment(objComment);
		//RECALCULATION
		
		//PHẦN XỬ LÍ SAU KHI ĐƯỢC ADMIN PHÊ DUYỆT
		float medium_rating  = commentDao.getMediumratingofProduct(id_product);
		int m_rating = Math.round(medium_rating);
		proDao.addMediumRating(m_rating,id_product);
		////////////////////
		
		if(process > 0) {
			out.print("<div class=\"alert alert-success\">\r\n" + 
					"BẠN ĐÃ GỬI ĐÁNH GIÁ THÀNH CÔNG, CHỜ XÉT DUYỆT ĐỂ HIỂN THỊ!\r\n" + 
					"</div>");
		}else {
			out.print("<div class=\"alert alert-danger\">CÓ LỖI TRONG QUÁ TRÌNH GỬI</div>");
		}
	}
}


@RequestMapping(value = "/addCart",method = RequestMethod.POST)
public void addtocart(@RequestParam("mau") int id_color,@RequestParam("size") String namesize,
		@RequestParam("id_pro") int id_product,@RequestParam("amount") int amount,HttpSession session,ModelMap modelMap,
		HttpServletResponse response) {
		PrintWriter out =null;
		try {out = response.getWriter();} catch (IOException e1) {e1.printStackTrace();}
	
		List<OrderDetail> listCart = (ArrayList<OrderDetail>) session.getAttribute("listCart");
		OrderDetail obj = new OrderDetail(0, id_product, 0, id_color,0, namesize, amount);
		if(listCart == null) {
			listCart = new ArrayList<OrderDetail>();
		}
		//CHECK IF SIZE,AND COLOR,ID EQUALS THEN ADD AMOUNT
		if(listCart.size() == 0) {
			if(!checkHaveEnoughAmount(obj).equals("")) {
				//kiểm tra số lượng khi đưa vô giỏ hàng
				try {
					throw new Exception();
					}catch (Exception e) {
					response.setStatus(400);
					out.write(checkHaveEnoughAmount(obj));
					return;
					}
			}
			listCart.add(obj);
		}else {
			boolean check = false;
			for (OrderDetail orderDetail : listCart) {
				if(orderDetail.getId_color()==id_color && orderDetail.getSize().equals(namesize)
						&&orderDetail.getId_product() == id_product) {
					int sl = orderDetail.getAmount() + amount;
					check = true;
					//kiểm tra 
					if(!checkHaveEnoughAmount(obj,sl).equals("")) {
						response.setStatus(400);
						out.write(checkHaveEnoughAmount(obj,sl));
						return;
					}
					orderDetail.setAmount(sl);
				}else {
					if(!checkHaveEnoughAmount(obj).equals("")) {
						response.setStatus(400);
						out.write(checkHaveEnoughAmount(obj));
						return;
					}
				}
			}
			
			if(check == false) {
				listCart.add(obj);
			}
		}
		
		session.setAttribute("listCart", listCart);
}

//HAM LAY CAC GIA TRI TINH TOAN TRONG GIO HANG
public Map<String, Double> getCartSubtotal(List<OrderDetail> listCart){
	double TongTamTinh = 0;
	double GiamGia = 0;
	double ThanhTien = 0;
	double GiamGiaCuopon = 0;
	Product objProduct = null;
	Map<String, Double> listcartSub = new HashMap<String, Double>();
	//XỬ LÍ
			Set<Coupon> listCodeSale = new HashSet<Coupon>();
			List<Integer> keyCode = new ArrayList<Integer>();
			for (OrderDetail orderDetail : listCart) {
				objProduct = proDao.getProductbyID(orderDetail.getId_product());
				if(orderDetail.getId_salecode() > 0) {
					Coupon objCoupon =  couponDao.getCuoponbyID(orderDetail.getId_salecode());
					//add list coupon
					if(!keyCode.contains(objCoupon.getId_salecode())) {
						listCodeSale.add(objCoupon);
						keyCode.add(objCoupon.getId_salecode());
					}
					GiamGiaCuopon = GiamGiaCuopon + orderDetail.getAmount()*(objCoupon.getPercent()*objProduct.getGia()/100);
				}
				TongTamTinh = TongTamTinh + objProduct.getGia()*orderDetail.getAmount();
				if(objProduct.getGiakm() > 0) {
					GiamGia = GiamGia + ((objProduct.getGia() - objProduct.getGiakm())*orderDetail.getAmount());
				}
			}
			
			ThanhTien = TongTamTinh - GiamGia - GiamGiaCuopon;
			
		listcartSub.put("ThanhTien", ThanhTien);
		listcartSub.put("TongTamTinh", TongTamTinh);
		listcartSub.put("GiamGia", GiamGia);
		listcartSub.put("GiamGiaCuopon", GiamGiaCuopon);
	
	return listcartSub;
}

@RequestMapping(value = "/updateCountCart",method = RequestMethod.POST)
public void updateCountCart(HttpSession session,HttpServletResponse response) {
	PrintWriter out = null;
	try {
		out = response.getWriter();
	} catch (Exception e) {
		// TODO: handle exception
	}
	int countPro = 0;
	List<OrderDetail> listCart = (ArrayList<OrderDetail>) session.getAttribute("listCart");
	for (OrderDetail orderDetail : listCart) {
		countPro+=orderDetail.getAmount();
	}
	out.print("<div class=\"vung1\"><span id=\"vung2\">"+countPro+"</span></div>");
}

@RequestMapping("/checkout/cart")
public String checkoutCart(HttpSession session,ModelMap modelMap) {
	List<OrderDetail> listCart = new ArrayList<OrderDetail>();
	double TongTamTinh = 0;
	double GiamGia = 0;
	double ThanhTien = 0;
	double GiamGiaCuopon = 0;
	if(session.getAttribute("listCart")!=null) {
	listCart = (ArrayList<OrderDetail>) session.getAttribute("listCart");
		if(listCart.size() > 0) {
		List<Color> listColor = colorDao.getallColor();
		List<Product> listProduct = new ArrayList<Product>();
		List<Integer> list = new ArrayList<Integer>();
		List<Image> listimage = new ArrayList<Image>();
		Product objProduct = null;
		//LẤY DANH SAHCSC SẢN PHẨM CÓ TRONG CART
		for (OrderDetail orderDetail : listCart) {
			if (!list.contains(orderDetail.getId_product())) {
				objProduct = proDao.getProductbyID(orderDetail.getId_product());
				listProduct.add(objProduct);
				list.add(orderDetail.getId_product());
			}
			
		}
		for (Integer id_product : list) {
			listimage.add(imageDao.getallImage1by1byIdproduct(id_product));
		}
		//XỬ LÍ
		Set<Coupon> listCodeSale = new HashSet<Coupon>();
		List<Integer> keyCode = new ArrayList<Integer>();
		for (OrderDetail orderDetail : listCart) {
			objProduct = proDao.getProductbyID(orderDetail.getId_product());
			if(orderDetail.getId_salecode() > 0) {
				Coupon objCoupon =  couponDao.getCuoponbyID(orderDetail.getId_salecode());
				//add list coupon
				if(!keyCode.contains(objCoupon.getId_salecode())) {
					listCodeSale.add(objCoupon);
					keyCode.add(objCoupon.getId_salecode());
				}
				GiamGiaCuopon = GiamGiaCuopon + orderDetail.getAmount()*(objCoupon.getPercent()*objProduct.getGia()/100);
			}
			TongTamTinh = TongTamTinh + objProduct.getGia()*orderDetail.getAmount();
			if(objProduct.getGiakm() > 0) {
				GiamGia = GiamGia + ((objProduct.getGia() - objProduct.getGiakm())*orderDetail.getAmount());
			}
		}
		
		ThanhTien = TongTamTinh - GiamGia - GiamGiaCuopon;
		if(listCodeSale.size() > 0) {
			modelMap.addAttribute("listCodeSale", listCodeSale);
		}
		
		
		modelMap.addAttribute("ThanhTien", Math.round(ThanhTien));
		modelMap.addAttribute("TongTamTinh", Math.round(TongTamTinh));
		modelMap.addAttribute("GiamGia", Math.round(GiamGia));
		modelMap.addAttribute("GiamGiaCuopon", Math.round(GiamGiaCuopon));
		modelMap.addAttribute("listProduct", listProduct);
		modelMap.addAttribute("listImage", listimage);
		modelMap.addAttribute("listColor", listColor);
		modelMap.addAttribute("listCarts", listCart);
		}
		
	}
	return "public.checkout.cart";
}

@RequestMapping("/addCoupon")
public void addcuopon(@RequestParam("namecuopon") String namecodesale,HttpServletResponse response,HttpSession session,ModelMap modelMap) {
	PrintWriter out =null;
	try {out = response.getWriter();} catch (IOException e1) {e1.printStackTrace();}
	//KIỂM TRA XEM CODE CÒN HẠN OR CÓ HAY KHÔNG 
	if(couponDao.getCuoponbyName(namecodesale) == null || couponDao.checkexpiryDate(namecodesale) == null) {
		try {
			throw new Exception();
		}catch (Exception e) {
			response.setStatus(400);
			out.write("<span style='color:red'>Mã không tồn tại hoặc đã hết hạn sử dụng</span>");
			return;
		}
	}
	//KIỂM TRA CÓ ĐÚNG SẢN PHẨM K
	Coupon objCuopon = couponDao.getCuoponbyName(namecodesale);
	List<OrderDetail> listCart =null;
	if(session.getAttribute("listCart")!=null) {
		listCart = (ArrayList<OrderDetail>) session.getAttribute("listCart");
		boolean checkProductSale = true;
		for (OrderDetail orderDetail : listCart) {
			if (orderDetail.getId_product() == objCuopon.getId_product()) {
				checkProductSale = false;
					//couponDao.delamount(objCuopon.getId_salecode());
					orderDetail.setId_salecode(objCuopon.getId_salecode());
			}
		}
		int id_product = couponDao.getCuoponbyName(namecodesale).getId_product();
		String namePro = proDao.getProductbyID(id_product).getNamepro();
		if(checkProductSale) {
			try {
				throw new Exception();
			}catch (Exception e) {
				
				response.setStatus(400);
				out.write("<span style='color:red'>Mã này chỉ áp dụng cho sản phẩm: <strong>"+namePro+"</strong></span>");
				return;
			}
		}else {
			//UPDATE LIST CART NEW
			session.setAttribute("listCart", listCart);
		}
	}
}

@RequestMapping("/delcart")
public String delcart(@RequestParam("id") int id_orderdetail,HttpSession session,HttpServletRequest request) {
	String referer = request.getHeader("Referer");

	ArrayList<OrderDetail> listCart =new ArrayList<OrderDetail>();
	if(session.getAttribute("listCart")!=null) {
		listCart = (ArrayList<OrderDetail>) session.getAttribute("listCart");
		if(listCart.size() > 0) {
			for (int i = 0; i < listCart.size(); i++) {
				if(i == id_orderdetail) {
					listCart.remove(i);
					break;
				}
			}
			session.setAttribute("listCart", listCart);
		}
	}
	return "redirect:"+referer;
}

@RequestMapping(value = "/changeCart",method = RequestMethod.POST)
public void changecart(@RequestParam("id") int id_orderdetail,@RequestParam("soluong") int soluong,HttpSession session,
		HttpServletResponse response,ModelMap modelMap) {
	PrintWriter out =null;
	try {out = response.getWriter();} catch (IOException e1) {e1.printStackTrace();}
	ArrayList<OrderDetail> listCart =new ArrayList<OrderDetail>();
	if(session.getAttribute("listCart")!=null) {
		listCart = (ArrayList<OrderDetail>) session.getAttribute("listCart");
		if(listCart.size() > 0) {
			for (int i = 0; i < listCart.size(); i++) {
				if(i == id_orderdetail) {
					if(!checkHaveEnoughAmount(listCart.get(i),soluong).equals("")) {
						response.setStatus(400);
						//chuyển dữ liệu về kèm số lượng cũ để set lại input
						out.write(checkHaveEnoughAmount(listCart.get(i),soluong)+"^"+listCart.get(i).getAmount());
						//modelMap.addAttribute("sluong", listCart.get(i).getAmount());
						return;
					}
					listCart.get(i).setAmount(soluong);
				}
			}
			session.setAttribute("listCart", listCart);
		}
	}
	//modelMap.addAttribute("alertCoupon", "hohohohohhohohohhoh");
	out.print("hhoho");
}

@RequestMapping("/checkout")
public String checkout(HttpSession session,ModelMap modelMap) {
	
	List<Product> listProduct = new ArrayList<Product>();
	List<Integer> list = new ArrayList<Integer>();
	ArrayList<OrderDetail> listCart =null;
	if(session.getAttribute("listCart")!=null) {
		listCart = (ArrayList<OrderDetail>) session.getAttribute("listCart");
		if(listCart.size() > 0) {
			modelMap.addAttribute("loginDone", "disabled");
			modelMap.addAttribute("addressDone", "disabled");
			modelMap.addAttribute("ttDone", "disabled");
			Product objProduct =null;
			for (OrderDetail orderDetail : listCart) {
				if(!list.contains(orderDetail.getId_product())) {
					objProduct = proDao.getProductbyID(orderDetail.getId_product());
					listProduct.add(objProduct);
					list.add(orderDetail.getId_product());
				}
				
			}
			//LẤY THANH TIEN TRONG HAM MAP
			 Map<String, Double> listCartSub = getCartSubtotal(listCart);
			 for (Map.Entry<String, Double> entry : listCartSub.entrySet()) {
				 if(entry.getKey().equals("ThanhTien")) {
					 modelMap.addAttribute("ThanhTien", Math.round(entry.getValue()));
				 }
		          //  System.out.println(entry.getKey() + " " + entry.getValue());
		        }
			modelMap.addAttribute("listProduct", listProduct);
			modelMap.addAttribute("listColor", colorDao.getallColor());
			//KIỂM TRA ĐÃ ĐĂNG NHẬP HAY CHƯA 
			//IF IS LOGIN REDIRECT TO ADDRESSS
			//ELSE REDIRECT TO LOGIN
			if(session.getAttribute("userInfo")!=null) {
				Users user = (Users) session.getAttribute("userInfo");
				//CHECK HAVE ADDRESS
				List<Address> listAddress = addressDao.getlistAddressbyUser(user.getId_user());
				modelMap.addAttribute("listAddress", listAddress);
				modelMap.addAttribute("listdistrict",  addressDao.getallDistrict());
				modelMap.addAttribute("listward",  addressDao.getallWard());
				modelMap.addAttribute("listprovince", addressDao.getallProvince());
				modelMap.addAttribute("AddressDefaul", addressDao.getAddressDefaulbyIdUser(user.getId_user()));
				//modelMap.addAttribute("distrist", addressDao.getallProvince());
				modelMap.addAttribute("loginDone", "complete");
				modelMap.addAttribute("addressDone", "active");
				return "public.checkout.address";
			}else {
				modelMap.addAttribute("loginDone", "active");
				return "public.checkout.login";
			}
		}
	}
	return "redirect:/";
}

//Phần thêm địa chỉ

@RequestMapping(value = "/getDistrict",method = RequestMethod.POST)
public void getDistrict(@RequestParam("id") int id_province,HttpServletResponse response) {
	List<District> listDistrict = addressDao.getDistrictbyidProvince(id_province);
	PrintWriter out =null;
	try {out = response.getWriter();} catch (IOException e1) {e1.printStackTrace();}
	String str = "<option selected disabled value=\"0\">Quận/Huyện</option>";
	for (District district : listDistrict) {
		str += "<option value=\""+district.getId()+"\">"+district.get_name()+"</option>";
	}
	out.print(str);
}

@RequestMapping(value = "/getWard",method = RequestMethod.POST)
public void getWard(@RequestParam("id") int id_district,HttpServletResponse response) {
	List<Ward> listWard = addressDao.getWardbyidDistrict(id_district);
	PrintWriter out =null;
	try {out = response.getWriter();} catch (IOException e1) {e1.printStackTrace();}
	String str = "<option selected disabled value=\"0\">Phường/Xã</option>";
	for (Ward ward : listWard) {
		str += "<option value=\""+ward.getId()+"\">"+ward.get_prefix()+" "+ward.get_name()+"</option>";
	}
	out.print(str);
}

@RequestMapping(value = "/editAddress",method = RequestMethod.POST)
public String editAddress(@RequestParam("id") int id_address,ModelMap modelMap) {
		/*
		 * PrintWriter out =null; try {out = response.getWriter();} catch (IOException
		 * e1) {e1.printStackTrace();}
		 */
	Address obj = new Address();
	List<Province> listProvince = addressDao.getallProvince();
	List<District> listDistrict = new ArrayList<District>();
	List<Ward> listWard = new ArrayList<Ward>();
	if(id_address > 0) {
		obj = addressDao.getobjaddressbyidAddress(id_address);
		listDistrict = addressDao.getDistrictbyidProvince(obj.getId_province());
		listWard = addressDao.getWardbyidDistrict(obj.getId_district());
	}
	
	modelMap.addAttribute("obj", obj);
	modelMap.addAttribute("id_Address", id_address);
	modelMap.addAttribute("listdistrict", listDistrict);
	modelMap.addAttribute("listward",  listWard);
	modelMap.addAttribute("listprovince",listProvince);
//	String strWard = "";
//	String strDistrict = "";
//	String strProvince = "";
	
//	for (Province province : listProvince) {
//		String strActive ="";
//		if(province.getId() selected== obj.getId_province()) {
//			strActive ="selected";
//		}else {
//			strActive ="";
//		}
//		strProvince += "<option "+strActive+" value=\""+province.getId()+"\">"+province.get_name()+"</option>";
//	}
//	
//	for (District district : listDistrict) {
//		String strActive ="";
//		if(district.getId() == obj.getId_district()) {
//			strActive ="selected";
//		}else {
//			strActive ="";
//		}
//		strDistrict += "<option "+strActive+" value=\""+district.getId()+"\">"+district.get_name()+"</option>";
//	}
//	for (Ward ward : listWard) {
//		String strActive ="";
//		if(ward.getId() == obj.getId_ward()) {
//			strActive ="selected";
//		}else {
//			strActive ="";
//		}
//		strWard += "<option "+strActive+" value=\""+ward.getId()+"\">"+ward.get_prefix()+" "+ward.get_name()+"</option>";
//	}
	
	
	return "ajax.addaddress";
	
}
@RequestMapping(value = "/addeditAddress",method = RequestMethod.POST)
public String addnewAddress(@ModelAttribute("Address") Address address,HttpServletRequest request,HttpSession session,RedirectAttributes ra) {
	Users objuser =null;
	if(session.getAttribute("userInfo")!=null) {
		objuser = (Users) session.getAttribute("userInfo");
	}else{
		return "redirect:/";
	}
	String referer = request.getHeader("Referer");

	//nếu chưa có address thì mặc định là defaul;
	if(addressDao.getlistAddressbyUser(objuser.getId_user()) == null || addressDao.getlistAddressbyUser(objuser.getId_user()).size() == 0){
		address.setDefaul(true);
	}
	address.setId_user(objuser.getId_user());
	//KIỂM TRA NẾU ID LÊN = 0 THÌ LÀ THÊM
	//CÒN  != 0 LÀ SỬA
	if(address.getId_address() == 0) {
		if (addressDao.getlistAddressbyUser(objuser.getId_user()).size() >2) {
			ra.addFlashAttribute("error", "Bạn chỉ có thể thêm tối đa 3 địa chỉ");
		}else {
			addressDao.removeallDefaul(objuser.getId_user());
			addressDao.addAddress(address);
		}
	}else {
		addressDao.removeallDefaul(objuser.getId_user());
		addressDao.editAddress(address);
	}	
	return "redirect:"+referer;
}

@RequestMapping(value = "/chuyenhuong",method = RequestMethod.POST)
public String chuyenhuong1(@RequestParam("id") int id_address,RedirectAttributes ra,HttpSession session) {
	Users objuser = null;
	if(session.getAttribute("userInfo")!=null) {
		objuser = (Users)session.getAttribute("userInfo");
	}
	//tính toán phí vận chuyển qua các vùng thông qua bên thứ 3
	//Proship.vn
	//ship bình thường
	int payship = 1;
	
	
	
	Order objOrder = new Order(0, objuser.getId_user(), false, 1, false, "", payship,0, id_address, 0);
	session.setAttribute("Order", objOrder);
	
	//chuyển dữ bằng redirect
	ra.addAttribute("id", id_address); 
	return "redirect:/payment";
}
//	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxTESST CHUYỂN DỮ LIEUJ BẰNG REDIRECT : IT WORK ! :))
//@RequestMapping(value = "/chuyenhuong2")
//public String chuyenhuong2(@RequestParam("alo") String alo,RedirectAttributes ra) {
//
//	System.out.println(alo);
//	
//	return "redirect:/";
//}

@RequestMapping("/payment")
public String payment(@RequestParam(value = "id",required = false) Integer id_address,HttpSession session,ModelMap modelMap) {
	if(id_address == null) {
		return "redirect:/checkout";
	}
	Users objuser = null;
	if(session.getAttribute("userInfo")!=null) {
		objuser = (Users)session.getAttribute("userInfo");
	}
	if(objuser == null) {
		return "redirect:/";
	}
	Address objA =  addressDao.getobjaddressbyidAddress(id_address);
	modelMap.addAttribute("loginDone", "complete");
	modelMap.addAttribute("addressDone", "complete");
	modelMap.addAttribute("ttDone", "active");
	//FORMAT MONEY
	Locale locale = new Locale("vn", "VN");      
	NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
	//
	List<Product> listProduct = new ArrayList<Product>();
	List<Integer> list = new ArrayList<Integer>();
	ArrayList<OrderDetail> listCart =null;
	if(session.getAttribute("listCart")!=null) {
		listCart = (ArrayList<OrderDetail>) session.getAttribute("listCart");
		if(listCart.size() > 0) {
			int payShip = 0;

			Order objOrder = (Order) session.getAttribute("Order");
			//tính payship
			String codeProvince = 	addressDao.getProvincebyID(objA.getId_province()).get_code();
			String[] listVung2 = Defines.VUNG2.split(",");
			boolean isVung2 = false;
			for (int i = 0; i < listVung2.length; i++) {
				if(codeProvince.equals(listVung2[i])) {
					//KIỂM TRA CHỌN NORMAL OR FAST
					if(objOrder.getPayship() == 1) {
						payShip = Defines.GIAVUNG2NORMAL;
						modelMap.addAttribute("alertVungN", "Địa chỉ của bạn thuộc VÙNG 2 phí ship bình thường: "+currencyFormatter.format(Defines.GIAVUNG2NORMAL));
					}else if(objOrder.getPayship() == 2) {
						payShip = Defines.GIAVUNG2FAST;
						modelMap.addAttribute("alertVungF", "Địa chỉ của bạn thuộc VÙNG 2 phí ship nhanh: "+currencyFormatter.format(Defines.GIAVUNG2FAST));
					}
					isVung2 =true;
				}
			}
			if(!isVung2) {
				if(objOrder.getPayship() == 1) {
					payShip = Defines.GIAVUNG13NORMAL;
					modelMap.addAttribute("alertVungN", "Địa chỉ của bạn thuộc VÙNG 1-3 phí ship bình thường: "+currencyFormatter.format(Defines.GIAVUNG13NORMAL));
				}else if(objOrder.getPayship() == 2) {
					payShip = Defines.GIAVUNG13FAST;
					modelMap.addAttribute("alertVungF", "Địa chỉ của bạn thuộc VÙNG 1-3 phí ship nhanh: "+currencyFormatter.format(Defines.GIAVUNG13FAST));
				}
			}
			modelMap.addAttribute("payShip", payShip);
			
			//
			//địa chỉ
			String address = objA.getNamestreet()+", "+addressDao.getWardbyID(objA.getId_ward()).get_name()+", "+addressDao.getDistrictbyID(objA.getId_district()).get_name()+", "+addressDao.getProvincebyID(objA.getId_province()).get_name();
			
			
			modelMap.addAttribute("Address", address);
			Product objProduct = null;
			for (OrderDetail orderDetail : listCart) {
				if(!list.contains(orderDetail.getId_product())) {
					objProduct = proDao.getProductbyID(orderDetail.getId_product());
					listProduct.add(objProduct);
					list.add(orderDetail.getId_product());
				}
				
			}
			//LẤY THANH TIEN TRONG HAM MAP
			double thanhtien = 0;
			 Map<String, Double> listCartSub = getCartSubtotal(listCart);
			 for (Map.Entry<String, Double> entry : listCartSub.entrySet()) {
				 if(entry.getKey().equals("ThanhTien")) {
					 modelMap.addAttribute("ThanhTien", Math.round(entry.getValue()));
					 thanhtien = Math.round(entry.getValue());
				 }
		          //  System.out.println(entry.getKey() + " " + entry.getValue());
		        }
			modelMap.addAttribute("listProduct", listProduct);
			modelMap.addAttribute("listColor", colorDao.getallColor());
			double VNDtoUSD =(double) Math.round( ((thanhtien + payShip)/function.get1USDtoVND())*100  )/100;
			modelMap.addAttribute("VNDtoUSD", VNDtoUSD);
		}else {
			return "redirect:/";
		}
	}
	
	return "public.checkout.payment";
}

@RequestMapping(value = "/changeTransport",method = RequestMethod.POST)
public String changeTransport(@RequestParam("id") int id_payShip,HttpServletRequest request,HttpSession session) {
	String referer = request.getHeader("Referer");
	Order objOrder = (Order) session.getAttribute("Order");
	objOrder.setPayship(id_payShip);
	session.setAttribute("Order", objOrder);
	return "redirect:"+ referer;
}

public String checkHaveEnoughAmount(OrderDetail orderDetail) {
	String erorr = "";
	if(amountProDao.isHaveEnoughAmount(orderDetail)==null) {
		String namesp = proDao.getProductbyID(orderDetail.getId_product()).getNamepro();
		int soluong = 0;
		String mau = "";
		if(amountProDao.getobjbyID(orderDetail)!=null) { soluong = amountProDao.getobjbyID(orderDetail).getAmount();}
		if(colorDao.getobjColorbyID(orderDetail.getId_color())==null) {
			mau= "Không";
		}else {
			mau = colorDao.getobjColorbyID(orderDetail.getId_color()).getNamecolor();
		}
		erorr = "Sản phẩm "+namesp+" màu:"+mau+" Size:"+orderDetail.getSize()+" Chỉ còn "+soluong+" Sản phẩm\r\n";
	}
	return erorr;
}

public String checkHaveEnoughAmount(OrderDetail orderDetail,int sl) {
	String erorr = "";
	if(amountProDao.isHaveEnoughAmount(orderDetail,sl)==null) {
		String namesp = proDao.getProductbyID(orderDetail.getId_product()).getNamepro();
		int soluong = 0;
		String mau = "";
		if(amountProDao.getobjbyID(orderDetail)!=null) { soluong = amountProDao.getobjbyID(orderDetail).getAmount();}
		if(colorDao.getobjColorbyID(orderDetail.getId_color())==null) {
			mau= "Không";
		}else {
			mau = colorDao.getobjColorbyID(orderDetail.getId_color()).getNamecolor();
		}
		erorr = "Sản phẩm "+namesp+" màu:"+mau+" Size:"+orderDetail.getSize()+" Chỉ còn "+soluong+" Sản phẩm\r\n";
	}
	return erorr;
}


@RequestMapping(value = "/checkPayPal",method = RequestMethod.POST)
public void checkPaypal(@RequestParam("id") int id,HttpSession session,HttpServletResponse response) {
	PrintWriter out =null;
	try {out = response.getWriter();} catch (IOException e1) {e1.printStackTrace();}
	Order objorder = (Order) session.getAttribute("Order");
	objorder.setId_payment(2);
	objorder.setPaid(true);
	out.print("OK");
}
@RequestMapping(value = "/checkout/success")
public String orderSuccess(HttpSession session,RedirectAttributes ra,ModelMap modelMap,HttpServletResponse response) {
	
	if(session.getAttribute("Order")==null || session.getAttribute("listCart")==null 
			|| session.getAttribute("userInfo")== null) {
		return "redirect:/";
	}
	Order objOrder = (Order) session.getAttribute("Order");
	List<OrderDetail> objOrderDe = (List<OrderDetail>) session.getAttribute("listCart");
	Users objUser = (Users) session.getAttribute("userInfo");
	if(objOrderDe.size() == 0) {
		return "redirect:/";
	}
	if(objUser.getId_user() != objOrder.getId_user()) {
		return "redirect:/";
	}
	//
	int id_order = orderDao.addOrder(objOrder);
	//
	Locale locale = new Locale("vn", "VN");      
	NumberFormat c = NumberFormat.getCurrencyInstance(locale);
	
	String namePro = "";
	int TongTam = 0;
	int GiamGia = 0;
	int TongTamTinh = 0;
	int GiamGiaCuopon = 0;
	String sanpham = "";
	for (OrderDetail orderDetail : objOrderDe) {
		int giamgia = 0;
		int dongia =0;
		int tongtam = 0;
		//
		orderDetail.setId_ordercat(id_order);
		orderDao.addOrderDetail(orderDetail);
		amountProDao.reduceAmountProduct(orderDetail);
		//mail
		Product objPro = proDao.getProductbyID(orderDetail.getId_product());
		namePro = objPro.getNamepro();
		tongtam= objPro.getGia() * orderDetail.getAmount();
		TongTam +=tongtam;
		if(objPro.getGiakm() > 0) {
			giamgia = (objPro.getGia() - objPro.getGiakm()) * orderDetail.getAmount();
			GiamGia += giamgia;
		}
		if(orderDetail.getId_salecode() > 0) {
			Coupon objCoupon =  couponDao.getCuoponbyID(orderDetail.getId_salecode());
			GiamGiaCuopon = GiamGiaCuopon + orderDetail.getAmount()*(objCoupon.getPercent()*objPro.getGia()/100);
		}
		sanpham +="		  <tr>\r\n" + 
				"		    <td >"+namePro+"</td>\r\n" + 
				"		    <td style=''>"+orderDetail.getAmount()+"</td>\r\n" + 
				"			<td style=''>"+c.format(tongtam)+"</td>\r\n" + 
				"			<td style=''>"+c.format(giamgia)+"</td>\r\n" + 
				"			<td style=''>"+c.format((tongtam-giamgia))+"</td>\r\n" + 
				"		  </tr>\r\n" ;
	}
	//-----
	session.removeAttribute("listCart");
	session.removeAttribute("Order");
	//send mail
	LocalDateTime now = LocalDateTime.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    String formatDateTime = now.format(formatter);
    
	String tggiaohang = "";
	String htgiaohang = "";
	int payShip = 0;
	if (objOrder.getPayship() == 1) {
		tggiaohang = "3-4 ngày";
		htgiaohang = "giao hàng chậm";
	}
	if (objOrder.getPayship() == 2) {
		tggiaohang = "2-3 ngày";
		htgiaohang = "giao hàng nhanh";
	}
	TongTamTinh = TongTam - GiamGia - GiamGiaCuopon;
	Address objA =  addressDao.getobjaddressbyidAddress(objOrder.getSendaddress());
	String address = objA.getNamestreet()+", "+addressDao.getWardbyID(objA.getId_ward()).get_name()+", "+addressDao.getDistrictbyID(objA.getId_district()).get_name()+", "+addressDao.getProvincebyID(objA.getId_province()).get_name();
	String codeProvince = 	addressDao.getProvincebyID(objA.getId_province()).get_code();
	
	String[] listVung2 = Defines.VUNG2.split(",");
	boolean isVung2 = false;
	for (int i = 0; i < listVung2.length; i++) {
		if(codeProvince.equals(listVung2[i])) {
			//KIỂM TRA CHỌN NORMAL OR FAST
			if(objOrder.getPayship() == 1) {
				payShip = Defines.GIAVUNG2NORMAL;
			}else if(objOrder.getPayship() == 2) {
				payShip = Defines.GIAVUNG2FAST;
			}
			isVung2 =true;
		}
	}
	if(!isVung2) {
		if(objOrder.getPayship() == 1) {
			payShip = Defines.GIAVUNG13NORMAL;
		}else if(objOrder.getPayship() == 2) {
			payShip = Defines.GIAVUNG13FAST;
		}
	}

	String body = " <h4>Cảm ơn quý khách đã đặt hàng tại Shop</h4>\r\n" + 
			"        <p style='font-weight: bold;'>THÔNG TIN ĐƠN HÀNG #"+id_order+"  Ngày: "+formatDateTime+"</p><hr>\r\n" + 
			"        <p style='font-weight: bold;'>Thông tin thanh toán</p>\r\n" + 
			"        <p>Tên: "+objUser.getName()+"</p>\r\n" + 
			"        <p>Email: "+objUser.getEmail()+"</p>\r\n" + 
			"        <p>SĐT: "+objUser.getPhone()+"</p><hr>\r\n" + 
			"        \r\n" + 
			"        <p style='font-weight: bold;'>Địa chỉ giao hàng</p>\r\n" + 
			"        <p>Địa chỉ:"+address+"</p><hr>\r\n" + 
			"       	<p>Phương thức thanh toán: "+paymentDao.getpaymentbyID(objOrder.getId_payment()).getNamepayment()+"</p>\r\n" + 
			"        <p>Thời gian giao hàng sự kiến:"+htgiaohang+"-"+tggiaohang+" </p>\r\n" + 
			"        <p style='font-weight: bold;'>CHI TIẾT ĐƠN HÀNG</p><hr>\r\n" + 
			"        <table style='border-collapse:collapse;border:1px solid black;'>\r\n" + 
			"		  <tr style='background-color:skyblue;'>\r\n" + 
			"		    <th style='border:1px solid black;'>Sản phẩm</th>\r\n" + 
			"		    <th style='border:1px solid black;'>Số lượng</th>\r\n" + 
			"		    <th style='border:1px solid black;'>Đơn giá</th>\r\n" + 
			"		    <th style='border:1px solid black;'>Giảm giá</th>\r\n" + 
			"		    <th style='border:1px solid black;'>Tổng tạm</th>\r\n" + 
			"		  </tr>\r\n" + 
					sanpham+
			"		  <tr>\r\n" + 
			"		    <td style='text-align: right;' colspan='4'>Tổng giá trị sản phẩm chưa giảm</td>\r\n" + 
			"		    <td >"+c.format(TongTam)+"</td>\r\n" + 
			"		  </tr>\r\n" + 
			"		  \r\n" + 
			"		  <tr>\r\n" + 
			"		    <td style='text-align: right;' colspan='4'>Giảm giá</td>\r\n" + 
			"		    <td style='' >-"+c.format(GiamGia)+"</td>\r\n" + 
			"		  </tr>\r\n" + 
			"		  <tr>\r\n" + 
			"		    <td style='text-align: right;' colspan='4'>Giảm giá bằng mã</td>\r\n" + 
			"		    <td style='' >-"+c.format(GiamGiaCuopon)+"</td>\r\n" + 
			"		  </tr>\r\n" + 
			"		  <tr>\r\n" + 
			"		    <td style='text-align: right;' colspan='4'>Chi phí vận chuyển</td>\r\n" + 
			"		    <td style='' >"+c.format(payShip)+"</td>\r\n" + 
			"		  </tr>\r\n" + 
			"		  <tr>\r\n" + 
			"		    <td style='text-align: right;font-weight: bold;' colspan='4'>Tổng giá trị đơn hàng</td>\r\n" + 
			"		    <td style='font-weight: bold;' >"+c.format((TongTamTinh+payShip))+"</td>\r\n" + 
			"		  </tr>\r\n" + 
			"		</table>";
	
	//set tonng tien cho don hang
	int tt = TongTamTinh+payShip;
		orderDao.setTongtienfoOrder(tt,id_order);
	
	 Mail mail = new Mail();
     mail.setSendtoMail(objUser.getEmail());
     mail.setSubject("SHOP: THƯ XÁC NHẬN ĐƠN HÀNG");
     mail.setMailBody(body);
     boolean check =  MailService.sendEmail(mail,true);
	 //modelMap.addAttribute("bodymail", body);
     
     if(check) {
    	 modelMap.addAttribute("alertmail", "Chúng tôi đã gửi mail ");
     }else {
    	 modelMap.addAttribute("alertmail", "Chúng tôi có vấn đề trong việc gửi mail ");
     }
	
	 modelMap.addAttribute("id_order", id_order);
	 return "public.checkout.success";
	
	
}


@RequestMapping("/customer/infor")
public String customerInfor(ModelMap modelMap) {
	modelMap.addAttribute("actInfo", "class='active'");
	return "public.customer.infor";
}

@RequestMapping(value = "/customer/infor",method = RequestMethod.POST)
public void customerEdit(@ModelAttribute("user") Users obj,HttpSession session,HttpServletResponse response) {
	PrintWriter out =null;
	try {out = response.getWriter();} catch (Exception e) {}
	Users objUser = (Users) session.getAttribute("userInfo");
	if(obj.getPassword().equals("")) {
		obj.setPassword(objUser.getPassword());
	}else {
		obj.setPassword(StringUtil.md5(obj.getPassword()));
	}
	obj.setNameImage(function.getNameImage(obj.getName()));
	obj.setRoles_id(objUser.getRoles_id());
	obj.setEnable(objUser.isEnable());
	obj.setId_user(objUser.getId_user());
	int process = userDao.editUser(obj);
	if(process > 0) {
		out.print("<div class=\"alert alert-success\">Cập nhật tài khoản thành công</div>");
	}else {
		out.print("<div class=\"alert alert-danger\">Có lỗi xảy ra</div>");
	}
	
}

@RequestMapping("/customer/history")
public String indexCustomerHistory(HttpSession session,ModelMap modelMap) {
	
	modelMap.addAttribute("actOrder", "class='active'");
	Users objUser = null;
	if(session.getAttribute("userInfo") !=null) {
		objUser = (Users) session.getAttribute("userInfo");
	}else {
		return "redirect:/";
	}
	
	
	List<Order> listOrder = orderDao.getOrderByIdUser(objUser.getId_user());
	List<OrderDetail> listOrderDetail = new ArrayList<OrderDetail>();
	for (Order objOrder : listOrder) {
		List<OrderDetail> listO = orderDao.getlistOrderDetailByIdOrder(objOrder.getId_order());
		listOrderDetail.addAll(listO);
	}
			
	List<Integer> listId = new ArrayList<Integer>();
	List<Product> listPro = new ArrayList<Product>();
	for (OrderDetail obj : listOrderDetail) {
		if(!listId.contains(obj.getId_product())) {
			listPro.add(proDao.getProductbyID(obj.getId_product()));
			listId.add(obj.getId_product());
		}
	}
	modelMap.addAttribute("listColor", colorDao.getallColor());
	modelMap.addAttribute("listPro", listPro);
	modelMap.addAttribute("listOrder", listOrder);
	modelMap.addAttribute("listOrderDetail", listOrderDetail);
	return "public.customer.historyorder";
}

@RequestMapping("customer/order/view/{id}")
public String customerviewOrder(@PathVariable("id") Integer id_order,HttpSession session,ModelMap modelMap){
	modelMap.addAttribute("actOrder", "class='active'");
	Users objUser = null;
	if(session.getAttribute("userInfo") !=null) {
		objUser = (Users) session.getAttribute("userInfo");
	}else {
		return "redirect:/";
	}
	Order objOrder = orderDao.getobjOrderByIdorder(id_order);
	List<OrderDetail> objOrderDe = orderDao.getlistOrderDetailByIdOrder(id_order);
	Locale locale = new Locale("vn", "VN");      
	NumberFormat c = NumberFormat.getCurrencyInstance(locale);
	
	String namePro = "";
	int TongTam = 0;
	int GiamGia = 0;
	int TongTamTinh = 0;
	int GiamGiaCuopon = 0;
	String sanpham = "";
	for (OrderDetail orderDetail : objOrderDe) {
		int giamgia = 0;
		int dongia =0;
		int tongtam = 0;
		//mail
		Product objPro = proDao.getProductbyID(orderDetail.getId_product());
		namePro = objPro.getNamepro();
		tongtam= objPro.getGia() * orderDetail.getAmount();
		TongTam +=tongtam;
		if(objPro.getGiakm() > 0) {
			giamgia = (objPro.getGia() - objPro.getGiakm()) * orderDetail.getAmount();
			GiamGia += giamgia;
		}
		if(orderDetail.getId_salecode() > 0) {
			Coupon objCoupon =  couponDao.getCuoponbyID(orderDetail.getId_salecode());
			GiamGiaCuopon = GiamGiaCuopon + orderDetail.getAmount()*(objCoupon.getPercent()*objPro.getGia()/100);
		}
		sanpham +="		  <tr>\r\n" + 
				"		    <td >"+namePro+"</td>\r\n" + 
				"		    <td style=''>"+orderDetail.getAmount()+"</td>\r\n" + 
				"			<td style=''>"+c.format(tongtam)+"</td>\r\n" + 
				"			<td style=''>"+c.format(giamgia)+"</td>\r\n" + 
				"			<td style=''>"+c.format((tongtam-giamgia))+"</td>\r\n" + 
				"		  </tr>\r\n" ;
	}
	//send mail
	
    
	String tggiaohang = "";
	String htgiaohang = "";
	int payShip = 0;
	if (objOrder.getPayship() == 1) {
		tggiaohang = "3-4 ngày";
		htgiaohang = "giao hàng chậm";
	}
	if (objOrder.getPayship() == 2) {
		tggiaohang = "2-3 ngày";
		htgiaohang = "giao hàng nhanh";
	}
	TongTamTinh = TongTam - GiamGia - GiamGiaCuopon;
	Address objA =  addressDao.getobjaddressbyidAddress(objOrder.getSendaddress());
	String address = objA.getNamestreet()+", "+addressDao.getWardbyID(objA.getId_ward()).get_name()+", "+addressDao.getDistrictbyID(objA.getId_district()).get_name()+", "+addressDao.getProvincebyID(objA.getId_province()).get_name();
	String codeProvince = 	addressDao.getProvincebyID(objA.getId_province()).get_code();
	
	String[] listVung2 = Defines.VUNG2.split(",");
	boolean isVung2 = false;
	for (int i = 0; i < listVung2.length; i++) {
		if(codeProvince.equals(listVung2[i])) {
			//KIỂM TRA CHỌN NORMAL OR FAST
			if(objOrder.getPayship() == 1) {
				payShip = Defines.GIAVUNG2NORMAL;
			}else if(objOrder.getPayship() == 2) {
				payShip = Defines.GIAVUNG2FAST;
			}
			isVung2 =true;
		}
	}
	if(!isVung2) {
		if(objOrder.getPayship() == 1) {
			payShip = Defines.GIAVUNG13NORMAL;
		}else if(objOrder.getPayship() == 2) {
			payShip = Defines.GIAVUNG13FAST;
		}
	}

	String body = 
			"        <h4 style='font-weight: bold;'>THÔNG TIN ĐƠN HÀNG #"+id_order+"  Ngày: "+objOrder.getDate()+"</h4><hr>\r\n" + 
			"        <p style='font-weight: bold;'>Thông tin thanh toán</p>\r\n" + 
			"        <p>Tên: "+objUser.getName()+"</p>\r\n" + 
			"        <p>Email: "+objUser.getEmail()+"</p>\r\n" + 
			"        <p>SĐT: "+objUser.getPhone()+"</p><hr>\r\n" + 
			"        \r\n" + 
			"        <p style='font-weight: bold;'>Địa chỉ giao hàng</p>\r\n" + 
			"        <p>Địa chỉ:"+address+"</p><hr>\r\n" + 
			"       	<p style='font-weight: bold;'>Phương thức thanh toán: "+paymentDao.getpaymentbyID(objOrder.getId_payment()).getNamepayment()+"</p>\r\n" + 
			"        <p>Thời gian giao hàng sự kiến:"+htgiaohang+"-"+tggiaohang+" </p>\r\n" + 
			"        <p>CHI TIẾT ĐƠN HÀNG</p><hr>\r\n" + 
			"        <table style='border:1px solid black;' class='table'>\r\n" + 
			"		  <tr style='background-color:skyblue;'>\r\n" + 
			"		    <th style='border:1px solid black;'>Sản phẩm</th>\r\n" + 
			"		    <th style='border:1px solid black;'>Số lượng</th>\r\n" + 
			"		    <th style='border:1px solid black;'>Đơn giá</th>\r\n" + 
			"		    <th style='border:1px solid black;'>Giảm giá</th>\r\n" + 
			"		    <th style='border:1px solid black;'>Tổng tạm</th>\r\n" + 
			"		  </tr>\r\n" + 
					sanpham+
			"		  <tr>\r\n" + 
			"		    <td style='text-align: right;' colspan='4'>Tổng giá trị sản phẩm chưa giảm</td>\r\n" + 
			"		    <td >"+c.format(TongTam)+"</td>\r\n" + 
			"		  </tr>\r\n" + 
			"		  \r\n" + 
			"		  <tr>\r\n" + 
			"		    <td style='text-align: right;' colspan='4'>Giảm giá</td>\r\n" + 
			"		    <td style='' >-"+c.format(GiamGia)+"</td>\r\n" + 
			"		  </tr>\r\n" + 
			"		  <tr>\r\n" + 
			"		    <td style='text-align: right;' colspan='4'>Giảm giá bằng mã</td>\r\n" + 
			"		    <td style='' >-"+c.format(GiamGiaCuopon)+"</td>\r\n" + 
			"		  </tr>\r\n" + 
			"		  <tr>\r\n" + 
			"		    <td style='text-align: right;' colspan='4'>Chi phí vận chuyển</td>\r\n" + 
			"		    <td style='' >"+c.format(payShip)+"</td>\r\n" + 
			"		  </tr>\r\n" + 
			"		  <tr>\r\n" + 
			"		    <td style='text-align: right;font-weight: bold;' colspan='4'>Tổng giá trị đơn hàng</td>\r\n" + 
			"		    <td style='font-weight: bold;' >"+c.format((TongTamTinh+payShip))+"</td>\r\n" + 
			"		  </tr>\r\n" + 
			"		</table>";
	
	
	
	modelMap.addAttribute("body", body);
	return "public.customer.vieworder";
}


@RequestMapping(value = "/customer/order/del",method = RequestMethod.POST)
public String delorder(@RequestParam("id_order") int id_order,RedirectAttributes ra) {
	int process = orderDao.delOrder(id_order);
	if(process > 0) {
		orderDao.delOrderdetail(id_order);
		ra.addFlashAttribute("msg", "<div class=\"alert alert-success\">Bạn đã hủy đơn hàng hành công</div>");
	}else{
		ra.addFlashAttribute("msg", "<div class=\"alert alert-danger\">Bạn đã hủy đơn hàng thất bại</div>");
	}
	return "redirect:/customer/history";
}

@RequestMapping(value = "/customer/address")
public String addressCustomer(HttpSession session,ModelMap modelMap) {
	modelMap.addAttribute("actAdd", "class='active'");
	Users objUser = null;
	if(session.getAttribute("userInfo") !=null) {
		objUser = (Users) session.getAttribute("userInfo");
	}else {
		return "redirect:/";
	}
	List<Address> listadd = addressDao.getlistAddressbyUser(objUser.getId_user());
	Map<Integer,String> listAddress = new HashMap<Integer, String>();
	if(listadd != null) {
		for (Address objA : listadd) {
			String address = objA.getNamestreet()+", "+addressDao.getWardbyID(objA.getId_ward()).get_name()+", "+addressDao.getDistrictbyID(objA.getId_district()).get_name()+", "+addressDao.getProvincebyID(objA.getId_province()).get_name();
			listAddress.put(objA.getId_address(), address);
		}
	}
	
	modelMap.addAttribute("listAddress", listAddress);
	return "public.customer.address";
}

@RequestMapping(value = "/customer/adress/add")
public String addAddress(ModelMap modelMap) {
	modelMap.addAttribute("actAdd", "class='active'");
	List<Province> listProvince = addressDao.getallProvince();
	modelMap.addAttribute("listprovince",listProvince);
	return "public.customer.address.add";
}

@RequestMapping(value = "/customer/adress/edit/{id}")
public String addAddress(@PathVariable("id") int id_address,ModelMap modelMap) {
	modelMap.addAttribute("actAdd", "class='active'");
	List<Province> listProvince = addressDao.getallProvince();
	Address obj = addressDao.getobjaddressbyidAddress(id_address);
	List<District> listDistrict = addressDao.getDistrictbyidProvince(obj.getId_province());
	List<Ward> listWard = addressDao.getWardbyidDistrict(obj.getId_district());
	
	modelMap.addAttribute("obj", obj);
	modelMap.addAttribute("id_Address", id_address);
	modelMap.addAttribute("listdistrict", listDistrict);
	modelMap.addAttribute("listward",  listWard);
	modelMap.addAttribute("listprovince",listProvince);
	return "public.customer.address.add";
}


@RequestMapping(value = "/customer/adress/addedit" , method = RequestMethod.POST)
public String addeditAddress(@ModelAttribute("address") Address address, @RequestParam("id_address") int id_address
		,ModelMap modelMap,HttpSession session,RedirectAttributes ra,HttpServletRequest request) {
	Users objUser = (Users) session.getAttribute("userInfo");
	if(id_address == 0) {
		if (addressDao.getlistAddressbyUser(objUser.getId_user()).size() >2) {
			ra.addFlashAttribute("msgAddress", "<div class=\"alert alert-danger\">Bạn chỉ có thể thêm tối đa 3 địa chỉ</div>");
			return "redirect:/customer/address";
		}
		address.setId_user(objUser.getId_user());
		address.setDefaul(false);
		int process = addressDao.addAddress(address);
		if(process > 0) {
			ra.addFlashAttribute("msgAddress", "<div class=\"alert alert-success\">Bạn đã thêm thành công</div>");
		}else {
			ra.addFlashAttribute("msgAddress", "<div class=\"alert alert-danger\">Quá trình thêm thất bại</div>");
		}
	}else {
		//String referer = request.getHeader("Referer");
		
		Address oldAddress= addressDao.getobjaddressbyidAddress(id_address);
		address.setId_user(oldAddress.getId_user());
		address.setDefaul(oldAddress.isDefaul());
		int process =  addressDao.editAddress(address);
		if(process > 0) {
			ra.addFlashAttribute("msgAddress", "<div class=\"alert alert-success\">Bạn đã sửa thành công</div>");
		}else {
			ra.addFlashAttribute("msgAddress", "<div class=\"alert alert-danger\">Quá trình sửa thất bại</div>");
		}
	}
	return "redirect:/customer/address";
}


@RequestMapping("/customer/favorite")
public String favoriteIndex(HttpSession session,ModelMap modelMap) {
	Users obj = null;
	if(session.getAttribute("userInfo")!=null) {
		obj = (Users) session.getAttribute("userInfo");
	}else {
		return "redirect:/";
	}
	
	List<Product> listFavorite =  proDao.getlistfavoritebyuser(obj.getId_user());
	List<Image> listimage = new ArrayList<Image>();
	for (Product objp : listFavorite) {
		Image img = imageDao.getallImage1by1byIdproduct(objp.getId_pro());
		listimage.add(img);
	}
	modelMap.addAttribute("listFavorite", listFavorite);
	modelMap.addAttribute("listimage", listimage);
	modelMap.addAttribute("actFavo", "class='active'");
	return "public.customer.favorite";
}

@RequestMapping("/delfavorite")
public void favoriteIndex(@RequestParam("id_product") int id_product,HttpSession session,HttpServletResponse response) throws IOException {
	Users obj = null;
	if(session.getAttribute("userInfo")!=null) {
		obj = (Users) session.getAttribute("userInfo");
	}
	PrintWriter out = response.getWriter();
	proDao.delFavoriteProduct(obj.getId_user(),id_product);
	out.print("OK");
}




@RequestMapping("/contact")
public String contactindex() {
	
	return "public.contact.index";
}

@RequestMapping(value = "/contact",method = RequestMethod.POST)
public String addContact(@ModelAttribute("contact") Contact contact,RedirectAttributes ra) {
	contact.setView(false);
	int process = contactDao.addContact(contact);
	if(process > 0) {
		ra.addFlashAttribute("msgContact","<div class=\"alert alert-success\">Bạn đã gửi phản hồi thành công, Cảm ơn bạn !</div>");
	}else {
		ra.addFlashAttribute("msgContact","<div class=\"alert alert-danger\">Chúng tôi xin lỗi đã có vấn đề trong việc gửi thông tin !</div>");
	}
	return "redirect:/contact";
}

@RequestMapping("/policy")
public String index() {
	return "public.policy.index";
}

@RequestMapping("/policy/huong-dan")
public String huongdan() {
	return "public.policy.huongdan";
}

@RequestMapping("/policy/dieu-khoan-su-dung")
public String dieukhoansudung() {
	return "public.policy.dieukhoansudung";
}

@RequestMapping("/policy/khieu-nai")
public String khieunai() {
	return "public.policy.khieunai";
}


@RequestMapping("/policy/doi-tra")
public String doitra() {
	return "public.policy.doitra";
}

@RequestMapping("/policy/bao-mat")
public String baomat() {
	return "public.policy.baomat";
}

@RequestMapping("/policy/gioi-thieu")
public String gioithieu() {
	return "public.policy.gioithieu";
}

@RequestMapping("/bodyfat")
public String bodyfat() {
	return "public.bodyfat.index";
}

@RequestMapping("/foodnutrient")
public String foodnutrient(ModelMap modelMap) {
	modelMap.addAttribute("listfoodnutri", foodNutriDao.getListFoodNutri());
	
	return "public.foodnutrient.index";
}

@RequestMapping(value = "/moreViewBLog",method = RequestMethod.POST)
public void moreVIewBlog(@RequestParam("dataRe") int i,HttpServletResponse response,HttpServletRequest request) {
	PrintWriter out = null;
	try {out = response.getWriter();}catch (Exception e) {}
	int offset = (4*i);
	List<Blog> listBlog = blogDao.getBlogforPublic(offset, 4);
	String result = "";
	for (Blog blog : listBlog) {
		//COUNT COMMENT
			int count = commentDao.countCommentbyIdBlog(blog.getId_blog());
		String str = "<div class=\"col-sm-6 col-xs-12\">\r\n" + 
				"								<div class=\"blog-item-2\">\r\n" + 
				"									<div id=\"dataview\" class=\"row\">\r\n" + 
				"										<div class=\"col-md-6 col-xs-12\">\r\n" + 
				"											<div class=\"blog-image\">\r\n" + 
				"												<a href=\""+request.getContextPath()+"/blogs/detail/"+blog.getId_blog()+"\"><img width=\"262px\" height=\"212px\" src=\""+request.getContextPath()+"/files/"+blog.getImage()+"\" alt=\""+blog.getImage()+"\"></a>\r\n" + 
				"											</div>\r\n" + 
				"										</div>\r\n" + 
				"										<div class=\"col-md-6 col-xs-12\">\r\n" + 
				"											<div class=\"blog-desc\">\r\n" + 
				"												<ul class=\"blog-meta\">\r\n" + 
				"													<li>\r\n" + 
				"														<a href=\"#\"><i style=\"color:red\" class=\"zmdi zmdi-favorite\"></i>"+blog.getCount_view()+" lượt xem</a>\r\n" + 
				"													</li>\r\n" + 
				"													<li>"+
				"														<a href=\"#\"><i style=\"color:green\" class=\"zmdi zmdi-comments\"></i>"+count+" Bình luận</a>\r\n" + 
				"													</li>\r\n" + 
				"												</ul>		\r\n" + 
				"												<h5 class=\"blog-title-2\"><a href=\""+request.getContextPath()+"/blogs/detail/"+blog.getId_blog()+"\">"+blog.getNamebl()+"</a></h5>\r\n" + 
				"												<p >"+SlugUtil.substringWord(blog.getContent(), 150) +"</p>\r\n" + 
				"												<div class=\"read-more\">\r\n" + 
				"													<a href=\""+request.getContextPath()+"/blogs/detail/"+blog.getId_blog()+"\">Read more</a>\r\n" + 
				"												</div>\r\n" + 
				"											</div>\r\n" + 
				"										</div>\r\n" + 
				"									</div>\r\n" + 
				"								</div>\r\n" + 
				"							</div>\r\n" + 
				"							";
		result+=str;
	}
	out.print("<div class=\"row\">"+result+"</div>");
}

@RequestMapping(value = "/like",method = RequestMethod.POST)
public void like(@RequestParam(value =  "id_pro",required = false) String id_pro,
		@RequestParam(value = "id_blog",required = false) String id_blog,HttpServletResponse response,HttpServletRequest request,
		@RequestParam(value = "id_user",required = false) String id_userr) {
	
	PrintWriter out = null;
	try {
		out= response.getWriter();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if(id_blog == null) {
			int id_product = Integer.parseInt(id_pro);
			int id_user = Integer.parseInt(id_userr);
			if(proDao.checkHaveLikeProduct(id_user,id_product)==null) {
				Favorite obj  = new Favorite(0, id_user, 0, id_product);
				proDao.addFavoriteProduct(obj);
				out.print("<a style=\"background-color: #ff7f00;color: white;\" href=\"javascript:void(0)\" onclick=\"addFavorite("+id_product+","+id_user+")\" title=\"Wishlist\"><i class=\"zmdi zmdi-favorite\"></i></a>");
			}else {
				int id_favorite = proDao.checkHaveLikeProduct(id_user,id_product).getId_favorite();
				proDao.removeFavorite(id_favorite);
				out.print("<a class=\"\" href=\"javascript:void(0)\" onclick=\"addFavorite("+id_product+","+id_user+")\" title=\"Wishlist\"><i class=\"zmdi zmdi-favorite\"></i></a>");
			}
		}else if(id_pro == null) {
			int id_blogg = Integer.parseInt(id_blog);
			Cookie cookie = null;
			Cookie cookiLike = null;
	        Cookie[] cookies = request.getCookies();
	        for (int i = 0; i < cookies.length; i++) {
	        	cookie = cookies[i];
				if(cookie.getName().equals("Like"+id_blogg)) {
					cookiLike = cookie;
				}
			}
			if(cookiLike !=null) {
				cookiLike.setMaxAge(0);
		        response.addCookie(cookiLike);
				blogDao.downLikeBlog(id_blogg);
				int count_like = Integer.parseInt(blogDao.getobjBlogbyID(id_blogg).getCount_like());
				out.print("<a class=\"btn btn-primary\" onclick=\"addFavorite("+id_blogg+")\" href=\"javascript:void(0)\" title=\"Like\"><span style=\"color:black\">"+count_like+"</span>| Like <i class=\"zmdi zmdi-favorite\"></i></a>");
				
			}else {
				Cookie like = new Cookie("Like"+id_blogg, "OK");
				like.setMaxAge(120);
				response.addCookie(like);
				blogDao.upLikeBlog(id_blogg);
				int count_like = Integer.parseInt(blogDao.getobjBlogbyID(id_blogg).getCount_like());
				out.print("<a class=\"btn btn-primary\" onclick=\"addFavorite("+id_blogg+")\" href=\"javascript:void(0)\" title=\"Like\"><span style=\"color:black\">"+count_like+"</span>| Like <i style=\"color:red\" class=\"zmdi zmdi-favorite\"></i></a>");
				
			}
		}
}

@RequestMapping("/404")
public String page404() {
	return "page.404";
}
}
