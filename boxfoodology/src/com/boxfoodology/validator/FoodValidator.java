package com.boxfoodology.validator;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.SQLException;

import javax.imageio.ImageIO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.boxfoodology.db.entity.Food;
import com.boxfoodology.db.repository.FoodRepository;
import com.boxfoodology.util.ValidatorUtil;

@Component
public class FoodValidator implements Validator {
	
	@Autowired
	private FoodRepository foodRepository;

	@Override
	public boolean supports(Class<?> clazz) {
		return Food.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Food food = (Food) target;

		// validate name
		if (StringUtils.isBlank(food.getName())) {
			errors.rejectValue("name", "error.notempty");
		} else if (food.getName().length() > 45) {
			errors.rejectValue("name", "error.length", new Integer[]{1, 45}, ValidatorUtil.DEFAULT_MESSAGE);
		}
		// validate description
		if (StringUtils.isBlank(food.getDescription())) {
			errors.rejectValue("description", "error.notempty");
		} else if (food.getDescription().length() > 500) {
			errors.rejectValue("description", "error.maxlength", new Integer[]{500}, ValidatorUtil.DEFAULT_MESSAGE);
		}
		// validate category
		if (food.getCategory() == null || food.getCategory().getId() == 0) {
			errors.rejectValue("category", "error.notempty");
		}
		//validate price
		if (food.getPrice() == null) {
			errors.rejectValue("price", "error.notempty");
		}
		// validate image
		try {
			if (food.getImage() == null || food.getImage().length() == 0) {
				errors.rejectValue("imageFile", "error.notempty");
			} else if (food.getImage().length() > 16777215) {
				errors.rejectValue("imageFile", "error.food.image.too.big");
			} else {
				BufferedImage image = ImageIO.read(food.getImage().getBinaryStream());
				if (image.getHeight() > 395 || image.getWidth() > 455) {
					errors.rejectValue("imageFile", "error.food.image.dimension");
				}
			}
		} catch (SQLException e) {
			errors.rejectValue("imageFile", "error.notempty");
			e.printStackTrace();
		} catch (IOException e) {
			errors.rejectValue("imageFile", "error.notempty");
			e.printStackTrace();
		}
	}

}
