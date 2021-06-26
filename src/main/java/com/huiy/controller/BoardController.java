package com.huiy.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.huiy.domain.BoardVO;
import com.huiy.domain.Criteria;
import com.huiy.domain.LikeVO;
import com.huiy.domain.PageDTO;
import com.huiy.domain.ReplyVO;
import com.huiy.service.BoardService;
import com.huiy.service.ReplyService;

import lombok.Setter;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReplyService replyService;
	
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		List<BoardVO> boardList = boardService.getList(cri);
		int total = boardService.getAllList().size();
		model.addAttribute("boardList",boardList);
		model.addAttribute("pageMaker",new PageDTO(cri, total));
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy.MM.dd");
		String today = format.format(new Date());
		model.addAttribute("today", today);
		return "board/list";
	}
	
	@GetMapping("/read")
	public String read(@RequestParam("bno") Long bno, Model model,Authentication authentication) {
		BoardVO board = boardService.get(bno);
		String heart = "false";
		if(authentication!=null) {
			String userid = authentication.getName();
			heart = boardService.getHeart(userid, bno)+"";
		}
		List<ReplyVO> replyList = replyService.getListWithBoard(bno);
		model.addAttribute("board",board);
		model.addAttribute("heart",heart);
		model.addAttribute("replyList", replyList);
		return "board/read";
	}
	@PreAuthorize("hasAnyRole('ROLE_USER,ROLE_ADMIN')")
	@GetMapping("/register")
	public String register() {
		return "board/save";
	}
	@PreAuthorize("hasAnyRole('ROLE_USER,ROLE_ADMIN')")
	@GetMapping("/update")
	public String modify(@RequestParam("bno") Long bno, Model model,Authentication authentication) {
		BoardVO board = boardService.get(bno);
		String userid = authentication.getName();
		if(!board.getUserid().equals(userid))
			return "member/accessdenied";
		model.addAttribute("board",board);
		return "board/update";
	}
}
