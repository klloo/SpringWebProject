package com.huiy.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LikeVO {
	private Long lno;
	private Long bno;
	private String userid;
	private Date likeDate;
}
