package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CartVO;
import vo.OrderVO;
import vo.OrderViewVO;
import vo.PayVO;
import vo.ProductVO;
import vo.UserVO;

@Repository("order_dao")
public class OrderDAO {

	@Autowired
	SqlSession sqlSession;

	public int setOrder(OrderVO vo) {
		
		int res = sqlSession.insert("o.orderCreate", vo);
		
		return res;
	}

	public int myPayCnt(int user_idx) {
		
		int res = sqlSession.selectOne("o.myPayCnt", user_idx);
		
		return res;
	}

	public int myCancleCnt(int user_idx) {
		
		int res = sqlSession.selectOne("o.myCancleCnt", user_idx);
		
		return res;
	}

	public List<OrderViewVO> myPageOrderList(int user_idx) {
		
		List<OrderViewVO> list = sqlSession.selectList("o.myOrderList", user_idx);
		
		return list;
	}

	public int pdCntDown(OrderVO vo) {
		
		int res = sqlSession.update("o.pdCntDown", vo);
		
		return res;
	}

	public int setPay(PayVO payvo) {
		
		int res = sqlSession.insert("o.payInfo", payvo);
		
		return res;
	}

	public int updateStatus(int od_idx) {
		
		int res = sqlSession.update("o.od_statusChange", od_idx);
		
		return res;
	}

	public OrderVO selectOrder(int od_idx) {
		
		OrderVO vo = sqlSession.selectOne("o.selectOrder", od_idx);
		
		return vo;
	}

	public List<OrderViewVO> myPageCancleOrderList(int user_idx) {

		List<OrderViewVO> list = sqlSession.selectList("o.myCancleOrderList", user_idx);
		
		return list;
	}

	public void updateReview(HashMap<String,Integer> map) {
		sqlSession.update("o.reviewUpdate", map);
	}

	

}
