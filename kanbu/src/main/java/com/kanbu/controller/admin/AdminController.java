package com.kanbu.controller.admin;


import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.apt.util.EclipseFileManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.kanbu.dto.SearchDTO;
import com.kanbu.dto.board.BoardDTO;
import com.kanbu.dto.info.PlaceDTO;
import com.kanbu.dto.info.Place_ReplyDTO;
import com.kanbu.dto.member.MemberDTO;
import com.kanbu.service.admin.AdminService;
import com.kanbu.service.info.InfoService;




@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminImpl;
	
	@Autowired
	private InfoService infoImpl;
	
	@Autowired
	private MemberDTO member;
	
	@Autowired
	private PlaceDTO place;
	
	@Autowired
	private SearchDTO search;
	
	@Autowired
	private Place_ReplyDTO place_reply;
	
	@Autowired
	private BoardDTO board;
	
	// 업로드 저장 경로
	private String uploadPath = "/kanbu/resources/img/place/"; 
	
	// 관리자 페이지
	@RequestMapping("admin.com")
	public String admin() throws Exception{
		return "/admin/admin";
	}
	
	// 관리자 회원 조회 페이지
	@RequestMapping("/admin/memberInfo.com")
	public String adminMember(HttpServletRequest request, Model model) throws Exception{
		
		// 페이징 처리
		int pageSize = 10;											// 한페이지에 보여줄 정보 갯수
		String pageNum = request.getParameter("pageNum");			// view에서 넘어온 페이지번호
		if(pageNum == null) {										// view에서 넘어온 페이지번호가 없으면 1로 대입
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);				// 현재 페이지번호
		int startRow = (currentPage - 1) * pageSize + 1;			// 시작 번호
		int endRow = currentPage * pageSize;						// 끝 번호
		member.setStartRow(startRow);
		member.setEndRow(endRow);
		
		
		// 전체 회원 정보 조회(관리자 포함)
		int memberCount = adminImpl.selectTotalMemberCount();
		List<MemberDTO> memberList = null;
		
		if(memberCount > 0) {
			memberList = adminImpl.selectTotalMember(member);
		}
			
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", member.getStartRow());
		request.setAttribute("endRow", member.getEndRow());
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
				
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("memberList", memberList);
	
		return "/admin/member/memberList";
	}
	
	// 관리자 여행지 조회 페이지
	@RequestMapping("/admin/placeInfo.com")
	public String adminPlace(HttpServletRequest request, Model model) throws Exception{
		
		// 페이징 처리
		int pageSize = 10;											// 한페이지에 보여줄 정보 갯수
		String pageNum = request.getParameter("pageNum");			// view에서 넘어온 페이지번호
		if(pageNum == null) {										// view에서 넘어온 페이지번호가 없으면 1로 대입
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);				// 현재 페이지번호
		int startRow = (currentPage - 1) * pageSize + 1;			// 시작 번호
		int endRow = currentPage * pageSize;						// 끝 번호
		place.setStartRow(startRow);
		place.setEndRow(endRow);
		
		// 장소 전체 정보 조회
		int placeCount = adminImpl.selectTotalPlaceCount();
		List<PlaceDTO> placeList = null;
		
		if(placeCount > 0) {
			placeList = adminImpl.selectTotalPlace(place);
		}
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", place.getStartRow());
		request.setAttribute("endRow", place.getEndRow());
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		
		model.addAttribute("placeCount", placeCount);
		model.addAttribute("placeList", placeList);
	
		return "/admin/info/placeList";
	}
	
	// 관리자 여행지 등록 페이지
	@RequestMapping("/admin/placeAdd.com")
	public String adminPlaceAdd() throws Exception{
		return "/admin/info/placeAdd";
	}
	
	// 관리자 여행지 등록 처리 페이지
	@RequestMapping("/admin/placeAddPro.com")
	public String adminPlaceAddPro(MultipartHttpServletRequest ms, HttpServletRequest request, 
								   HttpSession session, Model model) throws Exception{
		// 여행지 등록값
		place.setName(request.getParameter("name"));
		place.setAddr(request.getParameter("addr"));
		place.setLatitude(Double.parseDouble(request.getParameter("latitude")));
		place.setLongitude(Double.parseDouble(request.getParameter("longitude")));
		place.setInfo(request.getParameter("info"));
		place.setTel(request.getParameter("tel"));
		place.setHoliday(request.getParameter("holiday"));
		place.setParking(Integer.parseInt(request.getParameter("parking")));
		place.setFee1(Integer.parseInt(request.getParameter("fee1")));
		place.setFee2(Integer.parseInt(request.getParameter("fee2")));
		place.setOpening(Integer.parseInt(request.getParameter("opening")));
		place.setClosing(Integer.parseInt(request.getParameter("closing")));
		
		// 저장경로 설정(로컬 컴퓨터에서 실제로 저장되는 경로)
		String root = session.getServletContext().getRealPath("/");			
		String path = root + "\\resources\\img\\place\\";
				
		// 파일 가져오기
		MultipartFile mf1 = ms.getFile("picture1");						
		MultipartFile mf2 = ms.getFile("picture2");						
		MultipartFile mf3 = ms.getFile("picture3");						
		MultipartFile mf4 = ms.getFile("picture4");					
		MultipartFile mf5 = ms.getFile("picture5");
		String picture1 = null;
		String picture2 = null;
		String picture3 = null;
		String picture4 = null;
		String picture5 = null;
		
		if(!mf1.isEmpty()) {
			picture1 = mf1.getOriginalFilename();		// 기존 파일 이름(오리지널)
			File f1 = new File(path+picture1);			
			mf1.transferTo(f1);							// 파일 저장
			place.setPicture1(picture1);
		}
		if(!mf2.isEmpty()) {
			picture2 = mf2.getOriginalFilename();
			File f2 = new File(path+picture2);
			mf2.transferTo(f2);
			place.setPicture2(picture2);
		}
		if(!mf3.isEmpty()) {
			picture3 = mf3.getOriginalFilename();
			File f3 = new File(path+picture3);
			mf3.transferTo(f3);
			place.setPicture3(picture3);
		}
		if(!mf4.isEmpty()) {
			picture4 = mf4.getOriginalFilename();
			File f4 = new File(path+picture4);
			mf4.transferTo(f4);
			place.setPicture4(picture4);
		}
		if(!mf5.isEmpty()) {
			picture5 = mf5.getOriginalFilename();
			File f5 = new File(path+picture5);
			mf5.transferTo(f5);
			place.setPicture5(picture5);
		}
							
		// 여행지 DB에 저장
		adminImpl.insertPlace(place);
		
		return "redirect:/admin/placeInfo.com";
	}
	
	// 관리자 여행지 수정 페이지
	@RequestMapping("/admin/placeInfo/edit.com")
	public String adminPlaceUpdate(HttpServletRequest request, Model model) throws Exception{
		// 해당 장소 상세정보
		int index_num = Integer.parseInt(request.getParameter("placeNum"));		// index_num : 해당장소 고유번호
		System.out.println(index_num);
		
		int count = infoImpl.selectPlaceInfoCount(index_num);					// count : 해당 여행지 정보 갯수
		System.out.println(count);
		
		if(count > 0) {
			place = infoImpl.selectPlaceInfo(index_num);
		}
		
		model.addAttribute("count", count);
		model.addAttribute("placeInfo", place);
		
		return "/admin/info/placeUpdate";
	}
	
	// 관리자 여행지 댓글 조회 페이지
	@RequestMapping("/admin/placeReply.com")
	public String adminPlaceReply(HttpServletRequest request, Model model) throws Exception{
		
		// 페이징 처리
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
				
		// 장소 전체 정보 조회
		int placeReplyCount = adminImpl.selectTotalPlaceReplyCount();
		List<Place_ReplyDTO> placeReplyList = null;
		
		if(placeReplyCount > 0) {
			placeReplyList = adminImpl.selectTotalPlaceReply(place_reply);
		}
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", place_reply.getStartRow());
		request.setAttribute("endRow", place_reply.getEndRow());
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
				
		model.addAttribute("placeReplyCount", placeReplyCount);
		model.addAttribute("placeReplyList", placeReplyList);
		
		return "/admin/info/placeReplyList";
	}
	
	// 관리자 여행후기 조회 페이지
	@RequestMapping("/admin/board/reviewInfo.com")
	public String adminReview(HttpServletRequest request, Model model) throws Exception{
		// 페이징 처리
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
		
		int reviewCount = adminImpl.selectReviewCount();
		int reviewTagCount = adminImpl.selectReviewTagCount();
		List reviewList = null;
		List reviewTagList = null;
		
		if(reviewCount > 0) {
			reviewList = adminImpl.selectReview(board);
		}
		if(reviewTagCount > 0) {
			reviewTagList = adminImpl.selectReviewTag();
		}
		
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", board.getStartRow());
		request.setAttribute("endRow", board.getEndRow());
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewTagCount", reviewTagCount);
		model.addAttribute("reviewTagList", reviewTagList);
		
		
		return "/admin/board/reviewList";
	}
	
	// 관리자 검색 기능
	@RequestMapping("/admin/search.com")
	public String adminSearch(HttpServletRequest request, Model model) throws Exception{
		
		// 관리자 입력 검색테마 및 키워드 저장
		search.setThema(request.getParameter("thema"));
		search.setKeyword(request.getParameter("keyword"));
		 
		// 페이징 처리
		int pageSize = 10;											// 한페이지에 보여줄 정보 갯수
		String pageNum = request.getParameter("pageNum");			// view에서 넘어온 페이지번호
		if(pageNum == null) {										// view에서 넘어온 페이지번호가 없으면 1로 대입
			pageNum = "1";
		}
			
		int currentPage = Integer.parseInt(pageNum);				// 현재 페이지번호
		int startRow = (currentPage - 1) * pageSize + 1;			// 시작 번호
		int endRow = currentPage * pageSize;						// 끝 번호
		int searchCount = 1;
		search.setStartRow(startRow);
		search.setEndRow(endRow);
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", search.getStartRow());
		request.setAttribute("endRow", search.getEndRow());
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		
		model.addAttribute("searchCount", searchCount);
		model.addAttribute("thema", search.getThema());
		model.addAttribute("keyword", search.getKeyword());
		
		// 테마별 검색 결과
		if(search.getThema().equals("name")) {
			int placeCount = 0;
			List<PlaceDTO> placeList = null;
			 
			placeCount = adminImpl.selectKeywordPlaceCount(search);
			if(placeCount > 0) {
				placeList = adminImpl.selectKeywordPlace(search);
			}	
			 
			model.addAttribute("placeCount", placeCount);
			model.addAttribute("placeList", placeList);
				 
			return "/admin/info/placeList";
			
		}else if(search.getThema().equals("id") || search.getThema().equals("nick")) {
			int memberCount = 0;
			List<MemberDTO> memberList = null;
			
			memberCount = adminImpl.selectKeywordMemberCount(search);
			if(memberCount > 0) {
				memberList = adminImpl.selectKeywordMember(search);
			}
			
			model.addAttribute("memberCount", memberCount);
			model.addAttribute("memberList", memberList);
			
			return "/admin/member/memberList";
			
		}else if(search.getThema().equals("p.name") || search.getThema().equals("m.nick") || search.getThema().equals("pr.content")) {
			int placeReplyCount = 0;
			List<Place_ReplyDTO> placeReplyList = null;
			
			placeReplyCount = adminImpl.selectKeywordPlaceReplyCount(search);
			if(placeReplyCount > 0) {
				placeReplyList = adminImpl.selectKeywordPlaceReply(search);
			}
			
			model.addAttribute("placeReplyCount", placeReplyCount);
			model.addAttribute("placeReplyList", placeReplyList);
			
			return "/admin/info/placeReplyList";
			
		}else if(search.getThema().equals("p.title") || search.getThema().equals("rm.nick")) {
			int reviewCount = 0;
			int reviewTagCount = 0;
			List<BoardDTO> reviewList = null;
			List<BoardDTO> reviewTagList = null;
			
			reviewCount = adminImpl.searchReviewCount(search);
			reviewTagCount = adminImpl.searchReviewTagCount(search);
			
			if(reviewCount > 0) {
				reviewList = adminImpl.searchReview(search);
			}
			if(reviewTagCount > 0) {
				reviewTagList = adminImpl.searchReviewTag(search);
			}
			
			model.addAttribute("reviewCount", reviewCount);
			model.addAttribute("reviewTagCount", reviewTagCount);
			model.addAttribute("reviewList", reviewList);
			model.addAttribute("reviewTagList", reviewTagList);
			
			return "/admin/board/reviewList";
	
		}
		
		return "";
	}



}
