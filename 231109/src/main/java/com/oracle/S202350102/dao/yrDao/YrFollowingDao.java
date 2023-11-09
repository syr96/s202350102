package com.oracle.S202350102.dao.yrDao;

import com.oracle.S202350102.dto.Following;

public interface YrFollowingDao {

	int 	selectFollowingYN(Following fwi);
	int 	deleteFollowing(Following fwi);
	int 	insertFollowing(Following fwi);

}
