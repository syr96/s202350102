package com.oracle.S202350102.service.yaService;

import java.util.List;

import com.oracle.S202350102.dto.Board;

public interface YaCommunityService {
	//커뮤니티 게시글 전체
	List<Board> listCommunity(Board board);
	//커뮤니티 게시글 상세조회
	Board detailCommunity(int brd_num);
	//게시글 조회수 증가
	void         upViewCnt(int brd_num);
	
	//추후에 다시 생각해보기
	String       userNick(Integer user_num);

	
}
