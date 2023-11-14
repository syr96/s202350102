package com.oracle.S202350102.dao.yaDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.SharingList;
import com.oracle.S202350102.dto.User1;

import lombok.RequiredArgsConstructor;
@Repository
@RequiredArgsConstructor
public class YaBoardDaoImpl implements YaBoardDao {
		
	private final SqlSession session;

	@Override
	public List<Board> listCommunity(Board board) {
		
		// board테이블 community게시판 조회
		List<Board> listCommunity = null;
		System.out.println("YaBoardDaoImpl listCommunity start...");
		try {
			listCommunity = session.selectList("listCommunity", board);
			System.out.println("YaBoardDaoImpl listCommunity communityList.size()?"+listCommunity.size());
		} catch (Exception e) {
			System.out.println("YaBoardDaoImpl listCommunity e.getMessage()?"+e.getMessage());
		}
		
		return listCommunity;
	}
	

	
	@Override
	// board테이블 community 게시판 상세글 내용 확인
	public Board detailCommunity(int brd_num) {
		System.out.println("YaBoarDaoImpl detail start...");
		Board board = new Board();
		try {
			board = session.selectOne("YaCommunityOne", brd_num);
		} catch (Exception e) {
			System.out.println("YaBoarDaoImpl detai e.getMessage)?"+e.getMessage());
		}
		return board;
	}
	
	// 게시글 조회수 증가
	@Override
	public void upViewCnt(int brd_num) {
		System.out.println("YaBoardDaoImpl upViewCnt start...");
		 	
		try {
			session.update("YaBoardUpviewCnt" , brd_num);
		} catch (Exception e) {
			System.out.println("YaBoarDaoImpl void upViewCnt e.getMessage)?"+e.getMessage());
		}
		
	}
	
	

	@Override
	public int insertCommunity(Board board) {
		
		int insertResult =0;
		System.out.println("YaBoardDaoImpl insertCommunity start..");
		try {
			insertResult = 	session.insert("YaBoardInsert", board);
		} catch (Exception e) {
			System.out.println("YaBoarDaoImpl void upViewCnt e.getMessage?"+e.getMessage());
		}
		return insertResult;

		
	}

	@Override
	public int updateCommunity(Board board) {
		int updateCommunity =0;
		System.out.println("YaBoardDaoImpl updateCommunity start...");
		
		try {
			updateCommunity = session.update("YaBoardUpdate", board);
			
		} catch (Exception e) {
			System.out.println("YaBoardDaoImpl updateCommunity e.getMessage?"+e.getMessage());
		}
		return updateCommunity;
	}

	@Override
	public int deleteCommunity(int brd_num) {
		int deleteResult=0;
		System.out.println("YaBoardDaoImpl deleteCommunity start...");
		
		try {
			deleteResult = session.delete("YaBoardDelete", brd_num);
		} catch (Exception e) {
			System.out.println("YaBoardDaoImpl deleteCommunity e.getMessage?"+e.getMessage());
		}
		return deleteResult;
	}

	@Override
	public List<Board> boardSearchList(String keyword) {
		List<Board> boardSearchList = null;
		System.out.println("YaBoardDaoImpl boardSearchList start....");
		
		try {
			boardSearchList = session.selectList("YaBoardSearhList", keyword);
			
		} catch (Exception e) {
			System.out.println("YaBoardDaoImpl boardSearchList e.getMessage?"+e.getMessage());
		}
		return boardSearchList;
	}
	@Override
	public List<Board> sortByViewCnt() {
		List<Board> sortByViewCnt = null;
        try {
            return session.selectList("sortByViewCnt");
        } catch (Exception e) {
        	System.out.println("YaBoardDaoImpl sortByViewCnt() e.getMessage?"+e.getMessage());
            return sortByViewCnt;
        }
	}

	@Override
	public List<Board> sortByRegDate() {
		List<Board> sortByRegDate =null;
		try {
	          return session.selectList("sortByRegDate");
	        } catch (Exception e) {
	          	System.out.println("YaBoardDaoImpl sortByRegDate() e.getMessage?"+e.getMessage());
	            return sortByRegDate;
	        }
	}

	@Override
	public User1 userSelect(int user_num) {
		User1 user = new User1();
		try {
			System.out.println("user_num->"+user_num);
			user = session.selectOne("userSelect",user_num);
			System.out.println("user->"+user);
		} catch (Exception e) {
			System.out.println("UserDaoImpl userSelect exception->"+e.getMessage());
		}
		return user;
	}
	// 댓글 조회
	@Override
	public List<Board> listComment(int brd_num) {
		List<Board> listComment = null;
		try {
			System.out.println("YaBoardDaoImpl listComment start....");
			listComment = session.selectList("listComment",brd_num);
		} catch (Exception e) {
			System.out.println("YaBoardDaoImpl listComment e.getMessage?"+e.getMessage());
		}
		return listComment;
	}

	@Override
	public void commentWrite(Board board) {
		System.out.println("YaBoardDaoImpl commentWrite start...");
	 	
		try {
			session.insert("YacommentWrite", board);
		} catch (Exception e) {
			System.out.println("YaBoarDaoImpl void commentWrite e.getMessage)?"+e.getMessage());
		}
		
	}

	@Override
	public void commentUpdate(Board board) {
		System.out.println("YaBoardDaoImpl commentUpdate start...");
		try {
			session.update("YaCommentUpdate", board);
		} catch (Exception e) {
			System.out.println("YaBoarDaoImpl void YaCommentUpdate e.getMessage)?"+e.getMessage());
		}
		
	}

	@Override
	public void commentDelete(Board board) {
		System.out.println("YaBoardDaoImpl commentDelete start...");
		try {
			session.delete("YaCommentDelete",board);
		} catch (Exception e) {
			System.out.println("YaBoarDaoImpl void YaCommnetDelte e.getMessage)?"+e.getMessage());
		}
			
	}

	@Override
	public int getLatestBrdStep(int brd_group) {
		System.out.println("YaBoardDaoImpl getLatestBrdStep start...");
		int getLatestBrdStep = 0;
		try {
			session.selectOne("YaGetLatestBrdStep",brd_group);
			
		} catch (Exception e) {
			System.out.println("YaBoarDaoImpl etLatestBrdStep e.getMessage)?"+e.getMessage());
		}
		return getLatestBrdStep;
	}

	@Override
	public int commentCount(int brd_num) {
		System.out.println("YaBoardDaoImpl getLatestBrdStep start...");
		int commentCount = 0;
		try {
			session.selectOne("YaCommentTotal",brd_num);
		} catch (Exception e) {
			System.out.println("YaBoarDaoImpl commentCount e.getMessage)?"+e.getMessage());
		}
		return commentCount;
	}


	// 총 게시글 
	@Override
	public int totalCommunity(Board board) {
		System.out.println("YaBoardDaoImpl totalCommunity start....");
		int totalCommunity = 0;
		try {
			totalCommunity = session.selectOne("YaTotalCommunity");
		} catch (Exception e) {
			System.out.println("YaBoardDao YaTotalCommunity e.getmmessage?"+e.getMessage());
		}
		return totalCommunity;
	}


	// 쉐어링리스트 등록
	@Override
	public int saveSharing(SharingList sharingList) {
		System.out.println("YaBoardDaoImpl saveSahing  start....");
		int saveSharing = 0;
		try {
			saveSharing = session.insert("YaSharingSave", sharingList);
		} catch (Exception e) {
			System.out.println("YaBoardDao saveSahing e.getmmessage?"+e.getMessage());
		}
		return saveSharing;
	}




}

	
	


	


