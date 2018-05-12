package com.boxfoodology.validator;

import java.sql.SQLException;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.boxfoodology.db.entity.Careers;
import com.boxfoodology.util.ValidatorUtil;

@Component
public class CareersValidator implements Validator {
	

	@Override
	public boolean supports(Class<?> clazz) {
		return Careers.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Careers careers = (Careers) target;

		// validate firstName
		if (StringUtils.isBlank(careers.getFirstName())) {
			errors.rejectValue("firstName", "error.notempty");
		} else if (careers.getFirstName().length() > 45) {
			errors.rejectValue("firstName", "error.maxlength", new Integer[]{45}, ValidatorUtil.DEFAULT_MESSAGE);
		}
		// validate lastName
		if (StringUtils.isBlank(careers.getLastName())) {
			errors.rejectValue("lastName", "error.notempty");
		} else if (careers.getLastName().length() > 45) {
			errors.rejectValue("lastName", "error.maxlength", new Integer[]{45}, ValidatorUtil.DEFAULT_MESSAGE);
		}
		// validate email
		if (StringUtils.isBlank(careers.getEmail())) {
			errors.rejectValue("email", "error.notempty");
		} else if (careers.getEmail().length() > 45) {
			errors.rejectValue("email", "error.maxlength", new Integer[]{45}, ValidatorUtil.DEFAULT_MESSAGE);
		}
		//validate phone
		if (StringUtils.isBlank(careers.getPhone())) {
			errors.rejectValue("phone", "error.notempty");
		} else if (careers.getPhone().length() > 45) {
			errors.rejectValue("phone", "error.maxlength", new Integer[]{45}, ValidatorUtil.DEFAULT_MESSAGE);
		}
		//validate position
		if (StringUtils.isBlank(careers.getPosition())) {
			errors.rejectValue("position", "error.notempty");
		} else if (careers.getPosition().length() > 45) {
			errors.rejectValue("position", "error.maxlength", new Integer[]{45}, ValidatorUtil.DEFAULT_MESSAGE);
		}
		// validate cv
		try {
			if (careers.getCv() == null || careers.getCv().length() == 0) {
				errors.rejectValue("cvFile", "error.notempty");
			} else if (careers.getCv().length() > 16777215) {
				errors.rejectValue("cvFile", "error.food.image.too.big");
			}
		} catch (SQLException e) {
			errors.rejectValue("cvFile", "error.notempty");
			e.printStackTrace();
		}
	}

}
