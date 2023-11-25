package com.oracle.S202350102.service.bgService;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dao.bgDao.BgReportDao;
import com.oracle.S202350102.dto.Report;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BgReportServiceImpl implements BgReportService {

	public final BgReportDao bReportD;
	
	
	@Override
	public int burning(Report burning) {
		
		// 1. 태워요 전적 및 현재 CNT 조회
		Report resultrecordANDCnt = bReportD.recordANDCnt(burning);
		
		System.out.println("BgReportDaoImpl selBurningRecord burning.getCnt() -> " + resultrecordANDCnt.getCnt());
		System.out.println("BgReportDaoImpl selBurningRecord burning.getBurningRecord() -> " + resultrecordANDCnt.getBurningRecord());
		System.out.println("BgReportDaoImpl selBurningRecord burning.getBrd_num() -> " + resultrecordANDCnt.getBrd_num());
		System.out.println("BgReportDaoImpl selBurningRecord burning.getUser_num() -> " + resultrecordANDCnt.getUser_num());
		
		int result = 0;
		
		// 1-1. 신고 전적이 없으면 새로운 레코드 삽입
		if(resultrecordANDCnt.getBurningRecord() == 0) {
			bReportD.insBurningRecord(burning);
			result = 1;
		} else {
		// 1-2. 신고 전적이 있으면 CNT 값에 따라서 업데이트 수행
			bReportD.updateCnt(resultrecordANDCnt);
			result = 2;
		}
		return result;
	}
}
