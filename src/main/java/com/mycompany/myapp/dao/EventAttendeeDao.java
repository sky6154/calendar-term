package com.mycompany.myapp.dao;

import java.util.List;

import com.mycompany.myapp.domain.CalendarUser;
import com.mycompany.myapp.domain.EventAttendee;

public interface EventAttendeeDao {
    public List<EventAttendee> findEventAttendeeByEventId(int eventId);
    
    public List<EventAttendee> findEventAttendeeByAttendeeId(int attendeeId);
    
    public List<CalendarUser> findEventUserByEventId(int eventId);

    public int createEventAttendee(EventAttendee eventAttendee);

    public void deleteEventAttendee(int id);
    
    public void deleteEventAttendeeByEventId(int eventId);
    
    public void deleteAll();
}