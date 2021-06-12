package com.huiy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huiy.domain.MemberVO;
import com.huiy.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public void register(MemberVO memberVO) {
		memberMapper.insert(memberVO);
		memberMapper.insertAuth(memberVO);
	}

	@Override
	public boolean idCheck(String userid) {
		return memberMapper.read(userid) == null;
	}

	@Override
	public MemberVO read(String userid) {
		return memberMapper.read(userid);
	}


}
