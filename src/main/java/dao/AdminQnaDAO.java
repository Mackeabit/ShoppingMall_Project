package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ProductVO;
import vo.QnaVO;
import vo.UserVO;

@Repository("admin_qna_dao")
public class AdminQnaDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<QnaVO> selectQna(){
		List<QnaVO> list = sqlSession.selectList("aq.qna_list");
		return list;
	}
	
	public ProductVO selectProductOne(int pd_idx) {
		ProductVO vo = sqlSession.selectOne("aq.product_one", pd_idx);
		return vo;
	}
	
	public UserVO selectUserOne(int user_idx) {
		UserVO vo = sqlSession.selectOne("aq.user_one", user_idx);
		return vo;
	}
	
	public QnaVO selectQnaOne(int qna_idx) {
		QnaVO vo = sqlSession.selectOne("aq.qna_one", qna_idx);
		return vo;
	}
	
	public int updateQna(QnaVO vo) {
		int res = sqlSession.update("aq.qna_res", vo);
		return res;
	}
	
	public int updateQna2(QnaVO vo) {
		int res = sqlSession.update("aq.qna_status", vo);
		return res;
	}
	
	public int deleteQna(int qna_idx) {
		int res = sqlSession.delete("aq.qna_delete", qna_idx);
		return res;
	}
	
	public List<QnaVO> selectQnaRes(){
		List<QnaVO> list = sqlSession.selectList("aq.qna_res_list");
		return list;
	}
	
	public List<QnaVO> selectQnaNotRes(){
		List<QnaVO> list = sqlSession.selectList("aq.qna_not_res_list");
		return list;
	}
}
