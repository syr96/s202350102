package com.oracle.S202350102.dao.chDao;

import java.util.List;

import com.oracle.S202350102.dto.Challenge;
import com.oracle.S202350102.dto.Challenger;
import com.oracle.S202350102.dto.Comm;

public interface ChChallengeDao {
	List<Challenge> popChgList();
	List<Comm> 		chgCommList();
	int 			chgInsertComm(String ctn);
	int 			chgDeleteChg(String[] ctn);
	List<Challenge> myChgList(int user_num);
	List<Challenger> myChgrList(int user_num);
}
