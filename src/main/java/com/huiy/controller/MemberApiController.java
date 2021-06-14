package com.huiy.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.huiy.domain.BoardVO;
import com.huiy.domain.MemberVO;
import com.huiy.security.CustomUserDetailsService;
import com.huiy.service.MemberService;

import lombok.Setter;

@RestController
@RequestMapping("/api")
public class MemberApiController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CustomUserDetailsService userService;
	
	
	
	
	@PostMapping("/member")
	public String register(@RequestBody MemberVO member) {
		memberService.register(member);
		return member.getUserid();
	}
	
	@GetMapping("/member/id/check/{userid}")
	public String idCheck(@PathVariable String userid) {
		boolean check = memberService.idCheck(userid);
		return check+"";
	}
	
	@PreAuthorize("isAuthenticated()")
	@PutMapping("/member")
	public void modify(@RequestBody MemberVO member) {
		memberService.modify(member);
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/member/pw/check")
	public String pwCheck(@RequestBody MemberVO member) {
		boolean check = memberService.pwCheck(member);
		return check+"";
	}
	
	

}
