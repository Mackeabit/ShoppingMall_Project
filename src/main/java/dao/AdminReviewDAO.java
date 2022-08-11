package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ProductVO;
import vo.ReviewVO;
import vo.ReviewVO2;
import vo.ReviewVO3;
import vo.UserVO;


@Repository("admin_review_dao")
public class AdminReviewDAO {
	@Autowired
	SqlSession sqlSession;
	
	public List<ReviewVO> selectReview(){
		List<ReviewVO> list = sqlSession.selectList("ar.review_list");
		return list;
	}
	
	public ProductVO selectProductOne(int pd_idx) {
		ProductVO vo = sqlSession.selectOne("ar.product_one", pd_idx);
		return vo;
	}
	
	public List<ReviewVO3> selectReviewA(){
		List<ReviewVO3> list = sqlSession.selectList("ar.review_listA");
		return list;
	}
	public List<ReviewVO3> selectReviewB(){
		List<ReviewVO3> list = sqlSession.selectList("ar.review_listB");
		return list;
	}
	public List<ReviewVO3> selectReviewC(){
		List<ReviewVO3> list = sqlSession.selectList("ar.review_listC");
		return list;
	}
	public List<ReviewVO3> selectReviewD(){
		List<ReviewVO3> list = sqlSession.selectList("ar.review_listD");
		return list;
	}
	
	public ReviewVO selectReviewOne(int rv_idx){
		ReviewVO vo = sqlSession.selectOne("ar.review_one", rv_idx);
		return vo;
	}
	
	public UserVO selectUserOne(int user_idx) {
		UserVO vo = sqlSession.selectOne("ar.user_one", user_idx);
		return vo;
	}
	
	public List<ReviewVO> selectReview3(int pd_idx){
		List<ReviewVO> list = sqlSession.selectList("ar.review_list3", pd_idx);
		return list;
	}
	
	public List<ProductVO> selectProduct(String pd_nm){
		List<ProductVO> list = sqlSession.selectList("ar.product_list", pd_nm);
		return list;
	}
	public List<ReviewVO2> selectReview2(){
		List<ReviewVO2> list = sqlSession.selectList("ar.review_list2");
		return list;
	}
	
	public int deleteReview(int rv_idx) {
		int res = sqlSession.delete("ar.delete_review", rv_idx);
		return res;
	}
}
