package com.beetmall.sshj.admin.vo;

public class ReportListVO {
	//--신고번호,     게시판,       내용,                신고일,      처리일,             신고유형,       신고인, 신고받은이
	//--reportnum, reportboard, reportcontent, reportreason, reportdate, completedate, reportselect, userid, reporteduser
	private int reportnum;
	private String reportboard;
	private String reportcontent;
	private String reportdate;
	private String completedate;
	private int reportselect;
	private String userid;
	private String reporteduser;
	private String reportreason;
	private int reportboardnum;
	private String reportstart;
	private String reportfin;
	private int count;
	
	public int getReportnum() {
		return reportnum;
	}
	public void setReportnum(int reportnum) {
		this.reportnum = reportnum;
	}
	public String getReportboard() {
		return reportboard;
	}
	public void setReportboard(String reportboard) {
		this.reportboard = reportboard;
	}
	public String getReportcontent() {
		return reportcontent;
	}
	public void setReportcontent(String reportcontent) {
		this.reportcontent = reportcontent;
	}
	public String getReportdate() {
		return reportdate;
	}
	public void setReportdate(String reportdate) {
		this.reportdate = reportdate;
	}
	public String getCompletedate() {
		return completedate;
	}
	public void setCompletedate(String completedate) {
		this.completedate = completedate;
	}
	public int getReportselect() {
		return reportselect;
	}
	public void setReportselect(int reportselect) {
		this.reportselect = reportselect;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getReporteduser() {
		return reporteduser;
	}
	public void setReporteduser(String reporteduser) {
		this.reporteduser = reporteduser;
	}
	public String getReportreason() {
		return reportreason;
	}
	public void setReportreason(String reportreason) {
		this.reportreason = reportreason;
	}
	public int getReportboardnum() {
		return reportboardnum;
	}
	public void setReportboardnum(int reportboardnum) {
		this.reportboardnum = reportboardnum;
	}
	public String getReportstart() {
		return reportstart;
	}
	public void setReportstart(String reportstart) {
		this.reportstart = reportstart;
	}
	public String getReportfin() {
		return reportfin;
	}
	public void setReportfin(String reportfin) {
		this.reportfin = reportfin;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}
