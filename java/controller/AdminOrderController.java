package controller;

import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Defines.Defines;
import model.bean.Address;
import model.bean.Contact;
import model.bean.Coupon;
import model.bean.Order;
import model.bean.OrderDetail;
import model.bean.Product;
import model.bean.Users;
import model.dao.AddressDao;
import model.dao.AmountProDao;
import model.dao.ColorDao;
import model.dao.ContactDao;
import model.dao.CouponDao;
import model.dao.OrderDao;
import model.dao.PaymentDao;
import model.dao.ProDao;
import model.dao.UserDAO;

@Controller
@RequestMapping("/admin")
public class AdminOrderController {
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private ColorDao colorDao;
	@Autowired
	private CouponDao couponDao;
	@Autowired
	private AddressDao addressDao; 
	@Autowired
	private ProDao proDao; 
	@Autowired
	private AmountProDao amountProDao;
	@Autowired
	Service.MailService MailService;
	@Autowired
	private PaymentDao paymentDao;
	@Autowired
	private UserDAO userDao; 
	@Autowired
	private ContactDao contactDao;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap){
		//active
		modelMap.addAttribute("actOrder", "active");
		modelMap.addAttribute("userDao", userDao);
		modelMap.addAttribute("numOrderNotSeen", orderDao.countOrderIsNotSeen());
		modelMap.addAttribute("numContactNotSeen", contactDao.countContactIsNotSeen());

	}
	@RequestMapping("/order")
	public String index(ModelMap modelMap) {
		
		List<Order> listOrder = orderDao.getAllOrder();
		modelMap.addAttribute("listOrder", listOrder);
		
		return "admin.order.index";
	}
	
	@RequestMapping("/order/view/{id}")
	public String indexViewOrder(@PathVariable("id") int id_order,ModelMap modelMap) {
		
		Order objOrder = orderDao.getobjOrderByIdorder(id_order);
		Users objUser = userDao.getobjUserbyID(objOrder.getId_user());
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
				"        <h4>THÔNG TIN ĐƠN HÀNG #"+id_order+"  Ngày: "+objOrder.getDate()+"</h4><hr>\r\n" + 
				"        <p>Thông tin thanh toán</p>\r\n" + 
				"        <p>Tên: "+objUser.getName()+"</p>\r\n" + 
				"        <p>Email: "+objUser.getEmail()+"</p>\r\n" + 
				"        <p>SĐT: "+objUser.getPhone()+"</p><hr>\r\n" + 
				"        \r\n" + 
				"        <p>Đại chỉ giao hàng</p>\r\n" + 
				"        <p>Địa chỉ:"+address+"</p><hr>\r\n" + 
				"       	<p>Phương thức thanh toán: "+paymentDao.getpaymentbyID(objOrder.getId_payment()).getNamepayment()+"</p>\r\n" + 
				"        <p>Thời gian giao hàng sự kiến:"+htgiaohang+"-"+tggiaohang+" </p>\r\n" + 
				"        <p>CHI TIẾT ĐƠN HÀNG</p><hr>\r\n" + 
				"        <table class='table' style='border-collapse:collapse;border:1px solid black;'>\r\n" + 
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
		modelMap.addAttribute("objOrder", objOrder);
		
		
		return "admin.order.view";
	}
	
	@RequestMapping(value = "/order/confirm",method = RequestMethod.POST)
	public void confirmOrder(@RequestParam("id") int id_order,HttpServletResponse response) {
		PrintWriter out = null;
		try {
			out= response.getWriter();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		orderDao.setcomfirmTrue(id_order);
		out.print("OK");
	}
}
