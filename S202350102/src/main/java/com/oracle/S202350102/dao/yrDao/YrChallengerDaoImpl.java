package com.oracle.S202350102.dao.yrDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.S202350102.dto.Challenger;
import com.oracle.S202350102.dto.User1;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class YrChallengerDaoImpl implements YrChallengerDao {
	private final SqlSession session;
	
	@Override
	public List<User1> listSsj(int chg_id) {
		List<User1> listSsj = null; 
		System.out.println("YrChallengerDaoImpl listSsj Start...");
		try {
			listSsj = session.selectList("yrUser1ListSsj", chg_id);
			System.out.println(listSsj);
		} catch (Exception e) {
			System.out.println("YrChallengerDaoImpl listSsj e.getMessage() -> " + e.getMessage());
		}
		return listSsj;
	}

	@Override
	public int insertChgr(Challenger chgr) {
		int insertChgr = 0;
		System.out.println("YrChallengerDaoImpl insertChgr Start...");
		try {
			insertChgr = session.insert("yrChgrInsert", chgr);
			System.out.println("YrChallengerDaoImpl insert");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return insertChgr;
	}

	@Override
	public int selectChgrParti(int chg_id) {
		int selectChgrParti = 0;
		System.out.println("YrChallengerDaoImpl selectChgrParti Start...");
		try {
			selectChgrParti = session.selectOne("yrChgrSelectParti", chg_id);
			System.out.println("YrChallengerDaoImpl selectChgrParti -> " + selectChgrParti);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return selectChgrParti;
	}

	@Override
	public int selectChgrJoinYN(Challenger chgr) {
		int selectChgrJoinYN = 0;
		System.out.println("YrChallengerDaoImpl selectChgrJoinYN Start...");
		try {
			selectChgrJoinYN = session.selectOne("yrChgrYN", chgr);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return selectChgrJoinYN;
	}

}
