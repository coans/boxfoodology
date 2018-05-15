package com.boxfoodology.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.engine.jdbc.BlobProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boxfoodology.config.BaseController;
import com.boxfoodology.db.entity.Bestseller;
import com.boxfoodology.db.entity.Category;
import com.boxfoodology.db.repository.BestsellerRepository;
import com.boxfoodology.db.repository.CategoryRepository;
import com.boxfoodology.db.repository.FoodRepository;
import com.boxfoodology.model.CategoryBean;
import com.boxfoodology.validator.CategoryValidator;

@Secured("ROLE_ADMIN")
@Controller
@RequestMapping(CategoryController.CONTROLLER)
public class CategoryController extends BaseController {
	
	public static final String CONTROLLER = "categories";
	public static final String VIEW_DEFAULT = "categories";
	private static final String VIEW_NEW = "category-new";
	
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private FoodRepository foodRepository;
	@Autowired
	private BestsellerRepository bestsellerRepository;
	@Autowired
	private CategoryValidator validator;
	
	@RequestMapping(method = RequestMethod.GET)
	public String defaultView(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale, @RequestParam(required = false) String menu) {
		if (menu != null && !menu.isEmpty()) {
			model.addAttribute("categories", categoryRepository.findCategoryByMenu(menu));
			model.addAttribute("selectedMenu", menu);
		} else {
			model.addAttribute("categories", categoryRepository.findAll());
		}
		
		return VIEW_DEFAULT;
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String add(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) {
		CategoryBean categoryBean = new CategoryBean();
		model.addAttribute("categorymodel", categoryBean);
		model.addAttribute("action", CONTROLLER + "/create");
		model.addAttribute("title", "Add new category");
		
		return VIEW_NEW;
	}
	
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@ModelAttribute("categorymodel") CategoryBean categoryBean, Errors errors, ModelMap model,
			final RedirectAttributes redirectAttributes) {

		Category category = new Category();
		category.setName(categoryBean.getName());
		category.setCreated(new Date());
		category.setMenu(categoryBean.getMenu());
		category.setShowOnHome(categoryBean.isShowOnHome());
		
		try {
			category.setImage(BlobProxy.generateProxy(categoryBean.getImageFile().getBytes()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		validator.validate(category, errors);
		
		if (errors.hasErrors()) {
			model.addAttribute("categorymodel", categoryBean);
			model.addAttribute("action", CONTROLLER + "/create");
			model.addAttribute("title", "Add new category");
			return VIEW_NEW;
		}
		
		categoryRepository.save(category);
		
		return "redirect:/" + CategoryController.CONTROLLER;
	}
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable(value = "id") Integer categoryId, ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) throws SQLException, IOException {
		Category category = categoryRepository.findOne(categoryId);
		CategoryBean categoryBean = new CategoryBean();
		categoryBean.setCreated(category.getCreated());
		categoryBean.setName(category.getName());
		categoryBean.setId(category.getId());
		categoryBean.setMenu(category.getMenu());
		categoryBean.setShowOnHome(category.isShowOnHome());
		
		model.addAttribute("categorymodel", categoryBean);
		model.addAttribute("action", CONTROLLER + "/update");
		model.addAttribute("title", "Edit category");
		
		return VIEW_NEW;
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute("categorymodel") CategoryBean categoryBean, Errors errors, ModelMap model,
			final RedirectAttributes redirectAttributes) {

		Category category = categoryRepository.findOne(categoryBean.getId());
		category.setCreated(new Date());
		category.setName(categoryBean.getName());
		category.setMenu(categoryBean.getMenu());
		category.setShowOnHome(categoryBean.isShowOnHome());
		
		try {
			if (categoryBean.getImageFile().getBytes().length != 0) {
				category.setImage(BlobProxy.generateProxy(categoryBean.getImageFile().getBytes()));
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		validator.validate(category, errors);
		
		if (errors.hasErrors()) {
			model.addAttribute("categorymodel", categoryBean);
			model.addAttribute("action", CONTROLLER + "/update");
			model.addAttribute("title", "Edit category");
			return VIEW_NEW;
		}
		
		categoryRepository.save(category);
		
		return "redirect:/" + CategoryController.CONTROLLER;
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable(value = "id") Integer categoryId) {
		Category category = categoryRepository.findOne(categoryId);
		category.setDeleted(true);
		List<Bestseller> bestsellers = bestsellerRepository.deleteBestsellerByCategory(categoryId);
		for (Bestseller bestseller : bestsellers) {
			bestseller.setDeleted(true);
			bestsellerRepository.save(bestseller);
		}
		foodRepository.deleteFoodByCategory(categoryId);
		categoryRepository.save(category);
		
		
		return "redirect:/" + CategoryController.CONTROLLER;
	}
}
