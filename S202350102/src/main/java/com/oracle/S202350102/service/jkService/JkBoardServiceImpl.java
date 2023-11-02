package com.oracle.S202350102.service.jkService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dao.jkDao.JkBoardDao;
import com.oracle.S202350102.dto.Board;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class JkBoardServiceImpl implements JkBoardService {

	private final JkBoardDao jbd;
	
	@Override
	public List<Board> Sharing(Board board) {
		List<Board> Sharing = null;
		System.out.println("JkCommunityServiceImpl start...");
		Sharing = jbd.Sharing(board);
		System.out.println("JkCommunityServiceImpl Sharing.size()-->"+Sharing.size());
		return Sharing ;
	}

}
