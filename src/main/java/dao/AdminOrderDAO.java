package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.OrderVO;

@Repository("admin_order_dao")
public class AdminOrderDAO {
	@Autowired
	SqlSession sqlSession;
	
	//전체주문조회
	public List<OrderVO> selectList(){
		List<OrderVO> list = sqlSession.selectList("ao.order_list");
		return list;
	}
	
	//검색어에 따른 주문조회
	public List<OrderVO> selectUser(String word){
		List<OrderVO> list = sqlSession.selectList("ao.order_search_user", word);
		return list;
	}
		
	public List<OrderVO> selectPd(String word){
		List<OrderVO> list = sqlSession.selectList("ao.order_search_pd", word);
		return list;
	}
	
	//각 주문상태에 따른 리스트
	public List<OrderVO> selectOrderCancel(){
		List<OrderVO> list = sqlSession.selectList("ao.order_cancel_list");
		return list;
	}
	
	public List<OrderVO> selectOrderComplete(){
		List<OrderVO> list = sqlSession.selectList("ao.order_complete_list");
		return list;
	}
	
	public List<OrderVO> selectOrderPayComplete(){
		List<OrderVO> list = sqlSession.selectList("ao.order_pay_complete_list");
		return list;
	}
	
	public OrderVO selectOne(int od_idx) {
		OrderVO vo = sqlSession.selectOne("ao.order_one", od_idx);
		return vo;
	}
}
