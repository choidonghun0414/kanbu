package com.kanbu.controller.member;

import java.util.List;
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

import com.kanbu.dto.SearchDTO;
import com.kanbu.dto.board.BoardDTO;
import com.kanbu.dto.info.Place_ReplyDTO;
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
	@Autowired
	private Place_ReplyDTO place_reply;
	@Autowired
	private SearchDTO search;
	@Autowired
	private BoardDTO board;
	// 업로드 저장 경로
	private String uploadPath = "/kanbu/resources/img/review/";
	
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
	
		if(result == 1 || result2 ==1 || result3==1) {
			return "/member/joinForm ";
				
		}else if (result == 0 && result2 == 0 && result3 ==0) {
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
	
	@RequestMapping(value="login.com")
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
	
	// 회원수정페이지 처리
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
	
	@RequestMapping(value="/updatePw.com")
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
			return "redirect:/findPassword.com";
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
			return "/member/findPassword";
	}
	
	@ResponseBody
	@RequestMapping("/findPwChk")
	public int findPwChk(MemberDTO member) throws Exception {
		int result3 = memberImpl.findPwChk(member);
		return result3;
	}

	
	@RequestMapping(value="/deleteMember.com")
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
	
	// 마이페이지 내가 쓴 리뷰 목록 페이지
	@RequestMapping(value="/mypage/board/review.com")
	public String myReview(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		int pageSize = 9;											// 한페이지에 보여줄 정보 갯수
		String pageNum = request.getParameter("pageNum");			// view에서 넘어온 페이지번호
		if(pageNum == null) {										// view에서 넘어온 페이지번호가 없으면 1로 대입
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);				// 현재 페이지번호
		int startRow = (currentPage - 1) * pageSize + 1;			// 시작 번호
		int endRow = currentPage * pageSize;						// 끝 번호
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		
		int writer = (Integer)session.getAttribute("index_num");
		int myReviewCount = 0;
		int myReviewTagCount = 0;
		List<BoardDTO> myReviewList = null;
		List<BoardDTO> myReviewTagList = null;
		
		if(writer > 0) {
			board.setWriter(writer);
			myReviewCount = memberImpl.myReviewCount(writer);
			myReviewTagCount = memberImpl.myReviewTagCount(writer);
		}
		if(myReviewCount > 0) {
			myReviewList = memberImpl.myReview(board);
		}
		if(myReviewTagCount > 0) {
			myReviewTagList = memberImpl.myReviewTag(writer);
		}
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", board.getStartRow());
		request.setAttribute("endRow", board.getEndRow());
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		
		model.addAttribute("myReviewCount", myReviewCount);
		model.addAttribute("myReviewTagCount", myReviewTagCount);
		model.addAttribute("myReviewList", myReviewList);
		model.addAttribute("myReviewTagList", myReviewTagList);
		model.addAttribute("uploadPath", uploadPath);
		
		return "/member/myReviewList";
	}
	
	// 마이페이지 내가 쓴 리뷰 검색 결과 목록 페이지
	@RequestMapping(value="/mypage/board/review/search.com")
	public String myReviewSearch(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		int pageSize = 9;											// 한페이지에 보여줄 정보 갯수
		String pageNum = request.getParameter("pageNum");			// view에서 넘어온 페이지번호
		if(pageNum == null) {										// view에서 넘어온 페이지번호가 없으면 1로 대입
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);				// 현재 페이지번호
		int startRow = (currentPage - 1) * pageSize + 1;			// 시작 번호
		int endRow = currentPage * pageSize;						// 끝 번호
		search.setStartRow(startRow);
		search.setEndRow(endRow);
		
		int searchCount = 1;
		String thema = request.getParameter("thema");
		String keyword = request.getParameter("keyword");
		search.setThema(thema);
		search.setKeyword(keyword);
		
		int writer = (Integer)session.getAttribute("index_num");;
		int myReviewCount = 0;
		int myReviewTagCount = 0;
		List<BoardDTO> myReviewList = null;
		List<BoardDTO> myReviewTagList = null;
		
		if(writer > 0) {
			search.setWriter(writer);
		}
			
		if(thema.equals("p.title")) {											// 제목으로 검색
			myReviewCount = memberImpl.searchTitleMyReviewCount(search);
			myReviewTagCount = memberImpl.searchTitleMyReviewTagCount(search);
				
			if(myReviewCount > 0) {
				myReviewList = memberImpl.searchTitleMyReview(search);
			}
			if(myReviewTagCount > 0) {
				myReviewTagList = memberImpl.searchTitleMyReviewTag(search);
			}
		}
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", search.getStartRow());
		request.setAttribute("endRow", search.getEndRow());
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		
		model.addAttribute("searchCount", searchCount);
		model.addAttribute("search", search);
		model.addAttribute("myReviewCount", myReviewCount);
		model.addAttribute("myReviewTagCount", myReviewTagCount);
		model.addAttribute("myReviewList", myReviewList);
		model.addAttribute("myReviewTagList", myReviewTagList);
		model.addAttribute("uploadPath", uploadPath);
		
		return "/member/myReviewList";
	}
	
	// 마이페이지 내가 쓴 여행지 댓글 목록 페이지
	@RequestMapping(value="/mypage/info/placeReply.com")
	public String placeReplyInfo(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		int pageSize = 10;											// 한페이지에 보여줄 정보 갯수
		String pageNum = request.getParameter("pageNum");			// view에서 넘어온 페이지번호
		if(pageNum == null) {										// view에서 넘어온 페이지번호가 없으면 1로 대입
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);				// 현재 페이지번호
		int startRow = (currentPage - 1) * pageSize + 1;			// 시작 번호
		int endRow = currentPage * pageSize;						// 끝 번호
		place_reply.setStartRow(startRow);
		place_reply.setEndRow(endRow);
		
		int writer = (Integer)session.getAttribute("index_num");
		int myPlaceReplyCount = 0;
		List<Place_ReplyDTO> myPlaceReplyList = null;
		if(writer > 0) {
			place_reply.setWriter(writer);
			myPlaceReplyCount = memberImpl.myPlaceReplyCount(writer);
		}
		if(myPlaceReplyCount > 0) {
			myPlaceReplyList = memberImpl.myPlaceReply(place_reply);
		}
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", place_reply.getStartRow());
		request.setAttribute("endRow", place_reply.getEndRow());
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		
		model.addAttribute("myPlaceReplyCount", myPlaceReplyCount);
		model.addAttribute("myPlaceReplyList", myPlaceReplyList);
			
		return "/member/myPlaceReplyList";
	}
	
	// 마이페이지 내가 쓴 여행지 댓글 검색 결과 목록 페이지
	@RequestMapping("/mypage/info/placeReply/search.com")
	public String myPlaceReplySearch(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		int pageSize = 10;											// 한페이지에 보여줄 정보 갯수
		String pageNum = request.getParameter("pageNum");			// view에서 넘어온 페이지번호
		if(pageNum == null) {										// view에서 넘어온 페이지번호가 없으면 1로 대입
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);				// 현재 페이지번호
		int startRow = (currentPage - 1) * pageSize + 1;			// 시작 번호
		int endRow = currentPage * pageSize;						// 끝 번호
		search.setStartRow(startRow);
		search.setEndRow(endRow);
		
		int searchCount = 1;
		String thema = request.getParameter("thema");
		String keyword = request.getParameter("keyword");
		search.setThema(thema);
		search.setKeyword(keyword);
		
		int writer = (Integer)session.getAttribute("index_num");
		int myPlaceReplyCount = 0;
		List<Place_ReplyDTO> myPlaceReplyList = null;

		if(writer > 0) {
			search.setWriter(writer);
			myPlaceReplyCount = memberImpl.myPlaceReplySearchCount(search);
		}
	
		if(myPlaceReplyCount > 0) {
			myPlaceReplyList = memberImpl.myPlaceReplySearch(search);
		}
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", place_reply.getStartRow());
		request.setAttribute("endRow", place_reply.getEndRow());
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		
		model.addAttribute("searchCount", searchCount);
		model.addAttribute("search", search);
		model.addAttribute("myPlaceReplyCount", myPlaceReplyCount);
		model.addAttribute("myPlaceReplyList", myPlaceReplyList);

		return "/member/myPlaceReplyList";
	}
	
	
	// 마이페이지 내가 쓴 리뷰 댓글 페이지
	@RequestMapping("/mypage/board/reviewReply.com")
	public String reviewReplyInfo(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		int pageSize = 10;											// 한페이지에 보여줄 정보 갯수
		String pageNum = request.getParameter("pageNum");			// view에서 넘어온 페이지번호
		if(pageNum == null) {										// view에서 넘어온 페이지번호가 없으면 1로 대입
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);				// 현재 페이지번호
		int startRow = (currentPage - 1) * pageSize + 1;			// 시작 번호
		int endRow = currentPage * pageSize;						// 끝 번호
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		
		int writer = (Integer)session.getAttribute("index_num");
		int myReviewReplyCount = 0;
		List<BoardDTO> myReviewReplyList = null;

		if(writer > 0) {
			board.setWriter(writer);
			myReviewReplyCount = memberImpl.myReviewReplyCount(writer);
		}
	
		if(myReviewReplyCount > 0) {
			myReviewReplyList = memberImpl.myReviewReply(board);
		}
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", board.getStartRow());
		request.setAttribute("endRow", board.getEndRow());
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		
		model.addAttribute("myReviewReplyCount", myReviewReplyCount);
		model.addAttribute("myReviewReplyList", myReviewReplyList);

		return "/member/myReviewReplyList";
	}
	
	// 마이페이지 내가 쓴 리뷰 댓글 검색 결과 목록 페이지
	@RequestMapping("/mypage/board/reviewReply/search.com")
	public String myReviewReplySearch(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		int pageSize = 10;											// 한페이지에 보여줄 정보 갯수
		String pageNum = request.getParameter("pageNum");			// view에서 넘어온 페이지번호
		if(pageNum == null) {										// view에서 넘어온 페이지번호가 없으면 1로 대입
			pageNum = "1";
		}
			
		int currentPage = Integer.parseInt(pageNum);				// 현재 페이지번호
		int startRow = (currentPage - 1) * pageSize + 1;			// 시작 번호
		int endRow = currentPage * pageSize;						// 끝 번호
		search.setStartRow(startRow);
		search.setEndRow(endRow);
		
		int searchCount = 1;
		String thema = request.getParameter("thema");
		String keyword = request.getParameter("keyword");
		search.setThema(thema);
		search.setKeyword(keyword);
			
		int writer = (Integer)session.getAttribute("index_num");
		int myReviewReplyCount = 0;
		List<BoardDTO> myReviewReplyList = null;

		if(writer > 0) {
			search.setWriter(writer);
			myReviewReplyCount = memberImpl.myReviewReplySearchCount(search);
		}
		
		if(myReviewReplyCount > 0) {
			myReviewReplyList = memberImpl.myReviewReplySearch(search);
		}
			
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", search.getStartRow());
		request.setAttribute("endRow", search.getEndRow());
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		
		model.addAttribute("searchCount", searchCount);
		model.addAttribute("search", search);
		model.addAttribute("myReviewReplyCount", myReviewReplyCount);
		model.addAttribute("myReviewReplyList", myReviewReplyList);
		
		return "/member/myReviewReplyList";
	}

}
	
	
	

