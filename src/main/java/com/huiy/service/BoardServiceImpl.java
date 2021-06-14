package com.huiy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.huiy.domain.BoardVO;
import com.huiy.domain.Criteria;
import com.huiy.mapper.BoardMapper;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	

	@Override
	public void register(BoardVO board) {
		mapper.insertSelectKey(board);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO get(Long bno) {
		mapper.updateViewcnt(bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getAllList() {
		return mapper.getList();
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getCntWithUser(String userid) {
		return mapper.getCntWithUser(userid);
	}

	@Override
	public List<BoardVO> getListWithUser(String userid, Criteria cri) {
		return mapper.getListWithUserPaging(userid, cri);
	}

}
