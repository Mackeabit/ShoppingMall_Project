package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CancleVO;
import vo.OrderVO;
import vo.PayVO;

@Repository("pay_dao")
public class PayDAO {

	@Autowired
	SqlSession sqlSession;

	public void canclePay(CancleVO canclevo) {
		sqlSession.insert("pay.cancle", canclevo);
	}

	public PayVO selectPay(String od_mi) {
		
		PayVO vo = sqlSession.selectOne("pay.selectPay", od_mi);
		
		return vo;
	}

	public int updateCanclePay(OrderVO odvo) {
		
		int res = sqlSession.update("pay.updateCancle", odvo);
		
		return res;
	}

	public int updateAllCanclePay(OrderVO odvo) {
		
		int res = sqlSession.update("pay.updateAllCancle", odvo);
		
		return res;
	}
	
}
