package com.kanbu.controller;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MainController {
	
	
	@RequestMapping("main.com")
	public String login() throws Exception{
		return "/main/main";
	}
	


}
