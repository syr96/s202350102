package com.oracle.S202350102.dao.jkDao;

import com.oracle.S202350102.dto.User1;

public interface JkUser1Dao {

	int 		updateUser1(User1 user1);
	User1	 	getUserDetails(String user_id);
	User1 		userSelect(int user_num);

}
