package com.example.springBlog.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.springBlog.model.User;

@Repository
public interface UserRepository {
	public List<User> findAll();
	
	public User findByUsername(String username);
	
	public User findByUsernameAndPassword(User user);
	
	public void save(User user);
}
