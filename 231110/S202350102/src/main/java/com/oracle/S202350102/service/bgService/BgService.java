package com.oracle.S202350102.service.bgService;

import java.util.List;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.Challenge;

public interface BgService {

	List<Board> boardCert(Board board);
	int         insertCertBrd(Board board);
	Challenge   bgChgDetail(int chg_id);
	int         totalCert();
	List<Board> certBoard(Board board);
	int         updateCertBrd(Board board);
	int         deleteCertBrd(int brd_num);

}
