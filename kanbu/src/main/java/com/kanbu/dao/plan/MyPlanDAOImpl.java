package com.kanbu.dao.plan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kanbu.dto.info.PlaceDTO;
import com.kanbu.dto.plan.MyPlanDTO;
import com.kanbu.dto.plan.SPlanDTO;

@Repository	//현재 클래스 dao bean으로 등록
public class MyPlanDAOImpl implements MyPlanDAO {
	
	@Inject 
	SqlSessionTemplate mybatis;
	
	// 일정 생성
	@Override
	public void insert(MyPlanDTO dto) throws Exception {
		mybatis.insert("myPlan.insert", dto);
	}
	
	// 장소 저장 (찜목록 저장)
	@Override
	public void addPlace(MyPlanDTO plan) throws Exception {
		mybatis.insert("myPlan.insert", plan);
	}

	// 나의 일정리스트 전체 조회
	@Override
	public List<MyPlanDTO> view(MyPlanDTO myplan) throws Exception {
		return mybatis.selectList("myPlan.view", myplan);
	}

	@Override
	public List<MyPlanDTO> listAll(int start, int end, String search_option, String keyword) throws Exception {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("myPlan.listAll", map);
	}

	@Override
	public int countSearchArticle(String search_option, String keyword) throws Exception {
		Map<String,String> map=new HashMap<String,String>();
		map.put("search_option", search_option);
		map.put("keyowrd", keyword);
		return mybatis.selectOne( "myPlan.countArticel", map);
	}
	
	// 스케줄 삭제
	@Override
	public void deleteSchedule(int schedule) {
		mybatis.delete("myPlan.deleteMySplan_num", schedule);
	}

	@Override
	public List<String> getMySplan_num(int list_num) {
		return mybatis.selectList("myPlan.getMySplan_num", list_num);
	}

	@Override
	public void updateMySplan_num(int schedule, int list_num) {
		Map<String, Object> map=new HashMap<>();
		map.put("schedule", schedule);
		map.put("index_num", list_num);
		mybatis.insert("myPlan.updateMySplan_num", map);
	}

	@Override
	public int daysArticle(int start, int arrival) throws Exception {
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("arrival", arrival);
		return mybatis.selectOne( "myPlan.daysArticle", map);
	}

	// 레코드 갯수 계산
	@Override
	public int countArticle(int writer) throws Exception {
		return mybatis.selectOne("myPlan.countArticle", writer);
	}

	// 일정 상세화면 조회
	@Override
	public MyPlanDTO detail(int index_num) {
		return mybatis.selectOne("myPlan.detail", index_num);
	}

	// 일정 수정
	@Override
	public void update(MyPlanDTO dto) {
		mybatis.update("myPlan.update", dto);
	}

	// 일정 삭제
	@Override
	public void delete(int index_num) {
		mybatis.delete("myPlan.delete", index_num);
	}

	// 장소 전체 갯수
	@Override
	public int selectPlaceCount() throws Exception {
		return mybatis.selectOne("info.selectPlaceCount");
	}

	// 장소 전체 리스트
	@Override
	public List<PlaceDTO> selectPlace() throws Exception {
		return mybatis.selectList("info.selectPlace");
	}

	//장소 검색 갯수
	@Override
	public int placeSearchCount(String keyword) throws Exception {
		return mybatis.selectOne("myPlan.placeSearchCount", keyword);
	}

	//장소 검색 결과 리스트
	@Override
	public List<PlaceDTO> placeSearch(String keyword) throws Exception {
		return mybatis.selectList("myPlan.placeSearch", keyword);
	}

}
