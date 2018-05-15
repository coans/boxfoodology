package com.boxfoodology.db.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.boxfoodology.db.entity.Bestseller;


public interface BestsellerRepository extends JpaRepository<Bestseller, Integer> {
	
	@Transactional
	@Modifying
	@Query("SELECT b FROM Bestseller b WHERE b.food.category.id = ?")
	public List<Bestseller> deleteBestsellerByCategory(Integer categoryId);
	
	@Transactional
	@Modifying
	@Query("UPDATE Bestseller b SET b.deleted = 1 WHERE b.food.id = ?")
	public int deleteBestsellerByFood(Integer foodId);
	
}
