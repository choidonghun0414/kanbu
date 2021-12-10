package com.kanbu.dao.plan;

import java.util.List;

import com.kanbu.dto.info.PlaceDTO;
import com.kanbu.dto.plan.MyPlanDTO;

public interface MyPlanDAO {

	public void addPlace(MyPlanDTO splan) throws Exception;	//찜장소 저장
	public void deleteSchedule(int schedule);	//스케쥴 삭제
	public List<String> getMySplan_num(int list_num);	//스케쥴 목록
	public void updateMySplan_num(int schedule, int list_num);	//스케쥴 수정
	public void insert(MyPlanDTO dto) throws Exception; //일정 생성
	public List<MyPlanDTO> view(MyPlanDTO myplan) throws Exception;		//나의 일정리스트 전체 조회
	public MyPlanDTO detail(int index_num);	//상세화면 조회
	public void update(MyPlanDTO dto);	//일정 수정
	public void delete(int index_num);	//일정 삭제
	public List<MyPlanDTO> listAll(int start, int end, String search_option,
			String keyword) throws Exception;	//일정 리스트(페이지 나누기, 검색 기능 등)
	public int countSearchArticle(String search_option, String keyword) throws Exception;	//레코드 갯수 계산(검색용)
	public int countArticle(int writer) throws Exception;	//레코드 갯수 계산
	public int daysArticle(int start, int arrival) throws Exception;	//날짜계산
	public int selectPlaceCount() throws Exception;		 // 장소 전체 갯수
	public List<PlaceDTO> selectPlace() throws Exception;	// 장소 전체 리스트
	public int placeSearchCount(String keyword) throws Exception;	//장소 검색 갯수
	public List<PlaceDTO> placeSearch(String keyword) throws Exception;		//장소 검색 결과 리스트
}
