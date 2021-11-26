package com.kanbu.controller.board;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kanbu.dto.board.BoardDTO;
import com.kanbu.service.board.BoardService;


@Controller
public class BoardController {

	/*
	 * @Resource(name = "BoardDao") private BoardDao BoardDao;
	 */
	
	@Autowired
	private BoardService boardImpl;
	
	@Autowired
	private BoardDTO board;
	
	
	// ====== 공지 목록
	@RequestMapping("board/noticeList.com")
	public String noticeList(Model model) throws Exception{
		int adminNum = boardImpl.selectAdmin();
		
		List noticeList = boardImpl.selectNotice(adminNum);
		
		model.addAttribute("noticeList", noticeList);
		
		return "board/noticeList";	
	}
	
	// ====== 공지 상세보기
	@RequestMapping("/board/noticeDetail.com")
    public String noticeDetail (Model model, HttpServletRequest request) throws Exception{
		int index_num = Integer.parseInt(request.getParameter("noticeNum"));		// request : jsp에서 작업한 값들을 controller에서 사용할 수 있게 넘겨주는 역할
		BoardDTO noticeDetail = boardImpl.selectNoticeDetail(index_num);
        model.addAttribute("noticeDetail",noticeDetail);							// model : controller에서 작업한 값을 jsp에서 사용할 수 있게 넘겨주는 역할
        return "board/noticeDetail";
    }
	
	// ====== 공지 작성
	@RequestMapping(value = "/board/noticeWritePro.com", method = RequestMethod.POST)
    public String noticeWritePro(Model model, HttpServletRequest request) throws Exception{
//		String title = request.getParameter("title");
//		String content = request.getParameter("content");
//		int writer = boardImpl.selectAdmin();
		
		board.setContent(request.getParameter("content"));
		board.setTitle(request.getParameter("title"));
		board.setWriter(boardImpl.selectAdmin());
		
		boardImpl.insertBoard(board);
		
		
        return "redirect:/board/noticeList.com";
    }
	
	// ====== 공지 쓰기 폼
	@RequestMapping("board/noticeWrite.com")
	public String write() throws Exception{
		return "board/noticeWrite";
	}
	
	// ====== 공지 수정 폼
	@RequestMapping("board/noticeUpdateForm.com")
	public String noticeUpdate(HttpServletRequest request, Model model) throws Exception{
		int index_num = Integer.parseInt(request.getParameter("noticeNum"));
		board = boardImpl.selectNoticeDetail(index_num);
		
		model.addAttribute("noticeDetail", board);
		
		return "board/noticeUpdateForm";
	}
	
	// ====== 공지 수정 완료
	@RequestMapping(value = "/board/noticeUpdatePro.com", method = RequestMethod.POST)
    public String noticeUpdatePro(Model model, HttpServletRequest request) throws Exception{
		int index_num = Integer.parseInt(request.getParameter("noticeNum"));
		board.setContent(request.getParameter("content"));
		board.setTitle(request.getParameter("title"));
		board.setWriter(boardImpl.selectAdmin());
		
		
		boardImpl.noticeUpdate(board);
		
		
        return "redirect:/board/noticeDetail.com?noticeNum="+index_num;
    }
	
	// ====== 공지 삭제
	@RequestMapping("board/noticeDeletePro.com")
	public String noticeDelete(HttpServletRequest request, Model model) throws Exception{
		int index_num = Integer.parseInt(request.getParameter("noticeNum"));
		boardImpl.noticeDelete(index_num);
		return "redirect:/board/noticeList.com";
	}
	
	// ====== 질문 목록
	@RequestMapping("board/questionList.com")
	public String questionList() throws Exception{
		return "board/questionList";
	}
	
	// ====== 리뷰 목록
	@RequestMapping("board/reviewList.com")
	public String reviewList() throws Exception{
		return "board/reviewList";
	}
	
	
	//질문 쓰기 폼
	@RequestMapping("board/qaWrite.com")
	public String qaWrite() throws Exception{
		return "board/qaWrite";
	}
	
	/*
	 * @RequestMapping("board/noticeDetail.com") public String noticeDetail(Model
	 * model) throws Exception{ int adminNum = boardImpl.selectAdmin(); int
	 * selectNoticeDetail = boardImpl.selectNoticeDetail(selectNoticeDetail);
	 * 
	 * model.addAttribute("selectNoticeDetail", selectNoticeDetail); return
	 * "board/noticeDetail"; }
	 */
	
	

}

