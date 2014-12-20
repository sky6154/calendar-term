package com.mycompany.myapp.domain;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "EventForm")
public class EventForm {
	String when;
	String owner;
	String summary;
	String description;
	
	public EventForm(){
	}
	
	public String getWhen() {
		return when;
	}
	public void setWhen(String when) {
		this.when = when;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

}