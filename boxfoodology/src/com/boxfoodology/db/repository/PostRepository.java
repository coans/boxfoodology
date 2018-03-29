package com.boxfoodology.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.boxfoodology.db.entity.Post;

public interface PostRepository extends JpaRepository<Post, Integer> {
	
}
