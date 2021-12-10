package com.kanbu.dto.plan;

public class SPlanDTO {
	private int schedule;	// 찜 추가 목록
	private int place;		// 찜 장소
	private int list_num;	// index_num
	
	public int getSchedule() {
		return schedule;
	}
	public void setSchedule(int schedule) {
		this.schedule = schedule;
	}
	public int getPlace() {
		return place;
	}
	public void setPlace(int place) {
		this.place = place;
	}
	public int getList_num() {
		return list_num;
	}
	public void setList_num(int list_num) {
		this.list_num = list_num;
	}
	
}
