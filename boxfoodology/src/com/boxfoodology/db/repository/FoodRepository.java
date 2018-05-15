package com.boxfoodology.db.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.boxfoodology.db.entity.Food;

public interface FoodRepository extends JpaRepository<Food, Integer> {
	
	@Query("SELECT f FROM Food f WHERE f.category.id = ? AND f.deleted != true")
	public List<Food> findFoodByCategory(Integer categoryId);
	
	@Query("SELECT f FROM Food f WHERE f.category.name like ? or f.name like ?")
	public List<Food> findFoodBySearchCriteria(String search, String search1);
	
	@Transactional
	@Modifying
	@Query("UPDATE Food f SET f.deleted = 1 WHERE f.category.id = ?")
	public int deleteFoodByCategory(Integer categoryId);
}
