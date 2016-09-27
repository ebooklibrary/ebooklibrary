package com.ebooklibrary.app.event.model;

import java.sql.Timestamp;
import java.util.Date;

public class EventVO {
	private int eventNo;
	private String eventName;
	private String eventUrl;
	private String eventImageUrl;
	private int eventKind;
	private Date endDay;
	
		
	public Date getEndDay() {
		return endDay;
	}
	public void setEndDay(Date endDay) {
		this.endDay = endDay;
	}
	public int getEventNo() {
		return eventNo;
	}
	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getEventUrl() {
		return eventUrl;
	}
	public void setEventUrl(String eventUrl) {
		this.eventUrl = eventUrl;
	}
	public String getEventImageUrl() {
		return eventImageUrl;
	}
	public void setEventImageUrl(String eventImageUrl) {
		this.eventImageUrl = eventImageUrl;
	}
	public int getEventKind() {
		return eventKind;
	}
	public void setEventKind(int eventKind) {
		this.eventKind = eventKind;
	}
	@Override
	public String toString() {
		return "EventVO [eventNo=" + eventNo + ", eventName=" + eventName + ", eventUrl=" + eventUrl
				+ ", eventImageUrl=" + eventImageUrl + ", eventKind=" + eventKind + ", endDay=" + endDay + "]";
	}
	
	
	
}
