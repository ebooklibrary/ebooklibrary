package com.ebooklibrary.app.library.qna.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.ebooklibrary.app.common.MemberSearchVO;
import com.ebooklibrary.app.common.SearchVO;

@Repository
public class QnaBoardDAOMybatis extends SqlSessionDaoSupport implements QnaBoardDAO {
	
	private String namespace="config.mybatis.mapper.oracle.qnaboard";
	
	@Override
	public List<QnaBoardVO> selectQnaAll(MemberSearchVO searchVo) {
		List<QnaBoardVO> alist=getSqlSession().selectList(namespace+".selectQnaAll",searchVo);
		
		return alist;
	}

	@Override
	public int insertQnaBoard(QnaBoardVO qnaBoardVo) {
		return getSqlSession().insert(namespace+".insertQnaBoard", qnaBoardVo);
	}

	@Override
	public int selectQnaBoardByMemberNo(int memberNo) {
		return getSqlSession().selectOne(namespace+".selectBoardNoByMemberNo",memberNo);
	}
	
	@Override
	public QnaBoardVO selectByNo(int qnaNo) {
		return getSqlSession().selectOne(namespace+".selectByNo",qnaNo);
	}


	@Override
	public int qnaBoardEdit(QnaBoardVO qnaBoardVo) {
		return getSqlSession().update(namespace+".update_no",qnaBoardVo);
	}

	@Override
	public int qnaBoardDelete(int qnaNo) {
		
		return getSqlSession().delete(namespace+".deletebyQnaNo",qnaNo);
	}

	@Override
	public int selectListCount(MemberSearchVO searchVo) {
		
		return getSqlSession().selectOne(namespace+".selectTotalCount",searchVo);
				
	}

	@Override
	public int readCountAdd(int qnaNo) {
		return getSqlSession().update(namespace+".readCountAdd",qnaNo);
	}

	@Override
	public int prePageMove(int qnaNo) {
		return getSqlSession().selectOne(namespace+".prePage",qnaNo);
	}

	@Override
	public int nextPageMove(int qnaNo) {
		return getSqlSession().selectOne(namespace+".nextPage",qnaNo);
	}

	@Override
	public int maxQnaNo() {
		return getSqlSession().selectOne(namespace+".maxPage");
	}

	@Override
	public int minQnaNo() {
		return getSqlSession().selectOne(namespace+".minPage");
	}

	@Override
	public List<QnaBoardVO> selectByMemberNo(MemberSearchVO memVo) {
		return getSqlSession().selectList(namespace+".selectQnaBY", memVo);
	}

	@Override
	public int selectCountByMemNo(MemberSearchVO memberSVo) {
		System.out.println(memberSVo);
		return getSqlSession().selectOne(namespace+".selectCountByMemNo",memberSVo);
	}


	
	
	
}
