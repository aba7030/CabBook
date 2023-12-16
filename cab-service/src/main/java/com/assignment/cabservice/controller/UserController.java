package com.assignment.cabservice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	@GetMapping("/")
	public String homee() {
		return "home";
	}

	@GetMapping("booking")
	public String booking() {
		return "booking";
	}
	@GetMapping("bookcar")
	public String bookcar() {
		return "bookcar";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	@GetMapping("/use")
	public String use() {
		return "use";
	}

}


