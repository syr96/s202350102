package com.oracle.S202350102.dao.thDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ThOrder1DaoImpl implements ThOrder1Dao {
	// Mybatis DB 연동
	private final SqlSession session;
	
	@Override
	public int insertOrder1(int user_num, Object kakaoSucInfo) {
		int result = 0;
		System.out.println("ThOrder1DaoImpl insertOrder1 Start ...");
		
		try {
			result = session.insert("thInsertOrder1", user_num);
		} catch (Exception e) {
			System.out.println("ThOrder1DaoImpl insertOrder1 Exception --> " + e.getMessage());
		}
		
		return result;
	}

}
