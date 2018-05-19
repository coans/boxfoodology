package com.boxfoodology.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boxfoodology.config.BaseController;
import com.boxfoodology.db.entity.Category;
import com.boxfoodology.db.entity.Post;
import com.boxfoodology.db.repository.BestsellerRepository;
import com.boxfoodology.db.repository.CategoryRepository;
import com.boxfoodology.db.repository.PostRepository;

@Controller
@RequestMapping("/" + HomeController.CONTROLLER)
public class HomeController extends BaseController {

	public static final String CONTROLLER = "";
	public static final String VIEW_DEFAULT = "home";

	final static Logger logger = Logger.getLogger(HomeController.class);
	
	@Autowired
	private PostRepository postRepository;
	@Autowired
	private BestsellerRepository bestsellerRepository;
	@Autowired
	private CategoryRepository categoryRepository;

	@RequestMapping(method = RequestMethod.GET)
	public String defaultView(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) {
		List<Post> posts = postRepository.findAll();
		model.addAttribute("posts", posts);
		model.addAttribute("bestsellerPageOne", bestsellerRepository.findAll(new PageRequest(0, 4)).getContent());
		model.addAttribute("bestsellerPageTwo", bestsellerRepository.findAll(new PageRequest(1, 4)).getContent());
		model.addAttribute("bestsellerPageThree", bestsellerRepository.findAll(new PageRequest(2, 4)).getContent());
		model.addAttribute("categories", categoryRepository.findCategoryForHomePage());
		logger.info("Home controller :)");
		
		return VIEW_DEFAULT;
	}
	
	@RequestMapping(value = "image/{categoryId}", method = RequestMethod.GET)
	public void getImage(@PathVariable(value = "categoryId") Integer categoryId, HttpServletResponse response) throws SQLException, IOException {
		Category category = categoryRepository.findOne(categoryId);
		byte[] image = category.getImage().getBytes(1L, (int)category.getImage().length());
		response.setContentType("image/jpg");
		ServletOutputStream output = response.getOutputStream();
		output.write(image);
		output.close();
		
	}
}
