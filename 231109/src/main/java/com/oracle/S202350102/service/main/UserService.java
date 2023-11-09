package com.oracle.S202350102.service.main;

import java.util.List;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.User1;
import com.oracle.S202350102.dto.UserLevel;

public interface UserService {

	User1 	  		userSelect(int user_num);
	UserLevel 		userLevelInfo(int user_num);
	List<UserLevel> userLevelInfoList();
	List<Board> 	boardWriterLevelInfo(List<Board> boardList);
}
