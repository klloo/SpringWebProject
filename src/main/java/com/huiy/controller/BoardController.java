package com.huiy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.huiy.domain.BoardVO;
import com.huiy.domain.Criteria;
import com.huiy.domain.PageDTO;
import com.huiy.service.BoardService;

import lombok.Setter;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		List<BoardVO> boardList = boardService.getList(cri);
		int total = boardService.getAllList().size();
		model.addAttribute("boardList",boardList);
		model.addAttribute("pageMaker",new PageDTO(cri, total));
		return "board/list";
	}
	
	@GetMapping("/read")
	public String read(@RequestParam("bno") Long bno, Model model) {
		BoardVO board = boardService.get(bno);
		model.addAttribute("board",board);
		return "board/read";
	}
	@PreAuthorize("hasAnyRole('ROLE_USER,ROLE_ADMIN')")
	@GetMapping("/register")
	public String register() {
		return "board/save";
	}
	@PreAuthorize("hasAnyRole('ROLE_USER,ROLE_ADMIN')")
	@GetMapping("/update")
	public String modify(@RequestParam("bno") Long bno, Model model) {
		BoardVO board = boardService.get(bno);
		model.addAttribute("board",board);
		return "board/update";
	}
}
