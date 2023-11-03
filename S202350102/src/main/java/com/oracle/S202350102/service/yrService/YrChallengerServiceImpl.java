package com.oracle.S202350102.service.yrService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dao.yrDao.YrChallengerDao;
import com.oracle.S202350102.dto.Challenger;
import com.oracle.S202350102.dto.User1;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class YrChallengerServiceImpl implements YrChallengerService {
	private final YrChallengerDao ycd;

	@Override
	public List<User1> getListSsj(int chg_id) {
		System.out.println("YrChallengerServiceImpl listSsj Start...");
		List<User1> listSsj = ycd.listSsj(chg_id); 
		return listSsj;
	}

	@Override
	public int insertChgr(Challenger chgr) {
		System.out.println("YrChallengerServiceImpl insertChgr Start...");
		int insertChgr = ycd.insertChgr(chgr);
		return insertChgr;
	}

	@Override
	public int selectChgrParti(int chg_id) {
		System.out.println("YrChallengerServiceImpl selectChgrParti Start...");
		int selectChgrParti = ycd.selectChgrParti(chg_id);
		return selectChgrParti;
	}

	@Override
	public int selectChgrJoinYN(Challenger chgr) {
		System.out.println("YrChallengerServiceImpl selectChgrJoinYN Start...");
		int selectChgrJoinYN = ycd.selectChgrJoinYN(chgr);
		return selectChgrJoinYN;
	}

}