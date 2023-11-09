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
	public List<Board> reviewReply(int brd_num) {
		System.out.println("JhChallengeDaoImpl reviewReply Start...");
		
		List<Board> reviewReply = null;
		
		try {
			reviewReply = session.selectList("jhReviewReply", brd_num);
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl reviewContent e.getMessage() -> " + e.getMessage());
		}
		
		System.out.println("JhChallengeDaoImpl chgReviewList  reviewReply.size() -> " + reviewReply.size());
		
		return reviewReply;
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

	@Override
	public List<Challenge> challengeList() {
		System.out.println("JhChallengeDaoImpl challengeList Start...");
		List<Challenge> chgList = null;
		
		try {
			chgList = session.selectList("jhChallengeList");
			
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl challengeList e.getMessage() -> " + e.getMessage());
		}
		System.out.println("JhChallengeDaoImpl challengeList  chgList.size() -> " + chgList.size());
		
		
		return chgList;
	}

	@Override
	public int chgListTotal() {
		System.out.println("JhChallengeDaoImpl chgListTotal Start...");
		int chgListTotal = 0;
		
		try {
			chgListTotal = session.selectOne("jhChgListTotal");
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl chgListTotal e.getMessage() -> " + e.getMessage());
		}
		
		System.out.println("JhChallengeDaoImpl challengeList chgListTotal -> " + chgListTotal);
		return chgListTotal;
	}



}
