package com.oracle.S202350102.service.thService;

import java.util.List;

import com.oracle.S202350102.dto.Challenge;

public interface ThChgService {

	int				 	totalChg();
	List<Challenge> 	listChg(Challenge chg);

}
