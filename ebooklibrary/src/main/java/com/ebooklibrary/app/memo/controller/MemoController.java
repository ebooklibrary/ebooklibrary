package com.ebooklibrary.app.memo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebooklibrary.app.memo.model.MemoService;

@Controller
@RequestMapping("/library/memo")
public class MemoController {
	private static final Logger logger=
			LoggerFactory.getLogger(MemoController.class);
	
	@Autowired
	private MemoService memoService;
	
	@RequestMapping("/NewMemoCount")
	@ResponseBody
	public int newMemoCount(@RequestParam String userId){
		return memoService.memoCount(userId);
	}
	
}
