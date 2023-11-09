package com.oracle.S202350102.dao.yrDao;

import java.util.Date;
import java.util.List;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.Challenger;
import com.oracle.S202350102.dto.User1;

public interface YrChallengerDao {
	List<User1> 	getListSsj(int chg_id);
//	String 			getBoardRegDate(int chg_id);
	int 			insertChgr(Challenger chgr);
	int 			selectChgrParti(int chg_id);
	int 			selectChgrJoinYN(Challenger chgr);

}
