package com.mycompany.myapp.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.domain.CalendarUser;
import com.mycompany.myapp.domain.EventLevel;
import com.mycompany.myapp.domain.UserInfo;
import com.mycompany.myapp.service.CalendarService;

@Controller
@RequestMapping(value = "/users")
public class LoginController {
	@Autowired
	private CalendarService calendarService;

	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error, @RequestParam(value = "logout", required = false) String logout) {
		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username or password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("/users/signin");
		return model;
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String register(@ModelAttribute("userInfo") UserInfo userInfo, Model model) {
		CalendarUser userForm = new CalendarUser();    
		model.addAttribute("userForm", userForm);

	    return "/users/signup";
	}
	
	@RequestMapping(value = "/signupResult", method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute("userInfo") UserInfo userInfo, @ModelAttribute("userForm") CalendarUser user, Model model) {
        user.setLevel(EventLevel.NORMAL.intValue());
        user.setLogin(0);
        user.setRecommend(0);
        this.calendarService.createUser(user);
         
        // for testing purpose:
        System.out.println("id: " + user.getId());
        System.out.println("name: " + user.getName());
        System.out.println("password: " + user.getPassword());
        System.out.println("email: " + user.getEmail());
         
        return "/users/signupResult";
    }
}