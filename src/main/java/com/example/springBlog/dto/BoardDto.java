package com.example.springBlog.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDto {
	private int id;
	private String title;
	private String username;
	private String content;
	private int userId;
	private Timestamp createDate;
	
}
