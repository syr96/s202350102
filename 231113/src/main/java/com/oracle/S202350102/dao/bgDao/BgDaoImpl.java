package com.oracle.S202350102.dao.bgDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.Challenge;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BgDaoImpl implements BgDao {
	
	private final SqlSession session;
	
	// 챌린지 정보 조회
	@Override
	public Challenge bgChgDetail(int chg_id) {
		System.out.println("BgDaoImpl bgChgDetail Start...");
		System.out.println("BgDaoImpl bgChgDetail chg_id -> "+chg_id);
		Challenge chg = null;
		try {
			chg = session.selectOne("bgChgDetail", chg_id);
			System.out.println("BgDaoImpl bgChgDetail chg -> "+chg);
		} catch (Exception e) {
			System.out.println("BgDaoImpl bgChgDetail e.getMessage() -> "+e.getMessage());
		}
		return chg;
	}
	
	@Override
	public int totalCert() {
		int totCertCount = 0;
		System.out.println("BgDaoImpl totalCert Start...");
		
		try {
			totCertCount = session.selectOne("certTotal");
			System.out.println("BgDaoImpl totalCert totCertCount"+totCertCount);
		} catch (Exception e) {
			System.out.println("BgDaoImpl totalCert Exception -> "+e.getMessage());
		}
		
		return totCertCount;
	}

	@Override
	public List<Board> certBoard(Board board) {
		List<Board> boardCert = null;
		System.out.println("BgDaoImpl certBoard Start...");
		try {
			boardCert = session.selectList("bgCertBoardAll", board);
		} catch (Exception e) {
			System.out.println("BgDaoImpl certBoard e.getMessage() -> " + e.getMessage());
		}
		return boardCert;
	}
	
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

	@Override
	public int updateCertBrd(Board board) {
		
		System.out.println("BgDaoImpl update Start...");
		int updateCount = 0;
		
		try {
			updateCount = session.update("certBoardUpdate", board);
		} catch (Exception e) {
			System.out.println("BgDaoImpl updateCertBrd Exception -> "+e.getMessage());
		}
		return updateCount;
	}

	@Override
	public int deleteCertBrd(int brd_num) {
		System.out.println("BgDaoImpl delete Start...");
		System.out.println("BgDaoImpl delete brd_num -> "+brd_num);
		int result = 0;
		try {
			result = session.delete("deleteCertBrd", brd_num);
			System.out.println("BgDaoImpl delete result -> "+result);
		} catch (Exception e) {
			System.out.println("BgDaoImpl delete Exception -> "+e.getMessage());
		}
		return result;
	}




}
