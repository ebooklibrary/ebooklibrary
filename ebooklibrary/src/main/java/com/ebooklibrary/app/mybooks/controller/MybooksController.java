package com.ebooklibrary.app.mybooks.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mybooks")
public class MybooksController {
	
	private static final Logger logger=LoggerFactory.getLogger(MybooksController.class);
	
	@RequestMapping("/mybookmain.do")
	public String mybooksMain(){
		return "mybooks/mybookmain";
	}
	
	@RequestMapping("/mybook.do")
	public String bookletTest(Model model){
		
		/*
		fis = new FileInputStream("text/poetry3.txt");
        bis = new BufferedInputStream(fis);
        
        fos = new FileOutputStream("text/poetry3.bak");
        bos = new BufferedOutputStream(fos);
        
        int data = 0;
        while((data=bis.read())!=-1){
           bos.write(data);
        }
        int cnt = 0;
        String str = "";
        byte [] dataArr = new byte[4];
        while((cnt=bis.read(dataArr))!=-1){
           for(int i=0;i<cnt;i++){
              str += (char)dataArr[i];
           }
           break;
        }
		*/
		
		Map<Integer, String> bookmap= new HashMap<Integer, String>();
		
		//List<Map<Integer, String>> alist=new ArrayList<Map<Integer, String>>();
		List<String> alist=new ArrayList<String>();
		//List<Character> alist=new ArrayList<Character>();
		int cnt = 0;
		String str = "";
		
		BufferedReader reader = null;
		File file=new File("D:\\group5_finalproject\\ebooklibrary\\ebooklibrary\\src\\main\\webapp\\book_upload\\testText.txt");
		FileInputStream fis=null;
		BufferedInputStream bis=null;
		InputStreamReader isr=null;
		
		
		Properties props=System.getProperties();
		props.get("sun.jnu.encoding");
		
		/*
		
		try {
			fis = new FileInputStream("D:\\group5_finalproject\\ebooklibrary\\ebooklibrary\\src\\main\\webapp\\book_upload\\testText.txt");
			bis = new BufferedInputStream(fis);
			//isr=new InputStreamReader(bis);
			//isr.getEncoding();
			
			
			//char[] cbuf=new char[100];
			byte [] dataArr = new byte[100];
			while((cnt=bis.read(dataArr))!=-1){
				for(int i=0;i<cnt;i++){
					str += (char)dataArr[i];
				}
				//alist.add(str);
				break;
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
        bis = new BufferedInputStream(fis);
        
        int data = 0;
        while((data=bis.read())!=-1){
           bos.write(data);
        }
        
		*/
		
		int data1 =0;
		int totalCount=0;
		try {
			reader = new BufferedReader(new InputStreamReader(new FileInputStream(file),"euc-kr"));
			while((data1=reader.read())!=-1){
				totalCount++;
			}
			logger.info("텍스트 테스트 totalCount={}",totalCount);
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
			//reader = new BufferedReader(new FileReader(file));
			
			reader = new BufferedReader(new InputStreamReader(new FileInputStream(file),"euc-kr"));
			
			//int cnt = 0;
			//String str = "";
			
			//while(true)
			//cbuf=reader.read();
			//str = reader.readLine();
			int data =0;
			int count=0;
			
			double scount=550;
			double a=Math.round(totalCount/scount);
			//totalCount%=scount;
			logger.info("a 테스트={}",a);
			int ab=(int)a;
			/*
			for (int i = 0; i < a; i++) {
			
				while((data=reader.read())!=-1){
					
					 * enter => \r\n
					 * \r 코드값 => 13
					 * \n 코드값 => 10
					 * (data=reader.read())!=-1
					 
					
					count++;
					if (count<=scount) {
						char c = (char)data;
						if (data!=13 && data!=10) {
							str+=c;
						}else if (data==13) {
							str+="<br>";
						}
					}//if
					
					if (count==scount) {
						alist.add(str);
						count=0;
					}//if
					
					
				}//while
				
			}//for
			*/
			
				
				
				//for (int i = 0; i < ab; i++) {
					/*
					data=reader.read();
					char c = (char)data;
					if (data!=13 && data!=10) {
						str+=c;
					}else if (data==13) {
						str+="<br>";
					}
					alist.add(str);
					*/
			logger.info("텍스트 테스트2 totalCount={}",totalCount);
			int key=1;
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
							//logger.info("count={},scount={}",count,scount);
							alist.add(str);
							//bookmap.put(key++, str);
							count=0;
							str="";
						}
						//logger.info("count={}, totalCount={}",count,totalCount);
						if (totalCount<1) {
							
							//logger.info("count={}, totalCount={}",count,totalCount);
							alist.add(str);
							
							//bookmap.put(key++, str);
							break;
						}//if
						
					}//while
					//logger.info("alist={},",alist);
					//logger.info("bookmap={},",bookmap);
					
				//}//for
				
				
				//logger.info("alist.size()={}", alist.size());
				logger.info("bookmap.size()={}", bookmap.size());
				
								
			//logger.info("텍스트 테스트 count={}",count);
			//alist.add(map);
		}catch(FileNotFoundException fnfe){
			logger.info("파일이 존재 하지 않습니다.");
		}catch(IOException ioe){
		 logger.info("파일을 읽을수 없습니다.");
		}finally{
			try 
			{
				if(reader!=null)reader.close();     //<---- 파일을 닫는다.
				if(isr!=null)isr.close();
				if(fis!=null)fis.close();
			}catch(Exception e){
				
			}
		 }
		
		
        logger.info("str={}", str);
        //logger.info("alist={}", alist);
		//logger.info("맵 사이즈 bookmapsize={}", alist.size());
			//model.addAttribute("alist", bookmap);
			//model.addAttribute("size", alist.size());
        
        
        model.addAttribute("alist", alist);
		//model.addAttribute("str", str);
		
		return "mybooks/mybook";
	}
	
}
