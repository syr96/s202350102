package com.oracle.S202350102.service.yaService;

import java.util.List;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.SharingList;
import com.oracle.S202350102.dto.User1;

public interface YaCommunityService {
	
	List<Board>  listCommunity(Board board);
	Board        detailCommunity(int brd_num);
	void         upViewCnt(int brd_num);
	int          insertCommunity(Board board);
	int          updateCommunity(Board board);
	int          deleteCommunity(int brd_num);
	
	List<Board>  listSearchBoard(String keyword);
	List<Board>  listBoardSort(String sort);
	User1        userSelect(int user_num);
	List<Board>  listComment(int brd_num);
	
	void         commentWrite(Board board);
	void		 commentUpdate(Board board);
	void         commentDelete(Board board);
	int          getLatestBrdStep(int brd_group);

	int			 commentCount(int brd_num);
	int 		 totalCommunity(Board board);

	int                		 saveSharing(SharingList sharingList);
	List<Board>       		 myUploadSharingList(int user_num);
	List<SharingList> 		 sharingParticipantsList(int brd_num);
	int            	 		 sharingConfirm(SharingList updatedSharingList);
	void              		 upParticipantsCnt(int brd_num);
	List<SharingList>        myJoinSharingList(int user_num);
	List<Board>              myConfirmSharingList(int user_num);
	int 					 sharingReject(SharingList updatedRejectSharingList);
	void 					 downParticipantsCnt(int brd_num);
	
	//my sharing 페이징   count
	int                      totalMyUploadsharing(int user_num);
	int                      totalJoinSharing(int user_num);
	int                      totalConfirmSharing(int user_num);
	int                      totalSharing(Board board);

	
	
	
	


	
	
}
