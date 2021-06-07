package com.huiy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.huiy.domain.BoardVO;
import com.huiy.domain.Criteria;

public interface BoardMapper {
	
	@Select("select * from tbl_board order by regdate desc")
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int update(BoardVO board);
	
	public int delete(Long bno);


}
