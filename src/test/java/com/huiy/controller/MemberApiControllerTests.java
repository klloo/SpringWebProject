package com.huiy.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.google.gson.Gson;
import com.huiy.domain.BoardVO;
import com.huiy.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class MemberApiControllerTests {
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testRegister() throws Exception{
		MemberVO member = new MemberVO();
		member.setUserid("test12");
		member.setUserpw("test12");
		member.setUserName("testname");
		Gson gson = new Gson();
		this.mockMvc.perform(post("/api/member/")
				.content(gson.toJson(member))
				.contentType(MediaType.APPLICATION_JSON))
		.andDo(print());
	}
	
	@Test
	public void testIdCheck() throws Exception{
		//중복되는 경우
		this.mockMvc.perform(get("/api/member/id/check/user5"))
		.andDo(print());
		//중복되지 않는 경우
		this.mockMvc.perform(get("/api/member/id/check/aaab"))
		.andDo(print());
	}
}
