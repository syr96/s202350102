package com.oracle.S202350102.service.chService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.Challenge;
import com.oracle.S202350102.dto.SearchHistory;

public interface ChSearchService {

	int 				saveWord(SearchHistory sh);
	List<Challenge> 	chgSearching(String srch_word);
	List<Board> 		brdSearching(String srch_word);
	List<SearchHistory> sHistoryList(int user_num);
	void 				updateHistory(SearchHistory sh);
	
}
