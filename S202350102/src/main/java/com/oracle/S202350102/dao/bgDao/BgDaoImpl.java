package com.oracle.S202350102.dao.bgDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.S202350102.dto.Board;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BgDaoImpl implements BgDao {
	
	private final SqlSession session;

	@Override
	public List<Board> boardCert(Board board) {
		List<Board> certBoard = null;
		System.out.println("BgDaoImpl boardCert Start... ");
		try {
			certBoard = session.selectList("bkCertBoard", board);
		} catch (Exception e) {
			System.out.println("BgDaoImpl boardCert e.getMessage() -> " + e.getMessage());
		}
		return certBoard;
	}

	
	@Override
	public int insertCertBrd(Board board) {
		
		int result = 0;
		System.out.println("BgDaoImpl boardCert Start... ");
		
		try {
			result = session.insert("insertCertBrd", board);
		} catch (Exception e) {
			System.out.println("BgDaoImpl insertCertBrd e.getMessage() -> " + e.getMessage());
		}
		
		return result;
	}
}
