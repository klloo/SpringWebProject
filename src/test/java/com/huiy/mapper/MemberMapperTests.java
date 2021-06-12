package com.huiy.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.huiy.domain.BoardVO;
import com.huiy.domain.Criteria;
import com.huiy.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Test
	public void testRead() {	
		MemberVO vo = mapper.read("user5");
		log.info(vo);
		vo.getAuthList().forEach(authVO -> log.info(authVO));
	}
	
	@Test
	public void testInsert() {	
		MemberVO vo = new MemberVO();
		vo.setUserid("user123");
		vo.setUserpw("user123");
		vo.setUserName("123");
		mapper.insert(vo);
		mapper.insertAuth(vo);
	}
	
	
	
	
}
