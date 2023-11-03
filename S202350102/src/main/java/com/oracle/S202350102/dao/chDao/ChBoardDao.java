package com.oracle.S202350102.dao.chDao;

import java.util.List;

import com.oracle.S202350102.dto.Board;

public interface ChBoardDao {
	List<Board> noticeList(Board board);
	int			noticeWrite(Board board);
	Board 		noticeConts(int brd_num);
	int 		noticeUpdate(Board board);
	int 		deleteNotice(int brd_num);
	void 		noticeViewUp(int brd_num);
	List<Board> popBoardList();
	int         noticeCount(int brd_md);
	List<Board> popShareList();
	
}
