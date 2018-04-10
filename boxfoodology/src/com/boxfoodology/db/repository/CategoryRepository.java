package com.boxfoodology.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.boxfoodology.db.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
	
}
