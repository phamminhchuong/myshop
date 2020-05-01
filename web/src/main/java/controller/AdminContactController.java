package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import model.dao.ContactDao;
import model.dao.OrderDao;
import model.dao.ProDao;
import model.dao.UserDAO;

@Controller
@RequestMapping("/admin")
public class AdminContactController {
	@Autowired
	private ContactDao contactDao;
	@Autowired
	private UserDAO userDao;
	@Autowired
	private OrderDao orderDao;
	@ModelAttribute
	public void modeladd(ModelMap modelMap) {
		modelMap.addAttribute("actContact", "active");
		modelMap.addAttribute("userDao", userDao);
		modelMap.addAttribute("numOrderNotSeen", orderDao.countOrderIsNotSeen());
		modelMap.addAttribute("numContactNotSeen", contactDao.countContactIsNotSeen());
	}
@RequestMapping("/contact")
public String index(ModelMap modelMap) {
	modelMap.addAttribute("listContact",contactDao.getallContact() );
	return "admin.contact.index";
}

@RequestMapping("contact/view/{id}")
public String index(@PathVariable("id") int id_contact,ModelMap modelMap) {
	modelMap.addAttribute("obj",contactDao.getContactById(id_contact) );
	contactDao.updateViewContactById(id_contact);
	return "admin.contact.view";
}

@RequestMapping(value = "contact/del/{id}")
public String index(@PathVariable("id") int id_contact,RedirectAttributes ra) {
	int process = contactDao.delContactById(id_contact);
	if(process > 0) {
		ra.addFlashAttribute("msg",1);
	}else {
		ra.addFlashAttribute("msg", 0);
	}
	return "redirect:/admin/contact";
}
}
