package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CartVO;
import vo.OrderVO;
import vo.ProductVO;
import vo.UserVO;

@Repository("cart_dao")
public class CartDAO {
	
	@Autowired
	SqlSession sqlSession;

	public int updateCNT(CartVO vo) {
		
		int res = sqlSession.update("c.cnt_update", vo);
		
		return res;
	}

	public List<CartVO> countCart(int user_idx) {
		
		List<CartVO> list = sqlSession.selectList("c.cnt_cart", user_idx);
		
		return list;
	}

	public int delCart(int cart_no) {
		
		int res = sqlSession.delete("c.del_cart", cart_no);
		
		return res;
	}

	public int myPageCnt(int user_idx) {
		
		int res = sqlSession.selectOne("c.myPageCnt", user_idx);
		
		return res;
	}

	public int delCartOne(int cart_idx) {
		
		int res = sqlSession.delete("c.delCartOne", cart_idx);
		
		return res;
	}

	public int delCartAll(int user_idx) {
		
		int res = sqlSession.delete("c.delCartAll", user_idx);
		
		return res;
	}
	
	
	
	
	
}
