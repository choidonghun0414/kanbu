package com.kanbu.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kanbu.dto.SearchDTO;
import com.kanbu.dto.board.BoardDTO;
import com.kanbu.dto.info.PlaceDTO;
import com.kanbu.service.MainService;
import com.kanbu.service.board.BoardService;
import com.kanbu.service.info.InfoService;



@Controller
public class MainController {
	
	@Autowired
	private MainService mainImpl;
	
	@Autowired
	private InfoService infoImpl;
	
	@Autowired
	private BoardService boardImpl;
	
	@Autowired
	private SearchDTO search;
	
	@Autowired
	private PlaceDTO place;
	
	// 업로드 저장 경로
	private String uploadPath = "/kanbu/resources/img/place/"; 
	
	@RequestMapping("main.com")
	public String main(Model model) throws Exception{
		int rownum = 6;													// 추출 갯수
		int placeCount = infoImpl.selectPlaceCount();
		int reviewCount = boardImpl.selectReviewCount();
		int reviewTagCount = 0;
		List<PlaceDTO> popularPlaceList = null;
		List<BoardDTO> popularReviewList = null;
		List<BoardDTO> popularReviewTagList = null;
		
		if(placeCount > 0) {
			popularPlaceList = mainImpl.popularPlace(rownum);			// 인기 여행지 추출(6개)
		}
		if(reviewCount > 0) {
			popularReviewList = mainImpl.popularReview(rownum);			// 인기 리뷰 추출(6개)
			
			List<Integer> indexList = new ArrayList<Integer>();			// 인기 리뷰번호 리스트
			
			for(int i=0; i < popularReviewList.size(); i++) {
				indexList.add(popularReviewList.get(i).getIndex_num());
			}
			
			reviewTagCount = mainImpl.popularTagReviewCount(indexList);
			if(reviewTagCount > 0) {
				popularReviewTagList = mainImpl.popularTagReview(indexList);
			}
		}
		
		model.addAttribute("placeCount", placeCount);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("reviewTagCount", reviewCount);
		model.addAttribute("popularPlaceList", popularPlaceList);
		model.addAttribute("popularReviewList", popularReviewList);
		model.addAttribute("popularReviewTagList", popularReviewTagList);
		model.addAttribute("uploadPath", uploadPath);
		
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
		search.setStartRow(startRow);
		search.setEndRow(endRow);
		place.setStartRow(startRow);
		place.setEndRow(endRow);
		
		String keyword = request.getParameter("keyword");
		int searchCount = mainImpl.selectKeywordCount(keyword);
		int recentPlaceCount = mainImpl.recentPlaceCount();
		List<PlaceDTO> searchList = null;
		List<PlaceDTO> recentPlaceList = null;
		
		if(searchCount > 0) {
			search.setKeyword(keyword);
			searchList = mainImpl.selectKeywordPlaceNum(search);
		}
		if(recentPlaceCount > 0) {
			recentPlaceList = mainImpl.recentPlace(place);
		}
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", startRow);
		request.setAttribute("endRow", endRow);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		
		model.addAttribute("searchCount", searchCount);
		model.addAttribute("searchList", searchList);
		model.addAttribute("keyword", keyword);
		
		model.addAttribute("recentPlaceCount", recentPlaceCount);
		model.addAttribute("recentPlaceList", recentPlaceList);
		model.addAttribute("uploadPath", uploadPath);
		
		return "/main/searchList";
	}


}
