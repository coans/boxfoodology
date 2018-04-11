package com.boxfoodology.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boxfoodology.config.BaseController;
import com.boxfoodology.db.entity.Food;
import com.boxfoodology.db.entity.Myorder;
import com.boxfoodology.db.repository.FoodRepository;
import com.boxfoodology.db.repository.MyorderRepository;
import com.boxfoodology.util.UserPath;

@Controller
@RequestMapping(UserPath.MY + MyOrdersController.CONTROLLER)
public class MyOrdersController extends BaseController {
	
	public static final String CONTROLLER = "orders";
	public static final String VIEW_DEFAULT = "orders";
	
	@Autowired
	private FoodRepository foodRepository;
	
	@Autowired
	private MyorderRepository orderRepository;
	
	@RequestMapping(method = RequestMethod.GET)
	public String defaultView(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) {
		model.addAttribute("orders", super.getUser().getOrders());
		
		return VIEW_DEFAULT;
	}
	
	@RequestMapping(value = "add/{foodId}", method = RequestMethod.GET)
	public String add(@PathVariable(value = "foodId") Integer foodId, ModelMap model) {
		Food food = foodRepository.findOne(foodId);
		Myorder order = new Myorder();
		order.setFood(food);
		order.setUser(super.getUser());

		Myorder result = orderRepository.save(order);
		
		super.getUser().getOrders().add(result);

		return "redirect:/" + ItemController.CONTROLLER + "/" + food.getCategory().getId();
	}	
}
