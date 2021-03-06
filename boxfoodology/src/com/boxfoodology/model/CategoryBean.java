package com.boxfoodology.model;

import org.springframework.web.multipart.MultipartFile;

import com.boxfoodology.db.entity.Category;

public class CategoryBean extends Category {

	private static final long serialVersionUID = 1L;
	
	private MultipartFile imageFile;

	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}	
}
