package com.boxfoodology.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boxfoodology.config.BaseController;
import com.boxfoodology.db.entity.Food;
import com.boxfoodology.db.repository.CategoryRepository;
import com.boxfoodology.db.repository.FoodRepository;

@Controller
@RequestMapping(ItemController.CONTROLLER)
public class ItemController extends BaseController {

	public static final String CONTROLLER = "items";
	private static final String VIEW_ITEMS = "items";
	private static final String VIEW_DETAILS = "item-details";
	
	@Autowired
	private FoodRepository foodRepository;
	@Autowired
	private CategoryRepository categoryRepository;
	
	@RequestMapping(value = "{categoryId}", method = RequestMethod.GET)
	public String itemsView(@PathVariable(value = "categoryId") Integer categoryId, ModelMap model) {
		model.addAttribute("foods", foodRepository.findFoodByCategory(categoryId));
		model.addAttribute("title", categoryRepository.findOne(categoryId).getTitle());
		
		return VIEW_ITEMS;
	}
	
	@RequestMapping(value = "image/{foodId}", method = RequestMethod.GET)
	public void getImage(@PathVariable(value = "foodId") Integer foodId, HttpServletResponse response) throws SQLException, IOException {
		Food food = foodRepository.findOne(foodId);
		byte[] image = food.getImage().getBytes(1L, (int)food.getImage().length());
		response.setContentType("image/jpg");
		ServletOutputStream output = response.getOutputStream();
		output.write(image);
		output.close();
		
	}
	
	@RequestMapping(value = "details/{foodId}", method = RequestMethod.GET)
	public String detailsView(@PathVariable(value = "foodId") Integer foodId, ModelMap model) {
		model.addAttribute("food", foodRepository.findOne(foodId));
		
		return VIEW_DETAILS;
	}
}
