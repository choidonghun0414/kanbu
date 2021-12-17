package com.kanbu.service.plan;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kanbu.dao.plan.MyPlanDAO;
import com.kanbu.dto.info.PlaceDTO;
import com.kanbu.dto.plan.MyPlanDTO;
import com.kanbu.dto.plan.SPlanDTO;

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
		// 일정 등록
		myPlanDao.insert(dto);		
	}

	//나의 일정리스트 전체 조회
	@Override
	public List<MyPlanDTO> view(MyPlanDTO myplan) throws Exception {
		return myPlanDao.view(myplan);
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
	public int countArticle(int writer) throws Exception {
		return myPlanDao.countArticle(writer);
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

	// 장소 전체 갯수
	@Override
	public int selectPlaceCount() throws Exception {
		return myPlanDao.selectPlaceCount();
	}

	// 장소 전체 리스트
	@Override
	public List<PlaceDTO> selectPlace() throws Exception {
		return myPlanDao.selectPlace();
	}

	//장소 검색 갯수
	@Override
	public int placeSearchCount(String keyword) throws Exception {
		return myPlanDao.placeSearchCount(keyword);
	}

	//장소 검색 리스트
	@Override
	public List<PlaceDTO> placeSearch(String keyword) throws Exception {
		return myPlanDao.placeSearch(keyword);
	}

	// 일정리스트 마지막 번호
	@Override
	public int maxIndex() throws Exception {
		return myPlanDao.maxIndex();
	}

	// 일정스케쥴 추가
	@Override
	public void insertSchedule(List<SPlanDTO> splan) throws Exception {
		myPlanDao.insertSchedule(splan);
	}

	// 상세화면 스케줄 갯수 조회
	@Override
	public int detailScheduleCount(int list_num) throws Exception {
		return myPlanDao.detailScheduleCount(list_num);
	}

	// 상세화면 스케줄 조회
	@Override
	public List<SPlanDTO> detailSchedule(int list_num) throws Exception {
		return myPlanDao.detailSchedule(list_num);
	}

}
