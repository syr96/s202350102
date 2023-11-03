package com.oracle.S202350102.service.jhService;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dao.jhDao.JhChallengeDao;
import com.oracle.S202350102.dto.Challenge;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class JhCallengeServiceImpl implements JhCallengeService {
	
	private final JhChallengeDao jhChgDao;
	
	//챌린지 정보 조회
	@Override
	public Challenge jhChgDetail(int chg_id) {
		System.out.println("JhCallengeServiceImpl jhChgDetail Start...");

		System.out.println("JhCallengeServiceImpl jhChgDetail  chg_id -> "+ chg_id);

		Challenge chg = jhChgDao.jhChgDetail(chg_id);
		
		
		return chg;
	}


	

	
	

}
