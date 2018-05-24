package com.boxfoodology.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boxfoodology.config.BaseController;

@Controller
@RequestMapping(OurStoryController.CONTROLLER)
public class OurStoryController extends BaseController {
	
	public static final String CONTROLLER = "our-story";
	public static final String VIEW_DEFAULT = "our-story";
	public static final String VIEW_FAQ = "faq";
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String defaultView(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) {
		
		return VIEW_DEFAULT;
	}
	
	@RequestMapping(value = "faq", method = RequestMethod.GET)
	public String faqView(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) {
		
		return VIEW_FAQ;
	}
}
