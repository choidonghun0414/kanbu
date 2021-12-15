package com.kanbu.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kanbu.dao.board.BoardDAO;
import com.kanbu.dto.SearchDTO;
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
	
	// 공지 목록 갯수
	@Override
	public int selectNoticeCount() throws Exception {
		return boardDAO.selectNoticeCount();
	}

	//공지 목록
	@Override
	public List<BoardDTO> selectNotice(BoardDTO board) throws Exception {
		return boardDAO.selectNotice(board);
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
	
	// 해당 공지사항 조회수 증가
	@Override
	public void updateViewsNotice(int index_num) throws Exception {
		boardDAO.updateViewsNotice(index_num);
	}

	// 해당 리뷰 조회수 증가
	@Override
	public void updateViewsReview(int index_num) throws Exception {
		boardDAO.updateViewsReview(index_num);
	}
	
	// 리뷰 목록 갯수
	@Override
	public int selectReviewCount() throws Exception {
		return boardDAO.selectReviewCount();
	}

	//리뷰 목록
	@Override
	public List selectReview(BoardDTO board) throws Exception {
		return boardDAO.selectReview(board);
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
	
	// 새로 들어온 리뷰번호 가져오기
	@Override
	public int maxReview() throws Exception {
		return boardDAO.maxReview();
	}

	// 새로 들어온 리뷰 태그 추가
	@Override
	public void insertTag(List<BoardDTO> tagList) throws Exception {
		boardDAO.insertTag(tagList);
	}

	//리뷰 수정
	@Override
	public void reviewUpdate(BoardDTO board) throws Exception {
		boardDAO.reviewUpdate(board);
	}
	
	//수정 시 기존 태그 삭제
	@Override
	public void deleteTag(int review) throws Exception {
		boardDAO.deleteTag(review);
	}

	//리뷰 삭제
	@Override
	public void reviewDelete(int index_num) throws Exception {
		boardDAO.reviewDelete(index_num);
	}

	//리뷰 삭제시 댓글 강제 삭제
	@Override
	public void deleteReply(int review) throws Exception {
		boardDAO.deleteReply(review);
	}	
	
	//태그
	@Override
	public List selectTag() throws Exception {
		return boardDAO.selectTag();
	}

	//댓글 갯수
	@Override
	public int selectReviewReplyCount(int index_num) throws Exception {
		return boardDAO.selectReviewReplyCount(index_num);
	}

	// 해당 장소정보의 전체댓글 검색
	@Override
	public List<BoardDTO> selectReviewReply(BoardDTO board) throws Exception {
		return boardDAO.selectReviewReply(board);
	}

	//댓글 등록
	@Override
	public void insertReviewReply(BoardDTO board) throws Exception {
		boardDAO.insertReviewReply(board);
	}
	
	//댓글 삭제
	@Override
	public void deleteReviewReply(int index_num) throws Exception {
		boardDAO.deleteReviewReply(index_num);
	}

	//수정 태그 목록 갯수
	@Override
	public int countReviewUpdateTag(int review) throws Exception {
		return boardDAO.countReviewUpdateTag(review);
	}
	
	//수정 태그 목록
	@Override
	public List selectreviewUpdateTag(int review) throws Exception {
		return boardDAO.selectreviewUpdateTag(review);
	}
	
	// 여행후기 검색 갯수(제목, 닉네임)
	@Override
	public int searchReviewCount(SearchDTO search) throws Exception {
		return boardDAO.searchReviewCount(search);
	}

	// 여행후기 검색 리스트(제목, 닉네임)
	@Override
	public List<BoardDTO> searchReview(SearchDTO search) throws Exception {
		return boardDAO.searchReview(search);
	}

	// 여행후기 태그 검색 갯수(제목, 닉네임)
	@Override
	public int searchReviewTagCount(SearchDTO search) throws Exception {
		return boardDAO.searchReviewTagCount(search);
	}

	// 여행후기 태그 검색 리스트(제목, 닉네임)
	@Override
	public List<BoardDTO> searchReviewTag(SearchDTO search) throws Exception {
		return boardDAO.searchReviewTag(search);
	}

	//공지 검색 갯수
	@Override
	public int searchNoticeCount(SearchDTO search) throws Exception {
		return boardDAO.searchNoticeCount(search);
	}

	//공지 검색
	@Override
	public List<BoardDTO> searchNotice(SearchDTO search) throws Exception {
		return boardDAO.searchNotice(search);
	}
	

}
