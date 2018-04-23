package com.boxfoodology.controller;

import java.beans.PropertyEditorSupport;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.boxfoodology.db.entity.Bestseller;
import com.boxfoodology.db.entity.Food;
import com.boxfoodology.db.repository.BestsellerRepository;
import com.boxfoodology.db.repository.FoodRepository;

@Controller
@RequestMapping(BestsellerController.CONTROLLER)
public class BestsellerController extends BaseController {
	
	public static final String CONTROLLER = "bestsellers";
	public static final String VIEW_DEFAULT = "bestsellers";
	private static final String VIEW_NEW = "bestseller-new";
	
	@Autowired
	private BestsellerRepository bestsellerRepository;
	@Autowired
	private FoodRepository foodRepository;
	
	@RequestMapping(method = RequestMethod.GET)
	public String defaultView(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) {
		model.addAttribute("bestsellers", bestsellerRepository.findAll());
		
		return VIEW_DEFAULT;
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String add(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) {
		Bestseller bestseller = new Bestseller();
		model.addAttribute("bestsellermodel", bestseller);
		model.addAttribute("action", CONTROLLER + "/create");
		model.addAttribute("title", "Add food to bestseller");
		model.addAttribute("foods", foodRepository.findAll());
		
		return VIEW_NEW;
	}
	
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@ModelAttribute("bestsellermodel") Bestseller bestseller, Errors errors, ModelMap model,
			final RedirectAttributes redirectAttributes) {

		//TODO validate
		//validator.validate(food, errors);
		
		if (errors.hasErrors()) {
			model.addAttribute("bestsellermodel", bestseller);
			model.addAttribute("action", CONTROLLER + "/create");
			model.addAttribute("title", "Add food to bestseller");
			model.addAttribute("foods", foodRepository.findAll());
			return VIEW_NEW;
		}
		
		bestsellerRepository.save(bestseller);
		
		return "redirect:/" + BestsellerController.CONTROLLER;
	}
/*	
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
		//TODO fix picture
		
		validator.validate(food, errors);
		
		if (errors.hasErrors()) {
			model.addAttribute("foodmodel", foodBean);
			model.addAttribute("action", CONTROLLER + "/update");
			model.addAttribute("title", "Edit food");
			model.addAttribute("categories", categoryRepository.findAll());
			return VIEW_NEW;
		}
		
		foodRepository.save(food);
		
		return "redirect:/" + BestsellerController.CONTROLLER;
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable(value = "id") Integer foodId) {
		Food food = foodRepository.findOne(foodId);
		food.setDeleted(true);
		foodRepository.save(food);
		
		return "redirect:/" + BestsellerController.CONTROLLER;
	}
	*/
	@Override
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		super.initBinder(binder);
		binder.registerCustomEditor(Food.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String id) {
				Food food = new Food();
				food.setId(Integer.parseInt(id));
				setValue(food);
			}
		});
	}
}
