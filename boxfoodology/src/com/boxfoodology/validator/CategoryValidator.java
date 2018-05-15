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

import com.boxfoodology.db.entity.Category;
import com.boxfoodology.db.repository.CategoryRepository;
import com.boxfoodology.util.ValidatorUtil;

@Component
public class CategoryValidator implements Validator {
	
	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public boolean supports(Class<?> clazz) {
		return Category.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Category category = (Category) target;

		// validate name
		if (StringUtils.isBlank(category.getName())) {
			errors.rejectValue("name", "error.notempty");
		} else if (category.getName().length() > 50) {
			errors.rejectValue("name", "error.length", new Integer[]{1, 50}, ValidatorUtil.DEFAULT_MESSAGE);
		}
		// validate menu
		if (StringUtils.isBlank(category.getMenu())) {
			errors.rejectValue("menu", "error.notempty");
		} else if (category.getMenu().length() > 45) {
			errors.rejectValue("menu", "error.maxlength", new Integer[]{45}, ValidatorUtil.DEFAULT_MESSAGE);
		}
		//validate show on home page
		if (category.isShowOnHome()) {
			try {
				if (category.getImage() == null || category.getImage().length() == 0) {
					errors.rejectValue("showOnHome", "error.show.on.home.page");
				}
			} catch (SQLException e) {
				errors.rejectValue("showOnHome", "error.show.on.home.page");
				e.printStackTrace();
			}
		}
		
		// validate image
		try {
			if (category.getImage() != null && category.getImage().length() != 0) {
				if (category.getImage().length() > 4294967295L) {
					errors.rejectValue("imageFile", "error.food.image.too.big");
				} else {
					BufferedImage image = ImageIO.read(category.getImage().getBinaryStream());
					if (image.getHeight() > 395 || image.getWidth() > 455) {
						errors.rejectValue("imageFile", "error.food.image.dimension");
					}
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
