 package com.beetmall.sshj.admin.vo;
 
 import org.springframework.util.MimeType;

public class AdminBoardVO {
	private String userid;
	private int infonum;
	private String infotitle;
	private String infocontent;
	private String infowritedate;
	private int infohit;
	private int infotype;
	private String filename;
	private MimeType infofiletype;
	
	public int getInfonum() {
		return infonum;
	}
	public void setInfonum(int infonum) {
		this.infonum = infonum;
	}
	public String getInfotitle() {
		return infotitle;
	}
	public void setInfotitle(String infotitle) {
		this.infotitle = infotitle;
	}
	public String getInfocontent() {
		return infocontent;
	}
	public void setInfocontent(String infocontent) {
		this.infocontent = infocontent;
	}
	public String getInfowritedate() {
		return infowritedate;
	}
	public void setInfowritedate(String infowritedate) {
		this.infowritedate = infowritedate;
	}
	public int getInfohit() {
		return infohit;
	}
	public void setInfohit(int infohit) {
		this.infohit = infohit;
	}
	public int getInfotype() {
		return infotype;
	}
	public void setInfotype(int infotype) {
		this.infotype = infotype;
	} 
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;  
	}
	public MimeType getInfofiletype() {
		return infofiletype;
	}
	public void setInfofiletype(String t) {
		this.infofiletype = new MimeType(t);
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
}	 