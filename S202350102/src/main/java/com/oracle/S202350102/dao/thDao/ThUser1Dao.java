package com.oracle.S202350102.dao.thDao;

import com.oracle.S202350102.dto.User1;

public interface ThUser1Dao {

	int 			insertUser1(User1 user1);
	User1			login(User1 user1);
	int 			deleteUser(User1 user1);

}
