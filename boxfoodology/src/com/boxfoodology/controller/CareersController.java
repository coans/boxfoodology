package com.boxfoodology.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.hibernate.engine.jdbc.BlobProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boxfoodology.config.BaseController;
import com.boxfoodology.db.entity.Careers;
import com.boxfoodology.db.repository.CareersRepository;
import com.boxfoodology.validator.CareersValidator;

@Controller
@RequestMapping(CareersController.CONTROLLER)
public class CareersController extends BaseController {
	
	final static Logger logger = Logger.getLogger(CareersController.class);
	
	public static final String CONTROLLER = "careers";
	public static final String VIEW_DEFAULT = "careers";
	public static final String VIEW_NEW = "careers-new";
	
	@Autowired
	private CareersRepository careersRepository;
	@Autowired
	private CareersValidator validator;
	
	@RequestMapping(method = RequestMethod.GET)
	public String defaultView(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) {
		model.addAttribute("careers", careersRepository.findAll());
		
		return VIEW_DEFAULT;
	}

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String add(ModelMap model, HttpServletRequest request, HttpSession session, Locale locale) {
		Careers careers = new Careers();
		model.addAttribute("careersmodel", careers);
		model.addAttribute("action", CONTROLLER + "/create");
		model.addAttribute("title", "Apply for job");
		
		return VIEW_NEW;
	}
	
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@ModelAttribute("careersmodel") Careers careers, Errors errors, ModelMap model) {
		
		try {
			careers.setCv(BlobProxy.generateProxy(careers.getCvFile().getBytes()));
			careers.setCreated(new Date());
			careers.setContentType(careers.getCvFile().getContentType());
			careers.setCvFileName(careers.getCvFile().getOriginalFilename());
		} catch (IOException e) {
			logger.error("Error uploading cv.");
			notif.error("Error while uploading CV");
			e.printStackTrace();
		}
		validator.validate(careers, errors);
		
		if (errors.hasErrors()) {
			model.addAttribute("careersmodel", careers);
			model.addAttribute("action", CONTROLLER + "/create");
			model.addAttribute("title", "Apply for job");
			return VIEW_NEW;
		}
		
		careersRepository.save(careers);
		notif.success("Your CV is uploaded successfully");

		return "redirect:/" + HomeController.CONTROLLER;
	}
	
	@RequestMapping(value = "/cv/{id}", method = RequestMethod.GET)
	public void getCV(@PathVariable(value = "id") Integer careerId, HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		Careers career = careersRepository.findOne(careerId);
		response.setContentType(career.getContentType());
		response.setHeader("Content-Disposition", "attachment; filename=\""+ career.getCvFileName() +"\"");
		IOUtils.copy(career.getCv().getBinaryStream(), response.getOutputStream());
		response.flushBuffer();
	}
}
