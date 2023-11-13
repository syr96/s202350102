package com.oracle.S202350102.service.chService;

import java.util.List;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.BoardReChk;

public interface ChBoardService {
	List<Board> noticeLIst(Board board);
	int 		noticeWrite(Board board);
	Board 		noticeConts(int brd_num);
	int 		noticeUpdate(Board board);
	int 		deleteNotice(int brd_num);
	void 		noticeViewUp(int brd_num);
	List<Board> popBoardList();
	int 		noticeCount(int brd_md);
	List<Board> popShareList();
	List<Board> myReview(int user_num);
	List<BoardReChk> alarmchk(int user_num);
	List<Board> myCertiList(int user_num);
	List<Board> myCommuList(int user_num);
	List<Board> myShareList(int user_num);
	int 		readAlarm(BoardReChk brc);
	int 		moveToNewCmt(BoardReChk brc);
	
}
