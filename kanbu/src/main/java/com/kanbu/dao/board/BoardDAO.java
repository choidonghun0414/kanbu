package com.kanbu.dao.board;

import java.util.List;

import com.kanbu.dto.SearchDTO;
import com.kanbu.dto.board.BoardDTO;
import com.kanbu.dto.info.Place_ReplyDTO;

public interface BoardDAO {
	
	// 공지 등록
	public void insertBoard(BoardDTO board) throws Exception;
	
	// 공지 목록 갯수
	public int selectNoticeCount() throws Exception;
	
	//공지 목록
	public List<BoardDTO> selectNotice(BoardDTO board) throws Exception;
	
	//관리자고유번호 검색
	public int selectAdmin() throws Exception;
	
	//사용자 검색
	public List selectMember() throws Exception;

	// 공지 세부내용
	public BoardDTO selectNoticeDetail(int index_num) throws Exception;
	
	//공지 수정
	public void noticeUpdate(BoardDTO board) throws Exception;
	
	//공지 삭제
	public void noticeDelete(int index_num) throws Exception;
	
	// 해당 공지사항 조회수 증가
	public void updateViewsNotice(int index_num) throws Exception;
	
	// 해당 리뷰 조회수 증가
	public void updateViewsReview(int index_num) throws Exception;
	
	//리뷰 목록 갯수
	public int selectReviewCount() throws Exception;
	
	//리뷰 목록
	public List selectReview(BoardDTO board) throws Exception;
	
	//여행 리뷰 태그 리스트 갯수
	public int selectReviewTagCount() throws Exception;
	
	//여행 리뷰 태그 리스트
	public List selectReviewTag() throws Exception;
	
	//리뷰 상세
	public BoardDTO selectReviewDetail(int index_num) throws Exception;
	
	//리뷰 상세 태그
	public List selectReviewDetailTag(int index_num) throws Exception;
	
	//리뷰 작성
	public void insertReview(BoardDTO board) throws Exception;
	
	// 새로 들어온 리뷰번호 가져오기
	public int maxReview() throws Exception;
	
	// 새로 들어온 리뷰 태그 추가
	public void insertTag(List<BoardDTO> tagList) throws Exception;
	
	//리뷰 수정
	public void reviewUpdate(BoardDTO board) throws Exception;
	
	//수정 시 기존 태그 삭제
	public void deleteTag(int review) throws Exception;
	
	//리뷰 삭제
	public void reviewDelete(int index_num) throws Exception;
	
	//리뷰 삭제시 댓글 강제 삭제
	public void deleteReply(int review) throws Exception;
	
	//태그 목록
	public List selectTag() throws Exception;
	
	//총 댓글 갯수
	public int selectReviewReplyCount(int index_num) throws Exception;
	
	// 해당 리뷰 전체댓글 검색
	public List<BoardDTO> selectReviewReply(BoardDTO board) throws Exception;
	
	// 해당 장소정보 댓글 등록
	public void insertReviewReply(BoardDTO board) throws Exception;
	
	//댓글 삭제
	public void deleteReviewReply(int index_num) throws Exception;
	
	//수정 태그 목록 갯수
	public int countReviewUpdateTag(int review) throws Exception;
	
	//수정 태그 목록
	public List selectreviewUpdateTag(int review) throws Exception;
	
	// 여행후기 검색 갯수(제목, 닉네임)
	public int searchReviewCount(SearchDTO search) throws Exception;

	// 여행후기 검색 리스트(제목, 닉네임)
	public List<BoardDTO> searchReview(SearchDTO search) throws Exception;
	
	// 여행후기 태그 검색 갯수(제목, 닉네임)
	public int searchReviewTagCount(SearchDTO search) throws Exception;
		
	// 여행후기 태그 검색 리스트(제목, 닉네임)
	public List<BoardDTO> searchReviewTag(SearchDTO search) throws Exception;
	
	// 공지 검색 갯수(제목, 닉네임)
	public int searchNoticeCount(SearchDTO search) throws Exception;

	// 공지 검색 리스트(제목, 닉네임)
	public List<BoardDTO> searchNotice(SearchDTO search) throws Exception;
	

	
}
