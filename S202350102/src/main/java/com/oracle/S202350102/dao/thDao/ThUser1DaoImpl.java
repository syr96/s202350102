package com.oracle.S202350102.dao.thDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.S202350102.dto.User1;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ThUser1DaoImpl implements ThUser1Dao {
	// Mybatis DB 연동
	private final SqlSession session;

	@Override
	public int insertUser1(User1 user1) {
		System.out.println("User1DaoImpl insertUser1 start...");
		int result = 0;
		try {
			result = session.insert("thInsertUser1", user1);
		} catch (Exception e) {
			System.out.println("User1DaoImpl insertUser1 Exception --> " + e.getMessage());
		}
		return result;
		
	}

	@Override
	public User1 login(User1 user1) {
		System.out.println("User1DaoImpl loginstart...");
		return session.selectOne("thLogin", user1);
	}

	@Override
	public int deleteUser(User1 user1) {
		System.out.println("User1DaoImpl deleteUser...");
		int deleteUserCnt = 0;
		try {
			deleteUserCnt = session.update("thDeleteUser1",user1);
		} catch (Exception e) {
			System.out.println("User1DaoImpl deleteUser Exception --> " + e.getMessage());
		}
		
		return deleteUserCnt;
	}
	
	
}
