package com.kanbu.service.board;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kanbu.dao.board.BoardDAO;
import com.kanbu.dto.board.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO boardDAO;
	
	// 공지 등록
	@Override
	public void insertBoard(BoardDTO board) throws Exception {
		boardDAO.insertBoard(board);
	}

	@Override
	public List selectNotice(int writer) throws Exception {
		return boardDAO.selectNotice(writer);
	}

	// 관리자고유번호 검색
	@Override
	public int selectAdmin() throws Exception {
		return boardDAO.selectAdmin();
	}
	
	//공지사항 상세 보기
	@Override
	public BoardDTO selectNoticeDetail(int index_num) throws Exception {
		return boardDAO.selectNoticeDetail(index_num);
	}

	//공지 수정
	@Override
	public void noticeUpdate(BoardDTO board) throws Exception {
		boardDAO.noticeUpdate(board);
	}

	//공지 삭제
	@Override
	public void noticeDelete(int index_num) throws Exception {
		boardDAO.noticeDelete(index_num);
		
	}

}
