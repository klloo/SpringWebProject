package com.huiy.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.google.gson.Gson;
import com.huiy.domain.BoardVO;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;


import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class BoardApiControllerTests {
	
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testRead() throws Exception{
		this.mockMvc.perform(get("/api/board/2"))
		.andDo(print());
	}
	
	@Test
	public void testRemove() throws Exception{
		this.mockMvc.perform(delete("/api/board/7"))
		.andDo(print());
	}
	
	@Test
	public void testRegister() throws Exception{
		BoardVO board = new BoardVO();
		board.setTitle("apitest");
		board.setContent("apitest content");
		board.setWriter("writer");
		Gson gson = new Gson();
		this.mockMvc.perform(post("/api/board/")
				.content(gson.toJson(board))
				.contentType(MediaType.APPLICATION_JSON))
		.andDo(print());
	}

	@Test
	public void testModify() throws Exception{
		BoardVO board = new BoardVO();
		board.setTitle("바뀐 제목api");
		board.setContent("바뀐 내용api");
		board.setWriter("test");
		board.setBno(16L);
		Gson gson = new Gson();
		this.mockMvc.perform(put("/api/board/")
				.content(gson.toJson(board))
				.contentType(MediaType.APPLICATION_JSON))
		.andDo(print());
	}
}
