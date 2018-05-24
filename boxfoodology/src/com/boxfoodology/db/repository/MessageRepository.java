package com.boxfoodology.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.boxfoodology.db.entity.Message;

public interface MessageRepository extends JpaRepository<Message, Integer> {

}
