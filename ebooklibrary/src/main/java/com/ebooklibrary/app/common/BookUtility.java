package com.ebooklibrary.app.common;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public class BookUtility {
	
	public static final int FANTASY=101;	//판타지
	public static final int SCIENCEFICTION=102;	//공상 과학 소설
	public static final int HORROR=103;	//호러
	public static final int DRAMA=104;	//드라마
	public static final int ACTIONANDADVENTURE=105;	//액션 및 어드벤처
	public static final int ROMANCE=106;	//로맨스
	public static final int MYSTERY=107;	//미스터리
	public static final int SERIES=108;	//시리즈
	public static final int TRILOGY=109;	//트릴로지 3부작 책
	public static final int COMICS=110;	//코믹, 만화
	public static final int SATIRE=111;	//풍자
	public static final int BIOGRAPHIES=112;	//전기
	public static final int AUTOBIOGRAPHIES=113;	//자서전
	public static final int CHILDREN=114;	//아동도서
	public static final int DIARIES=115;	//일기형식책
	public static final int SELFHELP=116;	//자기계발서
	
	public static final int GUIDE=201;	//가이드
	public static final int TRAVEL=202;	//여행
	public static final int RELIGION=203;	//종교책
	public static final int PRAYERBOOKS=204;	//기도하는 책
	public static final int HISTORY=205;	//역사책
	public static final int MATH=206;	//수학책
	public static final int ANTHOLOGY=207;	//(시)선집, 문집
	public static final int POETRY=208;	//시집
	public static final int JOURNALS=209;	//저널, 학술지
	public static final int ENCYCLOPEDIAS=210;	//백과사전
	public static final int DICTIONARIES=211;	//사전
	public static final int SCIENCE=212;	//과학책
	public static final int ART=213;	//예술책
	public static final int COOKBOOKS=214;	//요리책
	public static final int HEALTH=215;	//헬스

	//책 번호로 책 장르 찾기
	public String getGenre(int genreNo){
		
		Map<Integer, String> hmap=new HashMap<Integer, String>();
		
		hmap.put(101, "판타지");
		hmap.put(102, "공상과학소설");
		hmap.put(103, "호러");
		hmap.put(104, "드라마");
		hmap.put(105, "액션및어드벤처");
		hmap.put(106, "로맨스");
		hmap.put(107, "미스터리");
		hmap.put(108, "시리즈");
		hmap.put(109, "트릴로지(3부작책)");
		hmap.put(110, "만화");
		hmap.put(111, "풍자");
		hmap.put(112, "전기");
		hmap.put(113, "자서전");
		hmap.put(114, "아동도서");
		hmap.put(115, "일기형식책");
		hmap.put(116, "자기계발서");
		
		hmap.put(201, "가이드");
		hmap.put(202, "여행");
		hmap.put(203, "종교책");
		hmap.put(204, "기도하는책");
		hmap.put(205, "역사책");
		hmap.put(206, "수학책");
		hmap.put(207, "시(선집),문집");
		hmap.put(208, "시집");
		hmap.put(209, "저널,학술지");
		hmap.put(210, "백과사전");
		hmap.put(211, "사전");
		hmap.put(212, "과학책");
		hmap.put(213, "예술책");
		hmap.put(214, "요리책");
		hmap.put(215, "헬스");
		
		//genreNo
		Iterator<Integer> iter= hmap.keySet().iterator();
		String bookGenre="";
		while(iter.hasNext()){
			int key=iter.next();
			String value=hmap.get(key);
			
			//System.out.println("key : "+key+"value : "+value);
			
			if (key==genreNo) {
				bookGenre=value;
			}
			
		}
		
/*
		BookUtility bu=new BookUtility();
		
		String bookGenre=bu.getGenre(105);
		logger.info("bookGenre={}",bookGenre);
*/
		
		return bookGenre;
	}
	
	
	public List<String> getBook(){
		//책 txt에서 읽어오기
				
		List<String> alist=new ArrayList<String>();
		//List<Character> alist=new ArrayList<Character>();
		String str = "";
		
		BufferedReader reader = null;
		File file=new File("C:\\Users\\User\\git\\ebooklibrary\\ebooklibrary\\src\\main\\webapp\\book_upload\\이드.txt");
		//File file=new File("C:\\ebook\\ebooklibrary\\ebooklibrary\\src\\main\\webapp\\book_upload\\이드.txt");
		FileInputStream fis=null;
		BufferedInputStream bis=null;
		InputStreamReader isr=null;
		
		int data1 =0;
		int totalCount=0;
		try {
			reader = new BufferedReader(new InputStreamReader(new FileInputStream(file),"euc-kr"));
			while((data1=reader.read())!=-1){
				totalCount++;
			}
			//logger.info("텍스트 테스트 totalCount={}",totalCount);
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try 
			{
				if(reader!=null)reader.close();     //<---- 파일을 닫는다.
				if(isr!=null)isr.close();
				if(fis!=null)fis.close();
			}catch(Exception e){
				
			}
		 }
		

		
		
		try
		{
			
			reader = new BufferedReader(new InputStreamReader(new FileInputStream(file),"euc-kr"));
			
			int data =0;
			int count=0;
			
			double scount=550;

			while((data=reader.read())!=-1){
				
				/* 
					enter => \r\n
					\r 코드값 => 13
					\n 코드값 => 10
					(data=reader.read())!=-1
				*/
				
				count++;
				totalCount--;
				if (count<=scount) {
					char c = (char)data;
					if (data!=13 && data!=10) {
						
						if (data>=33 && data<=255 && data==13 && data==10) {
							count--;
							totalCount++;
						}
						str+=c;
						
						
					}else if (data==13) {
						str+="<br>";
					}
					str=str.replaceAll("<br><br>", "<br>");
				}//if
				
				if (count==scount) {
					alist.add(str);
					count=0;
					str="";
				}
				if (totalCount<1) {
					
					alist.add(str);
					
					break;
				}//if
				
			}//while
					
		}catch(FileNotFoundException fnfe){
			fnfe.printStackTrace();
		}catch(IOException ioe){
			ioe.printStackTrace();
		}finally{
			try 
			{
				if(reader!=null)reader.close();     //<---- 파일을 닫는다.
				if(isr!=null)isr.close();
				if(fis!=null)fis.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		 }
				
		return alist;
	}//getbook
	
	public String toUtf(String str) { 
		String utf = ""; 
			try {
				utf = URLEncoder.encode(str , "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		return utf; 
	}
	
	
}//class
