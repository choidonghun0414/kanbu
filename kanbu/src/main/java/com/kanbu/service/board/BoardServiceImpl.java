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

	//공지 목록
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
	
	// 리뷰 목록 갯수
	@Override
	public int selectReviewCount() throws Exception {
		return boardDAO.selectReviewCount();
	}

	//리뷰 목록
	@Override
	public List selectReview() throws Exception {
		return boardDAO.selectReview();
	}
	
	//여행 리뷰 태그 리스트 갯수
	@Override
	public int selectReviewTagCount() throws Exception {
		return boardDAO.selectReviewTagCount();
	}

	//여행 리뷰 태그 리스트
	@Override
	public List selectReviewTag() throws Exception {
		return boardDAO.selectReviewTag();
	}

	//리뷰 상세
	@Override
	public BoardDTO selectReviewDetail(int index_num) throws Exception {
		return boardDAO.selectReviewDetail(index_num);
	}
	
	@Override
	public List selectReviewDetailTag(int index_num) throws Exception {
		return boardDAO.selectReviewDetailTag(index_num);
	}

	@Override
	public List selectMember() throws Exception {
		return boardDAO.selectMember();
	}

	//리뷰 작성
	@Override
	public void insertReview(BoardDTO board) throws Exception {
		boardDAO.insertReview(board);
		
	}

	//리뷰 수정
	@Override
	public void reviewUpdate(BoardDTO board) throws Exception {
		boardDAO.reviewUpdate(board);
	}









}
