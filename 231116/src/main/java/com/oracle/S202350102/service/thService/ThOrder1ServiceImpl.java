package com.oracle.S202350102.service.thService;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dao.thDao.ThOrder1Dao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ThOrder1ServiceImpl implements ThOrder1Service {

	private final ThOrder1Dao od1;
	
	@Override
	public int insertOrder1(int user_num, Object kakaoSucInfo) {
		
		System.out.println("ThOrder1ServiceImpl insertOrder1 Start...");
		int result = od1.insertOrder1(user_num, kakaoSucInfo);
		System.out.println("ThOrder1ServiceImpl insertOrder1 result --> " + result);
		return result;
	}

}
