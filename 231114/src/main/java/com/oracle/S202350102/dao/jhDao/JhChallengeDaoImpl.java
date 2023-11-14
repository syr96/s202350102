package com.oracle.S202350102.dao.jhDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.Challenge;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class JhChallengeDaoImpl implements JhChallengeDao {
	
	private final SqlSession session;

	//챌린지 정보 조회
	@Override
	public Challenge chgDetail(int chg_id) {
		System.out.println("JhChallengeDaoImpl chgDetail Start...");
		System.out.println("JhChallengeDaoImpl chgDetail  chg_id -> " + chg_id);
		
		Challenge chgDetail = null;
		try {
			
			chgDetail = session.selectOne("jhChgDetail", chg_id);
			System.out.println("JhChallengeDaoImpl chgDetail  chg -> " + chgDetail);
			
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl chgDetail e.getMessage() -> " + e.getMessage());
		}
		
		return chgDetail;
	}

	@Override
	public List<Board> chgReviewList(Board board) {
		System.out.println("JhChallengeDaoImpl chgReviewList Start...");
		List<Board> chgReviewList = null;
		
		try {
			
			chgReviewList = session.selectList("jhChgReviewList", board);
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl chgReviewList e.getMessage() -> "+ e.getMessage());
		}
		
		System.out.println("JhChallengeDaoImpl chgReviewList  chgReviewList.size() -> " + chgReviewList.size());

		return chgReviewList;
	}

	@Override
	public String userStatus(int userNum) {
		System.out.println("JhChallengeDaoImpl userStatus Start...");
		System.out.println("JhChallengeDaoImpl userNum -> " + userNum);
		
		String userStatus = null;
		
		try {
			userStatus = session.selectOne("jhUserStatus", userNum);
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl userStatus e.getMessage() -> " + e.getMessage());
		}
		
		System.out.println("JhChallengeDaoImpl userStatus -> " + userStatus);
		return userStatus;
	}

	@Override
	public Board reviewContent(int brd_num) {
		System.out.println("JhChallengeDaoImpl reviewContent Start...");
		Board reviewContent = null;
		
		try {
			reviewContent = session.selectOne("jhReviewContent" ,brd_num);
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl reviewContent e.getMessage() -> " + e.getMessage());
		}
		System.out.println("JhChallengeDaoImpl chgReviewList  reviewContent -> " + reviewContent);
		
		return reviewContent;
	}

	@Override
	public List<Board> reviewReplyList(Board board) {
		System.out.println("JhChallengeDaoImpl reviewReplyList Start...");
		
		List<Board> reviewReplyList = null;
		
		try {
			reviewReplyList = session.selectList("jhReviewReplyList", board);
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl reviewReplyList e.getMessage() -> " + e.getMessage());
		}
		
		System.out.println("JhChallengeDaoImpl reviewReplyList  reviewReplyList.size() -> " + reviewReplyList.size());
		
		return reviewReplyList;
	}

	@Override
	public int reviewTotal(int chg_id) {
		System.out.println("JhChallengeDaoImpl reviewTotal Start...");
		int reviewTotal = 0;
		
		try {
			reviewTotal = session.selectOne("jhReviewTotal", chg_id);
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl reviewTotal e.getMessage() -> " + e.getMessage());
		}
		System.out.println("JhChallengeDaoImpl chgReviewList  reviewTotal -> " + reviewTotal);
		
		
		return reviewTotal;
	}


	
	//미완성 //////////////////////////////////////////////
	@Override
	public int ingChgListTotal() {
		System.out.println("JhChallengeDaoImpl chgListTotal Start...");
		int ingChgListTotal = 0;
		
		try {
			ingChgListTotal = session.selectOne("jhIngChgListTotal");
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl ingChgListTotal e.getMessage() -> " + e.getMessage());
		}
		
		System.out.println("JhChallengeDaoImpl ingChgListTotal chgListTotal -> " + ingChgListTotal);
		return ingChgListTotal;
	}

	@Override
	public List<Challenge> ingChgRecentList(Challenge challenge) {
		System.out.println("JhChallengeDaoImpl ingChgRecentList Start...");
		List<Challenge> ingChgRecList = null;
		
		try {
			ingChgRecList = session.selectList("jhIngChgRecentList", challenge);
			
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl ingChgRecentList e.getMessage() -> " + e.getMessage());
		}
		System.out.println("JhChallengeDaoImpl ingChgRecentList  ingChgRecList.size() -> " + ingChgRecList.size());
		
		
		return ingChgRecList;
	}


	@Override
	public List<Challenge> ingChgPickList(Challenge challenge) {
		System.out.println("JhChallengeDaoImpl ingChgPickList Start...");
		List<Challenge> ingChgPicList = null;
		
		try {
			ingChgPicList = session.selectList("jhIngChgPickList", challenge);
			
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl ingChgPickList e.getMessage() -> " + e.getMessage());
		}
		System.out.println("JhChallengeDaoImpl ingChgPickList  ingChgPicList.size() -> " + ingChgPicList.size());
		
		return ingChgPicList;
	}

	//미완성 //////////////////////////////////////////////
	
	@Override
	public void replyInsert(Board board) {
		System.out.println("JhChallengeDaoImpl replyInsert Start...");
		session.selectOne("jhReplyInsertPro", board);
		System.out.println("JhChallengeDaoImpl replyInsert board.getResultCount() -> "+board.getResultCount());

		
	}

	@Override
	public int replyDelete(int brd_num) {
		System.out.println("JhChallengeDaoImpl replyDelete Start...");
		System.out.println("JhChallengeDaoImpl replyDelete brd_num -> "+ brd_num);
		
		int result = 0;
		
		try {
			result = session.delete("jhReplyDelete", brd_num);
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl replyDelete e.getMessage() -> " + e.getMessage());
		}
		System.out.println("JhChallengeDaoImpl replyDelete result -> "+ result);
		
		return result;
	}

	@Override
	public void viewCntUp(int brd_num) {
		System.out.println("JhChallengeDaoImpl viewCntUp Start...");
		
		int result = 0;
		
		try {
			result = session.update("jhViewCntUp", brd_num);
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl viewCntUp e.getMessage() -> " + e.getMessage());
		}
		
		System.out.println("JhChallengeDaoImpl replyDelete result -> "+ result);
		
	}



	@Override
	public int replyUpdate(Board board) {
		System.out.println("JhChallengeDaoImpl replyUpdate Start...");
		int result = 0;
		try {
			result = session.update("jhReplyUpdate", board);
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl replyUpdate e.getMessage() -> " + e.getMessage());
		}
		return result;
	}

	@Override
	public int reviewPost(Board board) {
		System.out.println("JhChallengeDaoImpl reviewPost Start...");
		
		int result = 0;
		
		try {
			result = session.insert("jhReviewPost", board);
			
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl reviewPost e.getMessage() -> " + e.getMessage());
			
		}
		
		return result;
	}



}
