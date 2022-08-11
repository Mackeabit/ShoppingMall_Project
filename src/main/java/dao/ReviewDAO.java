package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CartVO;
import vo.OrderVO;
import vo.PdreviewVO;
import vo.ProductVO;
import vo.ROviewVO;
import vo.ReviewVO;
import vo.UserVO;

@Repository("review_dao")
public class ReviewDAO {
	
	@Autowired
	SqlSession sqlSession;

	public int insertReview(ReviewVO vo) {
		
		int res = sqlSession.insert("r.reviewInsert", vo);
		
		return res;
	}

	public int delReview(int rv_idx) {
		
		int res = sqlSession.delete("r.reviewDel", rv_idx);
		
		return res;
	}




	
	
	
	
}
