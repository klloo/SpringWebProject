package com.huiy.service;

import java.util.List;

import com.huiy.domain.BoardVO;
import com.huiy.domain.Criteria;

public interface BoardService {
	public List<BoardVO> getAllList();
	
	public int getCntWithUser(String userid);
	
	public List<BoardVO> getList(Criteria cri);
	
	public List<BoardVO> getListWithUser(String userid,Criteria cri);
	
	public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);

}
