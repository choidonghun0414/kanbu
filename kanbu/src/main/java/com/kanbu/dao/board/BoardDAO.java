package com.kanbu.dao.board;

import java.util.List;

import com.kanbu.dto.board.BoardDTO;

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
	
	//리뷰 수정
	public void reviewUpdate(BoardDTO board) throws Exception;
}
