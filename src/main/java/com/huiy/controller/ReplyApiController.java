package com.huiy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.huiy.domain.ReplyVO;
import com.huiy.service.ReplyService;

@RestController
@RequestMapping("/api/reply")
public class ReplyApiController {

	@Autowired
	private ReplyService replyService;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping
	public void register(@RequestBody ReplyVO reply, Authentication authentication) {
		String userid = authentication.getName();
		reply.setUserid(userid);
		replyService.register(reply);
	}
	
	@PreAuthorize("isAuthenticated()")
	@DeleteMapping("/{rno}")
	public void remove(@PathVariable Long rno) {
		replyService.remove(rno);
	}
	
}
