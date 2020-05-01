package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminAdverController {
	@RequestMapping("/adver")
	public void index() {
		
		//return "admin.adver.index";
	}
}
