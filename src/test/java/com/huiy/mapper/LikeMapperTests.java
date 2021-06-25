package com.huiy.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.huiy.domain.BoardVO;
import com.huiy.domain.LikeVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class LikeMapperTests {

	@Autowired
	LikeMapper mapper;
	
	@Test
	public void testInsert() {
		LikeVO like = new LikeVO();
		like.setBno(501L);
		like.setUserid("as");
		mapper.insert(like);
		log.info("Key : "+like.getLno());
	}
	
	@Test
	public void testDelete() {
		mapper.delete(1L);
	}
}
