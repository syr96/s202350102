package com.oracle.S202350102.dao.jkDao;

import java.util.List;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.User1;

public interface JkBoardDao {
	List<Board> 		sharing(Board board);
	User1 				userSelect(int user_num);
	Board 				getboardBybrd_num(int brd_num);
	boolean 			getLikeStatus(int brd_num);
	void 				updateLikeStatus(int brd_num);
	int 				writeFormSharing(Board board);
	Board 				detailSharing(int brd_num);
	int 				updateSharing(Board board);
	int					deleteSharing(int brd_num);
	List<Board> 		getPopularPosts(Board board);
	List<Board> 		getRecentPosts(Board board);
	

	
}
