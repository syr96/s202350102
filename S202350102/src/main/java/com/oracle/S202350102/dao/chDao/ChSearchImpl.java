package com.oracle.S202350102.dao.chDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.Challenge;
import com.oracle.S202350102.dto.SearchHistory;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ChSearchImpl implements ChSearchDao {
	
	private final SqlSession session;


	@Override
	public int saveWord(SearchHistory sh) {
		System.out.println("ChSearchImpl saveWord Start..");
		
		int saveResult = 0;
		try {
			saveResult = session.insert("saveWord", sh);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ChSearchImpl saveWord e.getMessage()->" + e.getMessage());
		}		
		
		return saveResult;
	}


	@Override
	public List<Challenge> chgSearching(String srch_word) {
		System.out.println("ChSearchImpl chgSearching Start..");
		List<Challenge> srch_chgresult = null;
		
		try {
			srch_chgresult = session.selectList("chgResult",srch_word);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ChSearchImpl chgSearching e.getMessage()->" + e.getMessage());
		}
		
		return srch_chgresult;
	}


	@Override
	public List<Board> brdSearching(String srch_word) {
		System.out.println("ChSearchImpl brdSearching Start..");
		
		List<Board> srch_brdResult = null;
		
		
		try {
			srch_brdResult = session.selectList("BrdResult",srch_word);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ChSearchImpl chgSearching e.getMessage()->" + e.getMessage());
		}
		
		return srch_brdResult;
	}

}
