package com.huiy.service;

import java.util.List;

import com.huiy.domain.BoardVO;
import com.huiy.domain.Criteria;
import com.huiy.domain.LikeVO;

public interface BoardService {
	public List<BoardVO> getAllList();
	
	public int getCntWithUser(String userid);
	
	public List<BoardVO> getList(Criteria cri);
	
	public List<BoardVO> getListWithUser(String userid,Criteria cri);
	
	public List<BoardVO> getListWithLike(String userid,Criteria cri);
	
	public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	public void like(LikeVO like);

	public void likeCancel(String userid ,Long bno);

	boolean getHeart(String userid, Long bno);

	public int getCntWithLike(String userid);

}
