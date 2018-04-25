package com.boxfoodology.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boxfoodology.config.BaseController;
import com.boxfoodology.db.entity.Post;
import com.boxfoodology.db.repository.BestsellerRepository;
import com.boxfoodology.db.repository.PostRepository;

@Controller
@RequestMapping("/" + HomeController.CONTROLLER)
public class HomeController extends BaseController {

	public static final String CONTROLLER = "";
	public static final String VIEW_DEFAULT = "home";

	@Autowired
	private PostRepository postRepository;
	@Autowired
	private BestsellerRepository bestsellerRepository;

	@RequestMapping(method = RequestMethod.GET)
	public String defaultView(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) {
		List<Post> posts = postRepository.findAll();
		model.addAttribute("posts", posts);
		model.addAttribute("bestsellerPageOne", bestsellerRepository.findAll(new PageRequest(0, 4)).getContent());
		model.addAttribute("bestsellerPageTwo", bestsellerRepository.findAll(new PageRequest(1, 4)).getContent());
		model.addAttribute("bestsellerPageThree", bestsellerRepository.findAll(new PageRequest(2, 4)).getContent());

		return VIEW_DEFAULT;
	}
	
}
