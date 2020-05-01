package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminPolicyController {
	@RequestMapping("/policy")
	public String index() {
		return "public.policy.index";
	}
	
	
}
