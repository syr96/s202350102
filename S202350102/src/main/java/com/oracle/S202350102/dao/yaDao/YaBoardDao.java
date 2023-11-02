package com.oracle.S202350102.dao.yaDao;

import java.util.List;

import com.oracle.S202350102.dto.Board;

public interface YaBoardDao {
	List<Board> listCommunity(Board board);
	// 게시글 상세조회
	Board        detailCommunity(int brd_num);
	// 조회수 증가
	void         upViewCnt(int brd_num);
	
	int           getuserNum(String userId);
	// 로그인만 회원만 게시글 작성
	int         insertCommunity(Board board);

	

	
	
}
