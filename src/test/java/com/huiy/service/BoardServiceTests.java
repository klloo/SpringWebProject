package com.huiy.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.huiy.domain.BoardVO;
import com.huiy.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@Test
	public void testGetAllList() {
		service.getAllList().forEach(board -> log.info(board));
	}
	@Test
	public void testGetList() {
		Criteria cri = new Criteria(2,10);
		service.getList(cri).forEach(board -> log.info(board.getBno()));
	}
	@Test
	public void testRegister() {
		BoardVO board = new BoardVO();
		board.setTitle("새로운 제목");
		board.setContent("새로운 내용");
		board.setWriter("newuser");
		board.setUserid("user3");
		service.register(board);
		log.info("register : " + board.getBno());
	}
	@Test
	public void testGet() {
		log.info("get : " + service.get(3L));
	}
	@Test
	public void testModify() {
		BoardVO board = new BoardVO();
		board.setTitle("바뀐 제목1");
		board.setContent("바뀐 내용1");
		board.setWriter("changeduser1");
		board.setBno(3L);
		service.modify(board);
		log.info("modify : "+service.get(3L));
		
	}
	@Test
	public void testRemove() {
		log.info("delete : "+service.remove(11L));
	}
}
