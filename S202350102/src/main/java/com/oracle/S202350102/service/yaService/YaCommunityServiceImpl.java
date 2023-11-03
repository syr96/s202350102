package com.oracle.S202350102.service.yaService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dao.yaDao.YaBoardDao;
import com.oracle.S202350102.dto.Board;

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
	public int getuserNum(String userId) {
		System.out.println("YaCommunityServiceImpl getUserNum start...");
		return ybd.getuserNum(userId);
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
	public List<Board> listSearchBoard(Board board) {
		List<Board> boardSearchList = null;
		System.out.println("YaCommunityServiceImpl listSearchBoard start...");
		boardSearchList = ybd.boardSearchList(board);
		System.out.println("YaCommunityServiceImpl listSearchBoard boardSearchList.size()?"+boardSearchList.size());
		return boardSearchList;
	}

	
	
	
}
