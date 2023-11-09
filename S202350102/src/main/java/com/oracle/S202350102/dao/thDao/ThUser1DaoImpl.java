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
		System.out.println("User1DaoImpl loginstart Start...");
		return session.selectOne("thLogin", user1);
	}

	@Override
	public int deleteUser(User1 user1) {
		System.out.println("User1DaoImpl deleteUser Start...");
		int deleteUserCnt = 0;
		try {
			deleteUserCnt = session.update("thDeleteUser1",user1);
		} catch (Exception e) {
			System.out.println("User1DaoImpl deleteUser Exception --> " + e.getMessage());
		}
		
		return deleteUserCnt;
	}

	@Override
	public int updateUserPrem(int user_num) {
		System.out.println("User1DaoImpl updateUserPrem Start...");
		System.out.println("User1DaoImpl updateUserPrem user_num --> " + user_num);
		int updateCount = 0;
		try {
			updateCount = session.update("thUser1PremUpdate", user_num);
		} catch (Exception e) {
			System.out.println("User1DaoImpl updateUserPrem Exception --> " + e.getMessage());
		}
		
		return updateCount;
	}

	@Override
	public int user1IdCheck(String user_id) {
		System.out.println("User1DaoImpl user1IdCheck Start...");
		System.out.println("User1DaoImpl user1IdCheck user_id --> " + user_id);
		int	result = 0;
		try {
			result = session.selectOne("thUser1IdCheck", user_id);
		} catch (Exception e) {
			System.out.println("User1DaoImpl user1IdCheck Exception --> " + e.getMessage());
		}
		
		return result;
	}

	@Override
	public int user1NickCheck(String nick) {
		System.out.println("User1DaoImpl user1NickCheck Start...");
		System.out.println("User1DaoImpl user1NickCheck nick --> " + nick);
		int	result = 0;
		try {
			result = session.selectOne("thUser1NickCheck", nick);
		} catch (Exception e) {
			System.out.println("User1DaoImpl user1NickCheck Exception --> " + e.getMessage());
		}
		
		return result;
	}
	
	
}
