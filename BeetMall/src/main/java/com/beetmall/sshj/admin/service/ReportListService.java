package com.beetmall.sshj.admin.service;

import java.util.List;

import com.beetmall.sshj.admin.vo.ReportListVO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;

public interface ReportListService {

	public int csreportOnetotalRecord(adminkPageSearchVO pageVO);

	public List<ReportListVO> csreportList(adminkPageSearchVO pageVO);

}
