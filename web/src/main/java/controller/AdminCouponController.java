package controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import model.bean.Cat;
import model.bean.Contact;
import model.bean.Coupon;
import model.bean.Product;
import model.bean.Users;
import model.dao.ContactDao;
import model.dao.CouponDao;
import model.dao.OrderDao;
import model.dao.ProDao;
import model.dao.UserDAO;

@Controller
@RequestMapping("/admin")
public class AdminCouponController {
	@Autowired
	private CouponDao couponDao;
	@Autowired
	private ProDao proDao;
	@Autowired
	private UserDAO userDao;

	@Autowired
	private OrderDao orderDao;
	@Autowired
	private ContactDao contactDao;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap) {
		modelMap.addAttribute("actCoupon", "active");
		modelMap.addAttribute("userDao", userDao);
		modelMap.addAttribute("numOrderNotSeen", orderDao.countOrderIsNotSeen());
		modelMap.addAttribute("numContactNotSeen", contactDao.countContactIsNotSeen());

	}

	@RequestMapping("/coupon/{id}")
	public String couponIndex(@PathVariable("id") int id_product,ModelMap modelMap) {
		List<Coupon> listCuopon = couponDao.getAllCouponbyIdPro(id_product);
		List<Product> listPro = proDao.getallProductHaveCoupon();
		modelMap.addAttribute("listCuopon", listCuopon);
		modelMap.addAttribute("objPro", proDao.getProductbyID(id_product));
		LocalDate now = LocalDate.now();
		modelMap.addAttribute("now", now);
		return "admin.coupon.index";
	}
	
	@RequestMapping("/coupon/add/{id}")
	public String addCoupon(@PathVariable("id") int id_product,ModelMap modelMap) {
		modelMap.addAttribute("id_pro", id_product);
		return "admin.coupon.add";
	}
	@RequestMapping(value = "/coupon/add",method = RequestMethod.POST)
	public String addCoupon(@ModelAttribute("coupon") Coupon obj, ModelMap modelMap,RedirectAttributes ra) {
		
		int a = couponDao.addCoupon(obj);
		if(a > 0) {
			ra.addFlashAttribute("msg", 1);
		}else {
			ra.addFlashAttribute("msg", 0);
		}
		return "redirect:/admin/coupon/"+obj.getId_product();
	}
	
	@RequestMapping("/coupon/edit/{id}")
	public String editCoupon(@PathVariable("id") int id_coupon,ModelMap modelMap) {
		modelMap.addAttribute("objCoupon", couponDao.getCouponbyId(id_coupon));
		return "admin.coupon.edit";
	}
	@RequestMapping(value = "/coupon/edit",method = RequestMethod.POST)
	public String editCoupon(@ModelAttribute("coupon") Coupon obj, ModelMap modelMap,RedirectAttributes ra) {
		//System.out.println(obj.getPercent()+"-"+obj.getExpiry_date()+"-"+obj.getId_salecode()+);
		int a = couponDao.editCoupon(obj);
		if(a > 0) {
			ra.addFlashAttribute("msg", 1);
		}else {
			ra.addFlashAttribute("msg", 0);
		}
		return "redirect:/admin/coupon/"+obj.getId_product();
	}
	
	@RequestMapping(value = "/coupon/del/{idsp}/{id}")
	public String delCoupon(@PathVariable("id") int id_coupon,@PathVariable("idsp") int id_product, ModelMap modelMap,RedirectAttributes ra) {
		
		int a = couponDao.delCoupon(id_coupon);
		if(a > 0) {
			ra.addFlashAttribute("msg", 1);
		}else {
			ra.addFlashAttribute("msg", 0);
		}
		return "redirect:/admin/coupon/"+id_product;
	}
}
