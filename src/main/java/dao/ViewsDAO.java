package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CartVO;
import vo.OrderVO;
import vo.OrderViewVO;
import vo.PdQnaViewVO;
import vo.PdreviewVO;
import vo.ProductVO;
import vo.QnaVO;
import vo.QnaViewVO;
import vo.ROviewVO;
import vo.UserVO;

@Repository("views_dao")
public class ViewsDAO {
	
	@Autowired
	SqlSession sqlSession;

	public List<QnaViewVO> selectQnaView(int user_idx) {
		
		List<QnaViewVO> list = sqlSession.selectList("views.QnaViewList", user_idx);
		
		return list;
	}

	public List<OrderViewVO> selectOVview(OrderViewVO ovVO) {
		
		List<OrderViewVO> list = sqlSession.selectList("views.OrderViewListByProduct", ovVO);
		
		return list;
	}

	public List<PdQnaViewVO> selectPdQnaView(int user_idx) {
		
		List<PdQnaViewVO> list = sqlSession.selectList("views.PdQnaViewListByUser", user_idx);
		
		return list;
	}

	public List<PdQnaViewVO> qnaListByqna(String pd_nm) {
		
		List<PdQnaViewVO> list = sqlSession.selectList("views.qnaList", pd_nm);
		
		return list;
	}
	
	public List<PdreviewVO> reviewListByReview(String pd_nm) {
		
		List<PdreviewVO> list = sqlSession.selectList("views.reviewList", pd_nm);
		
		return list;
	}

	public PdreviewVO selectReviewOne(int rv_idx) {
		
		PdreviewVO vo = sqlSession.selectOne("views.reviewOne", rv_idx);
		
		return vo;
	}

	public PdQnaViewVO selectOnepdQna(int qna_idx) {
		
		PdQnaViewVO vo = sqlSession.selectOne("views.pdqnaOne", qna_idx);
		
		return vo;
	}
	
	public List<QnaViewVO> selectQnaViewByMain(int user_idx) {
		
		List<QnaViewVO> list = sqlSession.selectList("views.QnaViewListWithMain", user_idx);
		
		return list;
	}
	
	public List<OrderViewVO> myPageOrderListByMain(int user_idx) {
		
		List<OrderViewVO> list = sqlSession.selectList("views.OrderViewListByMain", user_idx);
		
		return list;
	}
	
	public List<OrderViewVO> myPageOrderListByMain2(int user_idx) {
		
		List<OrderViewVO> list = sqlSession.selectList("views.OrderViewListByMain2", user_idx);
		
		return list;
	}
	
}
