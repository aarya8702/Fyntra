package org.admin.controller;

import org.admin.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error",required = false) String error) {

		ModelAndView model = new ModelAndView("index");
		if(error != null) {
			model.addObject("error","incorrect username or password");
		}
		return model;
	}
	
	@RequestMapping(value = "/admin/home", method = RequestMethod.GET)
	public String home() {
		
		return "home";
	}
}
