package com.kanbu.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.kanbu.dto.member.MemberDTO;
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
		
		// 아이디, 닉네임 중복검사
		int result = memberImpl.idChk(member);
		int result2 = memberImpl.nickChk(member);
		
		if(result == 1 || result2 ==1) {
			return "/member/joinForm ";		
		}else if (result == 0 && result2 ==0) {
			memberImpl.insertMember(member);	
		}
			
		return "redirect:/main.com";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "idChk.com", method = RequestMethod.POST)
	public int idChk(MemberDTO member) throws Exception {
		int result = memberImpl.idChk(member);
		return result ;
	}
	
	// 회원가입 닉네임 중복체크 매핑
	@ResponseBody
	@RequestMapping(value="nickChk.com", method = RequestMethod.POST)
	public int nickChk(MemberDTO member) throws Exception {
		int result2 = memberImpl.nickChk(member);
		return result2;
	}
	
	// 회원수정 닉네임 중복체크 매핑
	@ResponseBody
	@RequestMapping(value="/mypage/nickChk.com", method = RequestMethod.POST)
	public int myNickChk(MemberDTO member) throws Exception {
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
    public String logoutProcess(HttpSession session) throws Exception{
        
        session.invalidate();
        
        return  "redirect:/main.com";
    }
	
	// 마이페이지
	@RequestMapping("/mypage.com") 
	public String mypage() throws Exception{
		return "/member/mypage";
	}
	
	// 회원수정페이지
	@RequestMapping("/mypage/memberInfo.com")
	public String memberUpdate(HttpServletRequest request, Model model) throws Exception{
		int index_num = Integer.parseInt(request.getParameter("memberNum"));
		member = memberImpl.myInfo(index_num);
		
		model.addAttribute("member", member);
		
		return "/member/memberUpdate";
	}
	
	// 회원수정페이지
	@RequestMapping("/mypage/memberInfoUpdate.com")
	public String memberUpdatePro(HttpServletRequest request, HttpSession session) throws Exception{
		member.setIndex_num(Integer.parseInt(request.getParameter("index_num")));
		member.setId(request.getParameter("id"));
		member.setNick(request.getParameter("nick"));
		member.setPhone(request.getParameter("phone"));
		member.setMail(request.getParameter("mail"));
		member.setDomain(request.getParameter("domain"));
			
		memberImpl.myInfoUpdate(member);
		session.setAttribute("nick", member.getNick());
						
		return "redirect:/mypage/memberInfo.com?memberNum="+member.getIndex_num();
	}
	

}
