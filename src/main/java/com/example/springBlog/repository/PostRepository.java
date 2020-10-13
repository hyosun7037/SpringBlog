package com.example.springBlog.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.springBlog.dto.BoardDto;
import com.example.springBlog.model.Post;

@Repository
public interface PostRepository {
	public List<Post> findAll();
	public BoardDto findById(int id);
}
