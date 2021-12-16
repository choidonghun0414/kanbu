package com.kanbu.controller.board;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.kanbu.dto.SearchDTO;
import com.kanbu.dto.board.BoardDTO;
import com.kanbu.dto.info.Place_ReplyDTO;
import com.kanbu.service.board.BoardService;

@Controller
public class BoardController {

	// 업로드 저장 경로
	private String uploadPath = "/kanbu/resources/img/review/";

	@Autowired
	private BoardService boardImpl;

	@Autowired
	private BoardDTO board;

	@Autowired
	private SearchDTO search;
	
	// ====== 공지 목록
	@RequestMapping("board/noticeList.com")
	public String noticeList(HttpServletRequest request, Model model) throws Exception {
		int pageSize = 10; // 한페이지에 보여줄 정보 갯수
		String pageNum = request.getParameter("pageNum"); // view에서 넘어온 페이지번호
		if (pageNum == null) { // view에서 넘어온 페이지번호가 없으면 1로 대입
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum); // 현재 페이지번호
		int startRow = (currentPage - 1) * pageSize + 1; // 시작 번호
		int endRow = currentPage * pageSize; // 끝 번호
		board.setStartRow(startRow);
		board.setEndRow(endRow);

		int noticeCount = boardImpl.selectNoticeCount();
		List<BoardDTO> noticeList = null;

		if (noticeCount > 0) {
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
	public String noticeDetail(Model model, HttpServletRequest request) throws Exception {
		int index_num = Integer.parseInt(request.getParameter("noticeNum")); // request : jsp에서 작업한 값들을 controller에서 사용할
																				// 수 있게 넘겨주는 역할
		if(index_num > 0) {
			boardImpl.updateViewsNotice(index_num);				// 조회수 증가
		}
		
		BoardDTO noticeDetail = boardImpl.selectNoticeDetail(index_num);
		model.addAttribute("noticeDetail", noticeDetail); // model : controller에서 작업한 값을 jsp에서 사용할 수 있게 넘겨주는 역할
		return "board/noticeDetail";
	}

	// ====== 공지 작성
	@RequestMapping(value = "/board/noticeWritePro.com", method = RequestMethod.POST)
	public String noticeWritePro(HttpSession session, HttpServletRequest request) throws Exception {
		int writer = (Integer)session.getAttribute("index_num");	
		
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setWriter(writer);
		
		boardImpl.insertBoard(board);

		return "redirect:/board/noticeList.com";
	}

	// ====== 공지 쓰기 폼
	@RequestMapping("board/noticeWrite.com")
	public String write() throws Exception {
		return "board/noticeWrite";
	}

	// ====== 공지 수정 폼
	@RequestMapping("board/noticeUpdateForm.com")
	public String noticeUpdate(HttpServletRequest request, Model model) throws Exception {
		int index_num = Integer.parseInt(request.getParameter("noticeNum"));
		board = boardImpl.selectNoticeDetail(index_num);

		model.addAttribute("noticeDetail", board);

		return "board/noticeUpdateForm";
	}

	// ====== 공지 수정 처리
	@RequestMapping(value = "/board/noticeUpdatePro.com", method = RequestMethod.POST)
	public String noticeUpdatePro(HttpSession session, HttpServletRequest request) throws Exception {
		int index_num = Integer.parseInt(request.getParameter("noticeNum"));
		int writer = (Integer)session.getAttribute("index_num");
		
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setWriter(writer);

		boardImpl.noticeUpdate(board);

		return "redirect:/board/noticeDetail.com?noticeNum=" + index_num;
	}

	// ====== 공지 삭제
	@RequestMapping("board/noticeDeletePro.com")
	public String noticeDelete(HttpServletRequest request, Model model) throws Exception {
		int index_num = Integer.parseInt(request.getParameter("noticeNum"));
		boardImpl.noticeDelete(index_num);
		return "redirect:/board/noticeList.com";
	}

	// ====== 질문 목록
	@RequestMapping("board/questionList.com")
	public String questionList() throws Exception {
		return "board/questionList";
	}

	// ====== 질문 쓰기 폼
	@RequestMapping("board/qaWrite.com")
	public String qaWrite() throws Exception {
		return "board/qaWrite";
	}

	// 질문글 1
	@RequestMapping("board/qaDetail1.com")
	public String qa1() throws Exception {
		return "board/qaDetail1";
	}

	// 질문글2
	@RequestMapping("board/qaDetail2.com")
	public String qa2() throws Exception {
		return "board/qaDetail2";
	}

	// ====== 리뷰 목록
	@RequestMapping("board/reviewList.com")
	public String reviewList(HttpServletRequest request, Model model) throws Exception {
		int pageSize = 9; // 한페이지에 보여줄 정보 갯수
		String pageNum = request.getParameter("pageNum"); // view에서 넘어온 페이지번호
		if (pageNum == null) { // view에서 넘어온 페이지번호가 없으면 1로 대입
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum); // 현재 페이지번호
		int startRow = (currentPage - 1) * pageSize + 1; // 시작 번호
		int endRow = currentPage * pageSize; // 끝 번호
		board.setStartRow(startRow);
		board.setEndRow(endRow);

		int reviewCount = boardImpl.selectReviewCount();
		int reviewTagCount = boardImpl.selectReviewTagCount();
		List reviewList = null;
		List reviewTagList = null;

		if (reviewCount > 0) {
			reviewList = boardImpl.selectReview(board);
		}
		if (reviewTagCount > 0) {
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
		model.addAttribute("uploadPath", uploadPath);
		

		return "board/reviewList";
	}

	// ====== 리뷰 상세 보기
	@RequestMapping("board/reviewDetail.com")
	public String reviewDetail(HttpServletRequest request, Model model) throws Exception {
		int index_num = Integer.parseInt(request.getParameter("reviewNum"));
		
		if(index_num > 0) {
			boardImpl.updateViewsReview(index_num);
		}
		
		board = boardImpl.selectReviewDetail(index_num);
		List tagList = boardImpl.selectReviewDetailTag(index_num);
		model.addAttribute("uploadPath", uploadPath);
		model.addAttribute("selectReview", board);
		model.addAttribute("tagList", tagList);
		
		// 리뷰 댓글
		 int pageSize = 5;
		 String pageNum = request.getParameter("pageNum");
			 if(pageNum == null) {
				 pageNum = "1";
			}
		 int currentPage = Integer.parseInt(pageNum);
		 int startRow = (currentPage - 1) * pageSize + 1;
		 int endRow = currentPage * pageSize;
		 board.setStartRow(startRow);
		 board.setEndRow(endRow);
		 board.setReview(index_num); 
		 
		 int reply_count = boardImpl.selectReviewReplyCount(index_num);
		 List<BoardDTO> ReviewReplyList = null;
		  
		 if(reply_count > 0) {
			 ReviewReplyList = boardImpl.selectReviewReply(board);
			}
		  
		 request.setAttribute("currentPage", currentPage);
		 request.setAttribute("startRow", board.getStartRow());
		 request.setAttribute("endRow", board.getEndRow());
		 request.setAttribute("pageSize", pageSize);
		 request.setAttribute("pageNum", pageNum);
		  
		 model.addAttribute("board",board);
		 model.addAttribute("reply_count", reply_count);
		 model.addAttribute("ReviewReplyList", ReviewReplyList);

		return "board/reviewDetail";
	}
	
	//댓글 등록
	@RequestMapping(value="board/reviewReply.com", method = RequestMethod.POST)
	public String reviewReplyWrite(HttpServletRequest request, HttpSession session) throws Exception{
		int writer = (Integer)session.getAttribute("index_num");	// 세션으로 회원번호 가져오기			
		board.setWriter(writer);	
		board.setReview(Integer.parseInt(request.getParameter("reviewNum")));
		board.setContent(request.getParameter("content"));

		boardImpl.insertReviewReply(board);
		
		return "redirect:/board/reviewDetail.com?reviewNum="+board.getReview();
	}
	
	//댓글 삭제
	@RequestMapping(value="board/reviewReplyDelete.com")
	public String reviewReplyDelete(HttpServletRequest request) throws Exception{
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		int index_num = Integer.parseInt(request.getParameter("replyNum"));
		
		boardImpl.deleteReviewReply(index_num);
		
		return "redirect:/board/reviewDetail.com?reviewNum="+reviewNum;
	}
	

	// ====== 리뷰 쓰기 폼
	@RequestMapping("board/reviewWrite.com")
	public String reviewWrite(Model model) throws Exception {
		List tagList = boardImpl.selectTag();
		model.addAttribute("tagList", tagList);

		return "board/reviewWrite";
	}

	// ====== 리뷰 작성 처리
	@RequestMapping(value = "/board/reviewWritePro.com", method = RequestMethod.POST)
	public String reviewWritePro(MultipartHttpServletRequest ms, Model model,
								HttpServletRequest request, HttpSession session) throws Exception {
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		int writer = (Integer) session.getAttribute("index_num");
		board.setWriter(writer);
		// 파일 저장경로 설정(로컬 컴퓨터에서 실제로 저장되는 경로)
		String root = session.getServletContext().getRealPath("/");			
		String path = root + "\\resources\\img\\review\\";

		// 파일 가져오기
		MultipartFile mf1 = ms.getFile("picture1");						
		MultipartFile mf2 = ms.getFile("picture2");						
		MultipartFile mf3 = ms.getFile("picture3");						
		MultipartFile mf4 = ms.getFile("picture4");					
		MultipartFile mf5 = ms.getFile("picture5");
		
		if(!mf1.isEmpty()) {
			String picture1 = mf1.getOriginalFilename();		// 기존 파일 이름(오리지널)
			File f1 = new File(path+picture1);			
			mf1.transferTo(f1);							// 파일 저장
			board.setPicture1(picture1);
		}
		if(!mf2.isEmpty()) {
			String picture2 = mf2.getOriginalFilename();
			File f2 = new File(path+picture2);
			mf2.transferTo(f2);
			board.setPicture2(picture2);
		}
		if(!mf3.isEmpty()) {
			String picture3 = mf3.getOriginalFilename();
			File f3 = new File(path+picture3);
			mf3.transferTo(f3);
			board.setPicture3(picture3);
		}
		if(!mf4.isEmpty()) {
			String picture4 = mf4.getOriginalFilename();
			File f4 = new File(path+picture4);
			mf4.transferTo(f4);
			board.setPicture4(picture4);
		}
		if(!mf5.isEmpty()) {
			String picture5 = mf5.getOriginalFilename();
			File f5 = new File(path+picture5);
			mf5.transferTo(f5);
			board.setPicture5(picture5);
		}
		

		boardImpl.insertReview(board);

		String[] tagArr = request.getParameterValues("index_num[]");
		List<BoardDTO> tagList = new ArrayList<BoardDTO>();

		// 새로 들어온 리뷰번호 가져오기
		int maxReview = boardImpl.maxReview();

		if (maxReview > 0) {
			for (int i = 0; i < tagArr.length; i++) {
				BoardDTO tag = new BoardDTO();
				tag.setReview(maxReview);
				tag.setTag((Integer.parseInt(tagArr[i])));
				tagList.add(tag);
			}
			boardImpl.insertTag(tagList);
		}

		return "redirect:/board/reviewList.com";
	}

	// ====== 리뷰 수정 폼
	@RequestMapping("board/reviewUpdateForm.com")
	public String reviewUpdate(HttpServletRequest request, Model model) throws Exception {
		int index_num = Integer.parseInt(request.getParameter("reviewNum"));
		int tagCount = boardImpl.countReviewUpdateTag(index_num);
		List tagList = null;												// 기존 태그 리스트
		List editTagList = null;											// 리뷰에 등록된 태그 리스트
		
		if(index_num > 0) {
			board = boardImpl.selectReviewDetail(index_num);			// 수정 시 기존 리뷰
		}
		if(tagCount > 0) {
			tagList = boardImpl.selectTag();
			editTagList = boardImpl.selectreviewUpdateTag(index_num);
		}
		
		
		model.addAttribute("reviewNum", index_num);
		model.addAttribute("uploadPath", uploadPath);
		model.addAttribute("selectReview", board);
		model.addAttribute("tagList", tagList);
		model.addAttribute("editTagList", editTagList);

		return "board/reviewUpdateForm";
	}

	// ====== 리뷰 수정 처리
	@RequestMapping(value = "/board/reviewUpdatePro.com", method = RequestMethod.POST)
	public String reviewUpdatePro(MultipartHttpServletRequest ms, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		int writer = (Integer)session.getAttribute("index_num");
		board.setContent(request.getParameter("content"));
		board.setTitle(request.getParameter("title"));
		board.setWriter(writer);

		// 저장경로 설정(로컬 컴퓨터에서 실제로 저장되는 경로)
		String root = session.getServletContext().getRealPath("/");			
		String path = root + "\\resources\\img\\reveiw\\";
						
		// 수정 파일 가져오기
		MultipartFile mf1 = ms.getFile("picture1");						
		MultipartFile mf2 = ms.getFile("picture2");						
		MultipartFile mf3 = ms.getFile("picture3");						
		MultipartFile mf4 = ms.getFile("picture4");					
		MultipartFile mf5 = ms.getFile("picture5");

		if(!mf1.isEmpty()) {
			String picture1 = mf1.getOriginalFilename();		// 기존 파일 이름(오리지널)
			File f1 = new File(path+picture1);			
			mf1.transferTo(f1);									// 파일 저장
			board.setPicture1(picture1);
		}
		if(!mf2.isEmpty()) {
			String picture2 = mf2.getOriginalFilename();
			File f2 = new File(path+picture2);
			mf2.transferTo(f2);
			board.setPicture2(picture2);
		}
		if(!mf3.isEmpty()) {
			String picture3 = mf3.getOriginalFilename();
			File f3 = new File(path+picture3);
			mf3.transferTo(f3);
			board.setPicture3(picture3);
		}
		if(!mf4.isEmpty()) {
			String picture4 = mf4.getOriginalFilename();
			File f4 = new File(path+picture4);
			mf4.transferTo(f4);
			board.setPicture4(picture4);
		}
		if(!mf5.isEmpty()) {
			String picture5 = mf5.getOriginalFilename();
			File f5 = new File(path+picture5);
			mf5.transferTo(f5);
			board.setPicture5(picture5);
		}
		
		
		boardImpl.reviewUpdate(board);

		String[] tagArr = request.getParameterValues("index_num[]");
		List<BoardDTO> tagList = new ArrayList<BoardDTO>();
			
		if (reviewNum > 0) {
			boardImpl.deleteTag(reviewNum);						// 원래 있던 태그 삭제
			
			for (int i = 0; i < tagArr.length; i++) {
				BoardDTO tag = new BoardDTO();
				tag.setReview(reviewNum);
				tag.setTag((Integer.parseInt(tagArr[i])));
				tagList.add(tag);
			}
			boardImpl.insertTag(tagList);
		}

		return "redirect:/board/reviewDetail.com?reviewNum=" + reviewNum;
	}

	// ==== 리뷰 삭제
	@RequestMapping("board/reviewDeletePro.com")
	public String reviewDelete(HttpServletRequest request, Model model) throws Exception {
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		
		boardImpl.deleteTag(reviewNum);						// 리뷰태그 삭제
		boardImpl.deleteReply(reviewNum);					// 리뷰댓글 삭제
		boardImpl.reviewDelete(reviewNum);					// 리뷰글 삭제
		
		return "redirect:/board/reviewList.com";
	}
	
	// 리뷰 검색
	@RequestMapping("/board/reviewSearch.com")
	public String reviewSearch(HttpServletRequest request, Model model) throws Exception{
		
		// 리뷰 검색테마 및 키워드 저장
		search.setThema(request.getParameter("thema"));
		search.setKeyword(request.getParameter("keyword"));
				 
		// 페이징 처리
		int pageSize = 9;											// 한페이지에 보여줄 정보 갯수
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
		model.addAttribute("uploadPath", uploadPath);
		
		int reviewCount = 0;
		int reviewTagCount = 0;
		List<BoardDTO> reviewList = null;
		List<BoardDTO> reviewTagList = null;
		
		if(search.getThema().equals("p.title") || search.getThema().equals("rm.nick")) {
			reviewCount = boardImpl.searchReviewCount(search);
			reviewTagCount = boardImpl.searchReviewTagCount(search);
			
			if(reviewCount > 0) {
				reviewList = boardImpl.searchReview(search);
			}
			if(reviewTagCount > 0) {
				reviewTagList = boardImpl.searchReviewTag(search);
			}
		}
		
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("reviewTagCount", reviewTagCount);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewTagList", reviewTagList);
		
		return "board/reviewList";
	}
	
	//공지 검색
	@RequestMapping("/board/noticeSearch.com")
	public String noticeSearch(HttpServletRequest request, Model model) throws Exception{
		
		// 리뷰 검색테마 및 키워드 저장
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
		
		int noticeCount = 0;
		List<BoardDTO> noticeList = null;
		
		if(search.getThema().equals("n.title") || search.getThema().equals("rm.nick")) {
			noticeCount = boardImpl.searchNoticeCount(search);
			
			if(noticeCount > 0) {
				noticeList = boardImpl.searchNotice(search);
			}
		}
		
		model.addAttribute("noticeCount", noticeCount);
		model.addAttribute("noticeList", noticeList);
		
		return "board/noticeList";
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
