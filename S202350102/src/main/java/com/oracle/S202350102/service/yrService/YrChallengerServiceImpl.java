package com.oracle.S202350102.service.yrService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dao.yrDao.YrChallengerDao;
import com.oracle.S202350102.dto.User1;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class YrChallengerServiceImpl implements YrChallengerService {
	private final YrChallengerDao ycd;
	

	@Override
	public List<User1> getListSsj(int chg_id) {
		System.out.println("YrChallengerServiceImpl Start...");
		List<User1> listSsj = ycd.listSsj(chg_id); 
		return listSsj;
	}

}
