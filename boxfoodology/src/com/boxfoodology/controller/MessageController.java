package com.boxfoodology.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boxfoodology.config.BaseController;
import com.boxfoodology.db.entity.Message;
import com.boxfoodology.db.repository.MessageRepository;
import com.boxfoodology.util.EmailUtil;
import com.boxfoodology.validator.MessageValidator;

@Controller
@RequestMapping(MessageController.CONTROLLER)
public class MessageController extends BaseController {
	
	public static final String CONTROLLER = "messages";
	public static final String VIEW_DEFAULT = "messages";
	private static final String VIEW_NEW = "message-new";
	private static final String VIEW_ANSWER = "message-answer";
	
	@Autowired
	private MessageRepository messageRepository;
	
	@Autowired
	private MessageValidator validator;
	
	@Autowired
	private EmailUtil emailUtil;
	
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
	public String create(@ModelAttribute("message") Message message, Errors errors, ModelMap model, final RedirectAttributes redirectAttributes) {
		message.setCreated(new Date());
		message.setUser(super.getUser());
		validator.validate(message, errors);
		if (errors.hasErrors()) {
			model.addAttribute("message", message);
			model.addAttribute("action", CONTROLLER + "/create");
			model.addAttribute("title", "Send message to us");
			return VIEW_NEW;
		}
		
		messageRepository.save(message);
		
		return "redirect:/" + HomeController.CONTROLLER;
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable(value = "id") Integer messageId) {
		Message message = messageRepository.findOne(messageId);
		message.setDeleted(true);
		messageRepository.save(message);
		
		return "redirect:/" + MessageController.CONTROLLER;
	}
	
	@RequestMapping(value = "/answer/{id}", method = RequestMethod.GET)
	public String answer(@PathVariable(value = "id") Integer messageId, ModelMap model) {
		Message message = messageRepository.findOne(messageId);
		model.addAttribute("message", message);
		Message answer = new Message();
		answer.setId(message.getId());
		answer.setUser(message.getUser());
		String user = ""; 
		if (message.getUser() != null) {
			user = message.getUser().getFirstName() + " " + message.getUser().getLastName();
		}
		answer.setTitle("Dear " + user);
		model.addAttribute("answer", answer);
		model.addAttribute("userName", user);
		model.addAttribute("action", CONTROLLER + "/answer");
		
		return VIEW_ANSWER;
	}
	
	@RequestMapping(value = "answer", method = RequestMethod.POST)
	public String sendAnswer(@ModelAttribute("answer") Message message, Errors errors, ModelMap model) {
		if (message.getUser() != null) {
			Message msg = messageRepository.findOne(message.getId());
			Map<String, Object> myModel = new HashMap<String, Object>();
			myModel.put("title", message.getTitle());
			myModel.put("message", message.getContent());
			
			emailUtil.sendMail(msg.getUser().getEmail(), "Boxfoodology answer to your message", "message-answer.vm", myModel);
		} else {
			notif.error("You can not answer to unregistered user's message!");
		}
		
		return "redirect:/" + MessageController.CONTROLLER;
	}
}
