package com.ebooklibrary.app.mybooks.controller;

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
		
		Map<Integer, String> bookmap= new HashMap<Integer, String>();
		
		//List<Map<Integer, String>> alist=new ArrayList<Map<Integer, String>>();
		List<String> alist=new ArrayList<String>();
		
		File file=new File("D:\\group5_finalproject\\ebooklibrary\\ebooklibrary\\src\\main\\webapp\\book_upload\\testText.txt");
		BufferedReader reader = null;
			try
			{
				reader = new BufferedReader(new FileReader(file));
				
				reader = new BufferedReader(new InputStreamReader(new FileInputStream(file),"euc-kr"));
				
				int key=0;
				
				while(true)
			   {
				   String str = reader.readLine();   //<-- 한행의 텍스트 데이터를 읽는다.
				   
				   if(str==null)
					   break;
				   logger.info("텍스트 테스트 str={}",str+"</br>");    //<--- 읽은 데이터를 모니터로 출력 한다.
				   /*bookmap.put(key++, str);*/
				   alist.add(str);
				   
			   }
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
		logger.info("맵 사이즈 bookmapsize={}", alist.size());
			//model.addAttribute("alist", bookmap);
			model.addAttribute("alist", alist);
			model.addAttribute("size", alist.size());
		
		return "mybooks/mybook";
	}
	
}
