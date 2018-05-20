package com.boxfoodology.controller;

import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.engine.jdbc.BlobProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boxfoodology.config.BaseController;
import com.boxfoodology.db.entity.Category;
import com.boxfoodology.db.entity.Food;
import com.boxfoodology.db.repository.BestsellerRepository;
import com.boxfoodology.db.repository.CategoryRepository;
import com.boxfoodology.db.repository.FoodRepository;
import com.boxfoodology.model.FoodBean;
import com.boxfoodology.validator.FoodValidator;

@Secured("ROLE_ADMIN")
@Controller
@RequestMapping(FoodController.CONTROLLER)
public class FoodController extends BaseController {
	
	final static Logger logger = Logger.getLogger(FoodController.class);
	
	public static final String CONTROLLER = "foods";
	public static final String VIEW_DEFAULT = "foods";
	private static final String VIEW_NEW = "food-new";
	
	@Autowired
	private FoodRepository foodRepository;
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private BestsellerRepository bestsellerRepository;
	@Autowired
	private FoodValidator validator;
	
	@RequestMapping(method = RequestMethod.GET)
	public String defaultView(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale, @RequestParam(required = false) Integer categoryId) {
		if (categoryId != null && categoryId != 0) {
			model.addAttribute("foods", foodRepository.findFoodByCategory(categoryId));
			model.addAttribute("selectedCategoryId", categoryId);
		} else {
			model.addAttribute("foods", foodRepository.findAll());
		}
		List<Category> categories = categoryRepository.findAll();
		categories.add(0, new Category("Select category..."));
		model.addAttribute("categories", categories);
		
		return VIEW_DEFAULT;
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String add(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) {
		FoodBean foodBean = new FoodBean();
		model.addAttribute("foodmodel", foodBean);
		model.addAttribute("action", CONTROLLER + "/create");
		model.addAttribute("title", "Add new food");
		model.addAttribute("categories", categoryRepository.findAll());
		
		return VIEW_NEW;
	}
	
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@ModelAttribute("foodmodel") FoodBean foodBean, Errors errors, ModelMap model,
			final RedirectAttributes redirectAttributes) {

		Food food = new Food();
		food.setCategory(foodBean.getCategory());
		food.setDescription(foodBean.getDescription());
		food.setName(foodBean.getName());
		food.setPrice(foodBean.getPrice());
		
		try {
			food.setImage(BlobProxy.generateProxy(foodBean.getImageFile().getBytes()));
		} catch (IOException e) {
			logger.error("Error creating food.");
			e.printStackTrace();
		}
		validator.validate(food, errors);
		
		if (errors.hasErrors()) {
			model.addAttribute("foodmodel", foodBean);
			model.addAttribute("action", CONTROLLER + "/create");
			model.addAttribute("title", "Add new food");
			model.addAttribute("categories", categoryRepository.findAll());
			return VIEW_NEW;
		}
		
		foodRepository.save(food);
		
		return "redirect:/" + FoodController.CONTROLLER;
	}
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable(value = "id") Integer foodId, ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) throws SQLException, IOException {
		Food food = foodRepository.findOne(foodId);
		FoodBean foodBean = new FoodBean();
		foodBean.setCategory(food.getCategory());
		foodBean.setDescription(food.getDescription());
		foodBean.setId(food.getId());
		foodBean.setName(food.getName());
		foodBean.setPrice(food.getPrice());
		
		model.addAttribute("foodmodel", foodBean);
		model.addAttribute("action", CONTROLLER + "/update");
		model.addAttribute("title", "Edit food");
		model.addAttribute("categories", categoryRepository.findAll());
		
		return VIEW_NEW;
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute("foodmodel") FoodBean foodBean, Errors errors, ModelMap model,
			final RedirectAttributes redirectAttributes) {

		Food food = foodRepository.findOne(foodBean.getId());
		food.setCategory(foodBean.getCategory());
		food.setDescription(foodBean.getDescription());
		food.setName(foodBean.getName());
		food.setPrice(foodBean.getPrice());
		try {
			if (foodBean.getImageFile().getBytes().length != 0) {
				food.setImage(BlobProxy.generateProxy(foodBean.getImageFile().getBytes()));
			}
		} catch (IOException e) {
			logger.error("Error updating food[" + foodBean.getId() + "]");
			e.printStackTrace();
		}
		
		validator.validate(food, errors);
		
		if (errors.hasErrors()) {
			model.addAttribute("foodmodel", foodBean);
			model.addAttribute("action", CONTROLLER + "/update");
			model.addAttribute("title", "Edit food");
			model.addAttribute("categories", categoryRepository.findAll());
			return VIEW_NEW;
		}
		
		foodRepository.save(food);
		
		return "redirect:/" + FoodController.CONTROLLER;
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable(value = "id") Integer foodId) {
		//first delete bestseller
		bestsellerRepository.deleteBestsellerByFood(foodId);
		//delete food
		Food food = foodRepository.findOne(foodId);
		food.setDeleted(true);
		foodRepository.save(food);
		
		return "redirect:/" + FoodController.CONTROLLER;
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
