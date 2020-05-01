package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import model.bean.Comment;
import model.bean.Users;
import model.dao.CommentDao;
import model.dao.ContactDao;
import model.dao.OrderDao;
import model.dao.UserDAO;

@Controller
@RequestMapping("/admin")
public class AdminCommentController {
	@Autowired
	private CommentDao commentDao;
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
	@RequestMapping("/comment/{id_blog}")
	public String index(@PathVariable("id_blog") int id_blog, ModelMap modelMap) {
		modelMap.addAttribute("Luser",userDao.getallUser());
		modelMap.addAttribute("LcmFa", commentDao.getallcommentBlogFather(id_blog));
		modelMap.addAttribute("LcmSon", commentDao.getallcommentBlogSon(id_blog));
		return "admin.comment.index";
	}
	
	@RequestMapping("/comment/del/{id_blog}/{id_comment}")
	public String delComment(@PathVariable("id_blog") int id_blog,@PathVariable("id_comment") int id_comment,RedirectAttributes ra, ModelMap modelMap,HttpServletRequest request) {
		//String referer = request.getHeader("Referer");
		int process =  commentDao.delCommentById(id_comment);
		if(process > 0) {
			ra.addFlashAttribute("msg", "1");
		}else {
			ra.addFlashAttribute("msg", "0");
		}
		return "redirect:/comment/"+id_blog;
	}
	
	@RequestMapping("/product/comment/{id_product}")
	public String indexCommentProduct(@PathVariable("id_product") int id_product, ModelMap modelMap) {
		modelMap.addAttribute("Luser",userDao.getallUser());
		modelMap.addAttribute("LcmFa", commentDao.getallcommentProductFatherbyID(id_product));
		modelMap.addAttribute("LcmSon", commentDao.getallcommentProductSonbyID(id_product));
		return "admin.comment.pro.index";
	}
	
	@RequestMapping("/comment/pro/del/{id_comment}")
	public String delCommentProduct(@PathVariable("id_comment") int id_comment,RedirectAttributes ra, ModelMap modelMap,HttpServletRequest request) {
		//String referer = request.getHeader("Referer");
		
		int id_product = commentDao.getCommentById(id_comment).getId_product();
		int process =  commentDao.delCommentById(id_comment);
		if(process > 0) {
			ra.addFlashAttribute("msg", "1");
		}else {
			ra.addFlashAttribute("msg", "0");
		}
		return "redirect:/product/comment/"+id_product;
	}
	
	
	@RequestMapping(value = "/product/comment/reply",method = RequestMethod.POST)
	public void addReplyProductComment(@RequestParam("id") int id_comment , @RequestParam("noidung") String noidung,HttpServletResponse response,HttpSession session) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (Exception e) {
			// TODO: handle exception.
		}
		Users objUser = (Users) session.getAttribute("userInfo");
		Comment cm =  commentDao.getCommentById(id_comment);
		Comment obj = new Comment(id_comment, objUser.getId_user(), cm.getId_product(), 0, noidung, "", id_comment, 0, true);
		int process =  commentDao.addComment(obj);
		
	}
}
