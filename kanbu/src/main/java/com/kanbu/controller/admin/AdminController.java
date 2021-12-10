package com.kanbu.controller.admin;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kanbu.dto.SearchDTO;
import com.kanbu.dto.info.PlaceDTO;
import com.kanbu.dto.member.MemberDTO;
import com.kanbu.service.admin.AdminService;




@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminImpl;
	
	@Autowired
	private MemberDTO member;
	
	@Autowired
	private PlaceDTO place;
	
	@Autowired
	private SearchDTO search;
	
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
		request.setAttribute("startRow", member.getStartRow());
		request.setAttribute("endRow", member.getEndRow());
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		
		model.addAttribute("placeCount", placeCount);
		model.addAttribute("placeList", placeList);
	
		return "/admin/info/placeList";
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
		search.setStartRow(startRow);
		search.setEndRow(endRow);
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", search.getStartRow());
		request.setAttribute("endRow", search.getEndRow());
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		
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
		}
		
		return "";
	}



}
