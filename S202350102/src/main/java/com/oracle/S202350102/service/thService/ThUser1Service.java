package com.oracle.S202350102.service.thService;



import com.oracle.S202350102.dto.User1;


public interface ThUser1Service {
	int			insertUser1(User1 user1);

	User1		login(User1 user1);

	int 		deleteUser(User1 user1);
	
	
}
