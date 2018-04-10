package com.boxfoodology.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.boxfoodology.db.entity.Food;

public interface FoodRepository extends JpaRepository<Food, Integer> {
	
}
