package com.boxfoodology.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.boxfoodology.config.BaseController;
import com.boxfoodology.db.entity.Food;
import com.boxfoodology.db.entity.Myorder;
import com.boxfoodology.db.repository.FoodRepository;
import com.boxfoodology.db.repository.MyorderRepository;
import com.boxfoodology.util.EmailUtil;
import com.boxfoodology.util.UserPath;

@Controller
@RequestMapping(UserPath.MY + MyOrdersController.CONTROLLER)
public class MyOrdersController extends BaseController {
	
	public static final String CONTROLLER = "orders";
	public static final String VIEW_DEFAULT = "orders";
	
	@Autowired
	private EmailUtil emailUtil;
	
	@Autowired
	private FoodRepository foodRepository;
	
	@Autowired
	private MyorderRepository orderRepository;
	
	@RequestMapping(method = RequestMethod.GET)
	public String defaultView(@RequestParam(required = false) boolean confirmed, @RequestParam(required = false) boolean empty, ModelMap model, 
			HttpServletRequest request, HttpSession session, Locale locale) {
		model.addAttribute("orders", request.getSession().getAttribute(getShoppingCartName()));
		model.addAttribute("confirmed", confirmed);
		model.addAttribute("emptyList", empty);
		
		return VIEW_DEFAULT;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "add/{foodId}", method = RequestMethod.GET)
	public String add(@PathVariable(value = "foodId") Integer foodId, HttpServletRequest request, ModelMap model) {
		
		if (request.getSession().getAttribute(getShoppingCartName()) == null) {
			request.getSession().setAttribute(getShoppingCartName(), new ArrayList<Myorder>());
		}
		List<Myorder> orders =  (List<Myorder>)request.getSession().getAttribute(getShoppingCartName());
		int index = 0;
		boolean exist = false;
		for (Myorder myorder : orders) {
			if (myorder.getFood().getId() == foodId) {
				exist = true;
				break;
			}
			index++;
		}
		if (exist) {
			orders.get(index).setQuantity(orders.get(index).getQuantity() + 1);
		} else {
			Food food = foodRepository.findOne(foodId);
			Myorder order = new Myorder();
			order.setFood(food);
			order.setUser(super.getUser());
			order.setQuantity(1);
		
			orders.add(order);
		}
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
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "confirm", method = RequestMethod.GET)
	public String confirm(HttpServletRequest request, ModelMap model) {
		List<Myorder> orders = new ArrayList<Myorder>();
		boolean confirmed = false;
		if (request.getSession().getAttribute(getShoppingCartName()) != null) {
			orders = (List<Myorder>)request.getSession().getAttribute(getShoppingCartName());
			if (orders != null && !orders.isEmpty()) {
				orderRepository.save(orders);
			
				Map<String, Object> myModel = new HashMap<String, Object>();
				myModel.put("orders", orders);
				myModel.put("priceOfOrderedItems", getPriceOfOrderedItems(request));
				SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
				myModel.put("user", getUser().getFirstName() + " " + getUser().getLastName() + " (" + dateFormat.format(new Date()) + ")");
				emailUtil.sendMail(getUser().getEmail()/* TODO set kitchen mail*/, "New order received", "order.vm", myModel);
				confirmed = true;
				request.getSession().setAttribute(getShoppingCartName(), new ArrayList<Myorder>());
			}
		}
		
		return "redirect:/" + UserPath.MY + MyOrdersController.CONTROLLER + "?confirmed=" + confirmed + "&empty=" + orders.isEmpty();
	}
}
