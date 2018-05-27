package com.boxfoodology.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boxfoodology.config.BaseController;
import com.boxfoodology.db.repository.UserRepository;

@Controller
@RequestMapping(UserController.CONTROLLER)
public class UserController extends BaseController {
	
	public static final String CONTROLLER = "users";
	public static final String VIEW_DEFAULT = "users";
	
	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping(method = RequestMethod.GET)
	public String defaultView(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) {
		model.addAttribute("users", userRepository.findAll());
		
		return VIEW_DEFAULT;
	}
}
