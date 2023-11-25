package com.oracle.S202350102.dao.thDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.S202350102.dto.Order1;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ThOrder1DaoImpl implements ThOrder1Dao {
	// Mybatis DB 연동
	private final SqlSession session;

	@Override
	public int insertOrder(Order1 order1) {
		System.out.println("ThOrder1DaoImpl insertOrder start...");
		int insertResult = 0;
		try {
			insertResult = session.insert("thOrderInsert", order1);
		}catch (Exception e) {
			System.out.println("ThOrder1DaoImpl thOrderInsert Exception --> " + e.getMessage());
		}
		return insertResult;
	}

	@Override
	public int selectMaxOrderNum() {
		System.out.println("ThOrder1DaoImpl selectOrder start...");
		int max_order_num = 0;
		try {
			max_order_num = session.selectOne("thSelectMaxOrderNum");
		}catch (Exception e) {
			System.out.println("ThOrder1DaoImpl max_order_num Exception --> " + e.getMessage());
		}
		return max_order_num;
	}

	@Override
	public Order1 selectOrderJoinMem(Order1 order1) {
		System.out.println("ThOrder1DaoImpl selectOrderJoinMem start...");
		Order1 orderResult = null;
		try {
			orderResult = session.selectOne("thSelectOrderJoinMem",order1);
		}catch (Exception e) {
			System.out.println("ThOrder1DaoImpl selectOrderJoinMem Exception --> " + e.getMessage());
		}
		return orderResult;
	}

	@Override
	public int updateOrderSucess(int order_num) {
		System.out.println("ThOrder1DaoImpl updateOrderSucess start...");
		int updateResult = 0;
		try {
			updateResult = session.selectOne("thUpdateOrderSucess",order_num);
		}catch (Exception e) {
			System.out.println("ThOrder1DaoImpl updateOrderSucess Exception --> " + e.getMessage());
		}
		return updateResult;
	}

	@Override
	public Order1 selectOrderSucess(int user_num) {
		System.out.println("ThOrder1DaoImpl selectOrderSucess start...");
		Order1 order1 = null;
		try {
			order1 = session.selectOne("thSelectOrderSucess",user_num);
		}catch (Exception e) {
			System.out.println("ThOrder1DaoImpl selectOrderSucess Exception --> " + e.getMessage());
		}
		return order1;
	}
	
	
}
