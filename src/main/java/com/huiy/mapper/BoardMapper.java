package com.huiy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.huiy.domain.BoardVO;
import com.huiy.domain.Criteria;

public interface BoardMapper {
	
	@Select("select * from tbl_board")
	public List<BoardVO> getList();
	
	@Select("select count(*) from tbl_board where userid=#{userid}")
	public int getCntWithUser(String userid);
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public List<BoardVO> getListWithUserPaging(@Param("userid")String userid,@Param("cri") Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int update(BoardVO board);
	
	public int delete(Long bno);


}
