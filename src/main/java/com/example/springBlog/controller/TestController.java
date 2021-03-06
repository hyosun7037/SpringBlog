package com.example.springBlog.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.springBlog.dto.BoardDto;
import com.example.springBlog.dto.DetailDto;
import com.example.springBlog.dto.ReplyDto;
import com.example.springBlog.model.Post;
import com.example.springBlog.model.User;
import com.example.springBlog.repository.CommentRepository;
import com.example.springBlog.repository.PostRepository;
import com.example.springBlog.repository.UserRepository;
import com.example.springBlog.util.Script;

@Controller
public class TestController {
	
	// key:value 는 인자로 객체를 바로 넣어도 알아서 들어감
	// requestBody는 JSON일 떄
	@Autowired
	public UserRepository userRepository;
	
	@Autowired
	public PostRepository postRepository;
	
	@Autowired
	public CommentRepository commentRepository;
	
	@GetMapping({"","/"})
	public String home(Model model) {
		List<Post> postList = postRepository.findAll(); 
		model.addAttribute("postList", postList);
		return "index";
	}
	
	// 회원가입 폼
	@GetMapping("/join")
	public String join() {
		return "joinForm";
	}
	
	// 회원가입 확인
	@PostMapping("/joinProc")
	public @ResponseBody String joinProc(User user) {
		
		User principal = userRepository.findByUsername(user.getUsername());
		
		if(principal != null) {
			return Script.back("아이디가 중복되었습니다.");
		}
		userRepository.save(user);
		
		principal = userRepository.findByUsername(user.getUsername());
		
		if(principal != null) {
			return Script.href("회원가입 성공", "/login");
		}else {
			return Script.back("회원가입 실패");
		}
	}
	
	// 로그인 확인
	// form 사용시 자동으로 객체안에 이름에 맞춰서 들어가짐, request를 사용하면 안된다.
	@PostMapping("/loginProc")
	public @ResponseBody String loginProc(User user, HttpSession session) {
		
		User principal = userRepository.findByUsernameAndPassword(user);
		
		if(principal == null) {
			return Script.back("아이디와 비밀번호가 틀렸습니다.");
		}else{
			session.setAttribute("principal", principal);
			return Script.href("로그인에 성공하였습니다.", "/");
		}
	}
	
	
	// 로그인
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	// 로그아웃
	@GetMapping("logout")
	public @ResponseBody String logout(HttpSession session) {
		session.setAttribute("principal", null);
		return Script.href("로그아웃 되었습니다.","/");
	}
	
	// 게시글 보기
	@GetMapping("/board/detail/{id}") // id 값이 저장되서 들어감, PathVariable 사용시 responsebody 사용 X
	public String boardDetil(@PathVariable int id, Model model) {
		BoardDto boardDto = postRepository.findById(id);
		List<ReplyDto> replyDtos = commentRepository.findById(id);
		DetailDto detailDto = DetailDto.builder().boardDto(boardDto).replyDtos(replyDtos).build();
		System.out.println(boardDto);
		model.addAttribute("detailDto", detailDto);
		return "board/detail";
	}
	
	// 글쓰기 
	@GetMapping("/board/write")
	public String boardWrite() {
		return "board/write";
	}
	
	@PostMapping("/board/writeProc")
	public String writeProc(Post post, HttpSession session) {
		
		User principal = (User)session.getAttribute("principal");
		
		Post requestPost = post.builder()
				.title(post.getTitle())
				.content(post.getContent())
				.userId(principal.getId())
				.build();
		postRepository.save(requestPost);
		return "redirect:/";
	}
	
	// 글 삭제
	@DeleteMapping("/post/{id}")
	public @ResponseBody String deleteOne (@PathVariable int id) {
		int result = postRepository.deleteOne(id);
		if(result == 1) {
			return "1";
		}else {
			return "0";
		}
	}
	
	// 글 수정
	@PostMapping("/post") // ajax 방식으로 받을 때는 putMapping
	public String updateOne(Post post) { // form으로 받을 때는 key:value으로 받으니까 @ResquestBody를 안넣으면 된다.
		int result = postRepository.updateOne(post);
		return "redirect:/board/detail/" + post.getId();
	}
	
	// update 페이지 이동
	@GetMapping("/board/update/{id}")
	public String update(@PathVariable int id, Model model) {
		BoardDto boardDto = postRepository.findById(id); 
		model.addAttribute("boardDto", boardDto);
		return "board/update";
	}
	
}
