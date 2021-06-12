package com.huiy.service;

import com.huiy.domain.MemberVO;

public interface MemberService {
	public MemberVO read(String userid);
	public void register(MemberVO memberVO); 
	public boolean idCheck(String userid);
}
