package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.All_productVO;
import vo.CartVO;
import vo.CategoryVO;
import vo.CpuViewVO;
import vo.MainEventVO;
import vo.ProductVO;

@Repository("product_dao")
public class ProductDAO {
	
	@Autowired
	SqlSession sqlSession;

	public int insert(ProductVO vo) {
		
		int res = sqlSession.insert("p.product_insert", vo);
		
		return res;
	}

	public List<MainEventVO> selectSaleList() {
		
		List<MainEventVO> list = sqlSession.selectList("p.saleList");
		
		return list;
	}

	public List<MainEventVO> selectMDList() {
		
		List<MainEventVO> list = sqlSession.selectList("p.mdList");
		
		return list;
	}

	public List<ProductVO> selectList(String pd_nm) {
		
		List<ProductVO> list = sqlSession.selectList("p.selectListByPd_nm", pd_nm);
		
		return list;
	}

	public List<CategoryVO> selectCategory() {
		
		List<CategoryVO> list = sqlSession.selectList("p.category");
		
		return list;
	}

	public List<All_productVO> selectListByCategory_cd(String category_cd) {
		
		List<All_productVO> list = sqlSession.selectList("p.selectListByCategory_cd", category_cd);
		
		return list;
	}

	public String select(String category_cd) {
		
		String name = sqlSession.selectOne("p.catename", category_cd);
		
		return name;
	}

	public int insertToCart(CartVO vo) {
		
		int res = sqlSession.insert("p.insertCart", vo);
		
		return res;
	}

	public List<CpuViewVO> selectCpuViewList(int user_idx) {
		
		List<CpuViewVO> list = sqlSession.selectList("p.CpuViewList", user_idx);
		
		return list;
	}

	public int insertToCart_noidx(CartVO vo) {
		
		int res = sqlSession.insert("p.insertCart_no", vo);
		
		return res;
	}

	public ProductVO selectOnetoPay(int pd_idx) {
		
		ProductVO vo = sqlSession.selectOne("p.payToSelect", pd_idx);
		
		return vo;
	}

	public int plusPdCnt(ProductVO pdvo) {
		
		int res = sqlSession.update("p.pdCntDown", pdvo);
		
		return res;
	}

	public List<All_productVO> selectListBykeyword(String keyword) {
		
		List<All_productVO> list = sqlSession.selectList("p.selectListByKeyword", keyword);
		
		return list;
	}

	public List<All_productVO> selectListByUp(String keyword) {
		
		List<All_productVO> list = sqlSession.selectList("p.selectListByUp", keyword);
		
		return list;
	}
	
	public List<All_productVO> selectListByDown(String keyword) {
		
		List<All_productVO> list = sqlSession.selectList("p.selectListByDown", keyword);
		
		return list;
	}
	
	public List<All_productVO> selectListByNew(String keyword) {
		
		List<All_productVO> list = sqlSession.selectList("p.selectListByNew", keyword);
		
		return list;
	}

	
	public ProductVO pdCntDownByPdidx(int pd_idx) {
		
		ProductVO vo = sqlSession.selectOne("p.pdCntDownByPdidx", pd_idx);
		
		return vo;
	}
	
	public int updateStatus(int pd_idx) {
		
		int res = sqlSession.update("p.updatePdStatus", pd_idx);
		
		return res;
	}

	
	
	
}
