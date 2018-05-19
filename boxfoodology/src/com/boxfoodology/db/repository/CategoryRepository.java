package com.boxfoodology.db.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.boxfoodology.db.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
	
	@Query("SELECT c FROM Category c WHERE c.menu = ? AND c.deleted != true")
	public List<Category> findCategoryByMenu(final String menu);
	
	@Query("SELECT c FROM Category c WHERE c.showOnHome = true")
	public List<Category> findCategoryForHomePage();
}
