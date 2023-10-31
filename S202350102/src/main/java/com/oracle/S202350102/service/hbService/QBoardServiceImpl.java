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

}
