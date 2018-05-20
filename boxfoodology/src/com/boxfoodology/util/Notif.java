package com.boxfoodology.util;

import java.util.Collection;
import java.util.LinkedList;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringEscapeUtils;

public class Notif {

	private static final String FLASH_SUCCESS = "flash-success";
	private static final String FLASH_ERROR = "flash-error";
	private static final String FLASH_INFO = "flash-info";
	
	HttpSession session;
	
	Collection<String> successMessages;
	Collection<String> errorMessages;
	Collection<String> infoMessages;

	@SuppressWarnings("unchecked")
	public Notif(HttpSession session) {
		this.session = session;

		if (session.getAttribute(FLASH_SUCCESS) == null) {
			session.setAttribute(FLASH_SUCCESS, new LinkedList<String>());
		}
			
		if (session.getAttribute(FLASH_ERROR) == null) {
			session.setAttribute(FLASH_ERROR, new LinkedList<String>());
		}
		
		if (session.getAttribute(FLASH_INFO) == null) {
			session.setAttribute(FLASH_INFO, new LinkedList<String>());
		}

		successMessages = (Collection<String>) session.getAttribute(FLASH_SUCCESS);
		errorMessages = (Collection<String>) session.getAttribute(FLASH_ERROR);
		infoMessages = (Collection<String>) session.getAttribute(FLASH_INFO);
	}

	public void success(String message) {
		successMessages.add(StringEscapeUtils.escapeJavaScript(message));
	}

	public void error(String message) {
		errorMessages.add(StringEscapeUtils.escapeJavaScript(message));
	}
	
	public void info(String message) {
		infoMessages.add(StringEscapeUtils.escapeJavaScript(message));
	}

	public Collection<String> getSuccessMessages() {
		Collection<String> copy = new LinkedList<String>(successMessages);
		successMessages.clear();
		return copy;
	}

	public Collection<String> getErrorMessages() {
		Collection<String> copy = new LinkedList<String>(errorMessages);
		errorMessages.clear();
		return copy;
	}
	
	public Collection<String> getInfoMessages() {
		Collection<String> copy = new LinkedList<String>(infoMessages);
		infoMessages.clear();
		return copy;
	}
	
}