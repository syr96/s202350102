package com.oracle.S202350102.service.hbService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dao.hbDao.QBoardDao;
import com.oracle.S202350102.dto.Board;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QBoardServiceImpl implements QBoardService {
	private final QBoardDao qbd;

	@Override
	public List<Board> qBoardList(Board board) {
		List<Board> qBoardList = qbd.qBoardList(board);
		return qBoardList;
	}

	@Override
	public Board qBoardSelect(int brd_num) {
		Board board = qbd.qBoardSelect(brd_num);
		return board;
	}

	@Override
	public int qBoardInsert(Board board) {
		int result = qbd.qBoardInsert(board);
		return result;
	}

	@Override
	public int qBoardDelete(int brd_num) {
		int result = qbd.qBoardDelete(brd_num);
		return result;
	}

	@Override
	public void readCnt(int brd_num) {
		qbd.readCnt(brd_num);
	}

	@Override
	public int qBoardUpdate(Board board) {
		int result = qbd.qBoardUpdate(board);
		return result;
	}

	@Override
	public int totalQBoard() {
		int total = qbd.totalQBoard();
		return total;
	}

	@Override
	public List<Board> qboardListSearch(Board board) {
		System.out.println("qboardListSearch service start.");
		return qbd.qboardListSearch(board);
	}

	@Override
	public List<Board> qBoardCommentList(int brd_group){
		return qbd.qBoardCommentList(brd_group);
	}
	
	@Override
	public int qBoardCommentWrite(Board board) {
		int result = 0;
		result = qbd.qBoardCommentWrite(board);
		return result;
	}

	@Override
	public int qBoardCommentUpdate(Board board) {
		return qbd.qBoardCommentUpdate(board);
	}

	@Override
	public int qBoardCommentDelete(int brd_num) {
		return qbd.qBoardCommentDelete(brd_num);
	}
	
	@Override
	public int qBoardSearchListCount(Board board) {
		return qbd.qBoardSearchListCount(board);
	}
}
