package controller;

import java.security.Principal;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import model.bean.Product;
import model.dao.AddressDao;
import model.dao.AmountProDao;
import model.dao.BlogDao;
import model.dao.CatDao;
import model.dao.ColorDao;
import model.dao.CommentDao;
import model.dao.ContactDao;
import model.dao.CouponDao;
import model.dao.ImageDao;
import model.dao.OrderDao;
import model.dao.PaymentDao;
import model.dao.ProDao;
import model.dao.ProductColorDao;
import model.dao.ProductSizeDao;
import model.dao.UserDAO;


@Controller
@RequestMapping("/admin")
public class AdminIndexController {
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
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap){
		//active
		
		modelMap.addAttribute("userDao", userDao);
		//count đơn hàng
		
		modelMap.addAttribute("numOrderNotSeen", orderDao.countOrderIsNotSeen());
		modelMap.addAttribute("numContactNotSeen", contactDao.countContactIsNotSeen());
	}
	@RequestMapping("")
	public String loginRedirect(Principal principal,HttpSession session,ModelMap modelMap) {
		modelMap.addAttribute("actIndex", "active");
		session.setAttribute("userInfo", userDao.getobjUser(principal.getName()));
		Locale locale = new Locale("vn", "VN");      
		NumberFormat ci = NumberFormat.getCurrencyInstance(locale);
		//Tổng số lượt xem bài viết
		LocalDate now = LocalDate.now();
		//String now = "";
		double countBlog = blogDao.countbyMonthViewAllBlog(now.toString());
		double countBlogPre = blogDao.countPreviousbyMonthViewAllBlog(now.toString());
		float c = (float) Math.round( (1 - countBlog/countBlogPre )*1000)/1000;
		modelMap.addAttribute("valueBlog", countBlog);
		modelMap.addAttribute("countBlogPre", countBlogPre);
		modelMap.addAttribute("PTBlog", c);
		//KHÁCH HÀNG MỚI
		double valueNewCustomer = userDao.countNewCustomer(now.toString());
		double valuePreNewCustomer = userDao.countPreNewCustomer(now.toString());
		float PTUser = (float) Math.round( (1 - valueNewCustomer/valuePreNewCustomer )*1000)/1000;
		modelMap.addAttribute("valueNewCustomer", valueNewCustomer);
		modelMap.addAttribute("PTUser", PTUser);
		//Tổng thu
		double valueOrder = orderDao.countTongTienByMonth(now.toString());
		double valueOrderPre = orderDao.countTongTienByMonthPre(now.toString());
		float PTOrder = (float) Math.round( (1 - valueOrder/valueOrderPre )*1000)/1000;
		modelMap.addAttribute("valueOrder", ci.format(valueOrder));
		modelMap.addAttribute("PTOrder", PTOrder);
		//tổng order
		double valueCountOrder = orderDao.countTongOrderByMonth(now.toString());
		double valueCountOrderPre = orderDao.countTongOrderByMonthPre(now.toString());
		float PTCountOrder = (float) Math.round( (1 - valueCountOrder/valueCountOrderPre )*1000)/1000;
		modelMap.addAttribute("valueCountOrder", valueCountOrder);
		modelMap.addAttribute("PTCountOrder", PTCountOrder);
		//số sản phẩm bnas được trong tháng
		double valueAmountProSell = orderDao.countAmountProSellByMonth(now.toString());
		double valuePreAmountProSell = orderDao.countPreAmountProSellByMonth(now.toString());
		float PTAmountPro = (float) Math.round( (1 - valueAmountProSell/valuePreAmountProSell )*1000)/1000;
		modelMap.addAttribute("valueAmountProSell", valueAmountProSell);
		modelMap.addAttribute("PTAmountPro", PTAmountPro);
		modelMap.addAttribute("now", now);
		//số sản phẩm  được thêm trong tháng
		double valueProAdd = proDao.countProAddByMonth(now.toString());
		double valuePreProAdd = proDao.countPreProAddByMonth(now.toString());
		float PTProAdd = (float) Math.round( (1 - valueProAdd/valuePreProAdd )*1000)/1000;
		modelMap.addAttribute("valueProAdd", valueProAdd);
		modelMap.addAttribute("PTProAdd", PTProAdd);
		modelMap.addAttribute("now", now);
		
		//thu nhập hàng ngày biểu đồ
		
				//nam nữ tỉ lệ
				int nam = userDao.countMaleInUser();
				int nu = userDao.countFeMaleInUser();
				modelMap.addAttribute("nam", nam);
				modelMap.addAttribute("nu", nu);
				
		//
				int countDay = now.getDayOfMonth();
				int a[] = new int[countDay];
				for (int i = 0; i < countDay; i++) {
					a[i] = orderDao.getMoneyOfOrderByDay(now.toString(),i+1);
					//System.out.println(a[i]);
				}
				
				modelMap.addAttribute("a", a);
		//
				int countMonth =now.getMonth().getValue();
				int listb[] = new int[countMonth];
				for (int i = 0; i < countMonth; i++) {
					listb[i] = orderDao.getMoneyOfOrderByMonth(now.toString(),i+1);
					//System.out.println(a[i]);
				}
				modelMap.addAttribute("listb", listb);
		//
				
				
		//tổng sản phẩm còn 
		int countAllAmountPro = amountProDao.countAllProduct();
		
		//tổng luotự xemb
		int countSumViewBlog = blogDao.countAllView();
		//tổng user
		
		int countAlluser = userDao.countAllUser();
		//ttoongr bài viết 
		int countAllBlog = blogDao.countBlog("");
		
		modelMap.addAttribute("countAllAmountPro", countAllAmountPro);
		modelMap.addAttribute("countSumViewBlog", countSumViewBlog);
		modelMap.addAttribute("countAlluser", countAlluser);
		modelMap.addAttribute("countAllBlog", countAllBlog);
		return "admin.index";
	}

	
	
	@RequestMapping("/profile")
	public String profile() {
		
		return "admin.profile.index";
	}
	
	@RequestMapping("/403")
	public String page403() {
		return "page.403";
	}
	
	@RequestMapping("/thong-ke")
	public String thongke(ModelMap modelMap,@RequestParam(value = "thang",required = false) String thang,@RequestParam(value = "nam",required = false) String nam) {
		modelMap.addAttribute("actStatis", "active");
		LocalDate nowDate = LocalDate.now();
		LocalDate now = null;
		int Nam =nowDate.getYear();
		int Thang=nowDate.getMonth().getValue();
		int ThangOld = 0;
		if(nam != null && thang != null) {
			Nam = Integer.parseInt(nam);
			Thang =   Integer.parseInt(thang);
		}
		if(nowDate.getYear() == Nam && nowDate.getMonth().getValue() == Thang) {
			now = LocalDate.now();
		}else if(nowDate.getYear() == Nam && nowDate.getMonth().getValue() != Thang) {
			LocalDate b = LocalDate.of(Nam, Thang, 5);
			now = LocalDate.of(Nam, Thang, b.lengthOfMonth());
			//bien thangold de chinh du lieu cho nhung nggay nam cu o gia tri max , 12 thansg , max ngay
			ThangOld = nowDate.getMonth().getValue();
		}else if(nowDate.getYear() != Nam ) {
			ThangOld = 12;
			LocalDate b = LocalDate.of(Nam, Thang, 5);
			now = LocalDate.of(Nam, Thang, b.lengthOfMonth());
		}
		
		
		//LocalDate now = LocalDate.now();
		//
		int countDay = now.getDayOfMonth();
		int a[] = new int[countDay];
		//list view
		int viewbyDay[] = new int[countDay];
		int commentByDay[] = new int[countDay];
		for (int i = 0; i < countDay; i++) {
			a[i] = orderDao.getMoneyOfOrderByDay(now.toString(),i+1);
			//System.out.println(a[i]);
			viewbyDay[i] = blogDao.countbyDayViewAllBlog(now.toString(),i+1);
			//
			commentByDay[i] = commentDao.countCommentByDay(now.toString(),i+1);
		}
		
		modelMap.addAttribute("a", a);
		modelMap.addAttribute("viewbyDay", viewbyDay);
		modelMap.addAttribute("commentByDay", commentByDay);
		
		int countMonth = 0 ;
		if(ThangOld == 0) {
			countMonth =now.getMonth().getValue();
		}else {
			countMonth = ThangOld;
		}
		
		//System.out.println(countMonth);
		int listb[] = new int[countMonth];
		//list view
		int viewbyMonth[] = new int[countMonth];
		//
		int commentByMonth[] = new int[countMonth];
		
		for (int i = 0; i < countMonth; i++) {
			listb[i] = orderDao.getMoneyOfOrderByMonth(now.toString(),i+1);
			//System.out.println(a[i]);
			viewbyMonth[i] = blogDao.countbyMonthViewAllBlog(now.toString(),i+1);
			//
			commentByMonth[i] = commentDao.countCommentByMonth(now.toString(), i+1);
		}
		modelMap.addAttribute("listb", listb);
		modelMap.addAttribute("viewbyMonth", viewbyMonth);
		modelMap.addAttribute("commentByMonth", commentByMonth);
		modelMap.addAttribute("now", now);
		modelMap.addAttribute("yearNow", nowDate.getYear());
		
		//best sell product
		List<Product> listBestSeller =  proDao.getlistProductBestSeller(0);
		List<Product> listBestSellerByMonth =  proDao.getlistProductBestSellerByMonth(now.toString(),0);
		List<Product> listBestSellerByYear =  proDao.getlistProductBestSellerByYear(now.toString(),0);
		modelMap.addAttribute("listBestSeller", listBestSeller);
		modelMap.addAttribute("listBestSellerByMonth", listBestSellerByMonth);
		modelMap.addAttribute("listBestSellerByYear", listBestSellerByYear);
		return "admin.statistical.index";
	}
	
	
}
