package com.huiy.mapper;

import com.huiy.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String userid);
	public void insert(MemberVO memberVO); 
	public void insertAuth(MemberVO memberVO);
	public void update(MemberVO memberVO);
}
