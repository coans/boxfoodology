/**
 * Every controller should be extended from this class
 *
 * @author Juraj Bilic
 * @version $Author: jbilic $ ($Revision: 1.2 $) - $Date: 2012-05-21 14:18:54 $
 * @since 1.0.0
 */

package com.boxfoodology.config;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.boxfoodology.auth.AuthorizationService;
import com.boxfoodology.db.entity.Category;
import com.boxfoodology.db.entity.Food;
import com.boxfoodology.db.entity.Myorder;
import com.boxfoodology.db.entity.User;
import com.boxfoodology.db.repository.CategoryRepository;
import com.boxfoodology.util.Notif;

@Controller("/" + BaseController.CONTROLLER)
public class BaseController {

	public static final String CONTROLLER = "base";
	public static final String MODEL_USER = "user";
	public static final String MODEL_NUMBER_OF_ORDERED_ITEMS = "numberOfOrderedItems";
	public static final String MODEL_PRICE_OF_ORDERED_ITEMS = "priceOfOrderedItems";
	public static final String MODEL_SEARCH = "search";
	public static final String MODEL_NOTIF = "flash";

	private static final String BASEURL = "baseurl";
	private static final String VERISON = "verison";
	private static final String SHOPPING_CART = "shopping_cart_";
	private static final String QUANTITY = "quantity";
	private static final String CAREERS_POSITIONS = "careers_positions";
	private static final String MAIN_MENU = "main_menu";
	private static final String MENU_MAINS = "menu_mains";
	private static final String MENU_RANGES = "menu_ranges";
	private static final String MENU_SPECIAL_DIETS = "menu_special_diets";
	private static final String MENU_SPECIAL_EVENTS = "menu_special_events";
	private static final String SPECIAL_EVENTS = "Special events";
	private static final String SPECIAL_DIETS = "Special diets";
	private static final String RANGES = "Ranges";
	private static final String MAINS = "Mains";
	
	
	protected Notif notif;
	
	@Value("${base.url}")
	protected String baseUrl;
	
	@Value("${product.version}")
	protected String productVersion;
	
	@Value("${mail.address}")
	protected String kitchenMail;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	@ModelAttribute(MODEL_USER)
	public User getUser() {
		return AuthorizationService.getAuthentificatedUser();
	}
	
	@ModelAttribute(BASEURL)
	public String getBaseUrl() {
		return baseUrl;
	}

	
	@ModelAttribute(MODEL_SEARCH)
	public Food getSearch() {
		return new Food();
	}
	
	@ModelAttribute(VERISON)
	public String getProductVersion() {
		return productVersion;
	}
	
	@ModelAttribute(QUANTITY)
	public List<Integer> getQuantity() {
		return Arrays.asList(1,2,3,4,5,6,7,8,9,10);
	}
	
	@ModelAttribute(CAREERS_POSITIONS)
	public List<String> getCareersPositions() {
		return Arrays.asList("Cook", "Chef", "Manager", "Other");
	}

	@ModelAttribute(MAIN_MENU)
	public List<String> getMainMenu() {
		return Arrays.asList(MAINS, RANGES, SPECIAL_DIETS, SPECIAL_EVENTS);
	}
	
	@ModelAttribute(MENU_MAINS)
	public List<Category> getMenuMains() {
		return categoryRepository.findCategoryByMenu(MAINS);
	}

	@ModelAttribute(MENU_RANGES)
	public List<Category> getMenuRanges() {
		return categoryRepository.findCategoryByMenu(RANGES);
	}
	
	@ModelAttribute(MENU_SPECIAL_DIETS)
	public List<Category> getMenuSpecialDiets() {
		return categoryRepository.findCategoryByMenu(SPECIAL_DIETS);
	}

	@ModelAttribute(MENU_SPECIAL_EVENTS)
	public List<Category> getMenuSpecialEvents() {
		return categoryRepository.findCategoryByMenu(SPECIAL_EVENTS);
	}
	
	@SuppressWarnings("unchecked")
	@ModelAttribute(MODEL_NUMBER_OF_ORDERED_ITEMS)
	public int getNumberOfOrderedItems(HttpServletRequest request) {
		if (request.getSession().getAttribute(getShoppingCartName()) != null) {
			return ((List<Myorder>)request.getSession().getAttribute(getShoppingCartName())).size();
		}
		return 0;
	}
	
	@SuppressWarnings("unchecked")
	@ModelAttribute(MODEL_PRICE_OF_ORDERED_ITEMS)
	public BigDecimal getPriceOfOrderedItems(HttpServletRequest request) {
		BigDecimal price = BigDecimal.ZERO;
		if (request.getSession().getAttribute(getShoppingCartName()) != null) {
			for (Myorder myorder : (List<Myorder>)request.getSession().getAttribute(getShoppingCartName())) {
				price = price.add(myorder.getFood().getPrice().multiply(new BigDecimal(myorder.getQuantity().toString())));
			}
		}
		return price;
	}
	
	public long getTimeZoneOffset(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		long timeOffset = 0l;
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("timezoneoffset")) {
					timeOffset = Long.valueOf(cookie.getValue());
					break;
				}
			}
		}
		return timeOffset;
	}
	
	public String getShoppingCartName() {
		if (getUser() != null) {
			return SHOPPING_CART + getUser().getId();
		}
		return "";
	}

	public String getKitchenMail() {
		return kitchenMail;
	}
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handleAllException(Exception ex) {

		ModelAndView model = new ModelAndView("error");
		return model;

	}
	
	@ModelAttribute(MODEL_NOTIF)
	public Notif flash(final HttpServletRequest request) {
		notif = new Notif(request.getSession());
		return notif;
	}
}