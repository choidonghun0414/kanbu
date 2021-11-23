package com.kanbu.controller.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kanbu.dto.member.MemberDTO;
import com.kanbu.service.member.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberImpl = null;
	
	@Autowired
	private MemberDTO member = null;
	
	@RequestMapping("join.com")
	public String login() throws Exception{
		return "/member/joinForm";
	}
	
	@RequestMapping("joinPro.com")
	public String loginPro(HttpServletRequest request, Model model) throws Exception{
		member.setId(request.getParameter("id"));
		member.setPw(request.getParameter("pw"));
		
		memberImpl.insertMember(member);
		
		model.addAttribute("id", member.getId());
		model.addAttribute("pw", member.getPw());
		
		return "/member/joinPro";
	}
	

}
