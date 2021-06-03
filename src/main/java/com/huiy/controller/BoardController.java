package com.huiy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.huiy.domain.BoardVO;
import com.huiy.service.BoardService;

import lombok.Setter;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService boardService;
	
	@GetMapping("/list")
	public String list(Model model) {
		List<BoardVO> boardList = boardService.getList();
		model.addAttribute("list",boardList);
		return "board-list";
	}
	
	@GetMapping("/read")
	public String read(@RequestParam("bno") Long bno, Model model) {
		BoardVO board = boardService.get(bno);
		model.addAttribute("board",board);
		return "board-read";
	}
	
	@GetMapping("/register")
	public String register() {
		return "board-save";
	}
	
	@GetMapping("/update")
	public String modify(@RequestParam("bno") Long bno, Model model) {
		BoardVO board = boardService.get(bno);
		model.addAttribute("board",board);
		return "board-update";
	}
}
