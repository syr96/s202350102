package com.oracle.S202350102.dao.bgDao;

import com.oracle.S202350102.dto.Report;

public interface BgReportDao {

	Report recordANDCnt(Report report);
	int insBurningRecord(Report burning);
	int updateCnt(Report resultrecordANDCnt);

}
