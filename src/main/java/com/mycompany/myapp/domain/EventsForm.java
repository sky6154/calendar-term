package com.mycompany.myapp.domain;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "EventsForm")
public class EventsForm {
	private List<Integer> eventList;
	private String userId;
	private String flag;
	
	public EventsForm(){
		eventList = new ArrayList<Integer>();
	}
	
	@XmlElement
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@XmlElement
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	@XmlElement
	public List<Integer> getEventList() {
		return eventList;
	}

	public void setEventList(List<Integer> eventList) {
		this.eventList = eventList;
	}

}