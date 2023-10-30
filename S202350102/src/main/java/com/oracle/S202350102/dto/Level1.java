package com.oracle.S202350102.dto;

import lombok.Data;

@Data
public class Level1 {
	private int 	user_level;	// 레벨
	private int 	req_exp;	// 남은경험치
	private int 	tot_exp;	// 목표경험치
	private String 	lv_name;	// 레벨명
}
