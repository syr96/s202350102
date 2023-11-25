package com.oracle.S202350102.service.thService;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dao.thDao.ThOrder1Dao;
import com.oracle.S202350102.dto.Order1;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ThOrder1ServiceImpl implements ThOrder1Service {

	private final ThOrder1Dao od1;
	
	@Override
	public int insertOrder(Order1 order1) {
		System.out.println("ThOrder1ServiceImpl insertOrder Start...");
		int insertResult = od1.insertOrder(order1);
		return insertResult;
	}

	@Override
	public int selectMaxOrderNum() {
		System.out.println("ThOrder1ServiceImpl selectOrder Start...");
		int max_order_num = od1.selectMaxOrderNum();
		return max_order_num;
	}

	@Override
	public Order1 selectOrderJoinMem(Order1 order1) {
		System.out.println("ThOrder1ServiceImpl selectOrderJoinMem Start...");
		Order1 orderResult = od1.selectOrderJoinMem(order1);
		return orderResult;
	}

	@Override
	public int updateOrderSucess(int order_num) {
		System.out.println("ThOrder1ServiceImpl updateOrderSucess Start...");
		int	updateResult = od1.updateOrderSucess(order_num);
		System.out.println("ThOrder1ServiceImpl updateOrderSucess updateResult --> " + updateResult);
		return updateResult;
	}


	@Override
	public Order1 selectOrderSucess(int user_num) {
		System.out.println("ThOrder1ServiceImpl selectOrderSucess Start...");
		Order1 order1 = od1.selectOrderSucess(user_num);
		return order1;
	}

}
