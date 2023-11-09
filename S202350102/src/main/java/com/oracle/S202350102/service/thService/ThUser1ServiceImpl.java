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


	@Override
	public int updateUserPrem(int user_num) {
		System.out.println("ThUser1ServiceImpl updateUserPrem Start...");
		int updateCount = ud1.updateUserPrem(user_num);
		System.out.println("ThUser1ServiceImpl updateUserPrem result --> " + updateCount);
		return updateCount;
	}


	@Override
	public int user1IdCheck(String user_id) {
		System.out.println("ThUser1ServiceImpl user1IdCheck Start...");
		System.out.println("ThUser1ServiceImpl user1IdCheck user_id --> " + user_id);
		int result = ud1.user1IdCheck(user_id);
		System.out.println("ThUser1ServiceImpl user1IdCheck result --> " + result);
		return result;
	}


	@Override
	public int user1NickCheck(String nick) {
		System.out.println("ThUser1ServiceImpl user1NickCheck Start...");
		System.out.println("ThUser1ServiceImpl user1NickCheck nick --> " + nick);
		int result = ud1.user1NickCheck(nick);
		System.out.println("ThUser1ServiceImpl user1NickCheck result --> " + result);
		return result;
	}

}
