package com.mycompany.myapp.web.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.domain.CalendarUser;
import com.mycompany.myapp.domain.Event;
import com.mycompany.myapp.domain.EventAttendee;
import com.mycompany.myapp.domain.EventForm;
import com.mycompany.myapp.domain.EventInfo;
import com.mycompany.myapp.domain.EventLevel;
import com.mycompany.myapp.domain.EventsForm;
import com.mycompany.myapp.service.CalendarService;

@Controller
@RequestMapping(value = "/events")
@ContextConfiguration(locations = "/root-context.xml")
public class EventController {
	@Autowired
	private CalendarService calendarService;

	@RequestMapping(value = "/createEvent", method = RequestMethod.GET)
	public String createEvent(Model model) {
		EventForm eventForm = new EventForm();

		model.addAttribute("eventForm", eventForm);
		model.addAttribute("message", "event페이지 입니다.");

		return "/events/createEvent";
	}

	@RequestMapping(value = "/createResult", method = RequestMethod.POST)
	public String processEvent(
			@ModelAttribute("eventForm") EventForm eventForm, Model model) {
		Event newEvent = new Event();

		CalendarUser owner = calendarService.findUserByUserId(eventForm
				.getOwner());
		Calendar cal = Calendar.getInstance();

		if (eventForm.getWhen().equals("")) {
			eventForm.setWhen(cal.getTime().toString());
		} else {
			String split[] = eventForm.getWhen().split(" "); // date, time, am
																// or pm
			String split2[] = split[0].split("/"); // month, day, year
			String split3[] = split[1].split(":"); // hour, minute

			String year = split2[2];
			String month = split2[0];
			String date = split2[1];
			String hour = split3[0];
			String minute = split3[1];
			String noon = split[2];

			if (noon.equals("PM"))
				if (hour.equals("12")) {
				} else
					hour = "" + (Integer.parseInt(hour) + 12);

			
			cal.set(Integer.parseInt(year) - 1, Integer.parseInt(month) - 1,
					Integer.parseInt(date), Integer.parseInt(hour),
					Integer.parseInt(minute));
			cal.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		}

		newEvent.setDescription(eventForm.getDescription());
		newEvent.setEventLevel(EventLevel.NORMAL);
		newEvent.setNumLikes(0);
		newEvent.setOwner(owner);
		newEvent.setSummary(eventForm.getSummary());
		newEvent.setWhen(cal);

		calendarService.createEvent(newEvent);

		model.addAttribute("eventForm", eventForm);
		// model.addAttribute("message", "event페이지 입니다.");

		return "/events/createResult";
	}

	// view
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView viewEvent(ModelAndView mav) {
		EventsForm eventsForm = new EventsForm();
		List<Event> allEvents = new ArrayList<Event>();
		List<EventInfo> eventInfoes = new ArrayList<EventInfo>();

		allEvents = calendarService.getAllEvents();
		for (int i = 0; i < allEvents.size(); i++) {
			Event e = allEvents.get(i);
			if (!eventInfoes.contains(e)) {
				EventInfo ei = new EventInfo(e);
				ei.setAttendees(calendarService.getEventUserByEventId(e.getId()));
				eventInfoes.add(ei);
			}
		}

		mav.addObject("eventForm", eventsForm);
		mav.addObject("eventInfoes", eventInfoes);
		mav.setViewName("/events/form");
		return mav;
	}

	// event join
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView viewEvent(ModelAndView mav,
			@ModelAttribute("eventForm") EventsForm eventsForm) {

		List<Integer> eventList = eventsForm.getEventList();

		if (eventsForm.getFlag().equals("join")) {
			System.out.println("join 클릭됨");
			CalendarUser currentUser = calendarService
					.findUserByUserId(eventsForm.getUserId());

			System.out.println("size : " + eventList.size());

			for (int i = 0; i < eventList.size(); i++) {
				System.out.println("size : " + eventList.size());
				EventAttendee addEventAttendee = new EventAttendee();
				addEventAttendee.setAttendee(currentUser);
				addEventAttendee.setEvent(calendarService.getEvent(eventList
						.get(i)));

				calendarService.createEventAttendee(addEventAttendee);
			}

			mav.setViewName("/events/joinResult");
			mav.addObject("msg", "event가 성공적으로 등록되었습니다.");
		} else if (eventsForm.getFlag().equals("delete")) {
			for (int i = 0; i < eventList.size(); i++) {
				calendarService.deleteEvent(eventList.get(i));
			}

			mav.setViewName("/events/joinResult");
			mav.addObject("msg", "event가 성공적으로 삭제되었습니다.");
		} else {
			mav.setViewName("");
			mav.addObject("msg", "유효하지 않은 페이지입니다.");
		}
		return mav;
	}
}
