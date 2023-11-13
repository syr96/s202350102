package com.oracle.S202350102.service.chService;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.S202350102.dao.chDao.ChBoardDao;
import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.BoardReChk;

import lombok.Data;
@Service
@Data

public class ChBoardServiceImpl implements ChBoardService {
	
	private final ChBoardDao chBoardDao;
	
	@Override
	public int noticeCount(int brd_md) {
		System.out.println("chBoardServiceImpl noticeCount Start...");
		
		int noticeCount = chBoardDao.noticeCount(brd_md);
		
		return noticeCount;
	}

	@Override
	public List<Board> noticeLIst(Board board) {
		System.out.println("chBoardServiceImpl noticeList Start...");
		List<Board> noticeList = chBoardDao.noticeList(board);
		
		return noticeList;
	}


	@Override
	public int noticeWrite(Board board) {
		System.out.println("chBoardServiceImpl noticeWrite Start...");
		
		int result = 0;
		
		result = chBoardDao.noticeWrite(board);
		
		return result;
	}


	@Override
	public Board noticeConts(int brd_num) {
		System.out.println("chBoardServiceImpl noticeConts Start...");
		Board noticeConts = null;
		
		noticeConts = chBoardDao.noticeConts(brd_num);
		
		
		return noticeConts;
	}


	@Override
	public int noticeUpdate(Board board) {
		System.out.println("chBoardServiceImpl noticeUpdate Start...");
		int result = 0;
		
		result = chBoardDao.noticeUpdate(board);
		
		return result;
	}


	@Override
	public int deleteNotice(int brd_num) {
		System.out.println("chBoardServiceImpl deleteNotice Start...");
		int result = 0;
		
		result = chBoardDao.deleteNotice(brd_num);
		
		return result;
	}


	@Override
	public void noticeViewUp(int brd_num) {
		System.out.println("chBoardServiceImpl noticeViewUp Start...");
		chBoardDao.noticeViewUp(brd_num);
		
	}


	@Override
	public List<Board> popBoardList() {
		System.out.println("chBoardServiceImpl popBoardList Start...");
		
		List<Board> popBoardList = chBoardDao.popBoardList();
		
		return popBoardList;
	}

	@Override
	public List<Board> popShareList() {
		System.out.println("chBoardServiceImpl popBoardList Start...");
		
		List<Board> popShareList = chBoardDao.popShareList();
		
		System.out.println("chBoardServiceImpl popShareList->" + popShareList.size());
		return popShareList;
	}

	@Override
	public List<BoardReChk> alarmchk(int user_num) {
		List<BoardReChk> result = null;
		
		result = chBoardDao.alarmchk(user_num);
		
		
		return result;
	}

	@Override
	public List<Board> myReview(int user_num) {
		System.out.println("chBoardServiceImpl myReview Start...");
		List<Board> myReview = chBoardDao.myReview(user_num);
		
		System.out.println("chBoardServiceImpl myReview myReview.size()->" + myReview.size());
		
		return myReview;
	}

	@Override
	public List<Board> myCertiList(int user_num) {
		System.out.println("chBoardServiceImpl myCertiList Start...");
		List<Board> myCertiList = chBoardDao.myCertiList(user_num);
		System.out.println("chBoardServiceImpl myCertiList myCertiList.size()->" + myCertiList.size());
		return myCertiList;
	}

	@Override
	public List<Board> myCommuList(int user_num) {
		System.out.println("chBoardServiceImpl myCommuList Start...");
		List<Board> myCommuList = chBoardDao.myCommuList(user_num);
		System.out.println("chBoardServiceImpl myCommuList myCommuList.size()->" + myCommuList.size());
		return myCommuList;
	}

	@Override
	public List<Board> myShareList(int user_num) {
		System.out.println("chBoardServiceImpl myShareList Start...");
		List<Board> myShareList = chBoardDao.myShareList(user_num);
		System.out.println("chBoardServiceImpl myCommuList myShareList.size()->" + myShareList.size());
		return myShareList;
	}

	@Override
	public int readAlarm(BoardReChk brc) {
		System.out.println("chBoardServiceImpl readAlarm Start...");
		int result = chBoardDao.readAlarm(brc);
		System.out.println("chBoardServiceImpl readAlarm result->" + result);
		return result;
	}

	@Override
	public int moveToNewCmt(BoardReChk brc) {
		System.out.println("chBoardServiceImpl moveToNewCmt Start...");
		int result = chBoardDao.moveToNewCmt(brc);
		System.out.println("chBoardServiceImpl moveToNewCmt result->" + result);
		return result;
	}


	




	

}
