package com.boxfoodology.controller;

import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.engine.jdbc.BlobProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boxfoodology.config.BaseController;
import com.boxfoodology.db.entity.Category;
import com.boxfoodology.db.entity.Food;
import com.boxfoodology.db.repository.CategoryRepository;
import com.boxfoodology.db.repository.FoodRepository;
import com.boxfoodology.model.FoodBean;
import com.boxfoodology.validator.FoodValidator;

@Controller
@RequestMapping(FoodController.CONTROLLER)
public class FoodController extends BaseController {
	
	public static final String CONTROLLER = "foods";
	public static final String VIEW_DEFAULT = "foods";
	
	@Autowired
	private FoodRepository foodRepository;
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private FoodValidator validator;
	
	@RequestMapping(method = RequestMethod.GET)
	public String defaultView(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) {
		FoodBean foodBean = new FoodBean();
		model.addAttribute("foodmodel", foodBean);
		model.addAttribute("action", CONTROLLER + "/create");
		model.addAttribute("categories", categoryRepository.findAll());
		
		return VIEW_DEFAULT;
	}
	
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@ModelAttribute("foodmodel") FoodBean foodBean, Errors errors, ModelMap model,
			final RedirectAttributes redirectAttributes) {

		Food food = new Food();
		food.setCategory(foodBean.getCategory());
		food.setDescription(foodBean.getDescription());
		food.setName(foodBean.getName());
		
		try {
			food.setImage(BlobProxy.generateProxy(foodBean.getImageFile().getBytes()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		validator.validate(food, errors);
		
		if (errors.hasErrors()) {
			model.addAttribute("categories", categoryRepository.findAll());
			return VIEW_DEFAULT;
		}
		
		foodRepository.save(food);
		
		return "redirect:/" + HomeController.CONTROLLER;
	}
	
	@Override
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		super.initBinder(binder);
		binder.registerCustomEditor(Category.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String id) {
				Category category = new Category();
				category.setId(Integer.parseInt(id));
				setValue(category);
			}
		});
	}
}
