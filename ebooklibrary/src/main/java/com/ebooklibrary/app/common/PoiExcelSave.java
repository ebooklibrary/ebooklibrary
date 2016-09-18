package com.ebooklibrary.app.common;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.ebooklibrary.app.member.model.MemberService;
import com.ebooklibrary.app.member.model.MemberVO;

@Component
public class PoiExcelSave {
	private HSSFRow row;
	private HSSFCell cell;
	private static final Logger logger=
			LoggerFactory.getLogger(PoiExcelSave.class);
	
	
	@Autowired
	private MemberService memberService;
	
	/* xlsx 파일 출력시 선언
	static XSSFRow row;
	static XSSFCell cell;
	*/
	
	public int excel(MemberSearchVO vo){
		
		HSSFWorkbook workbook = new HSSFWorkbook();
		//Sheet명 설정
		HSSFSheet sheet = workbook.createSheet("mySheet");
		
		/* xlsx 파일 출력시 선언
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet("mySheet");
		*/
		
		List<MemberVO> alist=memberService.selectMemberAll(vo);
		logger.info("회원정보 조회결과 alist={}",alist.size());
		
		//출력 row 생성
		row = sheet.createRow(0);
		//출력 cell 생성
		row.createCell(0).setCellValue("회원번호");
		row.createCell(1).setCellValue("아이디");
		row.createCell(2).setCellValue("회원이름");
		row.createCell(3).setCellValue("전화번호1");
		row.createCell(4).setCellValue("전화번호2");
		row.createCell(5).setCellValue("전화번호3");
		row.createCell(6).setCellValue("생일");
		row.createCell(7).setCellValue("성별");
		row.createCell(8).setCellValue("가입일");
		row.createCell(9).setCellValue("탈퇴일");
		row.createCell(10).setCellValue("북코인");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");	
		for(int i=0;i<alist.size();i++){
			MemberVO memberVo=alist.get(i);
			row=sheet.createRow(i+1);
			//출력 cell 생성
			row.createCell(0).setCellValue(memberVo.getMemberNo());
			row.createCell(1).setCellValue(memberVo.getUserId());
			row.createCell(2).setCellValue(memberVo.getUserName());
			row.createCell(3).setCellValue(memberVo.getHp1());
			row.createCell(4).setCellValue(memberVo.getHp2());
			row.createCell(5).setCellValue(memberVo.getHp3());
			row.createCell(6).setCellValue(memberVo.getBirth());
			row.createCell(7).setCellValue(memberVo.getGender());
			memberVo.getRegDate();
			row.createCell(8).setCellValue(sdf.format(memberVo.getRegDate()));
			if(memberVo.getOutDate()!=null){
				row.createCell(9).setCellValue(sdf.format(memberVo.getOutDate()));
			}			
			row.createCell(10).setCellValue(memberVo.getCash());			
		}
		/*//출력 row 생성
		row = sheet.createRow(0);
		//출력 cell 생성
		row.createCell(0).setCellValue("DATA 11");
		row.createCell(1).setCellValue("DATA 12");
		row.createCell(2).setCellValue("DATA 13");

		//출력 row 생성
		row = sheet.createRow(1);
		//출력 cell 생성
		row.createCell(0).setCellValue("DATA 21");
		row.createCell(1).setCellValue("DATA 22");
		row.createCell(2).setCellValue("DATA 23");

		row = sheet.createRow(2);
		//출력 cell 생성
		row.createCell(0).setCellValue("DATA 31");
		row.createCell(1).setCellValue("DATA 32");
		row.createCell(2).setCellValue("DATA 33");*/

		// 출력 파일 위치및 파일명 설정
		FileOutputStream outFile;
		int result=0;
		try {			
			outFile = new FileOutputStream("D:\\download\\MemberList.xls");
			workbook.write(outFile);
			outFile.close();
			result=1;
		} catch (Exception e) {
			e.printStackTrace();
			result=-1;
		}
		return result;
	}
}
