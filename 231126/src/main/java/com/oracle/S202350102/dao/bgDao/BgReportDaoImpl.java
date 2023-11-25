package com.oracle.S202350102.dao.bgDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.S202350102.dto.Report;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BgReportDaoImpl implements BgReportDao {

	private final SqlSession session;

	@Override
	public Report recordANDCnt(Report burning) {
		
		burning = null;
		
		try {
			burning = session.selectOne("recordANDCnt", burning);
			
			System.out.println("BgReportDaoImpl selBurningRecord burning.getCnt() -> " + burning.getCnt());
			System.out.println("BgReportDaoImpl selBurningRecord burning.getBurningRecord() -> " + burning.getBurningRecord());
			
		} catch (Exception e) {
			System.out.println("BgReportDaoImpl selBurningRecord e.getMessage() -> " + e.getMessage());
		}
		
		return burning;
	}

	
	// 현재 급하게 mapper 에 하드 코딩 했지만, 시간 될 때 여기서 값을 줄 것. + 설명 주석 붙이기
	@Override
	public int insBurningRecord(Report burning) {
		
		int result = 0;
		
		try {
			result = session.insert("insBurningRecord", burning);
		} catch (Exception e) {
			System.out.println("BgReportDaoImpl selBurningRecord e.getMessage() -> " + e.getMessage());
			result = 1;
		}
		
		return result;
	}


	@Override
	public int updateCnt(Report resultrecordANDCnt) {
		
		int result = 0;
		
		try {
			result = session.update("updateCnt", resultrecordANDCnt);
		} catch (Exception e) {
			System.out.println("BgReportDaoImpl updateCnt e.getMessage() -> " + e.getMessage());
		}
		
		return result;
	}
	
}
