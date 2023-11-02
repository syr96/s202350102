package com.oracle.S202350102.dao.yrDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.S202350102.dto.User1;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class YrChallengerDaoImpl implements YrChallengerDao {
	private final SqlSession session;
	
	@Override
	public List<User1> listSsj(int chg_id) {
		List<User1> listSsj = null; 
		System.out.println("YrChallengerDaoImpl listSsj Start...");
		try {
			listSsj = session.selectList("yrUser1ListSsj", chg_id);
			System.out.println(listSsj);
		} catch (Exception e) {
			System.out.println("YrChallengerDaoImpl listSsj e.getMessage() -> " + e.getMessage());
		}
		return listSsj;
	}

}
