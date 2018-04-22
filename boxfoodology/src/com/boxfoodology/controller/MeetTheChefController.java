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
@RequestMapping(MeetTheChefController.CONTROLLER)
public class MeetTheChefController extends BaseController {
	
	public static final String CONTROLLER = "meet-the-chef";
	public static final String VIEW_DEFAULT = "meet-the-chef";
	
	@RequestMapping(method = RequestMethod.GET)
	public String defaultView(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) {
		
		return VIEW_DEFAULT;
	}
}
