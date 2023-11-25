package com.oracle.S202350102.dao.yaDao;

import java.util.List;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.SharingList;
import com.oracle.S202350102.dto.User1;

public interface YaBoardDao {
	//커뮤니티게시판 관련
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

	
	// 쉐어링 참가신청관련
	int         	  saveSharing(SharingList sharingList);
	List<Board>       myUploadSharingList(int user_num);
	List<SharingList> sharingParticipantsList(int brd_num);
	int         	  sharingConfirm(SharingList sharingList);
	void              upParticipantsCnt(int brd_num);
	List<SharingList> myJoinSharingList(int user_num);
	List<Board>       myConfirmSharingList(int user_num);
	int               sharingReject(SharingList sharingList);
	void              downParticipantsCnt(int brd_num);
	
	//mySharing 페이징
	int               totalMyUploadsharing(int user_num);
	int               totalJoinSharing(int user_num);
	int               totalConfirmSharing(int user_num);
	int                totalSharing(Board board);
	
	
	
	
	

	
	

	
	
}
