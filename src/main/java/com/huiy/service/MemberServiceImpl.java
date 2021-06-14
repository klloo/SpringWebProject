package com.huiy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.huiy.domain.MemberVO;
import com.huiy.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public void register(MemberVO memberVO) {
		memberVO.setUserpw(pwencoder.encode(memberVO.getUserpw()));
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

	@Override
	public boolean pwCheck(MemberVO ChkMemberVO) {
		MemberVO memberVO = memberMapper.read(ChkMemberVO.getUserid());
		return pwencoder.matches(ChkMemberVO.getUserpw(),memberVO.getUserpw());
	}

	@Override
	public void modify(MemberVO memberVO) {
		memberVO.setUserpw(pwencoder.encode(memberVO.getUserpw()));
		memberMapper.update(memberVO);
	}


}
