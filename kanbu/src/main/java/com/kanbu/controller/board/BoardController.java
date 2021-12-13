package com.kanbu.controller.board;

import java.util.List;

import javax.annotation.Resource;
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

	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private BoardService boardImpl;
	
	@Autowired
	private BoardDTO board;
	
	
	// ====== 공지 목록
	@RequestMapping("board/noticeList.com")
	public String noticeList(HttpServletRequest request, Model model) throws Exception{
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
		
		int noticeCount = boardImpl.selectNoticeCount();
		List<BoardDTO> noticeList = null;
		
		if(noticeCount > 0) {
			noticeList = boardImpl.selectNotice(board);
		}
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", board.getStartRow());
		request.setAttribute("endRow", board.getEndRow());
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
				
		model.addAttribute("noticeCount", noticeCount);
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
	
	// ====== 질문 쓰기 폼
	@RequestMapping("board/qaWrite.com")
	public String qaWrite() throws Exception{
		return "board/qaWrite";
	}
		
	
	// ====== 리뷰 목록
	@RequestMapping("board/reviewList.com")
	public String reviewList(HttpServletRequest request, Model model) throws Exception{
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
		
		int reviewCount = boardImpl.selectReviewCount();
		int reviewTagCount = boardImpl.selectReviewTagCount();
		List reviewList = null;
		List reviewTagList = null;
		
		if(reviewCount > 0) {
			reviewList = boardImpl.selectReview(board);
		}
		if(reviewTagCount > 0) {
			reviewTagList = boardImpl.selectReviewTag();
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
		
		return "board/reviewList";
	}
	
	// ====== 리뷰 상세 보기
	@RequestMapping("board/reviewDetail.com")
	public String reviewDetail(HttpServletRequest request, Model model) throws Exception{
		int index_num = Integer.parseInt(request.getParameter("reviewNum"));
		board = boardImpl.selectReviewDetail(index_num);
		List tagList = boardImpl.selectReviewDetailTag(index_num);
		
		model.addAttribute("selectReview", board);
		model.addAttribute("tagList", tagList);		
		
		return "board/reviewDetail";
	}
	
	// ====== 리뷰 쓰기 폼
	@RequestMapping("board/reviewWrite.com")
	public String reviewWrite() throws Exception{
		return "board/reviewWrite";
	}
	
	// ====== 리뷰 작성
	@RequestMapping(value = "/board/reviewWritePro.com", method = RequestMethod.POST)
    public String reviewWritePro(Model model, HttpServletRequest request) throws Exception{

		board.setContent(request.getParameter("content"));
		board.setTitle(request.getParameter("title"));
		board.setWriter(boardImpl.selectAdmin());
		
		boardImpl.insertBoard(board);
		
		
        return "redirect:/board/reviewList.com";
    }

	// ====== 리뷰 수정 폼
		@RequestMapping("board/reviewUpdateForm.com")
		public String reviewUpdate(HttpServletRequest request, Model model) throws Exception{
			int index_num = Integer.parseInt(request.getParameter("reviewNum"));
			board = boardImpl.selectReviewDetail(index_num);
			List tagList = boardImpl.selectReviewDetailTag(index_num);
			
			model.addAttribute("selectReview", board);
			model.addAttribute("tagList", tagList);	
			
			return "board/reviewUpdateForm";
		}
		
		// ====== 리뷰 수정 완료
		@RequestMapping(value = "/board/reviewUpdatePro.com", method = RequestMethod.POST)
	    public String reviewUpdatePro(Model model, HttpServletRequest request) throws Exception{
			int index_num = Integer.parseInt(request.getParameter("reviewNum"));
			board.setContent(request.getParameter("content"));
			board.setTitle(request.getParameter("title"));
			board.setWriter(boardImpl.selectAdmin());
			
			
			boardImpl.reviewUpdate(board);
			
			
	        return "redirect:/board/reviewDetail.com?reviewNum="+index_num;
	    }
	
//	@RequestMapping(value="/board/reviewWritePro.com", method = RequestMethod.POST) 
//	public String insertBoard(MultipartFile uploadFile, HttpServletRequest request) throws Exception { 
//			// 파일 업로드 처리
//			String Picture1 = null;
//			uploadFile = board.getUploadFile();
//			if (!uploadFile.isEmpty()) {
//				String originalFileName = uploadFile.getOriginalFilename();
//				String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
//				UUID uuid = UUID.randomUUID();	//UUID 구하기
//				Picture1=uuid+"."+ext;
//				uploadFile.transferTo(new File("D:\\upload\\" + Picture1));
//			}
//			
//			board.setTitle(request.getParameter("title"));
//			board.setContent(request.getParameter("content"));
//			board.setWriter(boardImpl.selectAdmin());
//			board.setPicture1(Picture1);
//			
//			boardImpl.insertReview(board); 
//			return "redirect:/board/reviewList.com"; 
//	}
	
//	@RequestMapping(value="/board/reviewWritePro.com", method = RequestMethod.POST) 
//	public String insertBoard(MultipartFile file, Model model) throws Exception { 
//			// 파일 업로드 처리
//		logger.info("originalName: " + file.getOriginalFilename());
//		logger.info("size: " + file.getSize());
//		logger.info("contentType: " + file.getContentType());
//
//		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
//			
//		model.addAttribute("savedName", savedName);
//
//		return "uploadResult";
//
//	}
//	
//	private String uploadFile(String originalName, byte[] fileData) throws Exception {
//
//		UUID uid = UUID.randomUUID();
//		String savedName = uid.toString() + "_" + originalName;
//		File target = new File(uploadPath, savedName);
//		FileCopyUtils.copy(fileData, target);
//		return savedName;
//	}
	
//	@RequestMapping(value="/board/reviewWritePro.com",method=RequestMethod.POST)
//	public String insertBoard(@ModelAttribute("board") BoardDTO board,
//			                        BindingResult result) {
//		
//		
//		
//		//글쓰기 및 업로드=>입출력=>예외처리
//		try {
//			String newName="";//업로드한 파일의 변경된 파일명을 저장
//			//업로드가 되어있다면 (업로드한 파일이 있다면)
//			if(!board.getUploadFile().isEmpty()) {
//				//탐색기에서 선택한 파일이름=>getOriginalFileName() (aaa.txt)
//				newName=FileUtil.rename
//						 (board.getUploadFile().getOriginalFilename());
//				System.out.println("WriteController의 newName=>"+newName);
//				//DTO에 바뀐이름을 저장
//				board.setFilename(newName);
//				//변경하지 않고 그대로 저장시킨경우
//				//command.setFilename(command.getUpload().getOriginalFilename());
//				//springboard2->filename필드
//			}
//			//최대값+1
//			int newSeq=board.getSeq()+1;
//			System.out.println("newSeq=>"+newSeq);//5->6
//			//게시물번호->계산->저장
//			board.setSeq(newSeq);
//			//실제로 upload폴더로 업로드한 파일을 전송(복사해서)
//			if(!board.getUploadFile().isEmpty()) {
//				File file=new File(FileUtil.UPLOAD_PATH+"/"+newName);
//				//물리적으로 데이터전송(파일 전송)->transferTo(전송할  파일정보)
//				board.getUploadFile().transferTo(file);
//			}
//		}catch(IOException e) {
//			e.printStackTrace();
//		}catch(Exception e2) {
//			e2.printStackTrace();
//		}
//		//return "redirect:/요청명령어"->"이동할 페이지명(boardList.jsp)"
//		return "redirect:/board/reviewList.com";//ListController->boardList.jsp
//	}
	
	
	

}
	
	
