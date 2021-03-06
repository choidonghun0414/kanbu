package com.kanbu.service.plan;

public class Pager {
	// 페이지당 게시물 수
	public static final int PAGE_SCALE=10;
	// 화면당 페이지 수
	public static final int BLOCK_SCALE=10;
	private int curPage;	//현재 페이지
	private int prevPage;	//이전 페이지
	private int nextPage;		//다음 페이지
	private int totPage;	//전체 페이지 갯수
	private int totBlock;	//전체 페이지 블록 갯수
	private int curBlock;	//현재 페이지 블록
	private int preBlock;	//이전 페이지 블록
	private int nextBlock;	//다음 페이지 블록
	private int pageBegin;	// #{start}
	private int pageEnd;	// #{end}
	private int blockBegin;	//	현재 페이지 블록의 시작번호
	private int blockEnd;	//	현재 페이지 블록의 끝번호
	
	//생성자
	public Pager(int count, int curPage) {
		curBlock=1;	//현재 페이지 블록 번호
		this.curPage = curPage;	//현재 페이지 설정
		setTotPage(count);	//전체페이지 갯수 계산
		setPageRange();
		setTotBlock();	//전체 페이지 블록 갯수 계산
		setBlockRange();	//페이지 블록의 시작, 끝번호 계산
	}

	private void setTotPage(int count) {
		//Math.ceil(실수) 올림처리
		totPage = (int)Math.ceil(count*1.0 / PAGE_SCALE);
	}

	private void setTotBlock() {
		// 페이지 블록 갯수 계산 -> 총 100개라면 10개 블록
		totBlock=(int)Math.ceil(totPage / BLOCK_SCALE);
	}

	private void setPageRange() {
		pageBegin=(curPage-1)*PAGE_SCALE+1;	//시작번호=(현재페이지-1)*페이지당 게시물수+1;
		pageEnd=pageBegin+PAGE_SCALE-1;	//끝번호=시작페이지+페이지당 게시물수-1;
	}

	private void setBlockRange() {	//현재 페이지가 몇번째 페이지 블록에 속하는지 계산
		curBlock=(int)Math.ceil((curPage-1)/BLOCK_SCALE)+1;
		//현재페이지 블록의 시작, 끝번호 계산
		blockBegin=(curBlock-1)*BLOCK_SCALE+1;
		blockEnd=blockBegin+BLOCK_SCALE-1;
		
		if(blockEnd > totPage) blockEnd=totPage;	//마지막 페이지 번호가 범위를 초과하지않도록 처리
		prevPage=(curBlock==1) ?1: (curBlock-1)*BLOCK_SCALE;	//[이전]눌렀을 때 이동하는 페이지 번호
		nextPage=curBlock>totBlock ? (curBlock*BLOCK_SCALE) : 
			(curBlock*BLOCK_SCALE)+1;	// [다음]을 눌렀을 떄 이동할 페이지 번호
		if(nextPage >= totPage) nextPage=totPage;	//마지막 페이지가 범위 초과하지 않도록 처리
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getTotBlock() {
		return totBlock;
	}

	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public int getPreBlock() {
		return preBlock;
	}

	public void setPreBlock(int preBlock) {
		this.preBlock = preBlock;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getBlockBegin() {
		return blockBegin;
	}

	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}

	public int getBlockEnd() {
		return blockEnd;
	}

	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}

	public int getTotPage() {
		return totPage;
	}
	
	
}
