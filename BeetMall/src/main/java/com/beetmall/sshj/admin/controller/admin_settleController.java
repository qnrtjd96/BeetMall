 package com.beetmall.sshj.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Admin_SettleService;
import com.beetmall.sshj.admin.vo.Admin_SettleVO;
import com.beetmall.sshj.seller.vo.SellerSettleVO;

@Controller
public class admin_settleController {
	
	@Autowired
	Admin_SettleService service;
	 
	
	@RequestMapping("/settleMng")
	public ModelAndView settleMng(HttpServletRequest req, Admin_SettleVO vo) {
		ModelAndView mav = new ModelAndView();
		
		Calendar sd = Calendar.getInstance();
		Calendar ed = Calendar.getInstance();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		DecimalFormat formatter = new DecimalFormat("###,###");
		sd.add(Calendar.MONTH, -3);
		
		if(vo.getStartDate() != null) {
			
		} else {
			String startDate =format.format(sd.getTime());
			String endDate = format.format(ed.getTime());
			
			vo.setStartDate(startDate);
			vo.setEndDate(endDate);
		}
		
		int result = service.getSettleLength(vo);
		
		vo.setTotalRecord(result);

		Admin_SettleVO moneyData = service.getSettleMoney();
		
		
		mav.addObject("adminMoney",formatter.format(moneyData.getAdminMoney()));
		mav.addObject("sellerMoney",formatter.format(moneyData.getSellerMoney()));
		mav.addObject("pageVO",vo);
		mav.addObject("result",service.getSettleList(vo));
		mav.setViewName("admin/settleMng");
		return mav;
	}
	
	@RequestMapping("/adminSettleUpdate")
	public ModelAndView adminSettleUpdate() {
		ModelAndView mav = new ModelAndView();
		
		service.settleUpdate();
		
		mav.setViewName("redirect:settleMng");
		
		return mav;
	}
	
	// 정산내역 엑셀다운로드
	@RequestMapping(value = "/Admin_settle_excelDown",method = RequestMethod.GET)
	@ResponseBody
	public void settle_excelDown(HttpServletRequest req, Admin_SettleVO vo) {
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		
		
		
		
		
		int i = 0;
		// 엑셀파일 생성
		XSSFWorkbook xssfwb =  new XSSFWorkbook();
			// 폰트설정
			XSSFFont font = xssfwb.createFont();
			font.setFontName("나눔고딕");
			font.setFontHeightInPoints((short)24);
			font.setBold(true);
			
			// 셀 스타일
			CellStyle style = xssfwb.createCellStyle();
			style.setFont(font);
			style.setFillForegroundColor(IndexedColors.LIME.getIndex());
			style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			style.setVerticalAlignment(VerticalAlignment.CENTER);
			style.setAlignment(HorizontalAlignment.CENTER);
		
		// 시트생성
		XSSFSheet xssfsheet = xssfwb.createSheet("BEETMALL 정산관리");
		

		// 데이터 엑셀 row 만들고 cell에 데이터 넣기
		List<Admin_SettleVO> list;

			// 컬럼 넓이 설정
			xssfsheet.setColumnWidth(0, 6000);
			xssfsheet.setColumnWidth(1, 6000);
			xssfsheet.setColumnWidth(2, 6000);
			xssfsheet.setColumnWidth(3, 6000);
			xssfsheet.setColumnWidth(4, 6000);
			xssfsheet.setColumnWidth(5, 6000);
			xssfsheet.setColumnWidth(6, 6000);
			xssfsheet.setColumnWidth(7, 6000);
			
			// 0 ~ 1행 : 2개 행,  0 ~ 5열 : 6개 까지 병합한다.
			xssfsheet.addMergedRegion(new CellRangeAddress(0,1,0,7));
			xssfsheet.autoSizeColumn(100);
			
			// 타이틀 생성
			XSSFRow xssfrow = xssfsheet.createRow(i++);
			XSSFCell xssfcell = xssfrow.createCell(0);
			xssfcell.setCellStyle(style);
			xssfcell.setCellValue("BEETMALL 관리자 정산내역");
			
			xssfsheet.createRow(i++);
			xssfrow = xssfsheet.createRow(i++); // 빈행 추가
				
				//테이블 폰트 설정
				XSSFFont tableFont = xssfwb.createFont();
				tableFont.setFontHeightInPoints((short)14);
				tableFont.setFontName("나눔고딕");
				
			// 테이블 스타일 설정
			CellStyle tableStyle = xssfwb.createCellStyle();
			XSSFDataFormat format = xssfwb.createDataFormat();
			tableStyle.setDataFormat(format.getFormat("#,##0"));
			tableStyle.setAlignment(HorizontalAlignment.CENTER);
			tableStyle.setFont(tableFont);
			tableStyle.setBorderBottom(BorderStyle.THIN);
			tableStyle.setBorderLeft(BorderStyle.THIN);
			tableStyle.setBorderRight(BorderStyle.THIN);
			tableStyle.setBorderTop(BorderStyle.THIN);
			
			
			xssfrow = xssfsheet.createRow(i++);


			
				xssfcell = xssfrow.createCell(0);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("구매번호");
				
				xssfcell = xssfrow.createCell(1);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("카테고리");
				
				xssfcell = xssfrow.createCell(2);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("주문현황");
				
				xssfcell = xssfrow.createCell(3);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("상품명");
				
				xssfcell = xssfrow.createCell(4);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("아이디");
				
				xssfcell = xssfrow.createCell(5);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("법인명");
				
				xssfcell = xssfrow.createCell(6);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("구매일");
				
				xssfcell = xssfrow.createCell(7);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("정산일");
				
				
				list = service.adminSettleExcel(vo);
				
				for(int index = 0; index < list.size(); index++) {
					xssfrow = xssfsheet.createRow(i++);// 한 행을 만든다.
					// 엑셀 데이터를 한 행에 8개씩 넣는다.
					Admin_SettleVO listData = list.get(index);
						
					xssfcell = xssfrow.createCell(0);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(listData.getOrdernum());
					
					xssfcell = xssfrow.createCell(1);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(listData.getMcatename());
					
					xssfcell = xssfrow.createCell(2);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(listData.getOrderstatus());
					
					xssfcell = xssfrow.createCell(3);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(listData.getProductname());
					
					xssfcell = xssfrow.createCell(4);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(listData.getUserid());
					
					xssfcell = xssfrow.createCell(5);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(listData.getStorename() );
					
					xssfcell = xssfrow.createCell(6);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(listData.getOrderconfirm() );
					
					xssfcell = xssfrow.createCell(7);
					xssfcell.setCellStyle(tableStyle);
					if(listData.getSettledate() !=null) {
						xssfcell.setCellValue(listData.getSettledate() );
					} else {
						xssfcell.setCellValue( "-" );
					}
				}
				
			
		
		String downloadFoler = System.getProperty("user.home")+"\\Downloads";
		File mk = new File(downloadFoler);
		mk.mkdirs();
		
		System.out.println("파일 다운로드 위치 ===>"+System.getProperty("user.home")+"\\Downloads\\BEETMALL 정산관리.xlsx");
		File file = new File(System.getProperty("user.home")+"\\Downloads\\BEETMALL 정산관리.xlsx");
		try {
			// file의 경로로 엑셀 outputStream
			FileOutputStream fos = new FileOutputStream(file);
			// 파일출력
			xssfwb.write(fos);
			fos.close();
			System.out.println("엑셀파일 생성 성공");
		} catch(Exception e) {
			System.out.println("엑셀파일 생성 오류");
			e.printStackTrace();
		}
		
	}
	
	
}