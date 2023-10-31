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
	//추후에 다시 생각해보기
	public String userNick(Integer user_num) {
		System.out.println("YaCommunityServiceImpl userNick stat...");
		
		return ybd.userNick(user_num);
	}


	
}
