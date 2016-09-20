package com.ebooklibrary.app.library.qna.comments.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ebooklibrary.app.library.qna.comments.model.QnaCommentService;
import com.ebooklibrary.app.library.qna.comments.model.QnaCommentVO;

@Controller
@RequestMapping("/comments")
public class QnaCommentController {
	
	private static final Logger logger
	=LoggerFactory.getLogger(QnaCommentController.class);
	
	@Autowired
	private QnaCommentService qnaCommentsService;
	
	
	@RequestMapping("/commentList.do")
	public String listQnaComment(@RequestParam int qnaNo,Model model){
		logger.info("코멘트 list 페이지 파라미터값 qnaNo={}",qnaNo);

		//1.
		List<QnaCommentVO> alist = qnaCommentsService.selectAllQnaComment(qnaNo);
		for(int i=0 ;i<alist.size();i++){
			
			logger.info(alist.get(i).getSelectCmt());
		}
		
		//2.
		
		model.addAttribute("commentList",alist);
		//3.
		
		
		return "library/comments/commentList";
	}
	
	
	@RequestMapping("/commentWrite.do")
	public String writeQnaComment(@ModelAttribute QnaCommentVO qnaCommentVo){
		//1.
		logger.info("코멘트 처리페이지 파라미터 값 qnaCommentVo={}",qnaCommentVo);
		
		//2.
		int cnt= 0;
		if(qnaCommentVo.getStepNo()>0){
			cnt= qnaCommentsService.insertQnaReComment(qnaCommentVo);
			logger.info("댓글의 댓글 코맨트 입력 처리 값 cnt={}",cnt);
		}else{
			
			cnt =qnaCommentsService.insertQnaComment(qnaCommentVo);
			logger.info("기본댓글 코맨트 입력 처리 값 cnt={}",cnt);
		}
		
		
		//3.
		return "redirect:/library/qna/qnaDetail.do?qnaNo="+qnaCommentVo.getQnaNo();
	}
	
	@RequestMapping("/commentEdit.do")
	public String editComment(@ModelAttribute QnaCommentVO qnaCommentVo){
		//1.
		logger.info("comment Edit처리페이지 입력값 qnaCommentVo={}",qnaCommentVo);
		
		//2.
		int cnt= qnaCommentsService.updateComment(qnaCommentVo);
		logger.info("comment edit 처리 결과값 cnt={}",cnt);
		
		//3.
		
		
		return "redirect:/library/qna/qnaDetail.do?qnaNo="+qnaCommentVo.getQnaNo();
	}
	
	@RequestMapping("/commentDelete.do")
	public String deleteComment(@ModelAttribute QnaCommentVO qnaCommentVo){
		//1.
		logger.info("comment 삭제 처리페이지 입력 파라미터값 qnaCommentVo={}",qnaCommentVo);
		
		//2.
		int cnt = qnaCommentsService.deleteComment(qnaCommentVo);
		logger.info("삭제 컨트롤러 처리 결과값 cnt={}",cnt);
		
		//3.
		
		return "redirect:/library/qna/qnaDetail.do?qnaNo="+qnaCommentVo.getQnaNo();
	}
	
}
