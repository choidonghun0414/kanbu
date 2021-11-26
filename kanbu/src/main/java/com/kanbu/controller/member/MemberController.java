package com.kanbu.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kanbu.dto.member.MemberDTO;
import com.kanbu.exception.LoginFailedException;
import com.kanbu.service.member.MemberService;
@EnableWebMvc
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberImpl = null;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	private MemberDTO member = null;
	
	
	@RequestMapping(value ="join.com", method = RequestMethod.GET)
	public String join() throws Exception{
		return "/member/joinForm";
	}
	
	@RequestMapping(value ="joinPro.com", method = RequestMethod.POST)
	public String joinPro(HttpServletRequest request, Model model) throws Exception{
		
		member.setId(request.getParameter("id"));
		member.setNick(request.getParameter("nick"));
		member.setPw2(bCryptPasswordEncoder.encode(request.getParameter("pw2")));
		
		member.setDomain(request.getParameter("domain"));
		member.setMail(request.getParameter("mail"));
		member.setPhone(request.getParameter("phone"));
		//int형식으로 형변환
		member.setAgree(Integer.parseInt(request.getParameter("agree")));
		member.setPrivacy(Integer.parseInt(request.getParameter("privacy")));
		member.setStatus(Integer.parseInt(request.getParameter("status")));
		model.addAttribute("id", member.getId());
		model.addAttribute("nick", member.getNick());
		model.addAttribute("pw2", member.getPw2());
		
		model.addAttribute("domain", member.getDomain());
		model.addAttribute("mail", member.getMail());
		model.addAttribute("phone", member.getPhone());
		model.addAttribute("agree", member.getAgree());
		model.addAttribute("privacy", member.getPrivacy());
		model.addAttribute("status", member.getStatus());
		
		int result = memberImpl.idChk(member);
		int result2 = memberImpl.nickChk(member);
		
	
	try {
			
			if(result == 1 || result2 ==1) {
				System.out.println("아디있어");
				System.out.println("닉넴있어");
				return "/member/joinForm ";
				
			}else if (result == 0 && result2 ==0) {
				System.out.println("아디없어");
				System.out.println("닉넴없어");
//				member.setId(request.getParameter("id"));
//				member.setNick(request.getParameter("nick"));
//				member.setPw2(bCryptPasswordEncoder.encode(request.getParameter("pw2")));
//				
//				member.setDomain(request.getParameter("domain"));
//				member.setMail(request.getParameter("mail"));
//				member.setPhone(request.getParameter("phone"));
//				//int형식으로 형변환
//				member.setAgree(Integer.parseInt(request.getParameter("agree")));
//				member.setPrivacy(Integer.parseInt(request.getParameter("privacy")));
//				member.setStatus(Integer.parseInt(request.getParameter("status")));
//				model.addAttribute("id", member.getId());
//				model.addAttribute("nick", member.getNick());
//				model.addAttribute("pw2", member.getPw2());
//				
//				model.addAttribute("domain", member.getDomain());
//				model.addAttribute("mail", member.getMail());
//				model.addAttribute("phone", member.getPhone());
//				model.addAttribute("agree", member.getAgree());
//				model.addAttribute("privacy", member.getPrivacy());
//				model.addAttribute("status", member.getStatus());
				memberImpl.insertMember(member);
			}
			
		} catch (Exception e) {
			throw new RuntimeException();
		}
			return "main/main";
	
			
	}
	
	@ResponseBody
	@RequestMapping(value = "idChk.com", method = RequestMethod.POST)
	public int idChk(MemberDTO member) throws Exception {
		int result = memberImpl.idChk(member);
		return result ;
	}
	
	@ResponseBody
	@RequestMapping(value="nickChk.com", method = RequestMethod.POST)
	public int nickChk(MemberDTO member) throws Exception {
		int result2 = memberImpl.nickChk(member);
		return result2;
	}
	
	
	@RequestMapping(value="/privacyPopup.com", method = RequestMethod.GET)
	public String PrivacyPopup() throws Exception {
		
		return "/member/privacyPopup";
	}
	
	@RequestMapping(value="/agreePopup.com", method = RequestMethod.GET)
	public String agreePopup() throws Exception {
		
		return "/member/agreePopup";
	}
	
	@RequestMapping(value="login.com", method=RequestMethod.GET)
	public String login() throws Exception{
		return "/member/loginForm";
	}	
	
	@RequestMapping(value="/loginPro.com", method=RequestMethod.POST)
	public String selectLogin( HttpServletRequest request, HttpSession session) throws Exception {
		
		//입력받은 비밀번호를 다시 암호화시켜 기존 비밀번호와 비교한다
		String password = request.getParameter("pw2"); //입력받은거
//		String encPassword = bCryptPasswordEncoder.encode(password);//인코딩된거

		String id = request.getParameter("id");
		int logIdCheck = memberImpl.idChkLogin(id);			// db에 id가 있으면 1, 없으면 0
		
		if(logIdCheck == 1) {
			// pw 찾아서 로그인
			MemberDTO member = memberImpl.selectLogin(id);		// db에서 찾은거(사용자가 입력한 id값을 넣어서 db에 있는 pw를 가져온다)
			String pw2 = member.getPw2();
			
			
			if((bCryptPasswordEncoder.matches(password , pw2))){
				session.setAttribute("loginCheck",true);
				session.setAttribute("id", id);
				session.setAttribute("pw2", pw2);
				session.setAttribute("nick", member.getNick());
				session.setAttribute("status", member.getStatus());
				session.setAttribute("index_num", member.getIndex_num());

				return "redirect:/main.com";
			}else {
				return "/member/loginForm";
			}
		}else {
			return "/member/loginForm";
		}
		
	}
    
	@RequestMapping(value="/logout.com")
    public String logoutProcess(HttpSession session) {
        
        session.invalidate();
        
        return  "redirect:/main.com";
    }
	
	

}
