package com.oracle.S202350102.dao.thDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.S202350102.dto.User1;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class User1DaoImpl implements User1Dao {
	// Mybatis DB 연동
	private final SqlSession session;

	@Override
	public int insertUser1(User1 user1) {
		System.out.println("User1DaoImpl insertUser1 start...");
		int result = 0;
		try {
			result = session.insert("insertUser1", user1);
		} catch (Exception e) {
			System.out.println("User1DaoImpl insertUser1 Exception --> " + e.getMessage());
		}
		return result;
		
	}

	@Override
	public User1 login(User1 user1) {
		System.out.println("User1DaoImpl loginstart...");
		return session.selectOne("login", user1);
	}
	
	
}
