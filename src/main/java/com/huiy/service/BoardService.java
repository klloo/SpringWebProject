package com.huiy.service;

import java.util.List;

import com.huiy.domain.BoardVO;

public interface BoardService {
	
	public List<BoardVO> getList();
	
	public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);

}
