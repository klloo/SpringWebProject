package com.huiy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.huiy.domain.BoardVO;
import com.huiy.service.BoardService;

import lombok.Setter;

@RestController
@RequestMapping("/api")
public class BoardApiController {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService boardService;
	
	@GetMapping("/board/{bno}")
	public BoardVO read(@PathVariable Long bno) {
		return boardService.get(bno);
	}
	
	@PostMapping("/board")
	public Long register(@RequestBody BoardVO board) {
		boardService.register(board);
		return board.getBno();
	}
	
	@PutMapping("/board")
	public void modify(@RequestBody BoardVO board) {
		boardService.modify(board);
	}
	
	@DeleteMapping("/board/{bno}")
	public void remove(@PathVariable Long bno) {
		boardService.remove(bno);
	}

}
