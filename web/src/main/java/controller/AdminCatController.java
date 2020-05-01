package controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import model.bean.Cat;
import model.dao.CatDao;
import model.dao.ContactDao;
import model.dao.OrderDao;
import model.dao.ProDao;
import model.dao.UserDAO;

@Controller
@RequestMapping("/admin")
public class AdminCatController {
	@Autowired
	private CatDao catDao;
	@Autowired
	private ProDao proDao;
	@Autowired
	private UserDAO userDao;
	@Autowired
	private ContactDao contactDao;
	@Autowired
	private OrderDao orderDao;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap) {
		List<Cat> listCat = catDao.getallCat();
		ArrayList<Cat> listcatbeaty = new ArrayList<Cat>();
		//làm đẹp cat bằng đệ quy 
		getcatwithbeaty(listCat, listcatbeaty, "", 0);
		modelMap.addAttribute("listCat",listcatbeaty);
		modelMap.addAttribute("actCat", "active");
		modelMap.addAttribute("userDao", userDao);
		modelMap.addAttribute("numOrderNotSeen", orderDao.countOrderIsNotSeen());
		modelMap.addAttribute("numContactNotSeen", contactDao.countContactIsNotSeen());
	
	}

	@RequestMapping("/cat")
	public String index(ModelMap modelMap) {
		return "admin.cat.index";
	}

	@RequestMapping("/cat/add")
	public String addcat(ModelMap modelMap) {
		return "admin.cat.add";
	}

	@RequestMapping(value = "/cat/add", method = RequestMethod.POST)
	public String xladdcat(@ModelAttribute("cat") Cat obj, ModelMap modelMap, RedirectAttributes ra) {
		int process = catDao.addCat(obj);
		if (process > 0) {
			ra.addFlashAttribute("msg", 1);
		} else {
			ra.addFlashAttribute("msg", 0);
		}
		return "redirect:/admin/cat";
	}

	@RequestMapping("/cat/edit/{id}")
	public String editcat(@PathVariable("id") int id, ModelMap modelMap) {
		Cat obj = catDao.getobjCatbyID(id);
		List<Cat> listcat = catDao.getallCat();
		ArrayList<Cat> listcatBeaty = new ArrayList<Cat>();
		//lấy list con 
		ArrayList<Cat> listchild = new ArrayList<Cat>();
		getchildCat(listcat, listchild, id);
		//-------
		
		//bỏ list con với chính nó trong sanh sách
		for(int i = 0; i < listcat.size();i++) {
			for (Cat cat : listchild) {
				if(listcat.get(i).getId_cat() == cat.getId_cat()) {
					listcat.remove(i);
				}
			}
		}
		getcatwithbeaty(listcat, listcatBeaty, "", 0);
		modelMap.addAttribute("listcat", listcatBeaty);
		modelMap.addAttribute("objCat", obj);
		return "admin.cat.edit";
	}

	@RequestMapping(value = "/cat/edit", method = RequestMethod.POST)
	public String xleditcat(@ModelAttribute("cat") Cat obj, ModelMap modelMap, RedirectAttributes ra) {
		int process = catDao.editCat(obj);
		if (process > 0) {
			ra.addFlashAttribute("msg", 1);
		} else {
			ra.addFlashAttribute("msg", 0);
		}
		return "redirect:/admin/cat";
	}

	// hàm xóa các danh mục con
	public void delitemCatParent(List<Cat> list, int parent_id) {
		for (Cat cat : list) {
			if (cat.getId_parent() == parent_id) {
				// xóa
				int process = catDao.delCat(cat.getId_cat());
				// int process1 = proDao.delproductbyidCat(cat.getId_cat());
				// gọi lại hàm
				delitemCatParent(list, cat.getId_cat());
			}
		}
	}
	
	// hàm làm đẹp cat
		public void getcatwithbeaty(List<Cat> list,ArrayList<Cat> listResult,String str, int parent_id) {
			for (Cat cat : list) {
				if (cat.getId_parent() == parent_id) {
					cat.setNamec(str+cat.getNamec());
					listResult.add(cat);
					getcatwithbeaty(list,listResult,str+"|--->",cat.getId_cat());
				}
			}
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

	@RequestMapping(value = "/cat/del/{id}", method = RequestMethod.POST)
	public String xleditcat(@PathVariable("id") int id, RedirectAttributes ra) {
		List<Cat> list = catDao.getallCat();
		int process = catDao.delCat(id);
		//gọi hàm xóa danh mục con
		delitemCatParent(list, id);
		if(process > 0) 
		{ 
			ra.addFlashAttribute("msg", 1);
		}
		else 
		{
		  ra.addFlashAttribute("msg", 0);
		}
		 
		return "redirect:/admin/cat";
	}

}
