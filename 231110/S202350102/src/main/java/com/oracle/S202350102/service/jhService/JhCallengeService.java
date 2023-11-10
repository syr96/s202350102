package com.oracle.S202350102.service.jhService;

import java.util.List;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.Challenge;

public interface JhCallengeService {

	Challenge 		chgDetail(int chg_id);


	List<Board> 	chgReviewList(Board board);


	String 			userStatus(int userNum);


	Board 			reviewContent(int brd_num);


	List<Board>		reviewReplyList(int brd_num);


	int 			reviewTotal(int chg_id);


	int 			ingChgListTotal();


	List<Challenge> ingChgRecentList(Challenge challenge);


	List<Challenge> ingChgPickList(Challenge challenge);


	void 			replyInsert(Board board);


	int 			replyDelete(int brd_num); 

    
   
 

}
