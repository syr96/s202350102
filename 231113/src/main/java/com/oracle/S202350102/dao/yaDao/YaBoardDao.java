package com.oracle.S202350102.dao.yaDao;

import java.util.List;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.User1;

public interface YaBoardDao {
	List<Board> listCommunity(Board board);

	Board        detailCommunity(int brd_num);
	void         upViewCnt(int brd_num);	
	int          insertCommunity(Board board);
	int          updateCommunity(Board board);
	int          deleteCommunity(int brd_num);
	// 검색관련
	List<Board>  boardSearchList(String keyword);
	List<Board>  sortByViewCnt();
	List<Board>  sortByRegDate();
	User1        userSelect(int user_num);
	List<Board>  listComment(int brd_num);

	// 댓글관련
	void         commentWrite(Board board);
	void		 commentUpdate(Board board);
	void         commentDelete(Board board);
	int          getLatestBrdStep(int brd_group);

	
	int 		commentCount(int brd_num);
	int 		totalCommunity(Board board);
	


	
	

	
	
}
