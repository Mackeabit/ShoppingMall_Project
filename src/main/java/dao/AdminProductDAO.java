package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ProductVO;

@Repository("admin_product_dao")
public class AdminProductDAO {
	@Autowired
	SqlSession sqlSession;
	
	//페이지별 게시글 조회
	public List<ProductVO> selectList(){
		List<ProductVO> list = sqlSession.selectList("ap.product_list");
		return list;
	}
	
	public List<ProductVO> selectName(String word){
		List<ProductVO> list = sqlSession.selectList("ap.product_search_name", word);
		return list;
	}
	
	public List<ProductVO> selectCode(int num){
		List<ProductVO> list = sqlSession.selectList("ap.product_search_code", num);
		return list;
	}
	
	public int product_insert(ProductVO vo) {
		int res = sqlSession.insert("ap.product_insert", vo);
		return res;
	}
	
	public ProductVO selectOne(int idx) {
		ProductVO vo = sqlSession.selectOne("ap.product_view", idx);
		return vo;
	}

	public int imageModify(ProductVO vo) {
		int res = sqlSession.update("ap.image_modify", vo);
		return res;
	}
	
	public int imageModify1(ProductVO vo) {
		int res = sqlSession.update("ap.image_modify1", vo);
		return res;
	}
	
	public int imageModify2(ProductVO vo) {
		int res = sqlSession.update("ap.image_modify2", vo);
		return res;
	}
	
	public int updateStatus(ProductVO vo) {
		int res = sqlSession.update("ap.update_status", vo);
		return res;
	}
	
	public int updateStatus2(int pd_idx) {
		int res = sqlSession.update("ap.update_status2", pd_idx);
		return res;
	}
	
	public int updateStatus3(int pd_idx) {
		int res = sqlSession.update("ap.update_status3", pd_idx);
		return res;
	}
	
	public int updateCost(ProductVO vo) {
		int res = sqlSession.update("ap.update_cost", vo);
		return res;
	}
	
	public int updatePrice(ProductVO vo) {
		int res = sqlSession.update("ap.update_price", vo);
		return res;
	}
	
	public int updateCnt(ProductVO vo) {
		int res = sqlSession.update("ap.update_cnt", vo);
		return res;
	}
	
	public int updateEx(ProductVO vo) {
		int res = sqlSession.update("ap.update_ex", vo);
		return res;
	}
	
	public int updateNm(ProductVO vo) {
		int res = sqlSession.update("ap.update_nm", vo);
		return res;
	}
	
	public List<ProductVO> selectProduct(String pd_nm) {
		List<ProductVO> list = sqlSession.selectList("ap.select_product", pd_nm);
		return list;
	}
}
