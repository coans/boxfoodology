package com.boxfoodology.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boxfoodology.config.BaseController;
import com.boxfoodology.db.entity.Message;

@Controller
@RequestMapping(LocationController.CONTROLLER)
public class LocationController extends BaseController {
	
	public static final String CONTROLLER = "location";
	public static final String VIEW_DEFAULT = "location";
	public static final String VIEW_UNDER_CONSTRUCTION = "underconstruction";
	
	@RequestMapping(method = RequestMethod.GET)
	public String defaultView(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) {
		Message message = new Message();
		model.addAttribute("message", message);
		model.addAttribute("action", "messages/create");
		
		return VIEW_DEFAULT;
	}
	
	@RequestMapping(value = "/empty", method = RequestMethod.GET)
	public String add(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) {
		
		return VIEW_UNDER_CONSTRUCTION;
	}
}
