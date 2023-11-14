package com.oracle.S202350102.service.thService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dao.thDao.ThChgDao;
import com.oracle.S202350102.dto.Challenge;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ThChgServiceImpl implements ThChgService {

	private final ThChgDao tcd;
	
	@Override
	public int totalChg() {
			System.out.println("thChgServiceImpl totalChg Start... ");
			int totChgCnt = tcd.totalChg();
			System.out.println("thChgServiceImpl totalChg totChgCnt --> ... " + totChgCnt);
		return totChgCnt;
	}

	@Override
	public List<Challenge> listChg(Challenge chg) {
			System.out.println("ThChgServiceImpl listChg Start... ");
			List<Challenge> chgList = tcd.listChg(chg);
			System.out.println("ThChgServiceImpl listChg chgList.size() --> " + chgList.size());
		return chgList;
	}

}
