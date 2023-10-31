package com.oracle.S202350102.service.thService;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dao.thDao.User1Dao;
import com.oracle.S202350102.dto.User1;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class User1ServiceImpl implements User1Service {
	
	private final User1Dao ud1;
	
	@Override
	public int insertUser1(User1 user1) {
		System.out.println("User1ServiceImpl insertUser1 start... ");
		int result = ud1.insertUser1(user1);
		System.out.println("User1ServiceImpl insertUser1 result --> " + result);
		return result;
	}

	
	@Override
	public boolean login(User1 user1) {
		System.out.println("User1ServiceImpl login start...");
		User1 loginUser = ud1.login(user1);
		System.out.println("User1ServiceImpl loginUser -- >" + loginUser);
		if (loginUser != null) {
			return true;	
		} else {
			return false;
		}
	}

}
