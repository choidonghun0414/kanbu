package com.kanbu.controller.member;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.kanbu.dto.member.MemberDTO;

import com.kanbu.email.member.Email;
import com.kanbu.email.member.EmailSender;
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
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private Email email;
	
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
		int result3 = memberImpl.mailChk(member);	
	
	try {
			
			if(result == 1 || result2 ==1 || result3==1) {
				System.out.println("아디있어");
				System.out.println("닉넴있어");
				System.out.println("이메일있어");
				return "/member/joinForm ";
				
			}else if (result == 0 && result2 ==0 && result3 ==0) {
				System.out.println("아디없어");
				System.out.println("닉넴없어");
				System.out.println("이메일없어");
				memberImpl.insertMember(member);
			}
			
		} catch (Exception e) {
			throw new RuntimeException();
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
	
	@ResponseBody
	@RequestMapping(value="mailChk.com", method = RequestMethod.POST)
	public int mailChk(MemberDTO member) throws Exception {
		int result3 = memberImpl.mailChk(member);
		return result3;
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
				session.setAttribute("pw2Chk", password);
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
	@RequestMapping(value="/selectId.com", method = RequestMethod.GET)
	public String selectIdForm () throws Exception{
		return "/member/findIdForm";
	}
	
	
	
	@RequestMapping(value="/selectIdPro.com", method = RequestMethod.POST)
	public String selectIdPro (HttpServletRequest request, Model model) throws Exception{
		
		member.setPhone(request.getParameter("phone"));
		member.setMail(request.getParameter("mail"));
		member.setDomain(request.getParameter("domain"));
		String id = memberImpl.selectId(member);
		model.addAttribute("id", id);
		
		return "/member/findIdPro";
	}
	
	@RequestMapping(value="/updatePw.com", method=RequestMethod.GET)
	public String updatePw() throws Exception{
		return "/member/findPwForm";
	}
	
	
	@RequestMapping(value="/updatePwPro.com", method = RequestMethod.POST)
	public String updatePwPro(@Valid MemberDTO memberView, HttpServletRequest request, 
			HttpSession session) throws Exception{
		
		// DB에 업데이트 될 memberDTO 정보
		member.setId(request.getParameter("id"));
		member.setPhone(request.getParameter("phone"));
		member.setMail(request.getParameter("mail"));
		member.setDomain(request.getParameter("domain"));
		
		// 이용자에게 보여주는 memberDTO 정보
		memberView.setId(request.getParameter("id"));
		memberView.setPhone(request.getParameter("phone"));
		memberView.setMail(request.getParameter("mail"));

		int result3 = memberImpl.findPwChk(member);
		
		String domain = member.getDomain();

		if(result3 == 0) {
			return "/member/findPwProError";
		}else {
			
			if (domain.equals("1")) {
				memberView.setDomain("naver.com");
			}else if (domain.equals("2")) {
				memberView.setDomain("gmail.com");
			}else if (domain.equals("3")) {
				memberView.setDomain("daum.net");
			}
			
			Random r = new Random();
			int num = r.nextInt(89999) + 10000;
			String npassword = "kanbu" + Integer.toString(num);// 새로운 비밀번호 변경
			memberView.setPw2(npassword);	//비번변경(view용)
			member.setPw2(bCryptPasswordEncoder.encode(npassword));//비번변경(DB용)
			
			memberImpl.updatePw(member);

			session.setAttribute("memberDTO", memberView);//세션에 저장
			
			System.out.println("비번 생성성공");
			return "/member/findPassword";
		}
	}
	
	// 이메일로 비밀번호가 전송이된다.
	@RequestMapping("/findPassword.com")
	public String findPasswordOK(MemberDTO memberView, HttpSession session) throws Exception {
		System.out.println("이메일 발송시작");
		memberView = (MemberDTO) session.getAttribute("memberDTO");
			email.setContent("새로운 비밀번호 " + memberView.getPw2() + " 입니다." );
			email.setReceiver(member.getMail()+"@"+memberView.getDomain());
			email.setSubject("안녕하세요"+memberView.getMail()+"@"+memberView.getDomain() +"님  재설정된 비밀번호를 확인해주세요");
			emailSender.SendEmail(email);
			System.out.println(email);
			session.invalidate();
			System.out.println("새로운 비밀번호 " + memberView.getPw2() + " 입니다.");
			System.out.println(memberView.getMail()+"@"+memberView.getDomain());
			System.out.println("이메일 발송됐음");
			return "/member/loginForm";
	}
	
	@ResponseBody
	@RequestMapping("/findPwChk")
	public int findPwChk(MemberDTO member) throws Exception {
		int result3 = memberImpl.findPwChk(member);
		return result3;
	}

	
	@RequestMapping(value="/deleteMember.com", method = RequestMethod.GET)
	public String deleteMember() throws Exception{
		return "/member/deleteForm";
	}
	
	@RequestMapping(value="/deleteMemberPro.com", method = RequestMethod.POST)
	public String deleteMemberPro( MemberDTO memberView ,HttpSession session) throws Exception{
		
		session.getAttribute("id");
		session.getAttribute("pw2");
		boolean pwdChk  = bCryptPasswordEncoder.matches(memberView.getPw2(), (String) session.getAttribute("pw2"));
	
			if(pwdChk == true) {
				memberImpl.deleteMember(memberView);
				System.out.println("탈퇴성공");
				session.invalidate();
				return "/member/deleteMemberPro";
			}
			
			System.out.println("탈퇴실패");
			return "redirect:/deleteMember.com" ;

	}

}
	
	
	

