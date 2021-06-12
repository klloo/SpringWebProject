package com.huiy.mapper;

import java.util.List;

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
public class BoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {	
		mapper.getList().forEach(board -> log.info(board));
	}
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("새로운 제목");
		board.setContent("새로운 내용");
		board.setWriter("newuser");
		board.setUserid("user3");
		mapper.insert(board);
	}
	
	@Test
	public void testSelectKeyInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("새로운 제목1");
		board.setContent("새로운 내용1");
		board.setWriter("newuser1");
		board.setUserid("user3");
		mapper.insertSelectKey(board);
		log.info("insertSelectKey : "+board.getBno());
	}
	
	@Test
	public void testRead() {
		log.info("read : " + mapper.read(46L));
	}
	
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setTitle("바뀐 제목1");
		board.setContent("바뀐 내용1");
		board.setBno(46L);
		mapper.update(board);
		log.info("update : " + mapper.read(46L));
	}
	
	@Test
	public void testDelete() {
		log.info("delete : " + mapper.delete(50L));
	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(3);
		cri.setAmount(10);
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		log.info("paging : ");
		list.forEach(board->log.info(board.getBno()));
	}
}
