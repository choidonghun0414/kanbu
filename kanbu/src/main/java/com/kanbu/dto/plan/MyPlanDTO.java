package com.kanbu.dto.plan;

import java.sql.Timestamp;
import java.util.Arrays;
import java.sql.Date;

public class MyPlanDTO {
	private int index_num;	// 인덱스 번호
	private String title;	// 여행 일정 제목
	private int writer;		// 작성자번호
	private Date startDay;	// 여행 시작일
	private Date arrivalDay;	// 여행 마지막일
	private String traffic;	// 이동수단 (드롭박스 선택)
	private int expense;	// 비용 (input으로 처리)
	private Timestamp reg_date;	// 게시판 생성일 (자동으로 처리)
	private int place;	// 찜목록 저장 장소 ...
	/*
	 * private int[] schedule; // Array list 배열로 처리 private String show; // 게시판list용
	 * 추가
	 */
	private int startRow;	// 시작번호(페이징처리)
	private int endRow;		// 끝번호(페이징처리)
	
	public int getIndex_num() {
		return index_num;
	}
	public void setIndex_num(int index_num) {
		this.index_num = index_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public Date getStartDay() {
		return startDay;
	}
	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}
	public Date getArrivalDay() {
		return arrivalDay;
	}
	public void setArrivalDay(Date arrivalDay) {
		this.arrivalDay = arrivalDay;
	}
	public String getTraffic() {
		return traffic;
	}
	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}
	public int getExpense() {
		return expense;
	}
	public void setExpense(int expense) {
		this.expense = expense;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getPlace() {
		return place;
	}
	public void setPlace(int place) {
		this.place = place;
	}

	/*
	 * public int[] getSchedule() { return schedule; } public void setSchedule(int[]
	 * schedule) { this.schedule = schedule; }
	 * 
	 * public String getShow() { return show; }
	 * 
	 * public void setShow(String show) { this.show = show; }
	 */
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

}
