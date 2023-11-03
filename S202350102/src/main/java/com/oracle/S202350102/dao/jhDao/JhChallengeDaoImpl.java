package com.oracle.S202350102.dao.jhDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.S202350102.dto.Challenge;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class JhChallengeDaoImpl implements JhChallengeDao {
	
	private final SqlSession session;

	//챌린지 정보 조회
	@Override
	public Challenge jhChgDetail(int chg_id) {
		System.out.println("JhChallengeDaoImpl jhChgDetail Start...");
		System.out.println("JhChallengeDaoImpl jhChgDetail  chg_id -> "+ chg_id);
		Challenge chg = null;
		try {
			
			chg = session.selectOne("jhChgDetail", chg_id);
			System.out.println("JhChallengeDaoImpl jhChgDetail  chg -> "+ chg);
			
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl jhChgDetail e.getMessage() -> "+ e.getMessage());
		}
		
		return chg;
	}



}
