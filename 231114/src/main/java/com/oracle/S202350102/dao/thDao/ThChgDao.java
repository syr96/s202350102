package com.oracle.S202350102.dao.thDao;

import java.util.List;

import com.oracle.S202350102.dto.Challenge;

public interface ThChgDao {

	int			 		totalChg();

	List<Challenge> 	listChg(Challenge chg);

}
