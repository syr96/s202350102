package com.oracle.S202350102.dao.jkDao;

import java.util.List;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.User1;

public interface JkBoardDao {
	List<Board> 		Sharing(Board board);
	User1 				userSelect(int user_num);
	Board 				getboardBybrd_num(int brd_num);
	boolean 			getLikeStatus(int brd_num);
	void 				updateLikeStatus(int brd_num);


	
}
