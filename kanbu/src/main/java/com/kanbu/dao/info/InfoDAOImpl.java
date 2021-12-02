package com.kanbu.dao.info;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kanbu.dto.info.PlaceDTO;
import com.kanbu.dto.info.Place_ReplyDTO;

@Repository
public class InfoDAOImpl implements InfoDAO{
	
	// mybatis 호출(sql문 사용)
	@Inject
	SqlSessionTemplate mybatis;
	
	// 장소정보 전체 갯수 검색
	@Override
	public int selectPlaceCount() throws Exception {
		return mybatis.selectOne("info.selectPlaceCount");
	}

	// 장소정보 전체 검색
	@Override
	public List<PlaceDTO> selectPlace() throws Exception {
		return mybatis.selectList("info.selectPlace");
	}

	// 해당 장소정보의 갯수 검색
	@Override
	public int selectPlaceInfoCount(int index_num) throws Exception {
		return mybatis.selectOne("info.selectPlaceInfoCount", index_num);
	}

	// 해당 장소정보 검색
	@Override
	public PlaceDTO selectPlaceInfo(int index_num) throws Exception {
		return mybatis.selectOne("info.selectPlaceInfo", index_num);
	}
	
	// 해당 장소정보의 전체 댓글수 검색
	@Override
	public int selectPlaceReplyCount(int place) throws Exception {
		return mybatis.selectOne("info.selectPlaceReplyCount", place);
	}
	
	// 해당 장소정보의 전체 댓글 검색
	@Override
	public List<Place_ReplyDTO> selectPlaceReply(int place) throws Exception {
		return mybatis.selectList("info.selectPlaceReply", place);
	}

	// 해당 장소정보 댓글 등록
	@Override
	public void insertPlaceReply(Place_ReplyDTO place_replyDTO) throws Exception {
		mybatis.insert("info.insertPlaceReply", place_replyDTO);
	}

	// 해당 장소 상세정보 클릭시 조회수 증가
	@Override
	public void updateViews(int index_num) throws Exception {
		mybatis.update("info.updateViews", index_num);
	}
}
