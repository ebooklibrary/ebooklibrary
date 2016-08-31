package com.ebooklibrary.app.mybooks.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
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
		
		
		
		
		try
		{
			//reader = new BufferedReader(new FileReader(file));
			
			char[] cbuf=new char[100];
			reader = new BufferedReader(new InputStreamReader(new FileInputStream(file),"euc-kr"));
			
			//int cnt = 0;
			//String str = "";
			byte [] dataArr = new byte[54];
			
			int key=0;
			//while(true)
			//cbuf=reader.read();
			str = reader.readLine();
			/*
			while(true)
		   {
			   str = reader.readLine();   //<-- 한행의 텍스트 데이터를 읽는다.
			   
			   if(str==null)
				   break;
			   logger.info("텍스트 테스트 str={}",str+"</br>");    //<--- 읽은 데이터를 모니터로 출력 한다.
			   bookmap.put(key++, str);
			   alist.add(str);
			   
		   }
			*/
			//alist.add(map);
		}catch(FileNotFoundException fnfe){
			logger.info("파일이 존재 하지 않습니다.");
		}catch(IOException ioe){
		 logger.info("파일을 읽을수 없습니다.");
		}finally{
			try 
			{
				reader.close();     //<---- 파일을 닫는다.
			}catch(Exception e){
				
			}
		 }
		
		
        logger.info("맵 사이즈 str={}", str);
		logger.info("맵 사이즈 bookmapsize={}", alist.size());
			//model.addAttribute("alist", bookmap);
			//model.addAttribute("alist", alist);
			//model.addAttribute("size", alist.size());
		model.addAttribute("str", str);
		
		return "mybooks/mybook";
	}
	
}
