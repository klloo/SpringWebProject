package com.huiy.service;

import java.util.List;

import com.huiy.domain.ReplyVO;

public interface ReplyService {
	public void register(ReplyVO reply);
	public void remove(Long rno);
	public List<ReplyVO> getListWithBoard(Long bno);
}
