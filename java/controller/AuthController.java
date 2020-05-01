package controller;

import java.security.Principal;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Defines.MailDefine;

import model.bean.Mail;
import model.bean.PasswordReset;
import model.bean.Users;

import model.dao.UserDAO;
import util.StringUtil;

@Controller
@RequestMapping("/auth")
public class AuthController {
	@Autowired
	UserDAO UserDAO;
	@Autowired
	Service.MailService MailService; 
	@RequestMapping(value = { "/login", "/login/{er}" })
	public String indexlogin(@PathVariable(value = "er", required = false) String er, ModelMap modelMap,
			HttpSession session, Principal principal) {

		if (er != null) {
			modelMap.addAttribute("err", "Tài khoản hoặc mật khẩu không đúng");
		}

		return "admin.login";
	}

	@RequestMapping(value = { "/403" })
	public String page403() {

		return "page.403";
	}

	@RequestMapping(value = { "/getmail" })
	public String pagegetEmail() {

		return "page.getmail";
	}

	@RequestMapping(value = "/getmail", method = RequestMethod.POST)
	public String postpagegetEmail(@RequestParam("email") String email,RedirectAttributes ra) {
		//System.out.println(email);
		int id_user = 0;
		try {
		Users user = UserDAO.getobjUserbyMail(email);
		id_user = user.getId_user();
		//System.out.println(user.getUsername());
		}catch(Exception e) {
			ra.addFlashAttribute("err","Email bạn nhập không chính xác !");
			return "redirect:/auth/getmail";
		}
		String token = UUID.randomUUID().toString();
        PasswordReset passwordReset = new PasswordReset();
        passwordReset.setToken(token);
        passwordReset.setId_user(id_user);
        //thêm token
        UserDAO.addToken(passwordReset);

        Mail mail = new Mail();
       // String[] emailArr = new String[1];
        //emailArr[0] = email;
        mail.setSendtoMail(email);
        mail.setSubject("RE : RESET PASSWORD");
        mail.setMailBody(MailDefine.createMailBody(email,token));
        boolean check =  MailService.sendEmail(mail,true);
        if(check) {
        	ra.addFlashAttribute("err","Chúng tôi đã gửi tin nhắn cho bạn , Vui lòng kiểm tra mail để đổi mật khẩu!");
        }
        return "redirect:/auth/getmail";
	}

	@RequestMapping(value = { "/resetPassword" })
	public String resetPass(@RequestParam("token") String token,ModelMap modelMap) {
		if(UserDAO.findbyToken(token)!=null) {
			modelMap.addAttribute("check", "OK");
			modelMap.addAttribute("email", UserDAO.findbyToken(token).getEmail());
		}
		return "page.resetPass";
	}	

@RequestMapping(value= "/resetPassword", method = RequestMethod.POST)
public String getemail(@RequestParam("email") String email,@RequestParam("password") String pass, @RequestParam("repassword") String repass,RedirectAttributes ra) {
	Users user = UserDAO.getobjUserbyMail(email);
	String Pass = StringUtil.md5(pass);
	UserDAO.updatePassUser(user.getEmail(),Pass);
	UserDAO.deltokenbyUser(user.getId_user());

    ra.addFlashAttribute("done","Bạn đã đổi mật khẩu thành công vui lòng đăng nhập!");

	return "redirect:/auth/blank";
}

@RequestMapping(value= {"/blank"})
public String pageBlank() {
	
	return "page.blank";
}

@RequestMapping("/logout")
public String logout(){
	
	return "admin.login";
}


}
