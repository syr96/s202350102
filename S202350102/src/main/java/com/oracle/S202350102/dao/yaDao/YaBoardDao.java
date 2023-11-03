package com.oracle.S202350102.dao.yaDao;

import java.util.List;

import com.oracle.S202350102.dto.Board;

public interface YaBoardDao {
	List<Board> listCommunity(Board board);

	Board        detailCommunity(int brd_num);
	void         upViewCnt(int brd_num);	
	int          getuserNum(String userId);
	int          insertCommunity(Board board);
	int          updateCommunity(Board board);
	int          deleteCommunity(int brd_num);
	List<Board>  boardSearchList(Board board);

	

	
	
}
