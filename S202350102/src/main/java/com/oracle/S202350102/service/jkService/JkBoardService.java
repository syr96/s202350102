package com.oracle.S202350102.service.jkService;

import java.util.List;

import com.oracle.S202350102.dto.Board;

public interface JkBoardService {
	// 쉐어링 게시글 전체
	List<Board> 	Sharing(Board board);

}
