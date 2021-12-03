package com.kanbu.controller.info;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kanbu.dto.info.PlaceDTO;
import com.kanbu.dto.info.Place_ReplyDTO;
import com.kanbu.service.info.InfoService;


@Controller
public class InfoController {
	
	@Autowired
	private InfoService infoImpl;
	
	@Autowired
	private PlaceDTO placeInfo;
	
	@Autowired
	private Place_ReplyDTO place_reply;
	
	// 장소목록 페이지
	@RequestMapping("place.com")
	public String place(HttpServletRequest request, Model model) throws Exception{
		int pageSize = 5;											// 한페이지에 보여줄 정보 갯수
		String pageNum = request.getParameter("pageNum");			// view에서 넘어온 페이지번호
		if(pageNum == null) {										// view에서 넘어온 페이지번호가 없으면 1로 대입
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);				// 현재 페이지번호
		int startRow = (currentPage - 1) * pageSize + 1;			// 시작 번호
		int endRow = currentPage * pageSize;						// 끝 번호
		
		List<PlaceDTO> placeList = null;							// 장소정보리스트
		int placeCount = infoImpl.selectPlaceCount();				// 장소정보갯수
		
		if(placeCount > 0) {
			placeList = infoImpl.selectPlace();
		}
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", startRow);
		request.setAttribute("endRow", endRow);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);

		model.addAttribute("placeCount", placeCount);
		model.addAttribute("placeList", placeList);
		
		return "/info/placeList";
	}
	
	// 해당 장소 정보 페이지
	@RequestMapping("info.com")
	public String info(HttpServletRequest request, Model model) throws Exception{
		
		// 해당 장소 상세정보
		int index_num = Integer.parseInt(request.getParameter("placeNum"));		// index_num : 해당장소 고유번호
		
		// 조회수 증가
		infoImpl.updateViews(index_num);
		
		int count = infoImpl.selectPlaceInfoCount(index_num);					// count : 해당 여행지 정보 갯수
		
		if(count > 0) {
			placeInfo = infoImpl.selectPlaceInfo(index_num);
		}
		
		// 해당 장소 댓글 페이지 처리
		int pageSize = 5;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		// 해당 장소 댓글 조회
		int reply_count = infoImpl.selectPlaceReplyCount(index_num);
		List<Place_ReplyDTO> place_replyList = null;
		
		if(reply_count > 0) {
			place_replyList = infoImpl.selectPlaceReply(index_num);
		}
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", startRow);
		request.setAttribute("endRow", endRow);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		
		model.addAttribute("count", count);
		model.addAttribute("placeInfo", placeInfo);
		model.addAttribute("reply_count", reply_count);
		model.addAttribute("place_replyList", place_replyList);
		
		return "/info/info";
	}
	
	
	
	// 해당 장소 댓글 등록
	@RequestMapping(value="/info/reply.com", method = RequestMethod.POST)
	public String replyWrite(HttpServletRequest request) throws Exception{
		
		place_reply.setWriter(1);	// 작성자 코드 변경(세션 이용하기)
		place_reply.setPlace(Integer.parseInt(request.getParameter("placeNum")));
		place_reply.setContent(request.getParameter("content"));

		infoImpl.insertPlaceReply(place_reply);
		
		return "redirect:/info.com?placeNum="+place_reply.getPlace();
	}
	
	



}
