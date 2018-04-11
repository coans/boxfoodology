package com.boxfoodology.db.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.boxfoodology.db.entity.Myorder;

public interface MyorderRepository extends JpaRepository<Myorder, Long> {
	
	@Query("SELECT o FROM Myorder o WHERE o.user.id = ?")
	public List<Myorder> findOrdersByUser(Integer userId);
	
	@Query("SELECT o FROM Myorder o WHERE o.food.id = ?")
	public List<Myorder> findOrdersByFood(Integer foodId);
}
