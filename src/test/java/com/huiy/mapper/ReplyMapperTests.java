package com.huiy.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.huiy.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class ReplyMapperTests {

	@Autowired
	ReplyMapper mapper;
	@Test
	public void testGetListBno() {
		mapper.getListWithBoard(581L).forEach(reply->System.out.println(reply.getReply()));
	}
	@Test
	public void testInsert() {
		ReplyVO reply = new ReplyVO();
		reply.setBno(581L);
		reply.setReply("hello");
		reply.setReplyer("as");
		reply.setUserid("as");
		reply.setIsanonymous("false");
		mapper.insert(reply);
		log.info("Key : "+reply.getRno());
	}
	
	@Test
	public void testDelete() {
		mapper.delete(2L);
	}
}