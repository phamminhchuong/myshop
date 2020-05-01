package controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Defines.Defines;
import model.bean.Image;
import model.dao.ImageDao;

@Controller
@RequestMapping("/admin")
public class AdminImageController {
	@Autowired
	private ImageDao imageDao;
	@Autowired
	private ServletContext context;
	@RequestMapping(value = "/image/xlajax",method = RequestMethod.POST)
	public String xlajaxdelImage(@RequestParam("Idimg") int id_image,ModelMap modelMap,HttpServletRequest request) {
		Image objimg = imageDao.getobjImagebyID(id_image);
		//xóa
		int process= imageDao.delimagebyID(id_image);
		//xóa file ảnh
		String appPath = context.getRealPath("");
		String dirPath = appPath + Defines.DIR_UPLOAD;
		String pathname = dirPath+File.separator+objimg.getNameimg();
		File imagedel = new File(pathname);
		imagedel.delete();
		//
		List<Image> lisimg = imageDao.getimagebyidProduct(objimg.getId_product());
		modelMap.addAttribute("listimg", lisimg);
		
		return "ajax.delimage";
	}
}
