package com.huiy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.huiy.domain.ReplyVO;

public interface ReplyMapper {
	@Select("select * from tbl_reply where rno=#{rno}")
	public ReplyVO getReplyWithRno(Long rno);
	public List<ReplyVO> getListWithBoard(Long bno);
	public void insert(ReplyVO reply);
	public void delete(Long rno);
}
