package com.oracle.S202350102.dao.bgDao;

import java.util.List;

import com.oracle.S202350102.dto.Board;

public interface BgDao {

	List<Board> boardCert(Board board);
	int         insertCertBrd(Board board);

}
