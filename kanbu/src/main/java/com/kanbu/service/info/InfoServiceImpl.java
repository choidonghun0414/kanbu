package com.kanbu.service.info;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kanbu.dao.info.InfoDAO;
import com.kanbu.dto.info.PlaceDTO;
import com.kanbu.dto.info.Place_ReplyDTO;

@Service
public class InfoServiceImpl implements InfoService{
	
	@Inject
	InfoDAO infoDAO;
	
	// 장소정보 전체 갯수 검색
	@Override
	public int selectPlaceCount() throws Exception {
		return infoDAO.selectPlaceCount();
	}

	// 장소정보 전체 검색
	@Override
	public List<PlaceDTO> selectPlace() throws Exception {
		return infoDAO.selectPlace();
	}

	// 해당 장소정보의 갯수 검색
	@Override
	public int selectPlaceInfoCount(int index_num) throws Exception {
		return infoDAO.selectPlaceInfoCount(index_num);
	}

	// 해당 장소정보 검색 
	@Override
	public PlaceDTO selectPlaceInfo(int index_num) throws Exception {
		return infoDAO.selectPlaceInfo(index_num);
	}

	// 해당 장소정보의 전체 댓글수 검색
	@Override
	public int selectPlaceReplyCount(int place) throws Exception {
		return infoDAO.selectPlaceReplyCount(place);
	}
	
	// 해당 장소정보의 전체 댓글 검색
	@Override
	public List<Place_ReplyDTO> selectPlaceReply(int place) throws Exception {
		return infoDAO.selectPlaceReply(place);
	}
	
	// 해당 장소정보 댓글 등록
	@Override
	public void insertPlaceReply(Place_ReplyDTO place_replyDTO) throws Exception {
		infoDAO.insertPlaceReply(place_replyDTO);
	}

	// 해당 장소 상세정보 클릭시 조회수 증가
	@Override
	public void updateViews(int index_num) throws Exception {
		infoDAO.updateViews(index_num);
	}


}
