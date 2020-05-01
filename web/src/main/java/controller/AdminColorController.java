package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import model.bean.Color;
import model.dao.ColorDao;
import model.dao.ContactDao;
import model.dao.OrderDao;
import model.dao.UserDAO;

@Controller
@RequestMapping("/admin")
public class AdminColorController {
	@Autowired
	private ColorDao colorDao;
	@Autowired
	private UserDAO userDao;
	@Autowired
	private ContactDao contactDao;
	@Autowired
	private OrderDao orderDao;
	@ModelAttribute
	public void modeladd(ModelMap modelMap) {
		modelMap.addAttribute("userDao", userDao);
		modelMap.addAttribute("numOrderNotSeen", orderDao.countOrderIsNotSeen());
		modelMap.addAttribute("numContactNotSeen", contactDao.countContactIsNotSeen());
	
	}
	@RequestMapping("/color")
	public String indexcolor(ModelMap modelmap) {
		modelmap.addAttribute("listColor", colorDao.getallColor());
		return "admin.color.index";
	}
	
	@RequestMapping("/color/add")
	public String addcolor() {
		return "admin.color.add";
	}
	
	@RequestMapping(value = "/color/add",method = RequestMethod.POST)
	public String addcolor(@ModelAttribute("color") Color obj,RedirectAttributes ra) {
		int a = colorDao.addColor(obj);
		if(a > 0) {
			ra.addFlashAttribute("msg", 1);
		}else {
			ra.addFlashAttribute("msg", 0);
		}
		return "redirect:/admin/color";
	}
	
	@RequestMapping("/color/edit/{id_color}")
	public String editColor(@PathVariable("id_color") int id_color,ModelMap modelMap) {
		modelMap.addAttribute("objColor", colorDao.getobjColorbyID(id_color));
		return "admin.color.edit";
	}
	
	
	@RequestMapping(value = "/color/edit",method = RequestMethod.POST)
	public String editColor(@ModelAttribute("color") Color obj,RedirectAttributes ra) {
		int a = colorDao.editColor(obj);
		if(a > 0) {
			ra.addFlashAttribute("msg", 1);
		}else {
			ra.addFlashAttribute("msg", 0);
		}
		return "redirect:/admin/color";
	}
	
	
}
