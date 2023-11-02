package com.oracle.S202350102.dao.jkDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;

import com.oracle.S202350102.dto.Board;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class JkBoardDaoImpl implements JkBoardDao {
	
	private final SqlSession session;

	@Override
	public List<Board> Sharing(Board board) {
		// board 테이블 쉐어링게시판조회
		List<Board> Sharing = null;
		System.out.println("JkBoardDaoImpl Sharing start...");
		try {
			Sharing = session.selectList("Sharing", board);
			System.out.println("JkBoardDaoImpl Sharing.size()-->"+Sharing.size());
		} catch (Exception e) {
			System.out.println("JkBoardDaoImpl Sharing e.getMessage()?"+e.getMessage());
		}
		
		return Sharing;
	}
	

}
