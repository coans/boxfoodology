package com.boxfoodology.validator;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.boxfoodology.db.entity.Message;
import com.boxfoodology.util.ValidatorUtil;

@Component
public class MessageValidator implements Validator {
	

	@Override
	public boolean supports(Class<?> clazz) {
		return Message.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Message message = (Message) target;

		// validate name
		if (StringUtils.isBlank(message.getTitle())) {
			errors.rejectValue("title", "error.notempty");
		} else if (message.getTitle().length() > 50) {
			errors.rejectValue("title", "error.maxlength", new Integer[]{50}, ValidatorUtil.DEFAULT_MESSAGE);
		}
		// validate description
		if (StringUtils.isBlank(message.getContent())) {
			errors.rejectValue("content", "error.notempty");
		} else if (message.getContent().length() > 800) {
			errors.rejectValue("content", "error.maxlength", new Integer[]{800}, ValidatorUtil.DEFAULT_MESSAGE);
		}
	}

}
