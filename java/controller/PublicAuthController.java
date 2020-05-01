package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Defines.MailDefine;
import model.bean.GooglePojo;
import model.bean.Mail;
import model.bean.Users;
import model.dao.UserDAO;
import util.GoogleUtil;
import util.SlugUtil;
import util.StringUtil;
import util.function;

@Controller
@RequestMapping("")
public class PublicAuthController {
	@Autowired
	private UserDAO userDao;
	@Autowired
	Service.MailService MailService;

	
	@RequestMapping("/shop/login")
	public void shopLogin(@RequestParam("username") String username,@RequestParam("password") String password,HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		//String referer = request.getHeader("Referer");
		//System.out.println(referer);
			PrintWriter out =null;
			//StringUtil.md5(password)
			try {out= response.getWriter();} catch (IOException e) {e.printStackTrace();}
			try {
				
				if(userDao.checkUserLogin(username,StringUtil.md5(password)) != null) {
					session.setAttribute("userInfo",userDao.checkUserLogin(username,StringUtil.md5(password)));
				}else {
					throw new Exception();
				}
			}catch (Exception e) {
				response.setStatus(400);
				out.write("Thông tin bạn đăng nhập không đúng !");
			}
		
	}
	@RequestMapping("/shop/logout")
	public String shopLogout(HttpServletRequest request,HttpSession session) {
		session.removeAttribute("userInfo");
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	
	@RequestMapping("/shop/checkmail")
	public void sendEmail(@CookieValue(value = "Mail",required = false) String cookiMail,@RequestParam("email") String email,HttpSession session,HttpServletResponse response,HttpServletRequest request) {
		//session.removeAttribute("Mail");
		PrintWriter out =null;
		try {out = response.getWriter();} catch (IOException e1) {e1.printStackTrace();}
		if(cookiMail!=null) {
			out.print("Bạn vừa yêu cầu cấp mã.Vui lòng đợi 60s!");
		}else {
			//CHECK DUPLICATE EMAIL
			if(userDao.getobjUserbyMail(email)!=null) {
				out.print("Email này đã có người sử dụng !");
				return;
			}
			Mail mail = new Mail();
	       // String[] emailArr = new String[1];
	        //emailArr[0] = email;
			String code = function.getCode(10);
	        mail.setSendtoMail(email);
	        mail.setSubject("SHOP: XÁC NHẬN TÀI KHOẢN");
	        mail.setMailBody(MailDefine.createMailBodyToEmail(email,code));
	        boolean check =  MailService.sendEmail(mail,true);
	        	if(check) {
	        		out.print("Đã gửi mã, Vui lòng kiểm tra mail");
	        		session.setAttribute("Code", code);
	        		session.setAttribute("Mail", email);
	        		Cookie cooki = new Cookie("Mail", email);
	        		cooki.setMaxAge(60);
	        		response.addCookie(cooki);
	        	}else {
	        		out.print("Có vấn đề khi gửi mail !");
	        	}
		}
	}
	
	@RequestMapping(value = "/shop/register",method = RequestMethod.POST)
	public void postshopRegister(@ModelAttribute("user") Users obj,@RequestParam("code") String code,
			HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		//String referer = request.getHeader("Referer");
		PrintWriter out =null;
		try {out = response.getWriter();} catch (IOException e1) {e1.printStackTrace();}
		//CHECK DUPLICATE USERNAME
		if(userDao.getobjUser(obj.getUsername())!=null) {
			try {
				throw new Exception();
			}catch (Exception e) {
				response.setStatus(401);
				out.write("Tên tài khoản đã có người sử dụng");
				return;
			}
		}
		if(session.getAttribute("Code")==null) {
			try {
				throw new Exception();
			}catch (Exception e) {
				response.setStatus(400);
				out.write("Code không tồn tại hoặc hết hạn");
				//return "redirect:"+referer; 
			}
		}else {//KIỂM TRA NẾU CÓ CODE
			String sessionCode =(String) session.getAttribute("Code");
			String sessionMail =(String) session.getAttribute("Mail");
			//KIỂM TRA ĐÚNG CODE VÀ ĐÚNG EMAIL
			if(sessionCode.equals(code) && sessionMail.equals(obj.getEmail())) {
				//ĐẶT QUYỀN : USER DEFAULT
				obj.setRoles_id(3);
				obj.setPassword(StringUtil.md5(obj.getPassword()));//CHANGE MD5 PASS
				obj.setNameImage(function.getNameImage(obj.getName()));
				//ADD
				userDao.addUser(obj);
				/*
				 * //DELETE COOKIE Cookie mail = new Cookie("Mail", obj.getEmail());
				 * mail.setMaxAge(0); response.addCookie(mail);
				 */
                //xóa session
				session.removeAttribute("Mail");
				session.removeAttribute("Code");
				out.print("<h3>Chúc mừng bạn đã đăng kí thành công tài khoản, Bây giờ bạn có thể đăng nhập!<h3>");
			}else {//NẾU CODE VÀ EMAIL KHÔNG EQUAL THÌ NOTIFICATION
				try {
					throw new Exception();
				}catch (Exception e) {
					response.setStatus(400);
					out.write("Code không đúng với mail đã gửi");
					//return "redirect:"+referer; 
				}
			}
		}
		
	}
	
	
	@RequestMapping(value = "/login-google",method = RequestMethod.POST)
	public void logingoogle(@RequestParam("name") String name,@RequestParam("id") String id,@RequestParam("email") String email ,HttpServletRequest request
			,HttpServletResponse response,ModelMap modelMap,HttpSession session) throws IOException{
//		String code = request.getParameter("code");
//		if(code == null || code.isEmpty()) {
//			return "redirect:/auth/403";
//		}
//		GoogleUtil a = new GoogleUtil();
//		String accessToken = a.getToken(code);
//	    GooglePojo googlePojo = a.getUserInfo(accessToken);
	    //Users objUsers = new Users(0, name, email, StringUtil.md5("123456"), 123456789, email,true, LocalDate.now().minusYears(18).toString(), 3, true, function.getNameImage(name));
	    //userDao.addUser(objUsers);
		if(userDao.getobjUserbyMail(email)!=null) {
			if(!userDao.getobjUserbyMail(email).getId_google().equals(id)) {
				response.setStatus(400);
				return;
			}
		}else {
			//chưa đưang kí
			//cập nhật phone
			response.setStatus(444);
			return;
		}
		
	session.setAttribute("userInfo", userDao.getobjUserbyMail(email));
	   PrintWriter out = response.getWriter();
	   out.print("OK");
	}
	
	@RequestMapping("/xac-nhan-phone")
	public void xacnhanphone(@RequestParam("name") String name,@RequestParam("id") String id,@RequestParam("email") String email,@RequestParam("phone") String phone,HttpServletRequest request
			,HttpServletResponse response,ModelMap modelMap,HttpSession session) throws IOException{
		 PrintWriter out = response.getWriter();
		//System.out.println(id+name+email+phone);
	   
		if(phone.isBlank() || phone.isEmpty()) {
			response.setStatus(400);
			out.write("Bạn phải nhập dữ liệu");
			return;
		}
		if(phone.length() >10 || phone.length() <8){
			response.setStatus(400);
			out.write("Bạn cần nhập đúng định dạng");
			return;
		}int sdt = 0;
		try {
			sdt = Integer.parseInt(phone);
		} catch (Exception e) {
			response.setStatus(400);
			out.write("Bạn cần nhập đúng định dạng");
			return;
		}
		Users objUsers = new Users(0, name, email, StringUtil.md5("123456"), Integer.parseInt(phone), email,true, LocalDate.now().minusYears(18).toString(), 3, true, function.getNameImage(name),id);
		userDao.addUser(objUsers);
		session.setAttribute("userInfo", userDao.getobjUserbyMail(email));
	    out.print("OK");
	}
	
	
	
	@RequestMapping(value = "/login-facebook",method = RequestMethod.POST)
	public void loginfacebook(@RequestParam("name") String name,@RequestParam("id") String id,@RequestParam("email") String email ,HttpServletRequest request
			,HttpServletResponse response,ModelMap modelMap,HttpSession session) throws IOException{
//		String code = request.getParameter("code");
//		if(code == null || code.isEmpty()) {
//			return "redirect:/auth/403";
//		}
//		GoogleUtil a = new GoogleUtil();
//		String accessToken = a.getToken(code);
//	    GooglePojo googlePojo = a.getUserInfo(accessToken);
	    //Users objUsers = new Users(0, name, email, StringUtil.md5("123456"), 123456789, email,true, LocalDate.now().minusYears(18).toString(), 3, true, function.getNameImage(name));
	    //userDao.addUser(objUsers);
		if(userDao.getobjUserbyMail(email)!=null) {
			if(!userDao.getobjUserbyMail(email).getId_google().equals(id)) {
				response.setStatus(400);
				return;
			}
		}else {
			//chưa đưang kí
			//cập nhật phone
			response.setStatus(444);
			return;
		}
		
	session.setAttribute("userInfo", userDao.getobjUserbyMail(email));
	   PrintWriter out = response.getWriter();
	   out.print("OK");
	}
	
}
