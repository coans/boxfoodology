package com.boxfoodology.controller;

import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boxfoodology.config.BaseController;
import com.boxfoodology.db.entity.Message;
import com.boxfoodology.db.repository.MessageRepository;

@Secured("ROLE_USER")
@Controller
@RequestMapping(MessageController.CONTROLLER)
public class MessageController extends BaseController {
	
	public static final String CONTROLLER = "messages";
	public static final String VIEW_DEFAULT = "messages";
	private static final String VIEW_NEW = "message-new";
	
	@Autowired
	private MessageRepository messageRepository;
	
	//TODO add validator
	
	@RequestMapping(method = RequestMethod.GET)
	public String defaultView(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) {
		model.addAttribute("messages", messageRepository.findAll());
		model.addAttribute("title", "All messages");
		
		return VIEW_DEFAULT;
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String add(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) {
		Message message = new Message();
		model.addAttribute("message", message);
		model.addAttribute("action", CONTROLLER + "/create");
		model.addAttribute("title", "Send message to us");
		
		return VIEW_NEW;
	}
	
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@ModelAttribute("message") Message message, Errors errors, ModelMap model,
			final RedirectAttributes redirectAttributes) {

			message.setCreated(new Date());
			message.setUser(super.getUser());
//TODO		validator.validate(food, errors);
		
		if (errors.hasErrors()) {
			model.addAttribute("message", message);
			model.addAttribute("action", CONTROLLER + "/create");
			model.addAttribute("title", "Send message to us");
			return VIEW_NEW;
		}
		
		messageRepository.save(message);
		
		return "redirect:/" + MessageController.CONTROLLER;
	}
}
