package com.huiy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.huiy.domain.BoardVO;
import com.huiy.domain.Criteria;
import com.huiy.domain.LikeVO;
import com.huiy.mapper.BoardMapper;
import com.huiy.mapper.LikeMapper;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private  LikeMapper likeMapper;
	

	@Override
	public void register(BoardVO board) {
		boardMapper.insertSelectKey(board);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO get(Long bno) {
		boardMapper.updateViewcnt(bno);
		return boardMapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		return boardMapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		return boardMapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getAllList() {
		return boardMapper.getList();
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return boardMapper.getListWithPaging(cri);
	}

	@Override
	public int getCntWithUser(String userid) {
		return boardMapper.getCntWithUser(userid);
	}

	@Override
	public List<BoardVO> getListWithUser(String userid, Criteria cri) {
		return boardMapper.getListWithUserPaging(userid, cri);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public void like(LikeVO like) {
		likeMapper.insert(like);
		Long bno = like.getBno();
		boardMapper.updateLikecnt(bno);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public void likeCancel(String userid ,Long bno) {
		LikeVO like = likeMapper.getLikeWithBnoUser(bno, userid);
		likeMapper.delete(like.getLno());
		boardMapper.updateLikecnt(bno);
	}

	//true면 하트 false면 빈하트
	@Override
	public boolean getHeart(String userid, Long bno) {
		return likeMapper.getLikeWithBnoUser(bno, userid) != null;
	}

	@Override
	public List<BoardVO> getListWithLike(String userid, Criteria cri) {
		return boardMapper.getListWithLikePaging(userid, cri);
	}

	@Override
	public int getCntWithLike(String userid) {
		return boardMapper.getCntWithLike(userid);
	}

	@Override
	public List<BoardVO> getListWithReply(String userid, Criteria cri) {
		return boardMapper.getListWithReplyPaging(userid, cri);
	}

	@Override
	public int getCntWithReply(String userid) {
		return boardMapper.getCntWithReply(userid);
	}

}
