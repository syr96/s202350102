package com.oracle.S202350102.service.main;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dao.mainDao.UserDao;
import com.oracle.S202350102.dto.User1;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
	private final UserDao ud;

	@Override
	public User1 userSelect(String user_id) {
		User1 user = ud.userSelect(user_id);
		return user;
	}
	
}
