package com.example.springBlog.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.springBlog.dto.ReplyDto;
import com.example.springBlog.model.Comment;

@Repository
public interface CommentRepository {
	public List<Comment> findAll();
	public List<ReplyDto> findById(int id);
}
