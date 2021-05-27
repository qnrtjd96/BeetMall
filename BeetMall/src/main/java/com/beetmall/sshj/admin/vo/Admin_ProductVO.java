package com.beetmall.sshj.admin.vo;

import org.apache.poi.hpsf.Array;

public class Admin_ProductVO {
	private long productnum;
	private String userid;
	private int mcatenum;
	private String productname;
	private int productprice;
	private int saleselet;
	private int saleb;
	private String sellstart;
	private String sellfinish;
	private int totalstock;
	private int nowstock;
	private String thumbimg;
	private String addimg;
	private String productcontent;
	private String deliveryoption;
	private int deliveryprice;
	private String paymentoption;
	private String selloption;
	private String sellweight;
	private String origin;
	private int wrapping;
	private String productinformation;
	private String prevention;
	private String deadline;
	private int optionselect;
	private String productinfomation;
	
	private long optionnum;
	private String optionname;
	private String optionstock;
	private String optionnowstock;
	private String optionprice;
	
	
	private int saleprice;
	private String salestart;
	private String salefinish;
	
	private String catename;
	private String mcatename;
	private int saleselect;
	private long sellprice;
	
	
	
	public String getProductinfomation() {
		return productinfomation;
	}
	public void setProductinfomation(String productinfomation) {
		this.productinfomation = productinfomation;
	}
	public long getSellprice() {
		return sellprice;
	}
	public void setSellprice(long sellprice) {
		this.sellprice = sellprice;
	}
	public int getSaleselect() {
		return saleselect;
	}
	public void setSaleselect(int saleselect) {
		this.saleselect = saleselect;
	}
	public String getMcatename() {
		return mcatename;
	}
	public void setMcatename(String mcatename) {
		this.mcatename = mcatename;
	}
	public String getCatename() {
		return catename;
	}
	public void setCatename(String catename) {
		this.catename = catename;
	}
	public int getOptionselect() {
		return optionselect;
	}
	public void setOptionselect(int optionselect) {
		this.optionselect = optionselect;
	}
	public long getOptionnum() {
		return optionnum;
	}
	public void setOptionnum(long optionnum) {
		this.optionnum = optionnum;
	}
	public String getOptionname() {
		return optionname;
	}
	public void setOptionname(String optionname) {
		this.optionname = optionname;
	}
	public String getOptionstock() {
		return optionstock;
	}
	public void setOptionstock(String optionstock) {
		this.optionstock = optionstock;
	}
	public String getOptionnowstock() {
		return optionnowstock;
	}
	public void setOptionnowstock(String optionnowstock) {
		this.optionnowstock = optionnowstock;
	}
	public String getOptionprice() {
		return optionprice;
	}
	public void setOptionprice(String optionprice) {
		this.optionprice = optionprice;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	public String getSalestart() {
		return salestart;
	}
	public void setSalestart(String salestart) {
		this.salestart = salestart;
	}
	public String getSalefinish() {
		return salefinish;
	}
	public void setSalefinish(String salefinish) {
		this.salefinish = salefinish;
	}
	public long getProductnum() {
		return productnum;
	}
	public void setProductnum(long productnum) {
		this.productnum = productnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getMcatenum() {
		return mcatenum;
	}
	public void setMcatenum(int mcatenum) {
		this.mcatenum = mcatenum;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getProductprice() {
		return productprice;
	}
	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}
	public int getSaleselet() {
		return saleselet;
	}
	public void setSaleselet(int saleselet) {
		this.saleselet = saleselet;
	}
	public int getSaleb() {
		return saleb;
	}
	public void setSaleb(int saleb) {
		this.saleb = saleb;
	}
	public String getSellstart() {
		return sellstart;
	}
	public void setSellstart(String sellstart) {
		this.sellstart = sellstart;
	}
	public String getSellfinish() {
		return sellfinish;
	}
	public void setSellfinish(String sellfinish) {
		this.sellfinish = sellfinish;
	}
	public int getTotalstock() {
		return totalstock;
	}
	public void setTotalstock(int totalstock) {
		this.totalstock = totalstock;
	}
	public int getNowstock() {
		return nowstock;
	}
	public void setNowstock(int nowstock) {
		this.nowstock = nowstock;
	}
	public String getThumbimg() {
		return thumbimg;
	}
	public void setThumbimg(String thumbimg) {
		this.thumbimg = thumbimg;
	}
	public String getAddimg() {
		return addimg;
	}
	public void setAddimg(String addimg) {
		this.addimg = addimg;
	}
	public String getProductcontent() {
		return productcontent;
	}
	public void setProductcontent(String productcontent) {
		this.productcontent = productcontent;
	}
	public String getDeliveryoption() {
		return deliveryoption;
	}
	public void setDeliveryoption(String deliveryoption) {
		this.deliveryoption = deliveryoption;
	}
	public int getDeliveryprice() {
		return deliveryprice;
	}
	public void setDeliveryprice(int deliveryprice) {
		this.deliveryprice = deliveryprice;
	}
	public String getPaymentoption() {
		return paymentoption;
	}
	public void setPaymentoption(String paymentoption) {
		this.paymentoption = paymentoption;
	}
	public String[] getSelloption() {
		String result[] = new String[2];
		if(selloption.indexOf("팩") >= 0) {
			int index = selloption.indexOf("팩");
			result[0] = selloption.substring(0, index);
			result[1] = selloption.substring(index);
			
		} else if(selloption.indexOf("박스") >= 0){
			int index = selloption.indexOf("박스");
			if(index == 0) {
				result[0] = "";
				result[1] = "박스";
			}else {
				result[0] = selloption.substring(0, index);
				result[1] = selloption.substring(index);
			}
		
		} else {
			result[0] = selloption;
			result[1] = "";
		}
		System.out.println(result[0]);
		System.out.println(result[1]);
		System.out.println(selloption);
		return result;
	}
	public void setSelloption(String selloption) {
		this.selloption = selloption;
	}
	public String[] getSellweight() {
		String result[] = new String[2];
		if(sellweight.indexOf("kg") >= 0) {
			int index = sellweight.indexOf("kg");
			result[0] = sellweight.substring(0, index);
			result[1] = sellweight.substring(index);
			
		} else if(sellweight.indexOf("g") >= 0){
			int index = sellweight.indexOf("g");
			if(index == 0) {
				result[0] = "";
				result[1] = "g";
			}else {
				result[0] = sellweight.substring(0, index);
				result[1] = sellweight.substring(index);
			}
		} else {
			result[0] = sellweight;
			result[1] = "";
		}
		System.out.println(result[0]);
		System.out.println(result[1]);
		System.out.println(sellweight);
		
		return result;
	}
	public void setSellweight(String sellweight) {
		this.sellweight = sellweight;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public int getWrapping() {
		return wrapping;
	}
	public void setWrapping(int wrapping) {
		this.wrapping = wrapping;
	}
	public String getProductinformation() {
		return productinformation;
	}
	public void setProductinformation(String productinformation) {
		this.productinformation = productinformation;
	}
	public String getPrevention() {
		return prevention;
	}
	public void setPrevention(String prevention) {
		this.prevention = prevention;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	
	
	
	
}
