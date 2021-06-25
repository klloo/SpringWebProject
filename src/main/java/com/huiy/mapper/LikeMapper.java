package com.huiy.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.huiy.domain.LikeVO;

public interface LikeMapper {
	@Select("Select bno from tbl_like where lno=#{lno}")
	public Long getBno(Long lno);
	@Select("Select * from tbl_like where bno=#{bno} and userid=#{userid}")
	public LikeVO getLikeWithBnoUser(@Param("bno")Long bno, @Param("userid")String userid);
	public void insert(LikeVO like);
	public void delete(Long lno);
}
