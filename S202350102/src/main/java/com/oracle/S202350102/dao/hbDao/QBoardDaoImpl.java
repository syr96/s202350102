package com.oracle.S202350102.dao.hbDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.S202350102.dto.Board;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class QBoardDaoImpl implements QBoardDao {
	private final SqlSession session;
	
	
	@Override
	public List<Board> qBoardList(Board board) {
		List<Board> qBoardList = null;
		try {
			qBoardList = session.selectList("qBoardList",board);
			System.out.println("qbd dao qBoardList.size->"+qBoardList.size());
		} catch (Exception e) {
			System.out.println("qbd dao exception->"+e.getMessage());
		}
		return qBoardList;
	}


	@Override
	public Board qBoardSelect(int brd_num) {
		Board board = null;
		try {
			board = session.selectOne("qBoardSelect",brd_num);
		} catch (Exception e) {
			System.out.println("qbd dao sel exception->"+e.getMessage());
		}
		return board;
	}


	@Override
	public int qBoardInsert(Board board) {
		int result = 0;
		try {
			System.out.println("board->"+board);
			result = session.insert("qBoardInsert",board);
		} catch (Exception e) {
			System.out.println("qbd dao ins exception->"+e.getMessage());
		}
		return result;
	}


	@Override
	public int qBoardDelete(int brd_num) {
		int result = 0;
		try {
			result = session.delete("qBoardDelete",brd_num);
		} catch (Exception e) {
			System.out.println("qbd dao del exception->"+e.getMessage());
		}
		return result;
	}


	@Override
	public void readCnt(int brd_num) {
		try {
			session.update("qReadCount",brd_num);
		} catch (Exception e) {
			System.out.println("qbd dao readcnt exception->"+e.getMessage());
		}
	}


	@Override
	public int qBoardUpdate(Board board) {
		int result = 0;
		try {
			System.out.println("dao qboardupdate board->"+board);
			result = session.update("qBoardUpdate",board);
			System.out.println("dao qboardUpdate result->"+result);
		} catch (Exception e) {
			System.out.println("qbd dao qBoardUpdate exception->"+e.getMessage());
		}
		
		return result;
	}

}
