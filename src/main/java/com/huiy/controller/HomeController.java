package com.huiy.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.Data;
import lombok.Setter;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	//위에서 DataSource를 빈으로 등록했기 때문에 의존성 주입 가능
	@Setter(onMethod_ = {@Autowired})
	private DataSource dataSource;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		try(Connection con = dataSource.getConnection()){
			System.out.println("성공");
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "home";
	}
	
}
