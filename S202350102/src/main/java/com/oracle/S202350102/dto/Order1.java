package com.oracle.S202350102.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Order1 {
	private int 	user_num;	  // 회원번호
	private int 	order_num;	  // 주문번호
	private int 	price;		  // 결제금액
	private String 	pay_type;	  // 결제수단
	private Date 	create_date; // 결제요청날짜
	private Date 	suc_date;	  // 결제완료날짜
	private Date 	expir_date;	  // 사용 만료일
	private Date 	next_date;	  // 다음 결제일
	private String 	billing_key;  // 빌링키
	private String 	rslt_status;  // 결과상태
	private String 	rslt_message; // 결과메세지
}
