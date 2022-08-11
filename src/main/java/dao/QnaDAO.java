package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CartVO;
import vo.OrderVO;
import vo.ProductVO;
import vo.QnaVO;
import vo.ROviewVO;
import vo.ReviewVO;
import vo.UserVO;

@Repository("qna_dao")
public class QnaDAO {
	
	@Autowired
	SqlSession sqlSession;

	public int insertQna(QnaVO vo) {
		
		int res = sqlSession.insert("qna.qnaInsert", vo);
		
		return res;
	}

	public int delQna(int qna_idx) {
		
		int res = sqlSession.delete("qna.qnaDel", qna_idx);
		
		return res;
	}



	
	
	
	
}
