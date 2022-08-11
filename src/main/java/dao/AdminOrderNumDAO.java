package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.OrderNumVO;

@Repository("order_num_dao")
public class AdminOrderNumDAO {
	@Autowired
	SqlSession sqlSession;
	
	public List<OrderNumVO> selectList(){
		List<OrderNumVO> list = sqlSession.selectList("on.order_num_list");
		return list;
	}
	
	public int selectSum() {
		int sum = sqlSession.selectOne("on.order_num_sum");
		return sum;
	}
	
	public int selectOrderPayComplete() {
		int sum = sqlSession.selectOne("on.order_pay_complete_sum");
		return sum;
	}
	
	public int selectOrderCancel() {
		int sum = sqlSession.selectOne("on.order_cancel_sum");
		return sum;
	}
	
	public int selectOrderComplete() {
		int sum = sqlSession.selectOne("on.order_complete_sum");
		return sum;
	}
}
