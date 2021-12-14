package com.kanbu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
	
	@RequestMapping("/error400.com")
	public String error400() throws Exception
	{	return "/error/error400";	}
	
	@RequestMapping("/error403.com")
	public String error403() throws Exception
	{	return "/error/error403";	}
	
	@RequestMapping("/error404.com")
	public String error404() throws Exception
	{	return "/error/error404";	}
	
	@RequestMapping("/error405.com")
	public String error405() throws Exception
	{	return "/error/error405";	}
	
	@RequestMapping("/error500.com")
	public String error500() throws Exception
	{	return "/error/error500";	}
	
	@RequestMapping("/error503.com")
	public String error503() throws Exception
	{	return "/error/error503";	}

}
