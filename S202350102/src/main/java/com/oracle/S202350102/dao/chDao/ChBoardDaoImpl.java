package com.oracle.S202350102.dao.chDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.S202350102.dto.Board;

import lombok.Data;

@Repository
@Data
public class ChBoardDaoImpl implements ChBoardDao {
	
	private final SqlSession session;
	
	
	@Override
	public int noticeCount(int brd_md) {
		int noticeCount = 0;
		
		try {
			noticeCount = session.selectOne("noticeCount", brd_md);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("chBoardDaoImpl noticeCount e.getMessage->" + e.getMessage());
		}
		return noticeCount;
	}
	
	
	
	@Override
	public List<Board> noticeList(Board board) {
		System.out.println("chBoardDaoImpl noticeList Start...");
		List<Board> noticeList =null;
		try {
			noticeList = session.selectList("noticeList",board);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("chBoardDaoImpl noticeList e.getMessage->" + e.getMessage());
		}
		
		System.out.println("chBoardDaoImpl noticeList.size()->"+noticeList.size());
		return noticeList;
	}

	@Override
	public int noticeWrite(Board board) {
		System.out.println("chBoardDaoImpl noticeWrite Start...");
		int result = 0;
		
		try {
			result = session.insert("noticeWrite", board);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("chBoardDaoImpl noticeWrite e.getMessage->" + e.getMessage());
		}
		
		
		return result;
	}

	@Override
	public Board noticeConts(int brd_num) {
		System.out.println("chBoardDaoImpl noticeConts Start...");
		Board noticeCont = null;
		
		try {
			noticeCont = session.selectOne("noticeCont",brd_num);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("chBoardDaoImpl noticeConts e.getMessage->" + e.getMessage());
		}
		
		return noticeCont;
	}

	@Override
	public int noticeUpdate(Board board) {
		System.out.println("chBoardDaoImpl noticeUpdate Start...");
		int result = 0;
		
		try {
			result= session.update("noticeUpdate", board);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("chBoardDaoImpl noticeUpdate e.getMessage->" + e.getMessage());
		}
		
		return result;
	}

	@Override
	public int deleteNotice(int brd_num) {
		System.out.println("chBoardDaoImpl deleteNotice Start...");
		
		int result = 0;
		
		try {
			result = session.delete("deleteNotice", brd_num);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("chBoardDaoImpl deleteNotice e.getMessage->" + e.getMessage());
		}
		return result;
	}

	@Override
	public void noticeViewUp(int brd_num) {
		System.out.println("chBoardDaoImpl noticeViewUp Start...");

		try {
			session.update("noticeViewUp", brd_num);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("chBoardDaoImpl noticeViewUp e.getMessage->" + e.getMessage());
		}
		
	}

	@Override
	public List<Board> popBoardList() {
		System.out.println("chBoardDaoImpl noticeViewUp Start...");
		List<Board> popBoardList = null;
		
		try {
			popBoardList = session.selectList("popBoardList");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("chBoardDaoImpl popBoardList e.getMessage->" + e.getMessage());
		}
		
		
		return popBoardList;
	}

	


}
