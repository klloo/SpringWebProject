package com.huiy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.huiy.domain.MemberVO;
import com.huiy.service.MemberService;

import lombok.Setter;

@RestController
@RequestMapping("/api")
public class MemberApiController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	
	@PostMapping("/member")
	public String register(@RequestBody MemberVO member) {
		member.setUserpw(pwencoder.encode(member.getUserpw()));
		memberService.register(member);
		return member.getUserid();
	}
	
	@GetMapping("/member/id/check/{userid}")
	public String idCheck(@PathVariable String userid) {
		boolean check = memberService.idCheck(userid);
		return check+"";
	}
	

}
