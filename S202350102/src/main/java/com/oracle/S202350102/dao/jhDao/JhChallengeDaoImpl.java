package com.oracle.S202350102.dao.jhDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.S202350102.dto.Challenge;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class JhChallengeDaoImpl implements JhChallengeDao {
	
	private final SqlSession session;

	@Override
	public Challenge jhChgDetail(int chg_id) {
		System.out.println("JhChallengeDaoImpl jhChgDetail Start...");

		Challenge chg = null;
		
		System.out.println("JhChallengeDaoImpl jhChgDetail  chg_id -> "+ chg_id);
		
		try {
			
			chg = session.selectOne("JhChgDetail", chg_id);
			
			System.out.println("JhChallengeDaoImpl jhChgDetail  chg -> "+ chg);
			
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl jhChgDetail e.getMessage() -> "+ e.getMessage());

		}
		
		return chg;
	}

}
