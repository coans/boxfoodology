package com.boxfoodology.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.boxfoodology.db.entity.Bestseller;


public interface BestsellerRepository extends JpaRepository<Bestseller, Integer> {
}
