package com.oracle.S202350102.service.jkService;

import org.springframework.ui.Model;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.User1;

public interface JkUserService {
	int 		updateUser1(User1 user1);
	User1 		getUserDetails(int user_num);
	User1 		userSelect(int user_num);
	



}
