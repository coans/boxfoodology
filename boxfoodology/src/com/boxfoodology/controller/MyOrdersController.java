package com.boxfoodology.controller;

import java.util.ArrayList;
import java.util.List;
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
		model.addAttribute("orders", request.getSession().getAttribute(getShoppingCartName()));
		
		return VIEW_DEFAULT;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "add/{foodId}", method = RequestMethod.GET)
	public String add(@PathVariable(value = "foodId") Integer foodId, HttpServletRequest request, ModelMap model) {
		Food food = foodRepository.findOne(foodId);
		Myorder order = new Myorder();
		order.setFood(food);
		order.setUser(super.getUser());
		
		if (request.getSession().getAttribute(getShoppingCartName()) == null) {
			request.getSession().setAttribute(getShoppingCartName(), new ArrayList<Myorder>());
		}
		List<Myorder> orders =  (List<Myorder>)request.getSession().getAttribute(getShoppingCartName());
		orders.add(order);
		request.getSession().setAttribute(getShoppingCartName(), orders);

		return "redirect:/" + UserPath.MY + MyOrdersController.CONTROLLER;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "delete/{foodId}", method = RequestMethod.GET)
	public String delete(@PathVariable(value = "foodId") Integer foodId, HttpServletRequest request, ModelMap model) {
		if (request.getSession().getAttribute(getShoppingCartName()) != null) {
			List<Myorder> orders =  (List<Myorder>)request.getSession().getAttribute(getShoppingCartName());
			for (int i = 0;i < orders.size();i++) {
				if (orders.get(i).getFood().getId() == foodId) {
					orders.remove(i);
					break;
				}
			}
			request.getSession().setAttribute(getShoppingCartName(), orders);
		}
		return "redirect:/" + UserPath.MY + MyOrdersController.CONTROLLER;
	}
	
	@RequestMapping(value = "clear", method = RequestMethod.GET)
	public String clear(HttpServletRequest request, ModelMap model) {
		request.getSession().setAttribute(getShoppingCartName(), new ArrayList<Myorder>());
		
		return "redirect:/" + UserPath.MY + MyOrdersController.CONTROLLER;
	}
}
