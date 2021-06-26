package com.huiy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.huiy.domain.ReplyVO;
import com.huiy.mapper.BoardMapper;
import com.huiy.mapper.ReplyMapper;


@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	BoardMapper boardMapper;
	
	@Autowired
	ReplyMapper replyMapper;

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public void register(ReplyVO reply) {
		replyMapper.insert(reply);
		Long bno = reply.getBno();
		boardMapper.updateReplycnt(bno);
		
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public void remove(Long rno) {
		Long bno = replyMapper.getReplyWithRno(rno).getBno();
		replyMapper.delete(rno);
		boardMapper.updateReplycnt(bno);
	}

	@Override
	public List<ReplyVO> getListWithBoard(Long bno) {
		return replyMapper.getListWithBoard(bno);
	}
	

}
