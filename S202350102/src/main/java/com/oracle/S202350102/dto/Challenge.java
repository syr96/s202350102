package com.oracle.S202350102.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Challenge {
	private int 	chg_id;			// 챌린지등록번호
	private int 	user_num;		// 회원번호
	private int 	chg_lg;			// 분류번호
	private int 	chg_md;			// 종류(중분류)
	private String 	title;			// 챌린지명
	private int 	chg_capacity;	// 참여정원
	private int 	now_parti;		// 현재참여인원
	private String 	chg_conts;		// 챌린지소개
	private int 	state_lg;		// 진행상태(대분류)
	private int 	state_md;		// 진행상태(중분류)
	private int 	pick_cnt;		// 챌린지찜수
	private String 	upload;			// 인증방법
	private String 	sample_img;		// 인증예시사진
	private int 	freq;			// 인증빈도
	private int 	chg_public;		// 공개여부
	private int 	chg_password;	// 비밀번호
	private String 	thumb;			// 썸네일
	private int 	return_lg;		// 반려사유(대분류)
	private int 	return_md;		// 반려사유(중분류)
	private Date 	reg_date;		// 챌린지신청일
	private Date 	create_date;	// 챌린지 개설일
	private Date 	start_date;		// 챌린지시작일
	private Date 	end_date;		// 챌린지마감일
}
