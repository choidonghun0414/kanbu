package com.kanbu.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kanbu.dto.info.PlaceDTO;
import com.kanbu.service.MainService;



@Controller
public class MainController {
	
	@Autowired
	private MainService mainImpl;
	
	@RequestMapping("main.com")
	public String main() throws Exception{
		return "/main/main";
	}
	
	@RequestMapping("search.com")
	public String search(HttpServletRequest request, Model model) throws Exception{
		int pageSize = 5;											// 한페이지에 보여줄 정보 갯수
		String pageNum = request.getParameter("pageNum");			// view에서 넘어온 페이지번호
		if(pageNum == null) {										// view에서 넘어온 페이지번호가 없으면 1로 대입
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);				// 현재 페이지번호
		int startRow = (currentPage - 1) * pageSize + 1;			// 시작 번호
		int endRow = currentPage * pageSize;						// 끝 번호
		
		String place = request.getParameter("keyword");
		int searchCount = mainImpl.selectKeywordCount(place);
		List<PlaceDTO> searchList = null;
		
		if(searchCount > 0) {
			searchList = mainImpl.selectKeywordPlaceNum(place);
		}
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", startRow);
		request.setAttribute("endRow", endRow);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		
		model.addAttribute("searchCount", searchCount);
		model.addAttribute("searchList", searchList);
		model.addAttribute("place", place);
		
		return "/main/searchList";
	}


}
