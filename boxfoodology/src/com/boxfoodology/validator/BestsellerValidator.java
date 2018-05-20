package com.boxfoodology.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.boxfoodology.db.entity.Bestseller;

@Component
public class BestsellerValidator implements Validator {
	

	@Override
	public boolean supports(Class<?> clazz) {
		return Bestseller.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Bestseller bestseller = (Bestseller) target;

		// validate food
		if (bestseller.getFood() == null) {
			errors.rejectValue("food.id", "error.notempty");
		}
	}

}
