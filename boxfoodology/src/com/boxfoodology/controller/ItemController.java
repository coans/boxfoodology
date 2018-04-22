package com.boxfoodology.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		//for correct jsp display, set 4 items per row
		List<Food> result = foodRepository.findFoodByCategory(categoryId);
		String title = categoryRepository.findOne(categoryId).getTitle();
		prepareListOfFoodForJsp(model, result, title);
		
		return VIEW_ITEMS;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	private void prepareListOfFoodForJsp(ModelMap model, List<Food> result, String title) {
		List foods = new ArrayList<List>();
		List<Food> oneRow = new ArrayList<Food>();
		for (int i = 0;i < result.size();i++) {
			if (i % 4 == 0) {
				foods.add(oneRow);
				oneRow = new ArrayList<Food>();
				oneRow.add(result.get(i));
			} else {
				oneRow.add(result.get(i));
			}
		}
		foods.add(oneRow);
		model.addAttribute("foods", foods);
		model.addAttribute("title", title);
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
	
	@RequestMapping(value = "search", method = RequestMethod.POST)
	public String search(@ModelAttribute("search") Food search, ModelMap model) {
		List<Food> result = foodRepository.findFoodBySearchCriteria("%" + search.getName()+ "%", "%" + search.getName()+ "%");
		prepareListOfFoodForJsp(model, result, "\"" + search.getName() + "\"");
		
		return VIEW_ITEMS;
	}
}
