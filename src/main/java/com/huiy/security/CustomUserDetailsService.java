package com.huiy.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.huiy.domain.MemberVO;
import com.huiy.mapper.MemberMapper;
import com.huiy.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		//userName -> 사용자 ID
		MemberVO vo = memberMapper.read(userName);
		return vo==null?null:new CustomUser(vo);
	}
	
	public void reload(String userid) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		CustomUser user = (CustomUser) this.loadUserByUsername(userid);
	    UsernamePasswordAuthenticationToken newAuth =  new UsernamePasswordAuthenticationToken(user, auth.getCredentials(), auth.getAuthorities());
	    newAuth.setDetails(auth.getDetails());
		SecurityContextHolder.getContext().setAuthentication(newAuth);
	}
	
}
