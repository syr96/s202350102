package com.oracle.S202350102.service.yaService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dao.yaDao.YaBoardDao;
import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.User1;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class YaCommunityServiceImpl implements YaCommunityService {
	
	private final YaBoardDao ybd;
	
	@Override
	public List<Board> listCommunity(Board board) {
		List<Board> listCommunity = null;
		System.out.println("YaCommunityServiceImpl start...");
		listCommunity = ybd.listCommunity(board);
		System.out.println("YaCommunityServiceImpl listCommunity communityList.size()?"+listCommunity.size());
		return listCommunity ;
	}
	

	
	//게시글 상세보기
	@Override
	public Board detailCommunity(int brd_num) {
		System.out.println("YaCommunityServiceImpl detailCommunity start..");
		Board board = null;
		board = ybd.detailCommunity(brd_num);
		return board;
	}
	
	//게시글 조회수 증가
	@Override
	public void upViewCnt(int brd_num) {
		System.out.println("YaCommunityServiceImpl upViewCnt start..");
		ybd.upViewCnt(brd_num);
	}



	@Override
	public int insertCommunity(Board board) {
		int insertResult = 0;
		System.out.println("YaCommunityServiceImpl insert start....");
		insertResult = ybd.insertCommunity(board);
		return insertResult;
	}

	@Override
	public int updateCommunity(Board board) {
		int updateCommunity =0;
		System.out.println("YaCommunityServiceImpl update Board start...");
		updateCommunity = ybd.updateCommunity(board);
		return updateCommunity;
	}
	//게시글 삭제
	@Override
	public int deleteCommunity(int brd_num) {
		int deleteResult =0;
		System.out.println("YaCommunityServiceImpl delete start....");
		deleteResult = ybd.deleteCommunity(brd_num);
		return deleteResult;
	}

	@Override
	public List<Board> listSearchBoard(String keyword) {
		List<Board> boardSearchList = null;
		System.out.println("YaCommunityServiceImpl listSearchBoard start...");
		boardSearchList = ybd.boardSearchList(keyword);
		System.out.println("YaCommunityServiceImpl listSearchBoard boardSearchList.size()?"+boardSearchList.size());
		return boardSearchList;
	}
	@Override
	public List<Board> listBoardSort(String sort) {
		List<Board> listBoardSort = null;
		System.out.println("YaCommunityServiceImpl listBoardSort start...");
		
		if("view_cnt".contentEquals(sort)) {
			return ybd.sortByViewCnt();
		} else if ("reg_date".equals(sort)) {
			return ybd.sortByRegDate();
		} else {
			return ybd.sortByRegDate();
		}
	}


	@Override
	public User1 userSelect(int user_num) {
		if (user_num != 0) {
			User1 user = new User1();
			user = ybd.userSelect(user_num);
			return user;
		} else {
			return null;
		}
	}	

	@Override
	public List<Board> listComment(int brd_num) {
		List<Board> listComment = null;
		System.out.println("YaCommunityServiceImpl listComment start...");
		listComment = ybd.listComment(brd_num);
		return listComment;
	}

	@Override
	public void commentWrite(Board board) {
		System.out.println("YaCommunityServiceImpl commentWrite start..");
		ybd.commentWrite(board);
	}


	@Override
	public void commentUpdate(Board board) {
		System.out.println("YaCommunityServiceImpl commentUpdat start..");
		ybd.commentUpdate(board);
	}

	@Override
	public void commentDelete(Board board) {
		System.out.println("YaCommunityServiceImpl commentDelete start..");
		ybd.commentDelete(board);
	}

	@Override
	public int getLatestBrdStep(int brd_group) {
		System.out.println("YaCommunityServiceImpl getLatestBrdStep start....");
		int getLatestBrdStep = ybd.getLatestBrdStep(brd_group);
		return getLatestBrdStep;
		
	}

	@Override
	public int commentCount(int brd_num) {
		System.out.println("YaCommunityServiceImpl commentCount start...");
		int commentCount = ybd.commentCount(brd_num);
		
		return commentCount;
	}



	@Override
	public int totalCommunity(Board board) {
		System.out.println("YaCommunityServiceImpl totalCommuinty()t start...");
		int totalCommunity = ybd.totalCommunity(board);
		return totalCommunity;
	}



}
