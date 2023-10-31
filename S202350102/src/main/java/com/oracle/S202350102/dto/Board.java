package com.oracle.S202350102.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
	private int 	brd_num; 		// 寃뚯떆臾쇰벑濡앸쾲�샇
	private int 	chg_id; 		// 泥쇰┛吏��벑濡앸쾲�샇 
	private int 	user_num;		// �쉶�썝踰덊샇
	private int 	brd_lg;		// 遺꾨쪟踰덊샇(��遺꾨쪟)
	private int 	brd_md;		// 遺꾨쪟踰덊샇(以묐텇瑜�)
	private String 	title;			// 寃뚯떆湲� �젣紐�
	private String 	conts;			// 寃뚯떆湲��궡�슜
	private String 	img;			// 寃뚯떆湲� 泥⑤��뙆�씪
	private int 	view_cnt;		// 寃뚯떆湲� 議고쉶 �닔
	private String  reg_date;		// 寃뚯떆湲� �옉�꽦�씪�옄
	private int		price;			// �뎽�뼱留� 湲덉븸
	private String 	bank_info;		// �뎽�뼱留� ���뻾,怨꾩쥖踰덊샇
	private Date 	bank_duedate;	// �뎽�뼱留� �엯湲덇린�븳
	private String 	addr;			// �뎽�뼱留� 二쇱냼
	private int 	applicants;		// �뎽�뼱留� 紐⑥쭛�씤�썝
	private int 	participants;	// �뎽�뼱留� 李몄뿬�씤�썝
	private String 	user_tel;		// �뎽�뼱留� �뿰�씫泥섏젙蹂�
	private String 	memo;			// �뎽�뼱留� �쟾�떖�븷硫붾え
	private int 	like_cnt;		// 寃뚯떆�뙋 醫뗭븘�슂�닔
	private int 	brd_group;		// 寃뚯떆湲�洹몃９
	private int 	brd_step;		// �뙎湲��닚�꽌
	private int 	loc_brd_num;	// 吏��룄紐⑸줉肄붾뱶踰덊샇
	private int 	loc_num;		// 吏��뿭肄붾뱶踰덊샇
	
	
	
	//join�슜 _listCommunity
	private String 	nick;			// �땳�꽕�엫
}