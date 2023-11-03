package com.oracle.S202350102.service.yaService;

import java.util.List;

import com.oracle.S202350102.dto.Board;

public interface YaCommunityService {
	
	List<Board>  listCommunity(Board board);
	Board        detailCommunity(int brd_num);
	void         upViewCnt(int brd_num);
	int          getuserNum(String userId);
	int          insertCommunity(Board board);
	int          updateCommunity(Board board);
	int          deleteCommunity(int brd_num);
	List<Board>  listSearchBoard(Board board);
	
	
}
