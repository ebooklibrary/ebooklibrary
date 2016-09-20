package com.ebooklibrary.app.library.qna.comments.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.ebooklibrary.app.common.MemberSearchVO;

@Repository
public class QnaCommentDAOMybatis extends SqlSessionDaoSupport implements QnaCommentDAO {
	
	
	private String namespace="config.mybatis.mapper.oracle.qnacomments";
	
	
	@Override
	public int insertQnaComment(QnaCommentVO qcVo) {
		return getSqlSession().insert(namespace+".insertComment",qcVo);
	}
	
	@Override
	public int maxSortNo(QnaCommentVO qcVo) {
		return getSqlSession().selectOne(namespace+".maxSortNoBygroupNo",qcVo);
	}
	
	

	@Override
	public List<QnaCommentVO> selectAllQnaComment(int qnaNo) {
		return getSqlSession().selectList(namespace+".selectAllComment",qnaNo);
	}

	@Override
	public int insertQnaReComment(QnaCommentVO qcVo) {
		return getSqlSession().insert(namespace+".commentReply",qcVo);
	}

	@Override
	public int updateSortNo(QnaCommentVO qcVo) {
		
		return  getSqlSession().update(namespace+".updateSortNo",qcVo);
	}

	@Override
	public int countQnaComment(int qnaNo) {
		return getSqlSession().selectOne(namespace+".CountCommentByQna",qnaNo);
	}

	@Override
	public int selectedComment(int commentNo) {
		return getSqlSession().update(namespace+".selectedComment",commentNo);
				
	}

	@Override
	public int updateComment(QnaCommentVO qcVo) {
		return getSqlSession().update(namespace+".updateComment",qcVo);
	}

	@Override
	public int deleteComment(int commentNo) {
		return getSqlSession().delete(namespace+".deleteComment",commentNo);
				
	}

	@Override
	public int countCmtGroupNo(int cmtGroupNo) {
		return getSqlSession().selectOne(namespace+".countGroupNo",cmtGroupNo);
	}
	
	@Override
	public int countCmtGroupNoY(int cmtGroupNo) {
		
		return getSqlSession().selectOne(namespace+".countGroupNoY",cmtGroupNo);
	}

	

	@Override
	public int holdingDeleteCmt(int cmtGroupNo) {
		return getSqlSession().update(namespace+".holdingDeleteCmt",cmtGroupNo);
	}

	@Override
	public int deleteGroupNo(int commentNo) {
		return getSqlSession().delete(namespace+".deleteGroupNo",commentNo);
	}




	
}
