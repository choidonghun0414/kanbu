package com.kanbu.dao.plan;

import java.util.List;

import com.kanbu.dto.plan.MyPlanDTO;

public interface MyPlanDAO {

	public void deleteSchedule(int schedule);	//스케쥴 삭제
	public void addMySplan_num(int[] schedule);	//스케쥴 저장
	public List<String> getMySplan_num(int list_num);	//스케쥴 목록
	public void updateMySplan_num(int schedule, int list_num);	//스케쥴 수정
	public void insert(MyPlanDTO dto) throws Exception; //일정 생성
	public List<MyPlanDTO> view() throws Exception;		//나의 일정리스트 전체 조회
	public MyPlanDTO detail(int index_num);	//상세화면 조회
	public void update(MyPlanDTO dto);	//일정 수정
	public void delete(int index_num);	//일정 삭제
	public List<MyPlanDTO> listAll(int start, int end, String search_option,
			String keyword) throws Exception;	//일정 리스트(페이지 나누기, 검색 기능 등)
	public int countSearchArticle(String search_option, String keyword) throws Exception;	//레코드 갯수 계산(검색용)
	public int countArticle() throws Exception;	//레코드 갯수 계산
	public int daysArticle(int start, int arrival) throws Exception;	//날짜계산
}
