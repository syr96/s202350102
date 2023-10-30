package com.oracle.S202350102.dto;

import java.util.Date;

import lombok.Data;

@Data
public class SharingList {
	private int 	brd_num;	// 게시물등록번호
	private int 	user_num;	// 회원번호
	private Date 	reg_date;	// 신청일자
	private int 	state_lg;	// 진행상태(대분류)
	private int 	state_md;	// 진행상태(중분류)
	private String 	reject_msg;	// 반려사유
	private String 	message;	// 전달메세지
}

