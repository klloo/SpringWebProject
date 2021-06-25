package com.huiy.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.huiy.domain.BoardVO;
import com.huiy.domain.LikeVO;
import com.huiy.service.BoardService;

import lombok.Setter;

@RestController
@RequestMapping("/api/board")
public class BoardApiController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/{bno}")
	public BoardVO read(@PathVariable Long bno) {
		return boardService.get(bno);
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping
	public Long register(@RequestBody BoardVO board) {
		boardService.register(board);
		return board.getBno();
	}
	
	@PreAuthorize("isAuthenticated()")
	@PutMapping
	public void modify(@RequestBody BoardVO board) {
		boardService.modify(board);
	}
	
	@PreAuthorize("isAuthenticated()")
	@DeleteMapping("/{bno}")
	public void remove(@PathVariable Long bno) {
		boardService.remove(bno);
	}
	
	@PostMapping(value="/image", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = request.getSession().getServletContext().getRealPath("/")+"/resources/summernote_images/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/summernote_images/"+ savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a; 
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/heart/{bno}")
	public String like(@PathVariable Long bno,Authentication authentication) {
		LikeVO like = new LikeVO();
		String userid = authentication.getName();
		like.setBno(bno);
		like.setUserid(userid);
		boardService.like(like);
		String likes = boardService.get(bno).getLikecnt()+"";
		return likes;
	}
	
	@PreAuthorize("isAuthenticated()")
	@DeleteMapping("/heart/{bno}")
	public String likeCancel(@PathVariable Long bno,Authentication authentication) {
		String userid = authentication.getName();
		boardService.likeCancel(userid, bno);
		String likes = boardService.get(bno).getLikecnt()+"";
		return likes;
	}

}
