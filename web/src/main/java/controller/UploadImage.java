package controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import Defines.Defines;

@Controller
public class UploadImage {
	@Autowired
	ServletContext context;
	
	@RequestMapping(value = "/upload")
	@ResponseBody
	public void uploadimage(@RequestParam("CKEditorFuncNum") String funcNumber,@RequestParam("upload") MultipartFile file, HttpServletResponse response) {
		String nameFile = file.getOriginalFilename();
		String appPath = context.getRealPath("");
		String dirPath = appPath + Defines.DIR_UPLOAD;
		File createDir = new File(dirPath);
		if(!createDir.exists()){
			createDir.mkdirs();
		}
		String filePath = dirPath + File.separator + nameFile;
		File url = new File(filePath);
		try {
			file.transferTo(url);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print("<script type=\"text/javascript\">window.parent.CKEDITOR.tools.callFunction("+funcNumber+
	                ",\""+url+"\", \"\");</script>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 
	}
}