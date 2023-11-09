package com.oracle.S202350102.dao.jhDao;

import java.util.List;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.Challenge;

public interface JhChallengeDao {

	Challenge 		chgDetail(int chg_id);

	List<Board> 	chgReviewList(Board board);

	String 			userStatus(int userNum);

	Board 			reviewContent(int brd_num);

	List<Board>		reviewReply(int brd_num);

	int 			reviewTotal(int chg_id);

	List<Challenge> challengeList();

	int 			chgListTotal();  
  
} 
 