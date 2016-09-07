package com.ebooklibrary.app.common;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

public class BookUtility {
	
	
	
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
	
	
}//class
