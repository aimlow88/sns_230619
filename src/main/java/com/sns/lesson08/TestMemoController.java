package com.sns.lesson08;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestMemoController {
	
	@GetMapping("/test/memo")
	public String signUpView() {
		
		return "lesson08/layout";
	}

}
