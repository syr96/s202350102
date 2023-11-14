package com.oracle.S202350102.dao.thDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.S202350102.dto.Challenge;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ThChgDaoImpl implements ThChgDao {
	private final SqlSession session;
	
	@Override
	public int totalChg() {
		int totChgCnt = 0;
		System.out.println("ThChgDaoImpl totalChg Start... ");
		try {
			totChgCnt = session.selectOne("chgTotal");
			System.out.println("ThChgDaoImpl totalChg totalChgCnt --> " + totChgCnt);
		} catch (Exception e) {
			System.out.println("ThChgDaoImpl totalChg Exception --> " + e.getMessage());
		}
		return totChgCnt;
	}

	@Override
	public List<Challenge> listChg(Challenge chg) {
		System.out.println("ThChgDaoImpl listChg Start...");
		List<Challenge> chgList = null;
		try {
			chgList = session.selectList("thChgListAll",chg);
			System.out.println("ThChgDaoImpl listchg chgList.size() --> " + chgList.size());			
		} catch (Exception e) {
			System.out.println("ThChgDaoImpl listChg Exception --> " + e.getMessage());
		}
		return chgList;
	}

}
