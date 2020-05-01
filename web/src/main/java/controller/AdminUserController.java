package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.velocity.runtime.parser.node.GetExecutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import model.bean.Address;
import model.bean.Cat;
import model.bean.Color;
import model.bean.Roles;
import model.bean.Users;
import model.dao.AddressDao;
import model.dao.ContactDao;
import model.dao.OrderDao;
import model.dao.UserDAO;
import util.StringUtil;
import util.function;
@Controller
@RequestMapping("/admin")
public class AdminUserController {
	@Autowired
	UserDAO userDAO;
	@Autowired
	AddressDao addressDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private ContactDao contactDao;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap) {
		modelMap.addAttribute("actUser", "active");
		modelMap.addAttribute("numOrderNotSeen", orderDao.countOrderIsNotSeen());
		modelMap.addAttribute("numContactNotSeen", contactDao.countContactIsNotSeen());
	
	}
	@RequestMapping("/user")
	public String user(ModelMap modelMap) {
		modelMap.addAttribute("listUser", userDAO.getallUser());
		modelMap.addAttribute("listRole", userDAO.getAllRoles());
		
		List<Roles> a = new ArrayList<Roles>();
		for (Roles roles : a) {
			System.out.println(roles.getNameR());
			
		}
		return "admin.user.index";
	}
	
	@RequestMapping("/user/address/{id}")
	public String userAddress(@PathVariable("id") int id_user,ModelMap modelMap) {
		
		List<Address> listadd = addressDao.getlistAddressbyUser(id_user);
		Map<Integer,String> listAddress = new HashMap<Integer, String>();
		if(listadd != null) {
			for (Address objA : listadd) {
				String address = objA.getNamestreet()+", "+addressDao.getWardbyID(objA.getId_ward()).get_name()+", "+addressDao.getDistrictbyID(objA.getId_district()).get_name()+", "+addressDao.getProvincebyID(objA.getId_province()).get_name();
				listAddress.put(objA.getId_address(), address);
			}
		}
		
		modelMap.addAttribute("listAddress", listAddress);
		return "admin.user.address";
	}
	
	
	@RequestMapping("/user/add")
	public String addUser(ModelMap modelMap) {
		modelMap.addAttribute("add", "adddddddddddddddddd");
		return "admin.user.add";
	}
	
	@RequestMapping(value = "/user/add",method = RequestMethod.POST)
	public String addUser( @ModelAttribute("user") Users obj, ModelMap modelMap,RedirectAttributes ra) {
		
		obj.setNameImage(function.getNameImage(obj.getName()));
		int a = userDAO.addUser(obj);
		if(a > 0) {
			ra.addFlashAttribute("msg", 1);
		}else {
			ra.addFlashAttribute("msg", 0);
		}
		return "redirect:/admin/user";
	}
	
	@RequestMapping("/user/edit/{id}")
	public String editUser(@PathVariable("id") int id, ModelMap modelMap) {
		Users user = userDAO.getobjUserbyID(id);
		modelMap.addAttribute("objUser", user);
		return "admin.user.edit";
	}
	
	@RequestMapping(value = "/user/edit",method = RequestMethod.POST)
	public String editUser(@ModelAttribute("user") Users obj,@RequestParam(value = "password",required = false) String pass,ModelMap modelMap,RedirectAttributes ra) {
		Users user = userDAO.getobjUserbyID(obj.getId_user());
		if(pass == null) {
			obj.setPassword(user.getPassword());
		}else {
			obj.setPassword(StringUtil.md5(pass));
		}
		///
		obj.setNameImage(function.getNameImage(obj.getName()));
		int process = userDAO.editUser(obj);
		if(process > 0) {
			ra.addFlashAttribute("msg", 1);
		}else {
			ra.addFlashAttribute("msg", 0);
		}
		return "redirect:/admin/user";
	}
	
	@RequestMapping("/user/del/{id}")
	public String delUser(@PathVariable("id") int id, ModelMap modelMap,RedirectAttributes ra) {
		
		
		int process = userDAO.deluserbyID(id);
		if(process > 0) {
			ra.addFlashAttribute("msg", 1);
		}else {
			ra.addFlashAttribute("msg", 0);
		}
		return "redirect:/admin/user";

	}
	
	@RequestMapping("/user/profile")
	public String userInfor() {
		return "admin.profile.index";
	}
}
