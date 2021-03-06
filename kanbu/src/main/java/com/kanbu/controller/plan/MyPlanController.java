package com.kanbu.controller.plan;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kanbu.dto.board.BoardDTO;
import com.kanbu.dto.info.PlaceDTO;
import com.kanbu.dto.plan.MyPlanDTO;
import com.kanbu.dto.plan.SPlanDTO;
import com.kanbu.service.info.InfoService;
import com.kanbu.service.plan.MyPlanService;

@Controller
/* @RequestMapping("/myPlan/*") */
public class MyPlanController {

	@Autowired
	MyPlanService myPlanService;

	@Autowired
	MyPlanDTO plan;
	
	// 업로드 저장 경로
	private String uploadPath = "/kanbu/resources/img/place/"; 

	@RequestMapping(value = "write.com", method = RequestMethod.GET)
	public String write() { // 일정 작성 write.com
		return "/plan/write"; // write.jsp로 이동
	}

	@RequestMapping(value = "insert.com")
	public String insert(HttpServletRequest request, HttpServletResponse response, Model model, 
						 HttpSession session) throws Exception {
		
		// 일정 입력값 저장(myplan_num)
		plan.setTitle(request.getParameter("title"));
		plan.setStartDay(java.sql.Date.valueOf(request.getParameter("startDay")));
		plan.setArrivalDay(java.sql.Date.valueOf(request.getParameter("arrivalDay")));
		plan.setTraffic(request.getParameter("traffic"));
		plan.setExpense(Integer.parseInt(request.getParameter("expense")));
		plan.setWriter((Integer)session.getAttribute("index_num"));
		
		myPlanService.insert(plan); // 일정 등록
		
		// 세부일정 저장(mySplan_num)
		int planNum = myPlanService.maxIndex();		// 일정리스트 마지막 번호
		// 쿠키 저장
		Cookie[] getCookie = request.getCookies();	 // 모든 쿠키 가져오기
		Cookie c = null;			// 쿠키 객체
		String name = null;			// 쿠키 이름
		String value = null;		// 쿠키 값
		List<SPlanDTO> splanList = new ArrayList<SPlanDTO>();
		
		if(getCookie != null){ 		
			// 쿠기가 있으면 반복문으로 모든 쿠키 생성
			for(int i=0; i <getCookie.length; i++) { 
				c = getCookie[i]; // 객체 생성
				name = URLDecoder.decode(c.getName());   // 쿠키 이름 가져오기
				value = URLDecoder.decode(c.getValue()); // 쿠키 값 가져오기
				System.out.println(name);
				System.out.println(value); 
			}
			if(name.equals(plan.getWriter()+"_일정번호") && planNum > 0) {
				String[] placeNum = value.split(",");
				for(int j=0; j<placeNum.length; j++) {
					SPlanDTO splan = new SPlanDTO();
					int place = Integer.parseInt(placeNum[j]);
					System.out.println(place);
					splan.setPlace(place);
					splan.setList_num(planNum);
					splan.setSchedule(j+1);
					splanList.add(splan);
				}			
				myPlanService.insertSchedule(splanList);
			}
		}	
		
		if(getCookie != null){ // 쿠키가 한개라도 있으면 실행
			for(int i=0; i< getCookie.length; i++){
				getCookie[i].setMaxAge(0); // 유효시간을 0으로 설정
				response.addCookie(getCookie[i]); // 응답 헤더에 추가
			}
		}
		
		return "/plan/insert";
	}

	// 일정목록 페이지
	@RequestMapping("list.com")
	public String list(HttpServletRequest request, HttpSession session, Model model) throws Exception {
		// 페이지 처리
		int pageSize = 10;										// 한페이지에 보여줄 정보 갯수
		String pageNum = request.getParameter("pageNum");		// view에서 넘어온 페이지번호
		if(pageNum == null) {									// view에서 넘어온 페이지번호가 없으면 1로 대입
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);			// 현재 페이지번호(형변환)
		int startRow = (currentPage - 1) * pageSize + 1;		// 시작 번호(DB 검색 페이지 처리 rownum)
		int endRow = currentPage * pageSize;					// 끝 번호(DB 검색 페이지 처리 rownum)
		plan.setStartRow(startRow);
		plan.setEndRow(endRow);
		
		int count = 0;
		List<MyPlanDTO> myPlanList = null;
		
		// 회원인지 세션 검사
		int writer = (Integer)session.getAttribute("index_num");		// 회원번호
		if(writer > 0) {
			count = myPlanService.countArticle(writer);
		}
	
		// 유효성 검사
		if (count > 0) {
			plan.setWriter(writer);
			myPlanList = myPlanService.view(plan);
		}

		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", startRow);
		request.setAttribute("endRow", endRow);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);	
		
		model.addAttribute("count", count);
		model.addAttribute("myPlanList", myPlanList); // model : controll에서 작성한 값들을 jsp에서 사용할 때
														// request : jsp에서 작성한 값들을 controller에서 사용할 때
		return "/plan/list";
	}

	// 나의 일정 조회
	@RequestMapping(value = "view.com", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int index_num, @RequestParam int curPage, @RequestParam String search_option,
			@RequestParam String keyword, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView(); // 모델(데이터)+뷰(화면) 함꼐 전달하는 객체
		mav.setViewName("plan/view"); // plan/view.jsp로 이동
		mav.addObject("dto", myPlanService.view(plan)); // 뷰에 전달할 데이터
		mav.addObject("curPage", curPage);
		mav.addObject("search_option", search_option);
		mav.addObject("keyword", keyword);
		return mav;
	}

	// 수정화면 form
	@RequestMapping(value="update.com", method=RequestMethod.GET)
	public String getupdate(HttpServletRequest request, Model model) throws Exception{
		 MyPlanDTO plan = myPlanService.detail(Integer.parseInt(request.getParameter("index_num")));
		 
		 int placeCount=0;
		 List<PlaceDTO> placeList = null;
		 
		 //db에서 장소 데이터 가져오기
		 placeCount = myPlanService.selectPlaceCount();
		 
		 if(placeCount > 0) {
			 placeList = myPlanService.selectPlace();
		 }
		 
		 model.addAttribute("placeList", placeList);
		 model.addAttribute("placeCount", placeCount);
		 model.addAttribute("plan", plan);
		 model.addAttribute("uploadPath", uploadPath);
		
		return "plan/update";
	}
	
	// 일정수정 완료 후 나의 일정 목록 페이지로 이동
	@RequestMapping(value = "updatePro.com", method=RequestMethod.POST)
	public String postupdate(HttpServletRequest request) throws Exception{
		// String -> java.sql.Date로 형변환
		Date startDay = Date.valueOf(request.getParameter("startDay"));
		Date arrivalDay = Date.valueOf(request.getParameter("arrivalDay"));
		
		plan.setIndex_num(Integer.parseInt(request.getParameter("index_num")));
		plan.setTitle(request.getParameter("title"));
		plan.setStartDay(startDay);
		plan.setArrivalDay(arrivalDay);
		plan.setTraffic(request.getParameter("traffic"));
		plan.setExpense(Integer.parseInt(request.getParameter("expense")));
		
		myPlanService.update(plan);
		return "/plan/updatePro";
	}
	
	// 상세화면 페이지
	@RequestMapping(value = "detail.com")
	public String getdetail(Model model, HttpServletRequest request) throws Exception {
		int index_num = Integer.parseInt(request.getParameter("index_num"));
		MyPlanDTO plan = null;
		int scheduleCount = 0;
		List<SPlanDTO> scheduleList = null;
		
		if(index_num > 0) {
			plan = myPlanService.detail(index_num);
			scheduleCount = myPlanService.detailScheduleCount(index_num);
		}
		if(scheduleCount > 0) {
			scheduleList = myPlanService.detailSchedule(index_num);
		}
		
		model.addAttribute("index_num", index_num);
		model.addAttribute("plan", plan);
		model.addAttribute("scheduleCount", scheduleCount);
		model.addAttribute("scheduleList", scheduleList);
		
		return "/plan/detail";
	}
	
	// 일정 삭제
	@RequestMapping(value="delete.com")
	public String delete(@RequestParam int index_num) throws Exception {
		myPlanService.delete(index_num);
		return "redirect:/list.com";
	}
	
	//맵뷰 일정 페이지
	@RequestMapping(value="mapView.com", method = RequestMethod.GET)
	public String mapView(Model model) throws Exception {
		
		int placeCount = 0;
		List<PlaceDTO> placeList = null;
		
		// db에서 장소 정보 가져오기
		placeCount = myPlanService.selectPlaceCount();
		
		if(placeCount > 0) {
			placeList = myPlanService.selectPlace();
		}
		
		model.addAttribute("placeCount", placeCount);
		model.addAttribute("placeList", placeList);
		model.addAttribute("uploadPath", uploadPath);
		
		return "/plan/mapView";
	}
	
	//맵뷰 검색 페이지
	@RequestMapping("/mapView/search.com")
	public String mapViewSearch(HttpServletRequest request, Model model) throws Exception{
		String keyword = request.getParameter("keyword");
		int placeCount = myPlanService.placeSearchCount(keyword);
		List<PlaceDTO> placeList = null;
		
		if(placeCount > 0) {
			placeList = myPlanService.placeSearch(keyword);
		}
		
		model.addAttribute("placeCount", placeCount);
		model.addAttribute("placeList", placeList);
		model.addAttribute("uploadPath", uploadPath);
		
		return "/plan/mapView";
	}	
		
}