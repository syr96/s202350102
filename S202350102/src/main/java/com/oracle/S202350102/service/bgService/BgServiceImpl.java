package com.oracle.S202350102.service.bgService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dao.bgDao.BgDao;
import com.oracle.S202350102.dto.Board;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BgServiceImpl implements BkService {
	
	public final BgDao	bd;

	@Override
	public List<Board> boardCert(Board board) {
		
		List<Board> certBoard = null;
		System.out.println("BkServiceImpl certBoard Start...");
		certBoard = bd.boardCert(board);
		System.out.println("BkServiceImpl certBoard.size() -> "+certBoard.size());
		return certBoard;
	}

}
