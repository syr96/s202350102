package com.oracle.S202350102.service.thService;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dao.thDao.ThUser1Dao;
import com.oracle.S202350102.dto.User1;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ThUser1ServiceImpl implements ThUser1Service {
	
	private final ThUser1Dao ud1;
	
	@Override
	public int insertUser1(User1 user1) {
		System.out.println("ThUser1ServiceImpl insertUser1 start... ");
		int result = ud1.insertUser1(user1);
		System.out.println("ThUser1ServiceImpl insertUser1 result --> " + result);
		return result;
	}

	
	@Override
	public User1 login(User1 user1) {
		System.out.println("ThUser1ServiceImpl login start...");
		User1 loginUser = ud1.login(user1);
		System.out.println("ThUser1ServiceImpl loginUser --> " + loginUser);
		return loginUser;
	}


	@Override
	public int deleteUser(User1 user1) {
		System.out.println("ThUser1ServiceImpl deleteUser start... ");
		int deleteUserCnt = ud1.deleteUser(user1);
		System.out.println("ThUser1ServiceImpl deleteUserCnt result --> " + deleteUserCnt);
		return deleteUserCnt;
	}

}
