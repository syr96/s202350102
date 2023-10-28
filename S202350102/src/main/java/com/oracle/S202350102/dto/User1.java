package com.oracle.S202350102.dto;

import java.util.Date;

import lombok.Data;

@Data
public class User1 {
	private int 	user_num;		// 회원번호
	private int 	user_level;		// 유저레벨
	private String 	user_id;		// 아이디
	private String 	user_pswd;		// 비밀번호
	private String 	nick;			// 닉네임
	private String 	user_name;		// 이름
	private String 	email;			// 이메일
	private Date   	birth;			// 생년월일
	private String 	addr;			// 주소
	private String 	tel;			// 전화번호
	private String 	gender;			// 성별
	private String 	img;			// 프로필사진
	private Date 	reg_date;		// 가입일자
	private Date 	mod_date;		// 수정일자
	private Date 	end_date;		// 탈퇴일자
	private String 	delete_yn;		// 탈퇴여부
	private Date 	last_lgn_date;	// 마지막로그인
	private int 	status_lg;		// 회원상태(대분류)
	private int 	status_md;		// 회원상태(중분류)
	private int 	user_exp;		// 경험치
	private int 	report_cnt;		// 신고횟수
	private int 	subs_amount;	// 결제금액
}
