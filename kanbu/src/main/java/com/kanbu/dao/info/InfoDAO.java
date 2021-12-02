package com.kanbu.dao.info;

import java.util.List;

import com.kanbu.dto.info.PlaceDTO;
import com.kanbu.dto.info.Place_ReplyDTO;

public interface InfoDAO {
	
	// 장소정보 전체 갯수 검색
	public int selectPlaceCount() throws Exception;
	
	// 장소정보 전체 검색
	public List<PlaceDTO> selectPlace() throws Exception;
	
	// 해당 장소정보의 갯수 검색
	public int selectPlaceInfoCount(int index_num) throws Exception;
	
	// 해당 장소정보 검색 
	public PlaceDTO selectPlaceInfo(int index_num) throws Exception;
	
	// 해당 장소정보의 전체댓글수 검색
	public int selectPlaceReplyCount(int place) throws Exception;
	
	// 해당 장소정보의 전체댓글 검색
	public List<Place_ReplyDTO> selectPlaceReply(int place) throws Exception;
	
	// 해당 장소정보 댓글 등록
	public void insertPlaceReply(Place_ReplyDTO place_replyDTO) throws Exception;
	
	// 해당 장소 상세정보 클릭시 조회수 증가
	public void updateViews(int index_num) throws Exception;
	
}
