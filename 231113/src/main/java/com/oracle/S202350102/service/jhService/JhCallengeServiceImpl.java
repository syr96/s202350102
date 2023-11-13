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
	public List<Board> reviewReplyList(Board board) {
		System.out.println("JhCallengeServiceImpl reviewReplyList Start...");
		
		List<Board> reviewReplyList = jhChgDao.reviewReplyList(board);
		
		return reviewReplyList;
	}

	@Override
	public int reviewTotal(int chg_id) {
		System.out.println("JhCallengeServiceImpl reviewTotal Start...");
		int reviewTotal = jhChgDao.reviewTotal(chg_id);
		
		return reviewTotal;
	}


	@Override
	public int ingChgListTotal() {
		System.out.println("JhCallengeServiceImpl ingChgListTotal Start...");
		int chgListTotal = jhChgDao.ingChgListTotal();
		return chgListTotal;
	}

	@Override
	public List<Challenge> ingChgRecentList(Challenge challenge) {
		System.out.println("JhCallengeServiceImpl ingChgRecentList Start...");
		List<Challenge> ingChgRecList = jhChgDao.ingChgRecentList(challenge);
		return ingChgRecList;
	}

	@Override
	public List<Challenge> ingChgPickList(Challenge challenge) {
		System.out.println("JhCallengeServiceImpl ingChgPickList Start...");
		List<Challenge> ingChgPicList = jhChgDao.ingChgPickList(challenge);
		return ingChgPicList;
	}

	@Override
	public void replyInsert(Board board) {
		System.out.println("JhCallengeServiceImpl replyInsert Start...");
		jhChgDao.replyInsert(board);
		
	}

	@Override
	public int replyDelete(int brd_num) {
		System.out.println("JhCallengeServiceImpl replyDelete Start...");
		int result = jhChgDao.replyDelete(brd_num);
		
		return result;
	}

	@Override
	public void viewCntUp(int brd_num) {
		System.out.println("JhCallengeServiceImpl viewCntUp Start...");
		jhChgDao.viewCntUp(brd_num);
	}


	@Override
	public int replyUpdate(Board board) {
		System.out.println("JhCallengeServiceImpl replyUpdate Start...");
		int result = jhChgDao.replyUpdate(board);
		return result;
	}

	@Override
	public int reviewInsert(Board board) {
		System.out.println("JhCallengeServiceImpl reviewInsert Start...");
		
		int result = jhChgDao.reviewInsert(board);
		
		return result;
	}


	
	

}
