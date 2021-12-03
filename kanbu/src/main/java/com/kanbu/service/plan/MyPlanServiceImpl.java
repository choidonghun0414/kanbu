package com.kanbu.service.plan;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kanbu.dao.plan.MyPlanDAO;
import com.kanbu.dto.plan.MyPlanDTO;

@Service
public class MyPlanServiceImpl implements MyPlanService {

	@Inject
	MyPlanDAO myPlanDao;
	
	// 스케줄목록 삭제
	@Override
	public void deleteSchedule(int schedule) {
		myPlanDao.deleteSchedule(schedule);
	}

	@Override
	public List<String> getMySplan_num(int list_num) {
		return myPlanDao.getMySplan_num(list_num);
	}

	// 일정 등록
	@Override
	public void insert(MyPlanDTO dto) throws Exception {
		myPlanDao.insert(dto);
		
		// 스케쥴 등록 controller에서 작성
//		int[] schedule=dto.getSchedule();
//		// 스케쥴이 없으면 종료
//		if(schedule==null) return;
//		for(int list_num : schedule) {
//			myPlanDao.addMySplan_num(schedule);
//		}		
	}

	//나의 일정리스트 전체 조회
	@Override
	public List<MyPlanDTO> view() throws Exception {
		return myPlanDao.view();
	}

	@Override
	public List<MyPlanDTO> listAll(int start, int end, String search_option, String keyword) throws Exception {
		return myPlanDao.listAll(start, end, search_option, keyword);
	}

	@Override
	public int countSearchArticle(String search_option, String keyword) throws Exception {
		return myPlanDao.countSearchArticle(search_option, keyword);
	}

	@Override
	public int daysArticle(int start, int arrival) throws Exception {
		return myPlanDao.daysArticle(start, arrival);
	}

	@Override
	public int countArticle() throws Exception {
		return myPlanDao.countArticle();
	}

	// 일정 상세화면 조회
	@Override
	public MyPlanDTO detail(int index_num) {
		return myPlanDao.detail(index_num);
	}

	// 일정 수정화면
	@Override
	public void update(MyPlanDTO dto) {
		myPlanDao.update(dto);
	}

	// 일정 삭제
	@Override
	public void delete(int index_num) {
		myPlanDao.delete(index_num);
	}

}
