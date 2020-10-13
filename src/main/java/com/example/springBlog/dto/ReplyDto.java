package com.example.springBlog.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReplyDto {
	private int id;
	private int userId;
	private int postId;
	private String username;
	private String content;
	private Timestamp createDate;
}
