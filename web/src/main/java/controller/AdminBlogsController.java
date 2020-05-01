package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.swing.text.StyledEditorKit.BoldAction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContext;


import Defines.Defines;
import model.bean.Blog;
import model.bean.Cat;
import model.dao.BlogDao;
import model.dao.ContactDao;
import model.dao.OrderDao;
import model.dao.UserDAO;
import util.function;

@Controller
@RequestMapping("/admin")
public class AdminBlogsController {
	@Autowired
	private BlogDao blogDao;
	@Autowired
	ServletContext context;
	@Autowired
	private UserDAO userDao;
	@Autowired
	private ContactDao contactDao;
	@Autowired
	private OrderDao orderDao;
	@ModelAttribute
	public void addcommonObject(ModelMap modelMap) {
		modelMap.addAttribute("actBlog", "active");
		modelMap.addAttribute("userDao", userDao);
		modelMap.addAttribute("numOrderNotSeen", orderDao.countOrderIsNotSeen());
		modelMap.addAttribute("numContactNotSeen", contactDao.countContactIsNotSeen());
	
	}
	
	@RequestMapping(value = {"/blogs","/blogs/{i}"})
	public String index(@PathVariable(value = "i", required = false) Integer i, ModelMap modelMap) {
		int pageMin = 0;
		int pageMax = 0;
		int totalBlog = blogDao.countBlog("");
		int totalPage =(int) Math.ceil((float) totalBlog/Defines.ROW_COUNT);
		if(i == null || i < 1) {
			i = 1;
		}
		if(i > totalPage) {
			i =totalPage;
		}
		int pageMiddle =(int) Math.ceil((float) Defines.RANGE/2);
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
		int offset = (i-1)*Defines.ROW_COUNT;
		modelMap.addAttribute("listBlog", blogDao.getallBlog(offset,""));
		modelMap.addAttribute("pageMin", pageMin);
		modelMap.addAttribute("pageMax", pageMax);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("curPage", i);
		return "admin.blog.index";
	}
	
	@RequestMapping("/blogs/add")
	public String pageAddBlog(ModelMap modelMap) {
		return "admin.blog.add";
	}
	
	@RequestMapping(value = "/blogs/add",method = RequestMethod.POST)
	public String processAddBlog(@ModelAttribute("blog") Blog obj,@RequestParam("file") CommonsMultipartFile cmf,RedirectAttributes ra) {
		String nameFile = cmf.getOriginalFilename();
		String path = context.getRealPath("")+Defines.DIR_UPLOAD+File.separator+function.changeNameIMG(nameFile, 0);
		try {
			cmf.transferTo(new File(path));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		obj.setImage(function.changeNameIMG(nameFile, 0));
		int Process = blogDao.addBlog(obj);
		if(Process >0) {
			ra.addFlashAttribute("msg", 1);
		}else {
			ra.addFlashAttribute("msg", 0);
		}
		return "redirect:/admin/blogs";
	}
	@RequestMapping("/blogs/edit/{id}")
	public String pageEdit(@PathVariable("id") int id,ModelMap modelMap) {
		modelMap.addAttribute("objBlog", blogDao.getobjBlogbyID(id));
		return "admin.blog.edit";
	}
	
	@RequestMapping(value = "/blogs/edit",method = RequestMethod.POST)
	public String processEditBlog(@ModelAttribute("blog") Blog obj,@RequestParam("file") CommonsMultipartFile cmf,RedirectAttributes ra) {
		String nameFile = cmf.getOriginalFilename();
		String nameImageOld = blogDao.getobjBlogbyID(obj.getId_blog()).getImage();
		if(nameFile.equals("")) {
			nameFile = nameImageOld;
		}else {
			String pathImageOld = context.getRealPath("")+Defines.DIR_UPLOAD+File.separator+ nameImageOld;
			File fileDelete = new File(pathImageOld);
			fileDelete.delete();
			nameFile = function.changeNameIMG(cmf.getOriginalFilename(), 0);
			String path = context.getRealPath("")+Defines.DIR_UPLOAD+File.separator+nameFile;
			try {
				cmf.transferTo(new File(path));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		obj.setImage(nameFile);
		System.out.println(nameFile);
		int Process = blogDao.editBlog(obj);
		if(Process >0) {
			ra.addFlashAttribute("msg", 1);
		}else {
			ra.addFlashAttribute("msg", 0);
		}
		return "redirect:/admin/blogs";
	}
	@RequestMapping("/blogs/del/{id}")
	public String delBlog(@PathVariable("id") int id,RedirectAttributes ra) {
		String nameImageOld = blogDao.getobjBlogbyID(id).getImage();
		int Process = blogDao.delBlog(id);
		if(Process >0) {
			//DELETE IMAGE
			String pathImageOld = context.getRealPath("")+Defines.DIR_UPLOAD+File.separator+ nameImageOld;
			File fileDelete = new File(pathImageOld);
			fileDelete.delete();
			ra.addFlashAttribute("msg", 1);
		}else {
			ra.addFlashAttribute("msg", 0);
		}
		return "redirect:/admin/blogs";
	}
}
