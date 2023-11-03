package com.oracle.S202350102.dao.jkDao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.User1;

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

	@Override
	public User1 userSelect(int user_num) {
		 return session.selectOne("userSelect", user_num);
	}

		
	@Override
	public Board getboardBybrd_num(int brd_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean getLikeStatus(int brd_num) {
	    try {
	        return session.selectOne("getLikeStatus", brd_num);
	    } catch (Exception e) {
	        System.out.println("Error while getting like status: " + e.getMessage());
	        return false;
	    }
	}

	@Override
	 public void updateLikeStatus(int brd_num) {
        System.out.println("MyBatisBoardRepository updateLikeStatus start..." + brd_num);
        session.update("updateLikeStatus", brd_num);
	}
}