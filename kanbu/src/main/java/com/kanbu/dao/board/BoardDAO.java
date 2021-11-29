package com.kanbu.dao.board;

import java.util.List;

import com.kanbu.dto.board.BoardDTO;

public interface BoardDAO {

	// 공지 등록
	public void insertBoard(BoardDTO board) throws Exception;
	
	//공지 목록
	public List selectNotice(int writer) throws Exception;
	
	//관리자고유번호 검색
	public int selectAdmin() throws Exception;

	// 공지 세부내용
	public BoardDTO selectNoticeDetail(int index_num) throws Exception;
	
	//공지 수정
	public void noticeUpdate(BoardDTO board) throws Exception;
	
	//공지 삭제
	public void noticeDelete(int index_num) throws Exception;
	
}
