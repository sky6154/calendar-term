package com.mycompany.myapp.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.CalendarService;

@Controller
@RequestMapping(value = "/users")
public class LoginController {
	@Autowired
	private CalendarService calendarService;

	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public ModelAndView createEvent(@RequestParam(value = "error", required = false) String error, @RequestParam(value = "logout", required = false) String logout) {
		// mav.addObject("message", "event�? ?��?��?��?��?��.");
		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("/users/signin");
		return model;
	}
}