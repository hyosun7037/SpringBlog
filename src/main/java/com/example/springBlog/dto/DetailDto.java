package com.example.springBlog.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DetailDto {
	private BoardDto boardDto;
	private List<ReplyDto> replyDtos;
}
