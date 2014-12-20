package com.mycompany.myapp.domain;

import java.util.ArrayList;
import java.util.List;

public class EventInfo{
	private List<CalendarUser> attendees;
	private Event event;
	
	public EventInfo(Event event){
		this.event = event;
		this.attendees = new ArrayList<CalendarUser>();
	}
	
	@Override
    public boolean equals(Object object) {
        boolean isSame = false;

        if (object != null && object instanceof EventInfo) {
            isSame = this.event == ((EventInfo) object).event;
        }

        return isSame;
    }
	
	@Override
	public int hashCode() {
		return event.hashCode();
	}

	public List<CalendarUser> getAttendees() {
		return attendees;
	}

	public Event getEvent() {
		return event;
	}

	public void setAttendees(List<CalendarUser> attendees) {
		this.attendees = attendees;
	}
}
