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
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.boxfoodology.auth.AuthorizationService;
import com.boxfoodology.db.entity.Myorder;
import com.boxfoodology.db.entity.User;

@Controller("/" + BaseController.CONTROLLER)
public class BaseController {

	public static final String CONTROLLER = "base";
	public static final String MODEL_USER = "user";
	public static final String MODEL_NUMBER_OF_ORDERED_ITEMS = "numberOfOrderedItems";
	public static final String MODEL_PRICE_OF_ORDERED_ITEMS = "priceOfOrderedItems";

	private static final String BASEURL = "baseurl";
	private static final String VERISON = "verison";
	private static final String SHOPPING_CART = "shopping_cart_";
	
	@Value("${base.url}")
	protected String baseUrl;
	
	@Value("${product.version}")
	protected String productVersion;
	
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

	@ModelAttribute(VERISON)
	public String getProductVersion() {
		return productVersion;
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
				price = price.add(myorder.getFood().getPrice());
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
}