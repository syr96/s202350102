package com.oracle.S202350102.service.jhService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dao.jhDao.JhChallengeDao;
import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.Challenge;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class JhCallengeServiceImpl implements JhCallengeService {
	
	private final JhChallengeDao jhChgDao;
	
	//챌린지 정보 조회
	@Override
	public Challenge chgDetail(int chg_id) {
		System.out.println("JhCallengeServiceImpl chgDetail Start...");

		System.out.println("JhCallengeServiceImpl chgDetail  chg_id -> "+ chg_id);

		Challenge chgDetail = jhChgDao.chgDetail(chg_id);
		
		
		return chgDetail;
	}

	@Override
	public List<Board> chgReviewList(Board board) {
		System.out.println("JhCallengeServiceImpl chgReviewList Start...");
		
		List<Board> chgReviewList = jhChgDao.chgReviewList(board);
		
		return chgReviewList;
	}

	@Override
	public String userStatus(int userNum) {
		System.out.println("JhCallengeServiceImpl userStatus Start...");
		
		String userStatus = jhChgDao.userStatus(userNum);
		
		return userStatus;
	}

	@Override
	public Board reviewContent(int brd_num) {
		System.out.println("JhCallengeServiceImpl reviewContent Start...");
		Board reviewContent = jhChgDao.reviewContent(brd_num);
		
		return reviewContent;
	}

	@Override
	public List<Board> reviewReply(int brd_num) {
		System.out.println("JhCallengeServiceImpl reviewReply Start...");
		
		List<Board> reviewReply = jhChgDao.reviewReply(brd_num);
		
		return reviewReply;
	}

	@Override
	public int reviewTotal(int chg_id) {
		System.out.println("JhCallengeServiceImpl reviewTotal Start...");
		int reviewTotal = jhChgDao.reviewTotal(chg_id);
		
		return reviewTotal;
	}

	@Override
	public List<Challenge> challengeList() {
		System.out.println("JhCallengeServiceImpl reviewTotal Start...");
		List<Challenge> chgList = jhChgDao.challengeList();

		return chgList;
	}

	@Override
	public int chgListTotal() {
		System.out.println("JhCallengeServiceImpl chgListTotal Start...");
		int chgListTotal = jhChgDao.chgListTotal();
		return chgListTotal;
	}


	
	

}
